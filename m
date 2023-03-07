Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782A7AD5F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 16:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678207216; x=1709743216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b4wCWTXIsfnqV3t7HPYd2w6+ZYaWnOktbFdbQlqTedI=;
  b=Ge2R5fH/t1g4YZGGxK+Gt/ENO/IOquQyNfh3SF9NWzvEn1Cbndia9Jba
   XgCnLhw58wDfYxKfm92j0XGkzOn6Oal+MM2SoMakqxvN680NhQ1XHgbg9
   G6bi7N+sK/gE2VjrTyUEVTaSkC5RdVBhPXzu3l+X5RqmSIRJiTgq3qckx
   c20iLjHWVMHDImQzDdkpuHGq2p0uTMjc0DN0d3vowCtL9rRnastbjQ+r1
   17HhhtjF1gvlVyfk4MlGATnr8ljCPrtWdMccqDAvNXWoqq+H0QjGQZaZS
   GgbC7hQJJkAhViAa23ry3w6ZD/HTc1IlvUjsLSfz6HYDciDftfRcjv0Wc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="324207234"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="324207234"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 08:40:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676612003"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="676612003"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Mar 2023 08:40:14 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZaMH-0001Tz-2Y;
	Tue, 07 Mar 2023 16:40:13 +0000
Date: Wed, 8 Mar 2023 00:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Tony Luck <tony.luck@intel.com>,
	Andi Kleen <ak@linux.intel.com>
Subject: [intel-tdx:guest-debug 2/4] vmlinux.o: warning: objtool:
 __halt+0x44: call to __trace_tdx_hypercall() leaves .noinstr.text section
Message-ID: <202303080034.1BdaJPHX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-debug
head:   cd4562557ed3eaea18d74d9521791d7889c696aa
commit: 9499ad5bd6e897e4c11b974504973939f2d4730a [2/4] x86/tdx: Add TDCALL tracepoint
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303080034.1BdaJPHX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/9499ad5bd6e897e4c11b974504973939f2d4730a
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-debug
        git checkout 9499ad5bd6e897e4c11b974504973939f2d4730a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080034.1BdaJPHX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __halt+0x44: call to __trace_tdx_hypercall() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x1be: call to context_tracking_guest_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0x85: call to context_tracking_guest_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0xb1e: call to pentium_machine_check.constprop.0() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_stackleak_irqoff+0x2b: call to end_of_stack() leaves .noinstr.text section


objdump-func vmlinux.o __halt:
0000 0000000000000040 <__halt>:
0000       40:	53                   	push   %rbx
0001       41:	89 fb                	mov    %edi,%ebx
0003       43:	48 83 ec 68          	sub    $0x68,%rsp
0007       47:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0010       50:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
0015       55:	31 c0                	xor    %eax,%eax
0017       57:	e8 00 00 00 00       	call   5c <__halt+0x1c>	58: R_X86_64_PLT32	stackleak_track_stack-0x4
001c       5c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	5d: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0021       61:	31 c0                	xor    %eax,%eax
0023       63:	b9 0c 00 00 00       	mov    $0xc,%ecx
0028       68:	0f b6 db             	movzbl %bl,%ebx
002b       6b:	48 89 e7             	mov    %rsp,%rdi
002e       6e:	31 f6                	xor    %esi,%esi
0030       70:	f3 48 ab             	rep stos %rax,%es:(%rdi)
0033       73:	48 89 e7             	mov    %rsp,%rdi
0036       76:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
003b       7b:	48 c7 44 24 18 0c 00 00 00 	movq   $0xc,0x18(%rsp)
0044       84:	e8 00 00 00 00       	call   89 <__halt+0x49>	85: R_X86_64_PC32	.text+0x83fc
0049       89:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
004e       8e:	65 48 2b 14 25 28 00 00 00 	sub    %gs:0x28,%rdx
0057       97:	75 12                	jne    ab <__halt+0x6b>
0059       99:	48 83 c4 68          	add    $0x68,%rsp
005d       9d:	5b                   	pop    %rbx
005e       9e:	31 d2                	xor    %edx,%edx
0060       a0:	31 c9                	xor    %ecx,%ecx
0062       a2:	31 f6                	xor    %esi,%esi
0064       a4:	31 ff                	xor    %edi,%edi
0066       a6:	e9 00 00 00 00       	jmp    ab <__halt+0x6b>	a7: R_X86_64_PLT32	__x86_return_thunk-0x4
006b       ab:	e8 00 00 00 00       	call   b0 <__halt+0x70>	ac: R_X86_64_PLT32	__stack_chk_fail-0x4
0070       b0:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
007b       bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
