Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5541FB8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 07:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679382860; x=1710918860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7yDz1CRhCzBq2A7TJunUvw/ZFPAKJ/a5QkE3HqZ0KCA=;
  b=NN+y4vhPHrQWg9mw9W1oCMy+0En/OXEiQJZD9hKOwpUMKNSAzc4xDq5B
   3t8+3qClfhTO+vBb6JubwTy9sJrU2DR1DPQGFQESinjUAaHl3fr/gB8Xh
   kbyGyZUROYhR+tzISGnlswKbc+1SVGCIm7EtbeEsEar6eedfIC42GOCmK
   41N1eVQoS1DF/0U32aqw9AS11oSups+Rr+Li9gYvhMqVtuXVQxV/Hgm19
   okXAyHUOcsKwxoyem5Pgdl+VwxDogVfpSqfrFeb4YsHGbMCxbP1evIogx
   qDaU4ThoXsp6SmFXFPQSyyt3aqYFuAAg6LFQUtFPJL0yIz/5RUgtVYR/F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="403741681"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="403741681"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 00:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="631451221"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="631451221"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Mar 2023 00:14:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peWCH-000Bi6-2A;
	Tue, 21 Mar 2023 07:14:17 +0000
Date: Tue, 21 Mar 2023 15:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Wang <wei.w.wang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:tdx-mig-wip 2/103] vmlinux.o: warning: objtool:
 tdx_vcpu_enter_exit+0x116: call to pr_tdx_error() leaves .noinstr.text
 section
Message-ID: <202303211541.sprmegV0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git tdx-mig-wip
head:   61038376124dad7d5d6f0e23bb56643c4e9bd64a
commit: 16e2ccd7c88ae16a7d32f1a3d63a7fed8a001ae7 [2/103] KVM: TDX: retry TDH.VP.ENTER on TDX_OPERATION_BUSY
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230321/202303211541.sprmegV0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/16e2ccd7c88ae16a7d32f1a3d63a7fed8a001ae7
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx tdx-mig-wip
        git checkout 16e2ccd7c88ae16a7d32f1a3d63a7fed8a001ae7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211541.sprmegV0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x164: call to context_tracking_guest_exit() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: tdx_vcpu_enter_exit+0x116: call to pr_tdx_error() leaves .noinstr.text section
   vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0x85: call to context_tracking_guest_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0xb2f: call to pentium_machine_check.constprop.0() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_stackleak_irqoff+0x2b: call to end_of_stack.isra.0() leaves .noinstr.text section
   vmlinux.o: warning: objtool: np_seamldr_launch+0x129: missing int3 after ret


objdump-func vmlinux.o tdx_vcpu_enter_exit:
0000 0000000000002200 <tdx_vcpu_enter_exit>:
0000     2200:	41 57                	push   %r15
0002     2202:	41 56                	push   %r14
0004     2204:	49 89 fe             	mov    %rdi,%r14
0007     2207:	41 55                	push   %r13
0009     2209:	41 54                	push   %r12
000b     220b:	55                   	push   %rbp
000c     220c:	53                   	push   %rbx
000d     220d:	48 89 f3             	mov    %rsi,%rbx
0010     2210:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	2211: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0015     2215:	90                   	nop
0016     2216:	65 48 8b 04 25 00 00 00 00 	mov    %gs:0x0,%rax	221b: R_X86_64_32S	pcpu_hot
001f     221f:	83 88 f0 02 00 00 01 	orl    $0x1,0x2f0(%rax)
0026     2226:	90                   	nop
0027     2227:	90                   	nop
0028     2228:	e8 00 00 00 00       	call   222d <tdx_vcpu_enter_exit+0x2d>	2229: R_X86_64_PC32	.text+0x26997c
002d     222d:	90                   	nop
002e     222e:	8b 93 b0 1f 00 00    	mov    0x1fb0(%rbx),%edx
0034     2234:	48 8b bb 90 1f 00 00 	mov    0x1f90(%rbx),%rdi
003b     223b:	49 81 c6 e0 01 00 00 	add    $0x1e0,%r14
0042     2242:	41 bc 01 00 00 00    	mov    $0x1,%r12d
0048     2248:	49 bd 00 00 00 00 00 02 00 80 	movabs $0x8000020000000000,%r13
0052     2252:	4c 89 f6             	mov    %r14,%rsi
0055     2255:	e8 00 00 00 00       	call   225a <tdx_vcpu_enter_exit+0x5a>	2256: R_X86_64_PLT32	__tdx_vcpu_run-0x4
005a     225a:	48 89 c5             	mov    %rax,%rbp
005d     225d:	48 89 83 b8 1f 00 00 	mov    %rax,0x1fb8(%rbx)
0064     2264:	48 b8 00 00 00 00 ff ff ff ff 	movabs $0xffffffff00000000,%rax
006e     226e:	48 21 c5             	and    %rax,%rbp
0071     2271:	eb 4f                	jmp    22c2 <tdx_vcpu_enter_exit+0xc2>
0073     2273:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	2274: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0078     2278:	48 8b bb 90 1f 00 00 	mov    0x1f90(%rbx),%rdi
007f     227f:	8b 93 b0 1f 00 00    	mov    0x1fb0(%rbx),%edx
0085     2285:	4c 89 f6             	mov    %r14,%rsi
0088     2288:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
008d     228d:	e8 00 00 00 00       	call   2292 <tdx_vcpu_enter_exit+0x92>	228e: R_X86_64_PLT32	__tdx_vcpu_run-0x4
0092     2292:	4c 89 e6             	mov    %r12,%rsi
0095     2295:	bf 11 27 00 00       	mov    $0x2711,%edi
009a     229a:	48 89 83 b8 1f 00 00 	mov    %rax,0x1fb8(%rbx)
00a1     22a1:	48 89 c5             	mov    %rax,%rbp
00a4     22a4:	48 b8 00 00 00 00 ff ff ff ff 	movabs $0xffffffff00000000,%rax
00ae     22ae:	48 21 c5             	and    %rax,%rbp
00b1     22b1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	22b2: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp8-0x4
00b6     22b6:	49 81 ff 12 27 00 00 	cmp    $0x2712,%r15
00bd     22bd:	74 4b                	je     230a <tdx_vcpu_enter_exit+0x10a>
00bf     22bf:	4d 89 fc             	mov    %r15,%r12
00c2     22c2:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	22c3: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00c7     22c7:	48 89 ee             	mov    %rbp,%rsi
00ca     22ca:	4c 89 ef             	mov    %r13,%rdi
00cd     22cd:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	22ce: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp8-0x4
00d2     22d2:	4c 39 ed             	cmp    %r13,%rbp
00d5     22d5:	74 9c                	je     2273 <tdx_vcpu_enter_exit+0x73>
00d7     22d7:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	22d8: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00dc     22dc:	e8 00 00 00 00       	call   22e1 <tdx_vcpu_enter_exit+0xe1>	22dd: R_X86_64_PC32	.text+0x2689fc
00e1     22e1:	90                   	nop
00e2     22e2:	65 48 8b 04 25 00 00 00 00 	mov    %gs:0x0,%rax	22e7: R_X86_64_32S	pcpu_hot
00eb     22eb:	83 a0 f0 02 00 00 fe 	andl   $0xfffffffe,0x2f0(%rax)
00f2     22f2:	90                   	nop
00f3     22f3:	5b                   	pop    %rbx
00f4     22f4:	5d                   	pop    %rbp
00f5     22f5:	41 5c                	pop    %r12
00f7     22f7:	41 5d                	pop    %r13
00f9     22f9:	41 5e                	pop    %r14
00fb     22fb:	41 5f                	pop    %r15
00fd     22fd:	31 c0                	xor    %eax,%eax
00ff     22ff:	31 d2                	xor    %edx,%edx
0101     2301:	31 f6                	xor    %esi,%esi
0103     2303:	31 ff                	xor    %edi,%edi
0105     2305:	e9 00 00 00 00       	jmp    230a <tdx_vcpu_enter_exit+0x10a>	2306: R_X86_64_PLT32	__x86_return_thunk-0x4
010a     230a:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	230b: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
010f     230f:	31 d2                	xor    %edx,%edx
0111     2311:	48 89 ee             	mov    %rbp,%rsi
0114     2314:	31 ff                	xor    %edi,%edi
0116     2316:	e8 00 00 00 00       	call   231b <tdx_vcpu_enter_exit+0x11b>	2317: R_X86_64_PLT32	pr_tdx_error-0x4
011b     231b:	eb ba                	jmp    22d7 <tdx_vcpu_enter_exit+0xd7>
011d     231d:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0127     2327:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0131     2331:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
013b     233b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
