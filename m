Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FEC25D1FC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 21:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746827828; cv=none; b=uJHYZTecWprJggHKnb9QOnjsePWXE8gV1un4aQBFfdqrmn1IRLnGOQO8S+h1barGY4f4Vxwh7gZ0luWdw332DPU728sc0PfsmF+pnlQoDORFqa6KlviT32ntMZS8XxSLVAl65Hz7ZuRpzoE71AkzBP13izz2wV5DZ+B+JSlEdHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746827828; c=relaxed/simple;
	bh=Dqr3cA/Y0UDTawo2SjEOBvAiC71pua89oTUvG8HuZ2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPeJFJRYXEpqHg4P//fxvH9oB5EnNSjktmFw881hzMBIrPsX63sYqCCBD2qrhT0xM6XVYXNqLfWyF8TSSoNDHcniRoOBPSpiPmE/OhzjXaHdQnXOtMgZq2hGb9mVIbgxqd3vmLl3jprH04LSMFMK+2odEL6ywoWQSPEoEMGyBn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dl4sVdvx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dl4sVdvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746827826; x=1778363826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dqr3cA/Y0UDTawo2SjEOBvAiC71pua89oTUvG8HuZ2g=;
  b=dl4sVdvx386C6SIMOEzkrfv1uzWCsWIfg2Nbe0kQn3kCOZ0qn6eLG+Cq
   /TWQ90nbYLiMmeRDw/wKfIJSHi6VqHel70lvozLXvy4Q/RiOSb8yCyrWm
   4gRVFV2r3XtOJWSR3fw2+ngNKVaquCmTAwUtPednFs7UQJ1z4jJGO7wre
   IgMWdb2X/aGFWSCCMOF85Ws3coXkp2HtFKLm9gUuHUV3cGkSA5OwbJuFY
   dbVA92WvUhXJnby16cf80YPF9XVFc+nSqze5Ljldc6Y8DsRTgaazxiA/K
   m+BUtI9x5U4S9RWdAUnNKugTmmKf93umU0+/4vS9ZTu4/H6XLPaOT48pz
   g==;
X-CSE-ConnectionGUID: ilH4Ml0NRkSykt4OGam1ZQ==
X-CSE-MsgGUID: j4IJ0ursR3qUDPalXNWB3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="60015489"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="60015489"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 14:57:05 -0700
X-CSE-ConnectionGUID: P5Cy0sxYTByiQjmc/4wXgQ==
X-CSE-MsgGUID: Hutvr3TTR1G7ihjTjv0NAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137723051"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 May 2025 14:57:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDViG-000CWT-14;
	Fri, 09 May 2025 21:57:00 +0000
Date: Sat, 10 May 2025 05:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:Juergen 4/7]
 arch/x86/include/asm/paravirt.h:182:2: error: invalid operands to binary
 expression ('struct paravirt_callee_save' and 'void *')
Message-ID: <202505100516.9fRxqFcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git Juergen
head:   0c14b6cca96e7b20677eff2b98447836d36dc8d5
commit: 3a95572e70e9e1d562968e6075f8748cff1f1bbf [4/7] Juergen
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250510/202505100516.9fRxqFcZ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100516.9fRxqFcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100516.9fRxqFcZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:102:
>> arch/x86/include/asm/paravirt.h:182:2: error: invalid operands to binary expression ('struct paravirt_callee_save' and 'void *')
     182 |         PVOP_TEST_NULL(cpu.read_msr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:366:45: note: expanded from macro 'PVOP_TEST_NULL'
     366 | #define PVOP_TEST_NULL(op)      BUG_ON(pv_ops.op == NULL)
         |                                 ~~~~~~~~~~~~~~~~~^~~~~~~~
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:102:
   arch/x86/include/asm/paravirt.h:196:2: error: invalid operands to binary expression ('struct paravirt_callee_save' and 'void *')
     196 |         PVOP_TEST_NULL(cpu.write_msr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:366:45: note: expanded from macro 'PVOP_TEST_NULL'
     366 | #define PVOP_TEST_NULL(op)      BUG_ON(pv_ops.op == NULL)
         |                                 ~~~~~~~~~~~~~~~~~^~~~~~~~
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:102:
   arch/x86/include/asm/paravirt.h:213:2: error: invalid operands to binary expression ('struct paravirt_callee_save' and 'void *')
     213 |         PVOP_TEST_NULL(cpu.read_msr_safe);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:366:45: note: expanded from macro 'PVOP_TEST_NULL'
     366 | #define PVOP_TEST_NULL(op)      BUG_ON(pv_ops.op == NULL)
         |                                 ~~~~~~~~~~~~~~~~~^~~~~~~~
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:102:
   arch/x86/include/asm/paravirt.h:232:2: error: invalid operands to binary expression ('struct paravirt_callee_save' and 'void *')
     232 |         PVOP_TEST_NULL(cpu.write_msr_safe);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:366:45: note: expanded from macro 'PVOP_TEST_NULL'
     366 | #define PVOP_TEST_NULL(op)      BUG_ON(pv_ops.op == NULL)
         |                                 ~~~~~~~~~~~~~~~~~^~~~~~~~
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here


vim +182 arch/x86/include/asm/paravirt.h

   177	
   178	static __always_inline u64 paravirt_read_msr(u32 msr)
   179	{
   180		EAX_EDX_DECLARE_ARGS(val, low, high);
   181	
 > 182		PVOP_TEST_NULL(cpu.read_msr);
   183		asm volatile("1: "ALTERNATIVE_2(PARAVIRT_CALL,
   184						"rdmsr", ALT_NOT_XEN,
   185						ALT_CALL_INSTR, ALT_XENPV_CALL)
   186			     "2:\n"
   187			     _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_RDMSR)
   188			     : EAX_EDX_RET(val, low, high), ASM_CALL_CONSTRAINT
   189			     : paravirt_ptr(cpu.read_msr), "c" (msr));
   190	
   191		return EAX_EDX_VAL(val, low, high);
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
