Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B1F23D2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 00:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728434422; cv=none; b=b5ausEKsWwIDrJBJIB76QtVTnVwqFz3aorbUCjaXeR7RsI8V4Jh1jQ6upMlyfWU5jbMLFN4xTPAmrRSREEDiCPM3TLjopsxb7TP9H2nt8SRVoHfVrOmuT0aQUkYaRGAXPYYDhcIGEzcsT2MD5CdNoy0bNRTYL5DLa6ZFvUeTQ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728434422; c=relaxed/simple;
	bh=pcCTUm9jQAZ4yFwTuiGkrXtV9+bj8LxjJNt0pL1brMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HelMQ4xoHHgss2RN83gaGLmB4zP8gurZGNW+bLBYueTcw8OwxfdWiC0GTpNiUY9y4VnXkzuEAQfkPRIK8R0fJMIRjmLT0Sw1fMGYNlIoqweCJ8cgr55aK4MIyd0vHGKJMJN0EmQLnXRGFq/SH2A8O8i1LKH513gxGYGBAnMFBEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5WVVC42; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5WVVC42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728434419; x=1759970419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pcCTUm9jQAZ4yFwTuiGkrXtV9+bj8LxjJNt0pL1brMk=;
  b=S5WVVC42r/WOJzCS/4rr0xiAL6ODceDZf55bA9x9gXX4P5ig7L0eEJFS
   AFKRFMPXa79ELScA9n9OsVSM/QoCOSSB65MLpa0dbW/UAx8Engw+Ok96U
   R9ynHV0oq8yQWUR0jGwogn0/FzdcpJAVpbDO/lL72LpyoLvF75tobefZ6
   tigfED583FcctQ3wVm46JkXCju3As5JVTkY2bYbKxAxfLc0wV34sitO/H
   tQwO35QlvYFWDP+L8ZPgXX68i2Hwr6B2sv+/55Ef4+2AuPAagt3WFya6Q
   JKTpquGN56KLDJ17ckZm4RD7ThnRjO1lLyF9CPMqWVMK2yY8cEaz4AkYO
   A==;
X-CSE-ConnectionGUID: IT5FlcslS7uQ7iD/ebwiaw==
X-CSE-MsgGUID: JfBEuyrpRh+1qEJGNcrnRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38354678"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="38354678"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 17:40:19 -0700
X-CSE-ConnectionGUID: zWzotJrxRtSYHBGgf3MRSw==
X-CSE-MsgGUID: kugKnycnS/W7KUa0QzNZoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="76173404"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Oct 2024 17:40:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syKkR-0008XO-0N;
	Wed, 09 Oct 2024 00:40:15 +0000
Date: Wed, 9 Oct 2024 08:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 4507/30000]
 arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'x16'
 in asm
Message-ID: <202410090839.I1WLy52U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   313516d1ae36cc86a40f2b86642bc1bfec17f74e
commit: 11b558f5b0628f4701672b6778c068362ef329a7 [4507/30000] arm64: smccc: Support SMCCC v1.3 SVE register saving hint
config: arm64-randconfig-001-20241009 (https://download.01.org/0day-ci/archive/20241009/202410090839.I1WLy52U-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090839.I1WLy52U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090839.I1WLy52U-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                 ^
   include/linux/arm-smccc.h:365:33: note: expanded from macro '__arm_smccc_1_1'
     365 |                 register unsigned long r1 asm("r1");                    \
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
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:441:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     441 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:407:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     407 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:366:33: note: expanded from macro '__arm_smccc_1_1'
     366 |                 register unsigned long r2 asm("r2");                    \
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
   include/linux/arm-smccc.h:441:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     441 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:407:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     407 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:367:33: note: expanded from macro '__arm_smccc_1_1'
     367 |                 register unsigned long r3 asm("r3");                    \
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
   include/linux/arm-smccc.h:441:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     441 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:407:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     407 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:368:3: note: expanded from macro '__arm_smccc_1_1'
     368 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:349:37: note: expanded from macro '___declare_args'
     349 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:25:1: note: expanded from here
      25 | __declare_arg_0
         | ^
   include/linux/arm-smccc.h:303:34: note: expanded from macro '__declare_arg_0'
     303 |         register unsigned long arg0 asm("r0") = (u32)a0
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'x16' in asm
   include/linux/arm-smccc.h:441:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     441 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:407:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     407 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:372:9: note: expanded from macro '__arm_smccc_1_1'
     372 |                              __constraints(__count_args(__VA_ARGS__))); \
         |                              ^
   include/linux/arm-smccc.h:355:30: note: expanded from macro '__constraints'
     355 | #define __constraints(count)    ___constraints(count)
         |                                 ^
   include/linux/arm-smccc.h:354:4: note: expanded from macro '___constraints'
     354 |         : smccc_sve_clobbers "memory"
         |           ^
   include/linux/arm-smccc.h:278:28: note: expanded from macro 'smccc_sve_clobbers'
     278 | #define smccc_sve_clobbers "x16", "x30", "cc",
         |                            ^
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
   include/linux/arm-smccc.h:444:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     444 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:391:32: note: expanded from macro 'arm_smccc_1_1_smc'
     391 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:364:33: note: expanded from macro '__arm_smccc_1_1'
     364 |                 register unsigned long r0 asm("r0");                    \
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
   include/linux/arm-smccc.h:444:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     444 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:391:32: note: expanded from macro 'arm_smccc_1_1_smc'
     391 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:365:33: note: expanded from macro '__arm_smccc_1_1'
     365 |                 register unsigned long r1 asm("r1");                    \
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
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:444:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     444 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:391:32: note: expanded from macro 'arm_smccc_1_1_smc'
     391 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:366:33: note: expanded from macro '__arm_smccc_1_1'
     366 |                 register unsigned long r2 asm("r2");                    \
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
   include/linux/arm-smccc.h:444:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     444 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:391:32: note: expanded from macro 'arm_smccc_1_1_smc'
     391 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:367:33: note: expanded from macro '__arm_smccc_1_1'
     367 |                 register unsigned long r3 asm("r3");                    \
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
   include/linux/arm-smccc.h:444:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     444 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:391:32: note: expanded from macro 'arm_smccc_1_1_smc'
     391 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:368:3: note: expanded from macro '__arm_smccc_1_1'
     368 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:349:37: note: expanded from macro '___declare_args'
     349 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:33:1: note: expanded from here
      33 | __declare_arg_0
         | ^
   include/linux/arm-smccc.h:303:34: note: expanded from macro '__declare_arg_0'
     303 |         register unsigned long arg0 asm("r0") = (u32)a0
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'x16' in asm
   include/linux/arm-smccc.h:444:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     444 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:391:32: note: expanded from macro 'arm_smccc_1_1_smc'
     391 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:372:9: note: expanded from macro '__arm_smccc_1_1'
     372 |                              __constraints(__count_args(__VA_ARGS__))); \
         |                              ^
   include/linux/arm-smccc.h:355:30: note: expanded from macro '__constraints'
     355 | #define __constraints(count)    ___constraints(count)
         |                                 ^
   include/linux/arm-smccc.h:354:4: note: expanded from macro '___constraints'
     354 |         : smccc_sve_clobbers "memory"
         |           ^
   include/linux/arm-smccc.h:278:28: note: expanded from macro 'smccc_sve_clobbers'
     278 | #define smccc_sve_clobbers "x16", "x30", "cc",
         |                            ^
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
   include/linux/arm-smccc.h:447:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     447 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:416:3: note: expanded from macro '__fail_smccc_1_1'
     416 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   include/linux/arm-smccc.h:350:37: note: expanded from macro '__declare_args'
     350 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^
   include/linux/arm-smccc.h:349:37: note: expanded from macro '___declare_args'
     349 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:41:1: note: expanded from here
      41 | __declare_arg_0
         | ^
   include/linux/arm-smccc.h:303:34: note: expanded from macro '__declare_arg_0'
     303 |         register unsigned long arg0 asm("r0") = (u32)a0
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'x16' in asm
   include/linux/arm-smccc.h:447:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     447 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:417:13: note: expanded from macro '__fail_smccc_1_1'
     417 |                 asm ("" : __constraints(__count_args(__VA_ARGS__)));    \
         |                           ^
   include/linux/arm-smccc.h:355:30: note: expanded from macro '__constraints'
     355 | #define __constraints(count)    ___constraints(count)
         |                                 ^
   include/linux/arm-smccc.h:354:4: note: expanded from macro '___constraints'
     354 |         : smccc_sve_clobbers "memory"
         |           ^
   include/linux/arm-smccc.h:278:28: note: expanded from macro 'smccc_sve_clobbers'
     278 | #define smccc_sve_clobbers "x16", "x30", "cc",
         |                            ^
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
   include/linux/arm-smccc.h:441:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     441 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:407:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     407 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:364:33: note: expanded from macro '__arm_smccc_1_1'
     364 |                 register unsigned long r0 asm("r0");                    \
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
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:441:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     441 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:407:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     407 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:365:33: note: expanded from macro '__arm_smccc_1_1'
     365 |                 register unsigned long r1 asm("r1");                    \
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
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:441:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     441 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:407:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     407 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:366:33: note: expanded from macro '__arm_smccc_1_1'
     366 |                 register unsigned long r2 asm("r2");                    \
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


vim +/x16 +20 arch/arm64/include/asm/archrandom.h

78d8f4f7a298a5 Andre Przywara 2022-01-17  15  
181f11fd395b9e Andre Przywara 2022-01-17  16  static inline bool __init smccc_probe_trng(void)
181f11fd395b9e Andre Przywara 2022-01-17  17  {
78d8f4f7a298a5 Andre Przywara 2022-01-17  18  	struct arm_smccc_res res;
78d8f4f7a298a5 Andre Przywara 2022-01-17  19  
78d8f4f7a298a5 Andre Przywara 2022-01-17 @20  	arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_VERSION, &res);
78d8f4f7a298a5 Andre Przywara 2022-01-17  21  	if ((s32)res.a0 < 0)
181f11fd395b9e Andre Przywara 2022-01-17  22  		return false;
78d8f4f7a298a5 Andre Przywara 2022-01-17  23  
78d8f4f7a298a5 Andre Przywara 2022-01-17  24  	return res.a0 >= ARM_SMCCC_TRNG_MIN_VERSION;
181f11fd395b9e Andre Przywara 2022-01-17  25  }
181f11fd395b9e Andre Przywara 2022-01-17  26  

:::::: The code at line 20 was first introduced by commit
:::::: 78d8f4f7a298a5d259b2163121ea20b9e60e93f7 arm64: Add support for SMCCC TRNG entropy source

:::::: TO: Andre Przywara <andre.przywara@arm.com>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
