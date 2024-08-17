Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFF3101DE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723919272; cv=none; b=RhLko9BicVnJsnK6HqJji7072kKc9dvsSsp3tSrPbEv0wcIXvJ7Kq0n50Q6D3rnE1CAi01dVHjM/cNF1/2Z2sUUei3Hlo1P+FJ2t2oXzgRiyGCwu/vm+z2u+Tk37PqxugH2vFrZk/vXvB6tktllLpcwn7OV1ePrl8+adxuXEk8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723919272; c=relaxed/simple;
	bh=nh2eJf0ksGa5X+8sznHX+9yRt4o29iXVAOfHYF2mjhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lQH8QIsYQB8gMJ4TzCGx3Kigt7+9izme7Y7MQazevNcm1mxjsWYOhdNpd5qheRvT5z6hvoRp0mHwEIrX86fmThE3Cn9P/ggfHXrMYNhfHoyyePK7dkP0IsC+TnW+XhsZFDDGMRvz9TlycgMhE65PnClLM0mrTXIApAAAv+wX9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erAReOAE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erAReOAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723919270; x=1755455270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nh2eJf0ksGa5X+8sznHX+9yRt4o29iXVAOfHYF2mjhY=;
  b=erAReOAEhyj9bI43DJnAbVJxQLiHQUALKr59iOxPpjlTUapYANkqejS8
   fHeUjGCOexk/touWcYtCgBXGumNsnFHv18iD4ONHOMySvoqsOBhtmUtAP
   7gVJdyByfxGAH9UU7cn/sC78/DA449rLUid5vNC8g26iDwIXXlgMRRQxy
   xlzFRvU7buLtJlf407CYuheAn2bXFSMBSYvx8Ls7mW9sLNBea8lBxZkZw
   TjBaYackJ5IoqSi/V7jE9s/bQO+ls1qwMX2qegc9bxii3XtWYcqiTb2Dr
   YdQEYZUd5ZEfW/8Sk116+JMTJnYchflC/6PZl8U0hUfvwxmK64ZrEcKPl
   Q==;
X-CSE-ConnectionGUID: ORgXd6eXS52sAiIDi49hqQ==
X-CSE-MsgGUID: AN8+ALHIRtOgCbOtQOLfmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="22337072"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="22337072"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 11:27:50 -0700
X-CSE-ConnectionGUID: OgQwJf8pSXexzYEwlgVtFw==
X-CSE-MsgGUID: 7adg0i8JQo2MVMKAMZR9ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="60144444"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Aug 2024 11:27:49 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfO9S-0007io-2w;
	Sat, 17 Aug 2024 18:27:46 +0000
Date: Sun, 18 Aug 2024 02:27:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:clone3-shadow-stack 5/9]
 include/linux/sched/task.h:242:52: warning: 'struct vm_area_struct' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202408180233.vqRbPkcd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git clone3-shadow-stack
head:   9afed14a987147f3e45980fa0b962ca96de453dd
commit: 8c4502a4854ffb82bd6711413e5908812fdea4aa [5/9] fork: Add shadow stack support to clone3()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240818/202408180233.vqRbPkcd-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408180233.vqRbPkcd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180233.vqRbPkcd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sched/signal.h:9,
                    from include/linux/ptrace.h:7,
                    from arch/openrisc/kernel/asm-offsets.c:28:
>> include/linux/sched/task.h:242:52: warning: 'struct vm_area_struct' declared inside parameter list will not be visible outside of this definition or declaration
     242 |                                             struct vm_area_struct *vma,
         |                                                    ^~~~~~~~~~~~~~
--
   In file included from include/linux/sched/signal.h:9,
                    from include/linux/ptrace.h:7,
                    from arch/openrisc/kernel/asm-offsets.c:28:
>> include/linux/sched/task.h:242:52: warning: 'struct vm_area_struct' declared inside parameter list will not be visible outside of this definition or declaration
     242 |                                             struct vm_area_struct *vma,
         |                                                    ^~~~~~~~~~~~~~


vim +242 include/linux/sched/task.h

   234	
   235	#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
   236	int arch_shstk_validate_clone(struct task_struct *p,
   237				      struct vm_area_struct *vma,
   238				      struct page *page,
   239				      struct kernel_clone_args *args);
   240	#else
   241	static inline int arch_shstk_validate_clone(struct task_struct *p,
 > 242						    struct vm_area_struct *vma,
   243						    struct page *page,
   244						    struct kernel_clone_args *args)
   245	{
   246		return 0;
   247	}
   248	#endif
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
