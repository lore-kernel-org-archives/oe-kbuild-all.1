Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE63418D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 00:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745110122; cv=none; b=CWRbiHUe4N5Bx0BRgOzw1T8td9dbpJRK38n+f0wwwWgDFCAdJ57Uz69xUd43wZNNMgmsHqpHlCDC+SY27oZfpWuKYpJAgJWiUg98qLVokf776+TQFUpFZhrzfyPewPcAYXXmKL91Wumy6aJzUHtpD8Ba70K5M07r9YHPX0yU6Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745110122; c=relaxed/simple;
	bh=BadxagcZYH9ky0ywgZDwnlnThLDM+djDQ+6B/Ub3CB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a/6tu9Q7gkBgmmTogJMewyoCHM+M6eWw05VKPncxkOo7CYo09h0OA2hA0zs1vejq/4H1X3n06fOEbvkTzijMsSKMu0H5Bh5hJu0qi+/DNyL7S2A32Dv9IWxlAzrNngpbPIqeeS9efyBz3RlvkoMKLow5yPwwQT8hQVVtkaHIMGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EdLJez/e; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdLJez/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745110120; x=1776646120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BadxagcZYH9ky0ywgZDwnlnThLDM+djDQ+6B/Ub3CB0=;
  b=EdLJez/eYJ7mtqod9zQbyjYHKs/jaEtn7tKgVtIqF9FZTvhB8f9U1uGj
   ZV6YaXi3niIACmXup08gszWtKh2eEm/GWLSQlQt7xhxHKNIlSFfxQMMfN
   bFhjDW055mD6Lz3qlnKqI406hIcK3OreglnbP3fGcllmrcgxT+yPFYOZd
   g5Y9sz52AZoMvJcR/J2iruSY+J0JWcwaLqO73LLZ6oG0NgqIBrYhTFCx+
   yZRG6P9abejGT19frK9l+8T9feSAltQJkhwGqBTNUodOaXnhLaj3AwL41
   5c01ioynZK/1CHL6XZpHnK3Z170Z0Emvh0HJSjQBJs4z3oox/APbmDmea
   A==;
X-CSE-ConnectionGUID: b1te1QshQUGGjDZm8722UQ==
X-CSE-MsgGUID: Hz3ZHDbqS8iZBF3eUumaKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="50355266"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="50355266"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 17:48:39 -0700
X-CSE-ConnectionGUID: PmUbsbtsSbOxu7XbJG+x9w==
X-CSE-MsgGUID: sVG5XZRmShmjcKzObpJKVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136377921"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Apr 2025 17:48:38 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6IrL-0004Ij-1f;
	Sun, 20 Apr 2025 00:48:35 +0000
Date: Sun, 20 Apr 2025 08:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 22/33]
 arch/x86/include/asm/msr.h:317:11: error: call to undeclared function
 '__xenpv_rdmsr'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202504200814.Vu4GOb5z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   168ed74cc0471e1a72488e1e6f484a25c5304202
commit: 0a5b87b9b78d624da224d305455e6a155c0da1be [22/33] x86/msr: Use the alternatives mechanism to read MSR
config: x86_64-buildonly-randconfig-001-20250420 (https://download.01.org/0day-ci/archive/20250420/202504200814.Vu4GOb5z-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200814.Vu4GOb5z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200814.Vu4GOb5z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:14:
   In file included from arch/x86/include/asm/fsgsbase.h:9:
   arch/x86/include/asm/msr.h:312:37: error: call to undeclared function 'get_pv_msr_action'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     312 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                                   ^
   arch/x86/include/asm/msr.h:312:28: error: variable has incomplete type 'const enum pv_msr_action'
     312 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                          ^
   arch/x86/include/asm/msr.h:312:14: note: forward declaration of 'enum pv_msr_action'
     312 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                            ^
   arch/x86/include/asm/msr.h:314:17: error: use of undeclared identifier 'PV_MSR_IGNORE'
     314 |                 if (action == PV_MSR_IGNORE)
         |                               ^
>> arch/x86/include/asm/msr.h:317:11: error: call to undeclared function '__xenpv_rdmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     317 |                         return __xenpv_rdmsr(msr, val, type);
         |                                ^
   arch/x86/include/asm/msr.h:523:37: error: call to undeclared function 'get_pv_msr_action'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     523 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                                   ^
   arch/x86/include/asm/msr.h:523:28: error: variable has incomplete type 'const enum pv_msr_action'
     523 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                          ^
   arch/x86/include/asm/msr.h:523:14: note: forward declaration of 'enum pv_msr_action'
     523 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                            ^
   arch/x86/include/asm/msr.h:525:17: error: use of undeclared identifier 'PV_MSR_IGNORE'
     525 |                 if (action == PV_MSR_IGNORE)
         |                               ^
   arch/x86/include/asm/msr.h:528:11: error: call to undeclared function '__xenpv_wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     528 |                         return __xenpv_wrmsr(msr, val, type);
         |                                ^
   arch/x86/include/asm/msr.h:572:10: error: call to undeclared function 'xen_read_pmc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     572 |                 return xen_read_pmc(counter);
         |                        ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:


vim +/__xenpv_rdmsr +317 arch/x86/include/asm/msr.h

   307	
   308	static __always_inline bool __rdmsr(u32 msr, u64 *val, int type)
   309	{
   310		/* When built with CONFIG_XEN_PV and running on Xen hypervisor. */
   311		if (cpu_feature_enabled(X86_FEATURE_XENPV)) {
   312			const enum pv_msr_action action = get_pv_msr_action(msr);
   313	
   314			if (action == PV_MSR_IGNORE)
   315				return false;
   316			else
 > 317				return __xenpv_rdmsr(msr, val, type);
   318		} else {
   319			/*
   320			 * 1) When built with !CONFIG_XEN_PV.
   321			 * 2) When built with CONFIG_XEN_PV but not running on Xen hypervisor.
   322			 */
   323			bool ret = __native_rdmsr(msr, val, type);
   324	
   325			if (tracepoint_enabled(read_msr))
   326				do_trace_read_msr(msr, *val, ret ? -EIO : 0);
   327	
   328			return ret;
   329		}
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
