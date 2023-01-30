Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5394C160
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 22:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675118315; x=1706654315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ynJdF61Prsgqh/Lm0K/duF/ItcTt8nsUwKWw7zmRw4A=;
  b=WtQgpU2pIEhnFNJ9orBHGJoQCP/V2JCs78VPEXoDu9we15tVv3QOh3bX
   fqeumhQgM5nBKTyYG4ksOXEcnJfpq6eBqSzmy9JdiXx17UFeqMEUzNzHF
   qk+4VilN9x/X8oDy27Hh6kcfO9cjFr+8LZY9Zyt31L/FRt+RIQA9L57ul
   GkTyKdiHsATP3lcaiFeSlLF3fDXqCUsvgrqqN2dhq+rA1YaLcrRL2a7PI
   RdKIDeyS0W3S5gY4CCF1/GWBCaUsBM+qubJOCuN4EVZnGgEio6bjBEAQQ
   2zawDCZDky2PzKpt7Y9Lo5doMb705JG7n+GSGKClvBdX96ov8i302xp8i
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="355012976"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="355012976"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 14:38:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="614205956"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="614205956"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Jan 2023 14:38:28 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMcn7-0003wM-1l;
	Mon, 30 Jan 2023 22:38:21 +0000
Date: Tue, 31 Jan 2023 06:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core-staging 9/10] vmlinux.o: warning: objtool:
 local_clock+0x42: call to ftrace_likely_update() leaves .noinstr.text
 section
Message-ID: <202301310644.eLVmEYEg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core-staging
head:   464fa8e861277b168333fb5de5d8a4cf609c84c7
commit: 8fa36b65741cddd0cc83f285bdedba46415fc5a9 [9/10] sched/clock: Make local_clock() noinstr
config: x86_64-randconfig-a002-20230130 (https://download.01.org/0day-ci/archive/20230131/202301310644.eLVmEYEg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=8fa36b65741cddd0cc83f285bdedba46415fc5a9
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core-staging
        git checkout 8fa36b65741cddd0cc83f285bdedba46415fc5a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x25: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x21: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x71: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xaa: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x79: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x15: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x66: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x76: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: local_clock+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x55: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x28: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x26: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0xef: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x6b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x42: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o local_clock:
0000 0000000000004680 <local_clock>:
0000     4680:	41 54                	push   %r12
0002     4682:	53                   	push   %rbx
0003     4683:	eb 16                	jmp    469b <local_clock+0x1b>
0005     4685:	e8 00 00 00 00       	call   468a <local_clock+0xa>	4686: R_X86_64_PLT32	sched_clock-0x4
000a     468a:	48 03 05 00 00 00 00 	add    0x0(%rip),%rax        # 4691 <local_clock+0x11>	468d: R_X86_64_PC32	__sched_clock_offset-0x4
0011     4691:	5b                   	pop    %rbx
0012     4692:	49 89 c4             	mov    %rax,%r12
0015     4695:	4c 89 e0             	mov    %r12,%rax
0018     4698:	41 5c                	pop    %r12
001a     469a:	c3                   	ret
001b     469b:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 46a1 <local_clock+0x21>	469d: R_X86_64_PC32	pcpu_hot+0x4
0021     46a1:	e8 00 00 00 00       	call   46a6 <local_clock+0x26>	46a2: R_X86_64_PLT32	sched_clock-0x4
0026     46a6:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 46ad <local_clock+0x2d>	46a9: R_X86_64_PC32	.data+0xd548c
002d     46ad:	31 c9                	xor    %ecx,%ecx
002f     46af:	31 d2                	xor    %edx,%edx
0031     46b1:	49 89 c4             	mov    %rax,%r12
0034     46b4:	48 c1 e8 3f          	shr    $0x3f,%rax
0038     46b8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	46bb: R_X86_64_32S	_ftrace_annotated_branch+0x25140
003f     46bf:	48 89 c6             	mov    %rax,%rsi
0042     46c2:	e8 00 00 00 00       	call   46c7 <local_clock+0x47>	46c3: R_X86_64_PLT32	ftrace_likely_update-0x4
0047     46c7:	31 c0                	xor    %eax,%eax
0049     46c9:	4d 85 e4             	test   %r12,%r12
004c     46cc:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 46d3 <local_clock+0x53>	46cf: R_X86_64_PC32	.data..read_mostly+0x270c
0053     46d3:	49 0f 49 c4          	cmovns %r12,%rax
0057     46d7:	48 03 15 00 00 00 00 	add    0x0(%rip),%rdx        # 46de <local_clock+0x5e>	46da: R_X86_64_PC32	.data+0xd5494
005e     46de:	48 89 d7             	mov    %rdx,%rdi
0061     46e1:	48 89 d6             	mov    %rdx,%rsi
0064     46e4:	48 89 c1             	mov    %rax,%rcx
0067     46e7:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 46ee <local_clock+0x6e>	46ea: R_X86_64_PC32	.data+0xd549c
006e     46ee:	4c 8d 24 11          	lea    (%rcx,%rdx,1),%r12
0072     46f2:	48 29 c7             	sub    %rax,%rdi
0075     46f5:	48 85 ff             	test   %rdi,%rdi
0078     46f8:	7f 09                	jg     4703 <local_clock+0x83>
007a     46fa:	4c 89 e1             	mov    %r12,%rcx
007d     46fd:	48 89 c6             	mov    %rax,%rsi
0080     4700:	48 29 c1             	sub    %rax,%rcx
0083     4703:	48 81 c2 40 42 0f 00 	add    $0xf4240,%rdx
008a     470a:	48 89 c7             	mov    %rax,%rdi
008d     470d:	48 29 d7             	sub    %rdx,%rdi
0090     4710:	48 85 ff             	test   %rdi,%rdi
0093     4713:	48 0f 4f d0          	cmovg  %rax,%rdx
0097     4717:	48 85 c9             	test   %rcx,%rcx
009a     471a:	4c 0f 4e e6          	cmovle %rsi,%r12
009e     471e:	49 39 d4             	cmp    %rdx,%r12
00a1     4721:	4c 0f 49 e2          	cmovns %rdx,%r12
00a5     4725:	4c 0f b1 25 00 00 00 00 	cmpxchg %r12,0x0(%rip)        # 472d <local_clock+0xad>	4729: R_X86_64_PC32	.data+0xd549c
00ad     472d:	40 0f 95 c6          	setne  %sil
00b1     4731:	0f 94 c3             	sete   %bl
00b4     4734:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4737: R_X86_64_32S	_ftrace_annotated_branch+0x25110
00bb     473b:	31 c9                	xor    %ecx,%ecx
00bd     473d:	31 d2                	xor    %edx,%edx
00bf     473f:	40 0f b6 f6          	movzbl %sil,%esi
00c3     4743:	e8 00 00 00 00       	call   4748 <local_clock+0xc8>	4744: R_X86_64_PLT32	ftrace_likely_update-0x4
00c8     4748:	31 c9                	xor    %ecx,%ecx
00ca     474a:	0f b6 f3             	movzbl %bl,%esi
00cd     474d:	ba 01 00 00 00       	mov    $0x1,%edx
00d2     4752:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4755: R_X86_64_32S	_ftrace_annotated_branch+0x250e0
00d9     4759:	e8 00 00 00 00       	call   475e <local_clock+0xde>	475a: R_X86_64_PLT32	ftrace_likely_update-0x4
00de     475e:	84 db                	test   %bl,%bl
00e0     4760:	0f 84 3b ff ff ff    	je     46a1 <local_clock+0x21>
00e6     4766:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 476c <local_clock+0xec>	4768: R_X86_64_PC32	pcpu_hot+0x4
00ec     476c:	4c 89 e0             	mov    %r12,%rax
00ef     476f:	5b                   	pop    %rbx
00f0     4770:	41 5c                	pop    %r12
00f2     4772:	c3                   	ret
00f3     4773:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
00fd     477d:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
