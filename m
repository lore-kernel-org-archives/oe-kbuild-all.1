Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E1D37B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 04:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726548289; cv=none; b=WNqB9TIG+NdH8CSutdjr7ScXj+gd8W287KSc5gFch8CSqzYLq+UjpHWbY+Ls+3pqGR2sbdQ8EeR6h71s0G4TzYL/RJ+Gpo2XiX+wpGNGJZgSSjJtEhngtCsxemo4j8joxNr3K4+nWbJPW7SXmfSyFuPV6Aul6x5MeMqj7YsJsrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726548289; c=relaxed/simple;
	bh=TrAa9N2n9c1KIjiutHvNnlg9rsyUuPTgW3Deh92IhMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kQ40gp11Xj7uwJMJJ37tHyzvUebjFruysETpw2r2cQlUKm12JfU5w00ed15rI5a8rgdbkHMn/nM5yZSjwyIGJICveoB3YPw988ErR1OnWHG7cRVdY7Q+KQzNq2xNdqlWhbSLezpJoiPCkF4IPQpVh6UPht726pDBt9bIijh3298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8WGPk02; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8WGPk02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726548287; x=1758084287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TrAa9N2n9c1KIjiutHvNnlg9rsyUuPTgW3Deh92IhMM=;
  b=b8WGPk02msMnsmrtFNkOBBLbQC7tHzk9wD61mV9w80sDQuKSd8bM0cZz
   XrSRB2tiM6tvhnYT0lJy9FCrWOhUz2DU/6AP1DnTA2FU76khTJ3cuxJqg
   uZFhPpuEx5fMOgDOKR5F7C5GL8qyXYiDBYoHtQGrcz1w5lcf6bbiNorPj
   ilpleROjMXQvaWhwSveVDwJF0Lrr9GP0PkG6tHtnL4b0F0f9UBXtdbFFv
   abIar08ukBRgpi8i6mTa8CCd6wdSNKcAIVzfpAukjVivXhMobCSgcSVWh
   z0Mbx+QcIomszbjZCPtRVBtiC8R6w0w4TVO6WfvApCvGTHpJT4Yh03tRy
   Q==;
X-CSE-ConnectionGUID: sH8j1s1CTDa/mXUJhCuCKQ==
X-CSE-MsgGUID: DXjD0K9pRcedHLUUab00tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36065240"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="36065240"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 21:44:47 -0700
X-CSE-ConnectionGUID: a/iteXAvQzufzkZ9AnK7Og==
X-CSE-MsgGUID: 3Jc+yx0LT2ecAVq29/l/WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="69398081"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Sep 2024 21:44:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqQ4y-000Ana-0H;
	Tue, 17 Sep 2024 04:44:44 +0000
Date: Tue, 17 Sep 2024 12:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jaegeuk-f2fs-stable:linux-5.10.y 69/780] fs/f2fs/compress.o:
 warning: objtool: f2fs_verify_cluster()+0xb6: unreachable instruction
Message-ID: <202409171232.5Ef3o2Xx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-stable.git linux-5.10.y
head:   e36040b2caec4c8a0a9434ab743b1f66248e5d27
commit: ea29e6539848382f048647f48023d60420d4fc46 [69/780] f2fs: clean up post-read processing
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240917/202409171232.5Ef3o2Xx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171232.5Ef3o2Xx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171232.5Ef3o2Xx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/compress.o: warning: objtool: f2fs_verify_cluster()+0xb6: unreachable instruction


objdump-func vmlinux.o f2fs_verify_cluster:
0000 0000000000b2083b <f2fs_verify_cluster>:
0000   b2083b:	e8 00 00 00 00       	call   b20840 <f2fs_verify_cluster+0x5>	b2083c: R_X86_64_PLT32	__fentry__-0x4
0005   b20840:	55                   	push   %rbp
0006   b20841:	48 89 e5             	mov    %rsp,%rbp
0009   b20844:	41 57                	push   %r15
000b   b20846:	41 56                	push   %r14
000d   b20848:	41 55                	push   %r13
000f   b2084a:	41 54                	push   %r12
0011   b2084c:	53                   	push   %rbx
0012   b2084d:	48 8d 64 24 e0       	lea    -0x20(%rsp),%rsp
0017   b20852:	49 89 fe             	mov    %rdi,%r14
001a   b20855:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
0024   b2085f:	e8 00 00 00 00       	call   b20864 <f2fs_verify_cluster+0x29>	b20860: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0029   b20864:	4d 8d 6e 90          	lea    -0x70(%r14),%r13
002d   b20868:	4c 89 e8             	mov    %r13,%rax
0030   b2086b:	48 c1 e8 03          	shr    $0x3,%rax
0034   b2086f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
0038   b20873:	8a 04 18             	mov    (%rax,%rbx,1),%al
003b   b20876:	84 c0                	test   %al,%al
003d   b20878:	0f 85 31 01 00 00    	jne    b209af <f2fs_verify_cluster+0x174>
0043   b2087e:	41 83 7d 00 00       	cmpl   $0x0,0x0(%r13)
0048   b20883:	0f 84 00 01 00 00    	je     b20989 <f2fs_verify_cluster+0x14e>
004e   b20889:	4d 8d 7e 98          	lea    -0x68(%r14),%r15
0052   b2088d:	4c 89 75 d0          	mov    %r14,-0x30(%rbp)
0056   b20891:	41 be 01 00 00 00    	mov    $0x1,%r14d
005c   b20897:	4c 89 f8             	mov    %r15,%rax
005f   b2089a:	4c 89 7d c8          	mov    %r15,-0x38(%rbp)
0063   b2089e:	48 c1 e8 03          	shr    $0x3,%rax
0067   b208a2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
006b   b208a6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
006f   b208aa:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0073   b208ae:	74 08                	je     b208b8 <f2fs_verify_cluster+0x7d>
0075   b208b0:	4c 89 ff             	mov    %r15,%rdi
0078   b208b3:	e8 00 00 00 00       	call   b208b8 <f2fs_verify_cluster+0x7d>	b208b4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
007d   b208b8:	41 8d 46 ff          	lea    -0x1(%r14),%eax
0081   b208bc:	4c 63 e0             	movslq %eax,%r12
0084   b208bf:	49 c1 e4 03          	shl    $0x3,%r12
0088   b208c3:	4d 03 27             	add    (%r15),%r12
008b   b208c6:	4c 89 e0             	mov    %r12,%rax
008e   b208c9:	48 c1 e8 03          	shr    $0x3,%rax
0092   b208cd:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0096   b208d1:	74 08                	je     b208db <f2fs_verify_cluster+0xa0>
0098   b208d3:	4c 89 e7             	mov    %r12,%rdi
009b   b208d6:	e8 00 00 00 00       	call   b208db <f2fs_verify_cluster+0xa0>	b208d7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00a0   b208db:	4d 8b 24 24          	mov    (%r12),%r12
00a4   b208df:	4d 85 e4             	test   %r12,%r12
00a7   b208e2:	74 53                	je     b20937 <f2fs_verify_cluster+0xfc>
00a9   b208e4:	48 89 d9             	mov    %rbx,%rcx
00ac   b208e7:	4c 89 eb             	mov    %r13,%rbx
00af   b208ea:	4d 8d 6c 24 08       	lea    0x8(%r12),%r13
00b4   b208ef:	0f 0b                	ud2
00b6   b208f1:	4c 89 e8             	mov    %r13,%rax
00b9   b208f4:	49 89 cf             	mov    %rcx,%r15
00bc   b208f7:	48 c1 e8 03          	shr    $0x3,%rax
00c0   b208fb:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
00c4   b208ff:	74 08                	je     b20909 <f2fs_verify_cluster+0xce>
00c6   b20901:	4c 89 ef             	mov    %r13,%rdi
00c9   b20904:	e8 00 00 00 00       	call   b20909 <f2fs_verify_cluster+0xce>	b20905: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00ce   b20909:	4d 8b 6d 00          	mov    0x0(%r13),%r13
00d2   b2090d:	41 f6 c5 01          	test   $0x1,%r13b
00d6   b20911:	75 47                	jne    b2095a <f2fs_verify_cluster+0x11f>
00d8   b20913:	e8 00 00 00 00       	call   b20918 <f2fs_verify_cluster+0xdd>	b20914: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00dd   b20918:	4c 89 e7             	mov    %r12,%rdi
00e0   b2091b:	be 08 00 00 00       	mov    $0x8,%esi
00e5   b20920:	49 89 dd             	mov    %rbx,%r13
00e8   b20923:	e8 00 00 00 00       	call   b20928 <f2fs_verify_cluster+0xed>	b20924: R_X86_64_PLT32	__kasan_check_write-0x4
00ed   b20928:	41 80 4c 24 01 01    	orb    $0x1,0x1(%r12)
00f3   b2092e:	4c 89 fb             	mov    %r15,%rbx
00f6   b20931:	4c 8b 7d c8          	mov    -0x38(%rbp),%r15
00fa   b20935:	eb 05                	jmp    b2093c <f2fs_verify_cluster+0x101>
00fc   b20937:	e8 00 00 00 00       	call   b2093c <f2fs_verify_cluster+0x101>	b20938: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0101   b2093c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
0105   b20940:	8a 04 18             	mov    (%rax,%rbx,1),%al
0108   b20943:	84 c0                	test   %al,%al
010a   b20945:	75 20                	jne    b20967 <f2fs_verify_cluster+0x12c>
010c   b20947:	45 3b 75 00          	cmp    0x0(%r13),%r14d
0110   b2094b:	73 31                	jae    b2097e <f2fs_verify_cluster+0x143>
0112   b2094d:	e8 00 00 00 00       	call   b20952 <f2fs_verify_cluster+0x117>	b2094e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0117   b20952:	41 ff c6             	inc    %r14d
011a   b20955:	e9 4c ff ff ff       	jmp    b208a6 <f2fs_verify_cluster+0x6b>
011f   b2095a:	e8 00 00 00 00       	call   b2095f <f2fs_verify_cluster+0x124>	b2095b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0124   b2095f:	49 ff cd             	dec    %r13
0127   b20962:	4d 89 ec             	mov    %r13,%r12
012a   b20965:	eb b1                	jmp    b20918 <f2fs_verify_cluster+0xdd>
012c   b20967:	44 89 e9             	mov    %r13d,%ecx
012f   b2096a:	80 e1 07             	and    $0x7,%cl
0132   b2096d:	80 c1 03             	add    $0x3,%cl
0135   b20970:	38 c1                	cmp    %al,%cl
0137   b20972:	7c d3                	jl     b20947 <f2fs_verify_cluster+0x10c>
0139   b20974:	4c 89 ef             	mov    %r13,%rdi
013c   b20977:	e8 00 00 00 00       	call   b2097c <f2fs_verify_cluster+0x141>	b20978: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0141   b2097c:	eb c9                	jmp    b20947 <f2fs_verify_cluster+0x10c>
0143   b2097e:	e8 00 00 00 00       	call   b20983 <f2fs_verify_cluster+0x148>	b2097f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0148   b20983:	4c 8b 75 d0          	mov    -0x30(%rbp),%r14
014c   b20987:	eb 05                	jmp    b2098e <f2fs_verify_cluster+0x153>
014e   b20989:	e8 00 00 00 00       	call   b2098e <f2fs_verify_cluster+0x153>	b2098a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0153   b2098e:	49 81 c6 78 ff ff ff 	add    $0xffffffffffffff78,%r14
015a   b20995:	31 f6                	xor    %esi,%esi
015c   b20997:	4c 89 f7             	mov    %r14,%rdi
015f   b2099a:	e8 2e 00 00 00       	call   b209cd <__f2fs_decompress_end_io>
0164   b2099f:	48 8d 64 24 20       	lea    0x20(%rsp),%rsp
0169   b209a4:	5b                   	pop    %rbx
016a   b209a5:	41 5c                	pop    %r12
016c   b209a7:	41 5d                	pop    %r13
016e   b209a9:	41 5e                	pop    %r14
0170   b209ab:	41 5f                	pop    %r15
0172   b209ad:	5d                   	pop    %rbp
0173   b209ae:	c3                   	ret
0174   b209af:	44 89 e9             	mov    %r13d,%ecx
0177   b209b2:	80 e1 07             	and    $0x7,%cl
017a   b209b5:	80 c1 03             	add    $0x3,%cl
017d   b209b8:	38 c1                	cmp    %al,%cl
017f   b209ba:	0f 8c be fe ff ff    	jl     b2087e <f2fs_verify_cluster+0x43>
0185   b209c0:	4c 89 ef             	mov    %r13,%rdi
0188   b209c3:	e8 00 00 00 00       	call   b209c8 <f2fs_verify_cluster+0x18d>	b209c4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
018d   b209c8:	e9 b1 fe ff ff       	jmp    b2087e <f2fs_verify_cluster+0x43>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
