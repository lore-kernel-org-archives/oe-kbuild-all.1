Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15810605B4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 10:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706610971; cv=none; b=lgFhQoAxw5YO2ed/FJNpr/cs1vQtsz+IeArzi2/89LZTVTeYaR2j2uwGYDXyd1jKRITlVlzghX/QlmPhZAa3wcPmlWy29oQ/gJ3S1SGNgdK1OMOI6Ps2tsuzRys6iGLPdGZ58/x++NQWu/aaqhqafcVwisGO/rKEfMBdNxnQ3Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706610971; c=relaxed/simple;
	bh=If9c8USnPuQ6Us/Uaax1hl19cnHn1M6a2ExMIINZyuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qU4vL/ZjsOv9zqm7Y6cog01S9y7+wEXQMkOzltRK0rT2/Y7T7er3A2CDa2MJEFvOx60evW3z9Yl/Cykz/YOYEtsClR6TfNz2kV3nXFlPNRGlpVUX0mxRKgxB6chyChJXnkFn+bRpl+7Z/0lnx2dbjMgbEIRqViL+Icvo0b4fQMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZ4eArAC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZ4eArAC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706610969; x=1738146969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=If9c8USnPuQ6Us/Uaax1hl19cnHn1M6a2ExMIINZyuY=;
  b=OZ4eArACcYLKGfe2sTSEqdAq+R7vJf2fxd856aZw+/ID3nf6akGJE2gn
   8DzWLkcM/3/0e5txo5A5YVBNADjMnQRhoD8ogED5a8ksPww9eFvOOewr8
   V/KSj3kM3Ljb8mtW8yGxOTj4V4dKdA/XGfbU5TGJGDDvs1Uirt+IBRBIq
   +DaLpLWhqD3asTJgWIK+F5zJyzwtqMu5YSS4HyWBqefJNUR+2QkQwUJJ1
   gSqxzLgtO/vDHeLHVUQ3ySu8GUTaMmUb7kPbcq/NqmquUyHw5maWg1seh
   WoVPGQH/SYMt6jRjx+qxmW+6oMXhTVNTaGpKOijAdntH8I/a7hBrD7ITn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2174025"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="2174025"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 02:36:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="822149484"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="822149484"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Jan 2024 02:36:06 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUlSd-0000CW-2t;
	Tue, 30 Jan 2024 10:35:36 +0000
Date: Tue, 30 Jan 2024 18:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v3 17/22] arch/x86/kernel/sev.o: warning:
 objtool: vc_handle_mmio+0x8d: can't find switch jump table
Message-ID: <202401301803.kBJrJ2fo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v3
head:   e808f1d9ecc40f701330869bdb4f8ce0ad23c774
commit: 842c40c07fd9f102438449c58bbfd8a1a640fbab [17/22] x86/sev: Use PIC codegen for early SEV startup code
config: x86_64-randconfig-161-20240130 (https://download.01.org/0day-ci/archive/20240130/202401301803.kBJrJ2fo-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401301803.kBJrJ2fo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401301803.kBJrJ2fo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/sev.o: warning: objtool: vc_handle_mmio+0x8d: can't find switch jump table


objdump-func vmlinux.o vc_handle_mmio:
0000 0000000000061880 <vc_handle_mmio>:
0000    61880:	41 57                	push   %r15
0002    61882:	41 56                	push   %r14
0004    61884:	41 55                	push   %r13
0006    61886:	41 54                	push   %r12
0008    61888:	4c 8d 66 08          	lea    0x8(%rsi),%r12
000c    6188c:	55                   	push   %rbp
000d    6188d:	53                   	push   %rbx
000e    6188e:	48 89 f5             	mov    %rsi,%rbp
0011    61891:	49 89 fd             	mov    %rdi,%r13
0014    61894:	4c 89 e7             	mov    %r12,%rdi
0017    61897:	48 83 ec 28          	sub    $0x28,%rsp
001b    6189b:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
0020    618a0:	c7 44 24 1c 00 00 00 00 	movl   $0x0,0x1c(%rsp)
0028    618a8:	e8 00 00 00 00       	call   618ad <vc_handle_mmio+0x2d>	618a9: R_X86_64_PLT32	insn_decode_mmio-0x4
002d    618ad:	89 c3                	mov    %eax,%ebx
002f    618af:	85 db                	test   %ebx,%ebx
0031    618b1:	75 0b                	jne    618be <vc_handle_mmio+0x3e>
0033    618b3:	41 bf 03 00 00 00    	mov    $0x3,%r15d
0039    618b9:	e9 93 03 00 00       	jmp    61c51 <vc_handle_mmio+0x3d1>
003e    618be:	89 d8                	mov    %ebx,%eax
0040    618c0:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
0044    618c4:	83 e0 fb             	and    $0xfffffffb,%eax
0047    618c7:	83 f8 02             	cmp    $0x2,%eax
004a    618ca:	74 17                	je     618e3 <vc_handle_mmio+0x63>
004c    618cc:	48 89 fe             	mov    %rdi,%rsi
004f    618cf:	4c 89 e7             	mov    %r12,%rdi
0052    618d2:	e8 00 00 00 00       	call   618d7 <vc_handle_mmio+0x57>	618d3: R_X86_64_PLT32	insn_get_modrm_reg_ptr-0x4
0057    618d7:	48 85 c0             	test   %rax,%rax
005a    618da:	49 89 c6             	mov    %rax,%r14
005d    618dd:	74 d4                	je     618b3 <vc_handle_mmio+0x33>
005f    618df:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
0063    618e3:	f6 87 88 00 00 00 03 	testb  $0x3,0x88(%rdi)
006a    618ea:	41 bf 01 00 00 00    	mov    $0x1,%r15d
0070    618f0:	0f 85 5b 03 00 00    	jne    61c51 <vc_handle_mmio+0x3d1>
0076    618f6:	83 fb 06             	cmp    $0x6,%ebx
0079    618f9:	0f 87 4c 03 00 00    	ja     61c4b <vc_handle_mmio+0x3cb>
007f    618ff:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 61906 <vc_handle_mmio+0x86>	61902: R_X86_64_PC32	.rodata+0x1037c
0086    61906:	48 63 04 9a          	movslq (%rdx,%rbx,4),%rax
008a    6190a:	48 01 d0             	add    %rdx,%rax
008d    6190d:	ff e0                	jmp    *%rax
008f    6190f:	44 8b 64 24 1c       	mov    0x1c(%rsp),%r12d
0094    61914:	4d 8d bd 00 08 00 00 	lea    0x800(%r13),%r15
009b    6191b:	49 81 fc f0 07 00 00 	cmp    $0x7f0,%r12
00a2    61922:	4c 89 e3             	mov    %r12,%rbx
00a5    61925:	76 35                	jbe    6195c <vc_handle_mmio+0xdc>
00a7    61927:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 6192e <vc_handle_mmio+0xae>	61929: R_X86_64_PC32	.data.once+0x4b
00ae    6192e:	75 2c                	jne    6195c <vc_handle_mmio+0xdc>
00b0    61930:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 61937 <vc_handle_mmio+0xb7>	61932: R_X86_64_PC32	.data.once+0x4b
00b7    61937:	90                   	nop
00b8    61938:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 6193f <vc_handle_mmio+0xbf>	6193b: R_X86_64_PC32	.LC17-0x4
00bf    6193f:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 61946 <vc_handle_mmio+0xc6>	61942: R_X86_64_PC32	.LC18-0x4
00c6    61946:	b9 f0 07 00 00       	mov    $0x7f0,%ecx
00cb    6194b:	4c 89 e6             	mov    %r12,%rsi
00ce    6194e:	e8 00 00 00 00       	call   61953 <vc_handle_mmio+0xd3>	6194f: R_X86_64_PLT32	__warn_printk-0x4
00d3    61953:	90                   	nop
00d4    61954:	0f 0b                	ud2
00d6    61956:	90                   	nop
00d7    61957:	90                   	nop
00d8    61958:	8b 5c 24 1c          	mov    0x1c(%rsp),%ebx
00dc    6195c:	4c 89 e2             	mov    %r12,%rdx
00df    6195f:	4c 89 f6             	mov    %r14,%rsi
00e2    61962:	4c 89 ff             	mov    %r15,%rdi
00e5    61965:	eb 5a                	jmp    619c1 <vc_handle_mmio+0x141>
00e7    61967:	44 8b 64 24 1c       	mov    0x1c(%rsp),%r12d
00ec    6196c:	4d 8d b5 00 08 00 00 	lea    0x800(%r13),%r14
00f3    61973:	4c 8d 7d 40          	lea    0x40(%rbp),%r15
00f7    61977:	49 81 fc f0 07 00 00 	cmp    $0x7f0,%r12
00fe    6197e:	4c 89 e3             	mov    %r12,%rbx
0101    61981:	76 35                	jbe    619b8 <vc_handle_mmio+0x138>
0103    61983:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 6198a <vc_handle_mmio+0x10a>	61985: R_X86_64_PC32	.data.once+0x4a
010a    6198a:	75 2c                	jne    619b8 <vc_handle_mmio+0x138>
010c    6198c:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 61993 <vc_handle_mmio+0x113>	6198e: R_X86_64_PC32	.data.once+0x4a
0113    61993:	90                   	nop
0114    61994:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 6199b <vc_handle_mmio+0x11b>	61997: R_X86_64_PC32	.LC19-0x4
011b    6199b:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 619a2 <vc_handle_mmio+0x122>	6199e: R_X86_64_PC32	.LC18-0x4
0122    619a2:	b9 f0 07 00 00       	mov    $0x7f0,%ecx
0127    619a7:	4c 89 e6             	mov    %r12,%rsi
012a    619aa:	e8 00 00 00 00       	call   619af <vc_handle_mmio+0x12f>	619ab: R_X86_64_PLT32	__warn_printk-0x4
012f    619af:	90                   	nop
0130    619b0:	0f 0b                	ud2
0132    619b2:	90                   	nop
0133    619b3:	90                   	nop
0134    619b4:	8b 5c 24 1c          	mov    0x1c(%rsp),%ebx
0138    619b8:	4c 89 e2             	mov    %r12,%rdx
013b    619bb:	4c 89 fe             	mov    %r15,%rsi
013e    619be:	4c 89 f7             	mov    %r14,%rdi
0141    619c1:	e8 00 00 00 00       	call   619c6 <vc_handle_mmio+0x146>	619c2: R_X86_64_PLT32	memcpy-0x4
0146    619c6:	31 c9                	xor    %ecx,%ecx
0148    619c8:	89 da                	mov    %ebx,%edx
014a    619ca:	48 89 ee             	mov    %rbp,%rsi
014d    619cd:	4c 89 ef             	mov    %r13,%rdi
0150    619d0:	e8 eb fc ff ff       	call   616c0 <vc_do_mmio>
0155    619d5:	41 89 c7             	mov    %eax,%r15d
0158    619d8:	e9 74 02 00 00       	jmp    61c51 <vc_handle_mmio+0x3d1>
015d    619dd:	8b 54 24 1c          	mov    0x1c(%rsp),%edx
0161    619e1:	b9 01 00 00 00       	mov    $0x1,%ecx
0166    619e6:	48 89 ee             	mov    %rbp,%rsi
0169    619e9:	4c 89 ef             	mov    %r13,%rdi
016c    619ec:	e8 cf fc ff ff       	call   616c0 <vc_do_mmio>
0171    619f1:	85 c0                	test   %eax,%eax
0173    619f3:	41 89 c7             	mov    %eax,%r15d
0176    619f6:	0f 85 55 02 00 00    	jne    61c51 <vc_handle_mmio+0x3d1>
017c    619fc:	8b 54 24 1c          	mov    0x1c(%rsp),%edx
0180    61a00:	83 fa 04             	cmp    $0x4,%edx
0183    61a03:	75 0b                	jne    61a10 <vc_handle_mmio+0x190>
0185    61a05:	49 c7 06 00 00 00 00 	movq   $0x0,(%r14)
018c    61a0c:	8b 54 24 1c          	mov    0x1c(%rsp),%edx
0190    61a10:	49 8d b5 00 08 00 00 	lea    0x800(%r13),%rsi
0197    61a17:	4c 89 f7             	mov    %r14,%rdi
019a    61a1a:	e8 00 00 00 00       	call   61a1f <vc_handle_mmio+0x19f>	61a1b: R_X86_64_PLT32	memcpy-0x4
019f    61a1f:	e9 2d 02 00 00       	jmp    61c51 <vc_handle_mmio+0x3d1>
01a4    61a24:	8b 54 24 1c          	mov    0x1c(%rsp),%edx
01a8    61a28:	b9 01 00 00 00       	mov    $0x1,%ecx
01ad    61a2d:	48 89 ee             	mov    %rbp,%rsi
01b0    61a30:	4c 89 ef             	mov    %r13,%rdi
01b3    61a33:	e8 88 fc ff ff       	call   616c0 <vc_do_mmio>
01b8    61a38:	85 c0                	test   %eax,%eax
01ba    61a3a:	41 89 c7             	mov    %eax,%r15d
01bd    61a3d:	0f 85 0e 02 00 00    	jne    61c51 <vc_handle_mmio+0x3d1>
01c3    61a43:	0f b6 45 58          	movzbl 0x58(%rbp),%eax
01c7    61a47:	83 f8 08             	cmp    $0x8,%eax
01ca    61a4a:	73 2c                	jae    61a78 <vc_handle_mmio+0x1f8>
01cc    61a4c:	a8 04                	test   $0x4,%al
01ce    61a4e:	74 12                	je     61a62 <vc_handle_mmio+0x1e2>
01d0    61a50:	41 c7 06 00 00 00 00 	movl   $0x0,(%r14)
01d7    61a57:	41 c7 44 06 fc 00 00 00 00 	movl   $0x0,-0x4(%r14,%rax,1)
01e0    61a60:	eb aa                	jmp    61a0c <vc_handle_mmio+0x18c>
01e2    61a62:	85 c0                	test   %eax,%eax
01e4    61a64:	74 a6                	je     61a0c <vc_handle_mmio+0x18c>
01e6    61a66:	a8 02                	test   $0x2,%al
01e8    61a68:	41 c6 06 00          	movb   $0x0,(%r14)
01ec    61a6c:	74 9e                	je     61a0c <vc_handle_mmio+0x18c>
01ee    61a6e:	66 41 c7 44 06 fe 00 00 	movw   $0x0,-0x2(%r14,%rax,1)
01f6    61a76:	eb 94                	jmp    61a0c <vc_handle_mmio+0x18c>
01f8    61a78:	49 8d 7e 08          	lea    0x8(%r14),%rdi
01fc    61a7c:	4c 89 f2             	mov    %r14,%rdx
01ff    61a7f:	49 c7 06 00 00 00 00 	movq   $0x0,(%r14)
0206    61a86:	49 c7 44 06 f8 00 00 00 00 	movq   $0x0,-0x8(%r14,%rax,1)
020f    61a8f:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
0213    61a93:	48 29 fa             	sub    %rdi,%rdx
0216    61a96:	01 d0                	add    %edx,%eax
0218    61a98:	c1 e8 03             	shr    $0x3,%eax
021b    61a9b:	89 c1                	mov    %eax,%ecx
021d    61a9d:	31 c0                	xor    %eax,%eax
021f    61a9f:	f3 48 ab             	rep stos %rax,%es:(%rdi)
0222    61aa2:	e9 65 ff ff ff       	jmp    61a0c <vc_handle_mmio+0x18c>
0227    61aa7:	8b 54 24 1c          	mov    0x1c(%rsp),%edx
022b    61aab:	b9 01 00 00 00       	mov    $0x1,%ecx
0230    61ab0:	48 89 ee             	mov    %rbp,%rsi
0233    61ab3:	4c 89 ef             	mov    %r13,%rdi
0236    61ab6:	e8 05 fc ff ff       	call   616c0 <vc_do_mmio>
023b    61abb:	85 c0                	test   %eax,%eax
023d    61abd:	41 89 c7             	mov    %eax,%r15d
0240    61ac0:	0f 85 8b 01 00 00    	jne    61c51 <vc_handle_mmio+0x3d1>
0246    61ac6:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%rsp)
024b    61acb:	75 0d                	jne    61ada <vc_handle_mmio+0x25a>
024d    61acd:	41 0f b6 85 00 08 00 00 	movzbl 0x800(%r13),%eax
0255    61ad5:	c0 f8 07             	sar    $0x7,%al
0258    61ad8:	eb 0c                	jmp    61ae6 <vc_handle_mmio+0x266>
025a    61ada:	41 0f b7 85 00 08 00 00 	movzwl 0x800(%r13),%eax
0262    61ae2:	66 c1 f8 0f          	sar    $0xf,%ax
0266    61ae6:	0f b6 55 58          	movzbl 0x58(%rbp),%edx
026a    61aea:	0f b6 c0             	movzbl %al,%eax
026d    61aed:	48 b9 01 01 01 01 01 01 01 01 	movabs $0x101010101010101,%rcx
0277    61af7:	48 0f af c1          	imul   %rcx,%rax
027b    61afb:	83 fa 08             	cmp    $0x8,%edx
027e    61afe:	73 31                	jae    61b31 <vc_handle_mmio+0x2b1>
0280    61b00:	f6 c2 04             	test   $0x4,%dl
0283    61b03:	74 0d                	je     61b12 <vc_handle_mmio+0x292>
0285    61b05:	41 89 06             	mov    %eax,(%r14)
0288    61b08:	41 89 44 16 fc       	mov    %eax,-0x4(%r14,%rdx,1)
028d    61b0d:	e9 fa fe ff ff       	jmp    61a0c <vc_handle_mmio+0x18c>
0292    61b12:	85 d2                	test   %edx,%edx
0294    61b14:	0f 84 f2 fe ff ff    	je     61a0c <vc_handle_mmio+0x18c>
029a    61b1a:	f6 c2 02             	test   $0x2,%dl
029d    61b1d:	41 88 06             	mov    %al,(%r14)
02a0    61b20:	0f 84 e6 fe ff ff    	je     61a0c <vc_handle_mmio+0x18c>
02a6    61b26:	66 41 89 44 16 fe    	mov    %ax,-0x2(%r14,%rdx,1)
02ac    61b2c:	e9 db fe ff ff       	jmp    61a0c <vc_handle_mmio+0x18c>
02b1    61b31:	49 8d 7e 08          	lea    0x8(%r14),%rdi
02b5    61b35:	4c 89 f1             	mov    %r14,%rcx
02b8    61b38:	49 89 06             	mov    %rax,(%r14)
02bb    61b3b:	49 89 44 16 f8       	mov    %rax,-0x8(%r14,%rdx,1)
02c0    61b40:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
02c4    61b44:	48 29 f9             	sub    %rdi,%rcx
02c7    61b47:	01 ca                	add    %ecx,%edx
02c9    61b49:	c1 ea 03             	shr    $0x3,%edx
02cc    61b4c:	89 d1                	mov    %edx,%ecx
02ce    61b4e:	f3 48 ab             	rep stos %rax,%es:(%rdi)
02d1    61b51:	e9 b6 fe ff ff       	jmp    61a0c <vc_handle_mmio+0x18c>
02d6    61b56:	be 04 00 00 00       	mov    $0x4,%esi
02db    61b5b:	44 8b 6c 24 1c       	mov    0x1c(%rsp),%r13d
02e0    61b60:	e8 00 00 00 00       	call   61b65 <vc_handle_mmio+0x2e5>	61b61: R_X86_64_PLT32	insn_get_seg_base-0x4
02e5    61b65:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
02e9    61b69:	48 89 c3             	mov    %rax,%rbx
02ec    61b6c:	be 05 00 00 00       	mov    $0x5,%esi
02f1    61b71:	e8 00 00 00 00       	call   61b76 <vc_handle_mmio+0x2f6>	61b72: R_X86_64_PLT32	insn_get_seg_base-0x4
02f6    61b76:	48 83 fb ff          	cmp    $0xffffffffffffffff,%rbx
02fa    61b7a:	74 06                	je     61b82 <vc_handle_mmio+0x302>
02fc    61b7c:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
0300    61b80:	75 1e                	jne    61ba0 <vc_handle_mmio+0x320>
0302    61b82:	48 c7 45 78 0d 00 00 00 	movq   $0xd,0x78(%rbp)
030a    61b8a:	48 c7 85 80 00 00 00 00 00 00 00 	movq   $0x0,0x80(%rbp)
0315    61b95:	41 bf 04 00 00 00    	mov    $0x4,%r15d
031b    61b9b:	e9 b1 00 00 00       	jmp    61c51 <vc_handle_mmio+0x3d1>
0320    61ba0:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0325    61ba5:	48 8b 45 00          	mov    0x0(%rbp),%rax
0329    61ba9:	4c 8d 74 24 20       	lea    0x20(%rsp),%r14
032e    61bae:	45 89 ea             	mov    %r13d,%r10d
0331    61bb1:	48 89 ef             	mov    %rbp,%rdi
0334    61bb4:	4c 89 f2             	mov    %r14,%rdx
0337    61bb7:	4c 89 14 24          	mov    %r10,(%rsp)
033b    61bbb:	48 03 58 68          	add    0x68(%rax),%rbx
033f    61bbf:	48 8b 48 70          	mov    0x70(%rax),%rcx
0343    61bc3:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
0348    61bc8:	4c 89 d1             	mov    %r10,%rcx
034b    61bcb:	48 89 de             	mov    %rbx,%rsi
034e    61bce:	e8 ad f1 ff ff       	call   60d80 <vc_read_mem>
0353    61bd3:	85 c0                	test   %eax,%eax
0355    61bd5:	41 89 c7             	mov    %eax,%r15d
0358    61bd8:	4c 8b 14 24          	mov    (%rsp),%r10
035c    61bdc:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0361    61be1:	75 6e                	jne    61c51 <vc_handle_mmio+0x3d1>
0363    61be3:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
0368    61be8:	4c 89 d1             	mov    %r10,%rcx
036b    61beb:	4c 89 f2             	mov    %r14,%rdx
036e    61bee:	48 89 ef             	mov    %rbp,%rdi
0371    61bf1:	4c 01 c6             	add    %r8,%rsi
0374    61bf4:	e8 c7 f3 ff ff       	call   60fc0 <vc_write_mem>
0379    61bf9:	85 c0                	test   %eax,%eax
037b    61bfb:	41 89 c7             	mov    %eax,%r15d
037e    61bfe:	75 51                	jne    61c51 <vc_handle_mmio+0x3d1>
0380    61c00:	48 8b 55 00          	mov    0x0(%rbp),%rdx
0384    61c04:	44 89 e8             	mov    %r13d,%eax
0387    61c07:	4c 89 e7             	mov    %r12,%rdi
038a    61c0a:	f7 d8                	neg    %eax
038c    61c0c:	f6 82 91 00 00 00 04 	testb  $0x4,0x91(%rdx)
0393    61c13:	41 0f 44 c5          	cmove  %r13d,%eax
0397    61c17:	48 98                	cltq
0399    61c19:	48 01 42 68          	add    %rax,0x68(%rdx)
039d    61c1d:	48 8b 55 00          	mov    0x0(%rbp),%rdx
03a1    61c21:	48 01 42 70          	add    %rax,0x70(%rdx)
03a5    61c25:	e8 00 00 00 00       	call   61c2a <vc_handle_mmio+0x3aa>	61c26: R_X86_64_PLT32	insn_has_rep_prefix-0x4
03aa    61c2a:	84 c0                	test   %al,%al
03ac    61c2c:	74 23                	je     61c51 <vc_handle_mmio+0x3d1>
03ae    61c2e:	48 8b 45 00          	mov    0x0(%rbp),%rax
03b2    61c32:	48 83 68 58 01       	subq   $0x1,0x58(%rax)
03b7    61c37:	48 8b 45 00          	mov    0x0(%rbp),%rax
03bb    61c3b:	48 83 78 58 00       	cmpq   $0x0,0x58(%rax)
03c0    61c40:	b8 05 00 00 00       	mov    $0x5,%eax
03c5    61c45:	44 0f 45 f8          	cmovne %eax,%r15d
03c9    61c49:	eb 06                	jmp    61c51 <vc_handle_mmio+0x3d1>
03cb    61c4b:	41 bf 01 00 00 00    	mov    $0x1,%r15d
03d1    61c51:	48 83 c4 28          	add    $0x28,%rsp
03d5    61c55:	44 89 f8             	mov    %r15d,%eax
03d8    61c58:	5b                   	pop    %rbx
03d9    61c59:	5d                   	pop    %rbp
03da    61c5a:	41 5c                	pop    %r12
03dc    61c5c:	41 5d                	pop    %r13
03de    61c5e:	41 5e                	pop    %r14
03e0    61c60:	41 5f                	pop    %r15
03e2    61c62:	c3                   	ret
03e3    61c63:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
03ee    61c6e:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
03f9    61c79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
