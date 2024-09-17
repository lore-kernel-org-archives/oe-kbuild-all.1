Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B64E487A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 05:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726552073; cv=none; b=pJLKiUEiGK39yD/sKWBvzhdRkUK9LLtPYOMq4iz1yNAC3vd56wEHKDEl2UE/FHQIIwisi9fSb0UnxuaAUOE39EYdQ331S6b1lIOU3bs+1LtBQVzyCT2hunGhDv6p4yW++s0NDPC68PR7pM+477sY1NZDKFaJar/PghyKr5c5/tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726552073; c=relaxed/simple;
	bh=V5FDscsqYNK7MdMuBBHaPj2W+EVFAni7gDPfaH0SSvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e3gMkT0VC5xFal6NV3vE8TOS339uNclGV6y26WN4YWw6S+7gsWVcExl0D/MzQabzi13a4eW/dO+/18Xcl4HwRvTF2zVJBN1N1PX3Ej6w/e2LmnX4GI0rwpSDaSwwg3rhSuTb9nC7JYVdisIjgd2Yc4embggFMzO0+IJV1eZZ53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bbpiu7E6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bbpiu7E6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726552071; x=1758088071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V5FDscsqYNK7MdMuBBHaPj2W+EVFAni7gDPfaH0SSvQ=;
  b=Bbpiu7E6eJKpwJMiEIT1tHUjh8Hrf0xT+L2llmf1iZ41p3YZzCAmNAxm
   9J/qvHXuisLJnWxHHlwYyUSZVjrsPYohGs714oQm3Ejy6HyXgcszBpCbc
   khuIMjL7i5efKixF4honVWUdE4ymlRmprQcFTS5KX1H4tzwqyLHIX2MFq
   cZCvU5r1Kny8B6bXL927tQYpwUPixqXzeZGNafEpERPvY0V8lb+n2wG2S
   ARVLN8qxeRJmqDhFI4GeyEIzwjFGloZE1Sh/iabPKlRCxIM5cJOHPRdYO
   lZ0MUAoOOECI0H8fhlWqwhbO0QKglo52gXax9m/CYJQctfPOkbTsxbVlk
   Q==;
X-CSE-ConnectionGUID: wC+kfUK7SZO09fqfaR8M+g==
X-CSE-MsgGUID: Z6VaEIU3Qgi9p0nq8FzUkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29139406"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="29139406"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 22:47:50 -0700
X-CSE-ConnectionGUID: ZTIP4VRESwCflDPxs2O2FQ==
X-CSE-MsgGUID: oWqQevbJTuCkEEclon3abA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="99928920"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Sep 2024 22:47:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqR3y-000Apa-1j;
	Tue, 17 Sep 2024 05:47:46 +0000
Date: Tue, 17 Sep 2024 13:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 4955/30000] fs/iomap.o: warning:
 objtool: iomap_apply()+0x1f1: unreachable instruction
Message-ID: <202409171326.iFeC6r8r-lkp@intel.com>
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
commit: f46851e62743cb7e5c538fe474dd1f383f77ea76 [4955/30000] BACKPORT: kasan: remove use after scope bugs detection.
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240917/202409171326.iFeC6r8r-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171326.iFeC6r8r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171326.iFeC6r8r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/iomap.o: warning: objtool: iomap_apply()+0x1f1: unreachable instruction
--
   drivers/block/floppy.c:1962:11: warning: cast from 'void (*)(void)' to 'done_f' (aka 'void (*)(int)') converts to incompatible function type [-Wcast-function-type-strict]
    1962 |         .done           = (done_f)empty
         |                           ^~~~~~~~~~~~~
   drivers/block/floppy.c:1969:11: warning: cast from 'void (*)(void)' to 'done_f' (aka 'void (*)(int)') converts to incompatible function type [-Wcast-function-type-strict]
    1969 |         .done           = (done_f)empty
         |                           ^~~~~~~~~~~~~
   2 warnings generated.
>> drivers/block/floppy.o: warning: objtool: fd_ioctl()+0xd40: unreachable instruction


objdump-func vmlinux.o iomap_apply:
0000 0000000000534a10 <iomap_apply>:
0000   534a10:	e8 00 00 00 00       	call   534a15 <iomap_apply+0x5>	534a11: R_X86_64_PLT32	__fentry__-0x4
0005   534a15:	55                   	push   %rbp
0006   534a16:	48 89 e5             	mov    %rsp,%rbp
0009   534a19:	41 57                	push   %r15
000b   534a1b:	41 56                	push   %r14
000d   534a1d:	41 55                	push   %r13
000f   534a1f:	41 54                	push   %r12
0011   534a21:	53                   	push   %rbx
0012   534a22:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
0016   534a26:	48 8d a4 24 20 ff ff ff 	lea    -0xe0(%rsp),%rsp
001e   534a2e:	4c 8d 74 24 20       	lea    0x20(%rsp),%r14
0023   534a33:	4c 8d 7c 24 40       	lea    0x40(%rsp),%r15
0028   534a38:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
0032   534a42:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
0037   534a47:	4d 89 c5             	mov    %r8,%r13
003a   534a4a:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
003e   534a4e:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
0043   534a53:	48 89 f3             	mov    %rsi,%rbx
0046   534a56:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
004b   534a5b:	49 c1 ee 03          	shr    $0x3,%r14
004f   534a5f:	49 c7 47 e0 b3 8a b5 41 	movq   $0x41b58ab3,-0x20(%r15)
0057   534a67:	49 c7 47 e8 00 00 00 00 	movq   $0x0,-0x18(%r15)	534a6b: R_X86_64_32S	.rodata.str1.1+0x5c3c7
005f   534a6f:	49 c7 47 f0 00 00 00 00 	movq   $0x0,-0x10(%r15)	534a73: R_X86_64_32S	iomap_apply
0067   534a77:	43 c7 04 26 f1 f1 f1 f1 	movl   $0xf1f1f1f1,(%r14,%r12,1)
006f   534a7f:	43 c7 44 26 0d f3 f3 f3 f3 	movl   $0xf3f3f3f3,0xd(%r14,%r12,1)
0078   534a88:	66 43 c7 44 26 11 f3 f3 	movw   $0xf3f3,0x11(%r14,%r12,1)
0080   534a90:	43 c6 44 26 13 f3    	movb   $0xf3,0x13(%r14,%r12,1)
0086   534a96:	e8 00 00 00 00       	call   534a9b <iomap_apply+0x8b>	534a97: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
008b   534a9b:	ba 48 00 00 00       	mov    $0x48,%edx
0090   534aa0:	4c 89 ff             	mov    %r15,%rdi
0093   534aa3:	31 f6                	xor    %esi,%esi
0095   534aa5:	e8 00 00 00 00       	call   534aaa <iomap_apply+0x9a>	534aa6: R_X86_64_PLT32	memset-0x4
009a   534aaa:	4c 89 e8             	mov    %r13,%rax
009d   534aad:	48 c1 e8 03          	shr    $0x3,%rax
00a1   534ab1:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
00a6   534ab6:	74 08                	je     534ac0 <iomap_apply+0xb0>
00a8   534ab8:	4c 89 ef             	mov    %r13,%rdi
00ab   534abb:	e8 00 00 00 00       	call   534ac0 <iomap_apply+0xb0>	534abc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00b0   534ac0:	49 89 df             	mov    %rbx,%r15
00b3   534ac3:	48 89 de             	mov    %rbx,%rsi
00b6   534ac6:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
00bb   534acb:	4d 8b 5d 00          	mov    0x0(%r13),%r11
00bf   534acf:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
00c4   534ad4:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
00c8   534ad8:	4c 8d 44 24 40       	lea    0x40(%rsp),%r8
00cd   534add:	48 89 da             	mov    %rbx,%rdx
00d0   534ae0:	e8 00 00 00 00       	call   534ae5 <iomap_apply+0xd5>	534ae1: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
00d5   534ae5:	85 c0                	test   %eax,%eax
00d7   534ae7:	74 10                	je     534af9 <iomap_apply+0xe9>
00d9   534ae9:	41 89 c4             	mov    %eax,%r12d
00dc   534aec:	e8 00 00 00 00       	call   534af1 <iomap_apply+0xe1>	534aed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00e1   534af1:	49 63 c4             	movslq %r12d,%rax
00e4   534af4:	e9 ba 00 00 00       	jmp    534bb3 <iomap_apply+0x1a3>
00e9   534af9:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
00ee   534afe:	4c 39 f8             	cmp    %r15,%rax
00f1   534b01:	0f 8f e7 00 00 00    	jg     534bee <iomap_apply+0x1de>
00f7   534b07:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
00fc   534b0c:	48 85 c9             	test   %rcx,%rcx
00ff   534b0f:	0f 84 f5 00 00 00    	je     534c0a <iomap_apply+0x1fa>
0105   534b15:	48 01 c1             	add    %rax,%rcx
0108   534b18:	4a 8d 04 3b          	lea    (%rbx,%r15,1),%rax
010c   534b1c:	4c 8b 5d 10          	mov    0x10(%rbp),%r11
0110   534b20:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0115   534b25:	4c 89 fe             	mov    %r15,%rsi
0118   534b28:	4c 8d 44 24 40       	lea    0x40(%rsp),%r8
011d   534b2d:	49 89 cc             	mov    %rcx,%r12
0120   534b30:	4d 29 fc             	sub    %r15,%r12
0123   534b33:	48 39 c1             	cmp    %rax,%rcx
0126   534b36:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
012b   534b3b:	4c 0f 43 e3          	cmovae %rbx,%r12
012f   534b3f:	4c 89 e2             	mov    %r12,%rdx
0132   534b42:	e8 00 00 00 00       	call   534b47 <iomap_apply+0x137>	534b43: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
0137   534b47:	49 83 c5 08          	add    $0x8,%r13
013b   534b4b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0145   534b55:	48 89 c3             	mov    %rax,%rbx
0148   534b58:	4c 89 e9             	mov    %r13,%rcx
014b   534b5b:	48 c1 e9 03          	shr    $0x3,%rcx
014f   534b5f:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1)
0153   534b63:	74 08                	je     534b6d <iomap_apply+0x15d>
0155   534b65:	4c 89 ef             	mov    %r13,%rdi
0158   534b68:	e8 00 00 00 00       	call   534b6d <iomap_apply+0x15d>	534b69: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
015d   534b6d:	4d 8b 6d 00          	mov    0x0(%r13),%r13
0161   534b71:	4d 85 ed             	test   %r13,%r13
0164   534b74:	74 2f                	je     534ba5 <iomap_apply+0x195>
0166   534b76:	e8 00 00 00 00       	call   534b7b <iomap_apply+0x16b>	534b77: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
016b   534b7b:	31 c9                	xor    %ecx,%ecx
016d   534b7d:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0172   534b82:	4c 89 fe             	mov    %r15,%rsi
0175   534b85:	4c 89 e2             	mov    %r12,%rdx
0178   534b88:	44 8b 44 24 04       	mov    0x4(%rsp),%r8d
017d   534b8d:	4c 8d 4c 24 40       	lea    0x40(%rsp),%r9
0182   534b92:	4d 89 eb             	mov    %r13,%r11
0185   534b95:	48 85 db             	test   %rbx,%rbx
0188   534b98:	48 0f 4f cb          	cmovg  %rbx,%rcx
018c   534b9c:	e8 00 00 00 00       	call   534ba1 <iomap_apply+0x191>	534b9d: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
0191   534ba1:	48 98                	cltq
0193   534ba3:	eb 07                	jmp    534bac <iomap_apply+0x19c>
0195   534ba5:	e8 00 00 00 00       	call   534baa <iomap_apply+0x19a>	534ba6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
019a   534baa:	31 c0                	xor    %eax,%eax
019c   534bac:	48 85 db             	test   %rbx,%rbx
019f   534baf:	48 0f 45 c3          	cmovne %rbx,%rax
01a3   534bb3:	31 c9                	xor    %ecx,%ecx
01a5   534bb5:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
01af   534bbf:	48 c7 44 24 20 0e 36 e0 45 	movq   $0x45e0360e,0x20(%rsp)
01b8   534bc8:	41 89 0c 16          	mov    %ecx,(%r14,%rdx,1)
01bc   534bcc:	41 89 4c 16 0d       	mov    %ecx,0xd(%r14,%rdx,1)
01c1   534bd1:	66 41 c7 44 16 11 00 00 	movw   $0x0,0x11(%r14,%rdx,1)
01c9   534bd9:	41 c6 44 16 13 00    	movb   $0x0,0x13(%r14,%rdx,1)
01cf   534bdf:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
01d3   534be3:	5b                   	pop    %rbx
01d4   534be4:	41 5c                	pop    %r12
01d6   534be6:	41 5d                	pop    %r13
01d8   534be8:	41 5e                	pop    %r14
01da   534bea:	41 5f                	pop    %r15
01dc   534bec:	5d                   	pop    %rbp
01dd   534bed:	c3                   	ret
01de   534bee:	e8 00 00 00 00       	call   534bf3 <iomap_apply+0x1e3>	534bef: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01e3   534bf3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	534bf6: R_X86_64_32S	.rodata+0x3c6000
01ea   534bfa:	e8 00 00 00 00       	call   534bff <iomap_apply+0x1ef>	534bfb: R_X86_64_PLT32	printk-0x4
01ef   534bff:	0f 0b                	ud2
01f1   534c01:	48 c7 c0 fb ff ff ff 	mov    $0xfffffffffffffffb,%rax
01f8   534c08:	eb a9                	jmp    534bb3 <iomap_apply+0x1a3>
01fa   534c0a:	e8 00 00 00 00       	call   534c0f <iomap_apply+0x1ff>	534c0b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01ff   534c0f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	534c12: R_X86_64_32S	.rodata+0x3c6000
0206   534c16:	e8 00 00 00 00       	call   534c1b <iomap_apply+0x20b>	534c17: R_X86_64_PLT32	printk-0x4
020b   534c1b:	0f 0b                	ud2
020d   534c1d:	48 c7 c0 fb ff ff ff 	mov    $0xfffffffffffffffb,%rax
0214   534c24:	eb 8d                	jmp    534bb3 <iomap_apply+0x1a3>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
