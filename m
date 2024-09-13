Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529FEA23
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 02:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726195356; cv=none; b=H4NwKRONvHqgil+7qDBH6P14iNMR4j8ChMFie9ld//6MCgvmWcwyt/2YN8ruDNC55r4QAorw9J7LDLTCvbikqetiSH5qsT79HL3p2GqQYrfCEjWrCB5t2/Ial0jHbRQdlAtoUNcaOEPmhBYy2Esrvow4I4bU0HNVugv+clntkug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726195356; c=relaxed/simple;
	bh=D/MVnwelHErRMY1KcLgVd5H8po94wnCKpv2gSLgtM54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o497L93Ud0a8pMn90BjA/L/jkXTU3LYD1sGMNARyDZLQHwL4heUinbcne5qYtBn4LNxz49bi5IjU2r7CvYe9L8qMEfmXjYpeFAn/LSBN6SRM/czVB28z0IwLYFe53kKtmezHP+RD2ItPYd2XhlPLisOdpP5ujr6u6v8TRrWYfD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHTg7EEt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHTg7EEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726195354; x=1757731354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D/MVnwelHErRMY1KcLgVd5H8po94wnCKpv2gSLgtM54=;
  b=gHTg7EEtzxICNETcH8Zs27J+xeVvgSYvKrB1JjvAw958+qD1PAfoGI1u
   Rif9nba5zONXbuJIFajt12A15V9xgvft2E4B4GzacWiO6qTySLK9uR7qz
   nkn2vgg7n1h4Up02M4chKOdhavTe8TyI/U9YsC6RdneM82GPdAhnR84UO
   54GPSSe87Lq6oDIAv3SxaJ0KwpY0fxH+nIo/CXaYGbZQ3fwNY4grMkKRD
   h7MVQxUITU7mE7N0tOvXh+I/05AoD6AT4FVrDrz3iw7JH5I74HHaobZcQ
   n7KOpohrsrBe87zajonHJRB/ZyPiRa+jyRH46Y3PlzU63Slih1Hx94ddx
   A==;
X-CSE-ConnectionGUID: YAinibhWQIiBEJBQpeLLew==
X-CSE-MsgGUID: Sp73UcXXT7+ZZ4w66QEAjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28824506"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="28824506"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 19:42:33 -0700
X-CSE-ConnectionGUID: ssjNTV8QTxaTV7uWQ0iggg==
X-CSE-MsgGUID: yyEk6/ZaSDqSkABBVHUkrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="67624300"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Sep 2024 19:42:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sowGS-0005vo-2S;
	Fri, 13 Sep 2024 02:42:28 +0000
Date: Fri, 13 Sep 2024 10:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 4858/30000]
 arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0'
 in asm
Message-ID: <202409131014.4Rr9vQO0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8f53b22e47e98837db7830541a369ed0cd5df749
commit: 78d8f4f7a298a5d259b2163121ea20b9e60e93f7 [4858/30000] arm64: Add support for SMCCC TRNG entropy source
config: arm64-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131014.4Rr9vQO0-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131014.4Rr9vQO0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131014.4Rr9vQO0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/Makefile:44: Detected assembler with broken .inst; disassembly will be unreliable
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
   register unsigned long current_stack_pointer asm ("sp");
                                                     ^
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
           arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_VERSION, &res);
           ^
   include/linux/arm-smccc.h:412:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:336:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r0 asm("r0");                    \
                                                 ^
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:412:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:337:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r1 asm("r1");                    \
                                                 ^
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
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:338:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r2 asm("r2");                    \
                                                 ^
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
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:339:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r3 asm("r3");                    \
                                                 ^
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:412:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:340:3: note: expanded from macro '__arm_smccc_1_1'
                   __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:321:37: note: expanded from macro '___declare_args'
   #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
                                       ^
   <scratch space>:8:1: note: expanded from here
   __declare_arg_0
   ^
   include/linux/arm-smccc.h:275:34: note: expanded from macro '__declare_arg_0'
           register unsigned long arg0 asm("r0") = (u32)a0
                                           ^
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:415:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_smc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:362:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:336:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r0 asm("r0");                    \
                                                 ^
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:415:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_smc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:362:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:337:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r1 asm("r1");                    \
                                                 ^
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
                           arm_smccc_1_1_smc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:362:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:338:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r2 asm("r2");                    \
                                                 ^
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
                           arm_smccc_1_1_smc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:362:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:339:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r3 asm("r3");                    \
                                                 ^
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:415:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_smc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:362:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:340:3: note: expanded from macro '__arm_smccc_1_1'
                   __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:321:37: note: expanded from macro '___declare_args'
   #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
                                       ^
   <scratch space>:10:1: note: expanded from here
   __declare_arg_0
   ^
   include/linux/arm-smccc.h:275:34: note: expanded from macro '__declare_arg_0'
           register unsigned long arg0 asm("r0") = (u32)a0
                                           ^
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:418:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           __fail_smccc_1_1(__VA_ARGS__);                  \
                           ^
   include/linux/arm-smccc.h:387:3: note: expanded from macro '__fail_smccc_1_1'
                   __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
                   ^
   include/linux/arm-smccc.h:322:37: note: expanded from macro '__declare_args'
   #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
                                       ^
   include/linux/arm-smccc.h:321:37: note: expanded from macro '___declare_args'
   #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
                                       ^
   <scratch space>:12:1: note: expanded from here
   __declare_arg_0
   ^
   include/linux/arm-smccc.h:275:34: note: expanded from macro '__declare_arg_0'
           register unsigned long arg0 asm("r0") = (u32)a0
                                           ^
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
                   arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, 64, &res);
                   ^
   include/linux/arm-smccc.h:412:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:336:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r0 asm("r0");                    \
                                                 ^
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
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:412:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:337:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r1 asm("r1");                    \
                                                 ^
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
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:412:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:378:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:338:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r2 asm("r2");                    \
                                                 ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:


vim +/r0 +20 arch/arm64/include/asm/archrandom.h

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
