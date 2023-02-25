Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AC92919
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677325530; x=1708861530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p0EpRTwIVLZ19WmuvUyDL+heGphtTtM6CXzcH6r1PFI=;
  b=l+tgrlzn3MbxC7E54NDuTrPDbnIA1YLTxf5Kkelj8F2ivrbBx/odijg/
   WnVk1M4JlsdZY3CSduO/naKCMUTOuBZ82MDCmIrSTrkzKY9sMDRjH7Z3u
   HjbpfTveJEHpIJF5cLSajI9gH9q2d/fmP1xsqYgsowxCd5caHWSEDlGzM
   xb+8Qr9CEob2AmmqH0kYBsVrblmYbxo9IQ84h1omCy+JaqatLhkgvgQuf
   5J2WIS53SHjD5ZoQMjdR0Q5iSGO6isDJInC9l0/8YQEOFB5A5K38WizEJ
   szbnUKEx6322AaLMPG8OFmF+y4i7dQ4W2/0pV79WwarDenmXXT5gWqXlo
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335895940"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="335895940"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 03:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="741935217"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="741935217"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2023 03:45:29 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVszY-00039z-2Q;
	Sat, 25 Feb 2023 11:45:28 +0000
Date: Sat, 25 Feb 2023 19:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:orc-unwind-hint-refactor-2 1/1]
 arch/x86/kernel/head_64.S:393: Error: no such instruction:
 `annotate_unret_end'
Message-ID: <202302251958.Ki1AO0Sq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git orc-unwind-hint-refactor-2
head:   7207c552a1fa1555c87e58296468b8ed41996954
commit: 1bc8b3be57f11ae5e8b6ed3d6fb8184d5f0ecb70 [1/1] x86/unwind/orc: Split EMPTY type into UNDEFINED and END_OF_STACK
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230225/202302251958.Ki1AO0Sq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=1bc8b3be57f11ae5e8b6ed3d6fb8184d5f0ecb70
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe orc-unwind-hint-refactor-2
        git checkout 1bc8b3be57f11ae5e8b6ed3d6fb8184d5f0ecb70
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251958.Ki1AO0Sq-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/head_64.S: Assembler messages:
>> arch/x86/kernel/head_64.S:393: Error: no such instruction: `annotate_unret_end'


vim +393 arch/x86/kernel/head_64.S

1aa9aa8ee517e0 Joerg Roedel   2020-09-08  379  
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  380  #ifdef CONFIG_AMD_MEM_ENCRYPT
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  381  /*
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  382   * VC Exception handler used during early boot when running on kernel
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  383   * addresses, but before the switch to the idt_table can be made.
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  384   * The early_idt_handler_array can't be used here because it calls into a lot
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  385   * of __init code and this handler is also used during CPU offlining/onlining.
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  386   * Therefore this handler ends up in the .text section so that it stays around
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  387   * when .init.text is freed.
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  388   */
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  389  SYM_CODE_START_NOALIGN(vc_boot_ghcb)
1bc8b3be57f11a Josh Poimboeuf 2023-02-24  390  	UNWIND_HINT_IRET_REGS offset=8 validate_unret=0
e8d61bdf0fdfae Peter Zijlstra 2022-03-08  391  	ENDBR
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  392  
a09a6e2399ba05 Peter Zijlstra 2022-06-14 @393  	ANNOTATE_UNRET_END
a09a6e2399ba05 Peter Zijlstra 2022-06-14  394  
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  395  	/* Build pt_regs */
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  396  	PUSH_AND_CLEAR_REGS
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  397  
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  398  	/* Call C handler */
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  399  	movq    %rsp, %rdi
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  400  	movq	ORIG_RAX(%rsp), %rsi
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  401  	movq	initial_vc_handler(%rip), %rax
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  402  	ANNOTATE_RETPOLINE_SAFE
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  403  	call	*%rax
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  404  
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  405  	/* Unwind pt_regs */
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  406  	POP_REGS
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  407  
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  408  	/* Remove Error Code */
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  409  	addq    $8, %rsp
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  410  
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  411  	iretq
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  412  SYM_CODE_END(vc_boot_ghcb)
42e78e9719aa0c Fenghua Yu     2012-11-13  413  #endif
42e78e9719aa0c Fenghua Yu     2012-11-13  414  
b32f96c75d0dcb Josh Poimboeuf 2016-08-18  415  	/* Both SMP bootup and ACPI suspend change these variables */
da5968ae305ab5 Sam Ravnborg   2008-02-17  416  	__REFDATA
8170e6bed465b4 H. Peter Anvin 2013-01-24  417  	.balign	8
b1bd27b9ad45d7 Jiri Slaby     2019-10-11  418  SYM_DATA(initial_code,	.quad x86_64_start_kernel)
b1bd27b9ad45d7 Jiri Slaby     2019-10-11  419  SYM_DATA(initial_gs,	.quad INIT_PER_CPU_VAR(fixed_percpu_data))
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  420  #ifdef CONFIG_AMD_MEM_ENCRYPT
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  421  SYM_DATA(initial_vc_handler,	.quad handle_vc_boot_ghcb)
1aa9aa8ee517e0 Joerg Roedel   2020-09-08  422  #endif
b1bd27b9ad45d7 Jiri Slaby     2019-10-11  423  

:::::: The code at line 393 was first introduced by commit
:::::: a09a6e2399ba0595c3042b3164f3ca68a3cff33e objtool: Add entry UNRET validation

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
