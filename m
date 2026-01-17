Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A5828030E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 03:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622021; cv=none; b=aES6ctxeMLr7l+Im+0DC1dCtNk1Hb5TcXw68cKn5MU/JK6RX6AjgsUj+ug92I6qDRy2fS5JjO2v1VkzwPaC6GzTtPSEeif4CGMlHjtADR/LUouJ09zHL4yls8gyPlHubzpx9RligWoX1ikg60yFpPiYujGn1+OnVO+ktaiJVBNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622021; c=relaxed/simple;
	bh=e1nEx4Rcrp3Oq9wmasXUcN+6DwOyTVhys77ynr+k1cc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=euT5QWgc6qSWDbPLl//dM7GCPa8O67tT38TiPTLb+vkySvZSL8+HIEfO3RHwsZgdGlUZkQcsdNZn82ALMKFLdH3JFNKcsbORkwC5a8yPkBvhpsg69tgb52wtdR8z/Artz/02ICQw5CsiUYyWm1Zjdfw9LMgdOqHmA/H9YMg3ENI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLK0a89n; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLK0a89n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768622020; x=1800158020;
  h=date:from:to:cc:subject:message-id;
  bh=e1nEx4Rcrp3Oq9wmasXUcN+6DwOyTVhys77ynr+k1cc=;
  b=WLK0a89n8ZGDKhdT/HfkWL+goovAvUfbrQUP9tovcMR+fH6g5u2OowZ7
   WF/TI3w14s1rKasbIP2iOBcQ/XKmCYHwY2/5Nkc247F/DGURYNg2VTvPU
   4MIQjO+3lzA/ojAMT3fcAgvQEtT78vrwfuLMLdrAdF63arrWFwmhdh/Gq
   DV7MZZ1dN5FIuKUGZTgnrzUyLtUuQwsH5pJ6wsYJ2jRIZLnYKHfhEq0tM
   Sd9vS5C5R/0dGEUAYAnZdrTX67tyyky2kfUACAnEyjgYyXTRSVAbjB2NH
   Myil1ynSZ9L3mdFJLnLDPqBBDmEi0xe7Dy/OT13c6K/XcVmG3jmaJNG10
   w==;
X-CSE-ConnectionGUID: p9IWhZsLTDKGwvBeCO9kyQ==
X-CSE-MsgGUID: YMvnZ9F4RpaPrqyZiv2a+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69909972"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="69909972"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 19:53:39 -0800
X-CSE-ConnectionGUID: ED9P1puRSve9QkR0CZ7eXg==
X-CSE-MsgGUID: 1JEbU4aWQeW2r8BBXRSzLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="210268007"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2026 19:53:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgxNX-00000000LXU-3iJP;
	Sat, 17 Jan 2026 03:53:35 +0000
Date: Sat, 17 Jan 2026 11:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-10 3/3]
 drivers/base/regmap/regmap-kunit.c:1202:24: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202601171103.GfdWDHle-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-10
head:   c6d074967b3ae008b1e66dece6c8af7eadb66edc
commit: d1b6521cecba29bc013162ea7b6f46bab8080656 [3/3] regmap: kunit: Ensure that changed bytes are actually different
config: x86_64-randconfig-121-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171103.GfdWDHle-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171103.GfdWDHle-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171103.GfdWDHle-lkp@intel.com/

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
