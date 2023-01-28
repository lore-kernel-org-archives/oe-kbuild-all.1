Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29F92F47
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674924826; x=1706460826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vRkPCVJxpUWRe9aoG6jdkY5CqBFWolpjIN4PiNocKuI=;
  b=ZCI660BeJDhIduHTHVCPtCkgpjrbCPbd42IaC++aag8UmX1z37PPueVW
   WBs1SzOzakNsRuNBhb0VCC3x3ckW6f6juEe7VTWwuQ8RfczqGlFm0Cp+O
   yNkHzwqfS9mSghyXeX+gwn/GRp/zsUtoRF9O9htN7BHA6s7Ol0eKwtZHI
   mXIrrqgnXmBcRmRWZpTb9OsZUYz8KeV0MQvrnycf+C5kEgnaB0cjcEWdf
   enW6g48uQ3cn2HkI4ZDqD7S1elqRX3m1zVv+62oeljy87YgoFLs0rGXka
   EEL0ze+XPz/gQub5XRPvkG8caZq8B/vB1/MnRrAe0VPHbdJs3w6PdbAE3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="413530229"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="413530229"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 08:53:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="787540585"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="787540585"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Jan 2023 08:53:44 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLoSV-0000vV-1L;
	Sat, 28 Jan 2023 16:53:43 +0000
Date: Sun, 29 Jan 2023 00:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>
Subject: [tip:x86/tdx 3/7] vmlinux.o: warning: objtool: __tdx_hypercall+0x7f:
 return with modified stack frame
Message-ID: <202301290027.sxK9YqsA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kirill,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
head:   8de62af018cc9262649d7688f7eb1409b2d8f594
commit: c30c4b2555ba93b845559a036293fcaf7ffd2b82 [3/7] x86/tdx: Refactor __tdx_hypercall() to allow pass down more arguments
config: x86_64-randconfig-r035-20230123 (https://download.01.org/0day-ci/archive/20230129/202301290027.sxK9YqsA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=c30c4b2555ba93b845559a036293fcaf7ffd2b82
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip x86/tdx
        git checkout c30c4b2555ba93b845559a036293fcaf7ffd2b82
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __tdx_hypercall+0x7f: return with modified stack frame
   vmlinux.o: warning: objtool: vmw_port_hb_in+0x2b2: stack state mismatch: cfa1=5+16 cfa2=4+8
   vmlinux.o: warning: objtool: vmw_port_hb_out+0x2c6: stack state mismatch: cfa1=5+16 cfa2=4+8


objdump-func vmlinux.o __tdx_hypercall:
0000 0000000000005ae0 <__tdx_hypercall>:
0000     5ae0:	f3 0f 1e fa          	endbr64
0004     5ae4:	55                   	push   %rbp
0005     5ae5:	48 89 e5             	mov    %rsp,%rbp
0008     5ae8:	41 57                	push   %r15
000a     5aea:	41 56                	push   %r14
000c     5aec:	41 55                	push   %r13
000e     5aee:	41 54                	push   %r12
0010     5af0:	55                   	push   %rbp
0011     5af1:	48 89 f8             	mov    %rdi,%rax
0014     5af4:	48 89 f5             	mov    %rsi,%rbp
0017     5af7:	4c 8b 50 10          	mov    0x10(%rax),%r10
001b     5afb:	4c 8b 58 18          	mov    0x18(%rax),%r11
001f     5aff:	4c 8b 60 20          	mov    0x20(%rax),%r12
0023     5b03:	4c 8b 68 28          	mov    0x28(%rax),%r13
0027     5b07:	4c 8b 70 30          	mov    0x30(%rax),%r14
002b     5b0b:	4c 8b 78 38          	mov    0x38(%rax),%r15
002f     5b0f:	50                   	push   %rax
0030     5b10:	31 c0                	xor    %eax,%eax
0032     5b12:	b9 00 fc 00 00       	mov    $0xfc00,%ecx
0037     5b17:	48 f7 c5 02 00 00 00 	test   $0x2,%rbp
003e     5b1e:	74 01                	je     5b21 <__tdx_hypercall+0x41>
0040     5b20:	fb                   	sti
0041     5b21:	66 0f 01 cc          	tdcall
0045     5b25:	48 85 c0             	test   %rax,%rax
0048     5b28:	75 36                	jne    5b60 <__tdx_hypercall+0x80>
004a     5b2a:	58                   	pop    %rax
004b     5b2b:	48 f7 c5 01 00 00 00 	test   $0x1,%rbp
0052     5b32:	74 18                	je     5b4c <__tdx_hypercall+0x6c>
0054     5b34:	4c 89 50 10          	mov    %r10,0x10(%rax)
0058     5b38:	4c 89 58 18          	mov    %r11,0x18(%rax)
005c     5b3c:	4c 89 60 20          	mov    %r12,0x20(%rax)
0060     5b40:	4c 89 68 28          	mov    %r13,0x28(%rax)
0064     5b44:	4c 89 70 30          	mov    %r14,0x30(%rax)
0068     5b48:	4c 89 78 38          	mov    %r15,0x38(%rax)
006c     5b4c:	4c 89 d0             	mov    %r10,%rax
006f     5b4f:	45 31 d2             	xor    %r10d,%r10d
0072     5b52:	45 31 db             	xor    %r11d,%r11d
0075     5b55:	5d                   	pop    %rbp
0076     5b56:	41 5c                	pop    %r12
0078     5b58:	41 5d                	pop    %r13
007a     5b5a:	41 5e                	pop    %r14
007c     5b5c:	41 5f                	pop    %r15
007e     5b5e:	5d                   	pop    %rbp
007f     5b5f:	c3                   	ret
0080     5b60:	e8 00 00 00 00       	call   5b65 <__tdx_hypercall+0x85>	5b61: R_X86_64_PLT32	__tdx_hypercall_failed-0x4
0085     5b65:	eb f9                	jmp    5b60 <__tdx_hypercall+0x80>
0087     5b67:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
