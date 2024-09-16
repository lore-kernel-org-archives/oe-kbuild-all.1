Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC84228FA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 05:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726464776; cv=none; b=Vo/GXsdtjRpVXiXwrgVhlkOn+vQDYkmgITz+uCcxMOYX3rBvNi3A3zOQR90lUeW32lAfaQbBSa4sUjN/sC0jzMNFSjbTEIhYCEW48Ob8oN0sCqIy1iYLBwGPc0peUtzmwf6Jm3fkVC1rQhiwpKOZ8GDkTmq/dSrZ4mH/jMCmOuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726464776; c=relaxed/simple;
	bh=WeqtgQChFFhuJFGNPT6JkhCr9pS0+zHAE6ZK0Wh1mvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QLikqoVf8Z+3SffsmGBn3oTwtJCDGtHqxZDrfXS83BW4zoJDeLU1MLx7edZXEcaJuM8H14SAJSS1yBhF2ihWGPRvCsVrH0Q+z6KlReLk0hS/9og8LpE+Y6DRFHrHteHypXi+5XDW/NobiJ6QaxJjnrz+atGa5zweaiksnRE+ZEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIhdO6Ee; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIhdO6Ee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726464775; x=1758000775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WeqtgQChFFhuJFGNPT6JkhCr9pS0+zHAE6ZK0Wh1mvE=;
  b=dIhdO6EezdQXj4sgdLJToe2tIo+04oJoxSD+rGeSTUmqj4f3jCJPHSO+
   x9pH8h8mdargucI9emg0+aA5UARCkfptmIOq6QHOp9rl3T3angX84PIbS
   JdZU+sXuZ0ndn+l10wzEOpBR6gsQi1HxSPGBmtGf6/rF96HKdhR9o1ONR
   RjFdxxJV7xOdkohcXx6h2DMWRsQCrXtWw9JREGiaCUj1c/HuQFIeA9Qkr
   ilZBWYvHmYTSC4cRHkLM9qqINueQsbc9NZY6YsuEFaQf9YPsfqFOKHIWK
   M3OMH7timFWYE1vSKefIIj16zTssoMNls5jQCXiKMxreZV9R3HOCC04BF
   g==;
X-CSE-ConnectionGUID: MwcVT943T42JqjaiB13MNw==
X-CSE-MsgGUID: eE5D3hOiS1WbMhr0CKeR/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25166264"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="25166264"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 22:32:54 -0700
X-CSE-ConnectionGUID: qC+tK/n6StCxnF61BDLvXQ==
X-CSE-MsgGUID: Jd67EirtS1eaI4M46H+OGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68872072"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Sep 2024 22:32:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq4Lz-0009QS-0N;
	Mon, 16 Sep 2024 05:32:51 +0000
Date: Mon, 16 Sep 2024 13:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 2662/30000]
 drivers/irqchip/irq-uniphier-aidet.o: warning: objtool:
 uniphier_aidet_domain_translate()+0xc1: unreachable instruction
Message-ID: <202409161318.ZuAI4iZs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   1b3964c5e070d088ca4c9591cbadd91a22e438ea
commit: 90169c0955b2b89ef84a478549d16b24be977cd1 [2662/30000] UPSTREAM: security: Implement Clang's stack initialization
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240916/202409161318.ZuAI4iZs-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161318.ZuAI4iZs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161318.ZuAI4iZs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-uniphier-aidet.o: warning: objtool: uniphier_aidet_domain_translate()+0xc1: unreachable instruction


objdump-func vmlinux.o uniphier_aidet_domain_translate:
0000 0000000000d4f45b <uniphier_aidet_domain_translate>:
0000   d4f45b:	e8 00 00 00 00       	call   d4f460 <uniphier_aidet_domain_translate+0x5>	d4f45c: R_X86_64_PLT32	__fentry__-0x4
0005   d4f460:	55                   	push   %rbp
0006   d4f461:	48 89 e5             	mov    %rsp,%rbp
0009   d4f464:	41 57                	push   %r15
000b   d4f466:	41 56                	push   %r14
000d   d4f468:	41 55                	push   %r13
000f   d4f46a:	41 54                	push   %r12
0011   d4f46c:	53                   	push   %rbx
0012   d4f46d:	48 89 cb             	mov    %rcx,%rbx
0015   d4f470:	49 89 d7             	mov    %rdx,%r15
0018   d4f473:	49 89 f6             	mov    %rsi,%r14
001b   d4f476:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0025   d4f480:	e8 00 00 00 00       	call   d4f485 <uniphier_aidet_domain_translate+0x2a>	d4f481: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
002a   d4f485:	4d 8d 66 08          	lea    0x8(%r14),%r12
002e   d4f489:	4c 89 e0             	mov    %r12,%rax
0031   d4f48c:	48 c1 e8 03          	shr    $0x3,%rax
0035   d4f490:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0039   d4f494:	84 c0                	test   %al,%al
003b   d4f496:	0f 85 87 00 00 00    	jne    d4f523 <uniphier_aidet_domain_translate+0xc8>
0041   d4f49c:	41 83 3c 24 01       	cmpl   $0x1,(%r12)
0046   d4f4a1:	7e 72                	jle    d4f515 <uniphier_aidet_domain_translate+0xba>
0048   d4f4a3:	e8 00 00 00 00       	call   d4f4a8 <uniphier_aidet_domain_translate+0x4d>	d4f4a4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
004d   d4f4a8:	4d 8d 66 0c          	lea    0xc(%r14),%r12
0051   d4f4ac:	4c 89 e0             	mov    %r12,%rax
0054   d4f4af:	48 c1 e8 03          	shr    $0x3,%rax
0058   d4f4b3:	42 8a 04 28          	mov    (%rax,%r13,1),%al
005c   d4f4b7:	84 c0                	test   %al,%al
005e   d4f4b9:	0f 85 82 00 00 00    	jne    d4f541 <uniphier_aidet_domain_translate+0xe6>
0064   d4f4bf:	4c 89 f8             	mov    %r15,%rax
0067   d4f4c2:	45 8b 24 24          	mov    (%r12),%r12d
006b   d4f4c6:	48 c1 e8 03          	shr    $0x3,%rax
006f   d4f4ca:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0074   d4f4cf:	74 08                	je     d4f4d9 <uniphier_aidet_domain_translate+0x7e>
0076   d4f4d1:	4c 89 ff             	mov    %r15,%rdi
0079   d4f4d4:	e8 00 00 00 00       	call   d4f4d9 <uniphier_aidet_domain_translate+0x7e>	d4f4d5: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
007e   d4f4d9:	49 83 c6 10          	add    $0x10,%r14
0082   d4f4dd:	4d 89 27             	mov    %r12,(%r15)
0085   d4f4e0:	4c 89 f0             	mov    %r14,%rax
0088   d4f4e3:	48 c1 e8 03          	shr    $0x3,%rax
008c   d4f4e7:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0090   d4f4eb:	84 c0                	test   %al,%al
0092   d4f4ed:	75 70                	jne    d4f55f <uniphier_aidet_domain_translate+0x104>
0094   d4f4ef:	48 89 d8             	mov    %rbx,%rax
0097   d4f4f2:	45 8b 36             	mov    (%r14),%r14d
009a   d4f4f5:	48 c1 e8 03          	shr    $0x3,%rax
009e   d4f4f9:	41 83 e6 0f          	and    $0xf,%r14d
00a2   d4f4fd:	42 8a 04 28          	mov    (%rax,%r13,1),%al
00a6   d4f501:	84 c0                	test   %al,%al
00a8   d4f503:	75 74                	jne    d4f579 <uniphier_aidet_domain_translate+0x11e>
00aa   d4f505:	31 c0                	xor    %eax,%eax
00ac   d4f507:	44 89 33             	mov    %r14d,(%rbx)
00af   d4f50a:	5b                   	pop    %rbx
00b0   d4f50b:	41 5c                	pop    %r12
00b2   d4f50d:	41 5d                	pop    %r13
00b4   d4f50f:	41 5e                	pop    %r14
00b6   d4f511:	41 5f                	pop    %r15
00b8   d4f513:	5d                   	pop    %rbp
00b9   d4f514:	c3                   	ret
00ba   d4f515:	e8 00 00 00 00       	call   d4f51a <uniphier_aidet_domain_translate+0xbf>	d4f516: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00bf   d4f51a:	0f 0b                	ud2
00c1   d4f51c:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
00c6   d4f521:	eb e7                	jmp    d4f50a <uniphier_aidet_domain_translate+0xaf>
00c8   d4f523:	44 89 e1             	mov    %r12d,%ecx
00cb   d4f526:	80 e1 07             	and    $0x7,%cl
00ce   d4f529:	80 c1 03             	add    $0x3,%cl
00d1   d4f52c:	38 c1                	cmp    %al,%cl
00d3   d4f52e:	0f 8c 68 ff ff ff    	jl     d4f49c <uniphier_aidet_domain_translate+0x41>
00d9   d4f534:	4c 89 e7             	mov    %r12,%rdi
00dc   d4f537:	e8 00 00 00 00       	call   d4f53c <uniphier_aidet_domain_translate+0xe1>	d4f538: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
00e1   d4f53c:	e9 5b ff ff ff       	jmp    d4f49c <uniphier_aidet_domain_translate+0x41>
00e6   d4f541:	44 89 e1             	mov    %r12d,%ecx
00e9   d4f544:	80 e1 07             	and    $0x7,%cl
00ec   d4f547:	80 c1 03             	add    $0x3,%cl
00ef   d4f54a:	38 c1                	cmp    %al,%cl
00f1   d4f54c:	0f 8c 6d ff ff ff    	jl     d4f4bf <uniphier_aidet_domain_translate+0x64>
00f7   d4f552:	4c 89 e7             	mov    %r12,%rdi
00fa   d4f555:	e8 00 00 00 00       	call   d4f55a <uniphier_aidet_domain_translate+0xff>	d4f556: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
00ff   d4f55a:	e9 60 ff ff ff       	jmp    d4f4bf <uniphier_aidet_domain_translate+0x64>
0104   d4f55f:	44 89 f1             	mov    %r14d,%ecx
0107   d4f562:	80 e1 07             	and    $0x7,%cl
010a   d4f565:	80 c1 03             	add    $0x3,%cl
010d   d4f568:	38 c1                	cmp    %al,%cl
010f   d4f56a:	7c 83                	jl     d4f4ef <uniphier_aidet_domain_translate+0x94>
0111   d4f56c:	4c 89 f7             	mov    %r14,%rdi
0114   d4f56f:	e8 00 00 00 00       	call   d4f574 <uniphier_aidet_domain_translate+0x119>	d4f570: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0119   d4f574:	e9 76 ff ff ff       	jmp    d4f4ef <uniphier_aidet_domain_translate+0x94>
011e   d4f579:	89 d9                	mov    %ebx,%ecx
0120   d4f57b:	80 e1 07             	and    $0x7,%cl
0123   d4f57e:	80 c1 03             	add    $0x3,%cl
0126   d4f581:	38 c1                	cmp    %al,%cl
0128   d4f583:	7c 80                	jl     d4f505 <uniphier_aidet_domain_translate+0xaa>
012a   d4f585:	48 89 df             	mov    %rbx,%rdi
012d   d4f588:	e8 00 00 00 00       	call   d4f58d <uniphier_aidet_domain_translate+0x132>	d4f589: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0132   d4f58d:	e9 73 ff ff ff       	jmp    d4f505 <uniphier_aidet_domain_translate+0xaa>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
