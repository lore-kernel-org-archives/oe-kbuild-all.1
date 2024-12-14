Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2F110940
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 02:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734144910; cv=none; b=sG1Rkj+iC9E+zpXnsVW7uiwtyJ6bLvmwTgp9CYM91/B3skepCfq0YKoXC6rawMM7t4bSrPlLyF7DKfor9WceJPhlqRqtUnGXNIpc7VENpcBR7gqF/410wvNcnZhGEQUAqdF1B8bf7NHXM2tTutv2JZu6IrWulDJATaDTCqzxWIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734144910; c=relaxed/simple;
	bh=D0r7HxxfzjN7uz8Rl9nh0HBT+l1lpmQrQZKQfoRNag8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JV2BdstZiRHNG6j0pHU9GEM8HKKqTiao1z114NfdhXiUdwzgiWOi9wokjJvpxJCcQkS0vuDDYFoFqWpb33WSCsjHkSLELiggVdGpuJY5EgqZoWVDTokcnNnwpT8MfUBtn0ayEaA7SaXhEuhs3Y4Shdn6HRM5zT8NotVxpfQyQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Igw1oJ3a; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Igw1oJ3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734144908; x=1765680908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D0r7HxxfzjN7uz8Rl9nh0HBT+l1lpmQrQZKQfoRNag8=;
  b=Igw1oJ3agO/RX7jlaM9HbbRNUKwV+2qxKTKKrSqkRkTDp08ngPW5ZBe5
   mwYUb/Jl5OHhosPgmBYubU9HdoGNJzPaVC4p2sf8JQX8QSvURGHKXkcrJ
   sdebfzoSt/zVk7qL/dgRN0WqvSDQ2yGPoC9bJpK/9ohLjol1oboNoGtha
   pvsHJs0TEYbkElijIE+gZF+iZ6YCKv8AXoiS/PCAqx8fvFjWIf5vhbcRG
   NqeiUgm5w4tWeONjBsnsIBX+fkn/+xm/UQNiFJs5JKsjas3CDnz7iaRbh
   SxaRY0CLjRZ8pRLofvzZeQIcS9YjSHnK5q+g53PrYjZAik8mx6E30zzY9
   Q==;
X-CSE-ConnectionGUID: kyDFLWlwRXqkhGdzHkocqA==
X-CSE-MsgGUID: tJ2JpEyyTseNML88c6LOuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="52029780"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="52029780"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 18:55:07 -0800
X-CSE-ConnectionGUID: XNehKUaVRp+i8rMTrzCPbA==
X-CSE-MsgGUID: 4LP/PUoLTt+xKHF9x8lzMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119950651"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2024 18:55:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMIJ5-000CeR-1t;
	Sat, 14 Dec 2024 02:55:03 +0000
Date: Sat, 14 Dec 2024 10:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1636/1636]
 arch/loongarch/kernel/paravirt.c:302:35: error: 'mp_ops' undeclared; did you
 mean 'smp_ops'?
Message-ID: <202412141010.py9YL9Li-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d68dc6ee371ec5466be9b2d76bdca0b360940adc
commit: b6239f748d0d896e39b9d41f108163bdb235b8bd [1636/1636] LoongArch: Fix AP booting issue in VM mode
config: loongarch-randconfig-002-20241213 (https://download.01.org/0day-ci/archive/20241214/202412141010.py9YL9Li-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141010.py9YL9Li-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141010.py9YL9Li-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                           ^~~~~~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:82:1: note: in expansion of macro 'early_param'
      82 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   include/linux/init.h:335:27: note: previous definition of '__setup_str_parse_no_stealacc' with type 'const char[13]'
     335 |         static const char __setup_str_##unique_id[] __initconst         \
         |                           ^~~~~~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:30:1: note: in expansion of macro 'early_param'
      30 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   include/linux/init.h:337:40: error: redefinition of '__setup_parse_no_stealacc'
     337 |         static struct obs_kernel_param __setup_##unique_id              \
         |                                        ^~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:82:1: note: in expansion of macro 'early_param'
      82 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   include/linux/init.h:337:40: note: previous definition of '__setup_parse_no_stealacc' with type 'struct obs_kernel_param'
     337 |         static struct obs_kernel_param __setup_##unique_id              \
         |                                        ^~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:30:1: note: in expansion of macro 'early_param'
      30 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:103:13: error: redefinition of 'steal_acc'
     103 | static bool steal_acc = true;
         |             ^~~~~~~~~
   arch/loongarch/kernel/paravirt.c:75:13: note: previous definition of 'steal_acc' with type 'bool' {aka '_Bool'}
      75 | static bool steal_acc = true;
         |             ^~~~~~~~~
   arch/loongarch/kernel/paravirt.c:105:19: error: redefinition of 'parse_no_stealacc'
     105 | static int __init parse_no_stealacc(char *arg)
         |                   ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:77:19: note: previous definition of 'parse_no_stealacc' with type 'int(char *)'
      77 | static int __init parse_no_stealacc(char *arg)
         |                   ^~~~~~~~~~~~~~~~~
   include/linux/init.h:335:27: error: redefinition of '__setup_str_parse_no_stealacc'
     335 |         static const char __setup_str_##unique_id[] __initconst         \
         |                           ^~~~~~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:110:1: note: in expansion of macro 'early_param'
     110 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   include/linux/init.h:335:27: note: previous definition of '__setup_str_parse_no_stealacc' with type 'const char[13]'
     335 |         static const char __setup_str_##unique_id[] __initconst         \
         |                           ^~~~~~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:82:1: note: in expansion of macro 'early_param'
      82 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   include/linux/init.h:337:40: error: redefinition of '__setup_parse_no_stealacc'
     337 |         static struct obs_kernel_param __setup_##unique_id              \
         |                                        ^~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:110:1: note: in expansion of macro 'early_param'
     110 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   include/linux/init.h:337:40: note: previous definition of '__setup_parse_no_stealacc' with type 'struct obs_kernel_param'
     337 |         static struct obs_kernel_param __setup_##unique_id              \
         |                                        ^~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:82:1: note: in expansion of macro 'early_param'
      82 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:112:12: error: redefinition of 'paravt_steal_clock'
     112 | static u64 paravt_steal_clock(int cpu)
         |            ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:84:12: note: previous definition of 'paravt_steal_clock' with type 'u64(int)' {aka 'long long unsigned int(int)'}
      84 | static u64 paravt_steal_clock(int cpu)
         |            ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c: In function 'pv_send_ipi_single':
   arch/loongarch/kernel/paravirt.c:149:24: error: 'KVM_HCALL_FUNC_PV_IPI' undeclared (first use in this function); did you mean 'KVM_HCALL_FUNC_IPI'?
     149 |         kvm_hypercall3(KVM_HCALL_FUNC_PV_IPI, 1, 0, min);
         |                        ^~~~~~~~~~~~~~~~~~~~~
         |                        KVM_HCALL_FUNC_IPI
   arch/loongarch/kernel/paravirt.c:149:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/loongarch/kernel/paravirt.c: In function 'pv_send_ipi_mask':
   arch/loongarch/kernel/paravirt.c:188:40: error: 'KVM_HCALL_FUNC_PV_IPI' undeclared (first use in this function); did you mean 'KVM_HCALL_FUNC_IPI'?
     188 |                         kvm_hypercall3(KVM_HCALL_FUNC_PV_IPI,
         |                                        ^~~~~~~~~~~~~~~~~~~~~
         |                                        KVM_HCALL_FUNC_IPI
   arch/loongarch/kernel/paravirt.c: In function 'pv_ipi_init':
>> arch/loongarch/kernel/paravirt.c:302:35: error: 'mp_ops' undeclared (first use in this function); did you mean 'smp_ops'?
     302 |         native_ops              = mp_ops;
         |                                   ^~~~~~
         |                                   smp_ops
   arch/loongarch/kernel/paravirt.c: At top level:
   arch/loongarch/kernel/paravirt.c:385:13: error: redefinition of 'pv_disable_steal_time'
     385 | static void pv_disable_steal_time(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:239:13: note: previous definition of 'pv_disable_steal_time' with type 'void(void)'
     239 | static void pv_disable_steal_time(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:415:13: error: redefinition of 'pv_cpu_reboot'
     415 | static void pv_cpu_reboot(void *unused)
         |             ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:311:13: note: previous definition of 'pv_cpu_reboot' with type 'void(void *)'
     311 | static void pv_cpu_reboot(void *unused)
         |             ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:420:12: error: redefinition of 'pv_reboot_notify'
     420 | static int pv_reboot_notify(struct notifier_block *nb, unsigned long code, void *unused)
         |            ^~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:316:12: note: previous definition of 'pv_reboot_notify' with type 'int(struct notifier_block *, long unsigned int,  void *)'
     316 | static int pv_reboot_notify(struct notifier_block *nb, unsigned long code,
         |            ^~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:426:30: error: redefinition of 'pv_reboot_nb'
     426 | static struct notifier_block pv_reboot_nb = {
         |                              ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:323:30: note: previous definition of 'pv_reboot_nb' with type 'struct notifier_block'
     323 | static struct notifier_block pv_reboot_nb = {
         |                              ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:430:12: error: redefinition of 'pv_time_init'
     430 | int __init pv_time_init(void)
         |            ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:327:12: note: previous definition of 'pv_time_init' with type 'int(void)'
     327 | int __init pv_time_init(void)
         |            ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:469:12: error: redefinition of 'pv_enable_steal_time'
     469 | static int pv_enable_steal_time(void)
         |            ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:361:12: note: previous definition of 'pv_enable_steal_time' with type 'int(void)'
     361 | static int pv_enable_steal_time(void)
         |            ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:493:13: error: redefinition of 'pv_disable_steal_time'
     493 | static void pv_disable_steal_time(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:385:13: note: previous definition of 'pv_disable_steal_time' with type 'void(void)'
     385 | static void pv_disable_steal_time(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:500:12: error: redefinition of 'pv_time_cpu_online'
     500 | static int pv_time_cpu_online(unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:392:12: note: previous definition of 'pv_time_cpu_online' with type 'int(unsigned int)'
     392 | static int pv_time_cpu_online(unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:511:12: error: redefinition of 'pv_time_cpu_down_prepare'
     511 | static int pv_time_cpu_down_prepare(unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:403:12: note: previous definition of 'pv_time_cpu_down_prepare' with type 'int(unsigned int)'
     403 | static int pv_time_cpu_down_prepare(unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:523:13: error: redefinition of 'pv_cpu_reboot'
     523 | static void pv_cpu_reboot(void *unused)
         |             ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:415:13: note: previous definition of 'pv_cpu_reboot' with type 'void(void *)'
     415 | static void pv_cpu_reboot(void *unused)
         |             ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:528:12: error: redefinition of 'pv_reboot_notify'
     528 | static int pv_reboot_notify(struct notifier_block *nb, unsigned long code, void *unused)
         |            ^~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:420:12: note: previous definition of 'pv_reboot_notify' with type 'int(struct notifier_block *, long unsigned int,  void *)'
     420 | static int pv_reboot_notify(struct notifier_block *nb, unsigned long code, void *unused)
         |            ^~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:534:30: error: redefinition of 'pv_reboot_nb'
     534 | static struct notifier_block pv_reboot_nb = {
         |                              ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:426:30: note: previous definition of 'pv_reboot_nb' with type 'struct notifier_block'
     426 | static struct notifier_block pv_reboot_nb = {
         |                              ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:538:12: error: redefinition of 'pv_time_init'
     538 | int __init pv_time_init(void)
         |            ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:327:12: note: previous definition of 'pv_time_init' with type 'int(void)'
     327 | int __init pv_time_init(void)
         |            ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:84:12: warning: 'paravt_steal_clock' defined but not used [-Wunused-function]
      84 | static u64 paravt_steal_clock(int cpu)
         |            ^~~~~~~~~~~~~~~~~~


vim +302 arch/loongarch/kernel/paravirt.c

   295	
   296	int __init pv_ipi_init(void)
   297	{
   298		if (!kvm_para_has_feature(KVM_FEATURE_IPI))
   299			return 0;
   300	
   301	#ifdef CONFIG_SMP
 > 302		native_ops		= mp_ops;
   303		smp_ops.init_ipi		= pv_init_ipi;
   304		smp_ops.send_ipi_single		= pv_send_ipi_single;
   305		smp_ops.send_ipi_mask		= pv_send_ipi_mask;
   306	#endif
   307	
   308		return 0;
   309	}
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
