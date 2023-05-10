Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F57220B30
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 10:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683716130; x=1715252130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qU0DE2H7q09u3X2hEDdcBSaUxMVti+NIgiLH/Ybo1uk=;
  b=JidlOipp0kYe12Z+gPk5NpJ/hVBcQrBuSKpHO/FFcglJUeqnEXHjeOOg
   D3hz1XoiyIisw3ConYYcv9z6leFVNoAdquM8mz7ZFTjqifKiaMW51nacZ
   YTck/NOeVxf83lryruPJ6PP8jqLk5ytAbsJx/9wdG6uVX8BLhBmMYXhs1
   mXWyyf0kVQpd/7iUf4jZ5AdGXaYboL+Yxuzcx63B+GFmSAMNHK92ebVtw
   hsi++bbxz4NszRteDGsdtcx732WuzcjSEl5un4M4DJf9lEi78jJOxOJEt
   swsb7p5fvqryJQNHZw4qTF+XVfefULMqkeDGHKDvpeproZoaP/BBqs0D7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="334649778"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="334649778"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 03:55:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="732109203"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="732109203"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 May 2023 03:55:27 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwhTj-0003Ag-0V;
	Wed, 10 May 2023 10:55:27 +0000
Date: Wed, 10 May 2023 18:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] irqflags: Warn on irq disable when disabled and
 enable when enabled
Message-ID: <202305101809.OqyNA3Gm-lkp@intel.com>
References: <20230509110739.241735-4-npiggin@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509110739.241735-4-npiggin@gmail.com>

Hi Nicholas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on tip/locking/core linus/master v6.4-rc1 next-20230510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicholas-Piggin/hrtimer-balance-irq-save-restore/20230509-191049
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20230509110739.241735-4-npiggin%40gmail.com
patch subject: [RFC PATCH 3/3] irqflags: Warn on irq disable when disabled and enable when enabled
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/20230510/202305101809.OqyNA3Gm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d91910ca3451a1d633351e3492117ca62054eb92
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nicholas-Piggin/hrtimer-balance-irq-save-restore/20230509-191049
        git checkout d91910ca3451a1d633351e3492117ca62054eb92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305101809.OqyNA3Gm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x36: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x75: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xbb: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x7d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0xd: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x4d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x52: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0xb2: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x49: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x6b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x3f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_idle+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x88: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: cpu_idle_poll.isra.0+0x90: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle+0x9c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_s2idle+0xa6: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_xstate+0xa1: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_ibrs+0x12: call to sched_smt_active() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_irq+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: acpi_safe_halt+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x4c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poll_idle+0x40: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o acpi_safe_halt:
0000 0000000000000939 <acpi_safe_halt>:
0000  939:	48 8b 04 25 00 00 00 00 	mov    0x0,%rax	93d: R_X86_64_32S	pcpu_hot
0008  941:	48 8b 00             	mov    (%rax),%rax
000b  944:	a8 08                	test   $0x8,%al
000d  946:	75 3b                	jne    983 <acpi_safe_halt+0x4a>
000f  948:	53                   	push   %rbx
0010  949:	eb 07                	jmp    952 <acpi_safe_halt+0x19>
0012  94b:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 952 <acpi_safe_halt+0x19>	94e: R_X86_64_PC32	.rodata+0x62f93c
0019  952:	fb                   	sti
001a  953:	f4                   	hlt
001b  954:	9c                   	pushf
001c  955:	58                   	pop    %rax
001d  956:	25 00 02 00 00       	and    $0x200,%eax
0022  95b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	95e: R_X86_64_32S	_ftrace_annotated_branch+0xe1f30
0029  962:	40 0f 94 c6          	sete   %sil
002d  966:	48 89 c3             	mov    %rax,%rbx
0030  969:	31 c9                	xor    %ecx,%ecx
0032  96b:	31 d2                	xor    %edx,%edx
0034  96d:	40 0f b6 f6          	movzbl %sil,%esi
0038  971:	e8 00 00 00 00       	call   976 <acpi_safe_halt+0x3d>	972: R_X86_64_PLT32	ftrace_likely_update-0x4
003d  976:	48 85 db             	test   %rbx,%rbx
0040  979:	75 05                	jne    980 <acpi_safe_halt+0x47>
0042  97b:	e8 00 00 00 00       	call   980 <acpi_safe_halt+0x47>	97c: R_X86_64_PLT32	warn_bogus_irq_disable-0x4
0047  980:	fa                   	cli
0048  981:	5b                   	pop    %rbx
0049  982:	c3                   	ret
004a  983:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
