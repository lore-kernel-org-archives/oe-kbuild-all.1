Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83863125C7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwedkxUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701758233; x=1733294233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BzdXWvseXq45e5+sdumpRpn+UxxVdhSHmuIAYkNY+DM=;
  b=kwedkxUzm7Koi4iD1DnPV7UOkRgkEtFbqy3enrfzYBy2LqppukuWGrOu
   wLnO6oJzLpnvVRq/peUbOm5Fsq6gqXFsNvAOeetNH9YugzGZhFrr65erY
   xDjXOXpmbQppCSW01giogDyA548/J+j2Dfn7mfK9gDegRq4wsBERQbB7M
   foftwZ4Q0xvBV6t0i7aaV84YdVhhPsBF+QNhlzdSJknHNOpmLMrTZCLHO
   cvdDoRby+CuIFP6mBb0Zn9H2oqjByqFQIWrBPW64ACQRjfMG32UPN+DLF
   W0p1HzkgSL0CD0Y5pkzPd8SlsZLI7ovIoPuljK73MJ0aktC4UFyaEcpWR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="458171300"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="458171300"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 22:37:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747113581"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="747113581"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Dec 2023 22:37:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAP3F-0008RX-1W;
	Tue, 05 Dec 2023 06:37:01 +0000
Date: Tue, 5 Dec 2023 14:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 3905/4597]
 arch/mips/kernel/machine_kexec.c:161:6: warning: no previous prototype for
 'kexec_nonboot_cpu_jump'
Message-ID: <202312051416.YiRWCYmp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: f7a6fde1ce06ddb4bc39e09ec82508dea41f2700 [3905/4597] kexec_core: change dependency of object files
config: mips-randconfig-r021-20230305 (https://download.01.org/0day-ci/archive/20231205/202312051416.YiRWCYmp-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051416.YiRWCYmp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051416.YiRWCYmp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/mips/kernel/machine_kexec.c: In function 'machine_kexec_prepare':
   arch/mips/kernel/machine_kexec.c:97:14: error: implicit declaration of function 'kexec_nonboot_cpu_func' [-Werror=implicit-function-declaration]
      97 |         if (!kexec_nonboot_cpu_func())
         |              ^~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c: In function 'kexec_shutdown_secondary':
   arch/mips/kernel/machine_kexec.c:129:9: error: implicit declaration of function 'kexec_reboot' [-Werror=implicit-function-declaration]
     129 |         kexec_reboot();
         |         ^~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c: At top level:
   arch/mips/kernel/machine_kexec.c:136:1: warning: no previous prototype for 'machine_shutdown' [-Wmissing-prototypes]
     136 | machine_shutdown(void)
         | ^~~~~~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c:152:1: warning: no previous prototype for 'machine_crash_shutdown' [-Wmissing-prototypes]
     152 | machine_crash_shutdown(struct pt_regs *regs)
         | ^~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c: In function 'machine_crash_shutdown':
   arch/mips/kernel/machine_kexec.c:157:17: error: implicit declaration of function 'default_machine_crash_shutdown'; did you mean '_machine_crash_shutdown'? [-Werror=implicit-function-declaration]
     157 |                 default_machine_crash_shutdown(regs);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 _machine_crash_shutdown
   arch/mips/kernel/machine_kexec.c: At top level:
>> arch/mips/kernel/machine_kexec.c:161:6: warning: no previous prototype for 'kexec_nonboot_cpu_jump' [-Wmissing-prototypes]
     161 | void kexec_nonboot_cpu_jump(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/mips/kernel/machine_kexec.c:170:6: warning: no previous prototype for 'kexec_reboot' [-Wmissing-prototypes]
     170 | void kexec_reboot(void)
         |      ^~~~~~~~~~~~
>> arch/mips/kernel/machine_kexec.c:170:6: warning: conflicting types for 'kexec_reboot'; have 'void(void)'
   arch/mips/kernel/machine_kexec.c:129:9: note: previous implicit declaration of 'kexec_reboot' with type 'void(void)'
     129 |         kexec_reboot();
         |         ^~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c: In function 'kexec_reboot':
   arch/mips/kernel/machine_kexec.c:191:17: error: implicit declaration of function 'kexec_nonboot_cpu'; did you mean 'kexec_nonboot_cpu_jump'? [-Werror=implicit-function-declaration]
     191 |                 kexec_nonboot_cpu();
         |                 ^~~~~~~~~~~~~~~~~
         |                 kexec_nonboot_cpu_jump
   arch/mips/kernel/machine_kexec.c: In function 'machine_kexec':
   arch/mips/kernel/machine_kexec.c:259:26: error: 'kexec_smp_wait' undeclared (first use in this function)
     259 |                 (void *)(kexec_smp_wait - relocate_new_kernel);
         |                          ^~~~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c:259:26: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
--
   arch/mips/kernel/crash.c: In function 'crash_shutdown_secondary':
   arch/mips/kernel/crash.c:47:30: error: 'kexec_ready_to_reboot' undeclared (first use in this function)
      47 |         while (!atomic_read(&kexec_ready_to_reboot))
         |                              ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/crash.c:47:30: note: each undeclared identifier is reported only once for each function it appears in
   arch/mips/kernel/crash.c:50:9: error: implicit declaration of function 'kexec_reboot' [-Werror=implicit-function-declaration]
      50 |         kexec_reboot();
         |         ^~~~~~~~~~~~
   arch/mips/kernel/crash.c: In function 'crash_smp_send_stop':
   arch/mips/kernel/crash.c:86:13: error: '_crash_smp_send_stop' undeclared (first use in this function); did you mean 'crash_smp_send_stop'?
      86 |         if (_crash_smp_send_stop)
         |             ^~~~~~~~~~~~~~~~~~~~
         |             crash_smp_send_stop
   arch/mips/kernel/crash.c:87:17: error: implicit declaration of function '_crash_smp_send_stop'; did you mean 'crash_smp_send_stop'? [-Werror=implicit-function-declaration]
      87 |                 _crash_smp_send_stop();
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 crash_smp_send_stop
   arch/mips/kernel/crash.c: At top level:
>> arch/mips/kernel/crash.c:96:6: warning: no previous prototype for 'default_machine_crash_shutdown' [-Wmissing-prototypes]
      96 | void default_machine_crash_shutdown(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/kexec_nonboot_cpu_jump +161 arch/mips/kernel/machine_kexec.c

583bb86fbb9e85 Nicolas Schichan 2006-10-18  159  
62cac480f33f8f Dengcheng Zhu    2018-09-11  160  #ifdef CONFIG_SMP
62cac480f33f8f Dengcheng Zhu    2018-09-11 @161  void kexec_nonboot_cpu_jump(void)
62cac480f33f8f Dengcheng Zhu    2018-09-11  162  {
62cac480f33f8f Dengcheng Zhu    2018-09-11  163  	local_flush_icache_range((unsigned long)relocated_kexec_smp_wait,
62cac480f33f8f Dengcheng Zhu    2018-09-11  164  				 reboot_code_buffer + relocate_new_kernel_size);
62cac480f33f8f Dengcheng Zhu    2018-09-11  165  
62cac480f33f8f Dengcheng Zhu    2018-09-11  166  	relocated_kexec_smp_wait(NULL);
62cac480f33f8f Dengcheng Zhu    2018-09-11  167  }
62cac480f33f8f Dengcheng Zhu    2018-09-11  168  #endif
62cac480f33f8f Dengcheng Zhu    2018-09-11  169  
62cac480f33f8f Dengcheng Zhu    2018-09-11 @170  void kexec_reboot(void)
62cac480f33f8f Dengcheng Zhu    2018-09-11  171  {
62cac480f33f8f Dengcheng Zhu    2018-09-11  172  	void (*do_kexec)(void) __noreturn;
62cac480f33f8f Dengcheng Zhu    2018-09-11  173  
82689ac663ac2f Dengcheng Zhu    2018-09-26  174  	/*
82689ac663ac2f Dengcheng Zhu    2018-09-26  175  	 * We know we were online, and there will be no incoming IPIs at
82689ac663ac2f Dengcheng Zhu    2018-09-26  176  	 * this point. Mark online again before rebooting so that the crash
82689ac663ac2f Dengcheng Zhu    2018-09-26  177  	 * analysis tool will see us correctly.
82689ac663ac2f Dengcheng Zhu    2018-09-26  178  	 */
82689ac663ac2f Dengcheng Zhu    2018-09-26  179  	set_cpu_online(smp_processor_id(), true);
82689ac663ac2f Dengcheng Zhu    2018-09-26  180  
82689ac663ac2f Dengcheng Zhu    2018-09-26  181  	/* Ensure remote CPUs observe that we're online before rebooting. */
82689ac663ac2f Dengcheng Zhu    2018-09-26  182  	smp_mb__after_atomic();
82689ac663ac2f Dengcheng Zhu    2018-09-26  183  

:::::: The code at line 161 was first introduced by commit
:::::: 62cac480f33f8f9413d609cb1601b0ee521a86b8 MIPS: kexec: Make a framework for both jumping and halting on nonboot CPUs

:::::: TO: Dengcheng Zhu <dzhu@wavecomp.com>
:::::: CC: Paul Burton <paul.burton@mips.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
