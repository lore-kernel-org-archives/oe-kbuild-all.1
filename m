Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D2D8F6E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 05:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740114471; cv=none; b=dKhhxhNaYqe/pyJ1qxoETSpx5HaHk2oEdiH8zzCMhponjJv0GvdpHo+l9Xobo01hOEYTKefnxuHs/4ejlS99PqKxGwOYL7KTurkg04e1oW3VC9EuYSzfBjn3sRIp5hg0fTdEDx+8KWK65ruHa8gVDD+j/jVZkJ2Vmn1IHKp8XHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740114471; c=relaxed/simple;
	bh=extAuSSDk9aGAXJj4PhiyxJUcBko9AcKHETmx1nri5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=seBlTmT3w/cVWVjiHUye62kOg4DWn72ONbdT4/JA/37ZCLhndnyL4KKvet8amZ83ve5o1zkmdCK1n5fy/m/cYRMfemnJWfyfdJ3dtQr+N/FmeYtbbcN3oSmYDWvwoiI3QsKzFLeyUCo3uprlx4CvOERTHh6vQAYqSAz/Dxcgo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUHJO3O3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUHJO3O3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740114469; x=1771650469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=extAuSSDk9aGAXJj4PhiyxJUcBko9AcKHETmx1nri5w=;
  b=JUHJO3O3epLgg5tXi0dANYtUO4Zkps7i/zklnwfJoj3PYQcVvC4o3QMM
   JLZkaMSp1IOXvhS+jmgndAzx24HlwtLut30Yt5WW3YcOR8pDQfNyersTX
   LepniEwu0C1d0NORC5oz/+7ek27PuA3cGBFRm4zUyeL2AAaNByXVRaA4o
   QYCKbGyEG6fTUIUhtfQ5xKO/RxoY8HO4RKFVlCKm/e1P6jtYZOKpWNovv
   QRefBRdmUfyADEutxzkFI2zu+D1ZPFm+6qcQUiKJ/zijRoWF9TSSNJ1by
   UjY/neahdPNBLkpup0LE3K8qKw//5wyyd408TUdzzrT8VmPlzL4zoOP+0
   A==;
X-CSE-ConnectionGUID: fW8osSIdTem6EGQLRuj7uA==
X-CSE-MsgGUID: QNuPtIIBTz26WgKSjjv9BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40637416"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="40637416"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 21:07:48 -0800
X-CSE-ConnectionGUID: IKb5vkoKRweFp8F65FAj7Q==
X-CSE-MsgGUID: Bkt4KFxgRY60uq8AZ3goDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119378998"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Feb 2025 21:07:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlLGK-00058h-1Z;
	Fri, 21 Feb 2025 05:07:44 +0000
Date: Fri, 21 Feb 2025 13:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4/4]
 include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1'
Message-ID: <202502211252.CLq1ssTO-lkp@intel.com>
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
head:   52501f2d846bff0d0b00922042836a38736c8110
commit: adc2b4c6af434db264d6e58e740fca5ae876df86 [4/4] CHROMIUM: BACKPORT: FROMLIST: cpufreq: add kvm-cpufreq driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250221/202502211252.CLq1ssTO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211252.CLq1ssTO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211252.CLq1ssTO-lkp@intel.com/

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

f2d3b2e8759a58 Marc Zyngier 2018-02-06  323  
f2d3b2e8759a58 Marc Zyngier 2018-02-06  324  #define __declare_arg_0(a0, res)					\
f2d3b2e8759a58 Marc Zyngier 2018-02-06  325  	struct arm_smccc_res   *___res = res;				\
0794a974d74dc7 Andrew Scull 2020-09-15  326  	register unsigned long arg0 asm("r0") = (u32)a0
f2d3b2e8759a58 Marc Zyngier 2018-02-06  327  
f2d3b2e8759a58 Marc Zyngier 2018-02-06  328  #define __declare_arg_1(a0, a1, res)					\
755a8bf5579d22 Marc Zyngier 2018-08-24  329  	typeof(a1) __a1 = a1;						\
f2d3b2e8759a58 Marc Zyngier 2018-02-06  330  	struct arm_smccc_res   *___res = res;				\
0794a974d74dc7 Andrew Scull 2020-09-15 @331  	register unsigned long arg0 asm("r0") = (u32)a0;			\
0794a974d74dc7 Andrew Scull 2020-09-15 @332  	register typeof(a1) arg1 asm("r1") = __a1
f2d3b2e8759a58 Marc Zyngier 2018-02-06  333  

:::::: The code at line 332 was first introduced by commit
:::::: 0794a974d74dc777a212a3c58dd236f507360348 smccc: Use separate variables for args and results

:::::: TO: Andrew Scull <ascull@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
