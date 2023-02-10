Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F222A2F5E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676041060; x=1707577060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j+/4C8Y69Adxfi0F1EtI8PPOknkZgK+37I1ePX4iveI=;
  b=ffCyAaIVv08yRTULzwufNE+WQIJjzXoU2U/NZxLCibDHENfMACMIHqUi
   L881BTM33+1+Lk7fr2ZnKNaWIiOPFay27zZ4gHDJw9YCtdxSQmkxhaH5E
   uvgui/ILY5rFICHcanPinJjniXGNLggDnas2cvaa5Z5ufyqXtOqMN8NYV
   lV5x5Yvi2nJGjIyKJnVXIk/Dbx6bu9WedeQjM1BSpSQAawieXLt44PzF6
   lwS5ckuQvBRrsbx0we2HJIZBlGELN5w9RAUkFhZyN1egLPnjAkolKEhJz
   ra//Q7KfztkFD7oP/2+G4pYj/W6kr7HcZTT1NkLYVe7PtnRQJr8Wd77FR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="357836474"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="357836474"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 06:57:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="842044759"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="842044759"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Feb 2023 06:57:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQUqH-0005qn-15;
	Fri, 10 Feb 2023 14:57:37 +0000
Date: Fri, 10 Feb 2023 22:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 5/6] arch/x86/entry/entry_64.S:444: Error:
 register type mismatch for `xor'
Message-ID: <202302102218.RuerOFwB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   cc1feb4e38be192cd99f7598777ff691f8a8a20e
commit: 943db25eef966d66b8d6edd9d83ce9cb117f7ee9 [5/6] x86: Shorten RESET_CALL_DEPTH
config: x86_64-randconfig-a004 (https://download.01.org/0day-ci/archive/20230210/202302102218.RuerOFwB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=943db25eef966d66b8d6edd9d83ce9cb117f7ee9
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/core
        git checkout 943db25eef966d66b8d6edd9d83ce9cb117f7ee9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302102218.RuerOFwB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/entry/entry_64.S: Assembler messages:
>> arch/x86/entry/entry_64.S:444: Error: register type mismatch for `xor'
   arch/x86/entry/entry_64.S:290:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:118:   Info: macro invoked from here
>> arch/x86/entry/entry_64.S:444: Error: register type mismatch for `xor'
   arch/x86/entry/entry_64.S:290:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:1227:   Info: macro invoked from here


vim +444 arch/x86/entry/entry_64.S

6368558c37107b Thomas Gleixner 2020-05-21  438  
cfa82a00533f70 Thomas Gleixner 2020-02-25  439  /**
cfa82a00533f70 Thomas Gleixner 2020-02-25  440   * idtentry_mce_db - Macro to generate entry stubs for #MC and #DB
cfa82a00533f70 Thomas Gleixner 2020-02-25  441   * @vector:		Vector number
cfa82a00533f70 Thomas Gleixner 2020-02-25  442   * @asmsym:		ASM symbol for the entry point
cfa82a00533f70 Thomas Gleixner 2020-02-25  443   * @cfunc:		C function to be called
cfa82a00533f70 Thomas Gleixner 2020-02-25 @444   *
cfa82a00533f70 Thomas Gleixner 2020-02-25  445   * The macro emits code to set up the kernel context for #MC and #DB
cfa82a00533f70 Thomas Gleixner 2020-02-25  446   *
cfa82a00533f70 Thomas Gleixner 2020-02-25  447   * If the entry comes from user space it uses the normal entry path
cfa82a00533f70 Thomas Gleixner 2020-02-25  448   * including the return to user space work and preemption checks on
cfa82a00533f70 Thomas Gleixner 2020-02-25  449   * exit.
cfa82a00533f70 Thomas Gleixner 2020-02-25  450   *
cfa82a00533f70 Thomas Gleixner 2020-02-25  451   * If hits in kernel mode then it needs to go through the paranoid
cfa82a00533f70 Thomas Gleixner 2020-02-25  452   * entry as the exception can hit any random state. No preemption
cfa82a00533f70 Thomas Gleixner 2020-02-25  453   * check on exit to keep the paranoid path simple.
cfa82a00533f70 Thomas Gleixner 2020-02-25  454   */
cfa82a00533f70 Thomas Gleixner 2020-02-25  455  .macro idtentry_mce_db vector asmsym cfunc
cfa82a00533f70 Thomas Gleixner 2020-02-25  456  SYM_CODE_START(\asmsym)
cfa82a00533f70 Thomas Gleixner 2020-02-25  457  	UNWIND_HINT_IRET_REGS
8f93402b92d443 Peter Zijlstra  2022-03-08  458  	ENDBR
cfa82a00533f70 Thomas Gleixner 2020-02-25  459  	ASM_CLAC
c64cc2802a784e Lai Jiangshan   2022-04-21  460  	cld
cfa82a00533f70 Thomas Gleixner 2020-02-25  461  
cfa82a00533f70 Thomas Gleixner 2020-02-25  462  	pushq	$-1			/* ORIG_RAX: no syscall to restart */
cfa82a00533f70 Thomas Gleixner 2020-02-25  463  
cfa82a00533f70 Thomas Gleixner 2020-02-25  464  	/*
cfa82a00533f70 Thomas Gleixner 2020-02-25  465  	 * If the entry is from userspace, switch stacks and treat it as
cfa82a00533f70 Thomas Gleixner 2020-02-25  466  	 * a normal entry.
cfa82a00533f70 Thomas Gleixner 2020-02-25  467  	 */
cfa82a00533f70 Thomas Gleixner 2020-02-25  468  	testb	$3, CS-ORIG_RAX(%rsp)
cfa82a00533f70 Thomas Gleixner 2020-02-25  469  	jnz	.Lfrom_usermode_switch_stack_\@
cfa82a00533f70 Thomas Gleixner 2020-02-25  470  
c82965f9e53005 Chang S. Bae    2020-05-28  471  	/* paranoid_entry returns GS information for paranoid_exit in EBX. */
cfa82a00533f70 Thomas Gleixner 2020-02-25  472  	call	paranoid_entry
cfa82a00533f70 Thomas Gleixner 2020-02-25  473  
cfa82a00533f70 Thomas Gleixner 2020-02-25  474  	UNWIND_HINT_REGS
cfa82a00533f70 Thomas Gleixner 2020-02-25  475  
cfa82a00533f70 Thomas Gleixner 2020-02-25  476  	movq	%rsp, %rdi		/* pt_regs pointer */
cfa82a00533f70 Thomas Gleixner 2020-02-25  477  
cfa82a00533f70 Thomas Gleixner 2020-02-25  478  	call	\cfunc
cfa82a00533f70 Thomas Gleixner 2020-02-25  479  
cfa82a00533f70 Thomas Gleixner 2020-02-25  480  	jmp	paranoid_exit
cfa82a00533f70 Thomas Gleixner 2020-02-25  481  
cfa82a00533f70 Thomas Gleixner 2020-02-25  482  	/* Switch to the regular task stack and use the noist entry point */
cfa82a00533f70 Thomas Gleixner 2020-02-25  483  .Lfrom_usermode_switch_stack_\@:
e2dcb5f1390715 Thomas Gleixner 2020-05-21  484  	idtentry_body noist_\cfunc, has_error_code=0
cfa82a00533f70 Thomas Gleixner 2020-02-25  485  

:::::: The code at line 444 was first introduced by commit
:::::: cfa82a00533f7074011a3a49fbb6ed1b1f6fa010 x86/entry: Distangle idtentry

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
