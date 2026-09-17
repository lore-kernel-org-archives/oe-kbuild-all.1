Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D6F453A54
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627739; cv=none; b=HqxkdsP/5vbgu+tlHDQGAq32O7WWLo39wy9zgKHr5VbGsp6xHtl6UwGpc0Ab8x4B1K/noSnSM0VbNjaA7HIQSLX29bVmqkQgzs2D40ibEFsAui5RcOKjXcOc51X8ENjEZli4Ck/7nuw3RrLDYLgLXL1/m0L84CRCTT6hbhoaHwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627739; c=relaxed/simple;
	bh=qzxGufug5/pOblw8dFoOy3KzzUgr2e3VjV90ZJd1ahU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KxYzNcDcdkcqvoeF1R77L7s4hhO698t5SJZ8C/jCzeWnH38+lc5xj/RFNzhxmt2QQfKsjrBMCsQ5ZDbm6OSFgw2dEtrIbnSeRnoTeZdkq6tULFBTz2K4sCxXyoAVxg7VJ5WrtxnpD8B0GeEk7n1p2roBUOATTvRckOS28pudRG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mtt5ZLmP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mtt5ZLmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789627738; x=1821163738;
  h=date:from:to:cc:subject:message-id;
  bh=qzxGufug5/pOblw8dFoOy3KzzUgr2e3VjV90ZJd1ahU=;
  b=Mtt5ZLmPnQFGJvkLgsBm/OLaRHk/eH4SWm8eZPYkRrxSEIpR5xLiiayx
   FjRtQHgd/giX6GexEqSJUtlpyctS1yAC7Ek2Qg0ccgZvcTGa2fBDLTbCd
   tkdWkhFE7dHGAJrfWZnQmosYLjkkYdK0CwOaTyfrKnj7Jf3tH++SN6jG0
   4Dm28MSP8I/1UH6j71U2iYZ7C3JmY3fM6Za2KkZlhNu8r14ZoNDjCxvkG
   53LyRgp+o0e3ygSdQRFjfvTwdIDI+i+Zp/xQ5cGthvl7N2EppyNzz4SO7
   xYAOKikk875yxiQtml0K+vrjR5J6TlwLvNdYUSMYO3phUtIcdeiepaDEF
   A==;
X-CSE-ConnectionGUID: m9kR+1jQT7602Y716Gk2eA==
X-CSE-MsgGUID: jTYTL+42Sm2tYi1SVECuDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93844950"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93844950"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 23:48:57 -0700
X-CSE-ConnectionGUID: mhPHq5NQQpWDLiPbVk9ekg==
X-CSE-MsgGUID: LBTY09i5RFyAK35kmVWMgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269330409"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Sep 2026 23:48:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x75vR-000000007DN-1fNV;
	Thu, 17 Sep 2026 06:48:53 +0000
Date: Thu, 17 Sep 2026 14:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-09 1/1]
 drivers/base/regmap/regmap-kunit.c:1202:24: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202609171432.Q5E83Evn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-09
head:   14de2b14a49471561ccfdfc341480537c3389bc2
commit: d1b6521cecba29bc013162ea7b6f46bab8080656 [1/1] regmap: kunit: Ensure that changed bytes are actually different
config: i386-randconfig-1302-20260917 (https://download.01.org/0day-ci/archive/20260917/202609171432.Q5E83Evn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171432.Q5E83Evn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171432.Q5E83Evn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/base/regmap/regmap-kunit.c:977:43: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:980:43: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1057:25: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1057:25: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1059:25: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1059:25: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1126:33: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1126:33: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1129:33: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1129:33: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1181:33: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1181:33: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1184:33: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1184:33: sparse: sparse: cast to restricted __le16
>> drivers/base/regmap/regmap-kunit.c:1202:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/base/regmap/regmap-kunit.c:1202:24: sparse:     expected unsigned short
   drivers/base/regmap/regmap-kunit.c:1202:24: sparse:     got restricted __be16 [usertype]
   drivers/base/regmap/regmap-kunit.c:1204:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/base/regmap/regmap-kunit.c:1204:24: sparse:     expected unsigned short
   drivers/base/regmap/regmap-kunit.c:1204:24: sparse:     got restricted __le16 [usertype]

vim +1202 drivers/base/regmap/regmap-kunit.c

  1027	
  1028	static void raw_read_defaults(struct kunit *test)
  1029	{
  1030		struct raw_test_types *t = (struct raw_test_types *)test->param_value;
  1031		struct regmap *map;
  1032		struct regmap_config config;
  1033		struct regmap_ram_data *data;
  1034		u16 *rval;
  1035		u16 def;
  1036		size_t val_len;
  1037		int i;
  1038	
  1039		config = raw_regmap_config;
  1040	
  1041		map = gen_raw_regmap(&config, t, &data);
  1042		KUNIT_ASSERT_FALSE(test, IS_ERR(map));
  1043		if (IS_ERR(map))
  1044			return;
  1045	
  1046		val_len = sizeof(*rval) * (config.max_register + 1);
  1047		rval = kmalloc(val_len, GFP_KERNEL);
  1048		KUNIT_ASSERT_TRUE(test, rval != NULL);
  1049		if (!rval)
  1050			return;
  1051		
  1052		/* Check that we can read the defaults via the API */
  1053		KUNIT_EXPECT_EQ(test, 0, regmap_raw_read(map, 0, rval, val_len));
  1054		for (i = 0; i < config.max_register + 1; i++) {
  1055			def = config.reg_defaults[i].def;
  1056			if (config.val_format_endian == REGMAP_ENDIAN_BIG) {
  1057				KUNIT_EXPECT_EQ(test, def, be16_to_cpu(rval[i]));
  1058			} else {
> 1059				KUNIT_EXPECT_EQ(test, def, le16_to_cpu(rval[i]));
  1060			}
  1061		}
  1062		
  1063		kfree(rval);
  1064		regmap_exit(map);
  1065	}
  1066	
  1067	static void raw_write_read_single(struct kunit *test)
  1068	{
  1069		struct raw_test_types *t = (struct raw_test_types *)test->param_value;
  1070		struct regmap *map;
  1071		struct regmap_config config;
  1072		struct regmap_ram_data *data;
  1073		u16 val;
  1074		unsigned int rval;
  1075	
  1076		config = raw_regmap_config;
  1077	
  1078		map = gen_raw_regmap(&config, t, &data);
  1079		KUNIT_ASSERT_FALSE(test, IS_ERR(map));
  1080		if (IS_ERR(map))
  1081			return;
  1082	
  1083		get_random_bytes(&val, sizeof(val));
  1084	
  1085		/* If we write a value to a register we can read it back */
  1086		KUNIT_EXPECT_EQ(test, 0, regmap_write(map, 0, val));
  1087		KUNIT_EXPECT_EQ(test, 0, regmap_read(map, 0, &rval));
  1088		KUNIT_EXPECT_EQ(test, val, rval);
  1089	
  1090		regmap_exit(map);
  1091	}
  1092	
  1093	static void raw_write(struct kunit *test)
  1094	{
  1095		struct raw_test_types *t = (struct raw_test_types *)test->param_value;
  1096		struct regmap *map;
  1097		struct regmap_config config;
  1098		struct regmap_ram_data *data;
  1099		u16 *hw_buf;
  1100		u16 val[2];
  1101		unsigned int rval;
  1102		int i;
  1103	
  1104		config = raw_regmap_config;
  1105	
  1106		map = gen_raw_regmap(&config, t, &data);
  1107		KUNIT_ASSERT_FALSE(test, IS_ERR(map));
  1108		if (IS_ERR(map))
  1109			return;
  1110	
  1111		hw_buf = (u16 *)data->vals;
  1112	
  1113		get_random_bytes(&val, sizeof(val));
  1114	
  1115		/* Do a raw write */
  1116		KUNIT_EXPECT_EQ(test, 0, regmap_raw_write(map, 2, val, sizeof(val)));
  1117	
  1118		/* We should read back the new values, and defaults for the rest */
  1119		for (i = 0; i < config.max_register + 1; i++) {
  1120			KUNIT_EXPECT_EQ(test, 0, regmap_read(map, i, &rval));
  1121	
  1122			switch (i) {
  1123			case 2:
  1124			case 3:
  1125				if (config.val_format_endian == REGMAP_ENDIAN_BIG) {
  1126					KUNIT_EXPECT_EQ(test, rval,
  1127							be16_to_cpu(val[i % 2]));
  1128				} else {
  1129					KUNIT_EXPECT_EQ(test, rval,
  1130							le16_to_cpu(val[i % 2]));
  1131				}
  1132				break;
  1133			default:
  1134				KUNIT_EXPECT_EQ(test, config.reg_defaults[i].def, rval);
  1135				break;
  1136			}
  1137		}
  1138	
  1139		/* The values should appear in the "hardware" */
  1140		KUNIT_EXPECT_MEMEQ(test, &hw_buf[2], val, sizeof(val));
  1141	
  1142		regmap_exit(map);
  1143	}
  1144	
  1145	static void raw_sync(struct kunit *test)
  1146	{
  1147		struct raw_test_types *t = (struct raw_test_types *)test->param_value;
  1148		struct regmap *map;
  1149		struct regmap_config config;
  1150		struct regmap_ram_data *data;
  1151		u16 val[3];
  1152		u16 *hw_buf;
  1153		unsigned int rval;
  1154		int i;
  1155	
  1156		config = raw_regmap_config;
  1157	
  1158		map = gen_raw_regmap(&config, t, &data);
  1159		KUNIT_ASSERT_FALSE(test, IS_ERR(map));
  1160		if (IS_ERR(map))
  1161			return;
  1162	
  1163		hw_buf = (u16 *)data->vals;
  1164	
  1165		get_changed_bytes(&hw_buf[2], &val[0], sizeof(val));
  1166	
  1167		/* Do a regular write and a raw write in cache only mode */
  1168		regcache_cache_only(map, true);
  1169		KUNIT_EXPECT_EQ(test, 0, regmap_raw_write(map, 2, val,
  1170							  sizeof(u16) * 2));
  1171		KUNIT_EXPECT_EQ(test, 0, regmap_write(map, 4, val[2]));
  1172	
  1173		/* We should read back the new values, and defaults for the rest */
  1174		for (i = 0; i < config.max_register + 1; i++) {
  1175			KUNIT_EXPECT_EQ(test, 0, regmap_read(map, i, &rval));
  1176	
  1177			switch (i) {
  1178			case 2:
  1179			case 3:
  1180				if (config.val_format_endian == REGMAP_ENDIAN_BIG) {
  1181					KUNIT_EXPECT_EQ(test, rval,
  1182							be16_to_cpu(val[i - 2]));
  1183				} else {
  1184					KUNIT_EXPECT_EQ(test, rval,
  1185							le16_to_cpu(val[i - 2]));
  1186				}
  1187				break;
  1188			case 4:
  1189				KUNIT_EXPECT_EQ(test, rval, val[i - 2]);
  1190				break;
  1191			default:
  1192				KUNIT_EXPECT_EQ(test, config.reg_defaults[i].def, rval);
  1193				break;
  1194			}
  1195		}
  1196	
  1197		/*
  1198		 * The value written via _write() was translated by the core,
  1199		 * translate the original copy for comparison purposes.
  1200		 */
  1201		if (config.val_format_endian == REGMAP_ENDIAN_BIG)
> 1202			val[2] = cpu_to_be16(val[2]);
  1203		else
  1204			val[2] = cpu_to_le16(val[2]);
  1205		
  1206		/* The values should not appear in the "hardware" */
  1207		KUNIT_EXPECT_MEMNEQ(test, &hw_buf[2], &val[0], sizeof(val));
  1208	
  1209		for (i = 0; i < config.max_register + 1; i++)
  1210			data->written[i] = false;
  1211	
  1212		/* Do the sync */
  1213		regcache_cache_only(map, false);
  1214		regcache_mark_dirty(map);
  1215		KUNIT_EXPECT_EQ(test, 0, regcache_sync(map));
  1216	
  1217		/* The values should now appear in the "hardware" */
  1218		KUNIT_EXPECT_MEMEQ(test, &hw_buf[2], &val[0], sizeof(val));
  1219	
  1220		regmap_exit(map);
  1221	}
  1222	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
