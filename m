Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257AA32E136
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766678148; cv=none; b=qJwBw3acQfkKy77E8SBtBp/ksiw3zYCXeDFVn1PFAWBfG6hLYwBbU+7gB3MEgsLDdffV3OANPSR8R+aHFq1/7b1jmnEYknypwbyg3Vope4BPTJgAw/S4tIb9GBOLI8OTE3KCZZ8SLZIvWqXuQxm84fxWE/fQgPczfqRYnOcrHlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766678148; c=relaxed/simple;
	bh=geIh3dNN9RnehhmSolYZWSV2KqWDjxC+GQdzztD7H3I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JjKLd1+MVaRN0E2gibkltwj/+o5QQP9LUq2bE8IWcl+IVDGFt6DHP5bN6hC4YP84T3b8bJoi7iutO8SgYqXu2pqolS2Xnd8TSh84xe5JYV3enLeo+hVlSTHBtILJChvQDdiFxM1kEHhcDUQuZC16psxnqqYt7Q0rp/Nyj8PaQKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpwlJ4A4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpwlJ4A4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766678146; x=1798214146;
  h=date:from:to:cc:subject:message-id;
  bh=geIh3dNN9RnehhmSolYZWSV2KqWDjxC+GQdzztD7H3I=;
  b=hpwlJ4A4qJbeT3qO3Lp9u6z9X6IO5LlEEHc5F+SbJgi8aunKBXjc67pD
   /k+7zfrs8BOBnmg4DTuEP8Me5I7vyxPZMPYjQ7UE9sRb6mfGkU2/LnkeF
   YrtvAnl0i9J4U7w9Rp+xw8474QaUPJHqXr1gK+pajlqYQ41wAJeVGj93z
   q2y28iHjSdivhaVnJpBlPeODqMCY+iPwA4HngHnqH6N4rS7J+BXBiaRzQ
   IVMv7uaYif7r9ZhgKupdaNtzwuMe4w1HSmZMJWkntPpTtYt2gwJGuO6L/
   407FgH7faGLSZnFLLEOLMkQYhU0UFbsEG1pXzDIiuLSBw8p0OqsYyYs3Z
   Q==;
X-CSE-ConnectionGUID: 9xWSN5+XROyigMs3fmpxWw==
X-CSE-MsgGUID: aAoeMWMiRFe/k5VA7G6U7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68522871"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68522871"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 07:55:46 -0800
X-CSE-ConnectionGUID: fpfGwUBcQmm24L6CcWYwAQ==
X-CSE-MsgGUID: RkjZxzJnQP2dygEhmnvong==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="200152771"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Dec 2025 07:55:43 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYngj-000000004D7-3d86;
	Thu, 25 Dec 2025 15:55:41 +0000
Date: Thu, 25 Dec 2025 23:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 drivers/ub/urma/uburma/uburma_dev_ops.c:77:2: error: call to undeclared
 function 'mmu_notifier_unregister'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202512252339.bFtPO9U0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: 901128a1ed92d11749cd5ad529be4e30f3196214 [13/13] uburma: add uburma command and user object framework headers
config: arm64-randconfig-002-20251226 (https://download.01.org/0day-ci/archive/20251225/202512252339.bFtPO9U0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512252339.bFtPO9U0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512252339.bFtPO9U0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/ub/urma/uburma/uburma_dev_ops.c:77:2: error: call to undeclared function 'mmu_notifier_unregister'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      77 |         mmu_notifier_unregister(&file->ub_mn.mn, mm);
         |         ^
   drivers/ub/urma/uburma/uburma_dev_ops.c:77:2: note: did you mean 'mmu_notifier_release'?
   include/linux/mmu_notifier.h:629:20: note: 'mmu_notifier_release' declared here
     629 | static inline void mmu_notifier_release(struct mm_struct *mm)
         |                    ^
   drivers/ub/urma/uburma/uburma_dev_ops.c:68:6: warning: no previous prototype for function 'uburma_unregister_mmu' [-Wmissing-prototypes]
      68 | void uburma_unregister_mmu(struct uburma_file *file)
         |      ^
   drivers/ub/urma/uburma/uburma_dev_ops.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | void uburma_unregister_mmu(struct uburma_file *file)
         | ^
         | static 
>> drivers/ub/urma/uburma/uburma_dev_ops.c:87:8: error: call to undeclared function 'mmu_notifier_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      87 |         ret = mmu_notifier_register(&ub_mn->mn, current->mm);
         |               ^
   drivers/ub/urma/uburma/uburma_dev_ops.c:87:8: note: did you mean 'mmu_notifier_release'?
   include/linux/mmu_notifier.h:629:20: note: 'mmu_notifier_release' declared here
     629 | static inline void mmu_notifier_release(struct mm_struct *mm)
         |                    ^
   drivers/ub/urma/uburma/uburma_dev_ops.c:80:5: warning: no previous prototype for function 'uburma_register_mmu' [-Wmissing-prototypes]
      80 | int uburma_register_mmu(struct uburma_file *file)
         |     ^
   drivers/ub/urma/uburma/uburma_dev_ops.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | int uburma_register_mmu(struct uburma_file *file)
         | ^
         | static 
   drivers/ub/urma/uburma/uburma_dev_ops.c:96:6: warning: no previous prototype for function 'uburma_release_file' [-Wmissing-prototypes]
      96 | void uburma_release_file(struct kref *ref)
         |      ^
   drivers/ub/urma/uburma/uburma_dev_ops.c:96:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      96 | void uburma_release_file(struct kref *ref)
         | ^
         | static 
   4 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]


vim +/mmu_notifier_unregister +77 drivers/ub/urma/uburma/uburma_dev_ops.c

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
  > 77		mmu_notifier_unregister(&file->ub_mn.mn, mm);
    78	}
    79	
    80	int uburma_register_mmu(struct uburma_file *file)
    81	{
    82		struct uburma_mn *ub_mn = &file->ub_mn;
    83		int ret = 0;
    84	
    85		ub_mn->mm = current->mm;
    86		ub_mn->mn.ops = &uburma_mm_notifier_ops;
  > 87		ret = mmu_notifier_register(&ub_mn->mn, current->mm);
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
