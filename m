Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E302560
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 11:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675854965; x=1707390965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dfBpzxsTTQH/b8JsRPAnnd5ZolPlURwZcsHzKyJHPkY=;
  b=a+V5MMqedNjanSsJhV9bW4f8V7JMAxCfFPot6J+MLeJ0Kcq0JOaNZUtv
   LXgzqF62xiUveyntFo1hoOdNN7snfOaccF6UC2Ak7UYasPOfNz6mthykn
   xl6fVTGTXAn/8EmjRwR0oPmXBTa8Zou3VZWMoC6GCDJagxqqdU5Ye1RIH
   CSOGHohr/+K4Cwqk4gipnZfPUr8wRl2s14QBV+G5ApGF0G8ZZH8aozmM/
   a2L9QwItBILpjEZXM0xRsGgS+BwXViXqGnlE06bqL7hHobeITFQrqG6Hg
   HA4XfmrHonSepU1zo9UHjEQ9MgjaeZVzkt0LOz4CEScNWv6fIF/HLwxXp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="327466070"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="327466070"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 03:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="791164143"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="791164143"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Feb 2023 03:16:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPiQk-0004Pg-1H;
	Wed, 08 Feb 2023 11:16:02 +0000
Date: Wed, 8 Feb 2023 19:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:ucode-for-ashok 6/16]
 arch/x86/kernel/cpu/microcode/intel.c:567:26: warning: unused variable 'ret'
Message-ID: <202302081902.rQ9IvCof-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git ucode-for-ashok
head:   01bd4486138ec018e1bb204d93e4e52190dfde21
commit: e98b502bf22e1e2bf60feb14c22eef59a70e866a [6/16] ucode-version-op-useit
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230208/202302081902.rQ9IvCof-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=e98b502bf22e1e2bf60feb14c22eef59a70e866a
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel ucode-for-ashok
        git checkout e98b502bf22e1e2bf60feb14c22eef59a70e866a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/cpu/microcode/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/intel.c: In function 'apply_microcode_intel':
>> arch/x86/kernel/cpu/microcode/intel.c:567:26: warning: unused variable 'ret' [-Wunused-variable]
     567 |         enum ucode_state ret;
         |                          ^~~
   arch/x86/kernel/cpu/microcode/intel.c: At top level:
   arch/x86/kernel/cpu/microcode/intel.c:760:10: error: 'struct microcode_ops' has no member named 'collect_cpu_info'
     760 |         .collect_cpu_info       = collect_cpu_info,
         |          ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:760:35: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     760 |         .collect_cpu_info       = collect_cpu_info,
         |                                   ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:760:35: note: (near initialization for 'microcode_intel_ops')
   arch/x86/kernel/cpu/microcode/intel.c:760:35: error: initialization of 'void (*)(int)' from incompatible pointer type 'int (*)(int,  struct cpu_signature *)' [-Werror=incompatible-pointer-types]
   arch/x86/kernel/cpu/microcode/intel.c:760:35: note: (near initialization for 'microcode_intel_ops.microcode_fini_cpu')
   arch/x86/kernel/cpu/microcode/intel.c:762:10: error: 'struct microcode_ops' has no member named 'get_microcode_version'; did you mean 'get_microcode_revision'?
     762 |         .get_microcode_version  = intel_get_microcode_revision,
         |          ^~~~~~~~~~~~~~~~~~~~~
         |          get_microcode_revision
   arch/x86/kernel/cpu/microcode/intel.c:762:35: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     762 |         .get_microcode_version  = intel_get_microcode_revision,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:762:35: note: (near initialization for 'microcode_intel_ops')
   arch/x86/kernel/cpu/microcode/intel.c:762:35: warning: excess elements in struct initializer
   arch/x86/kernel/cpu/microcode/intel.c:762:35: note: (near initialization for 'microcode_intel_ops')
   cc1: some warnings being treated as errors
--
   arch/x86/kernel/cpu/microcode/amd.c: In function 'load_ucode_amd_ap':
   arch/x86/kernel/cpu/microcode/amd.c:534:28: warning: unused variable 'dummy' [-Wunused-variable]
     534 |         u32 *new_rev, rev, dummy;
         |                            ^~~~~
   arch/x86/kernel/cpu/microcode/amd.c: In function 'apply_microcode_amd':
>> arch/x86/kernel/cpu/microcode/amd.c:699:26: warning: unused variable 'ret' [-Wunused-variable]
     699 |         enum ucode_state ret;
         |                          ^~~
   arch/x86/kernel/cpu/microcode/amd.c:695:29: warning: unused variable 'c' [-Wunused-variable]
     695 |         struct cpuinfo_x86 *c = &cpu_data(cpu);
         |                             ^
   arch/x86/kernel/cpu/microcode/amd.c: At top level:
   arch/x86/kernel/cpu/microcode/amd.c:943:10: error: 'struct microcode_ops' has no member named 'collect_cpu_info'
     943 |         .collect_cpu_info                 = collect_cpu_info_amd,
         |          ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/amd.c:943:45: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     943 |         .collect_cpu_info                 = collect_cpu_info_amd,
         |                                             ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/amd.c:943:45: note: (near initialization for 'microcode_amd_ops')
   arch/x86/kernel/cpu/microcode/amd.c:943:45: error: initialization of 'void (*)(int)' from incompatible pointer type 'int (*)(int,  struct cpu_signature *)' [-Werror=incompatible-pointer-types]
   arch/x86/kernel/cpu/microcode/amd.c:943:45: note: (near initialization for 'microcode_amd_ops.microcode_fini_cpu')
   arch/x86/kernel/cpu/microcode/amd.c:945:45: warning: initialized field overwritten [-Woverride-init]
     945 |         .microcode_fini_cpu               = microcode_fini_cpu_amd,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/amd.c:945:45: note: (near initialization for 'microcode_amd_ops.microcode_fini_cpu')
   arch/x86/kernel/cpu/microcode/amd.c:946:45: error: initialization of 'u32 (*)(int)' {aka 'unsigned int (*)(int)'} from incompatible pointer type 'u32 (*)(void)' {aka 'unsigned int (*)(void)'} [-Werror=incompatible-pointer-types]
     946 |         .get_microcode_revision           = get_microcode_revision_amd,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/amd.c:946:45: note: (near initialization for 'microcode_amd_ops.get_microcode_revision')
   cc1: some warnings being treated as errors


vim +/ret +567 arch/x86/kernel/cpu/microcode/intel.c

^1da177e4c3f41 arch/i386/kernel/microcode.c          Linus Torvalds   2005-04-16  560  
3f1f576a195aa2 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2018-02-16  561  static enum ucode_state apply_microcode_intel(int cpu)
^1da177e4c3f41 arch/i386/kernel/microcode.c          Linus Torvalds   2005-04-16  562  {
d8c3b52c00a050 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2018-02-28  563  	struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
c182d2b7d0ca48 arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  564  	struct cpuinfo_x86 *c = &cpu_data(cpu);
811ae8ba6dca6b arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2019-08-24  565  	bool bsp = c->cpu_index == boot_cpu_data.cpu_index;
d8c3b52c00a050 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2018-02-28  566  	struct microcode_intel *mc;
8da38ebaad23fe arch/x86/kernel/cpu/microcode/intel.c Filippo Sironi   2018-07-31 @567  	enum ucode_state ret;
354542d034ab2a arch/x86/kernel/cpu/microcode/intel.c Andi Kleen       2016-06-09  568  	static int prev_rev;
4167709bbf8265 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2017-01-09  569  	u32 rev;
4bae1967357bfc arch/x86/kernel/microcode_intel.c     Ingo Molnar      2009-03-11  570  
9a3110bf4bb046 arch/i386/kernel/microcode.c          Shaohua Li       2006-09-27  571  	/* We should bind the task to the CPU */
26cbaa4dc676a4 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2016-02-03  572  	if (WARN_ON(raw_smp_processor_id() != cpu))
3f1f576a195aa2 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2018-02-16  573  		return UCODE_ERROR;
9a3110bf4bb046 arch/i386/kernel/microcode.c          Shaohua Li       2006-09-27  574  
06b8534cb72837 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2016-10-25  575  	/* Look for a newer patch in our cache: */
06b8534cb72837 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2016-10-25  576  	mc = find_patch(uci);
d8c3b52c00a050 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2018-02-28  577  	if (!mc) {
d8c3b52c00a050 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2018-02-28  578  		mc = uci->mc;
de778275c29582 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2016-02-03  579  		if (!mc)
3f1f576a195aa2 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2018-02-16  580  			return UCODE_NFOUND;
06b8534cb72837 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2016-10-25  581  	}
9cd4d78e21cfdc arch/x86/kernel/microcode_intel.c     Fenghua Yu       2012-12-20  582  
c182d2b7d0ca48 arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  583  	/*
c182d2b7d0ca48 arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  584  	 * Save us the MSR write below - which is a particular expensive
c182d2b7d0ca48 arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  585  	 * operation - when the other hyperthread has updated the microcode
c182d2b7d0ca48 arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  586  	 * already.
c182d2b7d0ca48 arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  587  	 */
c182d2b7d0ca48 arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  588  	rev = intel_get_microcode_revision();
e98b502bf22e1e arch/x86/kernel/cpu/microcode/intel.c Dave Hansen      2023-02-07  589  	if (rev >= mc->hdr.rev)
e98b502bf22e1e arch/x86/kernel/cpu/microcode/intel.c Dave Hansen      2023-02-07  590  		return UCODE_OK;
c182d2b7d0ca48 arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  591  
91df9fdf51492a arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  592  	/*
91df9fdf51492a arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  593  	 * Writeback and invalidate caches before updating microcode to avoid
91df9fdf51492a arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  594  	 * internal issues depending on what the microcode is updating.
91df9fdf51492a arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  595  	 */
91df9fdf51492a arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  596  	native_wbinvd();
91df9fdf51492a arch/x86/kernel/cpu/microcode/intel.c Ashok Raj        2018-02-28  597  
^1da177e4c3f41 arch/i386/kernel/microcode.c          Linus Torvalds   2005-04-16  598  	/* write microcode via MSR 0x79 */
c416e611757521 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2016-02-03  599  	wrmsrl(MSR_IA32_UCODE_WRITE, (unsigned long)mc->bits);
245067d1674d45 arch/i386/kernel/microcode.c          Zachary Amsden   2005-09-03  600  
4167709bbf8265 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2017-01-09  601  	rev = intel_get_microcode_revision();
^1da177e4c3f41 arch/i386/kernel/microcode.c          Linus Torvalds   2005-04-16  602  
4167709bbf8265 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2017-01-09  603  	if (rev != mc->hdr.rev) {
f58e1f53de52a7 arch/x86/kernel/microcode_intel.c     Joe Perches      2009-12-08  604  		pr_err("CPU%d update to revision 0x%x failed\n",
26cbaa4dc676a4 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2016-02-03  605  		       cpu, mc->hdr.rev);
3f1f576a195aa2 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2018-02-16  606  		return UCODE_ERROR;
871b72dd1e12af arch/x86/kernel/microcode_intel.c     Dmitry Adamushko 2009-05-11  607  	}
26cbaa4dc676a4 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2016-02-03  608  
811ae8ba6dca6b arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2019-08-24  609  	if (bsp && rev != prev_rev) {
354542d034ab2a arch/x86/kernel/cpu/microcode/intel.c Andi Kleen       2016-06-09  610  		pr_info("updated to revision 0x%x, date = %04x-%02x-%02x\n",
4167709bbf8265 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2017-01-09  611  			rev,
de778275c29582 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2016-02-03  612  			mc->hdr.date & 0xffff,
de778275c29582 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2016-02-03  613  			mc->hdr.date >> 24,
de778275c29582 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2016-02-03  614  			(mc->hdr.date >> 16) & 0xff);
4167709bbf8265 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov  2017-01-09  615  		prev_rev = rev;
354542d034ab2a arch/x86/kernel/cpu/microcode/intel.c Andi Kleen       2016-06-09  616  	}
4bae1967357bfc arch/x86/kernel/microcode_intel.c     Ingo Molnar      2009-03-11  617  
e98b502bf22e1e arch/x86/kernel/cpu/microcode/intel.c Dave Hansen      2023-02-07  618  	return UCODE_UPDATED;
^1da177e4c3f41 arch/i386/kernel/microcode.c          Linus Torvalds   2005-04-16  619  }
^1da177e4c3f41 arch/i386/kernel/microcode.c          Linus Torvalds   2005-04-16  620  

:::::: The code at line 567 was first introduced by commit
:::::: 8da38ebaad23fe1b0c4a205438676f6356607cfc x86/microcode: Update the new microcode revision unconditionally

:::::: TO: Filippo Sironi <sironi@amazon.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
