Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719791386B4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 18:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751654072; cv=none; b=R/xFhWG6DA18YADHVTjjv/DGFMlggBpziq+Vt/hEAxqqaNmM2gmmSuqH/nSK+0f8DKudyQz0w455x2vJpHP7QiJNJGg8FwBiGFOJ/ZpjoEO5S+9Oo657Qao7FPaY7caI8DckKh1ahGtQMlilprfR3gq+d5dNMqLzvcIY1avHODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751654072; c=relaxed/simple;
	bh=uEbvPw3VSoX2wV9wAPWQG08odr2qEGDThFQ0cCc7vXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUFDK3L4VZVV3YeQdUxo1mXABZeubUIr0I/83vwnXA9vDuz3h7dreQ7U9kN4WqcGQCBu96pFmYNbswv6yNnnUH1y8wuF/PkG8bS2mmPBo1f7oquTuEuD+YVLxQ7OTTD7TJ+SLTgJ/FW5+c1pdFMe3MXci3KzVAzqAt+gZg8v7f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHMO05lV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHMO05lV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751654070; x=1783190070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uEbvPw3VSoX2wV9wAPWQG08odr2qEGDThFQ0cCc7vXo=;
  b=NHMO05lVp4kMa/KnrR/ukaCqyLQsLWMUgqHbGQUqSZPO+Uvqiy0PmVrj
   +nlCLaX4AWvP5K1ZWyBTV2PM65xGUNeCGVLUp3XtwvzHBWvC+KV6HZxWw
   JyYW/6joNFDrf88peMyebGoCxS2SX/WmfCW/LWqCm8nZQzPOB9crhQHER
   yh99nxTyh/FmNhSdix69YCDqgv47Wqy+iIcW0C5VOWe7HwmT6NH3ntxez
   x88DroIiFArzgrlyAyJ3VPVqtnhEuQ4vPcrEjIutEBORz1XA8KcbKidyi
   WWLoWdvHZKoDNFreE1vBEzpc1/bV8464ZtSkgzKs3kNBNiqWV1GAVf01l
   A==;
X-CSE-ConnectionGUID: f3a5xeyLQv6+LMITlbaqzQ==
X-CSE-MsgGUID: FFwrb3V1RPSpULs3bhRClw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53118536"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="53118536"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:34:29 -0700
X-CSE-ConnectionGUID: whSsEvnTQC6frHzDhSkWBQ==
X-CSE-MsgGUID: aY7JUMoSTlazPOCm+pN9Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="158725626"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jul 2025 11:34:27 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXlEv-0003zT-1Y;
	Fri, 04 Jul 2025 18:34:25 +0000
Date: Sat, 5 Jul 2025 02:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1'
Message-ID: <202507050216.y2Jpe1XO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   57eaf09d30ceb65be00c907370420547a7992943
commit: adc2b4c6af434db264d6e58e740fca5ae876df86 [1/1] CHROMIUM: BACKPORT: FROMLIST: cpufreq: add kvm-cpufreq driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250705/202507050216.y2Jpe1XO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050216.y2Jpe1XO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507050216.y2Jpe1XO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cpufreq/kvm-cpufreq.c:7:
   drivers/cpufreq/kvm-cpufreq.c: In function 'kvm_scale_freq_tick':
   include/linux/arm-smccc.h:429:49: error: expected string literal before 'SMCCC_HVC_INST'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:33: note: in expansion of macro '__arm_smccc_1_1'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:33: note: in expansion of macro '__arm_smccc_1_1'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:49: error: expected string literal before 'SMCCC_SMC_INST'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:33: note: in expansion of macro '__arm_smccc_1_1'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:33: note: in expansion of macro '__arm_smccc_1_1'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c: In function 'remote_get_freqtbl_num_entries':
   include/linux/arm-smccc.h:429:49: error: expected string literal before 'SMCCC_HVC_INST'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:33: note: in expansion of macro '__arm_smccc_1_1'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:33: note: in expansion of macro '__arm_smccc_1_1'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:49: error: expected string literal before 'SMCCC_SMC_INST'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:33: note: in expansion of macro '__arm_smccc_1_1'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:33: note: in expansion of macro '__arm_smccc_1_1'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c: In function 'remote_populate_freqtbl':
   include/linux/arm-smccc.h:429:49: error: expected string literal before 'SMCCC_HVC_INST'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:33: note: in expansion of macro '__arm_smccc_1_1'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:33: note: in expansion of macro '__arm_smccc_1_1'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:49: error: expected string literal before 'SMCCC_SMC_INST'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:33: note: in expansion of macro '__arm_smccc_1_1'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:33: note: in expansion of macro '__arm_smccc_1_1'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c: In function 'kvm_cpufreq_setutil_hyp':
   include/linux/arm-smccc.h:429:49: error: expected string literal before 'SMCCC_HVC_INST'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:108:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     108 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:33: note: in expansion of macro '__arm_smccc_1_1'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:108:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     108 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:33: note: in expansion of macro '__arm_smccc_1_1'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:108:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     108 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:49: error: expected string literal before 'SMCCC_SMC_INST'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:108:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     108 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:33: note: in expansion of macro '__arm_smccc_1_1'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:108:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     108 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:33: note: in expansion of macro '__arm_smccc_1_1'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:108:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     108 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~


vim +/arg1 +332 include/linux/arm-smccc.h

f2d3b2e8759a583 Marc Zyngier 2018-02-06  323  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  324  #define __declare_arg_0(a0, res)					\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  325  	struct arm_smccc_res   *___res = res;				\
0794a974d74dc77 Andrew Scull 2020-09-15  326  	register unsigned long arg0 asm("r0") = (u32)a0
f2d3b2e8759a583 Marc Zyngier 2018-02-06  327  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  328  #define __declare_arg_1(a0, a1, res)					\
755a8bf5579d22e Marc Zyngier 2018-08-24  329  	typeof(a1) __a1 = a1;						\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  330  	struct arm_smccc_res   *___res = res;				\
0794a974d74dc77 Andrew Scull 2020-09-15 @331  	register unsigned long arg0 asm("r0") = (u32)a0;			\
0794a974d74dc77 Andrew Scull 2020-09-15 @332  	register typeof(a1) arg1 asm("r1") = __a1
f2d3b2e8759a583 Marc Zyngier 2018-02-06  333  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  334  #define __declare_arg_2(a0, a1, a2, res)				\
755a8bf5579d22e Marc Zyngier 2018-08-24  335  	typeof(a1) __a1 = a1;						\
755a8bf5579d22e Marc Zyngier 2018-08-24  336  	typeof(a2) __a2 = a2;						\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  337  	struct arm_smccc_res   *___res = res;				\
0794a974d74dc77 Andrew Scull 2020-09-15  338  	register unsigned long arg0 asm("r0") = (u32)a0;			\
0794a974d74dc77 Andrew Scull 2020-09-15  339  	register typeof(a1) arg1 asm("r1") = __a1;			\
0794a974d74dc77 Andrew Scull 2020-09-15  340  	register typeof(a2) arg2 asm("r2") = __a2
f2d3b2e8759a583 Marc Zyngier 2018-02-06  341  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  342  #define __declare_arg_3(a0, a1, a2, a3, res)				\
755a8bf5579d22e Marc Zyngier 2018-08-24  343  	typeof(a1) __a1 = a1;						\
755a8bf5579d22e Marc Zyngier 2018-08-24  344  	typeof(a2) __a2 = a2;						\
755a8bf5579d22e Marc Zyngier 2018-08-24  345  	typeof(a3) __a3 = a3;						\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  346  	struct arm_smccc_res   *___res = res;				\
0794a974d74dc77 Andrew Scull 2020-09-15  347  	register unsigned long arg0 asm("r0") = (u32)a0;			\
0794a974d74dc77 Andrew Scull 2020-09-15  348  	register typeof(a1) arg1 asm("r1") = __a1;			\
0794a974d74dc77 Andrew Scull 2020-09-15  349  	register typeof(a2) arg2 asm("r2") = __a2;			\
0794a974d74dc77 Andrew Scull 2020-09-15  350  	register typeof(a3) arg3 asm("r3") = __a3
f2d3b2e8759a583 Marc Zyngier 2018-02-06  351  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  352  #define __declare_arg_4(a0, a1, a2, a3, a4, res)			\
755a8bf5579d22e Marc Zyngier 2018-08-24  353  	typeof(a4) __a4 = a4;						\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  354  	__declare_arg_3(a0, a1, a2, a3, res);				\
0794a974d74dc77 Andrew Scull 2020-09-15  355  	register typeof(a4) arg4 asm("r4") = __a4
f2d3b2e8759a583 Marc Zyngier 2018-02-06  356  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  357  #define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)			\
755a8bf5579d22e Marc Zyngier 2018-08-24  358  	typeof(a5) __a5 = a5;						\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  359  	__declare_arg_4(a0, a1, a2, a3, a4, res);			\
0794a974d74dc77 Andrew Scull 2020-09-15  360  	register typeof(a5) arg5 asm("r5") = __a5
f2d3b2e8759a583 Marc Zyngier 2018-02-06  361  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  362  #define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)		\
755a8bf5579d22e Marc Zyngier 2018-08-24  363  	typeof(a6) __a6 = a6;						\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  364  	__declare_arg_5(a0, a1, a2, a3, a4, a5, res);			\
0794a974d74dc77 Andrew Scull 2020-09-15  365  	register typeof(a6) arg6 asm("r6") = __a6
f2d3b2e8759a583 Marc Zyngier 2018-02-06  366  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  367  #define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)		\
755a8bf5579d22e Marc Zyngier 2018-08-24  368  	typeof(a7) __a7 = a7;						\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  369  	__declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);		\
0794a974d74dc77 Andrew Scull 2020-09-15  370  	register typeof(a7) arg7 asm("r7") = __a7
f2d3b2e8759a583 Marc Zyngier 2018-02-06  371  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  372  #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
f2d3b2e8759a583 Marc Zyngier 2018-02-06  373  #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
f2d3b2e8759a583 Marc Zyngier 2018-02-06  374  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  375  #define ___constraints(count)						\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  376  	: __constraint_read_ ## count					\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  377  	: "memory"
f2d3b2e8759a583 Marc Zyngier 2018-02-06  378  #define __constraints(count)	___constraints(count)
f2d3b2e8759a583 Marc Zyngier 2018-02-06  379  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  380  /*
f2d3b2e8759a583 Marc Zyngier 2018-02-06  381   * We have an output list that is not necessarily used, and GCC feels
f2d3b2e8759a583 Marc Zyngier 2018-02-06  382   * entitled to optimise the whole sequence away. "volatile" is what
f2d3b2e8759a583 Marc Zyngier 2018-02-06  383   * makes it stick.
f2d3b2e8759a583 Marc Zyngier 2018-02-06  384   */
f2d3b2e8759a583 Marc Zyngier 2018-02-06  385  #define __arm_smccc_1_1(inst, ...)					\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  386  	do {								\
0794a974d74dc77 Andrew Scull 2020-09-15  387  		register unsigned long r0 asm("r0");			\
0794a974d74dc77 Andrew Scull 2020-09-15  388  		register unsigned long r1 asm("r1");			\
0794a974d74dc77 Andrew Scull 2020-09-15  389  		register unsigned long r2 asm("r2");			\
0794a974d74dc77 Andrew Scull 2020-09-15  390  		register unsigned long r3 asm("r3"); 			\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  391  		__declare_args(__count_args(__VA_ARGS__), __VA_ARGS__);	\
0794a974d74dc77 Andrew Scull 2020-09-15 @392  		asm volatile(inst "\n" :				\
0794a974d74dc77 Andrew Scull 2020-09-15  393  			     "=r" (r0), "=r" (r1), "=r" (r2), "=r" (r3)	\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  394  			     __constraints(__count_args(__VA_ARGS__)));	\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  395  		if (___res)						\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  396  			*___res = (typeof(*___res)){r0, r1, r2, r3};	\
f2d3b2e8759a583 Marc Zyngier 2018-02-06  397  	} while (0)
f2d3b2e8759a583 Marc Zyngier 2018-02-06  398  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  399  /*
f2d3b2e8759a583 Marc Zyngier 2018-02-06  400   * arm_smccc_1_1_smc() - make an SMCCC v1.1 compliant SMC call
f2d3b2e8759a583 Marc Zyngier 2018-02-06  401   *
f2d3b2e8759a583 Marc Zyngier 2018-02-06  402   * This is a variadic macro taking one to eight source arguments, and
f2d3b2e8759a583 Marc Zyngier 2018-02-06  403   * an optional return structure.
f2d3b2e8759a583 Marc Zyngier 2018-02-06  404   *
f2d3b2e8759a583 Marc Zyngier 2018-02-06  405   * @a0-a7: arguments passed in registers 0 to 7
f2d3b2e8759a583 Marc Zyngier 2018-02-06  406   * @res: result values from registers 0 to 3
f2d3b2e8759a583 Marc Zyngier 2018-02-06  407   *
f2d3b2e8759a583 Marc Zyngier 2018-02-06  408   * This macro is used to make SMC calls following SMC Calling Convention v1.1.
f2d3b2e8759a583 Marc Zyngier 2018-02-06  409   * The content of the supplied param are copied to registers 0 to 7 prior
f2d3b2e8759a583 Marc Zyngier 2018-02-06  410   * to the SMC instruction. The return values are updated with the content
f2d3b2e8759a583 Marc Zyngier 2018-02-06  411   * from register 0 to 3 on return from the SMC instruction if not NULL.
f2d3b2e8759a583 Marc Zyngier 2018-02-06  412   */
f2d3b2e8759a583 Marc Zyngier 2018-02-06  413  #define arm_smccc_1_1_smc(...)	__arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
f2d3b2e8759a583 Marc Zyngier 2018-02-06  414  
f2d3b2e8759a583 Marc Zyngier 2018-02-06  415  /*
f2d3b2e8759a583 Marc Zyngier 2018-02-06  416   * arm_smccc_1_1_hvc() - make an SMCCC v1.1 compliant HVC call
f2d3b2e8759a583 Marc Zyngier 2018-02-06  417   *
f2d3b2e8759a583 Marc Zyngier 2018-02-06  418   * This is a variadic macro taking one to eight source arguments, and
f2d3b2e8759a583 Marc Zyngier 2018-02-06  419   * an optional return structure.
f2d3b2e8759a583 Marc Zyngier 2018-02-06  420   *
f2d3b2e8759a583 Marc Zyngier 2018-02-06  421   * @a0-a7: arguments passed in registers 0 to 7
f2d3b2e8759a583 Marc Zyngier 2018-02-06  422   * @res: result values from registers 0 to 3
f2d3b2e8759a583 Marc Zyngier 2018-02-06  423   *
f2d3b2e8759a583 Marc Zyngier 2018-02-06  424   * This macro is used to make HVC calls following SMC Calling Convention v1.1.
f2d3b2e8759a583 Marc Zyngier 2018-02-06  425   * The content of the supplied param are copied to registers 0 to 7 prior
f2d3b2e8759a583 Marc Zyngier 2018-02-06  426   * to the HVC instruction. The return values are updated with the content
f2d3b2e8759a583 Marc Zyngier 2018-02-06  427   * from register 0 to 3 on return from the HVC instruction if not NULL.
f2d3b2e8759a583 Marc Zyngier 2018-02-06  428   */
f2d3b2e8759a583 Marc Zyngier 2018-02-06 @429  #define arm_smccc_1_1_hvc(...)	__arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
f2d3b2e8759a583 Marc Zyngier 2018-02-06  430  

:::::: The code at line 332 was first introduced by commit
:::::: 0794a974d74dc777a212a3c58dd236f507360348 smccc: Use separate variables for args and results

:::::: TO: Andrew Scull <ascull@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
