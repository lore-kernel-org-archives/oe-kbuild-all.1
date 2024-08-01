Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB325A48
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 01:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722476536; cv=none; b=I44uXdoa/Y0Gt+NcR6uArh9Jpcc3Im1d2UgOcTX47OS/3A0cmlI9Wq30YVPg0I57oWdHGhaIcK9BGab6Andwo3kk95tp40ZaDq2TnlhgmNrX52B1i9a+ZSZcszkF+zgqAyjO27XijZ6tYb6Vi6/NSIFic6nBLbz6C+Jo75/Pgac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722476536; c=relaxed/simple;
	bh=EOjx5q32MFGSol9RIa91sXvQyaDKPK/N48TqabnFlbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DWZvgVIiIlvrrMzGJoXztIsx7JTxMH8srNDwmUeS9e6BBvuSxSekcrJ54iLbsLPhxgnmfy8ozUNYrHi6dmx3dUiZZ4skcM1Bw9TKiZ7oE9VogAg47d5BdJwT+/wwaNw0gjbw9zaWpC1EaGOg3ciSDFFbQwRLsIk6QY4AgZ6a+5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZTDc7i/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZTDc7i/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722476534; x=1754012534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EOjx5q32MFGSol9RIa91sXvQyaDKPK/N48TqabnFlbw=;
  b=cZTDc7i/5Z6huIhB6SK52ROdoELtmsmrj/GtRiPHEm9gNlfdE+TXr+UX
   sQi741yvL8dsZYOgms4vrLJd9OtXqu+FU27shqXRPU6bvQL5X/4VluBHB
   duyYnrU5F1j8xgR0gsw05y9tPRYPv9uCP9fGUq3LLIKSQSGWYb63I20D1
   0qE7+Jt1KBpNR6/oMvsy4TjcW2yWTzUbAjhFMyHpJsDUwQ4P7dT3xT9Ld
   TEu+6eJM2+PUn65ERu82YtEmoA6qzTjSQ2ZJW7A75NGNCEEKB/Xe97jxl
   w0XHYj7BB+zpZ6Hj+KVWxkULuJc/kNwsoQ6UEDtOHROpJJCDELp+PQguk
   Q==;
X-CSE-ConnectionGUID: 9IWdHiBURbWGBYu8NR1lSA==
X-CSE-MsgGUID: 7iB2Y6eHSUySgsyc+yczFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20520272"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="20520272"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 18:42:13 -0700
X-CSE-ConnectionGUID: z86wM4r7RgePuF0R1Lvb9g==
X-CSE-MsgGUID: 7IcbJ5tWTiOxD4xO9HhhGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="78147181"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jul 2024 18:42:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZKpV-000v5Q-0j;
	Thu, 01 Aug 2024 01:42:09 +0000
Date: Thu, 1 Aug 2024 09:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 7838/23397] mm/slab_common.o: warning:
 objtool: kmem_cache_create_usercopy()+0x227: unreachable instruction
Message-ID: <202408010934.bNS6iMjG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5addb4b853f44eada72e0ed14b75d3d37e94bd8c
commit: d4bdc26bcd632cee393b5171345d5fa6293fe42b [7838/23397] include/asm-generic/bug.h: fix "cut here" for WARN_ON for __WARN_TAINT architectures
config: x86_64-randconfig-161-20240801 (https://download.01.org/0day-ci/archive/20240801/202408010934.bNS6iMjG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010934.bNS6iMjG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408010934.bNS6iMjG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slab_common.o: warning: objtool: kmem_cache_create_usercopy()+0x227: unreachable instruction


objdump-func vmlinux.o kmem_cache_create_usercopy:
0000 00000000004525fd <kmem_cache_create_usercopy>:
0000   4525fd:	55                   	push   %rbp
0001   4525fe:	48 89 e5             	mov    %rsp,%rbp
0004   452601:	41 57                	push   %r15
0006   452603:	41 56                	push   %r14
0008   452605:	41 55                	push   %r13
000a   452607:	41 54                	push   %r12
000c   452609:	53                   	push   %rbx
000d   45260a:	48 83 ec 20          	sub    $0x20,%rsp
0011   45260e:	41 89 f7             	mov    %esi,%r15d
0014   452611:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
0018   452615:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	452618: R_X86_64_32S	slab_mutex
001f   45261c:	31 f6                	xor    %esi,%esi
0021   45261e:	44 89 cb             	mov    %r9d,%ebx
0024   452621:	45 89 c4             	mov    %r8d,%r12d
0027   452624:	41 89 cd             	mov    %ecx,%r13d
002a   452627:	41 89 d6             	mov    %edx,%r14d
002d   45262a:	e8 00 00 00 00       	call   45262f <kmem_cache_create_usercopy+0x32>	45262b: R_X86_64_PLT32	mutex_lock_nested-0x4
0032   45262f:	41 f7 c5 ff 12 40 ff 	test   $0xff4012ff,%r13d
0039   452636:	0f 85 7c 01 00 00    	jne    4527b8 <kmem_cache_create_usercopy+0x1bb>
003f   45263c:	4c 8b 45 10          	mov    0x10(%rbp),%r8
0043   452640:	44 89 e9             	mov    %r13d,%ecx
0046   452643:	81 e1 00 ed af 00    	and    $0xafed00,%ecx
004c   452649:	45 85 e4             	test   %r12d,%r12d
004f   45264c:	74 08                	je     452656 <kmem_cache_create_usercopy+0x59>
0051   45264e:	85 db                	test   %ebx,%ebx
0053   452650:	0f 84 a8 01 00 00    	je     4527fe <kmem_cache_create_usercopy+0x201>
0059   452656:	44 89 f8             	mov    %r15d,%eax
005c   452659:	29 d8                	sub    %ebx,%eax
005e   45265b:	0f 82 b3 01 00 00    	jb     452814 <kmem_cache_create_usercopy+0x217>
0064   452661:	44 39 e0             	cmp    %r12d,%eax
0067   452664:	0f 82 aa 01 00 00    	jb     452814 <kmem_cache_create_usercopy+0x217>
006d   45266a:	4c 89 65 c0          	mov    %r12,-0x40(%rbp)
0071   45266e:	4c 8b 65 c8          	mov    -0x38(%rbp),%r12
0075   452672:	85 db                	test   %ebx,%ebx
0077   452674:	0f 84 ba 01 00 00    	je     452834 <kmem_cache_create_usercopy+0x237>
007d   45267a:	4c 89 e7             	mov    %r12,%rdi
0080   45267d:	be c0 00 60 00       	mov    $0x6000c0,%esi
0085   452682:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
0088   452685:	e8 00 00 00 00       	call   45268a <kmem_cache_create_usercopy+0x8d>	452686: R_X86_64_PLT32	kstrdup_const-0x4
008d   45268a:	48 85 c0             	test   %rax,%rax
0090   45268d:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
0094   452691:	0f 84 2d 01 00 00    	je     4527c4 <kmem_cache_create_usercopy+0x1c7>
009a   452697:	41 0f ba e5 0d       	bt     $0xd,%r13d
009f   45269c:	72 06                	jb     4526a4 <kmem_cache_create_usercopy+0xa7>
00a1   45269e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
00a5   4526a2:	eb 1a                	jmp    4526be <kmem_cache_create_usercopy+0xc1>
00a7   4526a4:	8b 0d 00 00 00 00    	mov    0x0(%rip),%ecx        # 4526aa <kmem_cache_create_usercopy+0xad>	4526a6: R_X86_64_PC32	boot_cpu_data+0xb4
00ad   4526aa:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
00b1   4526ae:	89 c8                	mov    %ecx,%eax
00b3   4526b0:	d1 e9                	shr    %ecx
00b5   4526b2:	44 39 f9             	cmp    %r15d,%ecx
00b8   4526b5:	73 f7                	jae    4526ae <kmem_cache_create_usercopy+0xb1>
00ba   4526b7:	44 39 f0             	cmp    %r14d,%eax
00bd   4526ba:	44 0f 47 f0          	cmova  %eax,%r14d
00c1   4526be:	41 83 fe 09          	cmp    $0x9,%r14d
00c5   4526c2:	41 bd 08 00 00 00    	mov    $0x8,%r13d
00cb   4526c8:	8d 04 1a             	lea    (%rdx,%rbx,1),%eax
00ce   4526cb:	45 0f 43 ee          	cmovae %r14d,%r13d
00d2   4526cf:	44 39 f8             	cmp    %r15d,%eax
00d5   4526d2:	0f 87 a3 01 00 00    	ja     45287b <kmem_cache_create_usercopy+0x27e>
00db   4526d8:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 4526df <kmem_cache_create_usercopy+0xe2>	4526db: R_X86_64_PC32	kmem_cache-0x4
00e2   4526df:	be c0 80 60 00       	mov    $0x6080c0,%esi
00e7   4526e4:	49 89 d6             	mov    %rdx,%r14
00ea   4526e7:	e8 00 00 00 00       	call   4526ec <kmem_cache_create_usercopy+0xef>	4526e8: R_X86_64_PLT32	kmem_cache_alloc-0x4
00ef   4526ec:	48 85 c0             	test   %rax,%rax
00f2   4526ef:	74 61                	je     452752 <kmem_cache_create_usercopy+0x155>
00f4   4526f1:	49 89 c4             	mov    %rax,%r12
00f7   4526f4:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
00fb   4526f8:	48 8b 45 10          	mov    0x10(%rbp),%rax
00ff   4526fc:	8b 75 d4             	mov    -0x2c(%rbp),%esi
0102   4526ff:	41 83 c5 07          	add    $0x7,%r13d
0106   452703:	4c 89 e7             	mov    %r12,%rdi
0109   452706:	41 83 e5 f8          	and    $0xfffffff8,%r13d
010d   45270a:	49 89 4c 24 50       	mov    %rcx,0x50(%r12)
0112   45270f:	45 89 7c 24 1c       	mov    %r15d,0x1c(%r12)
0117   452714:	45 89 7c 24 18       	mov    %r15d,0x18(%r12)
011c   452719:	45 89 6c 24 44       	mov    %r13d,0x44(%r12)
0121   45271e:	49 89 44 24 38       	mov    %rax,0x38(%r12)
0126   452723:	45 89 b4 24 50 01 00 00 	mov    %r14d,0x150(%r12)
012e   45272b:	41 89 9c 24 54 01 00 00 	mov    %ebx,0x154(%r12)
0136   452733:	e8 00 00 00 00       	call   452738 <kmem_cache_create_usercopy+0x13b>	452734: R_X86_64_PLT32	__kmem_cache_create-0x4
013b   452738:	85 c0                	test   %eax,%eax
013d   45273a:	74 1f                	je     45275b <kmem_cache_create_usercopy+0x15e>
013f   45273c:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 452743 <kmem_cache_create_usercopy+0x146>	45273f: R_X86_64_PC32	kmem_cache-0x4
0146   452743:	4c 89 e6             	mov    %r12,%rsi
0149   452746:	89 c3                	mov    %eax,%ebx
014b   452748:	e8 00 00 00 00       	call   45274d <kmem_cache_create_usercopy+0x150>	452749: R_X86_64_PLT32	kmem_cache_free-0x4
0150   45274d:	4c 63 e3             	movslq %ebx,%r12
0153   452750:	eb 39                	jmp    45278b <kmem_cache_create_usercopy+0x18e>
0155   452752:	49 c7 c4 f4 ff ff ff 	mov    $0xfffffffffffffff4,%r12
015c   452759:	eb 30                	jmp    45278b <kmem_cache_create_usercopy+0x18e>
015e   45275b:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 452762 <kmem_cache_create_usercopy+0x165>	45275e: R_X86_64_PC32	slab_caches-0x4
0165   452762:	4c 89 e0             	mov    %r12,%rax
0168   452765:	41 c7 44 24 34 01 00 00 00 	movl   $0x1,0x34(%r12)
0171   45276e:	48 83 c0 58          	add    $0x58,%rax
0175   452772:	48 89 41 08          	mov    %rax,0x8(%rcx)
0179   452776:	49 89 4c 24 58       	mov    %rcx,0x58(%r12)
017e   45277b:	49 c7 44 24 60 00 00 00 00 	movq   $0x0,0x60(%r12)	452780: R_X86_64_32S	slab_caches
0187   452784:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 45278b <kmem_cache_create_usercopy+0x18e>	452787: R_X86_64_PC32	slab_caches-0x4
018e   45278b:	49 81 fc 00 f0 ff ff 	cmp    $0xfffffffffffff000,%r12
0195   452792:	0f 86 b7 00 00 00    	jbe    45284f <kmem_cache_create_usercopy+0x252>
019b   452798:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
019f   45279c:	e8 00 00 00 00       	call   4527a1 <kmem_cache_create_usercopy+0x1a4>	45279d: R_X86_64_PLT32	kfree_const-0x4
01a4   4527a1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4527a4: R_X86_64_32S	slab_mutex
01ab   4527a8:	e8 00 00 00 00       	call   4527ad <kmem_cache_create_usercopy+0x1b0>	4527a9: R_X86_64_PLT32	mutex_unlock-0x4
01b0   4527ad:	45 85 e4             	test   %r12d,%r12d
01b3   4527b0:	0f 84 a5 00 00 00    	je     45285b <kmem_cache_create_usercopy+0x25e>
01b9   4527b6:	eb 1e                	jmp    4527d6 <kmem_cache_create_usercopy+0x1d9>
01bb   4527b8:	41 bc ea ff ff ff    	mov    $0xffffffea,%r12d
01c1   4527be:	44 89 6d d4          	mov    %r13d,-0x2c(%rbp)
01c5   4527c2:	eb 06                	jmp    4527ca <kmem_cache_create_usercopy+0x1cd>
01c7   4527c4:	41 bc f4 ff ff ff    	mov    $0xfffffff4,%r12d
01cd   4527ca:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4527cd: R_X86_64_32S	slab_mutex
01d4   4527d1:	e8 00 00 00 00       	call   4527d6 <kmem_cache_create_usercopy+0x1d9>	4527d2: R_X86_64_PLT32	mutex_unlock-0x4
01d9   4527d6:	0f ba 65 d4 12       	btl    $0x12,-0x2c(%rbp)
01de   4527db:	0f 82 b1 00 00 00    	jb     452892 <kmem_cache_create_usercopy+0x295>
01e4   4527e1:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
01e8   4527e5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4527e8: R_X86_64_32S	.rodata.str1.1+0x769ae
01ef   4527ec:	44 89 e2             	mov    %r12d,%edx
01f2   4527ef:	e8 00 00 00 00       	call   4527f4 <kmem_cache_create_usercopy+0x1f7>	4527f0: R_X86_64_PLT32	printk-0x4
01f7   4527f4:	e8 00 00 00 00       	call   4527f9 <kmem_cache_create_usercopy+0x1fc>	4527f5: R_X86_64_PLT32	dump_stack-0x4
01fc   4527f9:	45 31 e4             	xor    %r12d,%r12d
01ff   4527fc:	eb 5d                	jmp    45285b <kmem_cache_create_usercopy+0x25e>
0201   4527fe:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	452801: R_X86_64_32S	.rodata.str1.1+0x5f98e
0208   452805:	89 cb                	mov    %ecx,%ebx
020a   452807:	e8 00 00 00 00       	call   45280c <kmem_cache_create_usercopy+0x20f>	452808: R_X86_64_PLT32	printk-0x4
020f   45280c:	4c 8b 45 10          	mov    0x10(%rbp),%r8
0213   452810:	0f 0b                	ud2
0215   452812:	eb 14                	jmp    452828 <kmem_cache_create_usercopy+0x22b>
0217   452814:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	452817: R_X86_64_32S	.rodata.str1.1+0x5f98e
021e   45281b:	89 cb                	mov    %ecx,%ebx
0220   45281d:	e8 00 00 00 00       	call   452822 <kmem_cache_create_usercopy+0x225>	45281e: R_X86_64_PLT32	printk-0x4
0225   452822:	0f 0b                	ud2
0227   452824:	4c 8b 45 10          	mov    0x10(%rbp),%r8
022b   452828:	89 d9                	mov    %ebx,%ecx
022d   45282a:	4c 8b 65 c8          	mov    -0x38(%rbp),%r12
0231   45282e:	31 c0                	xor    %eax,%eax
0233   452830:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
0237   452834:	4c 89 e7             	mov    %r12,%rdi
023a   452837:	44 89 fe             	mov    %r15d,%esi
023d   45283a:	44 89 f2             	mov    %r14d,%edx
0240   45283d:	89 cb                	mov    %ecx,%ebx
0242   45283f:	e8 00 00 00 00       	call   452844 <kmem_cache_create_usercopy+0x247>	452840: R_X86_64_PLT32	__kmem_cache_alias-0x4
0247   452844:	4c 89 e1             	mov    %r12,%rcx
024a   452847:	49 89 c4             	mov    %rax,%r12
024d   45284a:	48 85 c0             	test   %rax,%rax
0250   45284d:	74 1e                	je     45286d <kmem_cache_create_usercopy+0x270>
0252   45284f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	452852: R_X86_64_32S	slab_mutex
0259   452856:	e8 00 00 00 00       	call   45285b <kmem_cache_create_usercopy+0x25e>	452857: R_X86_64_PLT32	mutex_unlock-0x4
025e   45285b:	4c 89 e0             	mov    %r12,%rax
0261   45285e:	48 83 c4 20          	add    $0x20,%rsp
0265   452862:	5b                   	pop    %rbx
0266   452863:	41 5c                	pop    %r12
0268   452865:	41 5d                	pop    %r13
026a   452867:	41 5e                	pop    %r14
026c   452869:	41 5f                	pop    %r15
026e   45286b:	5d                   	pop    %rbp
026f   45286c:	c3                   	ret
0270   45286d:	89 d8                	mov    %ebx,%eax
0272   45286f:	49 89 cc             	mov    %rcx,%r12
0275   452872:	31 db                	xor    %ebx,%ebx
0277   452874:	89 c1                	mov    %eax,%ecx
0279   452876:	e9 ff fd ff ff       	jmp    45267a <kmem_cache_create_usercopy+0x7d>
027e   45287b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	45287e: R_X86_64_32S	.rodata.str1.1+0x5f98e
0285   452882:	e8 00 00 00 00       	call   452887 <kmem_cache_create_usercopy+0x28a>	452883: R_X86_64_PLT32	printk-0x4
028a   452887:	0f 0b                	ud2
028c   452889:	31 d2                	xor    %edx,%edx
028e   45288b:	31 db                	xor    %ebx,%ebx
0290   45288d:	e9 46 fe ff ff       	jmp    4526d8 <kmem_cache_create_usercopy+0xdb>
0295   452892:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
0299   452896:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	452899: R_X86_64_32S	.rodata.str1.1+0x4a387
02a0   45289d:	44 89 e2             	mov    %r12d,%edx
02a3   4528a0:	e8 00 00 00 00       	call   4528a5 <kmem_cache_create_usercopy+0x2a8>	4528a1: R_X86_64_PLT32	panic-0x4
02a8   4528a5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4528a8: R_X86_64_32S	.data+0x2f61b8
02af   4528ac:	e8 00 00 00 00       	call   4528b1 <kmem_cache_create>	4528ad: R_X86_64_PLT32	__ubsan_handle_builtin_unreachable-0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
