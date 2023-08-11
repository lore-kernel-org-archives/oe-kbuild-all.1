Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689FA8833
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 22:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691792876; x=1723328876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pUgdyo4d7TgGq2Sp+EmelQCRug3OdgOMsnmyang2IdQ=;
  b=NDPTniMSe0cicFScNUC79Ep12vTEDBk4JUCUJGZB4F/azi47D9KGQxRQ
   nuKhpl+pxNv4espt0b9gH0wP8V8FEvoo3SZJqLmkFoVmJEUSJR/Xt6+C5
   4LSUlX/CD1cmqqbnBBHf1/YHs4zowRS1r2RNsVRu0c3eRc8qS2D0WhwF4
   q7dcABKik0Af95Xf7l0AOKe3yiJDc+4e7mhmjSdBPS10QjINE7+YkWeSJ
   iWBOvFGy6oxW2m/+CJoudOue9CKC0PXkmsc9kQf5mDBYZtM5Khg8nSg3C
   CJKN24XtpLMcAyKm9zTKyPoKNVN9vHQWuZIfTN7g5tNqofumjp5x9aXXm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371781365"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="371781365"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 15:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="798188051"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="798188051"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Aug 2023 15:27:54 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUabp-000854-0c;
	Fri, 11 Aug 2023 22:27:53 +0000
Date: Sat, 12 Aug 2023 06:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/idle 3/10] vmlinux.o: warning: objtool:
 poll_idle+0x20: call to tick_nohz_tick_stopped() leaves .noinstr.text
 section
Message-ID: <202308120640.chJQodOG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/idle
head:   b66dd12bb29cca558b9323f2b270a7dae8f56c48
commit: eda30678a7c64885469b2dc17d540f42727c38ea [3/10] cpuidle: Report illegal tick stopped while polling
config: x86_64-buildonly-randconfig-r003-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120640.chJQodOG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120640.chJQodOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120640.chJQodOG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: intel_idle_ibrs+0xd: call to sched_smt_active() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: poll_idle+0x20: call to tick_nohz_tick_stopped() leaves .noinstr.text section


objdump-func vmlinux.o poll_idle:
0000 000000000000073a <poll_idle>:
0000  73a:	f3 0f 1e fa          	endbr64
0004  73e:	41 56                	push   %r14
0006  740:	49 89 f6             	mov    %rsi,%r14
0009  743:	41 55                	push   %r13
000b  745:	41 54                	push   %r12
000d  747:	41 89 d4             	mov    %edx,%r12d
0010  74a:	55                   	push   %rbp
0011  74b:	53                   	push   %rbx
0012  74c:	48 89 fb             	mov    %rdi,%rbx
0015  74f:	e8 00 00 00 00       	call   754 <poll_idle+0x1a>	750: R_X86_64_PLT32	local_clock_noinstr-0x4
001a  754:	80 23 fb             	andb   $0xfb,(%rbx)
001d  757:	49 89 c5             	mov    %rax,%r13
0020  75a:	e8 00 00 00 00       	call   75f <poll_idle+0x25>	75b: R_X86_64_PLT32	tick_nohz_tick_stopped-0x4
0025  75f:	84 c0                	test   %al,%al
0027  761:	74 04                	je     767 <poll_idle+0x2d>
0029  763:	90                   	nop
002a  764:	0f 0b                	ud2
002c  766:	90                   	nop
002d  767:	fb                   	sti
002e  768:	48 8b 2c 25 00 00 00 00 	mov    0x0,%rbp	76c: R_X86_64_32S	pcpu_hot
0036  770:	80 4d 02 20          	orb    $0x20,0x2(%rbp)
003a  774:	48 8b 45 00          	mov    0x0(%rbp),%rax
003e  778:	a8 08                	test   $0x8,%al
0040  77a:	75 32                	jne    7ae <poll_idle+0x74>
0042  77c:	4c 89 f7             	mov    %r14,%rdi
0045  77f:	48 89 de             	mov    %rbx,%rsi
0048  782:	e8 00 00 00 00       	call   787 <poll_idle+0x4d>	783: R_X86_64_PLT32	cpuidle_poll_time-0x4
004d  787:	49 89 c6             	mov    %rax,%r14
0050  78a:	b8 c9 00 00 00       	mov    $0xc9,%eax
0055  78f:	48 8b 55 00          	mov    0x0(%rbp),%rdx
0059  793:	80 e2 08             	and    $0x8,%dl
005c  796:	75 16                	jne    7ae <poll_idle+0x74>
005e  798:	f3 90                	pause
0060  79a:	ff c8                	dec    %eax
0062  79c:	75 f1                	jne    78f <poll_idle+0x55>
0064  79e:	e8 00 00 00 00       	call   7a3 <poll_idle+0x69>	79f: R_X86_64_PLT32	local_clock_noinstr-0x4
0069  7a3:	4c 29 e8             	sub    %r13,%rax
006c  7a6:	49 39 c6             	cmp    %rax,%r14
006f  7a9:	73 df                	jae    78a <poll_idle+0x50>
0071  7ab:	80 0b 04             	orb    $0x4,(%rbx)
0074  7ae:	fa                   	cli
0075  7af:	48 8b 04 25 00 00 00 00 	mov    0x0,%rax	7b3: R_X86_64_32S	pcpu_hot
007d  7b7:	80 60 02 df          	andb   $0xdf,0x2(%rax)
0081  7bb:	48 8b 00             	mov    (%rax),%rax
0084  7be:	a8 08                	test   $0x8,%al
0086  7c0:	74 0a                	je     7cc <poll_idle+0x92>
0088  7c2:	81 25 00 00 00 00 ff ff ff 7f 	andl   $0x7fffffff,0x0(%rip)        # 7cc <poll_idle+0x92>	7c4: R_X86_64_PC32	pcpu_hot
0092  7cc:	5b                   	pop    %rbx
0093  7cd:	44 89 e0             	mov    %r12d,%eax
0096  7d0:	5d                   	pop    %rbp
0097  7d1:	41 5c                	pop    %r12
0099  7d3:	41 5d                	pop    %r13
009b  7d5:	41 5e                	pop    %r14
009d  7d7:	31 d2                	xor    %edx,%edx
009f  7d9:	31 f6                	xor    %esi,%esi
00a1  7db:	31 ff                	xor    %edi,%edi
00a3  7dd:	c3                   	ret
00a4  7de:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
