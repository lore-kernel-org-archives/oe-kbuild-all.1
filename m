Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8DB23B3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 06:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681886378; x=1713422378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tYMyCq7gGOLTBVJ5O1cQCZwQKav3I+sFz45jQNSAmE4=;
  b=jPM7bH59EJU1vYTQRqGJz5uKU1fHtMyUnKtkt7Lsx706l+gBCHUQLA+s
   0Qdjz+AwvBYz07mV6bDLKC1t0bId14szrk/5SXN0nbjXih4ZkmCGY/tvf
   q1ujzs0vTIzYGxO21heHkyLmh7mznPpUzBLT2xqLE31Z20iatc0smRPL9
   wpS6fCm88d2Zy9Dy8yFN6H6xaPf5z8ZF4yT1Xjc7+8z48xuIDDNNoLpmY
   JqUz03Lb17VAx3Gt/gRfm/iguB2Uf0jGJvYJxD4+3REBnrzsMDUV1T10X
   9dXDG82OiJJylCSxFa8lEwlehX8MM8J7AxllhUBOXGiheePQfXeJa+bkn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="373246101"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="373246101"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 23:39:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="780745249"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="780745249"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Apr 2023 23:39:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp1Tb-000edH-35;
	Wed, 19 Apr 2023 06:39:35 +0000
Date: Wed, 19 Apr 2023 14:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie 18/19] vmlinux.o: warning: objtool:
 arch_rethook_trampoline+0x0: relocation to !ENDBR: trace_clock_x86_tsc+0xd
Message-ID: <202304191402.REDJU0cL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie
head:   01406d471d3e3718b3771fdabcfca8c505157404
commit: 11f4b2116bc9e6d18182a796e0db1c30232e3e8c [18/19] x86: Add support for linking the core kernel in PIE mode
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230419/202304191402.REDJU0cL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=11f4b2116bc9e6d18182a796e0db1c30232e3e8c
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-pie
        git checkout 11f4b2116bc9e6d18182a796e0db1c30232e3e8c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191402.REDJU0cL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: arch_rethook_trampoline+0x0: relocation to !ENDBR: trace_clock_x86_tsc+0xd


objdump-func vmlinux.o arch_rethook_trampoline:
0000 00000000000455e2 <arch_rethook_trampoline>:
0000    455e2:	ff 35 00 00 00 00    	push   0x0(%rip)        # 455e8 <arch_rethook_trampoline+0x6>	455e4: R_X86_64_GOTPCREL	arch_rethook_trampoline-0x4
0006    455e8:	6a 18                	push   $0x18
0008    455ea:	54                   	push   %rsp
0009    455eb:	9c                   	pushf
000a    455ec:	48 83 ec 18          	sub    $0x18,%rsp
000e    455f0:	57                   	push   %rdi
000f    455f1:	56                   	push   %rsi
0010    455f2:	52                   	push   %rdx
0011    455f3:	51                   	push   %rcx
0012    455f4:	50                   	push   %rax
0013    455f5:	41 50                	push   %r8
0015    455f7:	41 51                	push   %r9
0017    455f9:	41 52                	push   %r10
0019    455fb:	41 53                	push   %r11
001b    455fd:	53                   	push   %rbx
001c    455fe:	55                   	push   %rbp
001d    455ff:	41 54                	push   %r12
001f    45601:	41 55                	push   %r13
0021    45603:	41 56                	push   %r14
0023    45605:	41 57                	push   %r15
0025    45607:	48 89 e7             	mov    %rsp,%rdi
0028    4560a:	e8 00 00 00 00       	call   4560f <arch_rethook_trampoline+0x2d>	4560b: R_X86_64_PLT32	arch_rethook_trampoline_callback-0x4
002d    4560f:	41 5f                	pop    %r15
002f    45611:	41 5e                	pop    %r14
0031    45613:	41 5d                	pop    %r13
0033    45615:	41 5c                	pop    %r12
0035    45617:	5d                   	pop    %rbp
0036    45618:	5b                   	pop    %rbx
0037    45619:	41 5b                	pop    %r11
0039    4561b:	41 5a                	pop    %r10
003b    4561d:	41 59                	pop    %r9
003d    4561f:	41 58                	pop    %r8
003f    45621:	58                   	pop    %rax
0040    45622:	59                   	pop    %rcx
0041    45623:	5a                   	pop    %rdx
0042    45624:	5e                   	pop    %rsi
0043    45625:	5f                   	pop    %rdi
0044    45626:	48 83 c4 18          	add    $0x18,%rsp
0048    4562a:	48 83 c4 10          	add    $0x10,%rsp
004c    4562e:	9d                   	popf
004d    4562f:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
