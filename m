Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F9E195
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 04:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680323773; x=1711859773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nPSrVbNTKN55QTTCUFNTFdYPaVdWecfUKrPPUii8Xn0=;
  b=HK9whGAbanXqK4SzsD85sLpBBZt1S6BsNDP4EEKtbYTbuuk7ts6CIcBn
   Dy3RH+EHYVfxvQJdv4OJZvfmqFgHY9ttETRDqTyqpgIGfAWOdbmT2k82o
   p8POWNsadnA+77TYhmWZl+TJ+fq4PiNiM9exK9mpPPjLt9NNgH8pHO+dw
   e816AcRfWCbQ9tTNd0C1z3rYNS2NWh9jkuxE6u7n3tVjUlHo3v48K1PrC
   GEmpP5x0hUyN7P33mZ61V+lWRJtlSVTNF4AJEcdLJ1Rm4nEW9XKjH7FsT
   NpCHGo5xSA8JFNbIpiFE9uqPl/B3TlFxTezid/Z0Bxm++M8AX3aRyjT8C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="344159264"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="344159264"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 21:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="678845155"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="678845155"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Mar 2023 21:36:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piSyI-000MS1-3D;
	Sat, 01 Apr 2023 04:36:11 +0000
Date: Sat, 1 Apr 2023 12:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 298/328] vmlinux.o: warning:
 objtool: tdx_vcpu_enter_exit+0x92: call to to_tdx() leaves .noinstr.text
 section
Message-ID: <202304011234.TQ4D3yHm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   694338d50183e3371330efb5291e044153c7c615
commit: 38143d6d1d321dab5cf7093fad9e4a873567df91 [298/328] [REVERTME] KVM: TDX: save info on TDExit for debug
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230401/202304011234.TQ4D3yHm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/38143d6d1d321dab5cf7093fad9e4a873567df91
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 38143d6d1d321dab5cf7093fad9e4a873567df91
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304011234.TQ4D3yHm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x1e4: call to context_tracking_guest_exit() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: tdx_vcpu_enter_exit+0x92: call to to_tdx() leaves .noinstr.text section
   vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0x85: call to context_tracking_guest_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0xb2f: call to pentium_machine_check.constprop.0() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_stackleak_irqoff+0x2b: call to end_of_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: np_seamldr_launch+0x129: missing int3 after ret


objdump-func vmlinux.o tdx_vcpu_enter_exit:
0000 0000000000001bc0 <tdx_vcpu_enter_exit>:
0000     1bc0:	41 54                	push   %r12
0002     1bc2:	49 89 fc             	mov    %rdi,%r12
0005     1bc5:	55                   	push   %rbp
0006     1bc6:	48 89 f5             	mov    %rsi,%rbp
0009     1bc9:	53                   	push   %rbx
000a     1bca:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1bcb: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
000f     1bcf:	90                   	nop
0010     1bd0:	e8 00 00 00 00       	call   1bd5 <tdx_vcpu_enter_exit+0x15>	1bd1: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
0015     1bd5:	e8 00 00 00 00       	call   1bda <tdx_vcpu_enter_exit+0x1a>	1bd6: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
001a     1bda:	90                   	nop
001b     1bdb:	90                   	nop
001c     1bdc:	e8 00 00 00 00       	call   1be1 <tdx_vcpu_enter_exit+0x21>	1bdd: R_X86_64_PC32	.text+0x27acfc
0021     1be1:	90                   	nop
0022     1be2:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0027     1be7:	e8 00 00 00 00       	call   1bec <tdx_vcpu_enter_exit+0x2c>	1be8: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
002c     1bec:	48 8b bd d0 1f 00 00 	mov    0x1fd0(%rbp),%rdi
0033     1bf3:	8b 95 f0 1f 00 00    	mov    0x1ff0(%rbp),%edx
0039     1bf9:	49 8d b4 24 d8 01 00 00 	lea    0x1d8(%r12),%rsi
0041     1c01:	e8 00 00 00 00       	call   1c06 <tdx_vcpu_enter_exit+0x46>	1c02: R_X86_64_PLT32	__tdx_vcpu_run-0x4
0046     1c06:	31 ff                	xor    %edi,%edi
0048     1c08:	48 89 85 f8 1f 00 00 	mov    %rax,0x1ff8(%rbp)
004f     1c0f:	48 89 c3             	mov    %rax,%rbx
0052     1c12:	89 c6                	mov    %eax,%esi
0054     1c14:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1c15: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp2-0x4
0059     1c19:	66 85 db             	test   %bx,%bx
005c     1c1c:	74 2c                	je     1c4a <tdx_vcpu_enter_exit+0x8a>
005e     1c1e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1c1f: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0063     1c23:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0068     1c28:	e8 00 00 00 00       	call   1c2d <tdx_vcpu_enter_exit+0x6d>	1c29: R_X86_64_PLT32	lockdep_hardirqs_off-0x4
006d     1c2d:	e8 00 00 00 00       	call   1c32 <tdx_vcpu_enter_exit+0x72>	1c2e: R_X86_64_PC32	.text+0x27a27c
0072     1c32:	90                   	nop
0073     1c33:	e8 00 00 00 00       	call   1c38 <tdx_vcpu_enter_exit+0x78>	1c34: R_X86_64_PLT32	trace_hardirqs_off_finish-0x4
0078     1c38:	90                   	nop
0079     1c39:	5b                   	pop    %rbx
007a     1c3a:	5d                   	pop    %rbp
007b     1c3b:	41 5c                	pop    %r12
007d     1c3d:	31 c0                	xor    %eax,%eax
007f     1c3f:	31 d2                	xor    %edx,%edx
0081     1c41:	31 f6                	xor    %esi,%esi
0083     1c43:	31 ff                	xor    %edi,%edi
0085     1c45:	e9 00 00 00 00       	jmp    1c4a <tdx_vcpu_enter_exit+0x8a>	1c46: R_X86_64_PLT32	__x86_return_thunk-0x4
008a     1c4a:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1c4b: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
008f     1c4f:	4c 89 e7             	mov    %r12,%rdi
0092     1c52:	e8 00 00 00 00       	call   1c57 <tdx_vcpu_enter_exit+0x97>	1c53: R_X86_64_PC32	.text+0x27b2bc
0097     1c57:	bf 00 02 00 80       	mov    $0x80000200,%edi
009c     1c5c:	8b 98 18 20 00 00    	mov    0x2018(%rax),%ebx
00a2     1c62:	81 e3 00 07 00 80    	and    $0x80000700,%ebx
00a8     1c68:	89 de                	mov    %ebx,%esi
00aa     1c6a:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1c6b: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp4-0x4
00af     1c6f:	81 fb 00 02 00 80    	cmp    $0x80000200,%ebx
00b5     1c75:	75 a7                	jne    1c1e <tdx_vcpu_enter_exit+0x5e>
00b7     1c77:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1c78: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00bc     1c7c:	41 c6 84 24 12 0c 00 00 02 	movb   $0x2,0xc12(%r12)
00c5     1c85:	e8 00 00 00 00       	call   1c8a <tdx_vcpu_enter_exit+0xca>	1c86: R_X86_64_PLT32	vmx_do_nmi_irqoff-0x4
00ca     1c8a:	41 c6 84 24 12 0c 00 00 00 	movb   $0x0,0xc12(%r12)
00d3     1c93:	eb 89                	jmp    1c1e <tdx_vcpu_enter_exit+0x5e>
00d5     1c95:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
00df     1c9f:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
00e9     1ca9:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
00f3     1cb3:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
00fd     1cbd:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
