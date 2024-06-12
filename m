Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363A31802CC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718206559; cv=none; b=ZulcTL0nnSO1xUVhZ7gwXDVOHPsF1/mAnQabn7Z4aWF0kqBpeilWFPDCl9f8pQwcUbI0tN9yrqbMpwku2E7LuFI0p3cG3QingpByUDvd39d+ZPQcOuTNJWzcv0+E3p36Bd2fyVjCe11MG+slu973mutxW2mr7gN8gkJA8c4z9OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718206559; c=relaxed/simple;
	bh=VP3mqVYNLMbIQbDyJHAJ88TGJYats4ioxtNtgjAfkNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SqiXqm8/28ykgENVDS3zHqcbxDhcZa5j1xVPm67whaWq9kEfmU+NX9eO+uv4ykTWpMc0FJwtWE/5qJ6f6M4sIsEQEf+xKyDyc3cdvSTHWR1JEpx5mUS+ZoD/mFIvRFwAkoHUU1K53RVDfRra2IYLDWI8vrkRwxkLFNI2ww23Nso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFJ2H32l; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFJ2H32l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718206558; x=1749742558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VP3mqVYNLMbIQbDyJHAJ88TGJYats4ioxtNtgjAfkNU=;
  b=EFJ2H32l7omyEMzTzDr0ieA2u8PY8jFWQ6NBTarILBYm2UsFN9UPPhIf
   VqX2jOWz3u/JTcaTgIGkdDEyuDMauZ2aP7pB+0AVc3G1/4C5DFVGMetby
   JzXB2jjw8s2qH0e76PrjBAr2oxJa79d4WncJz6L/PzRkS82jyaKO7hB31
   vbiwQd76WRfeQWF+riA+Evi1J6wiD1Gu1BaZO20sRND5ipsUd4xMUm285
   R0krPKgtR3zFYMrK0b2Sol1susC17aNTORqs6AW0rPerETJIJEYKCjTIA
   /9l3exqWAX1aIAnf1E8EAVunppCvuzq2ic3POqR2/LSb3WVq1wVhASoBc
   A==;
X-CSE-ConnectionGUID: HeEtkCiRQvqM/90MxMxCPQ==
X-CSE-MsgGUID: kWXS+86+ROmCb+xMk0gQ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32524219"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="32524219"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 08:35:57 -0700
X-CSE-ConnectionGUID: Fsco/D7PTRCm8sp7cs//EQ==
X-CSE-MsgGUID: MiAUEHX6QIqNADF3DG16sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="39690195"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Jun 2024 08:35:56 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHQ0v-0001fG-21;
	Wed, 12 Jun 2024 15:35:53 +0000
Date: Wed, 12 Jun 2024 23:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Roger Quadros <rogerq@kernel.org>
Subject: [rogerq:b4/am65-cpsw-multi-rx-1.1 6/9]
 drivers/net/ethernet/ti/cpsw_ale.h:80:1: error: version control conflict
 marker in file
Message-ID: <202406122323.QcaVeNKT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rogerq/linux b4/am65-cpsw-multi-rx-1.1
head:   8b49bb5d7ad14fc809b07436e283aefff4b35262
commit: 10a677b4a557203dbac8fb4dc78cfe72c415a61a [6/9] net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240612/202406122323.QcaVeNKT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406122323.QcaVeNKT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406122323.QcaVeNKT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/ti/am65-cpsw-nuss.c:35:
>> drivers/net/ethernet/ti/cpsw_ale.h:80:1: error: version control conflict marker in file
      80 | >>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
         | ^~~~~~~
>> drivers/net/ethernet/ti/cpsw_ale.h:89:41: error: 'ALE_FIELDS_MAX' undeclared here (not in a function); did you mean 'BTF_FIELDS_MAX'?
      89 |         struct regmap_field     *fields[ALE_FIELDS_MAX];
         |                                         ^~~~~~~~~~~~~~
         |                                         BTF_FIELDS_MAX
--
   In file included from drivers/net/ethernet/ti/cpsw_ale.c:22:
>> drivers/net/ethernet/ti/cpsw_ale.h:80:1: error: version control conflict marker in file
      80 | >>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
         | ^~~~~~~
>> drivers/net/ethernet/ti/cpsw_ale.h:89:41: error: 'ALE_FIELDS_MAX' undeclared here (not in a function); did you mean 'BTF_FIELDS_MAX'?
      89 |         struct regmap_field     *fields[ALE_FIELDS_MAX];
         |                                         ^~~~~~~~~~~~~~
         |                                         BTF_FIELDS_MAX
>> drivers/net/ethernet/ti/cpsw_ale.c:1395:1: error: version control conflict marker in file
    1395 | >>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
         | ^~~~~~~


vim +80 drivers/net/ethernet/ti/cpsw_ale.h

    33	
    34	enum ale_fields {
    35		MINOR_VER,
    36		MAJOR_VER,
    37		ALE_ENTRIES,
    38		ALE_POLICERS,
    39		POL_PORT_MEN,
    40		POL_TRUNK_ID,
    41		POL_PORT_NUM,
    42		POL_PRI_MEN,
    43		POL_PRI_VAL,
    44		POL_OUI_MEN,
    45		POL_OUI_INDEX,
    46		POL_DST_MEN,
    47		POL_DST_INDEX,
    48		POL_SRC_MEN,
    49		POL_SRC_INDEX,
    50		POL_OVLAN_MEN,
    51		POL_OVLAN_INDEX,
    52		POL_IVLAN_MEN,
    53		POL_IVLAN_INDEX,
    54		POL_ETHERTYPE_MEN,
    55		POL_ETHERTYPE_INDEX,
    56		POL_IPSRC_MEN,
    57		POL_IPSRC_INDEX,
    58		POL_IPDST_MEN,
    59		POL_IPDST_INDEX,
    60		POL_EN,
    61		POL_RED_DROP_EN,
    62		POL_YELLOW_DROP_EN,
    63		POL_YELLOW_THRESH,
    64		POL_POL_MATCH_MODE,
    65		POL_PRIORITY_THREAD_EN,
    66		POL_MAC_ONLY_DEF_DIS,
    67		POL_TEST_CLR,
    68		POL_TEST_CLR_RED,
    69		POL_TEST_CLR_YELLOW,
    70		POL_TEST_CLR_SELECTED,
    71		POL_TEST_ENTRY,
    72		POL_STATUS_HIT,
    73		POL_STATUS_HIT_RED,
    74		POL_STATUS_HIT_YELLOW,
    75		ALE_DEFAULT_THREAD_EN,
    76		ALE_DEFAULT_THREAD_VAL,
    77		ALE_THREAD_CLASS_INDEX,
    78		ALE_THREAD_ENABLE,
    79		ALE_THREAD_VALUE,
  > 80	>>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
    81		/* terminator */
    82		ALE_FIELDS_MAX,
    83	};
    84	
    85	struct cpsw_ale {
    86		struct cpsw_ale_params	params;
    87		struct timer_list	timer;
    88		struct regmap		*regmap;
  > 89		struct regmap_field	*fields[ALE_FIELDS_MAX];
    90		unsigned long		ageout;
    91		u32			version;
    92		u32			features;
    93		/* These bits are different on NetCP NU Switch ALE */
    94		u32			port_mask_bits;
    95		u32			port_num_bits;
    96		u32			vlan_field_bits;
    97		unsigned long		*p0_untag_vid_mask;
    98		const struct ale_entry_fld *vlan_entry_tbl;
    99	};
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
