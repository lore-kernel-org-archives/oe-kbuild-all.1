Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1181F892E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 21:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735334808; cv=none; b=cDptRQBEUY4q9j6P6OrN/Z//Yqrn3YDdgTGIJotTd8gV8I2i0P8Qk/LWkQRfq2LA/+t7eRW8bFPUnyG2EyetAGfDOdBWpRmJeGTXrYQfzNGn7XkrhVKyGjADJmFJ7YHH4HDmFuPEVxcMjiQc5pCxoAUmoVVp3YyXnmLC144UZMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735334808; c=relaxed/simple;
	bh=1JX9G+5R5/UppiKC09ROmAXPE3Sd9vcikeL7rDlQUIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TrlLBUURySO9BCX+1mTKet1ogxv91WCeHdKPGT1MLqCFaG+awg1bwcGlko9G4AmK6oxq+1LSFKvOKriXdxvXs+DurWGlCGFJv0zFRuDeOYWWntaA3dJ0ipMo+QhCjLefmHzSwCf9EYID0bDKUXxn1onZ0VaO/++QRZIqVaxA5PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAdxiEZt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAdxiEZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735334807; x=1766870807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1JX9G+5R5/UppiKC09ROmAXPE3Sd9vcikeL7rDlQUIU=;
  b=VAdxiEZt0qKDcnEkejqH5ND8rTE1o2NGmD57OcSPJKuO0YRCrTOMpPGI
   SbjfjK39qbajT3rISiRjUGkHvNkmOzcB507m+o0vj+x8o7SQMlPOi+h+B
   J+XSbkqFoR50DmHlPaWJ2Wriu01Sa+YriVXq5lQkoi/DVA8AhPz8MugMg
   C+qT8nRXGoKONIV0nPtA9IDvSrtZeEDpbc8dVHyk4/BWL6rASESBUhknD
   3y6Njcn3oK8CjDcQdKDgREE5LwmGfCbjHkSPSLTKpX4vAD+9NCFOzBDJY
   F1DUkOmq1V4tRYwPTj948aMEAcgmphqY+2ktFOgN0UOQSePJXh+puGEAD
   w==;
X-CSE-ConnectionGUID: 7wXdr2TARX6+tLKIsGfRkw==
X-CSE-MsgGUID: oLfXgF84Tl2QHOKLsqf38A==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="53131759"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="53131759"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 13:26:47 -0800
X-CSE-ConnectionGUID: 96xqPN3ARCiCFRLrro5gYA==
X-CSE-MsgGUID: bqJ1DPvCTVqnWhcXZTgTGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105247778"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Dec 2024 13:26:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRHr1-0003dW-0j;
	Fri, 27 Dec 2024 21:26:43 +0000
Date: Sat, 28 Dec 2024 05:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 13/13]
 arch/x86/include/asm/msr.h:240:2: warning: '__cold__' attribute only applies
 to functions
Message-ID: <202412280544.SaD1iRhc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   04e87989806be09036718fa57acd80ea138c2319
commit: 04e87989806be09036718fa57acd80ea138c2319 [13/13] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241228/202412280544.SaD1iRhc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280544.SaD1iRhc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280544.SaD1iRhc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
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
>> arch/x86/include/asm/msr.h:240:2: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
     240 |         __cold;
         |         ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
     113 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
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
   arch/x86/include/asm/msr.h:278:2: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
     278 |         __cold;
         |         ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
     113 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
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
   arch/x86/include/asm/msr.h:313:2: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
     313 |         __cold;
         |         ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
     113 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
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
   arch/x86/include/asm/msr.h:345:2: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
     345 |         __cold;
         |         ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
     113 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
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
   arch/x86/include/asm/msr.h:568:2: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
     568 |         __cold;
         |         ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
     113 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:


vim +/__cold__ +240 arch/x86/include/asm/msr.h

   218	
   219	/*
   220	 * XXX: is ASM_CALL_CONSTRAINT compatible with asm goto?  Perhaps "memory"
   221	 * takes care of the problem without it?
   222	 */
   223	
   224	static __always_inline int __native_rdmsr_variable_safe(const u32 msr, u64 *val)
   225	{
   226	#ifdef CONFIG_X86_64
   227		BUILD_BUG_ON(__builtin_constant_p(msr));
   228	
   229		asm_inline volatile goto(
   230			"1:\n"
   231			RDMSR_AND_SAVE_RESULT
   232			EX_RDMSR_SAFE(1b, %l[badmsr])	/* For RDMSR */
   233			: [val] "=a" (*val)
   234			: "c" (msr)
   235			: "memory", "rdx"
   236			: badmsr);
   237		return 0;
   238	
   239	badmsr:
 > 240		__cold;
   241		return -EIO;
   242	#else
   243		int err = 0;
   244	
   245		asm_inline volatile(
   246			"1: rdmsr\n\t"
   247			"xor %[err], %[err]\n\t"
   248			"2:\n\t"
   249			_ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %[err])
   250			: [err] "=r" (err), "=A" (val)
   251			: "c" (msr));
   252	
   253		return err;
   254	#endif
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
