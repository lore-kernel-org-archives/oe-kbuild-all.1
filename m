Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D54328B6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733472607; cv=none; b=fLzk3e+vm/vWlaozVNXKESYodX6GCnyjKWfRx8KyB9en7mUqseICty83jfSd/Mch+ugv/3vm0Jm1aSgus1BOXVil5abTyuhpC6ZMLc2xQ8Q8zqCK6D5zyD6wsxtKSp7D2q9qYJgAlDaz8gnm6LRVoT6mBhsDlJrSmOVx4a3tWdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733472607; c=relaxed/simple;
	bh=FZWibkqG1CklV7HnkQbfevbZOqnEAKbjLU91MYfcDf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T5w5C/jCRe5dTo3f1248BXpHAX/HNuDYF8Ox8hrAXKGlQowmpZZUf8MEhw4UMbvMUtOMqZkppgbZmQuYH+bqKZnKah8yds1G5WRwUG6uxspOyLEWMBI4OoPG8hTlUnJUFMGY93aIEOZo6YEZMW3FMOIn569conXMMR1A8N6RsX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONsEF9Dl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONsEF9Dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733472606; x=1765008606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FZWibkqG1CklV7HnkQbfevbZOqnEAKbjLU91MYfcDf4=;
  b=ONsEF9Dl6IPSJ4NkocSbYljdmbyb4VNozXIWXelv5T090gbsPdTD686u
   QcDHKE9eQ74mFG5uheSBzjTAdUYfB50/QBs6saW8uw6wmLsWYhkR1Dbql
   A1Ucj6hxpYHN8vDX5w0Ikict+CBhjT0u3vp8AzG9AZxnXPEpKqZV+nshX
   3aW07n86s4CJR+u0gTx0/6aj69LLchDkh8DD2eqbcwETrDmkiOhVA+Glv
   xYPz1/A6658aLT3S8UGk170z/UWx0+XgJ2iviy8FPYWRSc0C4nIR1vetT
   hgF6UhQejhp3PUOcnCoqpiYXNrJIAqa+2V+Fa7iNu69E442eNJHsE/84O
   g==;
X-CSE-ConnectionGUID: 9ZiiM9lzQJiUoDQe3sXLGQ==
X-CSE-MsgGUID: 50Je6f5WSi2Qp1+CcPyQCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33871931"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="33871931"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 00:10:05 -0800
X-CSE-ConnectionGUID: YP7sH8A6S2iU1dtaZxhkBg==
X-CSE-MsgGUID: dheV3/5ZTByQGX73eyeexA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="99379676"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Dec 2024 00:10:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJTPV-0000qJ-1g;
	Fri, 06 Dec 2024 08:10:01 +0000
Date: Fri, 6 Dec 2024 16:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/14]
 include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202412061613.SW2dIQEc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   d92a210e49a13fdc3fb2141d0dbc9f63bc642533
commit: c9b85866c78e7e00085c89ee4fd3b93f54659682 [2/14] ANDROID: madvise: add vendor hook to bypass process madvise
config: i386-randconfig-062 (https://download.01.org/0day-ci/archive/20241206/202412061613.SW2dIQEc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061613.SW2dIQEc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061613.SW2dIQEc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/madvise.c: note: in included file:
   include/trace/hooks/madvise.h:21:31: sparse: sparse: no newline at end of file
   mm/madvise.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:817:9: sparse: sparse: context imbalance in 'madvise_cold_or_pageout_pte_range' - unexpected unlock
   include/linux/rcupdate.h:817:9: sparse: sparse: context imbalance in 'madvise_free_pte_range' - unexpected unlock
   mm/madvise.c: note: in included file:
>> include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/madvise.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/madvise.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +10 include/trace/hooks/madvise.h

     9	
  > 10	DECLARE_RESTRICTED_HOOK(android_rvh_process_madvise_bypass,
    11		TP_PROTO(int pidfd, const struct iovec __user *vec, size_t vlen,
    12			int behavior, unsigned int flags, ssize_t *ret, bool *bypass),
    13		TP_ARGS(pidfd, vec, vlen, behavior, flags, ret, bypass), 1);
    14	struct vm_area_struct;
    15	DECLARE_HOOK(android_vh_update_vma_flags,
    16		TP_PROTO(struct vm_area_struct *vma),
    17		TP_ARGS(vma));
    18	
    19	#endif
    20	
  > 21	#include <trace/define_trace.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
