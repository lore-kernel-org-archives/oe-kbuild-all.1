Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C1E5CB9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685892354; x=1717428354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ayuewPseGvgN7g+tt2rlnWIWdpe4nNKRa5xhikRkxk8=;
  b=lCpoO7XAHqS9MiWfW2Vo8DlSrA9NFZqQFffHbVF4rSj8TB8JVa2BYGaP
   47rZPgPXIkJs66UpilA8NYzozTVi6TP1CQIgqmDUSv6Hw77nImZqs7P8H
   2zuSJlw9YN+7lJAMiXOENCNpiA2NRobl1FQY99sS1jkBnPDGoGmaMZvzY
   hcDMvpjorNIRKa2sMNGPR6wtHVh8bU/pjm4X3HGu3xFAti74QaqUXpGEc
   supEDPQrv1YHNxtNd9+vgEx6NDw/FCHdL7uo+e35Jektw7UwUDpJgieIb
   AaQ/ziti8hAcaN88Cj7Fg/O5gJ2Wfs8ictzJ/MIb4BXyuLt+A+UnBMYFj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="419738507"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="419738507"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 08:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="882636398"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="882636398"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Jun 2023 08:25:52 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5pc7-0002zv-3D;
	Sun, 04 Jun 2023 15:25:52 +0000
Date: Sun, 4 Jun 2023 23:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 3/4] arch/arm64/kernel/process.c:695:17:
 error: implicit declaration of function 'arch_prctl_mem_model_set'; did you
 mean 'arch_prctl_spec_ctrl_set'?
Message-ID: <202306042353.BtatOvX5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   38015ad2af19088e66e0c81f7efd5a8b51814026
commit: 4ab692b22440dd1d9203e939a10fb9d5919b54d8 [3/4] arm64: Implement PR_{GET,SET}_MEM_MODEL for always-TSO CPUs
config: arm64-randconfig-r006-20230604 (https://download.01.org/0day-ci/archive/20230604/202306042353.BtatOvX5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/4ab692b22440dd1d9203e939a10fb9d5919b54d8
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/220-tso
        git checkout 4ab692b22440dd1d9203e939a10fb9d5919b54d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306042353.BtatOvX5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/process.c: In function 'copy_thread':
   arch/arm64/kernel/process.c:378:34: error: 'struct thread_struct' has no member named 'actlr'
     378 |                         p->thread.actlr = read_sysreg(actlr_el1);
         |                                  ^
   arch/arm64/kernel/process.c: In function 'actlr_thread_switch':
   arch/arm64/kernel/process.c:531:24: error: 'struct thread_struct' has no member named 'actlr'
     531 |         current->thread.actlr = read_sysreg(actlr_el1);
         |                        ^
   In file included from arch/arm64/include/asm/cputype.h:193,
                    from arch/arm64/include/asm/cache.h:42,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/compat.h:10,
                    from arch/arm64/kernel/process.c:9:
   arch/arm64/kernel/process.c:532:34: error: 'struct thread_struct' has no member named 'actlr'
     532 |         write_sysreg(next->thread.actlr, actlr_el1);
         |                                  ^
   arch/arm64/include/asm/sysreg.h:832:27: note: in definition of macro 'write_sysreg'
     832 |         u64 __val = (u64)(v);                                   \
         |                           ^
   arch/arm64/kernel/process.c: In function 'arch_setup_new_exec':
>> arch/arm64/kernel/process.c:695:17: error: implicit declaration of function 'arch_prctl_mem_model_set'; did you mean 'arch_prctl_spec_ctrl_set'? [-Werror=implicit-function-declaration]
     695 |                 arch_prctl_mem_model_set(current, PR_SET_MEM_MODEL_DEFAULT);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 arch_prctl_spec_ctrl_set
   cc1: some warnings being treated as errors


vim +695 arch/arm64/kernel/process.c

   658	
   659	/*
   660	 * Called from setup_new_exec() after (COMPAT_)SET_PERSONALITY.
   661	 */
   662	void arch_setup_new_exec(void)
   663	{
   664		unsigned long mmflags = 0;
   665	
   666		if (is_compat_task()) {
   667			mmflags = MMCF_AARCH32;
   668	
   669			/*
   670			 * Restrict the CPU affinity mask for a 32-bit task so that
   671			 * it contains only 32-bit-capable CPUs.
   672			 *
   673			 * From the perspective of the task, this looks similar to
   674			 * what would happen if the 64-bit-only CPUs were hot-unplugged
   675			 * at the point of execve(), although we try a bit harder to
   676			 * honour the cpuset hierarchy.
   677			 */
   678			if (static_branch_unlikely(&arm64_mismatched_32bit_el0))
   679				force_compatible_cpus_allowed_ptr(current);
   680		} else if (static_branch_unlikely(&arm64_mismatched_32bit_el0)) {
   681			relax_compatible_cpus_allowed_ptr(current);
   682		}
   683	
   684		current->mm->context.flags = mmflags;
   685		ptrauth_thread_init_user();
   686		mte_thread_init_user();
   687		erratum_1418040_new_exec();
   688	
   689		if (task_spec_ssb_noexec(current)) {
   690			arch_prctl_spec_ctrl_set(current, PR_SPEC_STORE_BYPASS,
   691						 PR_SPEC_ENABLE);
   692		}
   693	
   694		if (IS_ENABLED(CONFIG_ARM64_MEMORY_MODEL_CONTROL)) {
 > 695			arch_prctl_mem_model_set(current, PR_SET_MEM_MODEL_DEFAULT);
   696		}
   697	}
   698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
