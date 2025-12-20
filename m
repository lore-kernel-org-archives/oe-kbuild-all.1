Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE7C2C2372
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766243479; cv=none; b=EPKMM91joLvkScmaWoOzTektxCo7T0mNgo1fUpkxdJaUuSvfcnB3HVFf6nIAAgDzdT6/rNWvouLmmZGPysGnVUA179E8Xcwk8oFssO7L296XJoapWuVHEpMKHXaVlflKbs6NKYkjhVZR3FgPCahGtILyVLV8nKB7Ewg3eCqWM34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766243479; c=relaxed/simple;
	bh=EdVNyse5+4byI7Y26lQ5PDHA0GlAGAx778WmbUZEJks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aM+xoeM4A92c952942FC33MfgrWdSxcA8B/dMxzOZWjBgfMQ1K/WPavM0rZJoIlx3fWgt3SxU3IAuZXeyCMwIKjmP2C2nSEPbz15ksUs/plOcpKHyj1DgxHvTyuTRcT2M8zd5MXMpxtA7se+vLD/Swt+Iy12XmCkLq5lrKSArc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epqPDqOz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epqPDqOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766243478; x=1797779478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EdVNyse5+4byI7Y26lQ5PDHA0GlAGAx778WmbUZEJks=;
  b=epqPDqOz1i9C4nUjVYLffdseFZ69HNx/+desXVQZJV50ochZvrcQehZC
   FkeVWz+3/0yxavwhCCrM2aBDRmS1yBv1TyNgjeyyKJhUdBec4lK2NzLFB
   dd2sI3H5/iFjH9NiB1/TfDYJrqsZrlhJo8oxvldU12dwsvGC6Jgc9VkXf
   TOnZuox4v0IZ+vVB0qFItz6tQp1+osYSwvyUahiSbOdnCMeVWUoMuxJbj
   gOHg5ln0iQL+iFltmgSaiekgJqhaxVTrsABdDCuunnQMRfcH94NlCnmhn
   pa72En/Fbyz+7YYX/AJFCR+a5dVSgXy38rSWcLhmOvPrDxAuycXqYdgOA
   w==;
X-CSE-ConnectionGUID: BArUo0edTteoQfZXGyBJ0w==
X-CSE-MsgGUID: 205jgrmURDOtQzvwrm31Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68255136"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68255136"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:11:14 -0800
X-CSE-ConnectionGUID: 45ShcuFpS0ePBF5QGXGK5A==
X-CSE-MsgGUID: 4GoVFH7aSnGvXpHvFDzRmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199103075"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2025 07:11:13 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWybu-000000004it-19O1;
	Sat, 20 Dec 2025 15:11:10 +0000
Date: Sat, 20 Dec 2025 23:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3418/3418]
 arch/arm64/include/asm/stack_pointer.h:8:51: error: register 'sp' unsuitable
 for global register variables on this target
Message-ID: <202512210112.1in1n759-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: 68ee705da160d123656dcbf9ebd449fb77b54bc0 [3418/3418] scripts: kernel-doc: Fix syntax error due to undeclared args variable
config: arm64-randconfig-002-20251217 (https://download.01.org/0day-ci/archive/20251221/202512210112.1in1n759-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210112.1in1n759-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210112.1in1n759-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/Makefile:44: Detected assembler with broken .inst; disassembly will be unreliable
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:17:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:102:
   In file included from include/linux/preempt.h:78:
   In file included from arch/arm64/include/asm/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/thread_bits.h:32:
   In file included from arch/arm64/include/asm/thread_info.h:18:
>> arch/arm64/include/asm/stack_pointer.h:8:51: error: register 'sp' unsuitable for global register variables on this target
       8 | register unsigned long current_stack_pointer asm ("sp");
         |                                                   ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
      20 |         arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_VERSION, &res);
         |         ^
   include/linux/arm-smccc.h:487:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     487 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:453:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     453 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:410:33: note: expanded from macro '__arm_smccc_1_1'
     410 |                 register unsigned long r0 asm("r0");                    \
         |                                               ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:487:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     487 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:453:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     453 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:411:33: note: expanded from macro '__arm_smccc_1_1'
     411 |                 register unsigned long r1 asm("r1");                    \
         |                                               ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:487:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     487 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:453:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     453 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:412:33: note: expanded from macro '__arm_smccc_1_1'
     412 |                 register unsigned long r2 asm("r2");                    \
         |                                               ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:487:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     487 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:453:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     453 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:413:33: note: expanded from macro '__arm_smccc_1_1'
     413 |                 register unsigned long r3 asm("r3");                    \
         |                                               ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:487:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     487 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:453:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     453 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:414:3: note: expanded from macro '__arm_smccc_1_1'
     414 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:395:37: note: expanded from macro '___declare_args'
     395 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:13:1: note: expanded from here
      13 | __declare_arg_0
         | ^
   include/linux/arm-smccc.h:349:34: note: expanded from macro '__declare_arg_0'
     349 |         register unsigned long arg0 asm("r0") = (u32)a0
         |                                         ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:490:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     490 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:437:32: note: expanded from macro 'arm_smccc_1_1_smc'
     437 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:410:33: note: expanded from macro '__arm_smccc_1_1'
     410 |                 register unsigned long r0 asm("r0");                    \
         |                                               ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:490:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     490 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:437:32: note: expanded from macro 'arm_smccc_1_1_smc'
     437 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:411:33: note: expanded from macro '__arm_smccc_1_1'
     411 |                 register unsigned long r1 asm("r1");                    \
         |                                               ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:490:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     490 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:437:32: note: expanded from macro 'arm_smccc_1_1_smc'
     437 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:412:33: note: expanded from macro '__arm_smccc_1_1'
     412 |                 register unsigned long r2 asm("r2");                    \
         |                                               ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:490:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     490 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:437:32: note: expanded from macro 'arm_smccc_1_1_smc'
     437 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:413:33: note: expanded from macro '__arm_smccc_1_1'
     413 |                 register unsigned long r3 asm("r3");                    \
         |                                               ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:490:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     490 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:437:32: note: expanded from macro 'arm_smccc_1_1_smc'
     437 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:414:3: note: expanded from macro '__arm_smccc_1_1'
     414 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:395:37: note: expanded from macro '___declare_args'
     395 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:15:1: note: expanded from here
      15 | __declare_arg_0
         | ^
   include/linux/arm-smccc.h:349:34: note: expanded from macro '__declare_arg_0'
     349 |         register unsigned long arg0 asm("r0") = (u32)a0
         |                                         ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:493:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     493 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:462:3: note: expanded from macro '__fail_smccc_1_1'
     462 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   include/linux/arm-smccc.h:396:37: note: expanded from macro '__declare_args'
     396 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^
   include/linux/arm-smccc.h:395:37: note: expanded from macro '___declare_args'
     395 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:17:1: note: expanded from here
      17 | __declare_arg_0
         | ^
   include/linux/arm-smccc.h:349:34: note: expanded from macro '__declare_arg_0'
     349 |         register unsigned long arg0 asm("r0") = (u32)a0
         |                                         ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r0' in asm
      66 |                 arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, 64, &res);
         |                 ^
   include/linux/arm-smccc.h:487:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     487 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:453:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     453 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:410:33: note: expanded from macro '__arm_smccc_1_1'
     410 |                 register unsigned long r0 asm("r0");                    \
         |                                               ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:487:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     487 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:453:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     453 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:411:33: note: expanded from macro '__arm_smccc_1_1'
     411 |                 register unsigned long r1 asm("r1");                    \
         |                                               ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:487:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     487 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:453:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     453 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:412:33: note: expanded from macro '__arm_smccc_1_1'
     412 |                 register unsigned long r2 asm("r2");                    \
         |                                               ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:


vim +/sp +8 arch/arm64/include/asm/stack_pointer.h

a9ea0017ebe888 Mark Rutland 2016-11-03  4  
a9ea0017ebe888 Mark Rutland 2016-11-03  5  /*
a9ea0017ebe888 Mark Rutland 2016-11-03  6   * how to get the current stack pointer from C
a9ea0017ebe888 Mark Rutland 2016-11-03  7   */
a9ea0017ebe888 Mark Rutland 2016-11-03 @8  register unsigned long current_stack_pointer asm ("sp");
a9ea0017ebe888 Mark Rutland 2016-11-03  9  

:::::: The code at line 8 was first introduced by commit
:::::: a9ea0017ebe8889dfa136cac2aa7ae0ee6915e1f arm64: factor out current_stack_pointer

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
