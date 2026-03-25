import os
import requests
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Optional

app = FastAPI(title="非遗AI分析服务", version="1.0.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

SILICONFLOW_API_KEY = os.getenv("SILICONFLOW_API_KEY", "sk-fbdysuurjlhebjlennlxpcyqisiqskexbcftzlhpeqqpilpy")
BACKEND_URL = "http://localhost:8081/api"

class AnalysisRequest(BaseModel):
    type: str
    provinceId: Optional[int] = None
    categoryId: Optional[int] = None
    question: Optional[str] = None

def get_heritage_stats():
    try:
        r = requests.get(f"{BACKEND_URL}/statistics/national", timeout=5)
        return r.json().get("data", {}) if r.status_code == 200 else {}
    except:
        return {}

def get_province_heritage(province_id: int):
    try:
        r = requests.get(f"{BACKEND_URL}/heritage/list?provinceId={province_id}", timeout=5)
        return r.json().get("data", []) if r.status_code == 200 else []
    except:
        return []

def get_category_heritage(category_id: int):
    try:
        r = requests.get(f"{BACKEND_URL}/heritage/list?categoryId={category_id}", timeout=5)
        return r.json().get("data", []) if r.status_code == 200 else []
    except:
        return []

def get_provinces():
    try:
        r = requests.get(f"{BACKEND_URL}/province/all", timeout=5)
        return r.json().get("data", []) if r.status_code == 200 else []
    except:
        return []

def get_categories():
    try:
        r = requests.get(f"{BACKEND_URL}/category/all", timeout=5)
        return r.json().get("data", []) if r.status_code == 200 else []
    except:
        return []

def get_category_name(category_id: int):
    cats = get_categories()
    for c in cats:
        if c.get('id') == category_id:
            return c.get('name', '')
    return ''

def get_province_name(province_id: int):
    provinces = get_provinces()
    for p in provinces:
        if p.get('id') == province_id:
            return p.get('provinceName', '')
    return ''

def analyze_with_ai(prompt: str) -> str:
    try:
        url = "https://api.siliconflow.cn/v1/chat/completions"
        headers = {
            "Content-Type": "application/json",
            "Authorization": f"Bearer {SILICONFLOW_API_KEY}"
        }
        data = {
            "model": "Qwen/Qwen2.5-7B-Instruct",
            "messages": [{"role": "user", "content": prompt}],
            "max_tokens": 1024,
            "temperature": 0.7
        }
        response = requests.post(url, json=data, headers=headers, timeout=60)
        
        if response.status_code == 200:
            result = response.json()
            if "choices" in result and len(result["choices"]) > 0:
                return result["choices"][0]["message"]["content"]
            return f"API返回格式错误: {response.text[:200]}"
        return f"API错误 {response.status_code}: {response.text[:300]}"
    except Exception as e:
        return f"连接AI服务失败: {str(e)}"

def get_fallback_analysis(analysis_type: str, **kwargs) -> str:
    stats = get_heritage_stats()
    
    if analysis_type == "overall":
        total = stats.get('totalCount', 0)
        national = stats.get('nationalCount', 0)
        inheritors = stats.get('inheritorCount', 0)
        unesco = stats.get('unescoCount', 0)
        return f"""📊 中国非物质文化遗产整体分析报告

【数据概览】
• 全国非遗项目总数：{total} 项
• 国家级非遗项目：{national} 项  
• 传承人数量：{inheritors} 人
• 联合国非遗项目：{unesco} 项

【类型分布】
全国非遗涵盖十大类别：民间文学、传统音乐、传统舞蹈、传统戏剧、曲艺、传统体育游艺与杂技、传统美术、传统技艺、传统医药、民俗。

【保护现状】
中国已建立起国家、省、市、县四级非遗保护名录体系。近年来，各地积极推进非遗数字化保护工程建设。

【发展建议】
1. 深化文旅融合，打造非遗体验游线路
2. 加强非遗进校园，培养青少年兴趣
3. 利用新媒体传播，扩大非遗影响力
4. 完善传承人认定与扶持机制"""

    elif analysis_type == "province":
        province_name = kwargs.get('province_name', '该省')
        heritages = kwargs.get('heritages', [])
        count = len(heritages)
        names = [h.get('name', '') for h in heritages[:8]]
        
        return f"""📍 {province_name}非遗特色分析

【数据概览】
• {province_name}非遗项目数量：{count} 项

【代表性项目】
{chr(10).join([f"• {n}" for n in names]) if names else "暂无数据"}

【特色亮点】
{province_name}非遗资源丰富，涵盖了多个非遗类别，体现了当地深厚的文化底蕴。

【发展建议】
1. 深入挖掘地方特色非遗项目
2. 建立非遗展示体验基地
3. 推进非遗与特色产业融合
4. 加强区域非遗保护合作"""

    elif analysis_type == "type":
        category_name = kwargs.get('category_name', '该类')
        heritages = kwargs.get('heritages', [])
        count = len( heritages)
        names = [h.get('name', '') for h in heritages[:8]]
        
        return f"""📂 {category_name}类非遗分析

【数据概览】
• 全国{category_name}类非遗项目：{count} 项

【代表性项目】
{chr(10).join([f"• {n}" for n in names]) if names else "暂无数据"}

【传承特点】
{category_name}类非遗具有悠久的历史传统，在全国各地都有分布，体现了中华文化的多样性。

【保护建议】
1. 加强技艺传承人才培养
2. 推动传统工艺振兴计划
3. 开展抢救性记录保护
4. 促进传统技艺创新发展"""

    else:
        question = kwargs.get('question', '')
        return f"""💬 关于您的问题："{question}"

【平台数据参考】
• 全国非遗总数：{stats.get('totalCount', 0)} 项
• 国家级非遗：{stats.get('nationalCount', 0)} 项

您可以通过以下方式获取更多信息：
1. 访问"数据统计"页面查看详细数据
2. 浏览"非遗名录"了解具体项目
3. 咨询当地文化部门"""

@app.get("/")
def root():
    return {"message": "非遗AI分析服务", "version": "1.0.0"}

@app.post("/api/ai-analysis/overall")
def overall_analysis():
    stats = get_heritage_stats()
    
    prompt = f"""你是一个中国非物质文化遗产专家。请分析中国非物质文化遗产的整体状况：
    - 全国非遗项目总数：{stats.get('totalCount', 0)}
    - 国家级非遗数量：{stats.get('nationalCount', 0)}
    - 传承人数量：{stats.get('inheritorCount', 0)}
    - 联合国非遗项目：{stats.get('unescoCount', 0)}
    
    请给出非遗类型分布、省份差异、发展趋势和保护建议的专业分析。请用中文回答。"""
    
    result = analyze_with_ai(prompt)
    
    if "AI_ERROR" in result or "API返回" in result:
        result = get_fallback_analysis("overall")
    
    return {"code": 200, "message": "success", "data": result}

@app.post("/api/ai-analysis/province")
def province_analysis(req: AnalysisRequest):
    if not req.provinceId:
        raise HTTPException(status_code=400, message="缺少省份ID")
    
    heritages = get_province_heritage(req.provinceId)
    province_name = get_province_name(req.provinceId)
    
    prompt = f"""你是一个中国非物质文化遗产专家。请分析{province_name}的非遗特色：
    - 该省非遗项目数量：{len(heritages)}
    - 项目列表：{[h.get('name') for h in heritages[:10]]}
    
    请给出该省非遗特色亮点、类型优势、传承现状和文旅融合建议。请用中文回答。"""
    
    result = analyze_with_ai(prompt)
    
    if "AI_ERROR" in result or "API返回" in result:
        result = get_fallback_analysis("province", province_name=province_name, heritages=heritages)
    
    return {"code": 200, "message": "success", "data": result}

@app.post("/api/ai-analysis/type")
def type_analysis(req: AnalysisRequest):
    if not req.categoryId:
        raise HTTPException(status_code=400, message="缺少分类ID")
    
    heritages = get_category_heritage(req.categoryId)
    category_name = get_category_name(req.categoryId)
    
    prompt = f"""你是一个中国非物质文化遗产专家。请分析{category_name}类非遗的全国分布情况：
    - 全国该类型非遗数量：{len(heritages)}
    - 部分项目：{[h.get('name') for h in heritages[:10]]}
    
    请给出该类型非遗的传承难点、发展趋势预测。请用中文回答。"""
    
    result = analyze_with_ai(prompt)
    
    if "AI_ERROR" in result or "API返回" in result:
        result = get_fallback_analysis("type", category_name=category_name, heritages=heritages)
    
    return {"code": 200, "message": "success", "data": result}

@app.post("/api/ai-analysis/custom")
def custom_analysis(req: AnalysisRequest):
    if not req.question:
        raise HTTPException(status_code=400, message="问题不能为空")
    
    stats = get_heritage_stats()
    
    prompt = f"""你是一个中国非物质文化遗产专家。请回答以下问题：
    问题：{req.question}
    
    参考数据：全国共有{stats.get('totalCount', 0)}项非遗项目，{stats.get('nationalCount', 0)}项国家级非遗。
    
    请结合平台数据给出专业回答。请用中文回答。"""
    
    result = analyze_with_ai(prompt)
    
    if "AI_ERROR" in result or "API返回" in result:
        result = get_fallback_analysis("custom", question=req.question)
    
    return {"code": 200, "message": "success", "data": result}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
