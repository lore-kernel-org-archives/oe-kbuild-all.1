Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6CB2F36
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 16:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729961633; cv=none; b=TxAmqBH1SVl3Z8GOjXof9YmZS2WA1ovN3M2J3TcU4MZkEjfBAADMtNazD1NTsND6P/VPu0DdbxuiKFvY8M1PHQbM2/3As2Oq0jp6T3PQEghpd/BJ0QdKi0RKKc2s/fr08J/n522FJGlURDdl/ZGu5BtSS4yRyS56cnetNUSt0jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729961633; c=relaxed/simple;
	bh=SPVTkN3NctX6AJYZsLWm973NJEwD9LajMbcJzo8dYZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=boFyec4oeB6+48+hR2uCvBbJuuq/XT6w8kX5Y1cPaEke45dCQPm0jiN01+zIkB2G1Ev3P+GDd2XoDagPNYF7ZWSIERLWv/tO1bDEo8Wa9QFr9TFW/fBNuZ0iVST+LKtoCwjmN2nkq9aLdvGCz/VMHU5aX2H8IZ/lxuUhd+i0qdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbMa/hOb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbMa/hOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729961630; x=1761497630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SPVTkN3NctX6AJYZsLWm973NJEwD9LajMbcJzo8dYZA=;
  b=UbMa/hObsbo88mk+JO0jIGuiCV4CJqXu3xqcWBQkgb7HqN/+xBSjiFln
   YPk3yHPILk7OBPHczt7ZTKFycPPhbK9gAzearE0MhUdjgqcX2qNNDFNEM
   +WKTHCD+YrSv6dw2Vx4+GI5Dp59iWNdlpLdgjpHQAmcUDOBxoQTsrbLDH
   3TLj6kBSae7NGl+IUD6VJZ7JPy+Mwt9vDxI3mFyFTuYR5NLQPmLfp/3Ui
   p/O/8MA6EbxL+xKXoueCLmjKtTBqG8ur2N3CKSlksTzdVxujmcxs8yEL0
   JFQpPDeJNaQ3EQ405bX5WrbvfMfLZobpECPskSDQ16jz0OWCe/325c0sm
   w==;
X-CSE-ConnectionGUID: gKSZqWRGT3imrUT7Hx1mOg==
X-CSE-MsgGUID: rkdcgt5XQ0eon2v8bZgWrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="40196447"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="40196447"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 09:53:15 -0700
X-CSE-ConnectionGUID: SO+71QIvTQyq1RhryQdmKQ==
X-CSE-MsgGUID: IqXafwLvT7ijzEdNsPOEFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="81324433"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Oct 2024 09:53:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4k2J-000Zra-0V;
	Sat, 26 Oct 2024 16:53:11 +0000
Date: Sun, 27 Oct 2024 00:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 4155/30000]
 arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r2'
 in asm
Message-ID: <202410270055.nuIJoCrv-lkp@intel.com>
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
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: 78d8f4f7a298a5d259b2163121ea20b9e60e93f7 [4155/30000] arm64: Add support for SMCCC TRNG entropy source
config: arm64-randconfig-003-20241026 (https://download.01.org/0day-ci/archive/20241027/202410270055.nuIJoCrv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270055.nuIJoCrv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270055.nuIJoCrv-lkp@intel.com/

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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r3' in asm
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
   <scratch space>:222:1: note: expanded from here
     222 | __declare_arg_0
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r3' in asm
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
   <scratch space>:224:1: note: expanded from here
     224 | __declare_arg_0
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
   <scratch space>:226:1: note: expanded from here
     226 | __declare_arg_0
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
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r0' in asm
      66 |                 arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, 64, &res);
         |                 ^
   include/linux/arm-smccc.h:412:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     412 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     378 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:336:33: note: expanded from macro '__arm_smccc_1_1'


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
