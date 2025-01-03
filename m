Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40561F9F76
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 11:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735905182; cv=none; b=rWQ14fctOxTVwLQ0slbocOTQs0kVvSL4Hc6cStDvBI9aisGk0MDconWqXJhAEw0AJYsxoNURwD16TPMyFa+taOzvjyXTcMKt2bMw6NLExDcK9MlefZXubHtBM80sbIZrJxN8TwYbW7MsMOSZ8hWL+72aPhLzhPGeTYA0nqkJpi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735905182; c=relaxed/simple;
	bh=Sn1vxpMU94orCBrl4wjddSE/NhotxWL4K0PdR77ANjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fyoq31c2vUZ6K/AJxs0MbYn2FZgoKlq7EOWp8I602mh+87aMoUVr6PgDi0jR1KlxzoJ/Nnn8TIM7URdF13M4ON2+uTfFZwSk5HgkvjwCXNPV7sG7l+RvWzXP9E9I9GScIPvDmMOLeWzcYVj1F7FmtOQjILVZAtqJwf3QdL9MPlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hc9HD6mV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hc9HD6mV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735905181; x=1767441181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sn1vxpMU94orCBrl4wjddSE/NhotxWL4K0PdR77ANjw=;
  b=hc9HD6mVbJIL2QXqr0BcjAHndPVfe0+N/xkubyHf2cvX/ywgXn8HvkJ3
   RoWoVKE0OExoI6rLyoVq7iRvOAE6x6LYxtRdVRBAglsl0TUxNxql0GqwY
   SRCD7b0+F9r8EG9+V/ePXxQYix0YQLiHaHl4bKQ2sXFLSrqho7hBWa9A/
   PgX20cZKbUFQVAPGomXvsCLAlD61IpZmUlZh/5CYdzZLOM8F9ICd7Pdgr
   1UcN2w2CT2Bx1JwLPyIe6J3kBtXvMDSO3dhiy0devq68KfLlV+ZfIAftp
   GulqknokFFYxPgEZaLOymEgqo714C+htOseVUmaChvpiPFLIKiQR4Q9mD
   A==;
X-CSE-ConnectionGUID: 4OnAizQ+Rz+lvLezybV/xA==
X-CSE-MsgGUID: mh57XYQTQvi+QSdghFBMiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36058116"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36058116"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 03:53:00 -0800
X-CSE-ConnectionGUID: siaJxPlrQ/CmvBWRLU+DSA==
X-CSE-MsgGUID: ZTbvUFaGSfCM9u+3QeDNng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102278203"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jan 2025 03:52:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTgEb-0009h8-0J;
	Fri, 03 Jan 2025 11:52:57 +0000
Date: Fri, 3 Jan 2025 19:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 11/14]
 arch/x86/include/asm/msr.h:563:2: error: call to '__compiletime_assert_64'
 declared with 'error' attribute: BUILD_BUG_ON failed:
 __builtin_constant_p(msr)
Message-ID: <202501031933.1UqWrRkH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   c24dec61406e23e2e07e26232e233cf439295918
commit: e1a36c8372ac54e78b93de48e40c293ed20ee384 [11/14] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
config: i386-buildonly-randconfig-001-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031933.1UqWrRkH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031933.1UqWrRkH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031933.1UqWrRkH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/amd.c:4:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:76:
   In file included from arch/x86/include/asm/vdso.h:11:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:563:2: error: call to '__compiletime_assert_64' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_constant_p(msr)
     563 |         BUILD_BUG_ON(__builtin_constant_p(msr));
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:34:1: note: expanded from here
      34 | __compiletime_assert_64
         | ^
   1 error generated.


vim +563 arch/x86/include/asm/msr.h

   560	
   561	static __always_inline int __native_wrmsr_variable_safe(const u32 msr, const u64 val)
   562	{
 > 563		BUILD_BUG_ON(__builtin_constant_p(msr));
   564	
   565		asm_inline volatile goto(
   566			"1:\n"
   567			ALTERNATIVE("ds wrmsr",
   568				    INSN_WRMSRNS,
   569				    X86_FEATURE_WRMSRNS)
   570			EX_WRMSR_SAFE(1b, %l[badmsr])
   571			: : "a" ((u32)val), "d" ((u32)(val >> 32)), "c" (msr)
   572			: "memory"
   573			: badmsr);
   574		return 0;
   575	
   576	badmsr:
   577		return -EIO;
   578	}
   579	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
