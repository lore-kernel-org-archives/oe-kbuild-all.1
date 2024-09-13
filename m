Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5D5BA2E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 01:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726192235; cv=none; b=PKPM8XetoEadvXXLZmsivmFOgOh3vsgIJJQ1scCQD94ONoW8WoOj/sXvQnGD0KBV9qO8m4XBNMKzq1VmfeLTXR8ampw/iwfH6+V1rGjgrs8Dehvdx/ShEva2wDaZfP4yOUJUksqUVXc12HVPx5gbeH6two3ZRUO46VEL7KvZgmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726192235; c=relaxed/simple;
	bh=cmONeP3eCjNJXxCgxWYE8PRHoPBXMEi3fPRHt9aCmNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TfEABSsgYhrA8054F5fWdi+y41ACyjE9gOue6F2Zp5ffW7H+QGRd3fB1AiRYqgVCMv5X0obmQuu6rJjFv8PrHwnWnWjMERKybfzDa0VnN2K+lfiWKnq0iWgkpYsJvPSWeZ0JEFVXtx8wn8bPUVIcC0FXdXM/RFTPBCqeinA9h+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPKpLtnx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPKpLtnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726192232; x=1757728232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cmONeP3eCjNJXxCgxWYE8PRHoPBXMEi3fPRHt9aCmNI=;
  b=bPKpLtnx0nfxiDm5jG1jfXOW925XAAshONvyATE7XhGZuX0KD2Zuaq4m
   BF3olJG5TpJ0ZmXo3LsplUUcgwn14bVFZMVwud0AUwUIrQ4hlRQ/CsyrA
   jpG3rAW3mJBeuozWUA83oUhDF5kRoZdxAZY+jvkmPoW0lwU4KfJ8ckaXh
   AwBsMaQsh1oAGgxBVkPUyEJy/1DsSRMiA/HgalUeeR++hvgKhCdvfgaxX
   1YnWIclGdyLleFIjqchedVyTTYRdCeVOw94tTugEQubFqqQBEM+89H9Yo
   RnQ60wHWZsZPlHttIX7JMCXZu3Kux3Dr0xGdWjFgIMpomEkEUPqXNfImF
   A==;
X-CSE-ConnectionGUID: GhAbQJL+TfSUx9zvsD+VoQ==
X-CSE-MsgGUID: wEL6NMR0Ss20xV/IwUBeHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="13504804"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="13504804"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 18:50:31 -0700
X-CSE-ConnectionGUID: qENdT3j+RcWAU9XTincLBA==
X-CSE-MsgGUID: GMJ8UVl1SKyF8zQeHGZOgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="72677911"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Sep 2024 18:50:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sovS6-0005tS-2G;
	Fri, 13 Sep 2024 01:50:26 +0000
Date: Fri, 13 Sep 2024 09:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Huaxin Lu <luhuaxin1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 16408/30000]
 arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'x16'
 in asm
Message-ID: <202409130912.f9BTikpV-lkp@intel.com>
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
commit: 78568d28ad62c586e32e3989de5354fcb014c09f [16408/30000] scripts: Fix issue of module signing with openssl 3.x
config: arm64-randconfig-002-20240913 (https://download.01.org/0day-ci/archive/20240913/202409130912.f9BTikpV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130912.f9BTikpV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130912.f9BTikpV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:370:33: note: expanded from macro '__arm_smccc_1_1'
   370 |                 register unsigned long r1 asm("r1");                          |                                               ^
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
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:371:33: note: expanded from macro '__arm_smccc_1_1'
   371 |                 register unsigned long r2 asm("r2");                          |                                               ^
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
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:372:33: note: expanded from macro '__arm_smccc_1_1'
   372 |                 register unsigned long r3 asm("r3");                          |                                               ^
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
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:373:3: note: expanded from macro '__arm_smccc_1_1'
   373 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__);       |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:354:37: note: expanded from macro '___declare_args'
   354 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
   |                                     ^
   <scratch space>:28:1: note: expanded from here
   28 | __declare_arg_0
   | ^
   include/linux/arm-smccc.h:308:34: note: expanded from macro '__declare_arg_0'
   308 |         register unsigned long arg0 asm("r0") = (u32)a0
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'x16' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:377:9: note: expanded from macro '__arm_smccc_1_1'
   377 |                              __constraints(__count_args(__VA_ARGS__)));       |                              ^
   include/linux/arm-smccc.h:360:30: note: expanded from macro '__constraints'
   360 | #define __constraints(count)    ___constraints(count)
   |                                 ^
   include/linux/arm-smccc.h:359:4: note: expanded from macro '___constraints'
   359 |         : smccc_sve_clobbers "memory"
   |           ^
   include/linux/arm-smccc.h:283:28: note: expanded from macro 'smccc_sve_clobbers'
   283 | #define smccc_sve_clobbers "x16", "x30", "cc",
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
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   449 |                         arm_smccc_1_1_smc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
   396 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:369:33: note: expanded from macro '__arm_smccc_1_1'
   369 |                 register unsigned long r0 asm("r0");                          |                                               ^
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
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   449 |                         arm_smccc_1_1_smc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
   396 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:370:33: note: expanded from macro '__arm_smccc_1_1'
   370 |                 register unsigned long r1 asm("r1");                          |                                               ^
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
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   449 |                         arm_smccc_1_1_smc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
   396 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:371:33: note: expanded from macro '__arm_smccc_1_1'
   371 |                 register unsigned long r2 asm("r2");                          |                                               ^
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
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   449 |                         arm_smccc_1_1_smc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
   396 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:372:33: note: expanded from macro '__arm_smccc_1_1'
   372 |                 register unsigned long r3 asm("r3");                          |                                               ^
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
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   449 |                         arm_smccc_1_1_smc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
   396 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:373:3: note: expanded from macro '__arm_smccc_1_1'
   373 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__);       |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:354:37: note: expanded from macro '___declare_args'
   354 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
   |                                     ^
   <scratch space>:36:1: note: expanded from here
   36 | __declare_arg_0
   | ^
   include/linux/arm-smccc.h:308:34: note: expanded from macro '__declare_arg_0'
   308 |         register unsigned long arg0 asm("r0") = (u32)a0
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'x16' in asm
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   449 |                         arm_smccc_1_1_smc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
   396 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:377:9: note: expanded from macro '__arm_smccc_1_1'
   377 |                              __constraints(__count_args(__VA_ARGS__)));       |                              ^
   include/linux/arm-smccc.h:360:30: note: expanded from macro '__constraints'
   360 | #define __constraints(count)    ___constraints(count)
   |                                 ^
   include/linux/arm-smccc.h:359:4: note: expanded from macro '___constraints'
   359 |         : smccc_sve_clobbers "memory"
   |           ^
   include/linux/arm-smccc.h:283:28: note: expanded from macro 'smccc_sve_clobbers'
   283 | #define smccc_sve_clobbers "x16", "x30", "cc",
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
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:452:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   452 |                         __fail_smccc_1_1(__VA_ARGS__);                        |                         ^
   include/linux/arm-smccc.h:421:3: note: expanded from macro '__fail_smccc_1_1'
   421 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__);       |                 ^
   include/linux/arm-smccc.h:355:37: note: expanded from macro '__declare_args'
   355 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
   |                                     ^
   include/linux/arm-smccc.h:354:37: note: expanded from macro '___declare_args'
   354 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
   |                                     ^
   <scratch space>:44:1: note: expanded from here
   44 | __declare_arg_0
   | ^
   include/linux/arm-smccc.h:308:34: note: expanded from macro '__declare_arg_0'
   308 |         register unsigned long arg0 asm("r0") = (u32)a0
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'x16' in asm
   include/linux/arm-smccc.h:452:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   452 |                         __fail_smccc_1_1(__VA_ARGS__);                        |                         ^
   include/linux/arm-smccc.h:422:13: note: expanded from macro '__fail_smccc_1_1'
   422 |                 asm ("" : __constraints(__count_args(__VA_ARGS__)));          |                           ^
   include/linux/arm-smccc.h:360:30: note: expanded from macro '__constraints'
   360 | #define __constraints(count)    ___constraints(count)
   |                                 ^
   include/linux/arm-smccc.h:359:4: note: expanded from macro '___constraints'
   359 |         : smccc_sve_clobbers "memory"
   |           ^
   include/linux/arm-smccc.h:283:28: note: expanded from macro 'smccc_sve_clobbers'
   283 | #define smccc_sve_clobbers "x16", "x30", "cc",
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
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r0' in asm
   66 |                 arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, 64, &res);
   |                 ^
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:369:33: note: expanded from macro '__arm_smccc_1_1'
   369 |                 register unsigned long r0 asm("r0");                          |                                               ^
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
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:370:33: note: expanded from macro '__arm_smccc_1_1'
   370 |                 register unsigned long r1 asm("r1");                          |                                               ^
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
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   |                                 ^
   include/linux/arm-smccc.h:371:33: note: expanded from macro '__arm_smccc_1_1'
   371 |                 register unsigned long r2 asm("r2");                          |                                               ^
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
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                       |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)


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
