Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3D32F9DAE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 18:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959352; cv=none; b=XNKiHBAxZBFgNzeXlZ/6rWlR7b04b6dKAnSPe2OZHrvyaieCBdjlQmsMwYPpLlawhjC7a0oGGlvT3O45gLFYsD9EohpkwRMtDPaSWvs7QVbggaPMGbV3cnA5JAUV9belVmtsnT5Unpe579Sc2b9OUJSx9zx/kYsAvqbbNKZiJM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959352; c=relaxed/simple;
	bh=utj5e1qiAsvbREVtKKUJGZCz7S7Kx38UfhINXoR4vIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KFxq0p7zkOUdwL9bJw9fLgJJUIWyV9mJJY7PW1zWCnHsIjOPtOAFJ4Mw7ygNappL4vxsvTrAo/yKWASkz7bGLaE/Jls6elppbkAMqgfEqduPr5AFlGn8Ym5D9Yd+s6rqFdeOKl3V3BSDJKDGA6Gi12ViV29VQIqFysoV+nzsReg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fdr/abt5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fdr/abt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764959350; x=1796495350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=utj5e1qiAsvbREVtKKUJGZCz7S7Kx38UfhINXoR4vIg=;
  b=Fdr/abt5XKR1d5/iibfktfp3/zVxt5uV3Fj7gzDp4s051EEoc23KD6O5
   G1vhBhIqR0aDcVl/nS3BGx0a1a+H5z+daBdKQQZIBqv0eqpy3t8HLyJNz
   5m7DbmpEPbn2RQZ/NoOdm/w2opSPCKLDgHHouYOAi4//IibrVbuVlD41D
   LmgkfvSQCBipP5bGE1lcXiAecpWETT3U9S7yyiMz0y6biGso1lqjoKQt1
   FjVojCoXsqxqzhREuhCAQc0bb4sjC+m9k/Ig5yRRVnFeDpMirHUrmmZA5
   a+KOe7X8h8/6Z29JuKd/YjSE9rpo2I0PFHb8ANzJwoQMN14LOZUvrY8c/
   g==;
X-CSE-ConnectionGUID: lB2Z/0bITH+u1YmMwF0oAw==
X-CSE-MsgGUID: PSgzv4bCTJmb4/zKLi5z0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77321360"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="77321360"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 10:29:10 -0800
X-CSE-ConnectionGUID: khuywIPpQ3+LEJET6YyI7w==
X-CSE-MsgGUID: Q1phH7M9Sua9t2L+gmRa2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="226008659"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2025 10:29:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRaYE-00000000FMJ-1NGC;
	Fri, 05 Dec 2025 18:29:06 +0000
Date: Sat, 6 Dec 2025 02:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3479/3479]
 drivers/ub/urma/uburma/uburma_dev_ops.c:68:6: warning: no previous prototype
 for 'uburma_unregister_mmu'
Message-ID: <202512060214.uqTv7hOT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: 901128a1ed92d11749cd5ad529be4e30f3196214 [3479/3479] uburma: add uburma command and user object framework headers
config: arm64-randconfig-r061-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060214.uqTv7hOT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060214.uqTv7hOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060214.uqTv7hOT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/uburma/uburma_dev_ops.c:68:6: warning: no previous prototype for 'uburma_unregister_mmu' [-Wmissing-prototypes]
      68 | void uburma_unregister_mmu(struct uburma_file *file)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_dev_ops.c:80:5: warning: no previous prototype for 'uburma_register_mmu' [-Wmissing-prototypes]
      80 | int uburma_register_mmu(struct uburma_file *file)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_dev_ops.c:96:6: warning: no previous prototype for 'uburma_release_file' [-Wmissing-prototypes]
      96 | void uburma_release_file(struct kref *ref)
         |      ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/uburma_unregister_mmu +68 drivers/ub/urma/uburma/uburma_dev_ops.c

    67	
  > 68	void uburma_unregister_mmu(struct uburma_file *file)
    69	{
    70		struct uburma_mn *ub_mn = &file->ub_mn;
    71		struct mm_struct *mm = ub_mn->mm;
    72	
    73		if (!mm)
    74			return;
    75	
    76		file->ub_mn.mm = NULL;
    77		mmu_notifier_unregister(&file->ub_mn.mn, mm);
    78	}
    79	
  > 80	int uburma_register_mmu(struct uburma_file *file)
    81	{
    82		struct uburma_mn *ub_mn = &file->ub_mn;
    83		int ret = 0;
    84	
    85		ub_mn->mm = current->mm;
    86		ub_mn->mn.ops = &uburma_mm_notifier_ops;
    87		ret = mmu_notifier_register(&ub_mn->mn, current->mm);
    88		if (ret) {
    89			ub_mn->mm = NULL;
    90			return ret;
    91		}
    92	
    93		return 0;
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
