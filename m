Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704DF20690
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 20:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687464555; x=1719000555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LtS0lT4sAG7nMflmHY8kE1JPVbIuyfKTMTqmmmbftAA=;
  b=GJPzHIuB0MOe6NjQPTQ5d42XLRIfu41/P8+ivYDE7crN83jaJJmuuPtO
   m8LSrsYRzRTfW9ryFcK61vfS6h769RySY7ytedXMCr+qD+o/3zC/94n6D
   GNuA+Brr/od9n5foFZURHgicnkGHpPZ1RfQMbpjEqJDJfBMkrmEg2r0AL
   hHFKFBqQtbUChdVC0ZjoFSgyy2l4DpKXVbvg8dRoIvhQLgcOoXN8Z8Yh7
   1fwVo1erzfQld65MrFHAk0jCm7em261U1uY8jymkX2r98l+vqVAdmwOp4
   Obp4yQLDxDauwbhdTnsqEBK7rqhSnqdLyB0LxFtmxwpLHZPk0Qr1I96Vt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="345360560"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="345360560"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 13:08:48 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="749472708"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="749472708"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Jun 2023 13:08:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCQbm-0007lP-0L;
	Thu, 22 Jun 2023 20:08:46 +0000
Date: Fri, 23 Jun 2023 04:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [stable:linux-6.3.y 832/2125] vmlinux.o: warning: objtool:
 emit_return+0x39: relocation to !ENDBR: .text.__x86.return_thunk+0x3b
Message-ID: <202306230453.Se5vFvig-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.3.y
head:   00d3ac724541a0661b148b16cf34fac135a4fd53
commit: e16be8fb7291568f5c1bbfc6367ba7e389eb0e79 [832/2125] x86/retbleed: Fix return thunk alignment
config: x86_64-randconfig-a015-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230453.Se5vFvig-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230453.Se5vFvig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230453.Se5vFvig-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0x11: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x77: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x80: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x9e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x46: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xc4: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x89: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_clock_read+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x8b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock+0x6d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x50: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x6e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0xa3: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0xb1: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter.constprop.0+0x19: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit.constprop.0+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x18: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_exit+0x36: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x77: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x77: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x10e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_preemption_disabled.constprop.0+0x28: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x31: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x67: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x7c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x51: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poll_idle+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ibt_selftest+0x1e: return with modified stack frame
>> vmlinux.o: warning: objtool: emit_return+0x39: relocation to !ENDBR: .text.__x86.return_thunk+0x3b


objdump-func vmlinux.o emit_return:
0000 00000000000ef6c0 <emit_return>:
0000    ef6c0:	e8 00 00 00 00       	call   ef6c5 <emit_return+0x5>	ef6c1: R_X86_64_PLT32	__fentry__-0x4
0005    ef6c5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
000f    ef6cf:	55                   	push   %rbp
0010    ef6d0:	48 89 fa             	mov    %rdi,%rdx
0013    ef6d3:	48 c1 ea 03          	shr    $0x3,%rdx
0017    ef6d7:	48 89 e5             	mov    %rsp,%rbp
001a    ef6da:	41 55                	push   %r13
001c    ef6dc:	41 54                	push   %r12
001e    ef6de:	49 89 fc             	mov    %rdi,%r12
0021    ef6e1:	53                   	push   %rbx
0022    ef6e2:	48 83 ec 08          	sub    $0x8,%rsp
0026    ef6e6:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
002a    ef6ea:	0f 85 38 01 00 00    	jne    ef828 <emit_return+0x168>
0030    ef6f0:	49 8b 1c 24          	mov    (%r12),%rbx
0034    ef6f4:	e9 00 00 00 00       	jmp    ef6f9 <emit_return+0x39>	ef6f5: R_X86_64_PC32	.altinstr_aux+0xb4e
0039    ef6f9:	49 bd 00 00 00 00 00 00 00 00 	movabs $0x0,%r13	ef6fb: R_X86_64_64	__x86_return_thunk-0x5
0043    ef703:	49 29 f5             	sub    %rsi,%r13
0046    ef706:	49 63 c5             	movslq %r13d,%rax
0049    ef709:	49 39 c5             	cmp    %rax,%r13
004c    ef70c:	0f 85 ed 00 00 00    	jne    ef7ff <emit_return+0x13f>
0052    ef712:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
005c    ef71c:	48 89 da             	mov    %rbx,%rdx
005f    ef71f:	48 c1 ea 03          	shr    $0x3,%rdx
0063    ef723:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0067    ef727:	48 89 da             	mov    %rbx,%rdx
006a    ef72a:	83 e2 07             	and    $0x7,%edx
006d    ef72d:	38 d0                	cmp    %dl,%al
006f    ef72f:	7f 08                	jg     ef739 <emit_return+0x79>
0071    ef731:	84 c0                	test   %al,%al
0073    ef733:	0f 85 0b 01 00 00    	jne    ef844 <emit_return+0x184>
0079    ef739:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
007d    ef73d:	c6 03 e9             	movb   $0xe9,(%rbx)
0080    ef740:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
008a    ef74a:	48 89 fa             	mov    %rdi,%rdx
008d    ef74d:	48 c1 ea 03          	shr    $0x3,%rdx
0091    ef751:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0095    ef755:	48 89 f8             	mov    %rdi,%rax
0098    ef758:	83 e0 07             	and    $0x7,%eax
009b    ef75b:	83 c0 03             	add    $0x3,%eax
009e    ef75e:	38 d0                	cmp    %dl,%al
00a0    ef760:	7c 08                	jl     ef76a <emit_return+0xaa>
00a2    ef762:	84 d2                	test   %dl,%dl
00a4    ef764:	0f 85 e7 00 00 00    	jne    ef851 <emit_return+0x191>
00aa    ef76a:	44 89 6b 01          	mov    %r13d,0x1(%rbx)
00ae    ef76e:	48 83 c3 05          	add    $0x5,%rbx
00b2    ef772:	eb 59                	jmp    ef7cd <emit_return+0x10d>
00b4    ef774:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00be    ef77e:	48 89 da             	mov    %rbx,%rdx
00c1    ef781:	48 c1 ea 03          	shr    $0x3,%rdx
00c5    ef785:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
00c9    ef789:	48 89 da             	mov    %rbx,%rdx
00cc    ef78c:	83 e2 07             	and    $0x7,%edx
00cf    ef78f:	38 d0                	cmp    %dl,%al
00d1    ef791:	7f 08                	jg     ef79b <emit_return+0xdb>
00d3    ef793:	84 c0                	test   %al,%al
00d5    ef795:	0f 85 80 00 00 00    	jne    ef81b <emit_return+0x15b>
00db    ef79b:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
00df    ef79f:	c6 03 c3             	movb   $0xc3,(%rbx)
00e2    ef7a2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00ec    ef7ac:	48 89 fa             	mov    %rdi,%rdx
00ef    ef7af:	48 c1 ea 03          	shr    $0x3,%rdx
00f3    ef7b3:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
00f7    ef7b7:	48 89 fa             	mov    %rdi,%rdx
00fa    ef7ba:	83 e2 07             	and    $0x7,%edx
00fd    ef7bd:	38 d0                	cmp    %dl,%al
00ff    ef7bf:	7f 04                	jg     ef7c5 <emit_return+0x105>
0101    ef7c1:	84 c0                	test   %al,%al
0103    ef7c3:	75 4f                	jne    ef814 <emit_return+0x154>
0105    ef7c5:	c6 43 01 cc          	movb   $0xcc,0x1(%rbx)
0109    ef7c9:	48 83 c3 02          	add    $0x2,%rbx
010d    ef7cd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0117    ef7d7:	4c 89 e2             	mov    %r12,%rdx
011a    ef7da:	48 c1 ea 03          	shr    $0x3,%rdx
011e    ef7de:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0122    ef7e2:	75 56                	jne    ef83a <emit_return+0x17a>
0124    ef7e4:	49 89 1c 24          	mov    %rbx,(%r12)
0128    ef7e8:	48 83 c4 08          	add    $0x8,%rsp
012c    ef7ec:	5b                   	pop    %rbx
012d    ef7ed:	41 5c                	pop    %r12
012f    ef7ef:	41 5d                	pop    %r13
0131    ef7f1:	5d                   	pop    %rbp
0132    ef7f2:	31 c0                	xor    %eax,%eax
0134    ef7f4:	31 d2                	xor    %edx,%edx
0136    ef7f6:	31 f6                	xor    %esi,%esi
0138    ef7f8:	31 ff                	xor    %edi,%edi
013a    ef7fa:	e9 00 00 00 00       	jmp    ef7ff <emit_return+0x13f>	ef7fb: R_X86_64_PLT32	__x86_return_thunk-0x4
013f    ef7ff:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	ef802: R_X86_64_32S	__x86_return_thunk
0146    ef806:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ef809: R_X86_64_32S	.rodata+0x5cd20
014d    ef80d:	e8 00 00 00 00       	call   ef812 <emit_return+0x152>	ef80e: R_X86_64_PLT32	_printk-0x4
0152    ef812:	eb b9                	jmp    ef7cd <emit_return+0x10d>
0154    ef814:	e8 00 00 00 00       	call   ef819 <emit_return+0x159>	ef815: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
0159    ef819:	eb aa                	jmp    ef7c5 <emit_return+0x105>
015b    ef81b:	48 89 df             	mov    %rbx,%rdi
015e    ef81e:	e8 00 00 00 00       	call   ef823 <emit_return+0x163>	ef81f: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
0163    ef823:	e9 73 ff ff ff       	jmp    ef79b <emit_return+0xdb>
0168    ef828:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
016c    ef82c:	e8 00 00 00 00       	call   ef831 <emit_return+0x171>	ef82d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0171    ef831:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
0175    ef835:	e9 b6 fe ff ff       	jmp    ef6f0 <emit_return+0x30>
017a    ef83a:	4c 89 e7             	mov    %r12,%rdi
017d    ef83d:	e8 00 00 00 00       	call   ef842 <emit_return+0x182>	ef83e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0182    ef842:	eb a0                	jmp    ef7e4 <emit_return+0x124>
0184    ef844:	48 89 df             	mov    %rbx,%rdi
0187    ef847:	e8 00 00 00 00       	call   ef84c <emit_return+0x18c>	ef848: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
018c    ef84c:	e9 e8 fe ff ff       	jmp    ef739 <emit_return+0x79>
0191    ef851:	e8 00 00 00 00       	call   ef856 <emit_return+0x196>	ef852: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0196    ef856:	e9 0f ff ff ff       	jmp    ef76a <emit_return+0xaa>
019b    ef85b:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
01a6    ef866:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
01b1    ef871:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
01bc    ef87c:	0f 1f 40 00          	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
