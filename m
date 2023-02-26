Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408A836E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Feb 2023 02:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677377628; x=1708913628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RAQgRLR/y5+gRLH/11Vtsje1oSfScZa9OUVutPaYXk0=;
  b=DrwgeC85P721SazXAoQLreRMZdmnPhq6/U0TsYEKX9aJ7iSuzOXyuP6+
   NEZ1mVZc1Upa5X/IEThQ/q4pTb90rO6Tm81G43amr6NEmcdRRLiWf2QHA
   kA7997m/+/zWIOR1USkNWKI7MmdbDlYn5EMOD9vksNFeyS46YAXCqI94C
   EzPZou2SwfbypVLVtETdEdM54/oDXlLQk3XBjNotmfv8ibtqDT+N0/PpD
   WbX+Er45casOkAR/8hcZSmEn9s+zcCk5AP2gtglRzlEboxbeAuenRUdR1
   nTfoigkeZjNqYeaH9O0zK1ubGuSt7gyeRyGc2b7zLYOXiUo7UShY7EqEC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="332403906"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="332403906"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 18:13:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="782849666"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="782849666"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2023 18:13:46 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW6Xp-0003Up-1z;
	Sun, 26 Feb 2023 02:13:45 +0000
Date: Sun, 26 Feb 2023 10:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:orc-unwind-hint-refactor-2 2/4]
 arch/x86/kernel/ftrace_64.S:11: Error: Parameter named `end' does not exist
 for macro `unwind_hint'
Message-ID: <202302261059.Igi9HwjM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git orc-unwind-hint-refactor-2
head:   e37c67067de5ba94dbd3f42c7174caff1cac6c48
commit: 1fb3be8fb8c57ad5321008e42f37a2fc7f380984 [2/4] objtool: Use relative pointers for annotations
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230226/202302261059.Igi9HwjM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=1fb3be8fb8c57ad5321008e42f37a2fc7f380984
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe orc-unwind-hint-refactor-2
        git checkout 1fb3be8fb8c57ad5321008e42f37a2fc7f380984
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302261059.Igi9HwjM-lkp@intel.com/

Note: the jpoimboe/orc-unwind-hint-refactor-2 HEAD e37c67067de5ba94dbd3f42c7174caff1cac6c48 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/x86/kernel/ftrace_64.S: Assembler messages:
>> arch/x86/kernel/ftrace_64.S:144: Error: bad expression
   arch/x86/kernel/ftrace_64.S:56:  Info: macro invoked from here
   arch/x86/kernel/ftrace_64.S:291:   Info: macro invoked from here
>> arch/x86/kernel/ftrace_64.S:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/kernel/ftrace_64.S:56:  Info: macro invoked from here
   arch/x86/kernel/ftrace_64.S:291:   Info: macro invoked from here
>> arch/x86/kernel/ftrace_64.S:11: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/kernel/ftrace_64.S:343:  Info: macro invoked from here
>> arch/x86/kernel/ftrace_64.S:144: Error: bad expression
   arch/x86/kernel/ftrace_64.S:11:  Info: macro invoked from here
   arch/x86/kernel/ftrace_64.S:343:   Info: macro invoked from here
>> arch/x86/kernel/ftrace_64.S:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/kernel/ftrace_64.S:11:  Info: macro invoked from here
   arch/x86/kernel/ftrace_64.S:343:   Info: macro invoked from here
--
   arch/x86/kvm/vmx/vmenter.S: Assembler messages:
>> arch/x86/kvm/vmx/vmenter.S:144: Error: bad expression
   arch/x86/kvm/vmx/vmenter.S:60:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:140:   Info: macro invoked from here
>> arch/x86/kvm/vmx/vmenter.S:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/kvm/vmx/vmenter.S:60:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:140:   Info: macro invoked from here
>> arch/x86/kvm/vmx/vmenter.S:144: Error: bad expression
   arch/x86/kvm/vmx/vmenter.S:64:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:160:   Info: macro invoked from here
>> arch/x86/kvm/vmx/vmenter.S:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/kvm/vmx/vmenter.S:64:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:160:   Info: macro invoked from here


vim +11 arch/x86/kernel/ftrace_64.S

784d5699eddc55 arch/x86/kernel/mcount_64.S Al Viro                  2016-01-11  @11  #include <asm/export.h>
9351803bd803cd arch/x86/kernel/ftrace_64.S David Woodhouse          2018-01-11   12  #include <asm/nospec-branch.h>
e2ac83d74a4d75 arch/x86/kernel/ftrace_64.S Josh Poimboeuf           2018-01-22   13  #include <asm/unwind_hints.h>
ea1ed38dba64b6 arch/x86/kernel/ftrace_64.S Peter Zijlstra           2019-05-07   14  #include <asm/frame.h>
e18eead3c3e008 arch/x86/kernel/mcount_64.S Steven Rostedt           2014-05-08   15  
e18eead3c3e008 arch/x86/kernel/mcount_64.S Steven Rostedt           2014-05-08   16  	.code64
b9f6976bfb9491 arch/x86/kernel/ftrace_64.S Thomas Gleixner          2020-03-25   17  	.section .text, "ax"
e18eead3c3e008 arch/x86/kernel/mcount_64.S Steven Rostedt           2014-05-08   18  
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   19) #ifdef CONFIG_FRAME_POINTER
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   20) /* Save parent and function stack frames (rip and rbp) */
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   21) #  define MCOUNT_FRAME_SIZE	(8+16*2)
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   22) #else
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   23) /* No need to save a stack frame */
e2ac83d74a4d75 arch/x86/kernel/ftrace_64.S Josh Poimboeuf           2018-01-22   24  # define MCOUNT_FRAME_SIZE	0
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   25) #endif /* CONFIG_FRAME_POINTER */
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   26) 
85f6f0290c4d46 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   27) /* Size of stack used to save mcount regs in save_mcount_regs */
dc2745b61907cf arch/x86/kernel/ftrace_64.S Peter Zijlstra           2020-04-01   28  #define MCOUNT_REG_SIZE		(FRAME_SIZE + MCOUNT_FRAME_SIZE)
85f6f0290c4d46 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   29) 
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   30) /*
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   31)  * gcc -pg option adds a call to 'mcount' in most functions.
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   32)  * When -mfentry is used, the call is to 'fentry' and not 'mcount'
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   33)  * and is done before the function's stack frame is set up.
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   34)  * They both require a set of regs to be saved before calling
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   35)  * any C code and restored before returning back to the function.
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   36)  *
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   37)  * On boot up, all these calls are converted into nops. When tracing
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   38)  * is enabled, the call can jump to either ftrace_caller or
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   39)  * ftrace_regs_caller. Callbacks (tracing functions) that require
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   40)  * ftrace_regs_caller (like kprobes) need to have pt_regs passed to
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   41)  * it. For this reason, the size of the pt_regs structure will be
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   42)  * allocated on the stack and the required mcount registers will
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   43)  * be saved in the locations that pt_regs has them in.
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   44)  */
05df710ec343cf arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   45) 
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   46) /*
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   47)  * @added: the amount of stack added before calling this
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   48)  *
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   49)  * After this is called, the following registers contain:
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   50)  *
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   51)  *  %rdi - holds the address that called the trampoline
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   52)  *  %rsi - holds the parent function (traced function's return address)
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   53)  *  %rdx - holds the original %rbp
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   54)  */
527aa75b333f90 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   55) .macro save_mcount_regs added=0
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   56) 
e2ac83d74a4d75 arch/x86/kernel/ftrace_64.S Josh Poimboeuf           2018-01-22   57  #ifdef CONFIG_FRAME_POINTER
e2ac83d74a4d75 arch/x86/kernel/ftrace_64.S Josh Poimboeuf           2018-01-22   58  	/* Save the original rbp */
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   59) 	pushq %rbp
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   60) 
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   61) 	/*
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   62) 	 * Stack traces will stop at the ftrace trampoline if the frame pointer
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   63) 	 * is not set up properly. If fentry is used, we need to save a frame
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   64) 	 * pointer for the parent as well as the function traced, because the
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   65) 	 * fentry is called before the stack frame is set up, where as mcount
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   66) 	 * is called afterward.
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   67) 	 */
562e14f7229224 arch/x86/kernel/ftrace_64.S Steven Rostedt (VMware   2019-05-09   68) 
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   69) 	/* Save the parent pointer (skip orig rbp and our return address) */
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   70) 	pushq \added+8*2(%rsp)
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   71) 	pushq %rbp
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   72) 	movq %rsp, %rbp
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   73) 	/* Save the return address (now skip orig rbp, rbp and parent) */
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   74) 	pushq \added+8*3(%rsp)
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   75) 	pushq %rbp
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   76) 	movq %rsp, %rbp
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   77) #endif /* CONFIG_FRAME_POINTER */
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   78) 
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   79) 	/*
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   80) 	 * We add enough stack to save all regs.
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   81) 	 */
dc2745b61907cf arch/x86/kernel/ftrace_64.S Peter Zijlstra           2020-04-01   82  	subq $(FRAME_SIZE), %rsp
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   83) 	movq %rax, RAX(%rsp)
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   84) 	movq %rcx, RCX(%rsp)
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   85) 	movq %rdx, RDX(%rsp)
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   86) 	movq %rsi, RSI(%rsp)
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   87) 	movq %rdi, RDI(%rsp)
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   88) 	movq %r8, R8(%rsp)
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   89) 	movq %r9, R9(%rsp)
562955fe6a558b arch/x86/kernel/ftrace_64.S Steven Rostedt (VMware   2019-11-08   90) 	movq $0, ORIG_RAX(%rsp)
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   91) 	/*
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   92) 	 * Save the original RBP. Even though the mcount ABI does not
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   93) 	 * require this, it helps out callers.
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   94) 	 */
e2ac83d74a4d75 arch/x86/kernel/ftrace_64.S Josh Poimboeuf           2018-01-22   95  #ifdef CONFIG_FRAME_POINTER
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24   96) 	movq MCOUNT_REG_SIZE-8(%rsp), %rdx
e2ac83d74a4d75 arch/x86/kernel/ftrace_64.S Josh Poimboeuf           2018-01-22   97  #else
e2ac83d74a4d75 arch/x86/kernel/ftrace_64.S Josh Poimboeuf           2018-01-22   98  	movq %rbp, %rdx
e2ac83d74a4d75 arch/x86/kernel/ftrace_64.S Josh Poimboeuf           2018-01-22   99  #endif
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  100) 	movq %rdx, RBP(%rsp)
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  101) 
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  102) 	/* Copy the parent address into %rsi (second parameter) */
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  103) 	movq MCOUNT_REG_SIZE+8+\added(%rsp), %rsi
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  104) 
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  105) 	 /* Move RIP to its proper location */
85f6f0290c4d46 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  106) 	movq MCOUNT_REG_SIZE+\added(%rsp), %rdi
094dfc54513951 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  107) 	movq %rdi, RIP(%rsp)
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  108) 
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  109) 	/*
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  110) 	 * Now %rdi (the first parameter) has the return address of
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  111) 	 * where ftrace_call returns. But the callbacks expect the
6a06bdbf7f9c66 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  112) 	 * address of the call itself.
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  113) 	 */
f1ab00af816ec8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  114) 	subq $MCOUNT_INSN_SIZE, %rdi
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  115) 	.endm
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  116) 
562955fe6a558b arch/x86/kernel/ftrace_64.S Steven Rostedt (VMware   2019-11-08  117) .macro restore_mcount_regs save=0
562955fe6a558b arch/x86/kernel/ftrace_64.S Steven Rostedt (VMware   2019-11-08  118) 
562955fe6a558b arch/x86/kernel/ftrace_64.S Steven Rostedt (VMware   2019-11-08  119) 	/* ftrace_regs_caller or frame pointers require this */
562955fe6a558b arch/x86/kernel/ftrace_64.S Steven Rostedt (VMware   2019-11-08  120) 	movq RBP(%rsp), %rbp
562955fe6a558b arch/x86/kernel/ftrace_64.S Steven Rostedt (VMware   2019-11-08  121) 
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  122) 	movq R9(%rsp), %r9
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  123) 	movq R8(%rsp), %r8
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  124) 	movq RDI(%rsp), %rdi
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  125) 	movq RSI(%rsp), %rsi
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  126) 	movq RDX(%rsp), %rdx
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  127) 	movq RCX(%rsp), %rcx
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  128) 	movq RAX(%rsp), %rax
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  129) 
562955fe6a558b arch/x86/kernel/ftrace_64.S Steven Rostedt (VMware   2019-11-08  130) 	addq $MCOUNT_REG_SIZE-\save, %rsp
0687c36e456ca8 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  131) 
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  132) 	.endm
4bcdf1522fb11b arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  133) 
883bbbffa5a4ff arch/x86/kernel/ftrace_64.S Peter Zijlstra           2022-10-18  134  SYM_TYPED_FUNC_START(ftrace_stub)
bd194611444caf arch/x86/kernel/ftrace_64.S Ingo Molnar              2022-10-22  135  	CALL_DEPTH_ACCOUNT
883bbbffa5a4ff arch/x86/kernel/ftrace_64.S Peter Zijlstra           2022-10-18  136  	RET
883bbbffa5a4ff arch/x86/kernel/ftrace_64.S Peter Zijlstra           2022-10-18  137  SYM_FUNC_END(ftrace_stub)
883bbbffa5a4ff arch/x86/kernel/ftrace_64.S Peter Zijlstra           2022-10-18  138  
883bbbffa5a4ff arch/x86/kernel/ftrace_64.S Peter Zijlstra           2022-10-18  139  SYM_TYPED_FUNC_START(ftrace_stub_graph)
bd194611444caf arch/x86/kernel/ftrace_64.S Ingo Molnar              2022-10-22  140  	CALL_DEPTH_ACCOUNT
883bbbffa5a4ff arch/x86/kernel/ftrace_64.S Peter Zijlstra           2022-10-18  141  	RET
883bbbffa5a4ff arch/x86/kernel/ftrace_64.S Peter Zijlstra           2022-10-18  142  SYM_FUNC_END(ftrace_stub_graph)
883bbbffa5a4ff arch/x86/kernel/ftrace_64.S Peter Zijlstra           2022-10-18  143  
76c2f13c551597 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24 @144) #ifdef CONFIG_DYNAMIC_FTRACE
76c2f13c551597 arch/x86/kernel/mcount_64.S Steven Rostedt (Red Hat  2014-11-24  145) 

:::::: The code at line 11 was first introduced by commit
:::::: 784d5699eddc55878627da20d3fe0c8542e2f1a2 x86: move exports to actual definitions

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
