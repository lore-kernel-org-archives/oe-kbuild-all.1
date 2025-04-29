Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7939727057C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 06:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745907631; cv=none; b=jsfSE5zHn/1erwnjjzvd5XpJg1wqRMCF0rjbooTQgBUOw+NA/tfPvl0YCeEmAyqvSGuSHwddVPfqh0vQ4K7rPzvM4qHRtIaN1msBCXkUgMBK7/vjXc2VlzdQatsgjddiI2cHe9c7C2Y6MkEQmiZwXQdLZs1udflyd2GJa5blG8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745907631; c=relaxed/simple;
	bh=d5J3wHgt/Kp0s6YUSH6Pk4Xy1CCjj2GgJP3YyY7wyjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nCxrOsEkJX0BTDbrl0IY4wp4cloGC199JTRS3hMKaiV/WLtqQKApOC69/HBVBmt6m7/PJY8rXJnUU99H/J9WhfrdVRyrIEgqBqWFb4lU949r1ACESeFbUeANlgZNbvoUL12qenieLNAHEvAGAmzN40SS2GX+FVOSA5/JsZL71UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+nYAaJg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+nYAaJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745907628; x=1777443628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d5J3wHgt/Kp0s6YUSH6Pk4Xy1CCjj2GgJP3YyY7wyjY=;
  b=i+nYAaJg+yS0oGeHejNPc6wk3NYcLVFbUSviYXazVL+TFoUY+3xxsQlo
   oQOXPSLH7sRoBXZtyjuKsFqDVtpBM8+0pwL1flP/oYjFes0lKdneUsKx+
   Tv9G1PCmgREPgeMXuWgM+WY+Dg18ZPIpe9dHL4iDn+4G7TdOm7EcuK1js
   /vHYmOG0DFQzTG2rJ7nwU7jGbWyJ3ajcMN3fnyx42dKhPnHkaScLr/IGH
   jqXRBsfZ/YGeA9Ya7kaN9BTVQVQDcF7TlLlygWiAyQBRQFe2liuY60Pvp
   rwnkZp79fnd8RU2+Xht4IWGs6II6LC8mM2sLfUcGJHZKseHPTIPbNpb/0
   w==;
X-CSE-ConnectionGUID: p1dOfyalQOy2Nz7FjMhpjw==
X-CSE-MsgGUID: e5rh+uj5SLmx+unlr503Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="72893041"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="72893041"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 23:20:25 -0700
X-CSE-ConnectionGUID: njprnr3HQO+ud+nQxXQNaQ==
X-CSE-MsgGUID: rs77bSUvTCOIWzd4rx8IuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="134711794"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Apr 2025 23:20:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9eKL-0000Vz-1T;
	Tue, 29 Apr 2025 06:20:21 +0000
Date: Tue, 29 Apr 2025 14:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks 16/18]
 kernel/fork.c:216:38: error: size of array 'dynamic_stack_pages' is too
 large
Message-ID: <202504291420.ZbMxQXf9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks
head:   6f50dac461ca66220a13a927db438e4a75708444
commit: b4f83b9239ff94d246c17afc4d32fea20f8afd4b [16/18] HACK: just enable dynamic stack
config: arm64-randconfig-001-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291420.ZbMxQXf9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291420.ZbMxQXf9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291420.ZbMxQXf9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7:0,
                    from arch/arm64/include/asm/percpu.h:259,
                    from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from kernel/fork.c:16:
>> kernel/fork.c:216:38: error: size of array 'dynamic_stack_pages' is too large
    static DEFINE_PER_CPU(struct page *, dynamic_stack_pages[THREAD_DYNAMIC_PAGES]);
                                         ^
   include/linux/percpu-defs.h:102:37: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     __PCPU_ATTRS(sec) __typeof__(type) name
                                        ^~~~
   kernel/fork.c:216:8: note: in expansion of macro 'DEFINE_PER_CPU'
    static DEFINE_PER_CPU(struct page *, dynamic_stack_pages[THREAD_DYNAMIC_PAGES]);
           ^~~~~~~~~~~~~~
>> kernel/fork.c:216:38: warning: 'dynamic_stack_pages' defined but not used [-Wunused-variable]
    static DEFINE_PER_CPU(struct page *, dynamic_stack_pages[THREAD_DYNAMIC_PAGES]);
                                         ^
   include/linux/percpu-defs.h:102:37: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     __PCPU_ATTRS(sec) __typeof__(type) name
                                        ^~~~
   kernel/fork.c:216:8: note: in expansion of macro 'DEFINE_PER_CPU'
    static DEFINE_PER_CPU(struct page *, dynamic_stack_pages[THREAD_DYNAMIC_PAGES]);
           ^~~~~~~~~~~~~~


vim +/dynamic_stack_pages +216 kernel/fork.c

a8fb2753964914 Pasha Tatashin 2024-03-11  215  
a8fb2753964914 Pasha Tatashin 2024-03-11 @216  static DEFINE_PER_CPU(struct page *, dynamic_stack_pages[THREAD_DYNAMIC_PAGES]);
a8fb2753964914 Pasha Tatashin 2024-03-11  217  

:::::: The code at line 216 was first introduced by commit
:::::: a8fb2753964914b981bf07f4ba2382272361d2bf fork: Dynamic Kernel Stacks

:::::: TO: Pasha Tatashin <pasha.tatashin@soleen.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
