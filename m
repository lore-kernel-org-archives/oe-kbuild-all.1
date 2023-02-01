Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0738228F1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675262852; x=1706798852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sCpEXbbtDP8Y9xHSIV8HW2iSV+N9c1XUoCSfi0HQ4Jg=;
  b=SuIJZuF2ylSaR4RLiPyw7RGnKJlCQGMy41T9q7Xyf+RAW/dsFris9+yB
   qZ3ABpCBWR1mObhVetOe8MqWeyH67LhK2kBvLpsWcCtuP58qliN9KfJnB
   qVpQJ7Vr1OLLOP/B7C76v49gCsboi7FhulkdoVrtr/hu6aZN484FeJdM2
   SyHdtp6zAFNcKE3x3huadl5O9Bu22jG6SaX+eoG7eJx1JaLfi0LIkh9kK
   eLpva/iKZD2LxXVHasV/oE/wwklpG9wPzKe662I1djlu+p9kkuKJHLPds
   Py10JoIOoaT3NLIWHdn6qlx69eaDE0WYjwQAf6NHaF9dAAwBwaRciBqa9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="329448211"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="329448211"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 06:47:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695374751"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="695374751"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Feb 2023 06:47:30 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNEOX-0005Va-1N;
	Wed, 01 Feb 2023 14:47:29 +0000
Date: Wed, 1 Feb 2023 22:47:08 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 371/371] vmlinux.o: warning:
 objtool: vmx_vcpu_enter_exit+0x27: call to perf_event_guest_enter_exit()
 leaves .noinstr.text section
Message-ID: <202302012259.Mt0SrWNI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   236af3da84d067f3af446ccf2211937cd9ddc42f
commit: 236af3da84d067f3af446ccf2211937cd9ddc42f [371/371] perf, KVM: introduce software event on enter/exit to/from guest
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302012259.Mt0SrWNI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/236af3da84d067f3af446ccf2211937cd9ddc42f
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 236af3da84d067f3af446ccf2211937cd9ddc42f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x27: call to perf_event_guest_enter_exit() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: tdx_vcpu_enter_exit+0x28: call to perf_event_guest_enter_exit() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0x21: call to perf_event_guest_enter_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0xb2f: call to pentium_machine_check.constprop.0() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_stackleak_irqoff+0x2b: call to end_of_stack.isra.0() leaves .noinstr.text section
   vmlinux.o: warning: objtool: np_seamldr_launch+0x129: missing int3 after ret


objdump-func vmlinux.o vmx_vcpu_enter_exit:
0000 00000000000019c0 <vmx_vcpu_enter_exit>:
0000     19c0:	41 56                	push   %r14
0002     19c2:	41 55                	push   %r13
0004     19c4:	49 89 d5             	mov    %rdx,%r13
0007     19c7:	41 54                	push   %r12
0009     19c9:	49 89 fc             	mov    %rdi,%r12
000c     19cc:	55                   	push   %rbp
000d     19cd:	53                   	push   %rbx
000e     19ce:	48 89 f3             	mov    %rsi,%rbx
0011     19d1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	19d2: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0016     19d6:	90                   	nop
0017     19d7:	e8 00 00 00 00       	call   19dc <vmx_vcpu_enter_exit+0x1c>	19d8: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
001c     19dc:	e8 00 00 00 00       	call   19e1 <vmx_vcpu_enter_exit+0x21>	19dd: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
0021     19e1:	90                   	nop
0022     19e2:	bf 01 00 00 00       	mov    $0x1,%edi
0027     19e7:	e8 00 00 00 00       	call   19ec <vmx_vcpu_enter_exit+0x2c>	19e8: R_X86_64_PLT32	perf_event_guest_enter_exit-0x4
002c     19ec:	90                   	nop
002d     19ed:	e8 00 00 00 00       	call   19f2 <vmx_vcpu_enter_exit+0x32>	19ee: R_X86_64_PC32	.text+0x1ce37c
0032     19f2:	90                   	nop
0033     19f3:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
0038     19f8:	e8 00 00 00 00       	call   19fd <vmx_vcpu_enter_exit+0x3d>	19f9: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
003d     19fd:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0042     1a02:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1a03: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0047     1a07:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
004c     1a0c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1a0d: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0051     1a11:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0056     1a16:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1a17: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
005b     1a1b:	0f b6 ab b0 27 00 00 	movzbl 0x27b0(%rbx),%ebp
0062     1a22:	bf 01 00 00 00       	mov    $0x1,%edi
0067     1a27:	89 ee                	mov    %ebp,%esi
0069     1a29:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1a2a: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp1-0x4
006e     1a2e:	40 80 fd 01          	cmp    $0x1,%bpl
0072     1a32:	0f 87 7f 01 00 00    	ja     1bb7 <vmx_vcpu_enter_exit+0x1f7>
0078     1a38:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1a39: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
007d     1a3d:	83 e5 01             	and    $0x1,%ebp
0080     1a40:	31 ff                	xor    %edi,%edi
0082     1a42:	89 ee                	mov    %ebp,%esi
0084     1a44:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1a45: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp1-0x4
0089     1a49:	40 84 ed             	test   %bpl,%bpl
008c     1a4c:	74 27                	je     1a75 <vmx_vcpu_enter_exit+0xb5>
008e     1a4e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1a4f: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0093     1a53:	b9 23 01 00 00       	mov    $0x123,%ecx
0098     1a58:	0f 32                	rdmsr
009a     1a5a:	48 c1 e2 20          	shl    $0x20,%rdx
009e     1a5e:	48 09 c2             	or     %rax,%rdx
00a1     1a61:	48 89 d0             	mov    %rdx,%rax
00a4     1a64:	48 c1 ea 20          	shr    $0x20,%rdx
00a8     1a68:	48 83 c8 08          	or     $0x8,%rax
00ac     1a6c:	0f 30                	wrmsr
00ae     1a6e:	48 89 83 a8 27 00 00 	mov    %rax,0x27a8(%rbx)
00b5     1a75:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1a76: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00ba     1a7a:	49 8b ac 24 78 02 00 00 	mov    0x278(%r12),%rbp
00c2     1a82:	41 0f 20 d6          	mov    %cr2,%r14
00c6     1a86:	4c 89 f6             	mov    %r14,%rsi
00c9     1a89:	48 89 ef             	mov    %rbp,%rdi
00cc     1a8c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1a8d: R_X86_64_NONE	__sanitizer_cov_trace_cmp8-0x4
00d1     1a91:	4c 39 f5             	cmp    %r14,%rbp
00d4     1a94:	74 08                	je     1a9e <vmx_vcpu_enter_exit+0xde>
00d6     1a96:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1a97: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00db     1a9b:	0f 22 d5             	mov    %rbp,%cr2
00de     1a9e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1a9f: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00e3     1aa3:	49 8d b4 24 d8 01 00 00 	lea    0x1d8(%r12),%rsi
00eb     1aab:	44 89 ea             	mov    %r13d,%edx
00ee     1aae:	48 89 df             	mov    %rbx,%rdi
00f1     1ab1:	e8 00 00 00 00       	call   1ab6 <vmx_vcpu_enter_exit+0xf6>	1ab2: R_X86_64_PLT32	__vmx_vcpu_run-0x4
00f6     1ab6:	88 83 90 1f 00 00    	mov    %al,0x1f90(%rbx)
00fc     1abc:	0f 20 d0             	mov    %cr2,%rax
00ff     1abf:	49 89 84 24 78 02 00 00 	mov    %rax,0x278(%r12)
0107     1ac7:	0f b6 ab b0 27 00 00 	movzbl 0x27b0(%rbx),%ebp
010e     1ace:	bf 01 00 00 00       	mov    $0x1,%edi
0113     1ad3:	89 ee                	mov    %ebp,%esi
0115     1ad5:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1ad6: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp1-0x4
011a     1ada:	40 80 fd 01          	cmp    $0x1,%bpl
011e     1ade:	0f 87 b9 00 00 00    	ja     1b9d <vmx_vcpu_enter_exit+0x1dd>
0124     1ae4:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1ae5: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0129     1ae9:	83 e5 01             	and    $0x1,%ebp
012c     1aec:	31 ff                	xor    %edi,%edi
012e     1aee:	89 ee                	mov    %ebp,%esi
0130     1af0:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1af1: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp1-0x4
0135     1af5:	40 84 ed             	test   %bpl,%bpl
0138     1af8:	74 25                	je     1b1f <vmx_vcpu_enter_exit+0x15f>
013a     1afa:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1afb: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
013f     1aff:	48 8b 83 a8 27 00 00 	mov    0x27a8(%rbx),%rax
0146     1b06:	b9 23 01 00 00       	mov    $0x123,%ecx
014b     1b0b:	48 83 e0 f7          	and    $0xfffffffffffffff7,%rax
014f     1b0f:	48 89 c2             	mov    %rax,%rdx
0152     1b12:	48 89 83 a8 27 00 00 	mov    %rax,0x27a8(%rbx)
0159     1b19:	48 c1 ea 20          	shr    $0x20,%rdx
015d     1b1d:	0f 30                	wrmsr
015f     1b1f:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1b20: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0164     1b24:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
0169     1b29:	e8 00 00 00 00       	call   1b2e <vmx_vcpu_enter_exit+0x16e>	1b2a: R_X86_64_PLT32	lockdep_hardirqs_off-0x4
016e     1b2e:	e8 00 00 00 00       	call   1b33 <vmx_vcpu_enter_exit+0x173>	1b2f: R_X86_64_PC32	.text+0x1cd6fc
0173     1b33:	31 ff                	xor    %edi,%edi
0175     1b35:	e8 00 00 00 00       	call   1b3a <vmx_vcpu_enter_exit+0x17a>	1b36: R_X86_64_PLT32	perf_event_guest_enter_exit-0x4
017a     1b3a:	90                   	nop
017b     1b3b:	e8 00 00 00 00       	call   1b40 <vmx_vcpu_enter_exit+0x180>	1b3c: R_X86_64_PLT32	trace_hardirqs_off_finish-0x4
0180     1b40:	90                   	nop
0181     1b41:	5b                   	pop    %rbx
0182     1b42:	5d                   	pop    %rbp
0183     1b43:	41 5c                	pop    %r12
0185     1b45:	41 5d                	pop    %r13
0187     1b47:	41 5e                	pop    %r14
0189     1b49:	31 c0                	xor    %eax,%eax
018b     1b4b:	31 d2                	xor    %edx,%edx
018d     1b4d:	31 c9                	xor    %ecx,%ecx
018f     1b4f:	31 f6                	xor    %esi,%esi
0191     1b51:	31 ff                	xor    %edi,%edi
0193     1b53:	e9 00 00 00 00       	jmp    1b58 <vmx_vcpu_enter_exit+0x198>	1b54: R_X86_64_PLT32	__x86_return_thunk-0x4
0198     1b58:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1b59: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
019d     1b5d:	4c 89 e7             	mov    %r12,%rdi
01a0     1b60:	e8 db fc ff ff       	call   1840 <vmx_l1d_flush>
01a5     1b65:	e9 ac fe ff ff       	jmp    1a16 <vmx_vcpu_enter_exit+0x56>
01aa     1b6a:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1b6b: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
01af     1b6f:	49 8b 3c 24          	mov    (%r12),%rdi
01b3     1b73:	e8 00 00 00 00       	call   1b78 <vmx_vcpu_enter_exit+0x1b8>	1b74: R_X86_64_PLT32	kvm_arch_has_assigned_device-0x4
01b8     1b78:	31 ff                	xor    %edi,%edi
01ba     1b7a:	89 c5                	mov    %eax,%ebp
01bc     1b7c:	89 c6                	mov    %eax,%esi
01be     1b7e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1b7f: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp1-0x4
01c3     1b83:	40 84 ed             	test   %bpl,%bpl
01c6     1b86:	0f 84 8a fe ff ff    	je     1a16 <vmx_vcpu_enter_exit+0x56>
01cc     1b8c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1b8d: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
01d1     1b91:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 1b98 <vmx_vcpu_enter_exit+0x1d8>	1b94: R_X86_64_PC32	.rodata+0x21328
01d8     1b98:	e9 79 fe ff ff       	jmp    1a16 <vmx_vcpu_enter_exit+0x56>
01dd     1b9d:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1b9e: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
01e2     1ba2:	40 0f b6 f5          	movzbl %bpl,%esi
01e6     1ba6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1ba9: R_X86_64_32S	.data+0x5a330
01ed     1bad:	e8 00 00 00 00       	call   1bb2 <vmx_vcpu_enter_exit+0x1f2>	1bae: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
01f2     1bb2:	e9 2d ff ff ff       	jmp    1ae4 <vmx_vcpu_enter_exit+0x124>
01f7     1bb7:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1bb8: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
01fc     1bbc:	40 0f b6 f5          	movzbl %bpl,%esi
0200     1bc0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1bc3: R_X86_64_32S	.data+0x5a350
0207     1bc7:	e8 00 00 00 00       	call   1bcc <vmx_vcpu_enter_exit+0x20c>	1bc8: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
020c     1bcc:	e9 67 fe ff ff       	jmp    1a38 <vmx_vcpu_enter_exit+0x78>
0211     1bd1:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
021c     1bdc:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0227     1be7:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0232     1bf2:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
023d     1bfd:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
