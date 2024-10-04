Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4331620FAA1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 14:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728052946; cv=none; b=WScnFPocgILJRS2sWICuzG+mWLtuNkV65/sYb3z/mTr47jOaQrYckZ5rp9yLuT7IW/UzCdpXfm8wPK3YynnORIf916aHQknWNkTsHqIxlsnbXPUhDrwZXIMklQlf/GXiQbYZ67d2cgaw1Koae3lqzrQFb2/HVotlOHNCvnkqevU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728052946; c=relaxed/simple;
	bh=tHnRf/hg1tnwVevQIjtKLcgBIm7EW+/REy1ozs7LFv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UBccnmZqphOPlelMnO0PMWM+caJsG8MuTuHMuM1j9viqomtDtleUGRCRBAFCkGXRha6MpJiCL4nUDMt8fFwla03dY8p6PJOM0F2vksoy9t96gDBP6UMGPMB64OTGGKg56OeWWBIApYRuZJ89c0wBacafG4nxXPR1mKjPvbwYhug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcLzsOCn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcLzsOCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728052943; x=1759588943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tHnRf/hg1tnwVevQIjtKLcgBIm7EW+/REy1ozs7LFv8=;
  b=EcLzsOCn2qrYBKG5Yq/fIgFyNJF7WrySLwmjRWrGREQI5xjpJD6Rch2O
   k4Oebbrw4N/5/2qa3VveGwpJ0yG5A6C1G2ckodNTS7asoKmEhro2gKAiy
   SZnbH1AqSf+yiDSjJq4Z6M7zW3L9FiBIOXJ4Dzi4n/RZf6I9jlbFxD3eH
   brkhLHMuCHx0AhZepm39vR72FalyqTtFXoBZMEfvMUi/gLe7FsMzYelx0
   C+pDp9TWK1abqNGEERRSQVbfsLiW9I4omxOJzJuf3tHSPL3gpBgMqOOve
   rFX3D1T1xhkiEooUHgwcmSPIX5ASWgJIwdAs07xyeCsHDIqr9DKHHopVJ
   A==;
X-CSE-ConnectionGUID: J4QyyeibReGjjbHM1Wu9HA==
X-CSE-MsgGUID: 8xnhTwvCQ0utXwj0oFt33A==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37846850"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37846850"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 07:42:22 -0700
X-CSE-ConnectionGUID: b5Oy94aBR3WYowtSiXK16w==
X-CSE-MsgGUID: 4jbTR1LNTzGY09u7ib5B3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="78716307"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Oct 2024 07:42:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swjVc-0001li-1B;
	Fri, 04 Oct 2024 14:42:20 +0000
Date: Fri, 4 Oct 2024 22:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 28/31] arch/x86/events/utils.o: warning: objtool:
 decode_branch_type+0x64: stack state mismatch: cfa1=4+8 cfa2=4+24
Message-ID: <202410042207.L0g0AlK4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v2
head:   a0fcfaeb880efafae2658440c4a136d936442d4e
commit: c5a8bf8bcd7fe8f90221ba108c20650617c16fa2 [28/31] x86: Use PIE codegen for the core kernel
config: x86_64-randconfig-001-20241004 (https://download.01.org/0day-ci/archive/20241004/202410042207.L0g0AlK4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042207.L0g0AlK4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410042207.L0g0AlK4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/utils.o: warning: objtool: decode_branch_type+0x64: stack state mismatch: cfa1=4+8 cfa2=4+24
--
>> net/ipv4/inet_fragment.o: warning: objtool: jhash+0x1ab: can't find switch jump table
--
>> drivers/tty/serial/8250/8250_early.o: warning: objtool: serial8250_early_in+0x9d: stack state mismatch: cfa1=4+24 cfa2=4+32
--
>> drivers/tty/serial/8250/8250_port.o: warning: objtool: set_io_from_upio+0xba: can't find switch jump table
--
>> mm/kasan/report_generic.o: warning: objtool: kasan_complete_mode_report_info+0xf0: can't find switch jump table
--
>> net/9p/error.o: warning: objtool: jhash.constprop.0+0x1ab: can't find switch jump table
--
>> kernel/trace/blktrace.o: warning: objtool: blk_fill_rwbs+0x73: can't find switch jump table
--
>> net/ipv6/addrconf.o: warning: objtool: ipv6_generate_eui64+0x9d: stack state mismatch: cfa1=4+24 cfa2=4+32
--
>> net/ipv6/ioam6.o: warning: objtool: jhash+0x1ab: can't find switch jump table
--
>> net/handshake/request.o: warning: objtool: jhash+0x1ab: can't find switch jump table
--
>> fs/xfs/xfs_buf.o: warning: objtool: jhash+0x1ab: can't find switch jump table
..


objdump-func vmlinux.o decode_branch_type:
0000 0000000000012690 <decode_branch_type>:
0000    12690:	55                   	push   %rbp
0001    12691:	53                   	push   %rbx
0002    12692:	48 89 fb             	mov    %rdi,%rbx
0005    12695:	e8 00 00 00 00       	call   1269a <decode_branch_type+0xa>	12696: R_X86_64_PLT32	insn_get_opcode-0x4
000a    1269a:	85 c0                	test   %eax,%eax
000c    1269c:	75 5d                	jne    126fb <decode_branch_type+0x6b>
000e    1269e:	48 8d 7b 18          	lea    0x18(%rbx),%rdi
0012    126a2:	89 c5                	mov    %eax,%ebp
0014    126a4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
001e    126ae:	48 89 fa             	mov    %rdi,%rdx
0021    126b1:	48 c1 ea 03          	shr    $0x3,%rdx
0025    126b5:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0029    126b9:	84 c0                	test   %al,%al
002b    126bb:	74 06                	je     126c3 <decode_branch_type+0x33>
002d    126bd:	0f 8e 9d 01 00 00    	jle    12860 <decode_branch_type+0x1d0>
0033    126c3:	0f b6 43 18          	movzbl 0x18(%rbx),%eax
0037    126c7:	3c 99                	cmp    $0x99,%al
0039    126c9:	76 1a                	jbe    126e5 <decode_branch_type+0x55>
003b    126cb:	8d 50 66             	lea    0x66(%rax),%edx
003e    126ce:	3c 9a                	cmp    $0x9a,%al
0040    126d0:	72 1e                	jb     126f0 <decode_branch_type+0x60>
0042    126d2:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 126d9 <decode_branch_type+0x49>	126d5: R_X86_64_PC32	.rodata+0x6b1c
0049    126d9:	0f b6 d2             	movzbl %dl,%edx
004c    126dc:	48 63 04 91          	movslq (%rcx,%rdx,4),%rax
0050    126e0:	48 01 c8             	add    %rcx,%rax
0053    126e3:	ff e0                	jmp    *%rax
0055    126e5:	3c 0f                	cmp    $0xf,%al
0057    126e7:	74 22                	je     1270b <decode_branch_type+0x7b>
0059    126e9:	83 e8 70             	sub    $0x70,%eax
005c    126ec:	3c 0f                	cmp    $0xf,%al
005e    126ee:	76 57                	jbe    12747 <decode_branch_type+0xb7>
0060    126f0:	89 e8                	mov    %ebp,%eax
0062    126f2:	5b                   	pop    %rbx
0063    126f3:	5d                   	pop    %rbp
0064    126f4:	31 d2                	xor    %edx,%edx
0066    126f6:	31 c9                	xor    %ecx,%ecx
0068    126f8:	31 ff                	xor    %edi,%edi
006a    126fa:	c3                   	ret
006b    126fb:	bd 00 10 00 00       	mov    $0x1000,%ebp
0070    12700:	5b                   	pop    %rbx
0071    12701:	89 e8                	mov    %ebp,%eax
0073    12703:	5d                   	pop    %rbp
0074    12704:	31 d2                	xor    %edx,%edx
0076    12706:	31 c9                	xor    %ecx,%ecx
0078    12708:	31 ff                	xor    %edi,%edi
007a    1270a:	c3                   	ret
007b    1270b:	48 8d 7b 19          	lea    0x19(%rbx),%rdi
007f    1270f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0089    12719:	48 89 fa             	mov    %rdi,%rdx
008c    1271c:	48 c1 ea 03          	shr    $0x3,%rdx
0090    12720:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0094    12724:	48 89 fa             	mov    %rdi,%rdx
0097    12727:	83 e2 07             	and    $0x7,%edx
009a    1272a:	38 d0                	cmp    %dl,%al
009c    1272c:	0f 8e f4 00 00 00    	jle    12826 <decode_branch_type+0x196>
00a2    12732:	0f b6 43 19          	movzbl 0x19(%rbx),%eax
00a6    12736:	3c 35                	cmp    $0x35,%al
00a8    12738:	0f 84 2c 01 00 00    	je     1286a <decode_branch_type+0x1da>
00ae    1273e:	76 0e                	jbe    1274e <decode_branch_type+0xbe>
00b0    12740:	83 c0 80             	add    $0xffffff80,%eax
00b3    12743:	3c 0f                	cmp    $0xf,%al
00b5    12745:	77 a9                	ja     126f0 <decode_branch_type+0x60>
00b7    12747:	bd 00 01 00 00       	mov    $0x100,%ebp
00bc    1274c:	eb a2                	jmp    126f0 <decode_branch_type+0x60>
00be    1274e:	3c 07                	cmp    $0x7,%al
00c0    12750:	0f 84 14 01 00 00    	je     1286a <decode_branch_type+0x1da>
00c6    12756:	3c 34                	cmp    $0x34,%al
00c8    12758:	0f 84 da 00 00 00    	je     12838 <decode_branch_type+0x1a8>
00ce    1275e:	3c 05                	cmp    $0x5,%al
00d0    12760:	b8 10 00 00 00       	mov    $0x10,%eax
00d5    12765:	0f 44 e8             	cmove  %eax,%ebp
00d8    12768:	eb 86                	jmp    126f0 <decode_branch_type+0x60>
00da    1276a:	bd 40 00 00 00       	mov    $0x40,%ebp
00df    1276f:	e9 7c ff ff ff       	jmp    126f0 <decode_branch_type+0x60>
00e4    12774:	bd 00 02 00 00       	mov    $0x200,%ebp
00e9    12779:	e9 72 ff ff ff       	jmp    126f0 <decode_branch_type+0x60>
00ee    1277e:	48 89 df             	mov    %rbx,%rdi
00f1    12781:	e8 00 00 00 00       	call   12786 <decode_branch_type+0xf6>	12782: R_X86_64_PLT32	insn_get_modrm-0x4
00f6    12786:	85 c0                	test   %eax,%eax
00f8    12788:	0f 85 6d ff ff ff    	jne    126fb <decode_branch_type+0x6b>
00fe    1278e:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
0102    12792:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
010c    1279c:	48 89 fa             	mov    %rdi,%rdx
010f    1279f:	48 c1 ea 03          	shr    $0x3,%rdx
0113    127a3:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0117    127a7:	84 c0                	test   %al,%al
0119    127a9:	74 07                	je     127b2 <decode_branch_type+0x122>
011b    127ab:	7f 05                	jg     127b2 <decode_branch_type+0x122>
011d    127ad:	e8 00 00 00 00       	call   127b2 <decode_branch_type+0x122>	127ae: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0122    127b2:	0f b6 43 20          	movzbl 0x20(%rbx),%eax
0126    127b6:	c0 e8 03             	shr    $0x3,%al
0129    127b9:	89 c2                	mov    %eax,%edx
012b    127bb:	83 e2 07             	and    $0x7,%edx
012e    127be:	a8 04                	test   $0x4,%al
0130    127c0:	74 12                	je     127d4 <decode_branch_type+0x144>
0132    127c2:	8d 42 fc             	lea    -0x4(%rdx),%eax
0135    127c5:	3c 01                	cmp    $0x1,%al
0137    127c7:	b8 00 00 02 00       	mov    $0x20000,%eax
013c    127cc:	0f 46 e8             	cmovbe %eax,%ebp
013f    127cf:	e9 1c ff ff ff       	jmp    126f0 <decode_branch_type+0x60>
0144    127d4:	a8 06                	test   $0x6,%al
0146    127d6:	b8 00 08 00 00       	mov    $0x800,%eax
014b    127db:	0f 45 e8             	cmovne %eax,%ebp
014e    127de:	e9 0d ff ff ff       	jmp    126f0 <decode_branch_type+0x60>
0153    127e3:	48 89 df             	mov    %rbx,%rdi
0156    127e6:	e8 00 00 00 00       	call   127eb <decode_branch_type+0x15b>	127e7: R_X86_64_PLT32	insn_get_immediate-0x4
015b    127eb:	85 c0                	test   %eax,%eax
015d    127ed:	75 5d                	jne    1284c <decode_branch_type+0x1bc>
015f    127ef:	48 8d 7b 38          	lea    0x38(%rbx),%rdi
0163    127f3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
016d    127fd:	48 89 fa             	mov    %rdi,%rdx
0170    12800:	48 c1 ea 03          	shr    $0x3,%rdx
0174    12804:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0178    12808:	84 c0                	test   %al,%al
017a    1280a:	74 09                	je     12815 <decode_branch_type+0x185>
017c    1280c:	3c 03                	cmp    $0x3,%al
017e    1280e:	7f 05                	jg     12815 <decode_branch_type+0x185>
0180    12810:	e8 00 00 00 00       	call   12815 <decode_branch_type+0x185>	12811: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0185    12815:	8b 43 38             	mov    0x38(%rbx),%eax
0188    12818:	85 c0                	test   %eax,%eax
018a    1281a:	74 30                	je     1284c <decode_branch_type+0x1bc>
018c    1281c:	bd 04 00 00 00       	mov    $0x4,%ebp
0191    12821:	e9 ca fe ff ff       	jmp    126f0 <decode_branch_type+0x60>
0196    12826:	84 c0                	test   %al,%al
0198    12828:	0f 84 04 ff ff ff    	je     12732 <decode_branch_type+0xa2>
019e    1282e:	e8 00 00 00 00       	call   12833 <decode_branch_type+0x1a3>	1282f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
01a3    12833:	e9 fa fe ff ff       	jmp    12732 <decode_branch_type+0xa2>
01a8    12838:	bd 10 00 00 00       	mov    $0x10,%ebp
01ad    1283d:	e9 ae fe ff ff       	jmp    126f0 <decode_branch_type+0x60>
01b2    12842:	bd 08 00 00 00       	mov    $0x8,%ebp
01b7    12847:	e9 a4 fe ff ff       	jmp    126f0 <decode_branch_type+0x60>
01bc    1284c:	bd 00 80 00 00       	mov    $0x8000,%ebp
01c1    12851:	e9 9a fe ff ff       	jmp    126f0 <decode_branch_type+0x60>
01c6    12856:	bd 80 00 00 00       	mov    $0x80,%ebp
01cb    1285b:	e9 90 fe ff ff       	jmp    126f0 <decode_branch_type+0x60>
01d0    12860:	e8 00 00 00 00       	call   12865 <decode_branch_type+0x1d5>	12861: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
01d5    12865:	e9 59 fe ff ff       	jmp    126c3 <decode_branch_type+0x33>
01da    1286a:	bd 20 00 00 00       	mov    $0x20,%ebp
01df    1286f:	e9 7c fe ff ff       	jmp    126f0 <decode_branch_type+0x60>
01e4    12874:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
01ef    1287f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
