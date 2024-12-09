Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DD71B0401
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733757360; cv=none; b=hPaQOMokhnaU2cwCeqNyuEWQtCnijA9owaXqbZhQpOjaXl7WYx1glgRayRGXyWdM9sJnM8CPLERtpkQd2hfPN/iCs48G/Fts4QSSQXa7Hr49rtnzpVtfnjJyvNglU4Kiontnii44OyIHdEvG8wsL15ceO+PmhUisBS1xJGZdFyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733757360; c=relaxed/simple;
	bh=wJbRYxbSJ6Ts3OlQemntUj8PqmVXz7Jgoo9BdByZLNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SimMncZ13HqSZHMUo5RD6A2D0Vyo4UXHd43kXIwWPN6cLOqEho8pfa3MRQV/rOpUX+qA649xoVx6DngWbGW5FPo5MLPH1575J0ooH+akOp8CKZf3Eb/zo12QNU+D7t0jBt5kNaEkBMVzuhdR+g0Fq1RJGspDEG5vdqN3C2VXu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eQCP+1m2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eQCP+1m2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733757358; x=1765293358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wJbRYxbSJ6Ts3OlQemntUj8PqmVXz7Jgoo9BdByZLNM=;
  b=eQCP+1m2ILY0tUO1RZreTZ0L6KGTTMgjojXJrnlr/NPCGF805Ha1YbNF
   L1l/Gtstehm7ErWEiA7FAG0+6TlMi43EbxKhpVq9aYmy1lUny+L07QEJ3
   gcuEaZypYj51nce8seZyz0NjetkFhpY8Z5Ywm+J9O6SFkyz+RDil69d9Q
   NCj9Cs3wBeQ8loAYvc3SN8FyTaEU4CAaHaISN/RMa0cTE1/uJIlThZCaf
   6ZkGpHR2WGQXToIXtqb1V9QzC/i6/gtuVS1bfhSAMSR2aetpJqBOFrQzO
   QQxcvU3+P8WxFcG9ufYY8Sf3s9NTCCZ/l/0VuINWDaUC4opshm4Y1iX08
   Q==;
X-CSE-ConnectionGUID: wocBjz5dT+Kdth8JANMzMg==
X-CSE-MsgGUID: wshBfmlRS0Sahdru8vzwGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34188449"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="34188449"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 07:15:57 -0800
X-CSE-ConnectionGUID: kjW2N+ExTgCLeCLHZizmrQ==
X-CSE-MsgGUID: rb3+M1A8RW2T7kTqMz+tAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="95556726"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Dec 2024 07:15:55 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKfUH-0004UX-09;
	Mon, 09 Dec 2024 15:15:53 +0000
Date: Mon, 9 Dec 2024 23:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Huaxin Lu <luhuaxin1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2570/2570]
 arch/arm64/include/asm/stack_pointer.h:8:51: error: register 'sp' unsuitable
 for global register variables on this target
Message-ID: <202412092317.DIsy2Dp4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fbaada49082c23aa4e4ed43386a1ad4a457a0354
commit: 78568d28ad62c586e32e3989de5354fcb014c09f [2570/2570] scripts: Fix issue of module signing with openssl 3.x
config: arm64-randconfig-003-20241209 (https://download.01.org/0day-ci/archive/20241209/202412092317.DIsy2Dp4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412092317.DIsy2Dp4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412092317.DIsy2Dp4-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:102:9: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
     102 |         while (ERR_get_error_line(&file, &line)) {}
         |                ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:142:3: warning: 'ENGINE_load_builtin_engines' is deprecated [-Wdeprecated-declarations]
     142 |                 ENGINE_load_builtin_engines();
         |                 ^
   /usr/include/openssl/engine.h:358:1: note: 'ENGINE_load_builtin_engines' has been explicitly marked deprecated here
     358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:144:7: warning: 'ENGINE_by_id' is deprecated [-Wdeprecated-declarations]
     144 |                 e = ENGINE_by_id("pkcs11");
         |                     ^
   /usr/include/openssl/engine.h:336:1: note: 'ENGINE_by_id' has been explicitly marked deprecated here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:146:7: warning: 'ENGINE_init' is deprecated [-Wdeprecated-declarations]
     146 |                 if (ENGINE_init(e))
         |                     ^
   /usr/include/openssl/engine.h:620:1: note: 'ENGINE_init' has been explicitly marked deprecated here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:151:9: warning: 'ENGINE_ctrl_cmd_string' is deprecated [-Wdeprecated-declarations]
     151 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0),
         |                              ^
   /usr/include/openssl/engine.h:478:1: note: 'ENGINE_ctrl_cmd_string' has been explicitly marked deprecated here
     478 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:153:17: warning: 'ENGINE_load_private_key' is deprecated [-Wdeprecated-declarations]
     153 |                 private_key = ENGINE_load_private_key(e, private_key_name,
         |                               ^
   /usr/include/openssl/engine.h:637:1: note: 'ENGINE_load_private_key' has been explicitly marked deprecated here
     637 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   7 warnings generated.
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
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:369:33: note: expanded from macro '__arm_smccc_1_1'
     369 |                 register unsigned long r0 asm("r0");                    \
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
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:370:33: note: expanded from macro '__arm_smccc_1_1'
     370 |                 register unsigned long r1 asm("r1");                    \
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
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:371:33: note: expanded from macro '__arm_smccc_1_1'
     371 |                 register unsigned long r2 asm("r2");                    \
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
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:372:33: note: expanded from macro '__arm_smccc_1_1'
     372 |                 register unsigned long r3 asm("r3");                    \
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
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:373:3: note: expanded from macro '__arm_smccc_1_1'
     373 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:354:37: note: expanded from macro '___declare_args'
     354 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:114:1: note: expanded from here
     114 | __declare_arg_0
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
     446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:377:9: note: expanded from macro '__arm_smccc_1_1'
     377 |                              __constraints(__count_args(__VA_ARGS__))); \
         |                              ^
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     449 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
     396 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:369:33: note: expanded from macro '__arm_smccc_1_1'
     369 |                 register unsigned long r0 asm("r0");                    \
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
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     449 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
     396 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:370:33: note: expanded from macro '__arm_smccc_1_1'
     370 |                 register unsigned long r1 asm("r1");                    \
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
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     449 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
     396 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:371:33: note: expanded from macro '__arm_smccc_1_1'
     371 |                 register unsigned long r2 asm("r2");                    \
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
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     449 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
     396 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:372:33: note: expanded from macro '__arm_smccc_1_1'
     372 |                 register unsigned long r3 asm("r3");                    \
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
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     449 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
     396 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:373:3: note: expanded from macro '__arm_smccc_1_1'
     373 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:354:37: note: expanded from macro '___declare_args'
     354 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:122:1: note: expanded from here
     122 | __declare_arg_0
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
     449 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
     396 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:377:9: note: expanded from macro '__arm_smccc_1_1'
     377 |                              __constraints(__count_args(__VA_ARGS__))); \
         |                              ^
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
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:452:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     452 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:421:3: note: expanded from macro '__fail_smccc_1_1'
     421 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   include/linux/arm-smccc.h:355:37: note: expanded from macro '__declare_args'
     355 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^
   include/linux/arm-smccc.h:354:37: note: expanded from macro '___declare_args'
     354 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:130:1: note: expanded from here
     130 | __declare_arg_0
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
     452 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:422:13: note: expanded from macro '__fail_smccc_1_1'
     422 |                 asm ("" : __constraints(__count_args(__VA_ARGS__)));    \
         |                           ^
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
     446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:369:33: note: expanded from macro '__arm_smccc_1_1'
     369 |                 register unsigned long r0 asm("r0");                    \
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
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:370:33: note: expanded from macro '__arm_smccc_1_1'
     370 |                 register unsigned long r1 asm("r1");                    \
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
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     446 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     412 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:371:33: note: expanded from macro '__arm_smccc_1_1'
     371 |                 register unsigned long r2 asm("r2");                    \
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


vim +/sp +8 arch/arm64/include/asm/stack_pointer.h

a9ea0017ebe8889 Mark Rutland 2016-11-03  4  
a9ea0017ebe8889 Mark Rutland 2016-11-03  5  /*
a9ea0017ebe8889 Mark Rutland 2016-11-03  6   * how to get the current stack pointer from C
a9ea0017ebe8889 Mark Rutland 2016-11-03  7   */
a9ea0017ebe8889 Mark Rutland 2016-11-03 @8  register unsigned long current_stack_pointer asm ("sp");
a9ea0017ebe8889 Mark Rutland 2016-11-03  9  

:::::: The code at line 8 was first introduced by commit
:::::: a9ea0017ebe8889dfa136cac2aa7ae0ee6915e1f arm64: factor out current_stack_pointer

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
