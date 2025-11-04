Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A331C1DF75C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 00:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762215995; cv=none; b=E9czh67e/wrbgcFqmb27Kwr9IwtrFgg+TMuPCZspUCT3kOKYzht2z2KBreK8LZdaan9W1zyRr131d/msgPj7EEz7K6t3ucNdTo0r6yd4RV5YMSkvG5cg7LtaGIPFgBUmwoutCr3TgmGQ9N5xik8mfG+DcYLd0Ln7iVGYixH/Yoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762215995; c=relaxed/simple;
	bh=iIDTWqcvNYvw8515BlFVJyPCcE8OfO6H55gCHZKV8IE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WwJp5RmiPIRhgi0w3SVpw5l+vWt8pm//1Zg6C5MEGA5hlPJ94KZmEyGri4oMX2YA2xq8tVw0q4AsComFc6Utp+p6D5+VhtnpP2zHcd++CRees3OuvhFE6rR0OqkXtslVta9ZavqGWHU/mfMYfS3RH7ctDBSscIqMRfgEqaukXv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUF3+PN6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUF3+PN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762215994; x=1793751994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iIDTWqcvNYvw8515BlFVJyPCcE8OfO6H55gCHZKV8IE=;
  b=BUF3+PN6n+9q8DX3WzCZSAgce4YgKajn3FtusIvSeFNh3NxApfr1Ub4z
   c64Qn3zeOGa3zR9OOsMeSENQ/okqBQRDFx1uEqY8fm/KLuUqb7qE6tvsb
   wmpGiGjDi3dp1S1vp5lv3CpNVb+V7UJM/LVLBOAN33UDaUEpGxNv45r7x
   cYwcueqiWcwGv0InlQ4fyvKQVW0AP2yL8W7ZUp/V5SGX2rZb0FS8LFCJq
   JDJAyPj2fr0hb7kp7OT3qKflJU31A7LE3Rx48dzsCVoougTGCkubKubiO
   BXQRQMHCDgJrafZxMsGzQBWzP84eG8bctL66UYMthadHKv3OVc5lRgQaS
   w==;
X-CSE-ConnectionGUID: v48kpoJYT5+jWToDLmeX8A==
X-CSE-MsgGUID: 8e57wnmGRICUevlgBpfCoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75414284"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="75414284"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 16:26:33 -0800
X-CSE-ConnectionGUID: /TJ0QiS7RHuWq5SpVvk7Rg==
X-CSE-MsgGUID: UP+3gBFsRtGnPpi6Jg+ivg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="217821350"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2025 16:26:31 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG4sU-000QfQ-01;
	Tue, 04 Nov 2025 00:26:27 +0000
Date: Tue, 4 Nov 2025 08:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lei Gong <gonglei25@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098]
 drivers/iommu/hisilicon/ummu-core/core_tid.c:62:1: warning: no previous
 prototype for function 'default_manager_alloc'
Message-ID: <202511040838.PRCEsIJz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a29fc03bd0ddaf7388cf31604ef5bd9807585109
commit: 83106717e2b7400d5e65a361975b20a706ceddd4 [3098/3098] iommu/ummu-core: add UMMU Token ID operation interfaces
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251104/202511040838.PRCEsIJz-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040838.PRCEsIJz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040838.PRCEsIJz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/hisilicon/ummu-core/core_tid.c:62:1: warning: no previous prototype for function 'default_manager_alloc' [-Wmissing-prototypes]
      62 | default_manager_alloc(struct ummu_core_device *core_device, u32 max_tid,
         | ^
   drivers/iommu/hisilicon/ummu-core/core_tid.c:61:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      61 | struct ummu_tid_manager *
         | ^
         | static 
>> drivers/iommu/hisilicon/ummu-core/core_tid.c:75:6: warning: no previous prototype for function 'default_manager_free' [-Wmissing-prototypes]
      75 | void default_manager_free(struct ummu_tid_manager *manager)
         |      ^
   drivers/iommu/hisilicon/ummu-core/core_tid.c:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      75 | void default_manager_free(struct ummu_tid_manager *manager)
         | ^
         | static 
   2 warnings generated.


vim +/default_manager_alloc +62 drivers/iommu/hisilicon/ummu-core/core_tid.c

    60	
    61	struct ummu_tid_manager *
  > 62	default_manager_alloc(struct ummu_core_device *core_device, u32 max_tid,
    63			      u32 min_tid)
    64	{
    65		struct ummu_tid_manager *manager;
    66	
    67		manager = kzalloc(sizeof(struct ummu_tid_manager), GFP_KERNEL);
    68		if (!manager)
    69			return NULL;
    70	
    71		xa_init_flags(&manager->token_ids, XA_FLAGS_ALLOC);
    72		return manager;
    73	}
    74	
  > 75	void default_manager_free(struct ummu_tid_manager *manager)
    76	{
    77		struct ummu_tid_data *data;
    78		unsigned long index;
    79	
    80		if (!manager) {
    81			pr_err("invalid param.\n");
    82			return;
    83		}
    84		/* all tid have to be released by the user */
    85		if (WARN_ON(!xa_empty(&manager->token_ids))) {
    86			pr_warn("tid resource was not released.\n");
    87			xa_for_each(&manager->token_ids, index, data)
    88				manager->ops->free_tid(manager, index);
    89		}
    90		xa_destroy(&manager->token_ids);
    91		kfree(manager);
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
