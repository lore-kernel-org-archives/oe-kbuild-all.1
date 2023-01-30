Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A95D79F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 21:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675114643; x=1706650643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WNkvJ5rpi03ToWY5pLGOFdSGJECJG/Q1em86yY2QZWY=;
  b=H3uVcjoRWHAqamQoe6YTmM4LFIEtkWbfo4XrrxCdT0KuwHRJTHJgolIS
   uaRIgIizQFoLMg5XJBZ4K4iBmtD2YzSOQho0DLqaZd5rWc3x6qLntD3xS
   3rhLgY/iaww5EUQDqJcqPIEIww2IpWCxJitTQ/TABj11NBr5XnJ2g6pf3
   R6vitB/i9xBgtE2JGSbUqM4dKUt3Obdr2KBCjMgo2wyh23Ab4d31zTAGy
   7rYKnwO097YLTjm0thC6m3ZyOxQ5vklsyVhFV6jMblx/26ebZ8yZAlPSa
   aBjKBQzpvtsB9JkmFulEzt1LqOlettg3ZBPPvbvOK9q2rwp9FvqvQyGqZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="390045393"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="390045393"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 13:37:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="993033974"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="993033974"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2023 13:37:21 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMbq4-0003uw-0r;
	Mon, 30 Jan 2023 21:37:20 +0000
Date: Tue, 31 Jan 2023 05:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core-staging 8/10] vmlinux.o: warning: objtool:
 native_sched_clock+0x79: call to ftrace_likely_update() leaves .noinstr.text
 section
Message-ID: <202301310501.ipv9oRyE-lkp@intel.com>
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
commit: fc6d767f6e2b6efed02041f9f71a14d299aea58c [8/10] x86: Mark sched_clock() noinstr
config: x86_64-randconfig-a002-20230130 (https://download.01.org/0day-ci/archive/20230131/202301310501.ipv9oRyE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=fc6d767f6e2b6efed02041f9f71a14d299aea58c
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core-staging
        git checkout fc6d767f6e2b6efed02041f9f71a14d299aea58c
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
>> vmlinux.o: warning: objtool: native_sched_clock+0x79: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x15: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x66: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x76: call to ftrace_likely_update() leaves .noinstr.text section
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


objdump-func vmlinux.o native_sched_clock:
0000 0000000000001d00 <native_sched_clock>:
0000     1d00:	e9 c0 00 00 00       	jmp    1dc5 <native_sched_clock+0xc5>
0005     1d05:	55                   	push   %rbp
0006     1d06:	48 89 e5             	mov    %rsp,%rbp
0009     1d09:	41 57                	push   %r15
000b     1d0b:	41 56                	push   %r14
000d     1d0d:	41 55                	push   %r13
000f     1d0f:	41 54                	push   %r12
0011     1d11:	53                   	push   %rbx
0012     1d12:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
0016     1d16:	48 83 ec 20          	sub    $0x20,%rsp
001a     1d1a:	0f 31                	rdtsc
001c     1d1c:	48 c1 e2 20          	shl    $0x20,%rdx
0020     1d20:	48 09 c2             	or     %rax,%rdx
0023     1d23:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
0028     1d28:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 1d2e <native_sched_clock+0x2e>	1d2a: R_X86_64_PC32	pcpu_hot+0x4
002e     1d2e:	44 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15d        # 1d35 <native_sched_clock+0x35>	1d31: R_X86_64_PC32	.data..shared_aligned+0x1c
0035     1d35:	44 89 f9             	mov    %r15d,%ecx
0038     1d38:	83 e1 01             	and    $0x1,%ecx
003b     1d3b:	48 89 c8             	mov    %rcx,%rax
003e     1d3e:	48 c1 e0 04          	shl    $0x4,%rax
0042     1d42:	48 8b 98 00 00 00 00 	mov    0x0(%rax),%rbx	1d45: R_X86_64_32S	.data..shared_aligned+0x8
0049     1d49:	48 89 c8             	mov    %rcx,%rax
004c     1d4c:	48 c1 e0 04          	shl    $0x4,%rax
0050     1d50:	44 8b a0 00 00 00 00 	mov    0x0(%rax),%r12d	1d53: R_X86_64_32S	.data..shared_aligned
0057     1d57:	44 8b b0 00 00 00 00 	mov    0x0(%rax),%r14d	1d5a: R_X86_64_32S	.data..shared_aligned+0x4
005e     1d5e:	44 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13d        # 1d65 <native_sched_clock+0x65>	1d61: R_X86_64_PC32	.data..shared_aligned+0x1c
0065     1d65:	31 f6                	xor    %esi,%esi
0067     1d67:	45 39 ef             	cmp    %r13d,%r15d
006a     1d6a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1d6d: R_X86_64_32S	_ftrace_annotated_branch+0x7b90
0071     1d71:	40 0f 95 c6          	setne  %sil
0075     1d75:	31 c9                	xor    %ecx,%ecx
0077     1d77:	31 d2                	xor    %edx,%edx
0079     1d79:	e8 00 00 00 00       	call   1d7e <native_sched_clock+0x7e>	1d7a: R_X86_64_PLT32	ftrace_likely_update-0x4
007e     1d7e:	45 39 ef             	cmp    %r13d,%r15d
0081     1d81:	75 ab                	jne    1d2e <native_sched_clock+0x2e>
0083     1d83:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0088     1d88:	45 89 e4             	mov    %r12d,%r12d
008b     1d8b:	49 f7 e4             	mul    %r12
008e     1d8e:	49 89 c4             	mov    %rax,%r12
0091     1d91:	49 89 d5             	mov    %rdx,%r13
0094     1d94:	41 83 fe 7f          	cmp    $0x7f,%r14d
0098     1d98:	77 44                	ja     1dde <native_sched_clock+0xde>
009a     1d9a:	44 89 f1             	mov    %r14d,%ecx
009d     1d9d:	4d 0f ad ec          	shrd   %cl,%r13,%r12
00a1     1da1:	49 d3 ed             	shr    %cl,%r13
00a4     1da4:	41 f6 c6 40          	test   $0x40,%r14b
00a8     1da8:	4d 0f 45 e5          	cmovne %r13,%r12
00ac     1dac:	4a 8d 04 23          	lea    (%rbx,%r12,1),%rax
00b0     1db0:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 1db6 <native_sched_clock+0xb6>	1db2: R_X86_64_PC32	pcpu_hot+0x4
00b6     1db6:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
00ba     1dba:	5b                   	pop    %rbx
00bb     1dbb:	41 5c                	pop    %r12
00bd     1dbd:	41 5d                	pop    %r13
00bf     1dbf:	41 5e                	pop    %r14
00c1     1dc1:	41 5f                	pop    %r15
00c3     1dc3:	5d                   	pop    %rbp
00c4     1dc4:	c3                   	ret
00c5     1dc5:	48 69 05 00 00 00 00 40 42 0f 00 	imul   $0xf4240,0x0(%rip),%rax        # 1dd0 <native_sched_clock+0xd0>	1dc8: R_X86_64_PC32	jiffies_64-0x8
00d0     1dd0:	48 ba 00 b8 64 d9 05 be f0 ff 	movabs $0xfff0be05d964b800,%rdx
00da     1dda:	48 01 d0             	add    %rdx,%rax
00dd     1ddd:	c3                   	ret
00de     1dde:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
00e3     1de3:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
00e8     1de8:	44 89 f2             	mov    %r14d,%edx
00eb     1deb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1dee: R_X86_64_32S	.data+0x58a40
00f2     1df2:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
00f7     1df7:	e8 00 00 00 00       	call   1dfc <native_sched_clock+0xfc>	1df8: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
00fc     1dfc:	eb 9c                	jmp    1d9a <native_sched_clock+0x9a>
00fe     1dfe:	66 90                	xchg   %ax,%ax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
