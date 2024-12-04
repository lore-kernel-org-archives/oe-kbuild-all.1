Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37717442F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733305668; cv=none; b=fy+LKL0craV/JZZdXPWTwr2g5JyZSOv6hB1K6Lleyu2eniPu1sVhJ+YNemqtBZ2WavoXAw+qgAIEu3xzjGfXbksgpvSPpQI9N8hlQ/PzI/Q1JLwxOE/bCKaN9fpPnxjFUpT2LfkiUpPvMOk5LoMU3Qza2dAXUY36YkXMvbyLm1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733305668; c=relaxed/simple;
	bh=AAWKUq3TG3IEztAqL3peogvkUis+ABEzxfRgz5Ihi5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lWWbrwHwUrtksKBFr76xqPdsDdoc76b3NUTTflrnIQVgY/za2jxz+HWSVlr5qO5uOVIrc0/qogDSa+fsH1sP0bEwP2IlCucisg1zlh+mERuUmWQaugdJ5DA+gwn/laPbTggyMbVJrjmXG2HJktrSXvVRVZ0bgxKP7S1R1ZMvUIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BP5iN/Wl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BP5iN/Wl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733305666; x=1764841666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AAWKUq3TG3IEztAqL3peogvkUis+ABEzxfRgz5Ihi5g=;
  b=BP5iN/WlrwVwWzhYozpUSknC69pSlR/BZkkOT86HTVo+DrsDb9pD0mI4
   Q2Xhz4JEGiHnAK2MwuEk2c3tC7AbyOS2SjXwrJbZ93/20/vhOlujHci4r
   TMIYeMxd5fTmI4M+OjioVOjEMUp2oQtz9IzFvH/4Kdl3RWA6eWheQLN+v
   l5gKttJV2YTM0YPjLgNJ5GFYxXxWQLO+hH9imVPUhixjFsXDRhWKtbmqD
   +BBwTZturMgUg26mVSXPDBwIv9n+bq6fwPlyMDxY6F502Ri6CjFLAhY9g
   jYy7swgsVH1hb1j4kYqcQ7uQWF5AHdiQga32vajfqPAqAtrXfi9Xuge+q
   Q==;
X-CSE-ConnectionGUID: OWYQnMnQT6Oh9IuCoTtHnQ==
X-CSE-MsgGUID: HsOyuiHLQji+V74pTkBIYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44589654"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44589654"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 01:47:46 -0800
X-CSE-ConnectionGUID: v+dkDOBWTMK2P0y+UBj6sQ==
X-CSE-MsgGUID: WqeLcVG+QZWwwq2+1gOeaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="124543853"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Dec 2024 01:47:41 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIlyX-0002qC-1G;
	Wed, 04 Dec 2024 09:47:22 +0000
Date: Wed, 4 Dec 2024 17:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/iommu/arm-smmu.c:1047:17: error: implicit declaration of function
 'iommu_group_get_for_dev'; did you mean 'iommu_group_get_by_id'?
Message-ID: <202412041757.jYvfkKmA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: 0ff8731c5eb159640fc8a8113f4dcd41809c7f47 [1/1] iommu: Unexport iommu_group_get_for_dev()
config: arm64-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041757.jYvfkKmA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041757.jYvfkKmA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041757.jYvfkKmA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/iommu/arm-smmu.c: In function 'arm_smmu_master_alloc_smes':
   drivers/iommu/arm-smmu.c:1016:49: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1016 |         struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
         |                                                 ^~
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:114:46: note: in expansion of macro '__fwspec_cfg'
     114 |         (i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
         |                                              ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:27: note: in expansion of macro 'fwspec_smendx'
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                           ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1024:9: note: in expansion of macro 'for_each_cfg_sme'
    1024 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1024:9: note: in expansion of macro 'for_each_cfg_sme'
    1024 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu.c:1047:17: error: implicit declaration of function 'iommu_group_get_for_dev'; did you mean 'iommu_group_get_by_id'? [-Werror=implicit-function-declaration]
    1047 |         group = iommu_group_get_for_dev(dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 iommu_group_get_by_id
>> drivers/iommu/arm-smmu.c:1047:15: warning: assignment to 'struct iommu_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1047 |         group = iommu_group_get_for_dev(dev);
         |               ^
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:114:46: note: in expansion of macro '__fwspec_cfg'
     114 |         (i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
         |                                              ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:27: note: in expansion of macro 'fwspec_smendx'
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                           ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1057:9: note: in expansion of macro 'for_each_cfg_sme'
    1057 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1057:9: note: in expansion of macro 'for_each_cfg_sme'
    1057 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_master_free_smes':
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:112:27: note: in expansion of macro '__fwspec_cfg'
     112 | #define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
         |                           ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1076:40: note: in expansion of macro 'fwspec_smmu'
    1076 |         struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
         |                                        ^~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1077:49: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1077 |         struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
         |                                                 ^~
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:114:46: note: in expansion of macro '__fwspec_cfg'
     114 |         (i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
         |                                              ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:27: note: in expansion of macro 'fwspec_smendx'
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                           ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1081:9: note: in expansion of macro 'for_each_cfg_sme'
    1081 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1081:9: note: in expansion of macro 'for_each_cfg_sme'
    1081 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_domain_add_master':
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:114:46: note: in expansion of macro '__fwspec_cfg'
     114 |         (i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
         |                                              ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:27: note: in expansion of macro 'fwspec_smendx'
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                           ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1103:9: note: in expansion of macro 'for_each_cfg_sme'
    1103 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1103:9: note: in expansion of macro 'for_each_cfg_sme'
    1103 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_attach_dev':
   drivers/iommu/arm-smmu.c:1134:20: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1134 |         if (!fwspec->iommu_priv)
         |                    ^~
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:112:27: note: in expansion of macro '__fwspec_cfg'
     112 | #define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
         |                           ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1137:16: note: in expansion of macro 'fwspec_smmu'
    1137 |         smmu = fwspec_smmu(fwspec);
         |                ^~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_add_device':
   drivers/iommu/arm-smmu.c:1379:15: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1379 |         fwspec->iommu_priv = cfg;
         |               ^~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_remove_device':
   drivers/iommu/arm-smmu.c:1417:22: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1417 |         cfg  = fwspec->iommu_priv;
         |                      ^~
   drivers/iommu/arm-smmu.c:1430:21: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1430 |         kfree(fwspec->iommu_priv);
         |                     ^~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_device_group':
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:112:27: note: in expansion of macro '__fwspec_cfg'
     112 | #define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)


vim +1047 drivers/iommu/arm-smmu.c

588888a7399db35 Robin Murphy 2016-09-12  1012  
588888a7399db35 Robin Murphy 2016-09-12  1013  static int arm_smmu_master_alloc_smes(struct device *dev)
588888a7399db35 Robin Murphy 2016-09-12  1014  {
9b468f7d9cf1f08 Joerg Roedel 2018-11-29  1015  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
adfec2e709d2a48 Robin Murphy 2016-09-12  1016  	struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
588888a7399db35 Robin Murphy 2016-09-12  1017  	struct arm_smmu_device *smmu = cfg->smmu;
588888a7399db35 Robin Murphy 2016-09-12  1018  	struct arm_smmu_smr *smrs = smmu->smrs;
588888a7399db35 Robin Murphy 2016-09-12  1019  	struct iommu_group *group;
588888a7399db35 Robin Murphy 2016-09-12  1020  	int i, idx, ret;
588888a7399db35 Robin Murphy 2016-09-12  1021  
588888a7399db35 Robin Murphy 2016-09-12  1022  	mutex_lock(&smmu->stream_map_mutex);
588888a7399db35 Robin Murphy 2016-09-12  1023  	/* Figure out a viable stream map entry allocation */
adfec2e709d2a48 Robin Murphy 2016-09-12  1024  	for_each_cfg_sme(fwspec, i, idx) {
0caf5f4e84fe0a8 Robin Murphy 2019-08-15  1025  		u16 sid = FIELD_GET(SMR_ID, fwspec->ids[i]);
0caf5f4e84fe0a8 Robin Murphy 2019-08-15  1026  		u16 mask = FIELD_GET(SMR_MASK, fwspec->ids[i]);
021bb8420d44cf5 Robin Murphy 2016-09-14  1027  
588888a7399db35 Robin Murphy 2016-09-12  1028  		if (idx != INVALID_SMENDX) {
588888a7399db35 Robin Murphy 2016-09-12  1029  			ret = -EEXIST;
588888a7399db35 Robin Murphy 2016-09-12  1030  			goto out_err;
588888a7399db35 Robin Murphy 2016-09-12  1031  		}
588888a7399db35 Robin Murphy 2016-09-12  1032  
021bb8420d44cf5 Robin Murphy 2016-09-14  1033  		ret = arm_smmu_find_sme(smmu, sid, mask);
588888a7399db35 Robin Murphy 2016-09-12  1034  		if (ret < 0)
588888a7399db35 Robin Murphy 2016-09-12  1035  			goto out_err;
588888a7399db35 Robin Murphy 2016-09-12  1036  
588888a7399db35 Robin Murphy 2016-09-12  1037  		idx = ret;
588888a7399db35 Robin Murphy 2016-09-12  1038  		if (smrs && smmu->s2crs[idx].count == 0) {
021bb8420d44cf5 Robin Murphy 2016-09-14  1039  			smrs[idx].id = sid;
021bb8420d44cf5 Robin Murphy 2016-09-14  1040  			smrs[idx].mask = mask;
588888a7399db35 Robin Murphy 2016-09-12  1041  			smrs[idx].valid = true;
588888a7399db35 Robin Murphy 2016-09-12  1042  		}
588888a7399db35 Robin Murphy 2016-09-12  1043  		smmu->s2crs[idx].count++;
588888a7399db35 Robin Murphy 2016-09-12  1044  		cfg->smendx[i] = (s16)idx;
45ae7cff3684ab4 Will Deacon  2013-06-24  1045  	}
45ae7cff3684ab4 Will Deacon  2013-06-24  1046  
588888a7399db35 Robin Murphy 2016-09-12 @1047  	group = iommu_group_get_for_dev(dev);
588888a7399db35 Robin Murphy 2016-09-12  1048  	if (!group)
588888a7399db35 Robin Murphy 2016-09-12  1049  		group = ERR_PTR(-ENOMEM);
588888a7399db35 Robin Murphy 2016-09-12  1050  	if (IS_ERR(group)) {
588888a7399db35 Robin Murphy 2016-09-12  1051  		ret = PTR_ERR(group);
588888a7399db35 Robin Murphy 2016-09-12  1052  		goto out_err;
588888a7399db35 Robin Murphy 2016-09-12  1053  	}
588888a7399db35 Robin Murphy 2016-09-12  1054  	iommu_group_put(group);
1f3d5ca43019bff Robin Murphy 2016-09-12  1055  
45ae7cff3684ab4 Will Deacon  2013-06-24  1056  	/* It worked! Now, poke the actual hardware */
adfec2e709d2a48 Robin Murphy 2016-09-12  1057  	for_each_cfg_sme(fwspec, i, idx) {
588888a7399db35 Robin Murphy 2016-09-12  1058  		arm_smmu_write_sme(smmu, idx);
588888a7399db35 Robin Murphy 2016-09-12  1059  		smmu->s2crs[idx].group = group;
588888a7399db35 Robin Murphy 2016-09-12  1060  	}
45ae7cff3684ab4 Will Deacon  2013-06-24  1061  
588888a7399db35 Robin Murphy 2016-09-12  1062  	mutex_unlock(&smmu->stream_map_mutex);
45ae7cff3684ab4 Will Deacon  2013-06-24  1063  	return 0;
45ae7cff3684ab4 Will Deacon  2013-06-24  1064  
588888a7399db35 Robin Murphy 2016-09-12  1065  out_err:
1f3d5ca43019bff Robin Murphy 2016-09-12  1066  	while (i--) {
588888a7399db35 Robin Murphy 2016-09-12  1067  		arm_smmu_free_sme(smmu, cfg->smendx[i]);
1f3d5ca43019bff Robin Murphy 2016-09-12  1068  		cfg->smendx[i] = INVALID_SMENDX;
1f3d5ca43019bff Robin Murphy 2016-09-12  1069  	}
588888a7399db35 Robin Murphy 2016-09-12  1070  	mutex_unlock(&smmu->stream_map_mutex);
588888a7399db35 Robin Murphy 2016-09-12  1071  	return ret;
45ae7cff3684ab4 Will Deacon  2013-06-24  1072  }
45ae7cff3684ab4 Will Deacon  2013-06-24  1073  

:::::: The code at line 1047 was first introduced by commit
:::::: 588888a7399db352d2b1a41c9d5b3bf0fd482390 iommu/arm-smmu: Intelligent SMR allocation

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
