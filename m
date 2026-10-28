Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217834;
	b=Jg6vGkZpj978uUV1nb3WVpuiNuZDUmRoBbkmA9wev8fwncHQfIlDKU+klp7WzOEP2k5h
	 abyyDAO7j4qY09sBSKo+6EE+C7W+Qit4H+T2NHmheAhAaM/GHSuMpXpldbWcVoFOJBqsh
	 JsXWxAVCSJ9hQZ8v0AYEZRmOlkcvBoYLB5AeKOGg0+EChh2gleOUAsllXZUCkZszyc0t+
	 Kc/M2IDMzpVgFJdAb1nBf/uKDMj/nXOw1YnVLYg1qvQdXObQgtthyA2+TnELLN8InSppp
	 pHzT+6tzeZ5VBED/T0E8bUnG+rvEezhdqHt+9KqnqM3CQKH9vhS147MOsDL6Og4ivcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217834;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dv67I27G9PUENpB5fU/8wxOvyxyN0xuuHHsRxuSXQT0=;
	b=VMLJpyf4dh9TBDrA5Ga8qxijAYM9iycL+KoVz+3kggjQCne3l53342rbEFUfR6a+Gx58
	 Pxrx2/6BEFpM5HWwHUpw/56tIiLmszVyQ97ss0yoyYdzwNofYZbsfpxTxzS7BKR37qMPL
	 RN/WAyM2fowjLYWyy4a6dRccBajtjasrd5RGsQ5nKTeTHwon9Y/Ve5Xnld/EjJmEzoJhE
	 wJ2Ee+1DsQvR7N4lTArTMBvsHZHIZYbECx4JCqFfbu1JK3xO48+HysXEeqNCbB4vNmKve
	 E8bXy7+urJH/Qz2G9WGYEl9MrJwRXN/Ds7gkE/xTa/I+iZ7gQxfF7XL0fBibsJHvwOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VPvvDs7V;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C09E606A31F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 20:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C09E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VPvvDs7V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793217833; x=1824753833;
  h=date:from:to:cc:subject:message-id;
  bh=7eHmmzU6jfPtjN0zdpoQVBvWHrusmhJE7oviIZPUzss=;
  b=VPvvDs7VogbdNBM/nll6p7UrqAHEy87hv0hbD1Bjib8LWB3lmMKc3O4Q
   tBxVkvHHsOFKZBrBe2oPrnDW3gAu8OMjyEHdf/KgmXu6yRHGkR7431OSI
   jkYJT1dxO22/iy0XIQG6RMFapl1FcdyJ0N+5LRBLnt6GLvyWdwtLEKZPC
   8PONM7ETMjBzUl+yHTxo+xQekN84Y827Mrkl4IdTtecx9wlWcsmbZRGoY
   jNwqC4ZlGN9eBKEs/uP+/QhEFFkso3LDOXe1g5q0RF4mFTUW1/LDjsJe8
   66yGbV/2gk9FIG6UtUDc/rIJhrQ15nuSzVmJJnnwDf2E/58LEeu9XNXU7
   A==;
X-CSE-ConnectionGUID: 1kHrT/FMReuhdZ9e+s++LQ==
X-CSE-MsgGUID: fYkqHjIjQFCMl8isVD0VGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2046505"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="2046505"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 13:03:52 -0700
X-CSE-ConnectionGUID: pmVD4JL0QQSgeT/uUGGEHw==
X-CSE-MsgGUID: cuqDB1jUR9OejGLZSBKcKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5026728"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Oct 2026 13:03:50 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM9sC-000000004yF-0Ao5;
	Wed, 28 Oct 2026 20:03:48 +0000
Date: Wed, 28 Oct 2026 21:03:33 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-28-2 221/344]
 sound/soc/codecs/max98088.c:1026 max98088_dai2_hw_params() warn: inconsistent
 indenting
Message-ID: <202610282015.KW6Gp0cT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-28-2
head:   3274ffa4355111331c471a7987c5f2af43fac128
commit: 592354536672710721edee383c2afc05ba49ddbb [221/344] dai
config: microblaze-randconfig-r2201-20261028 (https://download.01.org/0day-ci/archive/20261028/202610282015.KW6Gp0cT-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282015.KW6Gp0cT-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/max98088.c:1026 max98088_dai2_hw_params() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1141 max98088_dai1_set_fmt() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1212 max98088_dai2_set_fmt() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1279 max98088_dai1_mute() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1295 max98088_dai2_mute() warn: inconsistent indenting

Old smatch warnings:
sound/soc/codecs/max98088.c:657 max98088_line_pga() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1096 max98088_dai_set_sysclk() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1100 max98088_dai_set_sysclk() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1112 max98088_dai_set_sysclk() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1434 max98088_setup_eq1() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1482 max98088_setup_eq2() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1537 max98088_put_eq_enum() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1581 max98088_handle_eq_pdata() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1642 max98088_handle_pdata() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1675 max98088_probe() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1736 max98088_remove() warn: inconsistent indenting

vim +1026 sound/soc/codecs/max98088.c

  1019	
  1020	static int max98088_dai2_hw_params(struct snd_pcm_substream *substream,
  1021	                                  struct snd_pcm_hw_params *params,
  1022	                                  struct snd_soc_dai *dai)
  1023	{
  1024		struct snd_soc_component *component = snd_soc_dai_to_component(dai);
  1025		struct device *dev = snd_soc_component_to_dev(component);
> 1026	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1027	       struct max98088_cdata *cdata;
  1028	       unsigned long long ni;
  1029	       unsigned int rate;
  1030	       u8 regval;
  1031	
  1032	       cdata = &max98088->dai[1];
  1033	
  1034	       rate = params_rate(params);
  1035	
  1036	       switch (params_width(params)) {
  1037	       case 16:
  1038	               snd_soc_component_update_bits(component, M98088_REG_1C_DAI2_FORMAT,
  1039	                       M98088_DAI_WS, 0);
  1040	               break;
  1041	       case 24:
  1042	               snd_soc_component_update_bits(component, M98088_REG_1C_DAI2_FORMAT,
  1043	                       M98088_DAI_WS, M98088_DAI_WS);
  1044	               break;
  1045	       default:
  1046	               return -EINVAL;
  1047	       }
  1048	
  1049	       snd_soc_component_update_bits(component, M98088_REG_51_PWR_SYS, M98088_SHDNRUN, 0);
  1050	
  1051	       if (rate_value(rate, &regval))
  1052	               return -EINVAL;
  1053	
  1054	       snd_soc_component_update_bits(component, M98088_REG_19_DAI2_CLKMODE,
  1055	               M98088_CLKMODE_MASK, regval);
  1056	       cdata->rate = rate;
  1057	
  1058	       /* Configure NI when operating as master */
  1059	       if (snd_soc_component_read(component, M98088_REG_1C_DAI2_FORMAT)
  1060	               & M98088_DAI_MAS) {
  1061	               unsigned long pclk;
  1062	
  1063	               if (max98088->sysclk == 0) {
  1064	                       dev_err(dev, "Invalid system clock frequency\n");
  1065	                       return -EINVAL;
  1066	               }
  1067	               ni = 65536ULL * (rate < 50000 ? 96ULL : 48ULL)
  1068	                               * (unsigned long long int)rate;
  1069	               pclk = DIV_ROUND_CLOSEST(max98088->sysclk, max98088->mclk_prescaler);
  1070	               ni = DIV_ROUND_CLOSEST_ULL(ni, pclk);
  1071	               snd_soc_component_write(component, M98088_REG_1A_DAI2_CLKCFG_HI,
  1072	                       (ni >> 8) & 0x7F);
  1073	               snd_soc_component_write(component, M98088_REG_1B_DAI2_CLKCFG_LO,
  1074	                       ni & 0xFF);
  1075	       }
  1076	
  1077	       /* Update sample rate mode */
  1078	       if (rate < 50000)
  1079	               snd_soc_component_update_bits(component, M98088_REG_20_DAI2_FILTERS,
  1080	                       M98088_DAI_DHF, 0);
  1081	       else
  1082	               snd_soc_component_update_bits(component, M98088_REG_20_DAI2_FILTERS,
  1083	                       M98088_DAI_DHF, M98088_DAI_DHF);
  1084	
  1085	       snd_soc_component_update_bits(component, M98088_REG_51_PWR_SYS, M98088_SHDNRUN,
  1086	               M98088_SHDNRUN);
  1087	
  1088	       return 0;
  1089	}
  1090	
  1091	static int max98088_dai_set_sysclk(struct snd_soc_dai *dai,
  1092	                                  int clk_id, unsigned int freq, int dir)
  1093	{
  1094		struct snd_soc_component *component = snd_soc_dai_to_component(dai);
  1095		struct device *dev = snd_soc_component_to_dev(component);
  1096	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1097		struct device *dai_dev = snd_soc_component_to_dev(component);
  1098	
  1099	       /* Requested clock frequency is already setup */
  1100	       if (freq == max98088->sysclk)
  1101	               return 0;
  1102	
  1103		if (!IS_ERR(max98088->mclk)) {
  1104			freq = clk_round_rate(max98088->mclk, freq);
  1105			clk_set_rate(max98088->mclk, freq);
  1106		}
  1107	
  1108	       /* Setup clocks for slave mode, and using the PLL
  1109	        * PSCLK = 0x01 (when master clk is 10MHz to 20MHz)
  1110	        *         0x02 (when master clk is 20MHz to 30MHz)..
  1111	        */
  1112	       if ((freq >= 10000000) && (freq < 20000000)) {
  1113	               snd_soc_component_write(component, M98088_REG_10_SYS_CLK, 0x10);
  1114	               max98088->mclk_prescaler = 1;
  1115	       } else if ((freq >= 20000000) && (freq < 30000000)) {
  1116	               snd_soc_component_write(component, M98088_REG_10_SYS_CLK, 0x20);
  1117	               max98088->mclk_prescaler = 2;
  1118	       } else {
  1119	               dev_err(dev, "Invalid master clock frequency\n");
  1120	               return -EINVAL;
  1121	       }
  1122	
  1123	       if (snd_soc_component_read(component, M98088_REG_51_PWR_SYS)  & M98088_SHDNRUN) {
  1124	               snd_soc_component_update_bits(component, M98088_REG_51_PWR_SYS,
  1125	                       M98088_SHDNRUN, 0);
  1126	               snd_soc_component_update_bits(component, M98088_REG_51_PWR_SYS,
  1127	                       M98088_SHDNRUN, M98088_SHDNRUN);
  1128	       }
  1129	
  1130	       dev_dbg(dai_dev, "Clock source is %d at %uHz\n", clk_id, freq);
  1131	
  1132	       max98088->sysclk = freq;
  1133	       return 0;
  1134	}
  1135	
  1136	static int max98088_dai1_set_fmt(struct snd_soc_dai *codec_dai,
  1137	                                unsigned int fmt)
  1138	{
  1139		struct snd_soc_component *component = snd_soc_dai_to_component(codec_dai);
  1140		struct device *dev = snd_soc_component_to_dev(component);
> 1141	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1142	       struct max98088_cdata *cdata;
  1143	       u8 reg15val;
  1144	       u8 reg14val = 0;
  1145	
  1146	       cdata = &max98088->dai[0];
  1147	
  1148	       if (fmt != cdata->fmt) {
  1149	               cdata->fmt = fmt;
  1150	
  1151	               switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
  1152	               case SND_SOC_DAIFMT_CBC_CFC:
  1153	                       /* Consumer mode PLL */
  1154	                       snd_soc_component_write(component, M98088_REG_12_DAI1_CLKCFG_HI,
  1155	                               0x80);
  1156	                       snd_soc_component_write(component, M98088_REG_13_DAI1_CLKCFG_LO,
  1157	                               0x00);
  1158	                       break;
  1159	               case SND_SOC_DAIFMT_CBP_CFP:
  1160	                       /* Set to provider mode */
  1161	                       reg14val |= M98088_DAI_MAS;
  1162	                       break;
  1163	               default:
  1164	                       dev_err(dev, "Clock mode unsupported");
  1165	                       return -EINVAL;
  1166	               }
  1167	
  1168	               switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
  1169	               case SND_SOC_DAIFMT_I2S:
  1170	                       reg14val |= M98088_DAI_DLY;
  1171	                       break;
  1172	               case SND_SOC_DAIFMT_LEFT_J:
  1173	                       break;
  1174	               default:
  1175	                       return -EINVAL;
  1176	               }
  1177	
  1178	               switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
  1179	               case SND_SOC_DAIFMT_NB_NF:
  1180	                       break;
  1181	               case SND_SOC_DAIFMT_NB_IF:
  1182	                       reg14val |= M98088_DAI_WCI;
  1183	                       break;
  1184	               case SND_SOC_DAIFMT_IB_NF:
  1185	                       reg14val |= M98088_DAI_BCI;
  1186	                       break;
  1187	               case SND_SOC_DAIFMT_IB_IF:
  1188	                       reg14val |= M98088_DAI_BCI|M98088_DAI_WCI;
  1189	                       break;
  1190	               default:
  1191	                       return -EINVAL;
  1192	               }
  1193	
  1194	               snd_soc_component_update_bits(component, M98088_REG_14_DAI1_FORMAT,
  1195	                       M98088_DAI_MAS | M98088_DAI_DLY | M98088_DAI_BCI |
  1196	                       M98088_DAI_WCI, reg14val);
  1197	
  1198	               reg15val = M98088_DAI_BSEL64;
  1199	               if (max98088->digmic)
  1200	                       reg15val |= M98088_DAI_OSR64;
  1201	               snd_soc_component_write(component, M98088_REG_15_DAI1_CLOCK, reg15val);
  1202	       }
  1203	
  1204	       return 0;
  1205	}
  1206	
  1207	static int max98088_dai2_set_fmt(struct snd_soc_dai *codec_dai,
  1208	                                unsigned int fmt)
  1209	{
  1210		struct snd_soc_component *component = snd_soc_dai_to_component(codec_dai);
  1211		struct device *dev = snd_soc_component_to_dev(component);
> 1212	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1213	       struct max98088_cdata *cdata;
  1214	       u8 reg1Cval = 0;
  1215	
  1216	       cdata = &max98088->dai[1];
  1217	
  1218	       if (fmt != cdata->fmt) {
  1219	               cdata->fmt = fmt;
  1220	
  1221	               switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
  1222	               case SND_SOC_DAIFMT_CBC_CFC:
  1223	                       /* Consumer mode PLL */
  1224	                       snd_soc_component_write(component, M98088_REG_1A_DAI2_CLKCFG_HI,
  1225	                               0x80);
  1226	                       snd_soc_component_write(component, M98088_REG_1B_DAI2_CLKCFG_LO,
  1227	                               0x00);
  1228	                       break;
  1229	               case SND_SOC_DAIFMT_CBP_CFP:
  1230	                       /* Set to provider mode */
  1231	                       reg1Cval |= M98088_DAI_MAS;
  1232	                       break;
  1233	               default:
  1234	                       dev_err(dev, "Clock mode unsupported");
  1235	                       return -EINVAL;
  1236	               }
  1237	
  1238	               switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
  1239	               case SND_SOC_DAIFMT_I2S:
  1240	                       reg1Cval |= M98088_DAI_DLY;
  1241	                       break;
  1242	               case SND_SOC_DAIFMT_LEFT_J:
  1243	                       break;
  1244	               default:
  1245	                       return -EINVAL;
  1246	               }
  1247	
  1248	               switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
  1249	               case SND_SOC_DAIFMT_NB_NF:
  1250	                       break;
  1251	               case SND_SOC_DAIFMT_NB_IF:
  1252	                       reg1Cval |= M98088_DAI_WCI;
  1253	                       break;
  1254	               case SND_SOC_DAIFMT_IB_NF:
  1255	                       reg1Cval |= M98088_DAI_BCI;
  1256	                       break;
  1257	               case SND_SOC_DAIFMT_IB_IF:
  1258	                       reg1Cval |= M98088_DAI_BCI|M98088_DAI_WCI;
  1259	                       break;
  1260	               default:
  1261	                       return -EINVAL;
  1262	               }
  1263	
  1264	               snd_soc_component_update_bits(component, M98088_REG_1C_DAI2_FORMAT,
  1265	                       M98088_DAI_MAS | M98088_DAI_DLY | M98088_DAI_BCI |
  1266	                       M98088_DAI_WCI, reg1Cval);
  1267	
  1268	               snd_soc_component_write(component, M98088_REG_1D_DAI2_CLOCK,
  1269	                       M98088_DAI_BSEL64);
  1270	       }
  1271	
  1272	       return 0;
  1273	}
  1274	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
