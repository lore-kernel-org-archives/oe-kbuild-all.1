Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72602F9CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695986585; x=1727522585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nL+qyYgPdeykobH4YE84t6T1IWyJGezQrclux2SUoqQ=;
  b=DtyDkSNlVEqQIO7OikJiWCEg8HX1LpY69ngCib5VpyGZUAmlZLsS2Mck
   6FAoLcTieYf/Bh75mKKtsEgW9x/5RbtH7xXovtcEj1XYlOpMR/Sl5Wjdf
   EzJTMNv1xQ8jYj4G/kwMp6n+N13vees3piEb5Igt4mA63B6XdIi+75wVj
   eYAOxKZ6N1cgu0ZPg0npYrDmsVFv4WtsaOo5K0YZoUBxHKcCk1Zk3L4p+
   19FqAbDbHzWMoW9MvV7A7nPrbJA01aHFWjLs9lw1hnKhebf0mU8lqq+7N
   8YDlLzopjvC82hYPoxLU4vHUjSvBWobsQE7ZYn/9DUgW0pGMX0fSA1+Cl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="362523951"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="362523951"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 04:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="779244503"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="779244503"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Sep 2023 04:23:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmBaG-0002nu-1a;
	Fri, 29 Sep 2023 11:23:00 +0000
Date: Fri, 29 Sep 2023 19:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Wang <wei.w.wang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:tdx-mig-wip 1/76] vmlinux.o: warning: objtool:
 __tdx_hypercall+0x10: call to tdcall_saved_ret.constprop.0() leaves
 .noinstr.text section
Message-ID: <202309291917.RrMgh9pz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git tdx-mig-wip
head:   a1edcfad8edb83e0f7420f02074834c222669c71
commit: 26848363c36b5fd73662fc4fe1dd34cc9f65b559 [1/76] x86/tdx: retry tdcalls on TDX_OPERAND_BUSY related errors
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230929/202309291917.RrMgh9pz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291917.RrMgh9pz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291917.RrMgh9pz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __tdx_hypercall+0x10: call to tdcall_saved_ret.constprop.0() leaves .noinstr.text section
   vmlinux.o: warning: objtool: tdx_vcpu_enter_exit+0x5b: call to __seamcall_saved_ret() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __halt+0x2c: call to __trace_tdx_hypercall() leaves .noinstr.text section
   vmlinux.o: warning: objtool: np_seamldr_launch+0x129: missing int3 after ret


objdump-func vmlinux.o __tdx_hypercall:
0000 0000000000000300 <__tdx_hypercall_failed>:
0000      300:	f3 0f 1e fa          	endbr64
0004      304:	90                   	nop
0005      305:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	308: R_X86_64_32S	.rodata.str1.8+0x1960
000c      30c:	e8 00 00 00 00       	call   311 <__tdx_hypercall_failed+0x11>	30d: R_X86_64_PLT32	panic-0x4
0011      311:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
001b      31b:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0025      325:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
002f      32f:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0039      339:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
0000 0000000000000380 <__tdx_hypercall>:
0000      380:	f3 0f 1e fa          	endbr64
0004      384:	53                   	push   %rbx
0005      385:	48 89 fb             	mov    %rdi,%rbx
0008      388:	48 c7 47 08 cc ff 00 00 	movq   $0xffcc,0x8(%rdi)
0010      390:	e8 00 00 00 00       	call   395 <__tdx_hypercall+0x15>	391: R_X86_64_PC32	.text+0xae7c
0015      395:	48 85 c0             	test   %rax,%rax
0018      398:	75 0c                	jne    3a6 <__tdx_hypercall+0x26>
001a      39a:	48 8b 43 50          	mov    0x50(%rbx),%rax
001e      39e:	5b                   	pop    %rbx
001f      39f:	31 ff                	xor    %edi,%edi
0021      3a1:	e9 00 00 00 00       	jmp    3a6 <__tdx_hypercall+0x26>	3a2: R_X86_64_PLT32	__x86_return_thunk-0x4
0026      3a6:	e8 00 00 00 00       	call   3ab <__tdx_hypercall+0x2b>	3a7: R_X86_64_PLT32	__tdx_hypercall_failed-0x4
002b      3ab:	48 8b 43 50          	mov    0x50(%rbx),%rax
002f      3af:	5b                   	pop    %rbx
0030      3b0:	31 ff                	xor    %edi,%edi
0032      3b2:	e9 00 00 00 00       	jmp    3b7 <__tdx_hypercall+0x37>	3b3: R_X86_64_PLT32	__x86_return_thunk-0x4
0037      3b7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
