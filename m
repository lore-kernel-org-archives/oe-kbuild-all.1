Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF7F84FB3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 23:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708732501; cv=none; b=GOIVCykAiteKXe+KsVUzFjLf/rFLbnwu/B6ct2BZHXlRh5tRb7FiD5YwGHScYY25Kw8G+bdvGUp48Y9tretKrVst9bbLOAQUrplauI7AxbL6bFHv4qLXnX6ueeafxqXmQhgobsR4VsH7ttXw4/1KVQpdjlPIMF1NgIaKZcLRf+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708732501; c=relaxed/simple;
	bh=j6phGWq4qAk6ruKMWU5pwpd+oubWnXqGl6QfDM7ISKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tIfHp4rbdW0ssLqgAeYhxNodyU2T1ISkONs7qqfc0Bg02t7692zDhcQxweYdSMjLtFaIj0UKenUt3hzjuTXdKpwNOnqpNGFn8mk6QOHTTb8dslte5C5MAP+V5NuOzH8szXHCf7b63TUMOslhIJoow7uebEUg8pe9ygF4F5bfvIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEJAra11; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEJAra11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708732499; x=1740268499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j6phGWq4qAk6ruKMWU5pwpd+oubWnXqGl6QfDM7ISKc=;
  b=fEJAra11zA28/v5oiYa+N5Y5XRE2ZaKgYLjP3sjhYhvobvyXhJMUV7mJ
   sOQcfHBNhb6n1N8+Pu4yqZvPTmLBXLxB7Zi7YB15COsa5ittKSNVGRsoP
   m+m6SJfMb2KiCM0daqVu5eQFnlQYb++mb6hDRoFNC/jrZ5DhN2DBQZb44
   wM63yDWO5XWGbLtoZwN17pTV+ji/jzVXHVgTJ8ry9Df3pQFLPrSl5JTCc
   GjaPwVMZjFTRvuVvJnLErjAmd+81mmModsSd/Soo95j1+eHgyA+kZM9D3
   eatd74nCDgmu0cwhhyYIIWlFkR2EpivQb6rE12uG1VPid4YA30yJYqB4h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3588658"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="3588658"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 15:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6065147"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Feb 2024 15:54:30 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdfN0-00080m-2y;
	Fri, 23 Feb 2024 23:54:25 +0000
Date: Sat, 24 Feb 2024 07:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [kees:for-next/kspp 29/41] vmlinux.o: warning: objtool:
 vmw_port_hb_in+0x242: objtool isn't smart enough to handle this CFI
 save/restore combo
Message-ID: <202402240702.zJFNmahW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
head:   09e0d17906598c77fc7831c2d257d573931952e8
commit: f394a8df5bf700bb265f631664fbfb1cb42b69ad [29/41] fortify: Split reporting and avoid passing string pointer
config: x86_64-randconfig-011-20240223 (https://download.01.org/0day-ci/archive/20240224/202402240702.zJFNmahW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240702.zJFNmahW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240702.zJFNmahW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vmw_port_hb_in+0x242: objtool isn't smart enough to handle this CFI save/restore combo


objdump-func vmlinux.o vmw_port_hb_in:
0000 0000000002d10770 <vmw_port_hb_in>:
0000  2d10770:	41 57                	push   %r15
0002  2d10772:	49 89 f7             	mov    %rsi,%r15
0005  2d10775:	41 56                	push   %r14
0007  2d10777:	49 89 d6             	mov    %rdx,%r14
000a  2d1077a:	41 55                	push   %r13
000c  2d1077c:	41 54                	push   %r12
000e  2d1077e:	55                   	push   %rbp
000f  2d1077f:	48 89 fd             	mov    %rdi,%rbp
0012  2d10782:	53                   	push   %rbx
0013  2d10783:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
001d  2d1078d:	48 83 ec 70          	sub    $0x70,%rsp
0021  2d10791:	48 c7 44 24 30 b3 8a b5 41 	movq   $0x41b58ab3,0x30(%rsp)
002a  2d1079a:	48 8d 44 24 30       	lea    0x30(%rsp),%rax
002f  2d1079f:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	2d107a4: R_X86_64_32S	.rodata.str1.1+0x1571a7
0038  2d107a8:	48 c1 e8 03          	shr    $0x3,%rax
003c  2d107ac:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)	2d107b1: R_X86_64_32S	.text+0x2d10770
0045  2d107b5:	49 89 c4             	mov    %rax,%r12
0048  2d107b8:	48 01 d8             	add    %rbx,%rax
004b  2d107bb:	c7 00 f1 f1 f1 f1    	movl   $0xf1f1f1f1,(%rax)
0051  2d107c1:	c7 40 04 00 f3 f3 f3 	movl   $0xf3f3f300,0x4(%rax)
0058  2d107c8:	48 b8 fe fe fe fe fe fe fe fe 	movabs $0xfefefefefefefefe,%rax
0062  2d107d2:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
0067  2d107d7:	84 c9                	test   %cl,%cl
0069  2d107d9:	0f 85 1c 01 00 00    	jne    2d108fb <vmw_port_hb_in+0x18b>
006f  2d107df:	4c 8d 4d 08          	lea    0x8(%rbp),%r9
0073  2d107e3:	4c 8d 55 04          	lea    0x4(%rbp),%r10
0077  2d107e7:	4d 85 f6             	test   %r14,%r14
007a  2d107ea:	0f 84 e6 01 00 00    	je     2d109d6 <vmw_port_hb_in+0x266>
0080  2d107f0:	4c 89 d0             	mov    %r10,%rax
0083  2d107f3:	4c 89 64 24 18       	mov    %r12,0x18(%rsp)
0088  2d107f8:	49 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r8
0092  2d10802:	48 c1 e8 03          	shr    $0x3,%rax
0096  2d10806:	4c 89 54 24 20       	mov    %r10,0x20(%rsp)
009b  2d1080b:	4c 01 c0             	add    %r8,%rax
009e  2d1080e:	4c 89 0c 24          	mov    %r9,(%rsp)
00a2  2d10812:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
00a7  2d10817:	4c 89 d0             	mov    %r10,%rax
00aa  2d1081a:	83 e0 07             	and    $0x7,%eax
00ad  2d1081d:	83 c0 03             	add    $0x3,%eax
00b0  2d10820:	88 44 24 16          	mov    %al,0x16(%rsp)
00b4  2d10824:	4c 89 c8             	mov    %r9,%rax
00b7  2d10827:	83 e0 07             	and    $0x7,%eax
00ba  2d1082a:	83 c0 03             	add    $0x3,%eax
00bd  2d1082d:	88 44 24 17          	mov    %al,0x17(%rsp)
00c1  2d10831:	eb 26                	jmp    2d10859 <vmw_port_hb_in+0xe9>
00c3  2d10833:	4c 89 ff             	mov    %r15,%rdi
00c6  2d10836:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
00cb  2d1083b:	4c 89 e2             	mov    %r12,%rdx
00ce  2d1083e:	4d 01 e7             	add    %r12,%r15
00d1  2d10841:	e8 00 00 00 00       	call   2d10846 <vmw_port_hb_in+0xd6>	2d10842: R_X86_64_PLT32	memcpy-0x4
00d6  2d10846:	4d 29 e6             	sub    %r12,%r14
00d9  2d10849:	49 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r8
00e3  2d10853:	0f 84 98 00 00 00    	je     2d108f1 <vmw_port_hb_in+0x181>
00e9  2d10859:	41 bc 04 00 00 00    	mov    $0x4,%r12d
00ef  2d1085f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
00f4  2d10864:	4d 39 e6             	cmp    %r12,%r14
00f7  2d10867:	4d 0f 46 e6          	cmovbe %r14,%r12
00fb  2d1086b:	0f b6 00             	movzbl (%rax),%eax
00fe  2d1086e:	38 44 24 16          	cmp    %al,0x16(%rsp)
0102  2d10872:	7c 08                	jl     2d1087c <vmw_port_hb_in+0x10c>
0104  2d10874:	84 c0                	test   %al,%al
0106  2d10876:	0f 85 83 01 00 00    	jne    2d109ff <vmw_port_hb_in+0x28f>
010c  2d1087c:	48 8b 04 24          	mov    (%rsp),%rax
0110  2d10880:	8b 75 04             	mov    0x4(%rbp),%esi
0113  2d10883:	48 c1 e8 03          	shr    $0x3,%rax
0117  2d10887:	42 0f b6 04 00       	movzbl (%rax,%r8,1),%eax
011c  2d1088c:	38 44 24 17          	cmp    %al,0x17(%rsp)
0120  2d10890:	7c 08                	jl     2d1089a <vmw_port_hb_in+0x12a>
0122  2d10892:	84 c0                	test   %al,%al
0124  2d10894:	0f 85 43 01 00 00    	jne    2d109dd <vmw_port_hb_in+0x26d>
012a  2d1089a:	48 89 e8             	mov    %rbp,%rax
012d  2d1089d:	44 8b 6d 08          	mov    0x8(%rbp),%r13d
0131  2d108a1:	48 c1 e8 03          	shr    $0x3,%rax
0135  2d108a5:	42 0f b6 14 00       	movzbl (%rax,%r8,1),%edx
013a  2d108aa:	48 89 e8             	mov    %rbp,%rax
013d  2d108ad:	83 e0 07             	and    $0x7,%eax
0140  2d108b0:	83 c0 01             	add    $0x1,%eax
0143  2d108b3:	38 d0                	cmp    %dl,%al
0145  2d108b5:	7c 08                	jl     2d108bf <vmw_port_hb_in+0x14f>
0147  2d108b7:	84 d2                	test   %dl,%dl
0149  2d108b9:	0f 85 59 01 00 00    	jne    2d10a18 <vmw_port_hb_in+0x2a8>
014f  2d108bf:	0f b7 55 00          	movzwl 0x0(%rbp),%edx
0153  2d108c3:	b8 68 58 4d 56       	mov    $0x564d5868,%eax
0158  2d108c8:	bb 01 00 00 00       	mov    $0x1,%ebx
015d  2d108cd:	4c 89 ef             	mov    %r13,%rdi
0160  2d108d0:	b9 1e 00 04 00       	mov    $0x4001e,%ecx
0165  2d108d5:	c1 e2 10             	shl    $0x10,%edx
0168  2d108d8:	66 ba 58 56          	mov    $0x5658,%dx
016c  2d108dc:	ed                   	in     (%dx),%eax
016d  2d108dd:	48 89 5c 24 50       	mov    %rbx,0x50(%rsp)
0172  2d108e2:	48 89 cb             	mov    %rcx,%rbx
0175  2d108e5:	f7 c1 00 00 01 00    	test   $0x10000,%ecx
017b  2d108eb:	0f 85 42 ff ff ff    	jne    2d10833 <vmw_port_hb_in+0xc3>
0181  2d108f1:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
0186  2d108f6:	e9 b7 00 00 00       	jmp    2d109b2 <vmw_port_hb_in+0x242>
018b  2d108fb:	31 ff                	xor    %edi,%edi
018d  2d108fd:	e8 00 00 00 00       	call   2d10902 <vmw_port_hb_in+0x192>	2d108fe: R_X86_64_PLT32	cc_platform_has-0x4
0192  2d10902:	84 c0                	test   %al,%al
0194  2d10904:	0f 85 d5 fe ff ff    	jne    2d107df <vmw_port_hb_in+0x6f>
019a  2d1090a:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
019e  2d1090e:	48 89 f8             	mov    %rdi,%rax
01a1  2d10911:	48 c1 e8 03          	shr    $0x3,%rax
01a5  2d10915:	0f b6 14 18          	movzbl (%rax,%rbx,1),%edx
01a9  2d10919:	48 89 f8             	mov    %rdi,%rax
01ac  2d1091c:	83 e0 07             	and    $0x7,%eax
01af  2d1091f:	83 c0 03             	add    $0x3,%eax
01b2  2d10922:	38 d0                	cmp    %dl,%al
01b4  2d10924:	7c 08                	jl     2d1092e <vmw_port_hb_in+0x1be>
01b6  2d10926:	84 d2                	test   %dl,%dl
01b8  2d10928:	0f 85 01 01 00 00    	jne    2d10a2f <vmw_port_hb_in+0x2bf>
01be  2d1092e:	48 89 ea             	mov    %rbp,%rdx
01c1  2d10931:	44 8b 6d 08          	mov    0x8(%rbp),%r13d
01c5  2d10935:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01cf  2d1093f:	48 c1 ea 03          	shr    $0x3,%rdx
01d3  2d10943:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
01d7  2d10947:	48 89 e8             	mov    %rbp,%rax
01da  2d1094a:	83 e0 07             	and    $0x7,%eax
01dd  2d1094d:	83 c0 01             	add    $0x1,%eax
01e0  2d10950:	38 d0                	cmp    %dl,%al
01e2  2d10952:	7c 08                	jl     2d1095c <vmw_port_hb_in+0x1ec>
01e4  2d10954:	84 d2                	test   %dl,%dl
01e6  2d10956:	0f 85 ed 00 00 00    	jne    2d10a49 <vmw_port_hb_in+0x2d9>
01ec  2d1095c:	48 8d 7d 04          	lea    0x4(%rbp),%rdi
01f0  2d10960:	0f b7 55 00          	movzwl 0x0(%rbp),%edx
01f4  2d10964:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01fe  2d1096e:	48 89 f9             	mov    %rdi,%rcx
0201  2d10971:	48 c1 e9 03          	shr    $0x3,%rcx
0205  2d10975:	c1 e2 10             	shl    $0x10,%edx
0208  2d10978:	0f b6 0c 01          	movzbl (%rcx,%rax,1),%ecx
020c  2d1097c:	48 89 f8             	mov    %rdi,%rax
020f  2d1097f:	83 e0 07             	and    $0x7,%eax
0212  2d10982:	83 c0 03             	add    $0x3,%eax
0215  2d10985:	38 c8                	cmp    %cl,%al
0217  2d10987:	7c 08                	jl     2d10991 <vmw_port_hb_in+0x221>
0219  2d10989:	84 c9                	test   %cl,%cl
021b  2d1098b:	0f 85 a8 00 00 00    	jne    2d10a39 <vmw_port_hb_in+0x2c9>
0221  2d10991:	8b 75 04             	mov    0x4(%rbp),%esi
0224  2d10994:	83 ca 01             	or     $0x1,%edx
0227  2d10997:	b8 68 58 4d 56       	mov    $0x564d5868,%eax
022c  2d1099c:	bb 00 00 01 00       	mov    $0x10000,%ebx
0231  2d109a1:	4c 89 f1             	mov    %r14,%rcx
0234  2d109a4:	4c 89 ff             	mov    %r15,%rdi
0237  2d109a7:	55                   	push   %rbp
0238  2d109a8:	4c 89 ed             	mov    %r13,%rbp
023b  2d109ab:	66 ba 59 56          	mov    $0x5659,%dx
023f  2d109af:	f3 6c                	rep insb (%dx),%es:(%rdi)
0241  2d109b1:	5d                   	pop    %rbp
0242  2d109b2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
024c  2d109bc:	49 c7 04 04 00 00 00 00 	movq   $0x0,(%r12,%rax,1)
0254  2d109c4:	48 83 c4 70          	add    $0x70,%rsp
0258  2d109c8:	48 89 d8             	mov    %rbx,%rax
025b  2d109cb:	5b                   	pop    %rbx
025c  2d109cc:	5d                   	pop    %rbp
025d  2d109cd:	41 5c                	pop    %r12
025f  2d109cf:	41 5d                	pop    %r13
0261  2d109d1:	41 5e                	pop    %r14
0263  2d109d3:	41 5f                	pop    %r15
0265  2d109d5:	c3                   	ret
0266  2d109d6:	bb 00 00 01 00       	mov    $0x10000,%ebx
026b  2d109db:	eb d5                	jmp    2d109b2 <vmw_port_hb_in+0x242>
026d  2d109dd:	48 8b 3c 24          	mov    (%rsp),%rdi
0271  2d109e1:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
0276  2d109e6:	e8 00 00 00 00       	call   2d109eb <vmw_port_hb_in+0x27b>	2d109e7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
027b  2d109eb:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
0280  2d109f0:	49 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r8
028a  2d109fa:	e9 9b fe ff ff       	jmp    2d1089a <vmw_port_hb_in+0x12a>
028f  2d109ff:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
0294  2d10a04:	e8 00 00 00 00       	call   2d10a09 <vmw_port_hb_in+0x299>	2d10a05: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0299  2d10a09:	49 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r8
02a3  2d10a13:	e9 64 fe ff ff       	jmp    2d1087c <vmw_port_hb_in+0x10c>
02a8  2d10a18:	48 89 ef             	mov    %rbp,%rdi
02ab  2d10a1b:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
02b0  2d10a20:	e8 00 00 00 00       	call   2d10a25 <vmw_port_hb_in+0x2b5>	2d10a21: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
02b5  2d10a25:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
02ba  2d10a2a:	e9 90 fe ff ff       	jmp    2d108bf <vmw_port_hb_in+0x14f>
02bf  2d10a2f:	e8 00 00 00 00       	call   2d10a34 <vmw_port_hb_in+0x2c4>	2d10a30: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
02c4  2d10a34:	e9 f5 fe ff ff       	jmp    2d1092e <vmw_port_hb_in+0x1be>
02c9  2d10a39:	89 14 24             	mov    %edx,(%rsp)
02cc  2d10a3c:	e8 00 00 00 00       	call   2d10a41 <vmw_port_hb_in+0x2d1>	2d10a3d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
02d1  2d10a41:	8b 14 24             	mov    (%rsp),%edx
02d4  2d10a44:	e9 48 ff ff ff       	jmp    2d10991 <vmw_port_hb_in+0x221>
02d9  2d10a49:	48 89 ef             	mov    %rbp,%rdi
02dc  2d10a4c:	e8 00 00 00 00       	call   2d10a51 <vmw_port_hb_in+0x2e1>	2d10a4d: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
02e1  2d10a51:	e9 06 ff ff ff       	jmp    2d1095c <vmw_port_hb_in+0x1ec>
02e6  2d10a56:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
