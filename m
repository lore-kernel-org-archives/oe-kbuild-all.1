Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4F062F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 05:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675835994; x=1707371994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMoXtzBlYAhzl7e9stWSU/jmLiNI4Ri7vrxOOGXiPVc=;
  b=MXSlsmdFoAPAIS9eJypo+V9cqtON0wFf/ppHBvdGyyLoRJqwHITyleal
   h1Yx1x0Hf9/j7zbNfnL3sbbusyTTRtFPBqgoRIAzVwLrc51O+aw4Hw6mJ
   8/5zPnDbLYdoBp0+sSDUcGV6/7RobYW4icgXmkHZTst8a17/nUm8BlFrS
   o1vAd4MmJbj4gqUjhoTJ6LNmPkf98+/WcG6DPMR6SUODd1mvPYr13pmCb
   QFZEYMk9mcAxxHC0ZeMeP8moBuGhWh+zdSwvSlPDU0n7xw4gXG7eeuq8t
   YFzHBVM/60SGVuNREk1YzGmWbk8i28lqc4aGkHylc42uU3YGWwmw9DI1Y
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="310069055"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="310069055"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 21:59:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="660531306"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="660531306"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Feb 2023 21:59:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPdUm-0004Es-0v;
	Wed, 08 Feb 2023 05:59:52 +0000
Date: Wed, 8 Feb 2023 13:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:ucode-for-ashok 4/16]
 arch/x86/kernel/cpu/microcode/amd.c:534:28: warning: unused variable 'dummy'
Message-ID: <202302081312.RqN1HUgc-lkp@intel.com>
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
commit: 1f06d23f1930b256d37e15402fdb90e9f44db467 [4/16] ucode-version-op
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230208/202302081312.RqN1HUgc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=1f06d23f1930b256d37e15402fdb90e9f44db467
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel ucode-for-ashok
        git checkout 1f06d23f1930b256d37e15402fdb90e9f44db467
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/cpu/microcode/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/amd.c: In function 'load_ucode_amd_ap':
>> arch/x86/kernel/cpu/microcode/amd.c:534:28: warning: unused variable 'dummy' [-Wunused-variable]
     534 |         u32 *new_rev, rev, dummy;
         |                            ^~~~~
   arch/x86/kernel/cpu/microcode/amd.c: In function 'apply_microcode_amd':
   arch/x86/kernel/cpu/microcode/amd.c:718:17: error: label 'out' used but not defined
     718 |                 goto out;
         |                 ^~~~
   arch/x86/kernel/cpu/microcode/amd.c:695:29: warning: unused variable 'c' [-Wunused-variable]
     695 |         struct cpuinfo_x86 *c = &cpu_data(cpu);
         |                             ^
   arch/x86/kernel/cpu/microcode/amd.c: At top level:
   arch/x86/kernel/cpu/microcode/amd.c:950:10: error: 'struct microcode_ops' has no member named 'collect_cpu_info'
     950 |         .collect_cpu_info                 = collect_cpu_info_amd,
         |          ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/amd.c:950:45: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     950 |         .collect_cpu_info                 = collect_cpu_info_amd,
         |                                             ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/amd.c:950:45: note: (near initialization for 'microcode_amd_ops')
   arch/x86/kernel/cpu/microcode/amd.c:950:45: error: initialization of 'void (*)(int)' from incompatible pointer type 'int (*)(int,  struct cpu_signature *)' [-Werror=incompatible-pointer-types]
   arch/x86/kernel/cpu/microcode/amd.c:950:45: note: (near initialization for 'microcode_amd_ops.microcode_fini_cpu')
   arch/x86/kernel/cpu/microcode/amd.c:952:45: warning: initialized field overwritten [-Woverride-init]
     952 |         .microcode_fini_cpu               = microcode_fini_cpu_amd,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/amd.c:952:45: note: (near initialization for 'microcode_amd_ops.microcode_fini_cpu')
   arch/x86/kernel/cpu/microcode/amd.c:953:45: error: initialization of 'u32 (*)(int)' {aka 'unsigned int (*)(int)'} from incompatible pointer type 'u32 (*)(void)' {aka 'unsigned int (*)(void)'} [-Werror=incompatible-pointer-types]
     953 |         .get_microcode_revision           = get_microcode_revision_amd,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/amd.c:953:45: note: (near initialization for 'microcode_amd_ops.get_microcode_revision')
   cc1: some warnings being treated as errors


vim +/dummy +534 arch/x86/kernel/cpu/microcode/amd.c

e71bb4ec073901 Borislav Petkov 2017-01-20  529  
309aac77768c0c Borislav Petkov 2017-01-20  530  void load_ucode_amd_ap(unsigned int cpuid_1_eax)
fe055896c040df Borislav Petkov 2015-10-20  531  {
fe055896c040df Borislav Petkov 2015-10-20  532  	struct microcode_amd *mc;
69f5f983001f6d Borislav Petkov 2017-01-20  533  	struct cpio_data cp;
69f5f983001f6d Borislav Petkov 2017-01-20 @534  	u32 *new_rev, rev, dummy;
fe055896c040df Borislav Petkov 2015-10-20  535  
e71bb4ec073901 Borislav Petkov 2017-01-20  536  	if (IS_ENABLED(CONFIG_X86_32)) {
e71bb4ec073901 Borislav Petkov 2017-01-20  537  		mc	= (struct microcode_amd *)__pa_nodebug(amd_ucode_patch);
69f5f983001f6d Borislav Petkov 2017-01-20  538  		new_rev = (u32 *)__pa_nodebug(&ucode_new_rev);
e71bb4ec073901 Borislav Petkov 2017-01-20  539  	} else {
e71bb4ec073901 Borislav Petkov 2017-01-20  540  		mc	= (struct microcode_amd *)amd_ucode_patch;
69f5f983001f6d Borislav Petkov 2017-01-20  541  		new_rev = &ucode_new_rev;
e71bb4ec073901 Borislav Petkov 2017-01-20  542  	}
e71bb4ec073901 Borislav Petkov 2017-01-20  543  
1f06d23f1930b2 Dave Hansen     2023-02-07  544  	rev = get_microcode_revision_amd();
fe055896c040df Borislav Petkov 2015-10-20  545  
e7ad18d1169c62 Borislav Petkov 2022-10-05  546  	/*
e7ad18d1169c62 Borislav Petkov 2022-10-05  547  	 * Check whether a new patch has been saved already. Also, allow application of
e7ad18d1169c62 Borislav Petkov 2022-10-05  548  	 * the same revision in order to pick up SMT-thread-specific configuration even
e7ad18d1169c62 Borislav Petkov 2022-10-05  549  	 * if the sibling SMT thread already has an up-to-date revision.
e7ad18d1169c62 Borislav Petkov 2022-10-05  550  	 */
e7ad18d1169c62 Borislav Petkov 2022-10-05  551  	if (*new_rev && rev <= mc->hdr.patch_id) {
69f5f983001f6d Borislav Petkov 2017-01-20  552  		if (!__apply_microcode_amd(mc)) {
69f5f983001f6d Borislav Petkov 2017-01-20  553  			*new_rev = mc->hdr.patch_id;
06b8534cb72837 Borislav Petkov 2016-10-25  554  			return;
06b8534cb72837 Borislav Petkov 2016-10-25  555  		}
06b8534cb72837 Borislav Petkov 2016-10-25  556  	}
88b2f634028f1f Borislav Petkov 2016-08-17  557  
61de9b7036f264 Borislav Petkov 2022-12-19  558  	find_blobs_in_containers(cpuid_1_eax, &cp);
69f5f983001f6d Borislav Petkov 2017-01-20  559  	if (!(cp.data && cp.size))
fe055896c040df Borislav Petkov 2015-10-20  560  		return;
fe055896c040df Borislav Petkov 2015-10-20  561  
61de9b7036f264 Borislav Petkov 2022-12-19  562  	early_apply_microcode(cpuid_1_eax, cp.data, cp.size, false);
fe055896c040df Borislav Petkov 2015-10-20  563  }
fe055896c040df Borislav Petkov 2015-10-20  564  

:::::: The code at line 534 was first introduced by commit
:::::: 69f5f983001f6d097aac774a9e917f44657f3367 x86/microcode/AMD: Remove AP scanning optimization

:::::: TO: Borislav Petkov <bp@suse.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
