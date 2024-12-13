Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEC71E105B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734103436; cv=none; b=JrPWgrdD6WZx8OTeRlyQjq70SOrq/Uy74ifCX/KKVwTYk7LmdnKKsTPKjqCMeYsNwf4s+zSK81nj/cL8rgPIM6mNI7oES0d25yj2v6PzkZDKl3e3MWgGMhuszoBK54A9UXSUzrVaibCQqHCJbo9ZsLrd4Jg/hVGZD7RqoAHC+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734103436; c=relaxed/simple;
	bh=FI2gWpna9pRPUAswTZmQ2lpNJsgQgheqc33Bm/pQx7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=swb2XkS9QkrapQVnw5lk6kMqk4fMpgi0+mMQCFYjo/VJXna0KRvy0j17hf7PqQ0ZOhwdJtIz0/kUN39Bl0/+gCUrwslNtDau8GylugQorqV8nmBiKohM9Lka2lLnDC3iKErnpCGmnAOCUoReqoHNormTeBaaygckTXWs0tLdTd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+y3Q3r0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+y3Q3r0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734103434; x=1765639434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FI2gWpna9pRPUAswTZmQ2lpNJsgQgheqc33Bm/pQx7Q=;
  b=B+y3Q3r03MKpDUiGTvfSa6rt9a5vFn23bspDPPG/2i2tElkWGEXu3DPe
   LfGQfs+dQBc2+DFro2TiSyxwfthMB1Qdjh3jlALRvuSbzyRb9NovWTsIT
   NW9nkZmNTljfWy/8vFrEOl2EgfkQlCHuov3TQZLPhiqWe/8Z+KF12Wlqg
   vMWBsQcOgadXtCxCJ5H2FDimi2UQzsACZuEW0jOUbCyXEOgpzvQFy8Qjw
   OmeNHJji6qhVN0kFj79NmIibTeeqYKyiV0sbHlLojFxBj4M6/ccxa7oFe
   1KfdTgn/1OSfA6seuG7NurfzSDwDnLrioqIuyjstN8C1EUKi7//3OC6P1
   Q==;
X-CSE-ConnectionGUID: N+FdxvAlQyeRjdEjspx5ng==
X-CSE-MsgGUID: g4ubSC97RamfT/kNHK+4fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38238306"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="38238306"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 07:23:54 -0800
X-CSE-ConnectionGUID: cM0Ejg+fQfaFzkudskeGSA==
X-CSE-MsgGUID: 2YerkoACSZ+m7Tc4qKIHHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97350157"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2024 07:23:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tM7WA-000C9x-1T;
	Fri, 13 Dec 2024 15:23:50 +0000
Date: Fri, 13 Dec 2024 23:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1636/1636]
 arch/loongarch/kernel/paravirt.c:83:12: warning: 'paravt_steal_clock'
 defined but not used
Message-ID: <202412132355.qfya7e74-lkp@intel.com>
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
config: loongarch-randconfig-002-20241213 (https://download.01.org/0day-ci/archive/20241213/202412132355.qfya7e74-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412132355.qfya7e74-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412132355.qfya7e74-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:81:1: note: in expansion of macro 'early_param'
      81 | early_param("no-steal-acc", parse_no_stealacc);
         | ^~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:111:12: error: redefinition of 'paravt_steal_clock'
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
   arch/loongarch/kernel/paravirt.c:363:13: error: redefinition of 'pv_disable_steal_time'
     363 | static void pv_disable_steal_time(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:224:13: note: previous definition of 'pv_disable_steal_time' with type 'void(void)'
     224 | static void pv_disable_steal_time(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:393:13: error: redefinition of 'pv_cpu_reboot'
     393 | static void pv_cpu_reboot(void *unused)
         |             ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:289:13: note: previous definition of 'pv_cpu_reboot' with type 'void(void *)'
     289 | static void pv_cpu_reboot(void *unused)
         |             ^~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:398:12: error: redefinition of 'pv_reboot_notify'
     398 | static int pv_reboot_notify(struct notifier_block *nb, unsigned long code, void *unused)
         |            ^~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:294:12: note: previous definition of 'pv_reboot_notify' with type 'int(struct notifier_block *, long unsigned int,  void *)'
     294 | static int pv_reboot_notify(struct notifier_block *nb, unsigned long code,
         |            ^~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:404:30: error: redefinition of 'pv_reboot_nb'
     404 | static struct notifier_block pv_reboot_nb = {
         |                              ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:301:30: note: previous definition of 'pv_reboot_nb' with type 'struct notifier_block'
     301 | static struct notifier_block pv_reboot_nb = {
         |                              ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:408:12: error: redefinition of 'pv_time_init'
     408 | int __init pv_time_init(void)
         |            ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:305:12: note: previous definition of 'pv_time_init' with type 'int(void)'
     305 | int __init pv_time_init(void)
         |            ^~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:453:12: error: redefinition of 'pv_enable_steal_time'
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
   arch/loongarch/kernel/paravirt.c:484:12: error: redefinition of 'pv_time_cpu_online'
     484 | static int pv_time_cpu_online(unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:370:12: note: previous definition of 'pv_time_cpu_online' with type 'int(unsigned int)'
     370 | static int pv_time_cpu_online(unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/paravirt.c:495:12: error: redefinition of 'pv_time_cpu_down_prepare'
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
>> arch/loongarch/kernel/paravirt.c:83:12: warning: 'paravt_steal_clock' defined but not used [-Wunused-function]
      83 | static u64 paravt_steal_clock(int cpu)
         |            ^~~~~~~~~~~~~~~~~~


vim +/paravt_steal_clock +83 arch/loongarch/kernel/paravirt.c

    82	
  > 83	static u64 paravt_steal_clock(int cpu)
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
