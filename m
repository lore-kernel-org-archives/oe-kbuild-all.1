Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EB5194C7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 23:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734131436; cv=none; b=W3u/ZBHY5No/y6epUnmTGhWEAn+zPqqDUWDotWV63k5MtO4QQWgYOcntLGMbpqa503CYaqUV0KMVwD2kx1cuVlp/7SsFRcp/33gv+P7FF8lYHdOuiDAMjAKVprpZIW4gkZ73zbKWS9F6G+3VaREXe5Df/NadFbPMg/hH4ONKxkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734131436; c=relaxed/simple;
	bh=3b+WejmljmyQZOywVa9UA0ll8tTNPSqcZzGmx7MNqtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RkbNDNsQIuT/6cCO3YP3wqj956C8R8sLs6iAE9xXktKSszKsy7HtI8VeZrRCtf6xsF9iGBS7yON0dkFK/ZHPTEOUw/RpqDNAo12FguFywc4+pjm3LYKXKgtEMnAlJlRa4weUqTTi9e15++SH9SsNk9wLzJlmsHQvg6UDo4vDYJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ernxVzbI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ernxVzbI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734131434; x=1765667434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3b+WejmljmyQZOywVa9UA0ll8tTNPSqcZzGmx7MNqtQ=;
  b=ernxVzbI9/u8zBrrIgog7b274YlAj/uDLo+GSvcbr1YN6U3SPnKy7j8Q
   sWKB/xHnUPaxja4tjujGdhAr75TBiH4/439ED+MoPNtlmMHZ9Jg/MvxnN
   4F3yngF6905yss/XLGZ1LKxNa5wcg5LIZpX7MAUlgLCJ8/2ctG8htA4Ps
   /8IkP7x2Bou994zRWh9uEYUF48FibFTQ3UZBhg8BfclHcj2HmLCzfihRk
   KkMiBbqWDdMVbZjrEoUd0F7236Kv5hQ9HlZisxFDZxDs4ly1177srd5bA
   gQmLqBxjQA4qfkRHYgz7pBl28IZOqbd2McAlWgApkZn3RPnvcWF0KiCbv
   Q==;
X-CSE-ConnectionGUID: rkoh3icOT6eaPCUUxY2zig==
X-CSE-MsgGUID: mXyeSEPdQJKoYAtXOvekMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34469731"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="34469731"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 15:10:34 -0800
X-CSE-ConnectionGUID: QO3M8sR6QMKVTmtlNPihsw==
X-CSE-MsgGUID: VvAf1BqBTYmzBCFmqC1UOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="101672122"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Dec 2024 15:10:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMEnl-000CWF-1B;
	Fri, 13 Dec 2024 23:10:29 +0000
Date: Sat, 14 Dec 2024 07:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1636/1636]
 arch/loongarch/kernel/paravirt.c:74:13: error: redefinition of 'steal_acc'
Message-ID: <202412140757.roYzDP2E-lkp@intel.com>
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
commit: 2ee1b090fed0f14944d85db83f5dbc33fbe812ec [1636/1636] LoongArch: KVM: Add PV steal time support in guest side
config: loongarch-randconfig-002-20241213 (https://download.01.org/0day-ci/archive/20241214/202412140757.roYzDP2E-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140757.roYzDP2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140757.roYzDP2E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/kernel/paravirt.c:74:13: error: redefinition of 'steal_acc'
      74 | static bool steal_acc = true;
         |             ^~~~~~~~~
   arch/loongarch/kernel/paravirt.c:23:13: note: previous definition of 'steal_acc' with type 'bool' {aka '_Bool'}
      23 | static bool steal_acc = true;
         |             ^~~~~~~~~
>> arch/loongarch/kernel/paravirt.c:76:19: error: redefinition of 'parse_no_stealacc'
      76 | static int __init parse_no_stealacc(char *arg)
         |                   ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:24:19: note: previous definition of 'parse_no_stealacc' with type 'int(char *)'
      24 | static int __init parse_no_stealacc(char *arg)
         |                   ^~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/linux/kernel.h:30,
                    from include/linux/interrupt.h:6,
                    from arch/loongarch/kernel/paravirt.c:4:
>> include/linux/init.h:335:27: error: redefinition of '__setup_str_parse_no_stealacc'
     335 |         static const char __setup_str_##unique_id[] __initconst         \
         |                           ^~~~~~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:81:1: note: in expansion of macro 'early_param'
      81 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   include/linux/init.h:335:27: note: previous definition of '__setup_str_parse_no_stealacc' with type 'const char[13]'
     335 |         static const char __setup_str_##unique_id[] __initconst         \
         |                           ^~~~~~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:29:1: note: in expansion of macro 'early_param'
      29 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
>> include/linux/init.h:337:40: error: redefinition of '__setup_parse_no_stealacc'
     337 |         static struct obs_kernel_param __setup_##unique_id              \
         |                                        ^~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:81:1: note: in expansion of macro 'early_param'
      81 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   include/linux/init.h:337:40: note: previous definition of '__setup_parse_no_stealacc' with type 'struct obs_kernel_param'
     337 |         static struct obs_kernel_param __setup_##unique_id              \
         |                                        ^~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:29:1: note: in expansion of macro 'early_param'
      29 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:102:13: error: redefinition of 'steal_acc'
     102 | static bool steal_acc = true;
         |             ^~~~~~~~~
   arch/loongarch/kernel/paravirt.c:74:13: note: previous definition of 'steal_acc' with type 'bool' {aka '_Bool'}
      74 | static bool steal_acc = true;
         |             ^~~~~~~~~
   arch/loongarch/kernel/paravirt.c:104:19: error: redefinition of 'parse_no_stealacc'
     104 | static int __init parse_no_stealacc(char *arg)
         |                   ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:76:19: note: previous definition of 'parse_no_stealacc' with type 'int(char *)'
      76 | static int __init parse_no_stealacc(char *arg)
         |                   ^~~~~~~~~~~~~~~~~
>> include/linux/init.h:335:27: error: redefinition of '__setup_str_parse_no_stealacc'
     335 |         static const char __setup_str_##unique_id[] __initconst         \
         |                           ^~~~~~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:109:1: note: in expansion of macro 'early_param'
     109 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   include/linux/init.h:335:27: note: previous definition of '__setup_str_parse_no_stealacc' with type 'const char[13]'
     335 |         static const char __setup_str_##unique_id[] __initconst         \
         |                           ^~~~~~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:81:1: note: in expansion of macro 'early_param'
      81 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
>> include/linux/init.h:337:40: error: redefinition of '__setup_parse_no_stealacc'
     337 |         static struct obs_kernel_param __setup_##unique_id              \
         |                                        ^~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:109:1: note: in expansion of macro 'early_param'
     109 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   include/linux/init.h:337:40: note: previous definition of '__setup_parse_no_stealacc' with type 'struct obs_kernel_param'
     337 |         static struct obs_kernel_param __setup_##unique_id              \
         |                                        ^~~~~~~~
   include/linux/init.h:357:9: note: in expansion of macro '__setup_param'
     357 |         __setup_param(str, fn, fn, 1)
         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:81:1: note: in expansion of macro 'early_param'
      81 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
>> arch/loongarch/kernel/paravirt.c:111:12: error: redefinition of 'paravt_steal_clock'
     111 | static u64 paravt_steal_clock(int cpu)
         |            ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:83:12: note: previous definition of 'paravt_steal_clock' with type 'u64(int)' {aka 'long long unsigned int(int)'}
      83 | static u64 paravt_steal_clock(int cpu)
         |            ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c: In function 'pv_send_ipi_single':
   arch/loongarch/kernel/paravirt.c:141:24: error: 'KVM_HCALL_FUNC_PV_IPI' undeclared (first use in this function); did you mean 'KVM_HCALL_FUNC_IPI'?
     141 |         kvm_hypercall3(KVM_HCALL_FUNC_PV_IPI, 1, 0, min);
         |                        ^~~~~~~~~~~~~~~~~~~~~
         |                        KVM_HCALL_FUNC_IPI
   arch/loongarch/kernel/paravirt.c:141:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/loongarch/kernel/paravirt.c: In function 'pv_send_ipi_mask':
   arch/loongarch/kernel/paravirt.c:175:40: error: 'KVM_HCALL_FUNC_PV_IPI' undeclared (first use in this function); did you mean 'KVM_HCALL_FUNC_IPI'?
     175 |                         kvm_hypercall3(KVM_HCALL_FUNC_PV_IPI,
         |                                        ^~~~~~~~~~~~~~~~~~~~~
         |                                        KVM_HCALL_FUNC_IPI
   arch/loongarch/kernel/paravirt.c: At top level:
>> arch/loongarch/kernel/paravirt.c:363:13: error: redefinition of 'pv_disable_steal_time'
     363 | static void pv_disable_steal_time(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:224:13: note: previous definition of 'pv_disable_steal_time' with type 'void(void)'
     224 | static void pv_disable_steal_time(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/paravirt.c:393:13: error: redefinition of 'pv_cpu_reboot'
     393 | static void pv_cpu_reboot(void *unused)
         |             ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:289:13: note: previous definition of 'pv_cpu_reboot' with type 'void(void *)'
     289 | static void pv_cpu_reboot(void *unused)
         |             ^~~~~~~~~~~~~
>> arch/loongarch/kernel/paravirt.c:398:12: error: redefinition of 'pv_reboot_notify'
     398 | static int pv_reboot_notify(struct notifier_block *nb, unsigned long code, void *unused)
         |            ^~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:294:12: note: previous definition of 'pv_reboot_notify' with type 'int(struct notifier_block *, long unsigned int,  void *)'
     294 | static int pv_reboot_notify(struct notifier_block *nb, unsigned long code,
         |            ^~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/paravirt.c:404:30: error: redefinition of 'pv_reboot_nb'
     404 | static struct notifier_block pv_reboot_nb = {
         |                              ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:301:30: note: previous definition of 'pv_reboot_nb' with type 'struct notifier_block'
     301 | static struct notifier_block pv_reboot_nb = {
         |                              ^~~~~~~~~~~~
>> arch/loongarch/kernel/paravirt.c:408:12: error: redefinition of 'pv_time_init'
     408 | int __init pv_time_init(void)
         |            ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:305:12: note: previous definition of 'pv_time_init' with type 'int(void)'
     305 | int __init pv_time_init(void)
         |            ^~~~~~~~~~~~
>> arch/loongarch/kernel/paravirt.c:453:12: error: redefinition of 'pv_enable_steal_time'
     453 | static int pv_enable_steal_time(void)
         |            ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:339:12: note: previous definition of 'pv_enable_steal_time' with type 'int(void)'
     339 | static int pv_enable_steal_time(void)
         |            ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:477:13: error: redefinition of 'pv_disable_steal_time'
     477 | static void pv_disable_steal_time(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:363:13: note: previous definition of 'pv_disable_steal_time' with type 'void(void)'
     363 | static void pv_disable_steal_time(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/paravirt.c:484:12: error: redefinition of 'pv_time_cpu_online'
     484 | static int pv_time_cpu_online(unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:370:12: note: previous definition of 'pv_time_cpu_online' with type 'int(unsigned int)'
     370 | static int pv_time_cpu_online(unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/paravirt.c:495:12: error: redefinition of 'pv_time_cpu_down_prepare'
     495 | static int pv_time_cpu_down_prepare(unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:381:12: note: previous definition of 'pv_time_cpu_down_prepare' with type 'int(unsigned int)'
     381 | static int pv_time_cpu_down_prepare(unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:507:13: error: redefinition of 'pv_cpu_reboot'
     507 | static void pv_cpu_reboot(void *unused)
         |             ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:393:13: note: previous definition of 'pv_cpu_reboot' with type 'void(void *)'
     393 | static void pv_cpu_reboot(void *unused)
         |             ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:512:12: error: redefinition of 'pv_reboot_notify'
     512 | static int pv_reboot_notify(struct notifier_block *nb, unsigned long code, void *unused)
         |            ^~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:398:12: note: previous definition of 'pv_reboot_notify' with type 'int(struct notifier_block *, long unsigned int,  void *)'
     398 | static int pv_reboot_notify(struct notifier_block *nb, unsigned long code, void *unused)
         |            ^~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:518:30: error: redefinition of 'pv_reboot_nb'
     518 | static struct notifier_block pv_reboot_nb = {
         |                              ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:404:30: note: previous definition of 'pv_reboot_nb' with type 'struct notifier_block'
     404 | static struct notifier_block pv_reboot_nb = {
         |                              ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:522:12: error: redefinition of 'pv_time_init'
     522 | int __init pv_time_init(void)
         |            ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:305:12: note: previous definition of 'pv_time_init' with type 'int(void)'
     305 | int __init pv_time_init(void)
         |            ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:83:12: warning: 'paravt_steal_clock' defined but not used [-Wunused-function]
      83 | static u64 paravt_steal_clock(int cpu)
         |            ^~~~~~~~~~~~~~~~~~


vim +/steal_acc +74 arch/loongarch/kernel/paravirt.c

    73	
  > 74	static bool steal_acc = true;
    75	
  > 76	static int __init parse_no_stealacc(char *arg)
    77	{
    78		steal_acc = false;
    79		return 0;
    80	}
  > 81	early_param("no-steal-acc", parse_no_stealacc);
    82	
    83	static u64 paravt_steal_clock(int cpu)
    84	{
    85		int version;
    86		u64 steal;
    87		struct kvm_steal_time *src;
    88	
    89		src = &per_cpu(steal_time, cpu);
    90		do {
    91	
    92			version = src->version;
    93			virt_rmb(); /* Make sure that the version is read before the steal */
    94			steal = src->steal;
    95			virt_rmb(); /* Make sure that the steal is read before the next version */
    96	
    97		} while ((version & 1) || (version != src->version));
    98	
    99		return steal;
   100	}
   101	
   102	static bool steal_acc = true;
   103	
   104	static int __init parse_no_stealacc(char *arg)
   105	{
   106		steal_acc = false;
   107		return 0;
   108	}
   109	early_param("no-steal-acc", parse_no_stealacc);
   110	
 > 111	static u64 paravt_steal_clock(int cpu)
   112	{
   113		int version;
   114		u64 steal;
   115		struct kvm_steal_time *src;
   116	
   117		src = &per_cpu(steal_time, cpu);
   118		do {
   119	
   120			version = src->version;
   121			virt_rmb(); /* Make sure that the version is read before the steal */
   122			steal = src->steal;
   123			virt_rmb(); /* Make sure that the steal is read before the next version */
   124	
   125		} while ((version & 1) || (version != src->version));
   126	
   127		return steal;
   128	}
   129	
   130	#ifdef CONFIG_SMP
   131	static void pv_send_ipi_single(int cpu, unsigned int action)
   132	{
   133		unsigned int min, old;
   134		irq_cpustat_t *info = &per_cpu(irq_stat, cpu);
   135	
   136		old = atomic_fetch_or(BIT(action), &info->message);
   137		if (old)
   138			return;
   139	
   140		min = cpu_logical_map(cpu);
 > 141		kvm_hypercall3(KVM_HCALL_FUNC_PV_IPI, 1, 0, min);
   142	}
   143	
   144	#define KVM_IPI_CLUSTER_SIZE		(2 * BITS_PER_LONG)
   145	static void pv_send_ipi_mask(const struct cpumask *mask, unsigned int action)
   146	{
   147		unsigned int cpu, i, min = 0, max = 0, old;
   148		__uint128_t bitmap = 0;
   149		irq_cpustat_t *info;
   150	
   151		if (cpumask_empty(mask))
   152			return;
   153	
   154		action = BIT(action);
   155		for_each_cpu(i, mask) {
   156			info = &per_cpu(irq_stat, i);
   157			old = atomic_fetch_or(action, &info->message);
   158			if (old)
   159				continue;
   160	
   161			cpu = cpu_logical_map(i);
   162			if (!bitmap) {
   163				min = max = cpu;
   164			} else if (cpu > min && cpu < min + KVM_IPI_CLUSTER_SIZE) {
   165				max = cpu > max ? cpu : max;
   166			} else if (cpu < min && (max - cpu) < KVM_IPI_CLUSTER_SIZE) {
   167				bitmap <<= min - cpu;
   168				min = cpu;
   169			} else {
   170				/*
   171				 * Physical cpuid is sorted in ascending order ascend
   172				 * for the next mask calculation, send IPI here
   173				 * directly and skip the remainding cpus
   174				 */
   175				kvm_hypercall3(KVM_HCALL_FUNC_PV_IPI,
   176					(unsigned long)bitmap,
   177					(unsigned long)(bitmap >> BITS_PER_LONG), min);
   178				min = max = cpu;
   179				bitmap = 0;
   180			}
   181			__set_bit(cpu - min, (unsigned long *)&bitmap);
   182		}
   183	
   184		if (bitmap)
   185			kvm_hypercall3(KVM_HCALL_FUNC_PV_IPI, (unsigned long)bitmap,
   186					(unsigned long)(bitmap >> BITS_PER_LONG), min);
   187	}
   188	
   189	static irqreturn_t loongson_do_swi(int irq, void *dev)
   190	{
   191		irq_cpustat_t *info;
   192		long action;
   193	
   194		/* Clear swi interrupt */
   195		clear_csr_estat(1 << INT_SWI0);
   196		info = this_cpu_ptr(&irq_stat);
   197		action = atomic_xchg(&info->message, 0);
   198		if (action & SMP_CALL_FUNCTION) {
   199			generic_smp_call_function_interrupt();
   200			info->ipi_irqs[IPI_CALL_FUNCTION]++;
   201		}
   202	
   203		if (action & SMP_RESCHEDULE) {
   204			scheduler_ipi();
   205			info->ipi_irqs[IPI_RESCHEDULE]++;
   206		}
   207	
   208		return IRQ_HANDLED;
   209	}
   210	
   211	static void pv_init_ipi(void)
   212	{
   213		int r, swi0;
   214	
   215		swi0 = get_percpu_irq(INT_SWI0);
   216		if (swi0 < 0)
   217			panic("SWI0 IRQ mapping failed\n");
   218		irq_set_percpu_devid(swi0);
   219		r = request_percpu_irq(swi0, loongson_do_swi, "SWI0", &irq_stat);
   220		if (r < 0)
   221			panic("SWI0 IRQ request failed\n");
   222	}
   223	
 > 224	static void pv_disable_steal_time(void)
   225	{
   226		if (has_steal_clock)
   227			kvm_hypercall2(KVM_HCALL_FUNC_NOTIFY, KVM_FEATURE_STEAL_TIME, 0);
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
