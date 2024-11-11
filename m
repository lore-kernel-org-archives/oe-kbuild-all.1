Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4528018E1F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 08:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731312235; cv=none; b=kxpaGPuZTbvSkpAAbg3D3dLpLnIMLxyLO+n0FY8RUZFVIhqgF3Ea8BCNJ1oTOVgZfZIC6o6Cv1fHNf58SOq4L9Bj1UxSB0o45VErUmi3bbfeXC2ZBmEyFxUkl1i01VBAwLHjvpld+AxfopD+WWFJHGcSG/GDuCtRX10zhhQqLc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731312235; c=relaxed/simple;
	bh=Kevjc30jbqG01uV06gIjOBkUvdpkmEOhpz+LOwSchbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OCfKPifvrs/mFyKKL7OGbJsrqqh5jaa2/3BJfZFtXEvxUw6t+l8ST+uo2goc0gOC3pZmzkLnYI+EZ5IBuWDUC55LqEWXM72SxyG5C3fVHxVRxYoiBaYszUpx9OSdK6+kRvfWuGE4JOOd5qLR346YDZ4FXApg7hQBibV4tYMxfDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BjWacl/F; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BjWacl/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731312234; x=1762848234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kevjc30jbqG01uV06gIjOBkUvdpkmEOhpz+LOwSchbk=;
  b=BjWacl/FyVf3aqmHFhqwRoivLNZOwPtIsakUWMfW9cNCapi4OC8qPtsU
   ynGvaG38J0Aj3l0NNLW2jbeM1ccmX6ljMVTkhgMsF/ynM4H2i6Tp1mvQ8
   M/QL60fkK1e66jWUd5KISRnXM3nMm9Hv8Q9/WBgaGA6+yuKeGCWjto5hk
   yiFmhZ5bQQ+zogobkgUsIYuKTuRsGoU2Dt3/HFDdRWcdo40ZuahdhglSu
   YVAT/o1m2lCgXuJZTuxBDXzZCikxmjngvsYrM5BPJONmhPM7gxwHamU0m
   aFdlv98PP6F/StGwPH3HV4VyP4E9q2kY2BhjZ03UUc/uwrwyLcNAaMKwF
   A==;
X-CSE-ConnectionGUID: 7f6/k6IpTm+jyYMon88+Sw==
X-CSE-MsgGUID: CmA4qnA3QO2bLKgeQdZukQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30964344"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30964344"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:03:52 -0800
X-CSE-ConnectionGUID: WGBP6pfNS4mcO92pIpoj7g==
X-CSE-MsgGUID: v/wBNfyqSb219PTSquPsxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86549967"
Received: from lkp-server01.sh.intel.com (HELO dc8184e5aea1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2024 00:03:50 -0800
Received: from kbuild by dc8184e5aea1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAPOm-00006V-0H;
	Mon, 11 Nov 2024 08:03:48 +0000
Date: Mon, 11 Nov 2024 16:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2415/2415]
 arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r2'
 in asm
Message-ID: <202411111507.aqaGF8sw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andre,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a2a2cb652cf3f4686ab13778fb11f4591b5cfb17
commit: 78d8f4f7a298a5d259b2163121ea20b9e60e93f7 [2415/2415] arm64: Add support for SMCCC TRNG entropy source
config: arm64-randconfig-003-20241111 (https://download.01.org/0day-ci/archive/20241111/202411111507.aqaGF8sw-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241111/202411111507.aqaGF8sw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411111507.aqaGF8sw-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/Makefile:44: Detected assembler with broken .inst; disassembly will be unreliable
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
   arch/arm64/include/asm/stack_pointer.h:8:51: error: register 'sp' unsuitable for global register variables on this target
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
   In file included from arch/arm64/include/asm/processor.h:45:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:121:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
      20 |         arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_VERSION, &res);
         |         ^
   include/linux/arm-smccc.h:412:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     412 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     378 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:336:33: note: expanded from macro '__arm_smccc_1_1'
     336 |                 register unsigned long r0 asm("r0");                    \
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
   In file included from arch/arm64/include/asm/processor.h:45:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:121:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:412:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     412 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     378 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:337:33: note: expanded from macro '__arm_smccc_1_1'
     337 |                 register unsigned long r1 asm("r1");                    \
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
   In file included from arch/arm64/include/asm/processor.h:45:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:121:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:412:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     412 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     378 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:338:33: note: expanded from macro '__arm_smccc_1_1'
     338 |                 register unsigned long r2 asm("r2");                    \
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
   In file included from arch/arm64/include/asm/processor.h:45:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:121:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:412:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     412 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     378 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:339:33: note: expanded from macro '__arm_smccc_1_1'
     339 |                 register unsigned long r3 asm("r3");                    \
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
   In file included from arch/arm64/include/asm/processor.h:45:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:121:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:412:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     412 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     378 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:340:3: note: expanded from macro '__arm_smccc_1_1'
     340 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:321:37: note: expanded from macro '___declare_args'
     321 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:168:1: note: expanded from here
     168 | __declare_arg_0
         | ^
   include/linux/arm-smccc.h:275:34: note: expanded from macro '__declare_arg_0'
     275 |         register unsigned long arg0 asm("r0") = (u32)a0
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
   In file included from arch/arm64/include/asm/processor.h:45:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:121:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:415:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     415 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:362:32: note: expanded from macro 'arm_smccc_1_1_smc'
     362 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:336:33: note: expanded from macro '__arm_smccc_1_1'
     336 |                 register unsigned long r0 asm("r0");                    \
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
   In file included from arch/arm64/include/asm/processor.h:45:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:121:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:415:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     415 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:362:32: note: expanded from macro 'arm_smccc_1_1_smc'
     362 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:337:33: note: expanded from macro '__arm_smccc_1_1'
     337 |                 register unsigned long r1 asm("r1");                    \
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
   In file included from arch/arm64/include/asm/processor.h:45:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:121:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:415:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     415 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:362:32: note: expanded from macro 'arm_smccc_1_1_smc'
     362 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:338:33: note: expanded from macro '__arm_smccc_1_1'
     338 |                 register unsigned long r2 asm("r2");                    \
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
   In file included from arch/arm64/include/asm/processor.h:45:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:121:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:415:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     415 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:362:32: note: expanded from macro 'arm_smccc_1_1_smc'
     362 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:339:33: note: expanded from macro '__arm_smccc_1_1'
     339 |                 register unsigned long r3 asm("r3");                    \
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
   In file included from arch/arm64/include/asm/processor.h:45:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:121:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:415:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     415 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:362:32: note: expanded from macro 'arm_smccc_1_1_smc'
     362 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:340:3: note: expanded from macro '__arm_smccc_1_1'
     340 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:321:37: note: expanded from macro '___declare_args'
     321 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:170:1: note: expanded from here
     170 | __declare_arg_0
         | ^
   include/linux/arm-smccc.h:275:34: note: expanded from macro '__declare_arg_0'
     275 |         register unsigned long arg0 asm("r0") = (u32)a0
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
   In file included from arch/arm64/include/asm/processor.h:45:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:121:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:418:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     418 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:387:3: note: expanded from macro '__fail_smccc_1_1'
     387 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   include/linux/arm-smccc.h:322:37: note: expanded from macro '__declare_args'
     322 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^
   include/linux/arm-smccc.h:321:37: note: expanded from macro '___declare_args'
     321 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:172:1: note: expanded from here
     172 | __declare_arg_0
         | ^
   include/linux/arm-smccc.h:275:34: note: expanded from macro '__declare_arg_0'
     275 |         register unsigned long arg0 asm("r0") = (u32)a0
         |                                         ^


vim +/r2 +20 arch/arm64/include/asm/archrandom.h

    15	
    16	static inline bool __init smccc_probe_trng(void)
    17	{
    18		struct arm_smccc_res res;
    19	
  > 20		arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_VERSION, &res);
    21		if ((s32)res.a0 < 0)
    22			return false;
    23	
    24		return res.a0 >= ARM_SMCCC_TRNG_MIN_VERSION;
    25	}
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
