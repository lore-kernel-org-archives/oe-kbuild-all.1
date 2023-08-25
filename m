Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60C4198AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 23:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693005857; x=1724541857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lKgsKO3jdQgjQJx0erYwqxm5mLYlR8xXjHQ5Kl5d0vY=;
  b=XOWZrtImnGUBR3OKpbVJ9H3z1w7muwCoFMTFRxJ7JaE2dy+amXku+O2I
   xtjPrBj/6SaoNptSdCkIoHuVpb8Yp0i8rCH8nDE9zGLWaX3J+9gbESO+A
   p2uln5QSAIb6P2V9lI4fS7vmLCmTtSUASHcPU97nVspiUbHvmSBPsxGT8
   EcOevoWCAm1NMHxc2pu7oxweCc9Gq4sbo7KbMgXaF8oJpo6tfDpbkdPyu
   +S1NS9bHImxwpRXqEaxIIA1v3B1AS4Rp4nan+HM5ioqfqucDfMTATc8S6
   X1HFflE0WwkKMXcFYjjqFitUI5HReTCd/sO4iTIGH7B0Olhrz5RLGy/Xr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="377562352"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="377562352"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 16:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="767077231"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="767077231"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2023 16:24:12 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZg9z-00047D-2A;
	Fri, 25 Aug 2023 23:24:11 +0000
Date: Sat, 26 Aug 2023 07:23:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 7/11] fs/reiserfs/lbalance.o:
 warning: objtool: leaf_cut_from_buffer()+0x1f82: stack state mismatch:
 cfa1=7+240 cfa2=7+224
Message-ID: <202308260725.vHqx47y9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   a8b58500cb6b8b9c2c489d69451a7706c87adac3
commit: fca16257ca2966b34ef1689ef101170bf932e835 [7/11] UPSTREAM: ubsan: remove UBSAN_MISC in favor of individual options
config: x86_64-randconfig-r024-20230826 (https://download.01.org/0day-ci/archive/20230826/202308260725.vHqx47y9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260725.vHqx47y9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260725.vHqx47y9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/reiserfs/lbalance.o: warning: objtool: leaf_move_items()+0xf96: stack state mismatch: cfa1=7+152 cfa2=7+144
   fs/reiserfs/lbalance.o: warning: objtool: leaf_delete_items()+0x463: stack state mismatch: cfa1=7+88 cfa2=7+104
>> fs/reiserfs/lbalance.o: warning: objtool: leaf_cut_from_buffer()+0x1f82: stack state mismatch: cfa1=7+240 cfa2=7+224
   fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_boundary_item()+0x34c5: stack state mismatch: cfa1=7+224 cfa2=7+216


objdump-func vmlinux.o leaf_cut_from_buffer:
0000 0000000000776699 <leaf_cut_from_buffer>:
0000   776699:	e8 00 00 00 00       	call   77669e <leaf_cut_from_buffer+0x5>	77669a: R_X86_64_PLT32	__fentry__-0x4
0005   77669e:	55                   	push   %rbp
0006   77669f:	41 57                	push   %r15
0008   7766a1:	41 56                	push   %r14
000a   7766a3:	41 55                	push   %r13
000c   7766a5:	41 54                	push   %r12
000e   7766a7:	53                   	push   %rbx
000f   7766a8:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
0016   7766af:	41 89 cd             	mov    %ecx,%r13d
0019   7766b2:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
001e   7766b7:	89 f3                	mov    %esi,%ebx
0020   7766b9:	49 89 ff             	mov    %rdi,%r15
0023   7766bc:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
002d   7766c6:	4c 8d 77 08          	lea    0x8(%rdi),%r14
0031   7766ca:	4c 89 f0             	mov    %r14,%rax
0034   7766cd:	48 c1 e8 03          	shr    $0x3,%rax
0038   7766d1:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
003c   7766d5:	74 12                	je     7766e9 <leaf_cut_from_buffer+0x50>
003e   7766d7:	4c 89 f7             	mov    %r14,%rdi
0041   7766da:	e8 00 00 00 00       	call   7766df <leaf_cut_from_buffer+0x46>	7766db: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0046   7766df:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0050   7766e9:	48 89 5c 24 58       	mov    %rbx,0x58(%rsp)
0055   7766ee:	49 8b 06             	mov    (%r14),%rax
0058   7766f1:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
005d   7766f6:	48 8d 58 28          	lea    0x28(%rax),%rbx
0061   7766fa:	48 89 d8             	mov    %rbx,%rax
0064   7766fd:	48 c1 e8 03          	shr    $0x3,%rax
0068   776701:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
0070   776709:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
0074   77670d:	74 12                	je     776721 <leaf_cut_from_buffer+0x88>
0076   77670f:	48 89 df             	mov    %rbx,%rdi
0079   776712:	e8 00 00 00 00       	call   776717 <leaf_cut_from_buffer+0x7e>	776713: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
007e   776717:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0088   776721:	48 89 9c 24 98 00 00 00 	mov    %rbx,0x98(%rsp)
0090   776729:	4c 8b 23             	mov    (%rbx),%r12
0093   77672c:	49 8d 7c 24 02       	lea    0x2(%r12),%rdi
0098   776731:	48 89 f8             	mov    %rdi,%rax
009b   776734:	48 c1 e8 03          	shr    $0x3,%rax
009f   776738:	8a 04 30             	mov    (%rax,%rsi,1),%al
00a2   77673b:	84 c0                	test   %al,%al
00a4   77673d:	0f 85 02 10 00 00    	jne    777745 <leaf_cut_from_buffer+0x10ac>
00aa   776743:	45 0f b7 4c 24 02    	movzwl 0x2(%r12),%r9d
00b0   776749:	48 63 44 24 58       	movslq 0x58(%rsp),%rax
00b5   77674e:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
00bd   776756:	48 8d 1c 40          	lea    (%rax,%rax,2),%rbx
00c1   77675a:	49 8d 3c dc          	lea    (%r12,%rbx,8),%rdi
00c5   77675e:	48 83 c7 2e          	add    $0x2e,%rdi
00c9   776762:	4d 8d 34 dc          	lea    (%r12,%rbx,8),%r14
00cd   776766:	49 83 c6 2f          	add    $0x2f,%r14
00d1   77676a:	48 89 f8             	mov    %rdi,%rax
00d4   77676d:	48 c1 e8 03          	shr    $0x3,%rax
00d8   776771:	48 89 84 24 80 00 00 00 	mov    %rax,0x80(%rsp)
00e0   776779:	8a 04 30             	mov    (%rax,%rsi,1),%al
00e3   77677c:	84 c0                	test   %al,%al
00e5   77677e:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
00ea   776783:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
00ef   776788:	0f 85 da 0f 00 00    	jne    777768 <leaf_cut_from_buffer+0x10cf>
00f5   77678e:	4c 89 f0             	mov    %r14,%rax
00f8   776791:	48 c1 e8 03          	shr    $0x3,%rax
00fc   776795:	8a 04 30             	mov    (%rax,%rsi,1),%al
00ff   776798:	84 c0                	test   %al,%al
0101   77679a:	0f 85 f8 0f 00 00    	jne    777798 <leaf_cut_from_buffer+0x10ff>
0107   7767a0:	4c 89 bc 24 88 00 00 00 	mov    %r15,0x88(%rsp)
010f   7767a8:	4d 8d 04 dc          	lea    (%r12,%rbx,8),%r8
0113   7767ac:	49 83 c0 18          	add    $0x18,%r8
0117   7767b0:	66 83 3f 00          	cmpw   $0x0,(%rdi)
011b   7767b4:	4c 89 64 24 78       	mov    %r12,0x78(%rsp)
0120   7767b9:	4c 89 04 24          	mov    %r8,(%rsp)
0124   7767bd:	0f 84 86 00 00 00    	je     776849 <leaf_cut_from_buffer+0x1b0>
012a   7767c3:	4d 8d 70 08          	lea    0x8(%r8),%r14
012e   7767c7:	4d 8d 78 0f          	lea    0xf(%r8),%r15
0132   7767cb:	4c 89 f0             	mov    %r14,%rax
0135   7767ce:	48 c1 e8 03          	shr    $0x3,%rax
0139   7767d2:	8a 04 30             	mov    (%rax,%rsi,1),%al
013c   7767d5:	84 c0                	test   %al,%al
013e   7767d7:	0f 85 3e 11 00 00    	jne    77791b <leaf_cut_from_buffer+0x1282>
0144   7767dd:	4c 89 f8             	mov    %r15,%rax
0147   7767e0:	48 c1 e8 03          	shr    $0x3,%rax
014b   7767e4:	8a 04 30             	mov    (%rax,%rsi,1),%al
014e   7767e7:	84 c0                	test   %al,%al
0150   7767e9:	0f 85 5f 11 00 00    	jne    77794e <leaf_cut_from_buffer+0x12b5>
0156   7767ef:	48 b9 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rcx
0160   7767f9:	49 8b 06             	mov    (%r14),%rax
0163   7767fc:	48 89 c2             	mov    %rax,%rdx
0166   7767ff:	48 bf 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rdi
0170   776809:	48 21 fa             	and    %rdi,%rdx
0173   77680c:	48 39 ca             	cmp    %rcx,%rdx
0176   77680f:	0f 85 f5 02 00 00    	jne    776b0a <leaf_cut_from_buffer+0x471>
017c   776815:	0f 84 9a 00 00 00    	je     7768b5 <leaf_cut_from_buffer+0x21c>
0182   77681b:	e8 00 00 00 00       	call   776820 <leaf_cut_from_buffer+0x187>	77681c: R_X86_64_PLT32	__asan_handle_no_return-0x4
0187   776820:	31 ff                	xor    %edi,%edi
0189   776822:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	776825: R_X86_64_32S	.rodata+0x495f40
0190   776829:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	77682c: R_X86_64_32S	.rodata.str1.1+0x35c7a
0197   776830:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	776833: R_X86_64_32S	.rodata+0x497f20
019e   776837:	41 b8 3e 04 00 00    	mov    $0x43e,%r8d
01a4   77683d:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	776840: R_X86_64_32S	.rodata.str1.1+0x35c7a
01ab   776844:	e8 00 00 00 00       	call   776849 <leaf_cut_from_buffer+0x1b0>	776845: R_X86_64_PLT32	__reiserfs_panic-0x4
01b0   776849:	4d 8d 70 0c          	lea    0xc(%r8),%r14
01b4   77684d:	4d 8d 78 0f          	lea    0xf(%r8),%r15
01b8   776851:	4c 89 f0             	mov    %r14,%rax
01bb   776854:	48 c1 e8 03          	shr    $0x3,%rax
01bf   776858:	8a 04 30             	mov    (%rax,%rsi,1),%al
01c2   77685b:	84 c0                	test   %al,%al
01c4   77685d:	0f 85 32 13 00 00    	jne    777b95 <leaf_cut_from_buffer+0x14fc>
01ca   776863:	4c 89 f8             	mov    %r15,%rax
01cd   776866:	48 c1 e8 03          	shr    $0x3,%rax
01d1   77686a:	8a 04 30             	mov    (%rax,%rsi,1),%al
01d4   77686d:	84 c0                	test   %al,%al
01d6   77686f:	0f 85 53 13 00 00    	jne    777bc8 <leaf_cut_from_buffer+0x152f>
01dc   776875:	41 8b 06             	mov    (%r14),%eax
01df   776878:	3d f4 01 00 00       	cmp    $0x1f4,%eax
01e4   77687d:	74 36                	je     7768b5 <leaf_cut_from_buffer+0x21c>
01e6   77687f:	85 c0                	test   %eax,%eax
01e8   776881:	0f 85 96 02 00 00    	jne    776b1d <leaf_cut_from_buffer+0x484>
01ee   776887:	e8 00 00 00 00       	call   77688c <leaf_cut_from_buffer+0x1f3>	776888: R_X86_64_PLT32	__asan_handle_no_return-0x4
01f3   77688c:	31 ff                	xor    %edi,%edi
01f5   77688e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	776891: R_X86_64_32S	.rodata+0x495f40
01fc   776895:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	776898: R_X86_64_32S	.rodata.str1.1+0x3bdeb
0203   77689c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	77689f: R_X86_64_32S	.rodata+0x4967c0
020a   7768a3:	41 b8 96 04 00 00    	mov    $0x496,%r8d
0210   7768a9:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	7768ac: R_X86_64_32S	.rodata.str1.1+0x3bdeb
0217   7768b0:	e8 00 00 00 00       	call   7768b5 <leaf_cut_from_buffer+0x21c>	7768b1: R_X86_64_PLT32	__reiserfs_panic-0x4
021c   7768b5:	4d 8d 50 10          	lea    0x10(%r8),%r10
0220   7768b9:	4d 8d 70 11          	lea    0x11(%r8),%r14
0224   7768bd:	4d 89 d3             	mov    %r10,%r11
0227   7768c0:	49 c1 eb 03          	shr    $0x3,%r11
022b   7768c4:	41 8a 04 33          	mov    (%r11,%rsi,1),%al
022f   7768c8:	84 c0                	test   %al,%al
0231   7768ca:	0f 85 e1 11 00 00    	jne    777ab1 <leaf_cut_from_buffer+0x1418>
0237   7768d0:	4c 89 f0             	mov    %r14,%rax
023a   7768d3:	48 c1 e8 03          	shr    $0x3,%rax
023e   7768d7:	8a 04 30             	mov    (%rax,%rsi,1),%al
0241   7768da:	84 c0                	test   %al,%al
0243   7768dc:	0f 85 0e 12 00 00    	jne    777af0 <leaf_cut_from_buffer+0x1457>
0249   7768e2:	41 0f b7 1a          	movzwl (%r10),%ebx
024d   7768e6:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0252   7768eb:	42 8d 2c 28          	lea    (%rax,%r13,1),%ebp
0256   7768ef:	39 dd                	cmp    %ebx,%ebp
0258   7768f1:	0f 8f f5 1c 00 00    	jg     7785ec <leaf_cut_from_buffer+0x1f53>
025e   7768f7:	45 85 ed             	test   %r13d,%r13d
0261   7768fa:	0f 84 da 05 00 00    	je     776eda <leaf_cut_from_buffer+0x841>
0267   776900:	48 89 5c 24 48       	mov    %rbx,0x48(%rsp)
026c   776905:	49 8d 78 14          	lea    0x14(%r8),%rdi
0270   776909:	4d 8d 70 15          	lea    0x15(%r8),%r14
0274   77690d:	48 89 f8             	mov    %rdi,%rax
0277   776910:	48 c1 e8 03          	shr    $0x3,%rax
027b   776914:	8a 04 30             	mov    (%rax,%rsi,1),%al
027e   776917:	84 c0                	test   %al,%al
0280   776919:	0f 85 42 13 00 00    	jne    777c61 <leaf_cut_from_buffer+0x15c8>
0286   77691f:	4c 89 f0             	mov    %r14,%rax
0289   776922:	48 c1 e8 03          	shr    $0x3,%rax
028d   776926:	8a 04 30             	mov    (%rax,%rsi,1),%al
0290   776929:	84 c0                	test   %al,%al
0292   77692b:	0f 85 66 13 00 00    	jne    777c97 <leaf_cut_from_buffer+0x15fe>
0298   776931:	41 0f b7 78 14       	movzwl 0x14(%r8),%edi
029d   776936:	4d 8d 0c 3c          	lea    (%r12,%rdi,1),%r9
02a1   77693a:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
02a6   77693f:	8d 41 ff             	lea    -0x1(%rcx),%eax
02a9   776942:	48 98                	cltq
02ab   776944:	48 c1 e0 04          	shl    $0x4,%rax
02af   776948:	49 8d 50 12          	lea    0x12(%r8),%rdx
02b3   77694c:	83 f9 01             	cmp    $0x1,%ecx
02b6   77694f:	4e 8d 74 08 0c       	lea    0xc(%rax,%r9,1),%r14
02bb   776954:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
02c0   776959:	4c 0f 42 f2          	cmovb  %rdx,%r14
02c4   77695d:	4d 8d 7e 01          	lea    0x1(%r14),%r15
02c8   776961:	4c 89 f0             	mov    %r14,%rax
02cb   776964:	48 c1 e8 03          	shr    $0x3,%rax
02cf   776968:	8a 04 30             	mov    (%rax,%rsi,1),%al
02d2   77696b:	84 c0                	test   %al,%al
02d4   77696d:	0f 85 5e 13 00 00    	jne    777cd1 <leaf_cut_from_buffer+0x1638>
02da   776973:	4c 89 f8             	mov    %r15,%rax
02dd   776976:	48 c1 e8 03          	shr    $0x3,%rax
02e1   77697a:	8a 04 30             	mov    (%rax,%rsi,1),%al
02e4   77697d:	84 c0                	test   %al,%al
02e6   77697f:	0f 85 96 13 00 00    	jne    777d1b <leaf_cut_from_buffer+0x1682>
02ec   776985:	41 0f b7 16          	movzwl (%r14),%edx
02f0   776989:	ff cd                	dec    %ebp
02f2   77698b:	48 63 dd             	movslq %ebp,%rbx
02f5   77698e:	48 89 d8             	mov    %rbx,%rax
02f8   776991:	48 c1 e0 04          	shl    $0x4,%rax
02fc   776995:	4d 8d 34 01          	lea    (%r9,%rax,1),%r14
0300   776999:	49 83 c6 0c          	add    $0xc,%r14
0304   77699d:	4d 8d 3c 01          	lea    (%r9,%rax,1),%r15
0308   7769a1:	49 83 c7 0d          	add    $0xd,%r15
030c   7769a5:	4c 89 f0             	mov    %r14,%rax
030f   7769a8:	48 c1 e8 03          	shr    $0x3,%rax
0313   7769ac:	8a 04 30             	mov    (%rax,%rsi,1),%al
0316   7769af:	84 c0                	test   %al,%al
0318   7769b1:	0f 85 aa 13 00 00    	jne    777d61 <leaf_cut_from_buffer+0x16c8>
031e   7769b7:	4c 89 6c 24 20       	mov    %r13,0x20(%rsp)
0323   7769bc:	4c 89 f8             	mov    %r15,%rax
0326   7769bf:	48 c1 e8 03          	shr    $0x3,%rax
032a   7769c3:	8a 04 30             	mov    (%rax,%rsi,1),%al
032d   7769c6:	84 c0                	test   %al,%al
032f   7769c8:	0f 85 eb 13 00 00    	jne    777db9 <leaf_cut_from_buffer+0x1720>
0335   7769ce:	41 0f b7 06          	movzwl (%r14),%eax
0339   7769d2:	49 89 d0             	mov    %rdx,%r8
033c   7769d5:	49 29 c0             	sub    %rax,%r8
033f   7769d8:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
0344   7769dd:	8d 41 ff             	lea    -0x1(%rcx),%eax
0347   7769e0:	39 e8                	cmp    %ebp,%eax
0349   7769e2:	4c 89 44 24 10       	mov    %r8,0x10(%rsp)
034e   7769e7:	0f 8e bc 01 00 00    	jle    776ba9 <leaf_cut_from_buffer+0x510>
0354   7769ed:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
0359   7769f2:	89 c5                	mov    %eax,%ebp
035b   7769f4:	c1 e5 04             	shl    $0x4,%ebp
035e   7769f7:	89 c8                	mov    %ecx,%eax
0360   7769f9:	4c 8d 60 ff          	lea    -0x1(%rax),%r12
0364   7769fd:	48 c1 e0 04          	shl    $0x4,%rax
0368   776a01:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
036d   776a06:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
0372   776a0b:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
0376   776a0f:	4c 8d 34 0f          	lea    (%rdi,%rcx,1),%r14
037a   776a13:	49 83 c6 fc          	add    $0xfffffffffffffffc,%r14
037e   776a17:	48 01 f8             	add    %rdi,%rax
0381   776a1a:	4c 8d 2c 02          	lea    (%rdx,%rax,1),%r13
0385   776a1e:	49 83 c5 fc          	add    $0xfffffffffffffffc,%r13
0389   776a22:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
038e   776a27:	4d 8d 7e 01          	lea    0x1(%r14),%r15
0392   776a2b:	4c 89 f0             	mov    %r14,%rax
0395   776a2e:	48 c1 e8 03          	shr    $0x3,%rax
0399   776a32:	8a 04 30             	mov    (%rax,%rsi,1),%al
039c   776a35:	84 c0                	test   %al,%al
039e   776a37:	75 28                	jne    776a61 <leaf_cut_from_buffer+0x3c8>
03a0   776a39:	4c 89 f8             	mov    %r15,%rax
03a3   776a3c:	48 c1 e8 03          	shr    $0x3,%rax
03a7   776a40:	8a 04 30             	mov    (%rax,%rsi,1),%al
03aa   776a43:	84 c0                	test   %al,%al
03ac   776a45:	75 6f                	jne    776ab6 <leaf_cut_from_buffer+0x41d>
03ae   776a47:	66 41 29 6d 00       	sub    %bp,0x0(%r13)
03b3   776a4c:	49 ff cc             	dec    %r12
03b6   776a4f:	49 83 c6 f0          	add    $0xfffffffffffffff0,%r14
03ba   776a53:	49 83 c5 f0          	add    $0xfffffffffffffff0,%r13
03be   776a57:	49 39 dc             	cmp    %rbx,%r12
03c1   776a5a:	7f cb                	jg     776a27 <leaf_cut_from_buffer+0x38e>
03c3   776a5c:	e9 48 01 00 00       	jmp    776ba9 <leaf_cut_from_buffer+0x510>
03c8   776a61:	44 89 f1             	mov    %r14d,%ecx
03cb   776a64:	80 e1 07             	and    $0x7,%cl
03ce   776a67:	38 c1                	cmp    %al,%cl
03d0   776a69:	7c ce                	jl     776a39 <leaf_cut_from_buffer+0x3a0>
03d2   776a6b:	be 02 00 00 00       	mov    $0x2,%esi
03d7   776a70:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
03dc   776a75:	4c 89 f7             	mov    %r14,%rdi
03df   776a78:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
03e4   776a7d:	4c 89 4c 24 70       	mov    %r9,0x70(%rsp)
03e9   776a82:	4c 89 5c 24 30       	mov    %r11,0x30(%rsp)
03ee   776a87:	e8 00 00 00 00       	call   776a8c <leaf_cut_from_buffer+0x3f3>	776a88: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
03f3   776a8c:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
03f8   776a91:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
03fd   776a96:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
0402   776a9b:	4c 8b 5c 24 30       	mov    0x30(%rsp),%r11
0407   776aa0:	4c 8b 4c 24 70       	mov    0x70(%rsp),%r9
040c   776aa5:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
0411   776aaa:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
041b   776ab4:	eb 83                	jmp    776a39 <leaf_cut_from_buffer+0x3a0>
041d   776ab6:	44 89 f9             	mov    %r15d,%ecx
0420   776ab9:	80 e1 07             	and    $0x7,%cl
0423   776abc:	38 c1                	cmp    %al,%cl
0425   776abe:	7c 87                	jl     776a47 <leaf_cut_from_buffer+0x3ae>
0427   776ac0:	be 02 00 00 00       	mov    $0x2,%esi
042c   776ac5:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
0431   776aca:	4c 89 ff             	mov    %r15,%rdi
0434   776acd:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
0439   776ad2:	4d 89 cf             	mov    %r9,%r15
043c   776ad5:	4c 89 5c 24 30       	mov    %r11,0x30(%rsp)
0441   776ada:	e8 00 00 00 00       	call   776adf <leaf_cut_from_buffer+0x446>	776adb: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0446   776adf:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
044b   776ae4:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
0450   776ae9:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
0455   776aee:	4c 8b 5c 24 30       	mov    0x30(%rsp),%r11
045a   776af3:	4d 89 f9             	mov    %r15,%r9
045d   776af6:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
0462   776afb:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
046c   776b05:	e9 3d ff ff ff       	jmp    776a47 <leaf_cut_from_buffer+0x3ae>
0471   776b0a:	48 b9 ff ff ff ff ff ff ff 0f 	movabs $0xfffffffffffffff,%rcx
047b   776b14:	48 39 c8             	cmp    %rcx,%rax
047e   776b17:	0f 86 6a fd ff ff    	jbe    776887 <leaf_cut_from_buffer+0x1ee>
0484   776b1d:	83 7c 24 40 00       	cmpl   $0x0,0x40(%rsp)
0489   776b22:	0f 84 4a 02 00 00    	je     776d72 <leaf_cut_from_buffer+0x6d9>
048f   776b28:	4d 8d 70 12          	lea    0x12(%r8),%r14
0493   776b2c:	4d 8d 78 13          	lea    0x13(%r8),%r15
0497   776b30:	4c 89 f0             	mov    %r14,%rax
049a   776b33:	48 c1 e8 03          	shr    $0x3,%rax
049e   776b37:	8a 04 30             	mov    (%rax,%rsi,1),%al
04a1   776b3a:	84 c0                	test   %al,%al
04a3   776b3c:	0f 85 c7 12 00 00    	jne    777e09 <leaf_cut_from_buffer+0x1770>
04a9   776b42:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
04ae   776b47:	42 8d 1c 28          	lea    (%rax,%r13,1),%ebx
04b2   776b4b:	4c 89 f8             	mov    %r15,%rax
04b5   776b4e:	48 c1 e8 03          	shr    $0x3,%rax
04b9   776b52:	8a 04 30             	mov    (%rax,%rsi,1),%al
04bc   776b55:	84 c0                	test   %al,%al
04be   776b57:	4c 8b 64 24 58       	mov    0x58(%rsp),%r12
04c3   776b5c:	0f 85 da 12 00 00    	jne    777e3c <leaf_cut_from_buffer+0x17a3>
04c9   776b62:	45 0f b7 36          	movzwl (%r14),%r14d
04cd   776b66:	44 39 f3             	cmp    %r14d,%ebx
04d0   776b69:	0f 84 88 03 00 00    	je     776ef7 <leaf_cut_from_buffer+0x85e>
04d6   776b6f:	48 63 5c 24 40       	movslq 0x40(%rsp),%rbx
04db   776b74:	4d 63 fd             	movslq %r13d,%r15
04de   776b77:	e8 00 00 00 00       	call   776b7c <leaf_cut_from_buffer+0x4e3>	776b78: R_X86_64_PLT32	__asan_handle_no_return-0x4
04e3   776b7c:	31 ff                	xor    %edi,%edi
04e5   776b7e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	776b81: R_X86_64_32S	.rodata+0x495f40
04ec   776b85:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	776b88: R_X86_64_32S	.rodata.str1.1+0x3bdeb
04f3   776b8c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	776b8f: R_X86_64_32S	.rodata+0x496840
04fa   776b93:	41 b8 9a 04 00 00    	mov    $0x49a,%r8d
0500   776b99:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	776b9c: R_X86_64_32S	.rodata.str1.1+0x3bdeb
0507   776ba0:	41 56                	push   %r14
0509   776ba2:	41 57                	push   %r15
050b   776ba4:	e9 72 1a 00 00       	jmp    77861b <leaf_cut_from_buffer+0x1f82>
0510   776ba9:	89 d2                	mov    %edx,%edx
0512   776bab:	83 7c 24 40 00       	cmpl   $0x0,0x40(%rsp)
0517   776bb0:	0f 8e 03 01 00 00    	jle    776cb9 <leaf_cut_from_buffer+0x620>
051d   776bb6:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
0522   776bbb:	89 c3                	mov    %eax,%ebx
0524   776bbd:	c1 e3 04             	shl    $0x4,%ebx
0527   776bc0:	44 01 c3             	add    %r8d,%ebx
052a   776bc3:	f7 db                	neg    %ebx
052c   776bc5:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
0531   776bca:	49 c1 e4 04          	shl    $0x4,%r12
0535   776bce:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
053a   776bd3:	4c 8d 2c 38          	lea    (%rax,%rdi,1),%r13
053e   776bd7:	49 83 c5 0c          	add    $0xc,%r13
0542   776bdb:	48 8d 2c 38          	lea    (%rax,%rdi,1),%rbp
0546   776bdf:	48 83 c5 0d          	add    $0xd,%rbp
054a   776be3:	45 31 f6             	xor    %r14d,%r14d
054d   776be6:	4d 8d 3c 2e          	lea    (%r14,%rbp,1),%r15
0551   776bea:	4b 8d 3c 2e          	lea    (%r14,%r13,1),%rdi
0555   776bee:	48 89 f8             	mov    %rdi,%rax
0558   776bf1:	48 c1 e8 03          	shr    $0x3,%rax
055c   776bf5:	8a 04 30             	mov    (%rax,%rsi,1),%al
055f   776bf8:	84 c0                	test   %al,%al
0561   776bfa:	75 22                	jne    776c1e <leaf_cut_from_buffer+0x585>
0563   776bfc:	4c 89 f8             	mov    %r15,%rax
0566   776bff:	48 c1 e8 03          	shr    $0x3,%rax
056a   776c03:	8a 04 30             	mov    (%rax,%rsi,1),%al
056d   776c06:	84 c0                	test   %al,%al
056f   776c08:	75 60                	jne    776c6a <leaf_cut_from_buffer+0x5d1>
0571   776c0a:	66 43 01 5c 35 00    	add    %bx,0x0(%r13,%r14,1)
0577   776c10:	49 83 c6 10          	add    $0x10,%r14
057b   776c14:	4d 39 f4             	cmp    %r14,%r12
057e   776c17:	75 cd                	jne    776be6 <leaf_cut_from_buffer+0x54d>
0580   776c19:	e9 9b 00 00 00       	jmp    776cb9 <leaf_cut_from_buffer+0x620>
0585   776c1e:	89 f9                	mov    %edi,%ecx
0587   776c20:	80 e1 07             	and    $0x7,%cl
058a   776c23:	38 c1                	cmp    %al,%cl
058c   776c25:	7c d5                	jl     776bfc <leaf_cut_from_buffer+0x563>
058e   776c27:	be 02 00 00 00       	mov    $0x2,%esi
0593   776c2c:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
0598   776c31:	4c 89 4c 24 70       	mov    %r9,0x70(%rsp)
059d   776c36:	4c 89 5c 24 30       	mov    %r11,0x30(%rsp)
05a2   776c3b:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
05a7   776c40:	e8 00 00 00 00       	call   776c45 <leaf_cut_from_buffer+0x5ac>	776c41: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
05ac   776c45:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
05b1   776c4a:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
05b6   776c4f:	4c 8b 5c 24 30       	mov    0x30(%rsp),%r11
05bb   776c54:	4c 8b 4c 24 70       	mov    0x70(%rsp),%r9
05c0   776c59:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
05c5   776c5e:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
05cf   776c68:	eb 92                	jmp    776bfc <leaf_cut_from_buffer+0x563>
05d1   776c6a:	44 89 f9             	mov    %r15d,%ecx
05d4   776c6d:	80 e1 07             	and    $0x7,%cl
05d7   776c70:	38 c1                	cmp    %al,%cl
05d9   776c72:	7c 96                	jl     776c0a <leaf_cut_from_buffer+0x571>
05db   776c74:	be 02 00 00 00       	mov    $0x2,%esi
05e0   776c79:	4c 89 ff             	mov    %r15,%rdi
05e3   776c7c:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
05e8   776c81:	4d 89 cf             	mov    %r9,%r15
05eb   776c84:	4c 89 5c 24 30       	mov    %r11,0x30(%rsp)
05f0   776c89:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
05f5   776c8e:	e8 00 00 00 00       	call   776c93 <leaf_cut_from_buffer+0x5fa>	776c8f: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
05fa   776c93:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
05ff   776c98:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
0604   776c9d:	4c 8b 5c 24 30       	mov    0x30(%rsp),%r11
0609   776ca2:	4d 89 f9             	mov    %r15,%r9
060c   776ca5:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
0611   776caa:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
061b   776cb4:	e9 51 ff ff ff       	jmp    776c0a <leaf_cut_from_buffer+0x571>
0620   776cb9:	4d 8d 7a 01          	lea    0x1(%r10),%r15
0624   776cbd:	41 8a 04 33          	mov    (%r11,%rsi,1),%al
0628   776cc1:	84 c0                	test   %al,%al
062a   776cc3:	0f 85 a6 11 00 00    	jne    777e6f <leaf_cut_from_buffer+0x17d6>
0630   776cc9:	4c 01 ca             	add    %r9,%rdx
0633   776ccc:	4c 89 f8             	mov    %r15,%rax
0636   776ccf:	48 c1 e8 03          	shr    $0x3,%rax
063a   776cd3:	8a 04 30             	mov    (%rax,%rsi,1),%al
063d   776cd6:	84 c0                	test   %al,%al
063f   776cd8:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
0644   776cdd:	48 89 f3             	mov    %rsi,%rbx
0647   776ce0:	0f 85 cb 11 00 00    	jne    777eb1 <leaf_cut_from_buffer+0x1818>
064d   776ce6:	66 45 29 2a          	sub    %r13w,(%r10)
0651   776cea:	48 63 7c 24 40       	movslq 0x40(%rsp),%rdi
0656   776cef:	48 c1 e7 04          	shl    $0x4,%rdi
065a   776cf3:	4d 89 ce             	mov    %r9,%r14
065d   776cf6:	4c 01 cf             	add    %r9,%rdi
0660   776cf9:	4d 63 ed             	movslq %r13d,%r13
0663   776cfc:	49 c1 e5 04          	shl    $0x4,%r13
0667   776d00:	4a 8d 34 2f          	lea    (%rdi,%r13,1),%rsi
066b   776d04:	49 89 d4             	mov    %rdx,%r12
066e   776d07:	48 89 d5             	mov    %rdx,%rbp
0671   776d0a:	4c 29 c5             	sub    %r8,%rbp
0674   776d0d:	48 89 ea             	mov    %rbp,%rdx
0677   776d10:	48 29 f2             	sub    %rsi,%rdx
067a   776d13:	e8 00 00 00 00       	call   776d18 <leaf_cut_from_buffer+0x67f>	776d14: R_X86_64_PLT32	memmove-0x4
067f   776d18:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
0684   776d1d:	4c 8d 7f 01          	lea    0x1(%rdi),%r15
0688   776d21:	48 89 f8             	mov    %rdi,%rax
068b   776d24:	48 c1 e8 03          	shr    $0x3,%rax
068f   776d28:	8a 04 18             	mov    (%rax,%rbx,1),%al
0692   776d2b:	84 c0                	test   %al,%al
0694   776d2d:	0f 85 b6 11 00 00    	jne    777ee9 <leaf_cut_from_buffer+0x1850>
069a   776d33:	4c 29 ed             	sub    %r13,%rbp
069d   776d36:	4c 89 f8             	mov    %r15,%rax
06a0   776d39:	48 c1 e8 03          	shr    $0x3,%rax
06a4   776d3d:	8a 04 18             	mov    (%rax,%rbx,1),%al
06a7   776d40:	84 c0                	test   %al,%al
06a9   776d42:	0f 85 cc 11 00 00    	jne    777f14 <leaf_cut_from_buffer+0x187b>
06af   776d48:	0f b7 07             	movzwl (%rdi),%eax
06b2   776d4b:	4c 89 f2             	mov    %r14,%rdx
06b5   776d4e:	48 01 c2             	add    %rax,%rdx
06b8   776d51:	4c 29 e2             	sub    %r12,%rdx
06bb   776d54:	48 89 ef             	mov    %rbp,%rdi
06be   776d57:	4c 89 e6             	mov    %r12,%rsi
06c1   776d5a:	e8 00 00 00 00       	call   776d5f <leaf_cut_from_buffer+0x6c6>	776d5b: R_X86_64_PLT32	memmove-0x4
06c6   776d5f:	44 03 6c 24 10       	add    0x10(%rsp),%r13d
06cb   776d64:	4c 8b 04 24          	mov    (%rsp),%r8
06cf   776d68:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
06d4   776d6d:	e9 6b 01 00 00       	jmp    776edd <leaf_cut_from_buffer+0x844>
06d9   776d72:	49 8d 78 14          	lea    0x14(%r8),%rdi
06dd   776d76:	4d 8d 70 15          	lea    0x15(%r8),%r14
06e1   776d7a:	48 89 f8             	mov    %rdi,%rax
06e4   776d7d:	48 c1 e8 03          	shr    $0x3,%rax
06e8   776d81:	8a 04 30             	mov    (%rax,%rsi,1),%al
06eb   776d84:	84 c0                	test   %al,%al
06ed   776d86:	0f 85 ad 11 00 00    	jne    777f39 <leaf_cut_from_buffer+0x18a0>
06f3   776d8c:	4c 89 f0             	mov    %r14,%rax
06f6   776d8f:	48 c1 e8 03          	shr    $0x3,%rax
06fa   776d93:	8a 04 30             	mov    (%rax,%rsi,1),%al
06fd   776d96:	84 c0                	test   %al,%al
06ff   776d98:	0f 85 c5 11 00 00    	jne    777f63 <leaf_cut_from_buffer+0x18ca>
0705   776d9e:	45 0f b7 70 14       	movzwl 0x14(%r8),%r14d
070a   776da3:	4d 01 e6             	add    %r12,%r14
070d   776da6:	49 63 d5             	movslq %r13d,%rdx
0710   776da9:	49 8d 78 12          	lea    0x12(%r8),%rdi
0714   776dad:	4d 8d 78 13          	lea    0x13(%r8),%r15
0718   776db1:	48 89 f8             	mov    %rdi,%rax
071b   776db4:	48 c1 e8 03          	shr    $0x3,%rax
071f   776db8:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
0724   776dbd:	8a 04 30             	mov    (%rax,%rsi,1),%al
0727   776dc0:	84 c0                	test   %al,%al
0729   776dc2:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
072e   776dc7:	0f 85 c4 11 00 00    	jne    777f91 <leaf_cut_from_buffer+0x18f8>
0734   776dcd:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
0739   776dd2:	49 8d 2c 16          	lea    (%r14,%rdx,1),%rbp
073d   776dd6:	4c 89 f8             	mov    %r15,%rax
0740   776dd9:	48 c1 e8 03          	shr    $0x3,%rax
0744   776ddd:	8a 04 30             	mov    (%rax,%rsi,1),%al
0747   776de0:	84 c0                	test   %al,%al
0749   776de2:	48 89 f3             	mov    %rsi,%rbx
074c   776de5:	4c 8b 64 24 58       	mov    0x58(%rsp),%r12
0751   776dea:	0f 85 d2 11 00 00    	jne    777fc2 <leaf_cut_from_buffer+0x1929>
0757   776df0:	0f b7 07             	movzwl (%rdi),%eax
075a   776df3:	44 29 e8             	sub    %r13d,%eax
075d   776df6:	48 63 d0             	movslq %eax,%rdx
0760   776df9:	4c 89 f7             	mov    %r14,%rdi
0763   776dfc:	48 89 ee             	mov    %rbp,%rsi
0766   776dff:	e8 00 00 00 00       	call   776e04 <leaf_cut_from_buffer+0x76b>	776e00: R_X86_64_PLT32	memmove-0x4
076b   776e04:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0770   776e09:	4c 8d 77 01          	lea    0x1(%rdi),%r14
0774   776e0d:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
077c   776e15:	8a 04 18             	mov    (%rax,%rbx,1),%al
077f   776e18:	84 c0                	test   %al,%al
0781   776e1a:	48 89 de             	mov    %rbx,%rsi
0784   776e1d:	0f 85 c4 11 00 00    	jne    777fe7 <leaf_cut_from_buffer+0x194e>
078a   776e23:	4c 89 f0             	mov    %r14,%rax
078d   776e26:	48 c1 e8 03          	shr    $0x3,%rax
0791   776e2a:	8a 04 30             	mov    (%rax,%rsi,1),%al
0794   776e2d:	84 c0                	test   %al,%al
0796   776e2f:	4c 8b 04 24          	mov    (%rsp),%r8
079a   776e33:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
079f   776e38:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
07a4   776e3d:	0f 85 cf 11 00 00    	jne    778012 <leaf_cut_from_buffer+0x1979>
07aa   776e43:	0f b7 3f             	movzwl (%rdi),%edi
07ad   776e46:	66 85 ff             	test   %di,%di
07b0   776e49:	0f 84 58 02 00 00    	je     7770a7 <leaf_cut_from_buffer+0xa0e>
07b6   776e4f:	4d 8d 50 08          	lea    0x8(%r8),%r10
07ba   776e53:	4d 8d 78 0f          	lea    0xf(%r8),%r15
07be   776e57:	4c 89 d3             	mov    %r10,%rbx
07c1   776e5a:	48 c1 eb 03          	shr    $0x3,%rbx
07c5   776e5e:	8a 04 33             	mov    (%rbx,%rsi,1),%al
07c8   776e61:	84 c0                	test   %al,%al
07ca   776e63:	0f 85 81 13 00 00    	jne    7781ea <leaf_cut_from_buffer+0x1b51>
07d0   776e69:	4c 89 f8             	mov    %r15,%rax
07d3   776e6c:	48 c1 e8 03          	shr    $0x3,%rax
07d7   776e70:	8a 04 30             	mov    (%rax,%rsi,1),%al
07da   776e73:	84 c0                	test   %al,%al
07dc   776e75:	0f 85 b1 13 00 00    	jne    77822c <leaf_cut_from_buffer+0x1b93>
07e2   776e7b:	49 8b 2a             	mov    (%r10),%rbp
07e5   776e7e:	49 89 ee             	mov    %rbp,%r14
07e8   776e81:	48 b8 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rax
07f2   776e8b:	49 21 c6             	and    %rax,%r14
07f5   776e8e:	48 b8 00 00 00 00 00 00 00 20 	movabs $0x2000000000000000,%rax
07ff   776e98:	49 39 c6             	cmp    %rax,%r14
0802   776e9b:	0f 85 36 07 00 00    	jne    7775d7 <leaf_cut_from_buffer+0xf3e>
0808   776ea1:	48 01 d5             	add    %rdx,%rbp
080b   776ea4:	48 b8 ff ff ff ff ff ff ff 0f 	movabs $0xfffffffffffffff,%rax
0815   776eae:	48 21 c5             	and    %rax,%rbp
0818   776eb1:	4d 8d 7a 07          	lea    0x7(%r10),%r15
081c   776eb5:	8a 04 33             	mov    (%rbx,%rsi,1),%al
081f   776eb8:	84 c0                	test   %al,%al
0821   776eba:	0f 85 56 15 00 00    	jne    778416 <leaf_cut_from_buffer+0x1d7d>
0827   776ec0:	4c 09 f5             	or     %r14,%rbp
082a   776ec3:	4c 89 f8             	mov    %r15,%rax
082d   776ec6:	48 c1 e8 03          	shr    $0x3,%rax
0831   776eca:	8a 04 30             	mov    (%rax,%rsi,1),%al
0834   776ecd:	84 c0                	test   %al,%al
0836   776ecf:	0f 85 7a 15 00 00    	jne    77844f <leaf_cut_from_buffer+0x1db6>
083c   776ed5:	49 89 2a             	mov    %rbp,(%r10)
083f   776ed8:	eb 1d                	jmp    776ef7 <leaf_cut_from_buffer+0x85e>
0841   776eda:	45 31 ed             	xor    %r13d,%r13d
0844   776edd:	4c 8b 64 24 58       	mov    0x58(%rsp),%r12
0849   776ee2:	83 7c 24 40 00       	cmpl   $0x0,0x40(%rsp)
084e   776ee7:	0f 84 91 00 00 00    	je     776f7e <leaf_cut_from_buffer+0x8e5>
0854   776eed:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
085e   776ef7:	44 89 e0             	mov    %r12d,%eax
0861   776efa:	f7 d0                	not    %eax
0863   776efc:	44 01 c8             	add    %r9d,%eax
0866   776eff:	48 98                	cltq
0868   776f01:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
086c   776f05:	4d 8d 34 c0          	lea    (%r8,%rax,8),%r14
0870   776f09:	49 83 c6 14          	add    $0x14,%r14
0874   776f0d:	4d 8d 3c c0          	lea    (%r8,%rax,8),%r15
0878   776f11:	49 83 c7 15          	add    $0x15,%r15
087c   776f15:	4c 89 f0             	mov    %r14,%rax
087f   776f18:	48 c1 e8 03          	shr    $0x3,%rax
0883   776f1c:	8a 04 30             	mov    (%rax,%rsi,1),%al
0886   776f1f:	84 c0                	test   %al,%al
0888   776f21:	0f 85 98 09 00 00    	jne    7778bf <leaf_cut_from_buffer+0x1226>
088e   776f27:	4c 89 f8             	mov    %r15,%rax
0891   776f2a:	48 c1 e8 03          	shr    $0x3,%rax
0895   776f2e:	8a 04 30             	mov    (%rax,%rsi,1),%al
0898   776f31:	84 c0                	test   %al,%al
089a   776f33:	0f 85 b4 09 00 00    	jne    7778ed <leaf_cut_from_buffer+0x1254>
08a0   776f39:	41 0f b7 2e          	movzwl (%r14),%ebp
08a4   776f3d:	0f b7 dd             	movzwl %bp,%ebx
08a7   776f40:	45 85 e4             	test   %r12d,%r12d
08aa   776f43:	0f 84 e1 02 00 00    	je     77722a <leaf_cut_from_buffer+0xb91>
08b0   776f49:	4d 8d 70 fc          	lea    -0x4(%r8),%r14
08b4   776f4d:	4d 8d 78 fd          	lea    -0x3(%r8),%r15
08b8   776f51:	4c 89 f0             	mov    %r14,%rax
08bb   776f54:	48 c1 e8 03          	shr    $0x3,%rax
08bf   776f58:	8a 04 30             	mov    (%rax,%rsi,1),%al
08c2   776f5b:	84 c0                	test   %al,%al
08c4   776f5d:	0f 85 fa 0a 00 00    	jne    777a5d <leaf_cut_from_buffer+0x13c4>
08ca   776f63:	4c 89 f8             	mov    %r15,%rax
08cd   776f66:	48 c1 e8 03          	shr    $0x3,%rax
08d1   776f6a:	8a 04 30             	mov    (%rax,%rsi,1),%al
08d4   776f6d:	84 c0                	test   %al,%al
08d6   776f6f:	0f 85 12 0b 00 00    	jne    777a87 <leaf_cut_from_buffer+0x13ee>
08dc   776f75:	45 0f b7 36          	movzwl (%r14),%r14d
08e0   776f79:	e9 d7 02 00 00       	jmp    777255 <leaf_cut_from_buffer+0xbbc>
08e5   776f7e:	45 85 e4             	test   %r12d,%r12d
08e8   776f81:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
08f2   776f8b:	0f 85 c8 17 00 00    	jne    778759 <leaf_cut_from_buffer+0x20c0>
08f8   776f91:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
0900   776f99:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
0904   776f9d:	48 8b 9c 24 98 00 00 00 	mov    0x98(%rsp),%rbx
090c   776fa5:	74 1b                	je     776fc2 <leaf_cut_from_buffer+0x929>
090e   776fa7:	48 89 df             	mov    %rbx,%rdi
0911   776faa:	e8 00 00 00 00       	call   776faf <leaf_cut_from_buffer+0x916>	776fab: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0916   776faf:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
091b   776fb4:	4c 8b 04 24          	mov    (%rsp),%r8
091f   776fb8:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0929   776fc2:	48 8b 1b             	mov    (%rbx),%rbx
092c   776fc5:	4d 8d 70 14          	lea    0x14(%r8),%r14
0930   776fc9:	4d 8d 78 15          	lea    0x15(%r8),%r15
0934   776fcd:	4c 89 f0             	mov    %r14,%rax
0937   776fd0:	48 c1 e8 03          	shr    $0x3,%rax
093b   776fd4:	8a 04 30             	mov    (%rax,%rsi,1),%al
093e   776fd7:	84 c0                	test   %al,%al
0940   776fd9:	0f 85 70 10 00 00    	jne    77804f <leaf_cut_from_buffer+0x19b6>
0946   776fdf:	4c 89 f8             	mov    %r15,%rax
0949   776fe2:	48 c1 e8 03          	shr    $0x3,%rax
094d   776fe6:	8a 04 30             	mov    (%rax,%rsi,1),%al
0950   776fe9:	84 c0                	test   %al,%al
0952   776feb:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0957   776ff0:	0f 85 8c 10 00 00    	jne    778082 <leaf_cut_from_buffer+0x19e9>
095d   776ff6:	41 0f b7 06          	movzwl (%r14),%eax
0961   776ffa:	4c 8d 34 03          	lea    (%rbx,%rax,1),%r14
0965   776ffe:	4c 8d 3c 03          	lea    (%rbx,%rax,1),%r15
0969   777002:	49 83 c7 03          	add    $0x3,%r15
096d   777006:	4c 89 f0             	mov    %r14,%rax
0970   777009:	48 c1 e8 03          	shr    $0x3,%rax
0974   77700d:	8a 04 30             	mov    (%rax,%rsi,1),%al
0977   777010:	84 c0                	test   %al,%al
0979   777012:	0f 85 a2 10 00 00    	jne    7780ba <leaf_cut_from_buffer+0x1a21>
097f   777018:	4c 89 f8             	mov    %r15,%rax
0982   77701b:	48 c1 e8 03          	shr    $0x3,%rax
0986   77701f:	8a 04 30             	mov    (%rax,%rsi,1),%al
0989   777022:	84 c0                	test   %al,%al
098b   777024:	0f 85 c8 10 00 00    	jne    7780f2 <leaf_cut_from_buffer+0x1a59>
0991   77702a:	41 8b 2e             	mov    (%r14),%ebp
0994   77702d:	4c 8d 77 01          	lea    0x1(%rdi),%r14
0998   777031:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
09a0   777039:	8a 04 30             	mov    (%rax,%rsi,1),%al
09a3   77703c:	84 c0                	test   %al,%al
09a5   77703e:	0f 85 e6 10 00 00    	jne    77812a <leaf_cut_from_buffer+0x1a91>
09ab   777044:	4c 89 f0             	mov    %r14,%rax
09ae   777047:	48 c1 e8 03          	shr    $0x3,%rax
09b2   77704b:	8a 04 30             	mov    (%rax,%rsi,1),%al
09b5   77704e:	84 c0                	test   %al,%al
09b7   777050:	0f 85 08 11 00 00    	jne    77815e <leaf_cut_from_buffer+0x1ac5>
09bd   777056:	66 83 3f 00          	cmpw   $0x0,(%rdi)
09c1   77705a:	0f 84 5c 01 00 00    	je     7771bc <leaf_cut_from_buffer+0xb23>
09c7   777060:	4d 8d 70 08          	lea    0x8(%r8),%r14
09cb   777064:	4d 8d 78 0f          	lea    0xf(%r8),%r15
09cf   777068:	4c 89 f0             	mov    %r14,%rax
09d2   77706b:	48 c1 e8 03          	shr    $0x3,%rax
09d6   77706f:	8a 04 30             	mov    (%rax,%rsi,1),%al
09d9   777072:	84 c0                	test   %al,%al
09db   777074:	0f 85 f4 11 00 00    	jne    77826e <leaf_cut_from_buffer+0x1bd5>
09e1   77707a:	4c 89 f8             	mov    %r15,%rax
09e4   77707d:	48 c1 e8 03          	shr    $0x3,%rax
09e8   777081:	8a 04 30             	mov    (%rax,%rsi,1),%al
09eb   777084:	84 c0                	test   %al,%al
09ed   777086:	0f 85 15 12 00 00    	jne    7782a1 <leaf_cut_from_buffer+0x1c08>
09f3   77708c:	49 8b 06             	mov    (%r14),%rax
09f6   77708f:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
0a00   777099:	48 21 c8             	and    %rcx,%rax
0a03   77709c:	48 09 e8             	or     %rbp,%rax
0a06   77709f:	49 89 06             	mov    %rax,(%r14)
0a09   7770a2:	e9 44 01 00 00       	jmp    7771eb <leaf_cut_from_buffer+0xb52>
0a0e   7770a7:	49 8d 78 0c          	lea    0xc(%r8),%rdi
0a12   7770ab:	4d 8d 70 0f          	lea    0xf(%r8),%r14
0a16   7770af:	48 89 f8             	mov    %rdi,%rax
0a19   7770b2:	48 c1 e8 03          	shr    $0x3,%rax
0a1d   7770b6:	8a 04 30             	mov    (%rax,%rsi,1),%al
0a20   7770b9:	84 c0                	test   %al,%al
0a22   7770bb:	0f 85 13 12 00 00    	jne    7782d4 <leaf_cut_from_buffer+0x1c3b>
0a28   7770c1:	4c 89 f0             	mov    %r14,%rax
0a2b   7770c4:	48 c1 e8 03          	shr    $0x3,%rax
0a2f   7770c8:	8a 04 30             	mov    (%rax,%rsi,1),%al
0a32   7770cb:	84 c0                	test   %al,%al
0a34   7770cd:	0f 85 35 12 00 00    	jne    778308 <leaf_cut_from_buffer+0x1c6f>
0a3a   7770d3:	41 8b 68 0c          	mov    0xc(%r8),%ebp
0a3e   7770d7:	4d 8d 70 08          	lea    0x8(%r8),%r14
0a42   7770db:	4d 8d 78 0b          	lea    0xb(%r8),%r15
0a46   7770df:	4d 89 f4             	mov    %r14,%r12
0a49   7770e2:	49 c1 ec 03          	shr    $0x3,%r12
0a4d   7770e6:	41 8a 04 34          	mov    (%r12,%rsi,1),%al
0a51   7770ea:	84 c0                	test   %al,%al
0a53   7770ec:	0f 85 4e 12 00 00    	jne    778340 <leaf_cut_from_buffer+0x1ca7>
0a59   7770f2:	4c 89 f8             	mov    %r15,%rax
0a5c   7770f5:	48 c1 e8 03          	shr    $0x3,%rax
0a60   7770f9:	8a 04 30             	mov    (%rax,%rsi,1),%al
0a63   7770fc:	84 c0                	test   %al,%al
0a65   7770fe:	0f 85 74 12 00 00    	jne    778378 <leaf_cut_from_buffer+0x1cdf>
0a6b   777104:	41 8b 1e             	mov    (%r14),%ebx
0a6e   777107:	83 fd ff             	cmp    $0xffffffff,%ebp
0a71   77710a:	0f 84 03 06 00 00    	je     777713 <leaf_cut_from_buffer+0x107a>
0a77   777110:	48 c1 ea 02          	shr    $0x2,%rdx
0a7b   777114:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
0a80   777119:	4c 8d 78 20          	lea    0x20(%rax),%r15
0a84   77711d:	4c 89 f8             	mov    %r15,%rax
0a87   777120:	48 c1 e8 03          	shr    $0x3,%rax
0a8b   777124:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
0a8f   777128:	74 1d                	je     777147 <leaf_cut_from_buffer+0xaae>
0a91   77712a:	4c 89 ff             	mov    %r15,%rdi
0a94   77712d:	48 89 d5             	mov    %rdx,%rbp
0a97   777130:	e8 00 00 00 00       	call   777135 <leaf_cut_from_buffer+0xa9c>	777131: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a9c   777135:	48 89 ea             	mov    %rbp,%rdx
0a9f   777138:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
0aa4   77713d:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0aae   777147:	41 0f af 17          	imul   (%r15),%edx
0ab2   77714b:	4d 8d 7e 03          	lea    0x3(%r14),%r15
0ab6   77714f:	41 8a 04 34          	mov    (%r12,%rsi,1),%al
0aba   777153:	84 c0                	test   %al,%al
0abc   777155:	0f 85 c6 14 00 00    	jne    778621 <leaf_cut_from_buffer+0x1f88>
0ac2   77715b:	01 d3                	add    %edx,%ebx
0ac4   77715d:	4c 89 f8             	mov    %r15,%rax
0ac7   777160:	48 c1 e8 03          	shr    $0x3,%rax
0acb   777164:	8a 04 30             	mov    (%rax,%rsi,1),%al
0ace   777167:	84 c0                	test   %al,%al
0ad0   777169:	4c 8b 64 24 58       	mov    0x58(%rsp),%r12
0ad5   77716e:	4c 8b 04 24          	mov    (%rsp),%r8
0ad9   777172:	0f 85 de 14 00 00    	jne    778656 <leaf_cut_from_buffer+0x1fbd>
0adf   777178:	41 89 1e             	mov    %ebx,(%r14)
0ae2   77717b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0ae7   777180:	4c 8d 70 01          	lea    0x1(%rax),%r14
0aeb   777184:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
0af0   777189:	8a 04 30             	mov    (%rax,%rsi,1),%al
0af3   77718c:	84 c0                	test   %al,%al
0af5   77718e:	0f 85 f5 14 00 00    	jne    778689 <leaf_cut_from_buffer+0x1ff0>
0afb   777194:	4c 89 f0             	mov    %r14,%rax
0afe   777197:	48 c1 e8 03          	shr    $0x3,%rax
0b02   77719b:	8a 04 30             	mov    (%rax,%rsi,1),%al
0b05   77719e:	84 c0                	test   %al,%al
0b07   7771a0:	0f 85 1a 15 00 00    	jne    7786c0 <leaf_cut_from_buffer+0x2027>
0b0d   7771a6:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0b12   7771ab:	0f b7 00             	movzwl (%rax),%eax
0b15   7771ae:	44 39 e8             	cmp    %r13d,%eax
0b18   7771b1:	0f 85 40 fd ff ff    	jne    776ef7 <leaf_cut_from_buffer+0x85e>
0b1e   7771b7:	e9 ef 04 00 00       	jmp    7776ab <leaf_cut_from_buffer+0x1012>
0b23   7771bc:	4d 8d 70 08          	lea    0x8(%r8),%r14
0b27   7771c0:	4d 8d 78 0b          	lea    0xb(%r8),%r15
0b2b   7771c4:	4c 89 f0             	mov    %r14,%rax
0b2e   7771c7:	48 c1 e8 03          	shr    $0x3,%rax
0b32   7771cb:	8a 04 30             	mov    (%rax,%rsi,1),%al
0b35   7771ce:	84 c0                	test   %al,%al
0b37   7771d0:	0f 85 da 11 00 00    	jne    7783b0 <leaf_cut_from_buffer+0x1d17>
0b3d   7771d6:	4c 89 f8             	mov    %r15,%rax
0b40   7771d9:	48 c1 e8 03          	shr    $0x3,%rax
0b44   7771dd:	8a 04 30             	mov    (%rax,%rsi,1),%al
0b47   7771e0:	84 c0                	test   %al,%al
0b49   7771e2:	0f 85 fb 11 00 00    	jne    7783e3 <leaf_cut_from_buffer+0x1d4a>
0b4f   7771e8:	41 89 2e             	mov    %ebp,(%r14)
0b52   7771eb:	4b 8d 04 49          	lea    (%r9,%r9,2),%rax
0b56   7771ef:	4d 8d 34 c0          	lea    (%r8,%rax,8),%r14
0b5a   7771f3:	49 83 c6 fc          	add    $0xfffffffffffffffc,%r14
0b5e   7771f7:	4d 8d 3c c0          	lea    (%r8,%rax,8),%r15
0b62   7771fb:	49 83 c7 fd          	add    $0xfffffffffffffffd,%r15
0b66   7771ff:	4c 89 f0             	mov    %r14,%rax
0b69   777202:	48 c1 e8 03          	shr    $0x3,%rax
0b6d   777206:	8a 04 30             	mov    (%rax,%rsi,1),%al
0b70   777209:	84 c0                	test   %al,%al
0b72   77720b:	0f 85 85 0f 00 00    	jne    778196 <leaf_cut_from_buffer+0x1afd>
0b78   777211:	4c 89 f8             	mov    %r15,%rax
0b7b   777214:	48 c1 e8 03          	shr    $0x3,%rax
0b7f   777218:	8a 04 30             	mov    (%rax,%rsi,1),%al
0b82   77721b:	84 c0                	test   %al,%al
0b84   77721d:	0f 85 9d 0f 00 00    	jne    7781c0 <leaf_cut_from_buffer+0x1b27>
0b8a   777223:	41 0f b7 2e          	movzwl (%r14),%ebp
0b8e   777227:	0f b7 dd             	movzwl %bp,%ebx
0b91   77722a:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
0b96   77722f:	4c 8d 70 20          	lea    0x20(%rax),%r14
0b9a   777233:	4c 89 f0             	mov    %r14,%rax
0b9d   777236:	48 c1 e8 03          	shr    $0x3,%rax
0ba1   77723a:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
0ba5   77723e:	74 12                	je     777252 <leaf_cut_from_buffer+0xbb9>
0ba7   777240:	4c 89 f7             	mov    %r14,%rdi
0baa   777243:	e8 00 00 00 00       	call   777248 <leaf_cut_from_buffer+0xbaf>	777244: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0baf   777248:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0bb9   777252:	4d 8b 36             	mov    (%r14),%r14
0bbc   777255:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
0bc4   77725d:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
0bc8   777261:	4c 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%r15
0bd0   777269:	74 08                	je     777273 <leaf_cut_from_buffer+0xbda>
0bd2   77726b:	4c 89 ff             	mov    %r15,%rdi
0bd5   77726e:	e8 00 00 00 00       	call   777273 <leaf_cut_from_buffer+0xbda>	77726f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0bda   777273:	0f b7 f5             	movzwl %bp,%esi
0bdd   777276:	49 03 37             	add    (%r15),%rsi
0be0   777279:	49 63 fd             	movslq %r13d,%rdi
0be3   77727c:	48 01 f7             	add    %rsi,%rdi
0be6   77727f:	44 01 eb             	add    %r13d,%ebx
0be9   777282:	41 29 de             	sub    %ebx,%r14d
0bec   777285:	49 63 d6             	movslq %r14d,%rdx
0bef   777288:	e8 00 00 00 00       	call   77728d <leaf_cut_from_buffer+0xbf4>	777289: R_X86_64_PLT32	memmove-0x4
0bf4   77728d:	48 8b 34 24          	mov    (%rsp),%rsi
0bf8   777291:	4c 8d 76 12          	lea    0x12(%rsi),%r14
0bfc   777295:	4c 8d 7e 13          	lea    0x13(%rsi),%r15
0c00   777299:	4c 89 f0             	mov    %r14,%rax
0c03   77729c:	48 c1 e8 03          	shr    $0x3,%rax
0c07   7772a0:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0c11   7772aa:	8a 04 10             	mov    (%rax,%rdx,1),%al
0c14   7772ad:	84 c0                	test   %al,%al
0c16   7772af:	0f 85 17 05 00 00    	jne    7777cc <leaf_cut_from_buffer+0x1133>
0c1c   7772b5:	4c 89 f8             	mov    %r15,%rax
0c1f   7772b8:	48 c1 e8 03          	shr    $0x3,%rax
0c23   7772bc:	8a 04 10             	mov    (%rax,%rdx,1),%al
0c26   7772bf:	84 c0                	test   %al,%al
0c28   7772c1:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0c2d   7772c6:	0f 85 2e 05 00 00    	jne    7777fa <leaf_cut_from_buffer+0x1161>
0c33   7772cc:	66 45 29 2e          	sub    %r13w,(%r14)
0c37   7772d0:	4c 8d 77 01          	lea    0x1(%rdi),%r14
0c3b   7772d4:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
0c43   7772dc:	8a 04 10             	mov    (%rax,%rdx,1),%al
0c46   7772df:	84 c0                	test   %al,%al
0c48   7772e1:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0c4d   7772e6:	0f 85 41 05 00 00    	jne    77782d <leaf_cut_from_buffer+0x1194>
0c53   7772ec:	4c 89 f0             	mov    %r14,%rax
0c56   7772ef:	48 c1 e8 03          	shr    $0x3,%rax
0c5a   7772f3:	8a 04 10             	mov    (%rax,%rdx,1),%al
0c5d   7772f6:	84 c0                	test   %al,%al
0c5f   7772f8:	0f 85 63 05 00 00    	jne    777861 <leaf_cut_from_buffer+0x11c8>
0c65   7772fe:	66 83 3f 00          	cmpw   $0x0,(%rdi)
0c69   777302:	74 4b                	je     77734f <leaf_cut_from_buffer+0xcb6>
0c6b   777304:	4c 8d 76 08          	lea    0x8(%rsi),%r14
0c6f   777308:	4c 8d 7e 0f          	lea    0xf(%rsi),%r15
0c73   77730c:	4c 89 f0             	mov    %r14,%rax
0c76   77730f:	48 c1 e8 03          	shr    $0x3,%rax
0c7a   777313:	8a 04 10             	mov    (%rax,%rdx,1),%al
0c7d   777316:	84 c0                	test   %al,%al
0c7f   777318:	0f 85 63 06 00 00    	jne    777981 <leaf_cut_from_buffer+0x12e8>
0c85   77731e:	4c 89 f8             	mov    %r15,%rax
0c88   777321:	48 c1 e8 03          	shr    $0x3,%rax
0c8c   777325:	8a 04 10             	mov    (%rax,%rdx,1),%al
0c8f   777328:	84 c0                	test   %al,%al
0c91   77732a:	0f 85 84 06 00 00    	jne    7779b4 <leaf_cut_from_buffer+0x131b>
0c97   777330:	48 b8 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rax
0ca1   77733a:	49 23 06             	and    (%r14),%rax
0ca4   77733d:	48 b9 ff ff ff ff ff ff ff 0f 	movabs $0xfffffffffffffff,%rcx
0cae   777347:	48 ff c1             	inc    %rcx
0cb1   77734a:	48 39 c8             	cmp    %rcx,%rax
0cb4   77734d:	eb 30                	jmp    77737f <leaf_cut_from_buffer+0xce6>
0cb6   77734f:	4c 8d 76 0c          	lea    0xc(%rsi),%r14
0cba   777353:	4c 8d 7e 0f          	lea    0xf(%rsi),%r15
0cbe   777357:	4c 89 f0             	mov    %r14,%rax
0cc1   77735a:	48 c1 e8 03          	shr    $0x3,%rax
0cc5   77735e:	8a 04 10             	mov    (%rax,%rdx,1),%al
0cc8   777361:	84 c0                	test   %al,%al
0cca   777363:	0f 85 92 08 00 00    	jne    777bfb <leaf_cut_from_buffer+0x1562>
0cd0   777369:	4c 89 f8             	mov    %r15,%rax
0cd3   77736c:	48 c1 e8 03          	shr    $0x3,%rax
0cd7   777370:	8a 04 10             	mov    (%rax,%rdx,1),%al
0cda   777373:	84 c0                	test   %al,%al
0cdc   777375:	0f 85 b3 08 00 00    	jne    777c2e <leaf_cut_from_buffer+0x1595>
0ce2   77737b:	41 83 3e fe          	cmpl   $0xfffffffe,(%r14)
0ce6   77737f:	0f 94 c0             	sete   %al
0ce9   777382:	83 7c 24 40 00       	cmpl   $0x0,0x40(%rsp)
0cee   777387:	74 36                	je     7773bf <leaf_cut_from_buffer+0xd26>
0cf0   777389:	84 c0                	test   %al,%al
0cf2   77738b:	74 32                	je     7773bf <leaf_cut_from_buffer+0xd26>
0cf4   77738d:	4c 8d 76 10          	lea    0x10(%rsi),%r14
0cf8   777391:	4c 8d 7e 11          	lea    0x11(%rsi),%r15
0cfc   777395:	4c 89 f0             	mov    %r14,%rax
0cff   777398:	48 c1 e8 03          	shr    $0x3,%rax
0d03   77739c:	8a 04 10             	mov    (%rax,%rdx,1),%al
0d06   77739f:	84 c0                	test   %al,%al
0d08   7773a1:	0f 85 88 07 00 00    	jne    777b2f <leaf_cut_from_buffer+0x1496>
0d0e   7773a7:	4c 89 f8             	mov    %r15,%rax
0d11   7773aa:	48 c1 e8 03          	shr    $0x3,%rax
0d15   7773ae:	8a 04 10             	mov    (%rax,%rdx,1),%al
0d18   7773b1:	84 c0                	test   %al,%al
0d1a   7773b3:	0f 85 a9 07 00 00    	jne    777b62 <leaf_cut_from_buffer+0x14c9>
0d20   7773b9:	66 41 c7 06 00 00    	movw   $0x0,(%r14)
0d26   7773bf:	45 39 e0             	cmp    %r12d,%r8d
0d29   7773c2:	0f 8e 99 00 00 00    	jle    777461 <leaf_cut_from_buffer+0xdc8>
0d2f   7773c8:	44 89 c3             	mov    %r8d,%ebx
0d32   7773cb:	48 2b 9c 24 a0 00 00 00 	sub    0xa0(%rsp),%rbx
0d3a   7773d3:	45 31 ff             	xor    %r15d,%r15d
0d3d   7773d6:	49 63 c7             	movslq %r15d,%rax
0d40   7773d9:	4c 8d 24 40          	lea    (%rax,%rax,2),%r12
0d44   7773dd:	4e 8d 34 e6          	lea    (%rsi,%r12,8),%r14
0d48   7773e1:	49 83 c6 14          	add    $0x14,%r14
0d4c   7773e5:	4c 89 f0             	mov    %r14,%rax
0d4f   7773e8:	48 c1 e8 03          	shr    $0x3,%rax
0d53   7773ec:	8a 04 10             	mov    (%rax,%rdx,1),%al
0d56   7773ef:	84 c0                	test   %al,%al
0d58   7773f1:	75 24                	jne    777417 <leaf_cut_from_buffer+0xd7e>
0d5a   7773f3:	4a 8d 3c e6          	lea    (%rsi,%r12,8),%rdi
0d5e   7773f7:	48 83 c7 15          	add    $0x15,%rdi
0d62   7773fb:	48 89 f8             	mov    %rdi,%rax
0d65   7773fe:	48 c1 e8 03          	shr    $0x3,%rax
0d69   777402:	8a 04 10             	mov    (%rax,%rdx,1),%al
0d6c   777405:	84 c0                	test   %al,%al
0d6e   777407:	75 35                	jne    77743e <leaf_cut_from_buffer+0xda5>
0d70   777409:	66 45 01 2e          	add    %r13w,(%r14)
0d74   77740d:	49 ff c7             	inc    %r15
0d77   777410:	4c 39 fb             	cmp    %r15,%rbx
0d7a   777413:	75 c1                	jne    7773d6 <leaf_cut_from_buffer+0xd3d>
0d7c   777415:	eb 4a                	jmp    777461 <leaf_cut_from_buffer+0xdc8>
0d7e   777417:	44 89 f1             	mov    %r14d,%ecx
0d81   77741a:	80 e1 07             	and    $0x7,%cl
0d84   77741d:	38 c1                	cmp    %al,%cl
0d86   77741f:	7c d2                	jl     7773f3 <leaf_cut_from_buffer+0xd5a>
0d88   777421:	be 02 00 00 00       	mov    $0x2,%esi
0d8d   777426:	4c 89 f7             	mov    %r14,%rdi
0d90   777429:	e8 00 00 00 00       	call   77742e <leaf_cut_from_buffer+0xd95>	77742a: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0d95   77742e:	48 8b 34 24          	mov    (%rsp),%rsi
0d99   777432:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0da3   77743c:	eb b5                	jmp    7773f3 <leaf_cut_from_buffer+0xd5a>
0da5   77743e:	89 f9                	mov    %edi,%ecx
0da7   777440:	80 e1 07             	and    $0x7,%cl
0daa   777443:	38 c1                	cmp    %al,%cl
0dac   777445:	7c c2                	jl     777409 <leaf_cut_from_buffer+0xd70>
0dae   777447:	be 02 00 00 00       	mov    $0x2,%esi
0db3   77744c:	e8 00 00 00 00       	call   777451 <leaf_cut_from_buffer+0xdb8>	77744d: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0db8   777451:	48 8b 34 24          	mov    (%rsp),%rsi
0dbc   777455:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0dc6   77745f:	eb a8                	jmp    777409 <leaf_cut_from_buffer+0xd70>
0dc8   777461:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
0dcd   777466:	48 83 c3 04          	add    $0x4,%rbx
0dd1   77746a:	48 89 d8             	mov    %rbx,%rax
0dd4   77746d:	48 c1 e8 03          	shr    $0x3,%rax
0dd8   777471:	8a 04 10             	mov    (%rax,%rdx,1),%al
0ddb   777474:	84 c0                	test   %al,%al
0ddd   777476:	0f 85 1d 04 00 00    	jne    777899 <leaf_cut_from_buffer+0x1200>
0de3   77747c:	4c 89 ed             	mov    %r13,%rbp
0de6   77747f:	66 44 01 2b          	add    %r13w,(%rbx)
0dea   777483:	4c 8b b4 24 88 00 00 00 	mov    0x88(%rsp),%r14
0df2   77748b:	4c 89 f3             	mov    %r14,%rbx
0df5   77748e:	48 c1 eb 03          	shr    $0x3,%rbx
0df9   777492:	80 3c 13 00          	cmpb   $0x0,(%rbx,%rdx,1)
0dfd   777496:	74 08                	je     7774a0 <leaf_cut_from_buffer+0xe07>
0dff   777498:	4c 89 f7             	mov    %r14,%rdi
0e02   77749b:	e8 00 00 00 00       	call   7774a0 <leaf_cut_from_buffer+0xe07>	77749c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e07   7774a0:	49 8b 3e             	mov    (%r14),%rdi
0e0a   7774a3:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
0e0f   7774a8:	31 d2                	xor    %edx,%edx
0e11   7774aa:	e8 00 00 00 00       	call   7774af <leaf_cut_from_buffer+0xe16>	7774ab: R_X86_64_PLT32	do_balance_mark_leaf_dirty-0x4
0e16   7774af:	49 83 c6 10          	add    $0x10,%r14
0e1a   7774b3:	4d 89 f5             	mov    %r14,%r13
0e1d   7774b6:	49 c1 ed 03          	shr    $0x3,%r13
0e21   7774ba:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0e2b   7774c4:	41 80 7c 15 00 00    	cmpb   $0x0,0x0(%r13,%rdx,1)
0e31   7774ca:	74 12                	je     7774de <leaf_cut_from_buffer+0xe45>
0e33   7774cc:	4c 89 f7             	mov    %r14,%rdi
0e36   7774cf:	e8 00 00 00 00       	call   7774d4 <leaf_cut_from_buffer+0xe3b>	7774d0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e3b   7774d4:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0e45   7774de:	4d 8b 3e             	mov    (%r14),%r15
0e48   7774e1:	4d 85 ff             	test   %r15,%r15
0e4b   7774e4:	0f 84 db 00 00 00    	je     7775c5 <leaf_cut_from_buffer+0xf2c>
0e51   7774ea:	49 83 c7 28          	add    $0x28,%r15
0e55   7774ee:	4c 89 f8             	mov    %r15,%rax
0e58   7774f1:	48 c1 e8 03          	shr    $0x3,%rax
0e5c   7774f5:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0e60   7774f9:	74 12                	je     77750d <leaf_cut_from_buffer+0xe74>
0e62   7774fb:	4c 89 ff             	mov    %r15,%rdi
0e65   7774fe:	e8 00 00 00 00       	call   777503 <leaf_cut_from_buffer+0xe6a>	7774ff: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e6a   777503:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0e74   77750d:	4d 8b 3f             	mov    (%r15),%r15
0e77   777510:	4d 8d 67 18          	lea    0x18(%r15),%r12
0e7b   777514:	49 83 c7 02          	add    $0x2,%r15
0e7f   777518:	4c 89 f8             	mov    %r15,%rax
0e82   77751b:	48 c1 e8 03          	shr    $0x3,%rax
0e86   77751f:	8a 04 10             	mov    (%rax,%rdx,1),%al
0e89   777522:	84 c0                	test   %al,%al
0e8b   777524:	0f 85 bd 04 00 00    	jne    7779e7 <leaf_cut_from_buffer+0x134e>
0e91   77752a:	41 0f b7 07          	movzwl (%r15),%eax
0e95   77752e:	48 c1 e0 04          	shl    $0x4,%rax
0e99   777532:	49 01 c4             	add    %rax,%r12
0e9c   777535:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
0ea4   77753d:	4c 8d 78 18          	lea    0x18(%rax),%r15
0ea8   777541:	4c 89 f8             	mov    %r15,%rax
0eab   777544:	48 c1 e8 03          	shr    $0x3,%rax
0eaf   777548:	8a 04 10             	mov    (%rax,%rdx,1),%al
0eb2   77754b:	84 c0                	test   %al,%al
0eb4   77754d:	0f 85 bb 04 00 00    	jne    777a0e <leaf_cut_from_buffer+0x1375>
0eba   777553:	49 63 07             	movslq (%r15),%rax
0ebd   777556:	4d 8d 3c c4          	lea    (%r12,%rax,8),%r15
0ec1   77755a:	49 83 c7 04          	add    $0x4,%r15
0ec5   77755e:	4c 89 f8             	mov    %r15,%rax
0ec8   777561:	48 c1 e8 03          	shr    $0x3,%rax
0ecc   777565:	8a 04 10             	mov    (%rax,%rdx,1),%al
0ecf   777568:	84 c0                	test   %al,%al
0ed1   77756a:	0f 85 c6 04 00 00    	jne    777a36 <leaf_cut_from_buffer+0x139d>
0ed7   777570:	66 41 29 2f          	sub    %bp,(%r15)
0edb   777574:	80 3c 13 00          	cmpb   $0x0,(%rbx,%rdx,1)
0edf   777578:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
0ee7   777580:	74 12                	je     777594 <leaf_cut_from_buffer+0xefb>
0ee9   777582:	48 89 df             	mov    %rbx,%rdi
0eec   777585:	e8 00 00 00 00       	call   77758a <leaf_cut_from_buffer+0xef1>	777586: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ef1   77758a:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0efb   777594:	48 8b 1b             	mov    (%rbx),%rbx
0efe   777597:	41 80 7c 15 00 00    	cmpb   $0x0,0x0(%r13,%rdx,1)
0f04   77759d:	74 08                	je     7775a7 <leaf_cut_from_buffer+0xf0e>
0f06   77759f:	4c 89 f7             	mov    %r14,%rdi
0f09   7775a2:	e8 00 00 00 00       	call   7775a7 <leaf_cut_from_buffer+0xf0e>	7775a3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0f0e   7775a7:	49 8b 36             	mov    (%r14),%rsi
0f11   7775aa:	48 89 df             	mov    %rbx,%rdi
0f14   7775ad:	31 d2                	xor    %edx,%edx
0f16   7775af:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
0f1d   7775b6:	5b                   	pop    %rbx
0f1e   7775b7:	41 5c                	pop    %r12
0f20   7775b9:	41 5d                	pop    %r13
0f22   7775bb:	41 5e                	pop    %r14
0f24   7775bd:	41 5f                	pop    %r15
0f26   7775bf:	5d                   	pop    %rbp
0f27   7775c0:	e9 00 00 00 00       	jmp    7775c5 <leaf_cut_from_buffer+0xf2c>	7775c1: R_X86_64_PLT32	do_balance_mark_leaf_dirty-0x4
0f2c   7775c5:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
0f33   7775cc:	5b                   	pop    %rbx
0f34   7775cd:	41 5c                	pop    %r12
0f36   7775cf:	41 5d                	pop    %r13
0f38   7775d1:	41 5e                	pop    %r14
0f3a   7775d3:	41 5f                	pop    %r15
0f3c   7775d5:	5d                   	pop    %rbp
0f3d   7775d6:	c3                   	ret
0f3e   7775d7:	48 c1 ea 02          	shr    $0x2,%rdx
0f42   7775db:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
0f47   7775e0:	4c 8d 78 20          	lea    0x20(%rax),%r15
0f4b   7775e4:	4c 89 f8             	mov    %r15,%rax
0f4e   7775e7:	48 c1 e8 03          	shr    $0x3,%rax
0f52   7775eb:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
0f56   7775ef:	74 39                	je     77762a <leaf_cut_from_buffer+0xf91>
0f58   7775f1:	66 89 7c 24 48       	mov    %di,0x48(%rsp)
0f5d   7775f6:	4c 89 ff             	mov    %r15,%rdi
0f60   7775f9:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
0f65   7775fe:	4c 89 54 24 50       	mov    %r10,0x50(%rsp)
0f6a   777603:	e8 00 00 00 00       	call   777608 <leaf_cut_from_buffer+0xf6f>	777604: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0f6f   777608:	4c 8b 54 24 50       	mov    0x50(%rsp),%r10
0f74   77760d:	0f b7 7c 24 48       	movzwl 0x48(%rsp),%edi
0f79   777612:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
0f7e   777617:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
0f83   77761c:	4c 8b 04 24          	mov    (%rsp),%r8
0f87   777620:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0f91   77762a:	49 0f af 17          	imul   (%r15),%rdx
0f95   77762e:	48 01 ea             	add    %rbp,%rdx
0f98   777631:	48 b8 ff ff ff ff ff ff ff 0f 	movabs $0xfffffffffffffff,%rax
0fa2   77763b:	48 21 c2             	and    %rax,%rdx
0fa5   77763e:	4d 8d 7a 07          	lea    0x7(%r10),%r15
0fa9   777642:	8a 04 33             	mov    (%rbx,%rsi,1),%al
0fac   777645:	84 c0                	test   %al,%al
0fae   777647:	0f 85 3b 0e 00 00    	jne    778488 <leaf_cut_from_buffer+0x1def>
0fb4   77764d:	4c 09 f2             	or     %r14,%rdx
0fb7   777650:	4c 89 f8             	mov    %r15,%rax
0fba   777653:	48 c1 e8 03          	shr    $0x3,%rax
0fbe   777657:	8a 04 30             	mov    (%rax,%rsi,1),%al
0fc1   77765a:	84 c0                	test   %al,%al
0fc3   77765c:	0f 85 6f 0e 00 00    	jne    7784d1 <leaf_cut_from_buffer+0x1e38>
0fc9   777662:	49 89 12             	mov    %rdx,(%r10)
0fcc   777665:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0fd1   77766a:	4c 8d 70 01          	lea    0x1(%rax),%r14
0fd5   77766e:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
0fda   777673:	8a 04 30             	mov    (%rax,%rsi,1),%al
0fdd   777676:	84 c0                	test   %al,%al
0fdf   777678:	0f 85 96 0e 00 00    	jne    778514 <leaf_cut_from_buffer+0x1e7b>
0fe5   77767e:	4c 89 f0             	mov    %r14,%rax
0fe8   777681:	48 c1 e8 03          	shr    $0x3,%rax
0fec   777685:	8a 04 30             	mov    (%rax,%rsi,1),%al
0fef   777688:	84 c0                	test   %al,%al
0ff1   77768a:	0f 85 bf 0e 00 00    	jne    77854f <leaf_cut_from_buffer+0x1eb6>
0ff7   777690:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0ffc   777695:	0f b7 00             	movzwl (%rax),%eax
0fff   777698:	44 39 e8             	cmp    %r13d,%eax
1002   77769b:	0f 85 56 f8 ff ff    	jne    776ef7 <leaf_cut_from_buffer+0x85e>
1008   7776a1:	66 83 ff 01          	cmp    $0x1,%di
100c   7776a5:	0f 84 4c f8 ff ff    	je     776ef7 <leaf_cut_from_buffer+0x85e>
1012   7776ab:	4d 8d 70 10          	lea    0x10(%r8),%r14
1016   7776af:	4d 8d 78 11          	lea    0x11(%r8),%r15
101a   7776b3:	4c 89 f0             	mov    %r14,%rax
101d   7776b6:	48 c1 e8 03          	shr    $0x3,%rax
1021   7776ba:	8a 04 30             	mov    (%rax,%rsi,1),%al
1024   7776bd:	84 c0                	test   %al,%al
1026   7776bf:	0f 85 c1 0e 00 00    	jne    778586 <leaf_cut_from_buffer+0x1eed>
102c   7776c5:	4c 89 f8             	mov    %r15,%rax
102f   7776c8:	48 c1 e8 03          	shr    $0x3,%rax
1033   7776cc:	8a 04 30             	mov    (%rax,%rsi,1),%al
1036   7776cf:	84 c0                	test   %al,%al
1038   7776d1:	0f 85 e2 0e 00 00    	jne    7785b9 <leaf_cut_from_buffer+0x1f20>
103e   7776d7:	66 41 83 3e 00       	cmpw   $0x0,(%r14)
1043   7776dc:	0f 84 15 f8 ff ff    	je     776ef7 <leaf_cut_from_buffer+0x85e>
1049   7776e2:	4c 89 c3             	mov    %r8,%rbx
104c   7776e5:	e8 00 00 00 00       	call   7776ea <leaf_cut_from_buffer+0x1051>	7776e6: R_X86_64_PLT32	__asan_handle_no_return-0x4
1051   7776ea:	31 ff                	xor    %edi,%edi
1053   7776ec:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	7776ef: R_X86_64_32S	.rodata+0x495f40
105a   7776f3:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	7776f6: R_X86_64_32S	.rodata.str1.1+0x3bdeb
1061   7776fa:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	7776fd: R_X86_64_32S	.rodata+0x496920
1068   777701:	41 b8 ae 04 00 00    	mov    $0x4ae,%r8d
106e   777707:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	77770a: R_X86_64_32S	.rodata.str1.1+0x3bdeb
1075   77770e:	e9 08 0f 00 00       	jmp    77861b <leaf_cut_from_buffer+0x1f82>
107a   777713:	4d 8d 7e 03          	lea    0x3(%r14),%r15
107e   777717:	41 8a 04 34          	mov    (%r12,%rsi,1),%al
1082   77771b:	84 c0                	test   %al,%al
1084   77771d:	0f 85 d0 0f 00 00    	jne    7786f3 <leaf_cut_from_buffer+0x205a>
108a   777723:	44 01 eb             	add    %r13d,%ebx
108d   777726:	4c 89 f8             	mov    %r15,%rax
1090   777729:	48 c1 e8 03          	shr    $0x3,%rax
1094   77772d:	8a 04 30             	mov    (%rax,%rsi,1),%al
1097   777730:	84 c0                	test   %al,%al
1099   777732:	4c 8b 64 24 58       	mov    0x58(%rsp),%r12
109e   777737:	0f 85 e9 0f 00 00    	jne    778726 <leaf_cut_from_buffer+0x208d>
10a4   77773d:	41 89 1e             	mov    %ebx,(%r14)
10a7   777740:	e9 b2 f7 ff ff       	jmp    776ef7 <leaf_cut_from_buffer+0x85e>
10ac   777745:	89 f9                	mov    %edi,%ecx
10ae   777747:	80 e1 07             	and    $0x7,%cl
10b1   77774a:	fe c1                	inc    %cl
10b3   77774c:	38 c1                	cmp    %al,%cl
10b5   77774e:	0f 8c ef ef ff ff    	jl     776743 <leaf_cut_from_buffer+0xaa>
10bb   777754:	e8 00 00 00 00       	call   777759 <leaf_cut_from_buffer+0x10c0>	777755: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
10c0   777759:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
10ca   777763:	e9 db ef ff ff       	jmp    776743 <leaf_cut_from_buffer+0xaa>
10cf   777768:	89 f9                	mov    %edi,%ecx
10d1   77776a:	80 e1 07             	and    $0x7,%cl
10d4   77776d:	38 c1                	cmp    %al,%cl
10d6   77776f:	0f 8c 19 f0 ff ff    	jl     77678e <leaf_cut_from_buffer+0xf5>
10dc   777775:	be 02 00 00 00       	mov    $0x2,%esi
10e1   77777a:	e8 00 00 00 00       	call   77777f <leaf_cut_from_buffer+0x10e6>	77777b: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
10e6   77777f:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
10eb   777784:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
10f0   777789:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
10fa   777793:	e9 f6 ef ff ff       	jmp    77678e <leaf_cut_from_buffer+0xf5>
10ff   777798:	44 89 f1             	mov    %r14d,%ecx
1102   77779b:	80 e1 07             	and    $0x7,%cl
1105   77779e:	38 c1                	cmp    %al,%cl
1107   7777a0:	0f 8c fa ef ff ff    	jl     7767a0 <leaf_cut_from_buffer+0x107>
110d   7777a6:	be 02 00 00 00       	mov    $0x2,%esi
1112   7777ab:	4c 89 f7             	mov    %r14,%rdi
1115   7777ae:	e8 00 00 00 00       	call   7777b3 <leaf_cut_from_buffer+0x111a>	7777af: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
111a   7777b3:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
111f   7777b8:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1124   7777bd:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
112e   7777c7:	e9 d4 ef ff ff       	jmp    7767a0 <leaf_cut_from_buffer+0x107>
1133   7777cc:	44 89 f1             	mov    %r14d,%ecx
1136   7777cf:	80 e1 07             	and    $0x7,%cl
1139   7777d2:	38 c1                	cmp    %al,%cl
113b   7777d4:	0f 8c db fa ff ff    	jl     7772b5 <leaf_cut_from_buffer+0xc1c>
1141   7777da:	be 02 00 00 00       	mov    $0x2,%esi
1146   7777df:	4c 89 f7             	mov    %r14,%rdi
1149   7777e2:	e8 00 00 00 00       	call   7777e7 <leaf_cut_from_buffer+0x114e>	7777e3: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
114e   7777e7:	48 8b 34 24          	mov    (%rsp),%rsi
1152   7777eb:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
115c   7777f5:	e9 bb fa ff ff       	jmp    7772b5 <leaf_cut_from_buffer+0xc1c>
1161   7777fa:	44 89 f9             	mov    %r15d,%ecx
1164   7777fd:	80 e1 07             	and    $0x7,%cl
1167   777800:	38 c1                	cmp    %al,%cl
1169   777802:	0f 8c c4 fa ff ff    	jl     7772cc <leaf_cut_from_buffer+0xc33>
116f   777808:	be 02 00 00 00       	mov    $0x2,%esi
1174   77780d:	4c 89 ff             	mov    %r15,%rdi
1177   777810:	e8 00 00 00 00       	call   777815 <leaf_cut_from_buffer+0x117c>	777811: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
117c   777815:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1181   77781a:	48 8b 34 24          	mov    (%rsp),%rsi
1185   77781e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
118f   777828:	e9 9f fa ff ff       	jmp    7772cc <leaf_cut_from_buffer+0xc33>
1194   77782d:	89 f9                	mov    %edi,%ecx
1196   77782f:	80 e1 07             	and    $0x7,%cl
1199   777832:	38 c1                	cmp    %al,%cl
119b   777834:	0f 8c b2 fa ff ff    	jl     7772ec <leaf_cut_from_buffer+0xc53>
11a1   77783a:	be 02 00 00 00       	mov    $0x2,%esi
11a6   77783f:	e8 00 00 00 00       	call   777844 <leaf_cut_from_buffer+0x11ab>	777840: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
11ab   777844:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
11b0   777849:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
11b5   77784e:	48 8b 34 24          	mov    (%rsp),%rsi
11b9   777852:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
11c3   77785c:	e9 8b fa ff ff       	jmp    7772ec <leaf_cut_from_buffer+0xc53>
11c8   777861:	44 89 f1             	mov    %r14d,%ecx
11cb   777864:	80 e1 07             	and    $0x7,%cl
11ce   777867:	38 c1                	cmp    %al,%cl
11d0   777869:	0f 8c 8f fa ff ff    	jl     7772fe <leaf_cut_from_buffer+0xc65>
11d6   77786f:	be 02 00 00 00       	mov    $0x2,%esi
11db   777874:	4c 89 f7             	mov    %r14,%rdi
11de   777877:	e8 00 00 00 00       	call   77787c <leaf_cut_from_buffer+0x11e3>	777878: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
11e3   77787c:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
11e8   777881:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
11ed   777886:	48 8b 34 24          	mov    (%rsp),%rsi
11f1   77788a:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
11fb   777894:	e9 65 fa ff ff       	jmp    7772fe <leaf_cut_from_buffer+0xc65>
1200   777899:	89 d9                	mov    %ebx,%ecx
1202   77789b:	80 e1 07             	and    $0x7,%cl
1205   77789e:	fe c1                	inc    %cl
1207   7778a0:	38 c1                	cmp    %al,%cl
1209   7778a2:	0f 8c d4 fb ff ff    	jl     77747c <leaf_cut_from_buffer+0xde3>
120f   7778a8:	48 89 df             	mov    %rbx,%rdi
1212   7778ab:	e8 00 00 00 00       	call   7778b0 <leaf_cut_from_buffer+0x1217>	7778ac: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
1217   7778b0:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1221   7778ba:	e9 bd fb ff ff       	jmp    77747c <leaf_cut_from_buffer+0xde3>
1226   7778bf:	44 89 f1             	mov    %r14d,%ecx
1229   7778c2:	80 e1 07             	and    $0x7,%cl
122c   7778c5:	38 c1                	cmp    %al,%cl
122e   7778c7:	0f 8c 5a f6 ff ff    	jl     776f27 <leaf_cut_from_buffer+0x88e>
1234   7778cd:	be 02 00 00 00       	mov    $0x2,%esi
1239   7778d2:	4c 89 f7             	mov    %r14,%rdi
123c   7778d5:	e8 00 00 00 00       	call   7778da <leaf_cut_from_buffer+0x1241>	7778d6: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1241   7778da:	4c 8b 04 24          	mov    (%rsp),%r8
1245   7778de:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
124f   7778e8:	e9 3a f6 ff ff       	jmp    776f27 <leaf_cut_from_buffer+0x88e>
1254   7778ed:	44 89 f9             	mov    %r15d,%ecx
1257   7778f0:	80 e1 07             	and    $0x7,%cl
125a   7778f3:	38 c1                	cmp    %al,%cl
125c   7778f5:	0f 8c 3e f6 ff ff    	jl     776f39 <leaf_cut_from_buffer+0x8a0>
1262   7778fb:	be 02 00 00 00       	mov    $0x2,%esi
1267   777900:	4c 89 ff             	mov    %r15,%rdi
126a   777903:	e8 00 00 00 00       	call   777908 <leaf_cut_from_buffer+0x126f>	777904: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
126f   777908:	4c 8b 04 24          	mov    (%rsp),%r8
1273   77790c:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
127d   777916:	e9 1e f6 ff ff       	jmp    776f39 <leaf_cut_from_buffer+0x8a0>
1282   77791b:	44 89 f1             	mov    %r14d,%ecx
1285   77791e:	80 e1 07             	and    $0x7,%cl
1288   777921:	38 c1                	cmp    %al,%cl
128a   777923:	0f 8c b4 ee ff ff    	jl     7767dd <leaf_cut_from_buffer+0x144>
1290   777929:	be 08 00 00 00       	mov    $0x8,%esi
1295   77792e:	4c 89 f7             	mov    %r14,%rdi
1298   777931:	e8 00 00 00 00       	call   777936 <leaf_cut_from_buffer+0x129d>	777932: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
129d   777936:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
12a2   77793b:	4c 8b 04 24          	mov    (%rsp),%r8
12a6   77793f:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
12b0   777949:	e9 8f ee ff ff       	jmp    7767dd <leaf_cut_from_buffer+0x144>
12b5   77794e:	44 89 f9             	mov    %r15d,%ecx
12b8   777951:	80 e1 07             	and    $0x7,%cl
12bb   777954:	38 c1                	cmp    %al,%cl
12bd   777956:	0f 8c 93 ee ff ff    	jl     7767ef <leaf_cut_from_buffer+0x156>
12c3   77795c:	be 08 00 00 00       	mov    $0x8,%esi
12c8   777961:	4c 89 ff             	mov    %r15,%rdi
12cb   777964:	e8 00 00 00 00       	call   777969 <leaf_cut_from_buffer+0x12d0>	777965: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
12d0   777969:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
12d5   77796e:	4c 8b 04 24          	mov    (%rsp),%r8
12d9   777972:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
12e3   77797c:	e9 6e ee ff ff       	jmp    7767ef <leaf_cut_from_buffer+0x156>
12e8   777981:	44 89 f1             	mov    %r14d,%ecx
12eb   777984:	80 e1 07             	and    $0x7,%cl
12ee   777987:	38 c1                	cmp    %al,%cl
12f0   777989:	0f 8c 8f f9 ff ff    	jl     77731e <leaf_cut_from_buffer+0xc85>
12f6   77798f:	be 08 00 00 00       	mov    $0x8,%esi
12fb   777994:	4c 89 f7             	mov    %r14,%rdi
12fe   777997:	e8 00 00 00 00       	call   77799c <leaf_cut_from_buffer+0x1303>	777998: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1303   77799c:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1308   7779a1:	48 8b 34 24          	mov    (%rsp),%rsi
130c   7779a5:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1316   7779af:	e9 6a f9 ff ff       	jmp    77731e <leaf_cut_from_buffer+0xc85>
131b   7779b4:	44 89 f9             	mov    %r15d,%ecx
131e   7779b7:	80 e1 07             	and    $0x7,%cl
1321   7779ba:	38 c1                	cmp    %al,%cl
1323   7779bc:	0f 8c 6e f9 ff ff    	jl     777330 <leaf_cut_from_buffer+0xc97>
1329   7779c2:	be 08 00 00 00       	mov    $0x8,%esi
132e   7779c7:	4c 89 ff             	mov    %r15,%rdi
1331   7779ca:	e8 00 00 00 00       	call   7779cf <leaf_cut_from_buffer+0x1336>	7779cb: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1336   7779cf:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
133b   7779d4:	48 8b 34 24          	mov    (%rsp),%rsi
133f   7779d8:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1349   7779e2:	e9 49 f9 ff ff       	jmp    777330 <leaf_cut_from_buffer+0xc97>
134e   7779e7:	44 89 f9             	mov    %r15d,%ecx
1351   7779ea:	80 e1 07             	and    $0x7,%cl
1354   7779ed:	fe c1                	inc    %cl
1356   7779ef:	38 c1                	cmp    %al,%cl
1358   7779f1:	0f 8c 33 fb ff ff    	jl     77752a <leaf_cut_from_buffer+0xe91>
135e   7779f7:	4c 89 ff             	mov    %r15,%rdi
1361   7779fa:	e8 00 00 00 00       	call   7779ff <leaf_cut_from_buffer+0x1366>	7779fb: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
1366   7779ff:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1370   777a09:	e9 1c fb ff ff       	jmp    77752a <leaf_cut_from_buffer+0xe91>
1375   777a0e:	44 89 f9             	mov    %r15d,%ecx
1378   777a11:	80 e1 07             	and    $0x7,%cl
137b   777a14:	80 c1 03             	add    $0x3,%cl
137e   777a17:	38 c1                	cmp    %al,%cl
1380   777a19:	0f 8c 34 fb ff ff    	jl     777553 <leaf_cut_from_buffer+0xeba>
1386   777a1f:	4c 89 ff             	mov    %r15,%rdi
1389   777a22:	e8 00 00 00 00       	call   777a27 <leaf_cut_from_buffer+0x138e>	777a23: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
138e   777a27:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1398   777a31:	e9 1d fb ff ff       	jmp    777553 <leaf_cut_from_buffer+0xeba>
139d   777a36:	44 89 f9             	mov    %r15d,%ecx
13a0   777a39:	80 e1 07             	and    $0x7,%cl
13a3   777a3c:	fe c1                	inc    %cl
13a5   777a3e:	38 c1                	cmp    %al,%cl
13a7   777a40:	0f 8c 2a fb ff ff    	jl     777570 <leaf_cut_from_buffer+0xed7>
13ad   777a46:	4c 89 ff             	mov    %r15,%rdi
13b0   777a49:	e8 00 00 00 00       	call   777a4e <leaf_cut_from_buffer+0x13b5>	777a4a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
13b5   777a4e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
13bf   777a58:	e9 13 fb ff ff       	jmp    777570 <leaf_cut_from_buffer+0xed7>
13c4   777a5d:	44 89 f1             	mov    %r14d,%ecx
13c7   777a60:	80 e1 07             	and    $0x7,%cl
13ca   777a63:	38 c1                	cmp    %al,%cl
13cc   777a65:	0f 8c f8 f4 ff ff    	jl     776f63 <leaf_cut_from_buffer+0x8ca>
13d2   777a6b:	be 02 00 00 00       	mov    $0x2,%esi
13d7   777a70:	4c 89 f7             	mov    %r14,%rdi
13da   777a73:	e8 00 00 00 00       	call   777a78 <leaf_cut_from_buffer+0x13df>	777a74: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
13df   777a78:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
13e9   777a82:	e9 dc f4 ff ff       	jmp    776f63 <leaf_cut_from_buffer+0x8ca>
13ee   777a87:	44 89 f9             	mov    %r15d,%ecx
13f1   777a8a:	80 e1 07             	and    $0x7,%cl
13f4   777a8d:	38 c1                	cmp    %al,%cl
13f6   777a8f:	0f 8c e0 f4 ff ff    	jl     776f75 <leaf_cut_from_buffer+0x8dc>
13fc   777a95:	be 02 00 00 00       	mov    $0x2,%esi
1401   777a9a:	4c 89 ff             	mov    %r15,%rdi
1404   777a9d:	e8 00 00 00 00       	call   777aa2 <leaf_cut_from_buffer+0x1409>	777a9e: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1409   777aa2:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1413   777aac:	e9 c4 f4 ff ff       	jmp    776f75 <leaf_cut_from_buffer+0x8dc>
1418   777ab1:	44 89 d1             	mov    %r10d,%ecx
141b   777ab4:	80 e1 07             	and    $0x7,%cl
141e   777ab7:	38 c1                	cmp    %al,%cl
1420   777ab9:	0f 8c 11 ee ff ff    	jl     7768d0 <leaf_cut_from_buffer+0x237>
1426   777abf:	be 02 00 00 00       	mov    $0x2,%esi
142b   777ac4:	4c 89 d7             	mov    %r10,%rdi
142e   777ac7:	4c 89 d3             	mov    %r10,%rbx
1431   777aca:	4d 89 df             	mov    %r11,%r15
1434   777acd:	e8 00 00 00 00       	call   777ad2 <leaf_cut_from_buffer+0x1439>	777ace: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1439   777ad2:	4d 89 fb             	mov    %r15,%r11
143c   777ad5:	49 89 da             	mov    %rbx,%r10
143f   777ad8:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1444   777add:	4c 8b 04 24          	mov    (%rsp),%r8
1448   777ae1:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1452   777aeb:	e9 e0 ed ff ff       	jmp    7768d0 <leaf_cut_from_buffer+0x237>
1457   777af0:	44 89 f1             	mov    %r14d,%ecx
145a   777af3:	80 e1 07             	and    $0x7,%cl
145d   777af6:	38 c1                	cmp    %al,%cl
145f   777af8:	0f 8c e4 ed ff ff    	jl     7768e2 <leaf_cut_from_buffer+0x249>
1465   777afe:	be 02 00 00 00       	mov    $0x2,%esi
146a   777b03:	4c 89 f7             	mov    %r14,%rdi
146d   777b06:	4c 89 d3             	mov    %r10,%rbx
1470   777b09:	4d 89 de             	mov    %r11,%r14
1473   777b0c:	e8 00 00 00 00       	call   777b11 <leaf_cut_from_buffer+0x1478>	777b0d: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1478   777b11:	4d 89 f3             	mov    %r14,%r11
147b   777b14:	49 89 da             	mov    %rbx,%r10
147e   777b17:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1483   777b1c:	4c 8b 04 24          	mov    (%rsp),%r8
1487   777b20:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1491   777b2a:	e9 b3 ed ff ff       	jmp    7768e2 <leaf_cut_from_buffer+0x249>
1496   777b2f:	44 89 f1             	mov    %r14d,%ecx
1499   777b32:	80 e1 07             	and    $0x7,%cl
149c   777b35:	38 c1                	cmp    %al,%cl
149e   777b37:	0f 8c 6a f8 ff ff    	jl     7773a7 <leaf_cut_from_buffer+0xd0e>
14a4   777b3d:	be 02 00 00 00       	mov    $0x2,%esi
14a9   777b42:	4c 89 f7             	mov    %r14,%rdi
14ac   777b45:	e8 00 00 00 00       	call   777b4a <leaf_cut_from_buffer+0x14b1>	777b46: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
14b1   777b4a:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
14b6   777b4f:	48 8b 34 24          	mov    (%rsp),%rsi
14ba   777b53:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
14c4   777b5d:	e9 45 f8 ff ff       	jmp    7773a7 <leaf_cut_from_buffer+0xd0e>
14c9   777b62:	44 89 f9             	mov    %r15d,%ecx
14cc   777b65:	80 e1 07             	and    $0x7,%cl
14cf   777b68:	38 c1                	cmp    %al,%cl
14d1   777b6a:	0f 8c 49 f8 ff ff    	jl     7773b9 <leaf_cut_from_buffer+0xd20>
14d7   777b70:	be 02 00 00 00       	mov    $0x2,%esi
14dc   777b75:	4c 89 ff             	mov    %r15,%rdi
14df   777b78:	e8 00 00 00 00       	call   777b7d <leaf_cut_from_buffer+0x14e4>	777b79: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
14e4   777b7d:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
14e9   777b82:	48 8b 34 24          	mov    (%rsp),%rsi
14ed   777b86:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
14f7   777b90:	e9 24 f8 ff ff       	jmp    7773b9 <leaf_cut_from_buffer+0xd20>
14fc   777b95:	44 89 f1             	mov    %r14d,%ecx
14ff   777b98:	80 e1 07             	and    $0x7,%cl
1502   777b9b:	38 c1                	cmp    %al,%cl
1504   777b9d:	0f 8c c0 ec ff ff    	jl     776863 <leaf_cut_from_buffer+0x1ca>
150a   777ba3:	be 04 00 00 00       	mov    $0x4,%esi
150f   777ba8:	4c 89 f7             	mov    %r14,%rdi
1512   777bab:	e8 00 00 00 00       	call   777bb0 <leaf_cut_from_buffer+0x1517>	777bac: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1517   777bb0:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
151c   777bb5:	4c 8b 04 24          	mov    (%rsp),%r8
1520   777bb9:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
152a   777bc3:	e9 9b ec ff ff       	jmp    776863 <leaf_cut_from_buffer+0x1ca>
152f   777bc8:	44 89 f9             	mov    %r15d,%ecx
1532   777bcb:	80 e1 07             	and    $0x7,%cl
1535   777bce:	38 c1                	cmp    %al,%cl
1537   777bd0:	0f 8c 9f ec ff ff    	jl     776875 <leaf_cut_from_buffer+0x1dc>
153d   777bd6:	be 04 00 00 00       	mov    $0x4,%esi
1542   777bdb:	4c 89 ff             	mov    %r15,%rdi
1545   777bde:	e8 00 00 00 00       	call   777be3 <leaf_cut_from_buffer+0x154a>	777bdf: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
154a   777be3:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
154f   777be8:	4c 8b 04 24          	mov    (%rsp),%r8
1553   777bec:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
155d   777bf6:	e9 7a ec ff ff       	jmp    776875 <leaf_cut_from_buffer+0x1dc>
1562   777bfb:	44 89 f1             	mov    %r14d,%ecx
1565   777bfe:	80 e1 07             	and    $0x7,%cl
1568   777c01:	38 c1                	cmp    %al,%cl
156a   777c03:	0f 8c 60 f7 ff ff    	jl     777369 <leaf_cut_from_buffer+0xcd0>
1570   777c09:	be 04 00 00 00       	mov    $0x4,%esi
1575   777c0e:	4c 89 f7             	mov    %r14,%rdi
1578   777c11:	e8 00 00 00 00       	call   777c16 <leaf_cut_from_buffer+0x157d>	777c12: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
157d   777c16:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1582   777c1b:	48 8b 34 24          	mov    (%rsp),%rsi
1586   777c1f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1590   777c29:	e9 3b f7 ff ff       	jmp    777369 <leaf_cut_from_buffer+0xcd0>
1595   777c2e:	44 89 f9             	mov    %r15d,%ecx
1598   777c31:	80 e1 07             	and    $0x7,%cl
159b   777c34:	38 c1                	cmp    %al,%cl
159d   777c36:	0f 8c 3f f7 ff ff    	jl     77737b <leaf_cut_from_buffer+0xce2>
15a3   777c3c:	be 04 00 00 00       	mov    $0x4,%esi
15a8   777c41:	4c 89 ff             	mov    %r15,%rdi
15ab   777c44:	e8 00 00 00 00       	call   777c49 <leaf_cut_from_buffer+0x15b0>	777c45: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
15b0   777c49:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
15b5   777c4e:	48 8b 34 24          	mov    (%rsp),%rsi
15b9   777c52:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
15c3   777c5c:	e9 1a f7 ff ff       	jmp    77737b <leaf_cut_from_buffer+0xce2>
15c8   777c61:	89 f9                	mov    %edi,%ecx
15ca   777c63:	80 e1 07             	and    $0x7,%cl
15cd   777c66:	38 c1                	cmp    %al,%cl
15cf   777c68:	0f 8c b1 ec ff ff    	jl     77691f <leaf_cut_from_buffer+0x286>
15d5   777c6e:	be 02 00 00 00       	mov    $0x2,%esi
15da   777c73:	4c 89 d3             	mov    %r10,%rbx
15dd   777c76:	4d 89 df             	mov    %r11,%r15
15e0   777c79:	e8 00 00 00 00       	call   777c7e <leaf_cut_from_buffer+0x15e5>	777c7a: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
15e5   777c7e:	4d 89 fb             	mov    %r15,%r11
15e8   777c81:	49 89 da             	mov    %rbx,%r10
15eb   777c84:	4c 8b 04 24          	mov    (%rsp),%r8
15ef   777c88:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
15f9   777c92:	e9 88 ec ff ff       	jmp    77691f <leaf_cut_from_buffer+0x286>
15fe   777c97:	44 89 f1             	mov    %r14d,%ecx
1601   777c9a:	80 e1 07             	and    $0x7,%cl
1604   777c9d:	38 c1                	cmp    %al,%cl
1606   777c9f:	0f 8c 8c ec ff ff    	jl     776931 <leaf_cut_from_buffer+0x298>
160c   777ca5:	be 02 00 00 00       	mov    $0x2,%esi
1611   777caa:	4c 89 f7             	mov    %r14,%rdi
1614   777cad:	4c 89 d3             	mov    %r10,%rbx
1617   777cb0:	4d 89 de             	mov    %r11,%r14
161a   777cb3:	e8 00 00 00 00       	call   777cb8 <leaf_cut_from_buffer+0x161f>	777cb4: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
161f   777cb8:	4d 89 f3             	mov    %r14,%r11
1622   777cbb:	49 89 da             	mov    %rbx,%r10
1625   777cbe:	4c 8b 04 24          	mov    (%rsp),%r8
1629   777cc2:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1633   777ccc:	e9 60 ec ff ff       	jmp    776931 <leaf_cut_from_buffer+0x298>
1638   777cd1:	44 89 f1             	mov    %r14d,%ecx
163b   777cd4:	80 e1 07             	and    $0x7,%cl
163e   777cd7:	38 c1                	cmp    %al,%cl
1640   777cd9:	0f 8c 94 ec ff ff    	jl     776973 <leaf_cut_from_buffer+0x2da>
1646   777cdf:	be 02 00 00 00       	mov    $0x2,%esi
164b   777ce4:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
1650   777ce9:	4c 89 f7             	mov    %r14,%rdi
1653   777cec:	4c 89 d3             	mov    %r10,%rbx
1656   777cef:	4d 89 cc             	mov    %r9,%r12
1659   777cf2:	4c 89 5c 24 30       	mov    %r11,0x30(%rsp)
165e   777cf7:	e8 00 00 00 00       	call   777cfc <leaf_cut_from_buffer+0x1663>	777cf8: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1663   777cfc:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
1668   777d01:	4c 8b 5c 24 30       	mov    0x30(%rsp),%r11
166d   777d06:	4d 89 e1             	mov    %r12,%r9
1670   777d09:	49 89 da             	mov    %rbx,%r10
1673   777d0c:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
167d   777d16:	e9 58 ec ff ff       	jmp    776973 <leaf_cut_from_buffer+0x2da>
1682   777d1b:	44 89 f9             	mov    %r15d,%ecx
1685   777d1e:	80 e1 07             	and    $0x7,%cl
1688   777d21:	38 c1                	cmp    %al,%cl
168a   777d23:	0f 8c 5c ec ff ff    	jl     776985 <leaf_cut_from_buffer+0x2ec>
1690   777d29:	be 02 00 00 00       	mov    $0x2,%esi
1695   777d2e:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
169a   777d33:	4c 89 ff             	mov    %r15,%rdi
169d   777d36:	4c 89 d3             	mov    %r10,%rbx
16a0   777d39:	4d 89 cf             	mov    %r9,%r15
16a3   777d3c:	4d 89 dc             	mov    %r11,%r12
16a6   777d3f:	e8 00 00 00 00       	call   777d44 <leaf_cut_from_buffer+0x16ab>	777d40: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
16ab   777d44:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
16b0   777d49:	4d 89 e3             	mov    %r12,%r11
16b3   777d4c:	4d 89 f9             	mov    %r15,%r9
16b6   777d4f:	49 89 da             	mov    %rbx,%r10
16b9   777d52:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
16c3   777d5c:	e9 24 ec ff ff       	jmp    776985 <leaf_cut_from_buffer+0x2ec>
16c8   777d61:	44 89 f1             	mov    %r14d,%ecx
16cb   777d64:	80 e1 07             	and    $0x7,%cl
16ce   777d67:	38 c1                	cmp    %al,%cl
16d0   777d69:	0f 8c 48 ec ff ff    	jl     7769b7 <leaf_cut_from_buffer+0x31e>
16d6   777d6f:	be 02 00 00 00       	mov    $0x2,%esi
16db   777d74:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
16e0   777d79:	4c 89 f7             	mov    %r14,%rdi
16e3   777d7c:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
16e8   777d81:	4d 89 cc             	mov    %r9,%r12
16eb   777d84:	4c 89 5c 24 30       	mov    %r11,0x30(%rsp)
16f0   777d89:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
16f5   777d8e:	e8 00 00 00 00       	call   777d93 <leaf_cut_from_buffer+0x16fa>	777d8f: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
16fa   777d93:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
16ff   777d98:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
1704   777d9d:	4c 8b 5c 24 30       	mov    0x30(%rsp),%r11
1709   777da2:	4d 89 e1             	mov    %r12,%r9
170c   777da5:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
1711   777daa:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
171b   777db4:	e9 fe eb ff ff       	jmp    7769b7 <leaf_cut_from_buffer+0x31e>
1720   777db9:	44 89 f9             	mov    %r15d,%ecx
1723   777dbc:	80 e1 07             	and    $0x7,%cl
1726   777dbf:	38 c1                	cmp    %al,%cl
1728   777dc1:	0f 8c 07 ec ff ff    	jl     7769ce <leaf_cut_from_buffer+0x335>
172e   777dc7:	be 02 00 00 00       	mov    $0x2,%esi
1733   777dcc:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
1738   777dd1:	4c 89 ff             	mov    %r15,%rdi
173b   777dd4:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
1740   777dd9:	4d 89 cc             	mov    %r9,%r12
1743   777ddc:	4d 89 dd             	mov    %r11,%r13
1746   777ddf:	49 89 d7             	mov    %rdx,%r15
1749   777de2:	e8 00 00 00 00       	call   777de7 <leaf_cut_from_buffer+0x174e>	777de3: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
174e   777de7:	4c 89 fa             	mov    %r15,%rdx
1751   777dea:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
1756   777def:	4d 89 eb             	mov    %r13,%r11
1759   777df2:	4d 89 e1             	mov    %r12,%r9
175c   777df5:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
1761   777dfa:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
176b   777e04:	e9 c5 eb ff ff       	jmp    7769ce <leaf_cut_from_buffer+0x335>
1770   777e09:	44 89 f1             	mov    %r14d,%ecx
1773   777e0c:	80 e1 07             	and    $0x7,%cl
1776   777e0f:	38 c1                	cmp    %al,%cl
1778   777e11:	0f 8c 2b ed ff ff    	jl     776b42 <leaf_cut_from_buffer+0x4a9>
177e   777e17:	be 02 00 00 00       	mov    $0x2,%esi
1783   777e1c:	4c 89 f7             	mov    %r14,%rdi
1786   777e1f:	e8 00 00 00 00       	call   777e24 <leaf_cut_from_buffer+0x178b>	777e20: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
178b   777e24:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1790   777e29:	4c 8b 04 24          	mov    (%rsp),%r8
1794   777e2d:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
179e   777e37:	e9 06 ed ff ff       	jmp    776b42 <leaf_cut_from_buffer+0x4a9>
17a3   777e3c:	44 89 f9             	mov    %r15d,%ecx
17a6   777e3f:	80 e1 07             	and    $0x7,%cl
17a9   777e42:	38 c1                	cmp    %al,%cl
17ab   777e44:	0f 8c 18 ed ff ff    	jl     776b62 <leaf_cut_from_buffer+0x4c9>
17b1   777e4a:	be 02 00 00 00       	mov    $0x2,%esi
17b6   777e4f:	4c 89 ff             	mov    %r15,%rdi
17b9   777e52:	e8 00 00 00 00       	call   777e57 <leaf_cut_from_buffer+0x17be>	777e53: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
17be   777e57:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
17c3   777e5c:	4c 8b 04 24          	mov    (%rsp),%r8
17c7   777e60:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
17d1   777e6a:	e9 f3 ec ff ff       	jmp    776b62 <leaf_cut_from_buffer+0x4c9>
17d6   777e6f:	44 89 d1             	mov    %r10d,%ecx
17d9   777e72:	80 e1 07             	and    $0x7,%cl
17dc   777e75:	38 c1                	cmp    %al,%cl
17de   777e77:	0f 8c 4c ee ff ff    	jl     776cc9 <leaf_cut_from_buffer+0x630>
17e4   777e7d:	be 02 00 00 00       	mov    $0x2,%esi
17e9   777e82:	4c 89 d7             	mov    %r10,%rdi
17ec   777e85:	4c 89 d3             	mov    %r10,%rbx
17ef   777e88:	4d 89 ce             	mov    %r9,%r14
17f2   777e8b:	4d 89 c4             	mov    %r8,%r12
17f5   777e8e:	49 89 d5             	mov    %rdx,%r13
17f8   777e91:	e8 00 00 00 00       	call   777e96 <leaf_cut_from_buffer+0x17fd>	777e92: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
17fd   777e96:	4c 89 ea             	mov    %r13,%rdx
1800   777e99:	4d 89 e0             	mov    %r12,%r8
1803   777e9c:	4d 89 f1             	mov    %r14,%r9
1806   777e9f:	49 89 da             	mov    %rbx,%r10
1809   777ea2:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1813   777eac:	e9 18 ee ff ff       	jmp    776cc9 <leaf_cut_from_buffer+0x630>
1818   777eb1:	44 89 f9             	mov    %r15d,%ecx
181b   777eb4:	80 e1 07             	and    $0x7,%cl
181e   777eb7:	38 c1                	cmp    %al,%cl
1820   777eb9:	0f 8c 27 ee ff ff    	jl     776ce6 <leaf_cut_from_buffer+0x64d>
1826   777ebf:	be 02 00 00 00       	mov    $0x2,%esi
182b   777ec4:	4c 89 ff             	mov    %r15,%rdi
182e   777ec7:	4d 89 d6             	mov    %r10,%r14
1831   777eca:	4d 89 cf             	mov    %r9,%r15
1834   777ecd:	4d 89 c4             	mov    %r8,%r12
1837   777ed0:	48 89 d5             	mov    %rdx,%rbp
183a   777ed3:	e8 00 00 00 00       	call   777ed8 <leaf_cut_from_buffer+0x183f>	777ed4: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
183f   777ed8:	48 89 ea             	mov    %rbp,%rdx
1842   777edb:	4d 89 e0             	mov    %r12,%r8
1845   777ede:	4d 89 f9             	mov    %r15,%r9
1848   777ee1:	4d 89 f2             	mov    %r14,%r10
184b   777ee4:	e9 fd ed ff ff       	jmp    776ce6 <leaf_cut_from_buffer+0x64d>
1850   777ee9:	89 f9                	mov    %edi,%ecx
1852   777eeb:	80 e1 07             	and    $0x7,%cl
1855   777eee:	38 c1                	cmp    %al,%cl
1857   777ef0:	0f 8c 3d ee ff ff    	jl     776d33 <leaf_cut_from_buffer+0x69a>
185d   777ef6:	be 02 00 00 00       	mov    $0x2,%esi
1862   777efb:	e8 00 00 00 00       	call   777f00 <leaf_cut_from_buffer+0x1867>	777efc: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1867   777f00:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
186c   777f05:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
1876   777f0f:	e9 1f ee ff ff       	jmp    776d33 <leaf_cut_from_buffer+0x69a>
187b   777f14:	44 89 f9             	mov    %r15d,%ecx
187e   777f17:	80 e1 07             	and    $0x7,%cl
1881   777f1a:	38 c1                	cmp    %al,%cl
1883   777f1c:	0f 8c 26 ee ff ff    	jl     776d48 <leaf_cut_from_buffer+0x6af>
1889   777f22:	be 02 00 00 00       	mov    $0x2,%esi
188e   777f27:	4c 89 ff             	mov    %r15,%rdi
1891   777f2a:	e8 00 00 00 00       	call   777f2f <leaf_cut_from_buffer+0x1896>	777f2b: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1896   777f2f:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
189b   777f34:	e9 0f ee ff ff       	jmp    776d48 <leaf_cut_from_buffer+0x6af>
18a0   777f39:	89 f9                	mov    %edi,%ecx
18a2   777f3b:	80 e1 07             	and    $0x7,%cl
18a5   777f3e:	38 c1                	cmp    %al,%cl
18a7   777f40:	0f 8c 46 ee ff ff    	jl     776d8c <leaf_cut_from_buffer+0x6f3>
18ad   777f46:	be 02 00 00 00       	mov    $0x2,%esi
18b2   777f4b:	e8 00 00 00 00       	call   777f50 <leaf_cut_from_buffer+0x18b7>	777f4c: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
18b7   777f50:	4c 8b 04 24          	mov    (%rsp),%r8
18bb   777f54:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
18c5   777f5e:	e9 29 ee ff ff       	jmp    776d8c <leaf_cut_from_buffer+0x6f3>
18ca   777f63:	44 89 f1             	mov    %r14d,%ecx
18cd   777f66:	80 e1 07             	and    $0x7,%cl
18d0   777f69:	38 c1                	cmp    %al,%cl
18d2   777f6b:	0f 8c 2d ee ff ff    	jl     776d9e <leaf_cut_from_buffer+0x705>
18d8   777f71:	be 02 00 00 00       	mov    $0x2,%esi
18dd   777f76:	4c 89 f7             	mov    %r14,%rdi
18e0   777f79:	e8 00 00 00 00       	call   777f7e <leaf_cut_from_buffer+0x18e5>	777f7a: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
18e5   777f7e:	4c 8b 04 24          	mov    (%rsp),%r8
18e9   777f82:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
18f3   777f8c:	e9 0d ee ff ff       	jmp    776d9e <leaf_cut_from_buffer+0x705>
18f8   777f91:	89 f9                	mov    %edi,%ecx
18fa   777f93:	80 e1 07             	and    $0x7,%cl
18fd   777f96:	38 c1                	cmp    %al,%cl
18ff   777f98:	0f 8c 2f ee ff ff    	jl     776dcd <leaf_cut_from_buffer+0x734>
1905   777f9e:	be 02 00 00 00       	mov    $0x2,%esi
190a   777fa3:	48 89 d3             	mov    %rdx,%rbx
190d   777fa6:	e8 00 00 00 00       	call   777fab <leaf_cut_from_buffer+0x1912>	777fa7: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1912   777fab:	48 89 da             	mov    %rbx,%rdx
1915   777fae:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
191a   777fb3:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1924   777fbd:	e9 0b ee ff ff       	jmp    776dcd <leaf_cut_from_buffer+0x734>
1929   777fc2:	44 89 f9             	mov    %r15d,%ecx
192c   777fc5:	80 e1 07             	and    $0x7,%cl
192f   777fc8:	38 c1                	cmp    %al,%cl
1931   777fca:	0f 8c 20 ee ff ff    	jl     776df0 <leaf_cut_from_buffer+0x757>
1937   777fd0:	be 02 00 00 00       	mov    $0x2,%esi
193c   777fd5:	4c 89 ff             	mov    %r15,%rdi
193f   777fd8:	e8 00 00 00 00       	call   777fdd <leaf_cut_from_buffer+0x1944>	777fd9: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1944   777fdd:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1949   777fe2:	e9 09 ee ff ff       	jmp    776df0 <leaf_cut_from_buffer+0x757>
194e   777fe7:	89 f9                	mov    %edi,%ecx
1950   777fe9:	80 e1 07             	and    $0x7,%cl
1953   777fec:	38 c1                	cmp    %al,%cl
1955   777fee:	0f 8c 2f ee ff ff    	jl     776e23 <leaf_cut_from_buffer+0x78a>
195b   777ff4:	be 02 00 00 00       	mov    $0x2,%esi
1960   777ff9:	e8 00 00 00 00       	call   777ffe <leaf_cut_from_buffer+0x1965>	777ffa: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1965   777ffe:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
196a   778003:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1974   77800d:	e9 11 ee ff ff       	jmp    776e23 <leaf_cut_from_buffer+0x78a>
1979   778012:	44 89 f1             	mov    %r14d,%ecx
197c   778015:	80 e1 07             	and    $0x7,%cl
197f   778018:	38 c1                	cmp    %al,%cl
1981   77801a:	0f 8c 23 ee ff ff    	jl     776e43 <leaf_cut_from_buffer+0x7aa>
1987   778020:	be 02 00 00 00       	mov    $0x2,%esi
198c   778025:	4c 89 f7             	mov    %r14,%rdi
198f   778028:	e8 00 00 00 00       	call   77802d <leaf_cut_from_buffer+0x1994>	778029: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1994   77802d:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
1999   778032:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
199e   778037:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
19a3   77803c:	4c 8b 04 24          	mov    (%rsp),%r8
19a7   778040:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
19b1   77804a:	e9 f4 ed ff ff       	jmp    776e43 <leaf_cut_from_buffer+0x7aa>
19b6   77804f:	44 89 f1             	mov    %r14d,%ecx
19b9   778052:	80 e1 07             	and    $0x7,%cl
19bc   778055:	38 c1                	cmp    %al,%cl
19be   778057:	0f 8c 82 ef ff ff    	jl     776fdf <leaf_cut_from_buffer+0x946>
19c4   77805d:	be 02 00 00 00       	mov    $0x2,%esi
19c9   778062:	4c 89 f7             	mov    %r14,%rdi
19cc   778065:	e8 00 00 00 00       	call   77806a <leaf_cut_from_buffer+0x19d1>	778066: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
19d1   77806a:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
19d6   77806f:	4c 8b 04 24          	mov    (%rsp),%r8
19da   778073:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
19e4   77807d:	e9 5d ef ff ff       	jmp    776fdf <leaf_cut_from_buffer+0x946>
19e9   778082:	44 89 f9             	mov    %r15d,%ecx
19ec   778085:	80 e1 07             	and    $0x7,%cl
19ef   778088:	38 c1                	cmp    %al,%cl
19f1   77808a:	0f 8c 66 ef ff ff    	jl     776ff6 <leaf_cut_from_buffer+0x95d>
19f7   778090:	be 02 00 00 00       	mov    $0x2,%esi
19fc   778095:	4c 89 ff             	mov    %r15,%rdi
19ff   778098:	e8 00 00 00 00       	call   77809d <leaf_cut_from_buffer+0x1a04>	778099: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1a04   77809d:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1a09   7780a2:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1a0e   7780a7:	4c 8b 04 24          	mov    (%rsp),%r8
1a12   7780ab:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1a1c   7780b5:	e9 3c ef ff ff       	jmp    776ff6 <leaf_cut_from_buffer+0x95d>
1a21   7780ba:	44 89 f1             	mov    %r14d,%ecx
1a24   7780bd:	80 e1 07             	and    $0x7,%cl
1a27   7780c0:	38 c1                	cmp    %al,%cl
1a29   7780c2:	0f 8c 50 ef ff ff    	jl     777018 <leaf_cut_from_buffer+0x97f>
1a2f   7780c8:	be 04 00 00 00       	mov    $0x4,%esi
1a34   7780cd:	4c 89 f7             	mov    %r14,%rdi
1a37   7780d0:	e8 00 00 00 00       	call   7780d5 <leaf_cut_from_buffer+0x1a3c>	7780d1: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1a3c   7780d5:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1a41   7780da:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1a46   7780df:	4c 8b 04 24          	mov    (%rsp),%r8
1a4a   7780e3:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1a54   7780ed:	e9 26 ef ff ff       	jmp    777018 <leaf_cut_from_buffer+0x97f>
1a59   7780f2:	44 89 f9             	mov    %r15d,%ecx
1a5c   7780f5:	80 e1 07             	and    $0x7,%cl
1a5f   7780f8:	38 c1                	cmp    %al,%cl
1a61   7780fa:	0f 8c 2a ef ff ff    	jl     77702a <leaf_cut_from_buffer+0x991>
1a67   778100:	be 04 00 00 00       	mov    $0x4,%esi
1a6c   778105:	4c 89 ff             	mov    %r15,%rdi
1a6f   778108:	e8 00 00 00 00       	call   77810d <leaf_cut_from_buffer+0x1a74>	778109: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1a74   77810d:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1a79   778112:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1a7e   778117:	4c 8b 04 24          	mov    (%rsp),%r8
1a82   77811b:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1a8c   778125:	e9 00 ef ff ff       	jmp    77702a <leaf_cut_from_buffer+0x991>
1a91   77812a:	89 f9                	mov    %edi,%ecx
1a93   77812c:	80 e1 07             	and    $0x7,%cl
1a96   77812f:	38 c1                	cmp    %al,%cl
1a98   778131:	0f 8c 0d ef ff ff    	jl     777044 <leaf_cut_from_buffer+0x9ab>
1a9e   778137:	be 02 00 00 00       	mov    $0x2,%esi
1aa3   77813c:	e8 00 00 00 00       	call   778141 <leaf_cut_from_buffer+0x1aa8>	77813d: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1aa8   778141:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1aad   778146:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1ab2   77814b:	4c 8b 04 24          	mov    (%rsp),%r8
1ab6   77814f:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1ac0   778159:	e9 e6 ee ff ff       	jmp    777044 <leaf_cut_from_buffer+0x9ab>
1ac5   77815e:	44 89 f1             	mov    %r14d,%ecx
1ac8   778161:	80 e1 07             	and    $0x7,%cl
1acb   778164:	38 c1                	cmp    %al,%cl
1acd   778166:	0f 8c ea ee ff ff    	jl     777056 <leaf_cut_from_buffer+0x9bd>
1ad3   77816c:	be 02 00 00 00       	mov    $0x2,%esi
1ad8   778171:	4c 89 f7             	mov    %r14,%rdi
1adb   778174:	e8 00 00 00 00       	call   778179 <leaf_cut_from_buffer+0x1ae0>	778175: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1ae0   778179:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1ae5   77817e:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1aea   778183:	4c 8b 04 24          	mov    (%rsp),%r8
1aee   778187:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1af8   778191:	e9 c0 ee ff ff       	jmp    777056 <leaf_cut_from_buffer+0x9bd>
1afd   778196:	44 89 f1             	mov    %r14d,%ecx
1b00   778199:	80 e1 07             	and    $0x7,%cl
1b03   77819c:	38 c1                	cmp    %al,%cl
1b05   77819e:	0f 8c 6d f0 ff ff    	jl     777211 <leaf_cut_from_buffer+0xb78>
1b0b   7781a4:	be 02 00 00 00       	mov    $0x2,%esi
1b10   7781a9:	4c 89 f7             	mov    %r14,%rdi
1b13   7781ac:	e8 00 00 00 00       	call   7781b1 <leaf_cut_from_buffer+0x1b18>	7781ad: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1b18   7781b1:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1b22   7781bb:	e9 51 f0 ff ff       	jmp    777211 <leaf_cut_from_buffer+0xb78>
1b27   7781c0:	44 89 f9             	mov    %r15d,%ecx
1b2a   7781c3:	80 e1 07             	and    $0x7,%cl
1b2d   7781c6:	38 c1                	cmp    %al,%cl
1b2f   7781c8:	0f 8c 55 f0 ff ff    	jl     777223 <leaf_cut_from_buffer+0xb8a>
1b35   7781ce:	be 02 00 00 00       	mov    $0x2,%esi
1b3a   7781d3:	4c 89 ff             	mov    %r15,%rdi
1b3d   7781d6:	e8 00 00 00 00       	call   7781db <leaf_cut_from_buffer+0x1b42>	7781d7: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1b42   7781db:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1b4c   7781e5:	e9 39 f0 ff ff       	jmp    777223 <leaf_cut_from_buffer+0xb8a>
1b51   7781ea:	44 89 d1             	mov    %r10d,%ecx
1b54   7781ed:	80 e1 07             	and    $0x7,%cl
1b57   7781f0:	38 c1                	cmp    %al,%cl
1b59   7781f2:	0f 8c 71 ec ff ff    	jl     776e69 <leaf_cut_from_buffer+0x7d0>
1b5f   7781f8:	be 08 00 00 00       	mov    $0x8,%esi
1b64   7781fd:	89 fd                	mov    %edi,%ebp
1b66   7781ff:	4c 89 d7             	mov    %r10,%rdi
1b69   778202:	4d 89 d6             	mov    %r10,%r14
1b6c   778205:	e8 00 00 00 00       	call   77820a <leaf_cut_from_buffer+0x1b71>	778206: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1b71   77820a:	4d 89 f2             	mov    %r14,%r10
1b74   77820d:	89 ef                	mov    %ebp,%edi
1b76   77820f:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
1b7b   778214:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1b80   778219:	4c 8b 04 24          	mov    (%rsp),%r8
1b84   77821d:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1b8e   778227:	e9 3d ec ff ff       	jmp    776e69 <leaf_cut_from_buffer+0x7d0>
1b93   77822c:	44 89 f9             	mov    %r15d,%ecx
1b96   77822f:	80 e1 07             	and    $0x7,%cl
1b99   778232:	38 c1                	cmp    %al,%cl
1b9b   778234:	0f 8c 41 ec ff ff    	jl     776e7b <leaf_cut_from_buffer+0x7e2>
1ba1   77823a:	be 08 00 00 00       	mov    $0x8,%esi
1ba6   77823f:	89 fd                	mov    %edi,%ebp
1ba8   778241:	4c 89 ff             	mov    %r15,%rdi
1bab   778244:	4d 89 d6             	mov    %r10,%r14
1bae   778247:	e8 00 00 00 00       	call   77824c <leaf_cut_from_buffer+0x1bb3>	778248: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1bb3   77824c:	4d 89 f2             	mov    %r14,%r10
1bb6   77824f:	89 ef                	mov    %ebp,%edi
1bb8   778251:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
1bbd   778256:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1bc2   77825b:	4c 8b 04 24          	mov    (%rsp),%r8
1bc6   77825f:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1bd0   778269:	e9 0d ec ff ff       	jmp    776e7b <leaf_cut_from_buffer+0x7e2>
1bd5   77826e:	44 89 f1             	mov    %r14d,%ecx
1bd8   778271:	80 e1 07             	and    $0x7,%cl
1bdb   778274:	38 c1                	cmp    %al,%cl
1bdd   778276:	0f 8c fe ed ff ff    	jl     77707a <leaf_cut_from_buffer+0x9e1>
1be3   77827c:	be 08 00 00 00       	mov    $0x8,%esi
1be8   778281:	4c 89 f7             	mov    %r14,%rdi
1beb   778284:	e8 00 00 00 00       	call   778289 <leaf_cut_from_buffer+0x1bf0>	778285: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1bf0   778289:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1bf5   77828e:	4c 8b 04 24          	mov    (%rsp),%r8
1bf9   778292:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1c03   77829c:	e9 d9 ed ff ff       	jmp    77707a <leaf_cut_from_buffer+0x9e1>
1c08   7782a1:	44 89 f9             	mov    %r15d,%ecx
1c0b   7782a4:	80 e1 07             	and    $0x7,%cl
1c0e   7782a7:	38 c1                	cmp    %al,%cl
1c10   7782a9:	0f 8c dd ed ff ff    	jl     77708c <leaf_cut_from_buffer+0x9f3>
1c16   7782af:	be 08 00 00 00       	mov    $0x8,%esi
1c1b   7782b4:	4c 89 ff             	mov    %r15,%rdi
1c1e   7782b7:	e8 00 00 00 00       	call   7782bc <leaf_cut_from_buffer+0x1c23>	7782b8: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1c23   7782bc:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1c28   7782c1:	4c 8b 04 24          	mov    (%rsp),%r8
1c2c   7782c5:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1c36   7782cf:	e9 b8 ed ff ff       	jmp    77708c <leaf_cut_from_buffer+0x9f3>
1c3b   7782d4:	89 f9                	mov    %edi,%ecx
1c3d   7782d6:	80 e1 07             	and    $0x7,%cl
1c40   7782d9:	38 c1                	cmp    %al,%cl
1c42   7782db:	0f 8c e0 ed ff ff    	jl     7770c1 <leaf_cut_from_buffer+0xa28>
1c48   7782e1:	be 04 00 00 00       	mov    $0x4,%esi
1c4d   7782e6:	e8 00 00 00 00       	call   7782eb <leaf_cut_from_buffer+0x1c52>	7782e7: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1c52   7782eb:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
1c57   7782f0:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1c5c   7782f5:	4c 8b 04 24          	mov    (%rsp),%r8
1c60   7782f9:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1c6a   778303:	e9 b9 ed ff ff       	jmp    7770c1 <leaf_cut_from_buffer+0xa28>
1c6f   778308:	44 89 f1             	mov    %r14d,%ecx
1c72   77830b:	80 e1 07             	and    $0x7,%cl
1c75   77830e:	38 c1                	cmp    %al,%cl
1c77   778310:	0f 8c bd ed ff ff    	jl     7770d3 <leaf_cut_from_buffer+0xa3a>
1c7d   778316:	be 04 00 00 00       	mov    $0x4,%esi
1c82   77831b:	4c 89 f7             	mov    %r14,%rdi
1c85   77831e:	e8 00 00 00 00       	call   778323 <leaf_cut_from_buffer+0x1c8a>	77831f: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1c8a   778323:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
1c8f   778328:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1c94   77832d:	4c 8b 04 24          	mov    (%rsp),%r8
1c98   778331:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1ca2   77833b:	e9 93 ed ff ff       	jmp    7770d3 <leaf_cut_from_buffer+0xa3a>
1ca7   778340:	44 89 f1             	mov    %r14d,%ecx
1caa   778343:	80 e1 07             	and    $0x7,%cl
1cad   778346:	38 c1                	cmp    %al,%cl
1caf   778348:	0f 8c a4 ed ff ff    	jl     7770f2 <leaf_cut_from_buffer+0xa59>
1cb5   77834e:	be 04 00 00 00       	mov    $0x4,%esi
1cba   778353:	4c 89 f7             	mov    %r14,%rdi
1cbd   778356:	e8 00 00 00 00       	call   77835b <leaf_cut_from_buffer+0x1cc2>	778357: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1cc2   77835b:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
1cc7   778360:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1ccc   778365:	4c 8b 04 24          	mov    (%rsp),%r8
1cd0   778369:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1cda   778373:	e9 7a ed ff ff       	jmp    7770f2 <leaf_cut_from_buffer+0xa59>
1cdf   778378:	44 89 f9             	mov    %r15d,%ecx
1ce2   77837b:	80 e1 07             	and    $0x7,%cl
1ce5   77837e:	38 c1                	cmp    %al,%cl
1ce7   778380:	0f 8c 7e ed ff ff    	jl     777104 <leaf_cut_from_buffer+0xa6b>
1ced   778386:	be 04 00 00 00       	mov    $0x4,%esi
1cf2   77838b:	4c 89 ff             	mov    %r15,%rdi
1cf5   77838e:	e8 00 00 00 00       	call   778393 <leaf_cut_from_buffer+0x1cfa>	77838f: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1cfa   778393:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
1cff   778398:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1d04   77839d:	4c 8b 04 24          	mov    (%rsp),%r8
1d08   7783a1:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1d12   7783ab:	e9 54 ed ff ff       	jmp    777104 <leaf_cut_from_buffer+0xa6b>
1d17   7783b0:	44 89 f1             	mov    %r14d,%ecx
1d1a   7783b3:	80 e1 07             	and    $0x7,%cl
1d1d   7783b6:	38 c1                	cmp    %al,%cl
1d1f   7783b8:	0f 8c 18 ee ff ff    	jl     7771d6 <leaf_cut_from_buffer+0xb3d>
1d25   7783be:	be 04 00 00 00       	mov    $0x4,%esi
1d2a   7783c3:	4c 89 f7             	mov    %r14,%rdi
1d2d   7783c6:	e8 00 00 00 00       	call   7783cb <leaf_cut_from_buffer+0x1d32>	7783c7: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1d32   7783cb:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1d37   7783d0:	4c 8b 04 24          	mov    (%rsp),%r8
1d3b   7783d4:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1d45   7783de:	e9 f3 ed ff ff       	jmp    7771d6 <leaf_cut_from_buffer+0xb3d>
1d4a   7783e3:	44 89 f9             	mov    %r15d,%ecx
1d4d   7783e6:	80 e1 07             	and    $0x7,%cl
1d50   7783e9:	38 c1                	cmp    %al,%cl
1d52   7783eb:	0f 8c f7 ed ff ff    	jl     7771e8 <leaf_cut_from_buffer+0xb4f>
1d58   7783f1:	be 04 00 00 00       	mov    $0x4,%esi
1d5d   7783f6:	4c 89 ff             	mov    %r15,%rdi
1d60   7783f9:	e8 00 00 00 00       	call   7783fe <leaf_cut_from_buffer+0x1d65>	7783fa: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1d65   7783fe:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1d6a   778403:	4c 8b 04 24          	mov    (%rsp),%r8
1d6e   778407:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1d78   778411:	e9 d2 ed ff ff       	jmp    7771e8 <leaf_cut_from_buffer+0xb4f>
1d7d   778416:	44 89 d1             	mov    %r10d,%ecx
1d80   778419:	80 e1 07             	and    $0x7,%cl
1d83   77841c:	38 c1                	cmp    %al,%cl
1d85   77841e:	0f 8c 9c ea ff ff    	jl     776ec0 <leaf_cut_from_buffer+0x827>
1d8b   778424:	be 08 00 00 00       	mov    $0x8,%esi
1d90   778429:	4c 89 d7             	mov    %r10,%rdi
1d93   77842c:	4c 89 d3             	mov    %r10,%rbx
1d96   77842f:	e8 00 00 00 00       	call   778434 <leaf_cut_from_buffer+0x1d9b>	778430: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1d9b   778434:	49 89 da             	mov    %rbx,%r10
1d9e   778437:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1da3   77843c:	4c 8b 04 24          	mov    (%rsp),%r8
1da7   778440:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1db1   77844a:	e9 71 ea ff ff       	jmp    776ec0 <leaf_cut_from_buffer+0x827>
1db6   77844f:	44 89 f9             	mov    %r15d,%ecx
1db9   778452:	80 e1 07             	and    $0x7,%cl
1dbc   778455:	38 c1                	cmp    %al,%cl
1dbe   778457:	0f 8c 78 ea ff ff    	jl     776ed5 <leaf_cut_from_buffer+0x83c>
1dc4   77845d:	be 08 00 00 00       	mov    $0x8,%esi
1dc9   778462:	4c 89 ff             	mov    %r15,%rdi
1dcc   778465:	4c 89 d3             	mov    %r10,%rbx
1dcf   778468:	e8 00 00 00 00       	call   77846d <leaf_cut_from_buffer+0x1dd4>	778469: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1dd4   77846d:	49 89 da             	mov    %rbx,%r10
1dd7   778470:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1ddc   778475:	4c 8b 04 24          	mov    (%rsp),%r8
1de0   778479:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1dea   778483:	e9 4d ea ff ff       	jmp    776ed5 <leaf_cut_from_buffer+0x83c>
1def   778488:	44 89 d1             	mov    %r10d,%ecx
1df2   77848b:	80 e1 07             	and    $0x7,%cl
1df5   77848e:	38 c1                	cmp    %al,%cl
1df7   778490:	0f 8c b7 f1 ff ff    	jl     77764d <leaf_cut_from_buffer+0xfb4>
1dfd   778496:	be 08 00 00 00       	mov    $0x8,%esi
1e02   77849b:	66 89 7c 24 48       	mov    %di,0x48(%rsp)
1e07   7784a0:	4c 89 d7             	mov    %r10,%rdi
1e0a   7784a3:	48 89 d3             	mov    %rdx,%rbx
1e0d   7784a6:	4c 89 d5             	mov    %r10,%rbp
1e10   7784a9:	e8 00 00 00 00       	call   7784ae <leaf_cut_from_buffer+0x1e15>	7784aa: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1e15   7784ae:	49 89 ea             	mov    %rbp,%r10
1e18   7784b1:	0f b7 7c 24 48       	movzwl 0x48(%rsp),%edi
1e1d   7784b6:	48 89 da             	mov    %rbx,%rdx
1e20   7784b9:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1e25   7784be:	4c 8b 04 24          	mov    (%rsp),%r8
1e29   7784c2:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1e33   7784cc:	e9 7c f1 ff ff       	jmp    77764d <leaf_cut_from_buffer+0xfb4>
1e38   7784d1:	44 89 f9             	mov    %r15d,%ecx
1e3b   7784d4:	80 e1 07             	and    $0x7,%cl
1e3e   7784d7:	38 c1                	cmp    %al,%cl
1e40   7784d9:	0f 8c 83 f1 ff ff    	jl     777662 <leaf_cut_from_buffer+0xfc9>
1e46   7784df:	be 08 00 00 00       	mov    $0x8,%esi
1e4b   7784e4:	89 fd                	mov    %edi,%ebp
1e4d   7784e6:	4c 89 ff             	mov    %r15,%rdi
1e50   7784e9:	48 89 d3             	mov    %rdx,%rbx
1e53   7784ec:	4d 89 d6             	mov    %r10,%r14
1e56   7784ef:	e8 00 00 00 00       	call   7784f4 <leaf_cut_from_buffer+0x1e5b>	7784f0: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1e5b   7784f4:	4d 89 f2             	mov    %r14,%r10
1e5e   7784f7:	89 ef                	mov    %ebp,%edi
1e60   7784f9:	48 89 da             	mov    %rbx,%rdx
1e63   7784fc:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1e68   778501:	4c 8b 04 24          	mov    (%rsp),%r8
1e6c   778505:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1e76   77850f:	e9 4e f1 ff ff       	jmp    777662 <leaf_cut_from_buffer+0xfc9>
1e7b   778514:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
1e80   778519:	80 e1 07             	and    $0x7,%cl
1e83   77851c:	38 c1                	cmp    %al,%cl
1e85   77851e:	0f 8c 5a f1 ff ff    	jl     77767e <leaf_cut_from_buffer+0xfe5>
1e8b   778524:	be 02 00 00 00       	mov    $0x2,%esi
1e90   778529:	89 fb                	mov    %edi,%ebx
1e92   77852b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1e97   778530:	e8 00 00 00 00       	call   778535 <leaf_cut_from_buffer+0x1e9c>	778531: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1e9c   778535:	89 df                	mov    %ebx,%edi
1e9e   778537:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1ea3   77853c:	4c 8b 04 24          	mov    (%rsp),%r8
1ea7   778540:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1eb1   77854a:	e9 2f f1 ff ff       	jmp    77767e <leaf_cut_from_buffer+0xfe5>
1eb6   77854f:	44 89 f1             	mov    %r14d,%ecx
1eb9   778552:	80 e1 07             	and    $0x7,%cl
1ebc   778555:	38 c1                	cmp    %al,%cl
1ebe   778557:	0f 8c 33 f1 ff ff    	jl     777690 <leaf_cut_from_buffer+0xff7>
1ec4   77855d:	be 02 00 00 00       	mov    $0x2,%esi
1ec9   778562:	89 fb                	mov    %edi,%ebx
1ecb   778564:	4c 89 f7             	mov    %r14,%rdi
1ece   778567:	e8 00 00 00 00       	call   77856c <leaf_cut_from_buffer+0x1ed3>	778568: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1ed3   77856c:	89 df                	mov    %ebx,%edi
1ed5   77856e:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1eda   778573:	4c 8b 04 24          	mov    (%rsp),%r8
1ede   778577:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1ee8   778581:	e9 0a f1 ff ff       	jmp    777690 <leaf_cut_from_buffer+0xff7>
1eed   778586:	44 89 f1             	mov    %r14d,%ecx
1ef0   778589:	80 e1 07             	and    $0x7,%cl
1ef3   77858c:	38 c1                	cmp    %al,%cl
1ef5   77858e:	0f 8c 31 f1 ff ff    	jl     7776c5 <leaf_cut_from_buffer+0x102c>
1efb   778594:	be 02 00 00 00       	mov    $0x2,%esi
1f00   778599:	4c 89 f7             	mov    %r14,%rdi
1f03   77859c:	e8 00 00 00 00       	call   7785a1 <leaf_cut_from_buffer+0x1f08>	77859d: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1f08   7785a1:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1f0d   7785a6:	4c 8b 04 24          	mov    (%rsp),%r8
1f11   7785aa:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1f1b   7785b4:	e9 0c f1 ff ff       	jmp    7776c5 <leaf_cut_from_buffer+0x102c>
1f20   7785b9:	44 89 f9             	mov    %r15d,%ecx
1f23   7785bc:	80 e1 07             	and    $0x7,%cl
1f26   7785bf:	38 c1                	cmp    %al,%cl
1f28   7785c1:	0f 8c 10 f1 ff ff    	jl     7776d7 <leaf_cut_from_buffer+0x103e>
1f2e   7785c7:	be 02 00 00 00       	mov    $0x2,%esi
1f33   7785cc:	4c 89 ff             	mov    %r15,%rdi
1f36   7785cf:	e8 00 00 00 00       	call   7785d4 <leaf_cut_from_buffer+0x1f3b>	7785d0: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1f3b   7785d4:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1f40   7785d9:	4c 8b 04 24          	mov    (%rsp),%r8
1f44   7785dd:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1f4e   7785e7:	e9 eb f0 ff ff       	jmp    7776d7 <leaf_cut_from_buffer+0x103e>
1f53   7785ec:	e8 00 00 00 00       	call   7785f1 <leaf_cut_from_buffer+0x1f58>	7785ed: R_X86_64_PLT32	__asan_handle_no_return-0x4
1f58   7785f1:	31 ff                	xor    %edi,%edi
1f5a   7785f3:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	7785f6: R_X86_64_32S	.rodata+0x495f40
1f61   7785fa:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	7785fd: R_X86_64_32S	.rodata.str1.1+0x35c7a
1f68   778601:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	778604: R_X86_64_32S	.rodata+0x497fa0
1f6f   778608:	41 b8 41 04 00 00    	mov    $0x441,%r8d
1f75   77860e:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	778611: R_X86_64_32S	.rodata.str1.1+0x35c7a
1f7c   778615:	41 55                	push   %r13
1f7e   778617:	ff 74 24 48          	push   0x48(%rsp)
1f82   77861b:	53                   	push   %rbx
1f83   77861c:	e8 00 00 00 00       	call   778621 <leaf_cut_from_buffer+0x1f88>	77861d: R_X86_64_PLT32	__reiserfs_panic-0x4
1f88   778621:	44 89 f1             	mov    %r14d,%ecx
1f8b   778624:	80 e1 07             	and    $0x7,%cl
1f8e   778627:	38 c1                	cmp    %al,%cl
1f90   778629:	0f 8c 2c eb ff ff    	jl     77715b <leaf_cut_from_buffer+0xac2>
1f96   77862f:	be 04 00 00 00       	mov    $0x4,%esi
1f9b   778634:	4c 89 f7             	mov    %r14,%rdi
1f9e   778637:	49 89 d4             	mov    %rdx,%r12
1fa1   77863a:	e8 00 00 00 00       	call   77863f <leaf_cut_from_buffer+0x1fa6>	77863b: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1fa6   77863f:	4c 89 e2             	mov    %r12,%rdx
1fa9   778642:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1fae   778647:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1fb8   778651:	e9 05 eb ff ff       	jmp    77715b <leaf_cut_from_buffer+0xac2>
1fbd   778656:	44 89 f9             	mov    %r15d,%ecx
1fc0   778659:	80 e1 07             	and    $0x7,%cl
1fc3   77865c:	38 c1                	cmp    %al,%cl
1fc5   77865e:	0f 8c 14 eb ff ff    	jl     777178 <leaf_cut_from_buffer+0xadf>
1fcb   778664:	be 04 00 00 00       	mov    $0x4,%esi
1fd0   778669:	4c 89 ff             	mov    %r15,%rdi
1fd3   77866c:	e8 00 00 00 00       	call   778671 <leaf_cut_from_buffer+0x1fd8>	77866d: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1fd8   778671:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
1fdd   778676:	4c 8b 04 24          	mov    (%rsp),%r8
1fe1   77867a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1feb   778684:	e9 ef ea ff ff       	jmp    777178 <leaf_cut_from_buffer+0xadf>
1ff0   778689:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
1ff5   77868e:	80 e1 07             	and    $0x7,%cl
1ff8   778691:	38 c1                	cmp    %al,%cl
1ffa   778693:	0f 8c fb ea ff ff    	jl     777194 <leaf_cut_from_buffer+0xafb>
2000   778699:	be 02 00 00 00       	mov    $0x2,%esi
2005   77869e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
200a   7786a3:	e8 00 00 00 00       	call   7786a8 <leaf_cut_from_buffer+0x200f>	7786a4: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
200f   7786a8:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
2014   7786ad:	4c 8b 04 24          	mov    (%rsp),%r8
2018   7786b1:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2022   7786bb:	e9 d4 ea ff ff       	jmp    777194 <leaf_cut_from_buffer+0xafb>
2027   7786c0:	44 89 f1             	mov    %r14d,%ecx
202a   7786c3:	80 e1 07             	and    $0x7,%cl
202d   7786c6:	38 c1                	cmp    %al,%cl
202f   7786c8:	0f 8c d8 ea ff ff    	jl     7771a6 <leaf_cut_from_buffer+0xb0d>
2035   7786ce:	be 02 00 00 00       	mov    $0x2,%esi
203a   7786d3:	4c 89 f7             	mov    %r14,%rdi
203d   7786d6:	e8 00 00 00 00       	call   7786db <leaf_cut_from_buffer+0x2042>	7786d7: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
2042   7786db:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
2047   7786e0:	4c 8b 04 24          	mov    (%rsp),%r8
204b   7786e4:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2055   7786ee:	e9 b3 ea ff ff       	jmp    7771a6 <leaf_cut_from_buffer+0xb0d>
205a   7786f3:	44 89 f1             	mov    %r14d,%ecx
205d   7786f6:	80 e1 07             	and    $0x7,%cl
2060   7786f9:	38 c1                	cmp    %al,%cl
2062   7786fb:	0f 8c 22 f0 ff ff    	jl     777723 <leaf_cut_from_buffer+0x108a>
2068   778701:	be 04 00 00 00       	mov    $0x4,%esi
206d   778706:	4c 89 f7             	mov    %r14,%rdi
2070   778709:	e8 00 00 00 00       	call   77870e <leaf_cut_from_buffer+0x2075>	77870a: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
2075   77870e:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
207a   778713:	4c 8b 04 24          	mov    (%rsp),%r8
207e   778717:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2088   778721:	e9 fd ef ff ff       	jmp    777723 <leaf_cut_from_buffer+0x108a>
208d   778726:	44 89 f9             	mov    %r15d,%ecx
2090   778729:	80 e1 07             	and    $0x7,%cl
2093   77872c:	38 c1                	cmp    %al,%cl
2095   77872e:	0f 8c 09 f0 ff ff    	jl     77773d <leaf_cut_from_buffer+0x10a4>
209b   778734:	be 04 00 00 00       	mov    $0x4,%esi
20a0   778739:	4c 89 ff             	mov    %r15,%rdi
20a3   77873c:	e8 00 00 00 00       	call   778741 <leaf_cut_from_buffer+0x20a8>	77873d: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
20a8   778741:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
20ad   778746:	4c 8b 04 24          	mov    (%rsp),%r8
20b1   77874a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
20bb   778754:	e9 e4 ef ff ff       	jmp    77773d <leaf_cut_from_buffer+0x10a4>
20c0   778759:	e8 00 00 00 00       	call   77875e <leaf_cut_from_buffer+0x20c5>	77875a: R_X86_64_PLT32	__asan_handle_no_return-0x4
20c5   77875e:	31 ff                	xor    %edi,%edi
20c7   778760:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	778763: R_X86_64_32S	.rodata+0x495f40
20ce   778767:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	77876a: R_X86_64_32S	.rodata.str1.1+0x3bdeb
20d5   77876e:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	778771: R_X86_64_32S	.rodata+0x496700
20dc   778775:	41 b8 90 04 00 00    	mov    $0x490,%r8d
20e2   77877b:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	77877e: R_X86_64_32S	.rodata.str1.1+0x3bdeb
20e9   778782:	41 54                	push   %r12
20eb   778784:	e8 00 00 00 00       	call   778789 <leaf_insert_into_buf>	778785: R_X86_64_PLT32	__reiserfs_panic-0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
