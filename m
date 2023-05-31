Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F61FBF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 04:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685506860; x=1717042860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+x4QAcpQ6s6UmhjG7J4qhHc9UhgN40/jgieHlbgfhlw=;
  b=SKZEF9fv6ENKtxh/QDs5r5ZvJeeGxJ303F2ufl0cnG4Z5UmIrZCUqPCQ
   Qh2gJiuR/N6kV/4hWNCjKWB9q385yvpKYT9RgfcrFk2PHa0A5tAGF+Hh9
   G7V5UaHuSYoexIg+HKfFbrVe5jCC6fWiKC1Kgpnh24C9RLLjf2FTzL4qE
   wAo5vWUKT+QjGTXpcKai6X/YSEVV4gz/4+6JqJ3Xn8A66TiTVR3O1vKQl
   oiM//9Yp4jMCAr7X+0JaVVsJde+oAliPWW8QR6c/DBSPUxCYPja9Ofmo9
   CCNg13WAJQMhd18nWY5+9McuOGLUfl7wsrUs1gLzu65jytZgn0DJWK8Ou
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383390901"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="383390901"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 21:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="1036870409"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="1036870409"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 May 2023 21:20:58 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4DKU-00014x-15;
	Wed, 31 May 2023 04:20:58 +0000
Date: Wed, 31 May 2023 12:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:vmware-rbp-breakage 15/15] arch/x86/kvm/vmx/vmenter.S:100:
 Error: found '
Message-ID: <202305311233.Ndi23sPd-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git vmware-rbp-breakage
head:   9d357e3aaa81442ec72c0dfd88b553c868b5aa6c
commit: 9d357e3aaa81442ec72c0dfd88b553c868b5aa6c [15/15] drm/vmwgfx: Silence RBP clobber warnings
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230531/202305311233.Ndi23sPd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=9d357e3aaa81442ec72c0dfd88b553c868b5aa6c
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe vmware-rbp-breakage
        git checkout 9d357e3aaa81442ec72c0dfd88b553c868b5aa6c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305311233.Ndi23sPd-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/include/asm/unwind_hints.h: Assembler messages:
   arch/x86/include/asm/unwind_hints.h:69: Error: Bad parameter list for macro `unwind_hint'
   arch/x86/include/asm/unwind_hints.h:73: Error: Bad parameter list for macro `unwind_hint'
>> arch/x86/kvm/vmx/vmenter.S:100: Error: found '
   ', expected: ')'
   arch/x86/kvm/vmx/vmenter.S:173:  Info: macro invoked from here
>> arch/x86/kvm/vmx/vmenter.S:101: Error: junk at end of line, first unrecognized character is `)'
   arch/x86/kvm/vmx/vmenter.S:173:  Info: macro invoked from here
>> arch/x86/kvm/vmx/vmenter.S:100: Error: found '
   ', expected: ')'
   arch/x86/kvm/vmx/vmenter.S:193:  Info: macro invoked from here
>> arch/x86/kvm/vmx/vmenter.S:101: Error: junk at end of line, first unrecognized character is `)'
   arch/x86/kvm/vmx/vmenter.S:193:  Info: macro invoked from here


vim +100 arch/x86/kvm/vmx/vmenter.S

453eafbe65f72c Sean Christopherson 2018-12-20   68  
5e0781df189904 Sean Christopherson 2019-01-25   69  /**
ee2fc635ef714b Sean Christopherson 2019-01-25   70   * __vmx_vcpu_run - Run a vCPU via a transition to VMX guest mode
fc02735b14fff8 Josh Poimboeuf      2022-06-14   71   * @vmx:	struct vcpu_vmx *
5e0781df189904 Sean Christopherson 2019-01-25   72   * @regs:	unsigned long * (to guest registers)
bb06650634d355 Josh Poimboeuf      2022-06-14   73   * @flags:	VMX_RUN_VMRESUME:	use VMRESUME instead of VMLAUNCH
fc02735b14fff8 Josh Poimboeuf      2022-06-14   74   *		VMX_RUN_SAVE_SPEC_CTRL: save guest SPEC_CTRL into vmx->spec_ctrl
5e0781df189904 Sean Christopherson 2019-01-25   75   *
5e0781df189904 Sean Christopherson 2019-01-25   76   * Returns:
e75c3c3a0487da Sean Christopherson 2019-01-25   77   *	0 on VM-Exit, 1 on VM-Fail
5e0781df189904 Sean Christopherson 2019-01-25   78   */
6dcc5627f6aec4 Jiri Slaby          2019-10-11   79  SYM_FUNC_START(__vmx_vcpu_run)
5e0781df189904 Sean Christopherson 2019-01-25   80  	push %_ASM_BP
5e0781df189904 Sean Christopherson 2019-01-25   81  	mov  %_ASM_SP, %_ASM_BP
3b895ef4861538 Sean Christopherson 2019-01-25   82  #ifdef CONFIG_X86_64
3b895ef4861538 Sean Christopherson 2019-01-25   83  	push %r15
3b895ef4861538 Sean Christopherson 2019-01-25   84  	push %r14
3b895ef4861538 Sean Christopherson 2019-01-25   85  	push %r13
3b895ef4861538 Sean Christopherson 2019-01-25   86  	push %r12
3b895ef4861538 Sean Christopherson 2019-01-25   87  #else
3b895ef4861538 Sean Christopherson 2019-01-25   88  	push %edi
3b895ef4861538 Sean Christopherson 2019-01-25   89  	push %esi
3b895ef4861538 Sean Christopherson 2019-01-25   90  #endif
3b895ef4861538 Sean Christopherson 2019-01-25   91  	push %_ASM_BX
5e0781df189904 Sean Christopherson 2019-01-25   92  
fc02735b14fff8 Josh Poimboeuf      2022-06-14   93  	/* Save @vmx for SPEC_CTRL handling */
fc02735b14fff8 Josh Poimboeuf      2022-06-14   94  	push %_ASM_ARG1
fc02735b14fff8 Josh Poimboeuf      2022-06-14   95  
fc02735b14fff8 Josh Poimboeuf      2022-06-14   96  	/* Save @flags for SPEC_CTRL handling */
fc02735b14fff8 Josh Poimboeuf      2022-06-14   97  	push %_ASM_ARG3
fc02735b14fff8 Josh Poimboeuf      2022-06-14   98  
5e0781df189904 Sean Christopherson 2019-01-25   99  	/*
5e0781df189904 Sean Christopherson 2019-01-25 @100  	 * Save @regs, _ASM_ARG2 may be modified by vmx_update_host_rsp() and
5e0781df189904 Sean Christopherson 2019-01-25 @101  	 * @regs is needed after VM-Exit to save the guest's register values.
5e0781df189904 Sean Christopherson 2019-01-25  102  	 */
5e0781df189904 Sean Christopherson 2019-01-25  103  	push %_ASM_ARG2
5e0781df189904 Sean Christopherson 2019-01-25  104  
5a7a64779e7ad2 Sean Christopherson 2022-11-19  105  	/* Copy @flags to EBX, _ASM_ARG3 is volatile. */
5a7a64779e7ad2 Sean Christopherson 2022-11-19  106  	mov %_ASM_ARG3L, %ebx
77df549559dbe7 Sean Christopherson 2019-01-25  107  
8bd200d23ec42d Josh Poimboeuf      2022-06-14  108  	lea (%_ASM_SP), %_ASM_ARG2
5e0781df189904 Sean Christopherson 2019-01-25  109  	call vmx_update_host_rsp
5e0781df189904 Sean Christopherson 2019-01-25  110  
07853adc29a058 Josh Poimboeuf      2022-06-14  111  	ALTERNATIVE "jmp .Lspec_ctrl_done", "", X86_FEATURE_MSR_SPEC_CTRL
07853adc29a058 Josh Poimboeuf      2022-06-14  112  
07853adc29a058 Josh Poimboeuf      2022-06-14  113  	/*
07853adc29a058 Josh Poimboeuf      2022-06-14  114  	 * SPEC_CTRL handling: if the guest's SPEC_CTRL value differs from the
07853adc29a058 Josh Poimboeuf      2022-06-14  115  	 * host's, write the MSR.
07853adc29a058 Josh Poimboeuf      2022-06-14  116  	 *
07853adc29a058 Josh Poimboeuf      2022-06-14  117  	 * IMPORTANT: To avoid RSB underflow attacks and any other nastiness,
07853adc29a058 Josh Poimboeuf      2022-06-14  118  	 * there must not be any returns or indirect branches between this code
07853adc29a058 Josh Poimboeuf      2022-06-14  119  	 * and vmentry.
07853adc29a058 Josh Poimboeuf      2022-06-14  120  	 */
07853adc29a058 Josh Poimboeuf      2022-06-14  121  	mov 2*WORD_SIZE(%_ASM_SP), %_ASM_DI
07853adc29a058 Josh Poimboeuf      2022-06-14  122  	movl VMX_spec_ctrl(%_ASM_DI), %edi
07853adc29a058 Josh Poimboeuf      2022-06-14  123  	movl PER_CPU_VAR(x86_spec_ctrl_current), %esi
07853adc29a058 Josh Poimboeuf      2022-06-14  124  	cmp %edi, %esi
07853adc29a058 Josh Poimboeuf      2022-06-14  125  	je .Lspec_ctrl_done
07853adc29a058 Josh Poimboeuf      2022-06-14  126  	mov $MSR_IA32_SPEC_CTRL, %ecx
07853adc29a058 Josh Poimboeuf      2022-06-14  127  	xor %edx, %edx
07853adc29a058 Josh Poimboeuf      2022-06-14  128  	mov %edi, %eax
07853adc29a058 Josh Poimboeuf      2022-06-14  129  	wrmsr
07853adc29a058 Josh Poimboeuf      2022-06-14  130  

:::::: The code at line 100 was first introduced by commit
:::::: 5e0781df18990497f4cd96a959ca583d83b6d1e0 KVM: VMX: Move vCPU-run code to a proper assembly routine

:::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
