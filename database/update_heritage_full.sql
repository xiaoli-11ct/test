USE `java`;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE heritage;

INSERT INTO `heritage` (`name`, `province_id`, `category_id`, `level`, `intro`, `description`, `declaration_year`, `code`, `inheritor`, `img_url`, `video_url`) VALUES
('梁祝传说', 11, 1, '国家级', '梁山伯与祝英台的爱情故事，是中国四大民间传说之一', '梁祝传说讲述了梁山伯与祝英台相识于书院，相知相恋。', 2006, '01-I-1', '集体传承', '/img/梁祝传说.jpeg', 'https://www.bilibili.com/video/BV1fF411i7eM/'),
('白蛇传传说', 10, 1, '国家级', '白蛇与许仙的爱情神话故事', '白蛇传是中国四大民间传说之一。', 2006, '01-I-2', '集体传承', '/img/白蛇传传说.jpeg', 'https://www.bilibili.com/video/BV1wPyABWEHE/'),
('孟姜女传说', 27, 1, '国家级', '孟姜女哭长城的传说故事', '孟姜女传说讲述了在秦朝时期的故事。', 2006, '01-I-3', '集体传承', '/img/孟姜女传说.webp', 'https://www.bilibili.com/video/BV11w411s776/'),
('牛郎织女传说', 27, 1, '国家级', '牛郎织女的爱情传说', '牛郎织女是中国四大民间传说之一。', 2006, '01-I-4', '集体传承', '/img/牛郎织女传说.webp', 'https://www.bilibili.com/video/av66948950/'),
('西厢记', 14, 1, '国家级', '元代戏曲名著', '《西厢记》是元代著名戏曲家王实甫创作的杂剧。', 2006, '01-I-5', '集体传承', '/img/西厢记.webp', 'https://www.bilibili.com/video/BV1aq4y197DB/'),

('古琴艺术', 1, 2, '国家级', '中国最古老的弹拨乐器艺术', '古琴艺术有三千余年历史。', 2003, '02-II-1', '李祥霆', '/img/古琴艺术.webp', 'https://www.bilibili.com/video/BV1qA411V7jo/'),
('江南丝竹', 10, 2, '国家级', '江苏地区的传统器乐合奏形式', '江南丝竹是以丝弦乐器和竹管乐器为主的传统器乐合奏形式。', 2006, '02-II-2', '集体传承', '/img/江南丝竹.webp', 'https://www.bilibili.com/video/BV1FW411f71S/'),
('蒙古族长调民歌', 5, 2, '国家级', '蒙古族传统歌唱艺术', '蒙古族长调民歌是蒙古族最具代表性的音乐形式。', 2005, '02-II-3', '宝音德力格尔', '/img/蒙古族长调民歌.webp', 'https://www.bilibili.com/video/BV16N411X71S/'),
('侗族大歌', 24, 2, '国家级', '贵州侗族的多声部民歌', '侗族大歌是贵州侗族人民创造的多声部民间合唱艺术。', 2006, '02-II-4', '吴品仙', '/img/侗族大歌.webp', 'https://www.bilibili.com/video/BV1Bc4ae2EmK/'),
('南音', 13, 2, '国家级', '福建泉州的古老音乐形式', '南音是中国现存最古老的乐种之一。', 2006, '02-II-5', '王大浩', '/img/南音.webp', 'https://www.bilibili.com/video/BV1RA411N757/'),
('西安鼓乐', 27, 2, '国家级', '陕西西安的传统器乐演奏形式', '西安鼓乐是源于唐代的古老乐种。', 2006, '02-II-6', '田春瘤', '/img/西安鼓乐webp.webp', 'https://www.bilibili.com/video/BV1ht41127UG/'),
('敦煌乐舞', 28, 2, '国家级', '敦煌壁画中的音乐舞蹈艺术', '敦煌乐舞源于敦煌壁画中的舞蹈形象。', 2006, '02-II-7', '集体传承', '/img/敦煌乐舞.webp', 'https://www.bilibili.com/video/BV1gb421p7ek/'),

('秧歌', 15, 3, '国家级', '北方地区的传统民间舞蹈', '秧歌是中国北方地区广为流传的民间舞蹈。', 2006, '03-III-1', '集体传承', '/img/秧歌.webp', 'https://www.bilibili.com/video/BV1Gi4y1A78w/'),
('狮舞', 19, 3, '国家级', '中国传统民间舞蹈', '狮舞是中国传统民间舞蹈，有两千多年历史。', 2006, '03-III-2', '集体传承', '/img/狮舞.webp', 'https://www.douyin.com/video/7618629647434110586'),
('龙舞', 23, 3, '国家级', '中国传统的民间舞蹈', '龙舞是中华民族的象征。', 2006, '03-III-3', '集体传承', '/img/龙舞.webp', 'https://www.bilibili.com/video/BV1Z2421c7RU/'),
('傣族孔雀舞', 25, 3, '国家级', '云南傣族的传统舞蹈', '孔雀舞是傣族最具代表性的舞蹈。', 2006, '03-III-4', '刀美兰', '/img/傣族孔雀舞.webp', 'https://www.bilibili.com/video/BV1oY41157zZ/'),
('朝鲜族农乐舞', 7, 3, '国家级', '吉林朝鲜族的传统舞蹈', '朝鲜族农乐舞是朝鲜族传统舞蹈。', 2006, '03-III-5', '金明春', '/img/朝鲜族农乐舞.webp', 'https://www.bilibili.com/video/BV1iv411J7jy/'),
('土家族摆手舞', 18, 3, '国家级', '湖南土家族的祭祀舞蹈', '摆手舞是土家族最古老的舞蹈。', 2006, '03-III-6', '集体传承', '/img/土家族摆手舞.webp', 'https://www.bilibili.com/video/av487290762/'),

('京剧', 1, 4, '国家级', '中国五大戏曲剧种之首', '京剧被誉为"国粹"。', 2006, '04-IV-1', '梅兰芳', '/img/京剧.webp', 'https://www.bilibili.com/video/BV1tx411s7nW/'),
('昆曲', 10, 4, '国家级', '中国最古老的剧种之一', '昆曲被称为"百戏之祖"。', 2001, '04-IV-2', '张继青', '/img/昆曲.webp', 'https://www.bilibili.com/video/BV1p3411H7N9/'),
('越剧', 11, 4, '国家级', '中国五大戏曲剧种之一', '越剧以"女子越剧"闻名天下。', 2006, '04-IV-3', '茅威涛', '/img/越剧.webp', 'https://www.bilibili.com/video/BV1qz4y1d7ZH/'),
('豫剧', 16, 4, '国家级', '中国五大戏曲剧种之一', '豫剧是河南省的主要剧种。', 2006, '04-IV-4', '常香玉', '/img/豫剧.webp', 'https://www.bilibili.com/video/av971025323/'),
('黄梅戏', 12, 4, '国家级', '中国五大戏曲剧种之一', '黄梅戏起源于湖北黄梅。', 2006, '04-IV-5', '严凤英', '/img/黄梅戏.webp', 'https://www.bilibili.com/video/av90146122/'),
('粤剧', 19, 4, '国家级', '广东传统戏曲剧种', '粤剧是岭南文化的代表剧种。', 2006, '04-IV-6', '红线女', '/img/粤剧.webp', 'https://www.bilibili.com/video/av418900617/'),
('川剧', 23, 4, '国家级', '四川传统戏曲剧种', '川剧是四川文化的重要组成部分。', 2006, '04-IV-7', '陈智林', '/img/川剧.webp', 'https://www.bilibili.com/video/BV16s411s7PU/'),
('秦腔', 27, 4, '国家级', '陕西传统戏曲剧种', '秦腔是中国最古老的剧种之一。', 2006, '04-IV-8', '李梅', '/img/秦腔.webp', 'https://www.bilibili.com/video/BV1aL411v72k/'),
('晋剧', 4, 4, '国家级', '山西地方戏曲剧种', '晋剧是山西省的主要剧种。', 2006, '04-IV-9', '丁果仙', '/img/晋剧.webp', 'https://www.bilibili.com/video/BV1g44y1u71E/'),
('河北梆子', 3, 4, '国家级', '河北传统戏曲剧种', '河北梆子是河北省的主要剧种。', 2006, '04-IV-10', '裴艳玲', '/img/河北梆子.webp', 'https://www.bilibili.com/video/BV1Mt411f7H4/'),

('相声', 1, 5, '国家级', '中国北方曲艺形式', '相声是以说、学、逗、唱为主要艺术手段的曲艺形式。', 2008, '05-V-1', '马三立', '/img/相声.webp', 'https://www.bilibili.com/video/av10423888/'),
('评书', 1, 5, '国家级', '北方评书艺术', '评书是以叙述故事为主的曲艺形式。', 2008, '05-V-2', '单田芳', '/img/评书.webp', 'https://www.bilibili.com/video/BV1Tf4y1q7aK/'),
('东北二人转', 6, 5, '国家级', '东北地区曲艺形式', '东北二人转史称"蹦蹦"。', 2006, '05-V-3', '赵本山', '/img/东北二人转.webp', 'https://www.bilibili.com/video/BV14b411r7S6/'),
('山东快书', 15, 5, '国家级', '山东传统曲艺', '山东快书是以说唱为主的曲艺形式。', 2008, '05-V-4', '集体传承', '/img/山东快书.webp', 'https://www.bilibili.com/video/av14593828/'),
('河南坠子', 16, 5, '国家级', '河南传统曲艺', '河南坠子是河南省的主要曲艺形式。', 2008, '05-V-5', '集体传承', '/img/河南坠子.webp', 'https://www.bilibili.com/video/BV1C64y1v7dJ/'),

('少林功夫', 16, 6, '国家级', '嵩山少林寺武术', '少林功夫历史悠久。', 2006, '06-VI-1', '释永信', '/img/少林功夫.webp', 'https://www.bilibili.com/video/BV1PL4y1B7UH/'),
('武当武术', 17, 6, '国家级', '武当山道教武术', '武当武术以柔克刚，以静制动。', 2006, '06-VI-2', '钟云龙', '/img/武当武术.webp', 'https://www.bilibili.com/video/BV1t3411q7zZ/'),
('吴桥杂技', 3, 6, '国家级', '河北吴桥传统杂技', '吴桥被誉为"杂技之乡"。', 2006, '06-VI-3', '王宝合', '/img/吴桥杂技.webp', 'https://www.bilibili.com/video/BV15u411Q7TY/'),
('太极拳', 16, 6, '国家级', '中国传统武术', '太极拳柔中带刚，养生技击兼备。', 2006, '06-VI-4', '陈小旺', '/img/太极拳.webp', 'https://www.douyin.com/video/7619664588422111993'),
('八卦掌', 1, 6, '国家级', '中国传统武术', '八卦掌是中国传统内家拳法之一。', 2006, '06-VI-5', '集体传承', '/img/八卦掌.webp', 'https://www.bilibili.com/video/BV1Zz4y127q1/'),

('中国剪纸', 3, 7, '国家级', '中国民间传统装饰艺术', '剪纸是中国民间传统装饰艺术。', 2006, '07-VII-1', '郭佩珍', '/img/中国剪纸.webp', 'https://www.bilibili.com/video/av369204548/'),
('中国篆刻', 10, 7, '国家级', '中国书法与雕刻艺术', '篆刻是书法与雕刻相结合的艺术。', 2006, '07-VII-2', '韩天衡', '/img/中国篆刻.webp', 'https://www.bilibili.com/video/BV1hh4y1v7Ue/'),
('中国书法', 1, 7, '国家级', '中国传统书写艺术', '书法是中国文化核心艺术之一。', 2006, '07-VII-3', '欧阳中石', '/img/中国书法.webp', 'https://www.bilibili.com/video/av90618410/'),
('中国画', 1, 7, '国家级', '中国传统绘画艺术', '中国画分人物、山水、花鸟三大科。', 2006, '07-VII-4', '集体传承', '/img/中国画.webp', 'https://www.bilibili.com/video/BV1Ue4y1y7GB/'),
('苏州刺绣', 10, 7, '国家级', '江苏苏州传统刺绣艺术', '苏绣是中国四大名绣之一。', 2006, '07-VII-5', '姚建萍', '/img/苏州刺绣.webp', 'https://www.bilibili.com/video/av465803547/'),
('湘绣', 18, 7, '国家级', '湖南传统刺绣艺术', '湘绣是中国四大名绣之一。', 2006, '07-VII-6', '刘爱云', '/img/湘绣.webp', 'https://www.bilibili.com/video/BV1Et411z7cp/'),
('蜀绣', 23, 7, '国家级', '四川传统刺绣艺术', '蜀绣是中国四大名绣之一。', 2006, '07-VII-7', '郝淑萍', '/img/粤绣.webp', 'https://www.bilibili.com/video/BV1xm4y1E7Zy/'),
('粤绣', 19, 7, '国家级', '广东传统刺绣艺术', '粤绣包括广绣和潮绣两大流派。', 2006, '07-VII-8', '陈少芳', '/img/粤绣.webp', 'https://www.bilibili.com/video/BV1Tb421b7oP/'),
('泥人张彩塑', 2, 7, '国家级', '天津传统泥塑艺术', '泥人张彩塑是天津传统民间艺术。', 2006, '07-VII-9', '张明山', '/img/泥人张彩塑.webp', 'https://www.bilibili.com/video/av288030256/'),
('杨柳青木版年画', 2, 7, '国家级', '天津传统年画', '杨柳青木版年画是中国著名的木版年画。', 2006, '07-VII-10', '霍庆有', '/img/杨柳青木版年画.webp', 'https://www.bilibili.com/video/BV1SoJPzbE6c/'),
('藏族唐卡', 26, 7, '国家级', '西藏传统卷轴画', '唐卡是藏传佛教艺术珍品。', 2006, '07-VII-11', '勉冲·罗布顿珠', '/img/藏族唐卡.webp', 'https://www.bilibili.com/video/BV17S4y1A73N/'),
('热贡艺术', 29, 7, '国家级', '青海热贡地区唐卡艺术', '热贡艺术是青海省同仁县热贡地区的传统艺术。', 2006, '07-VII-12', '西合道', '/img/热贡艺术webp.webp', 'https://www.bilibili.com/video/BV1xq4y1575p/'),

('景德镇手工制瓷技艺', 14, 8, '国家级', '江西景德镇制瓷技艺', '景德镇制瓷历史悠久。', 2006, '08-VIII-1', '王锡良', '/img/景德镇手工制瓷技艺webp.webp', 'https://www.bilibili.com/video/BV12Y411g7RR/'),
('宜兴紫砂陶制作技艺', 10, 8, '国家级', '江苏宜兴紫砂壶制作技艺', '宜兴紫砂壶是珍贵茶具。', 2006, '08-VIII-2', '顾景舟', '/img/宜兴紫砂陶制作技艺.webp', 'https://www.bilibili.com/video/BV1abbreKERP/'),
('龙泉青瓷烧制技艺', 11, 8, '国家级', '浙江龙泉青瓷烧制技艺', '龙泉青瓷是中国瓷器中的珍品。', 2006, '08-VIII-3', '徐朝兴', '/img/龙泉青瓷烧制技艺.webp', 'https://www.douyin.com/video/6838882015635426568'),
('景泰蓝制作技艺', 1, 8, '国家级', '北京传统珐琅工艺', '景泰蓝是北京传统特种金属工艺品。', 2006, '08-VIII-4', '张同禄', '/img/景泰蓝制作技艺.webp', 'https://www.bilibili.com/video/av304708386/'),
('中国传统桑蚕丝织技艺', 11, 8, '国家级', '浙江丝绸制作技艺', '丝绸是中国对外贸易的重要商品。', 2006, '08-VIII-5', '集体传承', '/img/中国传统桑蚕丝织技艺.webp', 'https://www.bilibili.com/video/BV1vP41187zW/'),
('宣纸制作技艺', 12, 8, '国家级', '安徽宣城宣纸制作技艺', '宣纸产于安徽宣城。', 2006, '08-VIII-6', '邢春荣', '/img/宣纸制作技艺.webp', 'https://www.bilibili.com/video/BV18a4y1B7iw/'),
('徽墨制作技艺', 12, 8, '国家级', '安徽黄山徽墨制作技艺', '徽墨产于安徽黄山歙县。', 2006, '08-VIII-7', '周美洪', '/img/徽墨制作技艺.webp', 'https://www.bilibili.com/video/BV1Vh411g7Tb/'),
('中国雕版印刷技艺', 10, 8, '国家级', '江苏扬州雕版印刷技艺', '雕版印刷是中国古代四大发明之一。', 2006, '08-VIII-8', '集体传承', '/img/中国雕版印刷技艺：.webp', 'https://tv.cctv.com/2021/01/01/VIDEY75AwDvR5mYKs2x2Jodn210101.shtml'),
('中国传统木结构营造技艺', 10, 8, '国家级', '中国传统建筑技艺', '中国传统木结构建筑以榫卯结构为核心。', 2006, '08-VIII-9', '集体传承', '/img/中国传统木结构营造技艺.webp', 'https://www.bilibili.com/video/BV1bM411o7WV/'),
('钧瓷烧制技艺', 16, 8, '国家级', '河南禹州钧瓷烧制技艺', '钧瓷产于河南禹州。', 2006, '08-VIII-10', '任星航', '/img/钧瓷烧制技艺：.webp', 'https://www.bilibili.com/video/BV1Ta4y1L7Sc/'),
('汝瓷烧制技艺', 16, 8, '国家级', '河南汝州汝瓷烧制技艺', '汝瓷产于河南汝州。', 2006, '08-VIII-11', '集体传承', '/img/汝瓷烧制技艺.webp', 'https://www.bilibili.com/video/av427619352/'),
('德化瓷烧制技艺', 13, 8, '国家级', '福建德化白瓷烧制技艺', '德化瓷以"中国白"著称。', 2006, '08-VIII-12', '苏清河', '/img/德化瓷烧制技艺.webp', 'https://www.bilibili.com/video/BV1NRvHBfEZX/'),

('中医针灸', 1, 9, '国家级', '中国传统医疗方法', '中医针灸包括针法和灸法。', 2010, '09-IX-1', '王雪苔', '/img/中医针灸webp.webp', 'https://www.bilibili.com/video/BV1s34y1N73J/'),
('中医正骨疗法', 16, 9, '国家级', '河南洛阳正骨技艺', '洛阳正骨历史悠久。', 2010, '09-IX-2', '集体传承', '/img/中医正骨疗法.webp', 'https://www.bilibili.com/video/BV1Sv421y7AR/'),
('中药炮制技术', 10, 9, '国家级', '传统中药炮制技艺', '中药炮制是根据中医药理论。', 2010, '09-IX-3', '集体传承', '/img/中药炮制技术.webp', 'https://www.bilibili.com/video/BV1wD4y1u7fY/'),
('同仁堂中医药文化', 1, 9, '国家级', '北京同仁堂制药技艺', '同仁堂创建于1669年。', 2010, '09-IX-4', '集体传承', '/img/同仁堂中医药文化.webp', 'https://www.bilibili.com/video/BV19NKZeYEqj/'),
('胡庆余堂中药文化', 11, 9, '国家级', '浙江胡庆余堂制药技艺', '胡庆余堂创建于1884年。', 2010, '09-IX-5', '集体传承', '/img/胡庆余堂中药文化.webp', 'https://www.bilibili.com/video/BV1X5NzeeEGD/'),

('端午节', 18, 10, '国家级', '中国传统节日', '端午节在每年农历五月初五。', 2006, '10-X-1', '集体传承', '/img/端午节.webp', 'https://www.bilibili.com/video/av286002063/'),
('中秋节', 10, 10, '国家级', '中国传统节日', '中秋节在每年农历八月十五。', 2006, '10-X-2', '集体传承', '/img/中秋节.webp', 'https://www.bilibili.com/video/BV1A341127zA/'),
('春节', 1, 10, '国家级', '中国传统节日', '春节是中华民族最重要的传统节日。', 2006, '10-X-3', '集体传承', '/img/春节.webp', 'https://www.bilibili.com/video/BV1rL4y1W7iK/'),
('清明节', 10, 10, '国家级', '中国传统节日', '清明节在每年公历4月4日至6日之间。', 2006, '10-X-4', '集体传承', '/img/清明节.webp', 'https://www.bilibili.com/video/BV1Y44y1T7xj/'),
('重阳节', 27, 10, '国家级', '中国传统节日', '重阳节在每年农历九月初九。', 2006, '10-X-5', '集体传承', '/img/重阳节.webp', 'https://www.bilibili.com/video/av280024539/'),
('元宵节', 10, 10, '国家级', '中国传统节日', '元宵节在农历正月十五。', 2006, '10-X-6', '集体传承', '/img/元宵节.webp', 'https://www.bilibili.com/video/BV1MUAKzREue/'),
('妈祖祭典', 13, 10, '国家级', '福建湄洲妈祖信俗', '妈祖是海神。', 2006, '10-X-7', '集体传承', '/img/妈祖祭典.webp', 'https://www.bilibili.com/video/BV1Zt411i77m/'),
('黄帝陵祭典', 27, 10, '国家级', '陕西黄帝陵祭祀活动', '黄帝是中华民族的始祖。', 2006, '10-X-8', '集体传承', '/img/黄帝陵祭典.webp', 'https://www.bilibili.com/video/BV1viZ9YcEFr/'),
('傣族泼水节', 25, 10, '国家级', '云南傣族传统节日', '泼水节是傣族的新年。', 2006, '10-X-9', '集体传承', '/img/傣族泼水节.webp', 'https://www.bilibili.com/video/BV1EM411K7sg/'),
('那达慕', 5, 10, '国家级', '蒙古族传统盛会', '那达慕是蒙古族的传统盛会。', 2006, '10-X-10', '集体传承', '/img/那达慕.webp', 'https://www.bilibili.com/video/BV1HG411V7Mn/');

DELETE FROM statistics;
INSERT INTO statistics (province_id, total_count, national_count, provincial_count)
SELECT 
    province_id,
    COUNT(*) as total_count,
    SUM(CASE WHEN level = '国家级' THEN 1 ELSE 0 END) as national_count,
    SUM(CASE WHEN level = '省级' THEN 1 ELSE 0 END) as provincial_count
FROM heritage
GROUP BY province_id;

SET FOREIGN_KEY_CHECKS = 1;
