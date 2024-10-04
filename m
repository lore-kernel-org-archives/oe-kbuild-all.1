Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17446156678
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049885; cv=none; b=FGii7uNIOMdXEVfB6ta2cEAZCXCz9Fb4y+MNNu+ShQGOcjN/WBQpEVCfoG8PO+DO/KaPZ3X50UMKBWzGmRoPkfSoTZOi9rAR5vvJznzYL//I4roYIhHZSwZl+TdUhKvfeW2zSNejo0nfAmfACCOjojvBJOyWBFKEMzc57FG6vl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049885; c=relaxed/simple;
	bh=FQkhv4EUDXiEVoUeY9fpCYUl5KVLs/3dKknnlVQ2lcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IOC+HPqGASwljhnNDzVpNXogRc4bedzg/LGELGz0uqgjUWdciXvs9uk4B83zXyFsDRNdvHHvhqAagZ4+R347SJkVl3xd1z8euSq+ie0eUE8shb6p0qmbqRez9j44GllvHDkc9FOqW24ED48UPaw+LQZ6S2tHC2+FzQwpww53xUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBTUDnVV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBTUDnVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728049883; x=1759585883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FQkhv4EUDXiEVoUeY9fpCYUl5KVLs/3dKknnlVQ2lcE=;
  b=LBTUDnVVkGFooh7XhIPeQaq1it67BAR4egtp7jS/TgSIXnf9Am/+Xq7e
   oOxHNdIdEwPYkGHew1WK+rHBUwDJ6z6KYQTw/m1f1J8UELztkpp8FlA6M
   ZEaH/H74gDixopDbaGZUQjb7CBtyDH5BbSdiXKanQMUU/Xutz8sAwK3OF
   6aLuv54KgUCzGhYHmyz/Q2Fo1GCYFvbtKEX/Xe4IldUkB7xAj1KRqZ084
   YcIF6Ul8y5/VlB2tmEewbANIgsFCEVMSH2xRDwwiOzwogGKo/hHcKMUkn
   gODyX9tCArVO8SxUlo4t5FNJ880tke9uhwrNEKwbB9YQDBUtYE4lupydh
   A==;
X-CSE-ConnectionGUID: UrIUxYsZTmOKoeNeUgVPkw==
X-CSE-MsgGUID: 0Ak1kVW9T3ChUmbFbrNO2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37875651"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37875651"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 06:51:23 -0700
X-CSE-ConnectionGUID: wN7mfSKFQb64Si/BAnep9g==
X-CSE-MsgGUID: VtTzW2DFToSiBJTkdSmITw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105554975"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Oct 2024 06:51:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swiiE-0001ie-21;
	Fri, 04 Oct 2024 13:51:18 +0000
Date: Fri, 4 Oct 2024 21:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 28/31] mm/shmem.o: warning: objtool:
 shmem_parse_one+0x73: can't find switch jump table
Message-ID: <202410042130.SZph6z49-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-002-20241004 (https://download.01.org/0day-ci/archive/20241004/202410042130.SZph6z49-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042130.SZph6z49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410042130.SZph6z49-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.o: warning: objtool: shmem_parse_one+0x73: can't find switch jump table
--
>> mm/fadvise.o: warning: objtool: generic_fadvise+0xe4: can't find switch jump table
--
>> ipc/shm.o: warning: objtool: ksys_shmctl.constprop.0+0x8c: can't find switch jump table
--
>> ipc/sem.o: warning: objtool: ksys_semctl.constprop.0+0x78: can't find switch jump table
--
>> ipc/util.o: warning: objtool: jhash+0xef: can't find switch jump table
--
>> ipc/msg.o: warning: objtool: testmsg+0x39: can't find switch jump table
--
>> arch/x86/events/utils.o: warning: objtool: decode_branch_type+0x5f: can't find switch jump table
--
>> arch/x86/kernel/e820.o: warning: objtool: e820_type_to_string+0x70: can't find switch jump table
--
>> arch/x86/kernel/i8237.o: warning: objtool: i8237A_resume+0x60: can't find switch jump table
--
>> fs/ioctl.o: warning: objtool: do_vfs_ioctl+0x83d: can't find switch jump table
--
>> fs/pidfs.o: warning: objtool: pidfd_ioctl+0x142: can't find switch jump table
..


objdump-func vmlinux.o shmem_parse_one:
0000 0000000000289360 <shmem_parse_one>:
0000   289360:	41 57                	push   %r15
0002   289362:	41 56                	push   %r14
0004   289364:	41 55                	push   %r13
0006   289366:	41 54                	push   %r12
0008   289368:	4c 8d 26             	lea    (%rsi),%r12
000b   28936b:	55                   	push   %rbp
000c   28936c:	48 8d 2f             	lea    (%rdi),%rbp
000f   28936f:	53                   	push   %rbx
0010   289370:	48 8d 64 24 e8       	lea    -0x18(%rsp),%rsp
0015   289375:	e8 00 00 00 00       	call   28937a <shmem_parse_one+0x1a>	289376: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
001a   28937a:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
001f   28937f:	48 8d 7d 78          	lea    0x78(%rbp),%rdi
0023   289383:	49 8d 14 24          	lea    (%r12),%rdx
0027   289387:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 28938e <shmem_parse_one+0x2e>	28938a: R_X86_64_PC32	shmem_fs_parameters-0x4
002e   28938e:	4c 8b 6d 48          	mov    0x48(%rbp),%r13
0032   289392:	e8 00 00 00 00       	call   289397 <shmem_parse_one+0x37>	289393: R_X86_64_PLT32	__fs_parse-0x4
0037   289397:	8d 18                	lea    (%rax),%ebx
0039   289399:	31 ff                	xor    %edi,%edi
003b   28939b:	8d 30                	lea    (%rax),%esi
003d   28939d:	e8 00 00 00 00       	call   2893a2 <shmem_parse_one+0x42>	28939e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0042   2893a2:	85 db                	test   %ebx,%ebx
0044   2893a4:	78 59                	js     2893ff <shmem_parse_one+0x9f>
0046   2893a6:	e8 00 00 00 00       	call   2893ab <shmem_parse_one+0x4b>	2893a7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
004b   2893ab:	48 63 fb             	movslq %ebx,%rdi
004e   2893ae:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 2893b5 <shmem_parse_one+0x55>	2893b1: R_X86_64_PC32	.rodata+0x43cfbc
0055   2893b5:	e8 00 00 00 00       	call   2893ba <shmem_parse_one+0x5a>	2893b6: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
005a   2893ba:	83 fb 11             	cmp    $0x11,%ebx
005d   2893bd:	0f 87 bd 00 00 00    	ja     289480 <shmem_parse_one+0x120>
0063   2893c3:	8d 1b                	lea    (%rbx),%ebx
0065   2893c5:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 2893cc <shmem_parse_one+0x6c>	2893c8: R_X86_64_PC32	.rodata+0x43ce9c
006c   2893cc:	48 63 04 9a          	movslq (%rdx,%rbx,4),%rax
0070   2893d0:	48 01 d0             	add    %rdx,%rax
0073   2893d3:	ff e0                	jmp    *%rax
0075   2893d5:	e8 00 00 00 00       	call   2893da <shmem_parse_one+0x7a>	2893d6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
007a   2893da:	48 8b 75 78          	mov    0x78(%rbp),%rsi
007e   2893de:	48 8b bd 80 00 00 00 	mov    0x80(%rbp),%rdi
0085   2893e5:	4d 8b 04 24          	mov    (%r12),%r8
0089   2893e9:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 2893f0 <shmem_parse_one+0x90>	2893ec: R_X86_64_PC32	.LC12-0x4
0090   2893f0:	ba 65 00 00 00       	mov    $0x65,%edx
0095   2893f5:	e8 00 00 00 00       	call   2893fa <shmem_parse_one+0x9a>	2893f6: R_X86_64_PLT32	logfc-0x4
009a   2893fa:	bb ea ff ff ff       	mov    $0xffffffea,%ebx
009f   2893ff:	e8 00 00 00 00       	call   289404 <shmem_parse_one+0xa4>	289400: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00a4   289404:	48 8d 64 24 18       	lea    0x18(%rsp),%rsp
00a9   289409:	89 d8                	mov    %ebx,%eax
00ab   28940b:	5b                   	pop    %rbx
00ac   28940c:	5d                   	pop    %rbp
00ad   28940d:	41 5c                	pop    %r12
00af   28940f:	41 5d                	pop    %r13
00b1   289411:	41 5e                	pop    %r14
00b3   289413:	41 5f                	pop    %r15
00b5   289415:	c3                   	ret
00b6   289416:	e8 00 00 00 00       	call   28941b <shmem_parse_one+0xbb>	289417: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00bb   28941b:	48 8d 34 24          	lea    (%rsp),%rsi
00bf   28941f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
00c4   289424:	e8 00 00 00 00       	call   289429 <shmem_parse_one+0xc9>	289425: R_X86_64_PLT32	memparse-0x4
00c9   289429:	48 8d 18             	lea    (%rax),%rbx
00cc   28942c:	48 8b 04 24          	mov    (%rsp),%rax
00d0   289430:	31 ff                	xor    %edi,%edi
00d2   289432:	44 0f b6 30          	movzbl (%rax),%r14d
00d6   289436:	44 89 f6             	mov    %r14d,%esi
00d9   289439:	e8 00 00 00 00       	call   28943e <shmem_parse_one+0xde>	28943a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
00de   28943e:	45 84 f6             	test   %r14b,%r14b
00e1   289441:	0f 85 a6 04 00 00    	jne    2898ed <shmem_parse_one+0x58d>
00e7   289447:	e8 00 00 00 00       	call   28944c <shmem_parse_one+0xec>	289448: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ec   28944c:	31 ff                	xor    %edi,%edi
00ee   28944e:	48 8d 33             	lea    (%rbx),%rsi
00f1   289451:	e8 00 00 00 00       	call   289456 <shmem_parse_one+0xf6>	289452: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
00f6   289456:	48 85 db             	test   %rbx,%rbx
00f9   289459:	0f 84 8e 04 00 00    	je     2898ed <shmem_parse_one+0x58d>
00ff   28945f:	e8 00 00 00 00       	call   289464 <shmem_parse_one+0x104>	289460: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0104   289464:	31 ff                	xor    %edi,%edi
0106   289466:	48 8d 33             	lea    (%rbx),%rsi
0109   289469:	e8 00 00 00 00       	call   28946e <shmem_parse_one+0x10e>	28946a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
010e   28946e:	48 85 db             	test   %rbx,%rbx
0111   289471:	0f 88 12 05 00 00    	js     289989 <shmem_parse_one+0x629>
0117   289477:	e8 00 00 00 00       	call   28947c <shmem_parse_one+0x11c>	289478: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
011c   28947c:	49 89 5d 40          	mov    %rbx,0x40(%r13)
0120   289480:	31 db                	xor    %ebx,%ebx
0122   289482:	e9 78 ff ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
0127   289487:	e8 00 00 00 00       	call   28948c <shmem_parse_one+0x12c>	289488: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
012c   28948c:	48 8d 34 24          	lea    (%rsp),%rsi
0130   289490:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
0135   289495:	e8 00 00 00 00       	call   28949a <shmem_parse_one+0x13a>	289496: R_X86_64_PLT32	memparse-0x4
013a   28949a:	48 8d 18             	lea    (%rax),%rbx
013d   28949d:	48 8b 04 24          	mov    (%rsp),%rax
0141   2894a1:	31 ff                	xor    %edi,%edi
0143   2894a3:	44 0f b6 30          	movzbl (%rax),%r14d
0147   2894a7:	44 89 f6             	mov    %r14d,%esi
014a   2894aa:	e8 00 00 00 00       	call   2894af <shmem_parse_one+0x14f>	2894ab: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
014f   2894af:	45 84 f6             	test   %r14b,%r14b
0152   2894b2:	0f 85 35 04 00 00    	jne    2898ed <shmem_parse_one+0x58d>
0158   2894b8:	e8 00 00 00 00       	call   2894bd <shmem_parse_one+0x15d>	2894b9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
015d   2894bd:	31 ff                	xor    %edi,%edi
015f   2894bf:	48 8d 33             	lea    (%rbx),%rsi
0162   2894c2:	e8 00 00 00 00       	call   2894c7 <shmem_parse_one+0x167>	2894c3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0167   2894c7:	48 85 db             	test   %rbx,%rbx
016a   2894ca:	0f 84 1d 04 00 00    	je     2898ed <shmem_parse_one+0x58d>
0170   2894d0:	e8 00 00 00 00       	call   2894d5 <shmem_parse_one+0x175>	2894d1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0175   2894d5:	31 ff                	xor    %edi,%edi
0177   2894d7:	48 8d 33             	lea    (%rbx),%rsi
017a   2894da:	e8 00 00 00 00       	call   2894df <shmem_parse_one+0x17f>	2894db: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
017f   2894df:	48 85 db             	test   %rbx,%rbx
0182   2894e2:	0f 88 7b 04 00 00    	js     289963 <shmem_parse_one+0x603>
0188   2894e8:	e8 00 00 00 00       	call   2894ed <shmem_parse_one+0x18d>	2894e9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
018d   2894ed:	49 89 5d 38          	mov    %rbx,0x38(%r13)
0191   2894f1:	31 db                	xor    %ebx,%ebx
0193   2894f3:	e9 07 ff ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
0198   2894f8:	e8 00 00 00 00       	call   2894fd <shmem_parse_one+0x19d>	2894f9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
019d   2894fd:	48 8d 34 24          	lea    (%rsp),%rsi
01a1   289501:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
01a6   289506:	e8 00 00 00 00       	call   28950b <shmem_parse_one+0x1ab>	289507: R_X86_64_PLT32	memparse-0x4
01ab   28950b:	48 8d 18             	lea    (%rax),%rbx
01ae   28950e:	48 8b 04 24          	mov    (%rsp),%rax
01b2   289512:	31 ff                	xor    %edi,%edi
01b4   289514:	44 0f b6 30          	movzbl (%rax),%r14d
01b8   289518:	44 89 f6             	mov    %r14d,%esi
01bb   28951b:	e8 00 00 00 00       	call   289520 <shmem_parse_one+0x1c0>	28951c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
01c0   289520:	45 84 f6             	test   %r14b,%r14b
01c3   289523:	0f 85 c4 03 00 00    	jne    2898ed <shmem_parse_one+0x58d>
01c9   289529:	e8 00 00 00 00       	call   28952e <shmem_parse_one+0x1ce>	28952a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01ce   28952e:	31 ff                	xor    %edi,%edi
01d0   289530:	48 8d 33             	lea    (%rbx),%rsi
01d3   289533:	e8 00 00 00 00       	call   289538 <shmem_parse_one+0x1d8>	289534: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
01d8   289538:	48 85 db             	test   %rbx,%rbx
01db   28953b:	0f 84 ac 03 00 00    	je     2898ed <shmem_parse_one+0x58d>
01e1   289541:	e8 00 00 00 00       	call   289546 <shmem_parse_one+0x1e6>	289542: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01e6   289546:	31 ff                	xor    %edi,%edi
01e8   289548:	48 8d 33             	lea    (%rbx),%rsi
01eb   28954b:	e8 00 00 00 00       	call   289550 <shmem_parse_one+0x1f0>	28954c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
01f0   289550:	48 85 db             	test   %rbx,%rbx
01f3   289553:	0f 88 56 04 00 00    	js     2899af <shmem_parse_one+0x64f>
01f9   289559:	e8 00 00 00 00       	call   28955e <shmem_parse_one+0x1fe>	28955a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01fe   28955e:	49 89 5d 30          	mov    %rbx,0x30(%r13)
0202   289562:	31 db                	xor    %ebx,%ebx
0204   289564:	e9 96 fe ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
0209   289569:	e8 00 00 00 00       	call   28956e <shmem_parse_one+0x20e>	28956a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
020e   28956e:	48 8d 34 24          	lea    (%rsp),%rsi
0212   289572:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
0217   289577:	e8 00 00 00 00       	call   28957c <shmem_parse_one+0x21c>	289578: R_X86_64_PLT32	memparse-0x4
021c   28957c:	4c 8b 3c 24          	mov    (%rsp),%r15
0220   289580:	bf 25 00 00 00       	mov    $0x25,%edi
0225   289585:	48 8d 18             	lea    (%rax),%rbx
0228   289588:	45 0f b6 37          	movzbl (%r15),%r14d
022c   28958c:	44 89 f6             	mov    %r14d,%esi
022f   28958f:	e8 00 00 00 00       	call   289594 <shmem_parse_one+0x234>	289590: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0234   289594:	41 80 fe 25          	cmp    $0x25,%r14b
0238   289598:	75 39                	jne    2895d3 <shmem_parse_one+0x273>
023a   28959a:	e8 00 00 00 00       	call   28959f <shmem_parse_one+0x23f>	28959b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
023f   28959f:	48 c1 e3 0c          	shl    $0xc,%rbx
0243   2895a3:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 2895aa <shmem_parse_one+0x24a>	2895a6: R_X86_64_PC32	_totalram_pages-0x4
024a   2895aa:	48 0f af d3          	imul   %rbx,%rdx
024e   2895ae:	48 c1 ea 02          	shr    $0x2,%rdx
0252   2895b2:	48 b8 c3 f5 28 5c 8f c2 f5 28 	movabs $0x28f5c28f5c28f5c3,%rax
025c   2895bc:	48 f7 e2             	mul    %rdx
025f   2895bf:	48 c1 ea 02          	shr    $0x2,%rdx
0263   2895c3:	49 8d 47 01          	lea    0x1(%r15),%rax
0267   2895c7:	48 89 04 24          	mov    %rax,(%rsp)
026b   2895cb:	48 89 d3             	mov    %rdx,%rbx
026e   2895ce:	45 0f b6 77 01       	movzbl 0x1(%r15),%r14d
0273   2895d3:	e8 00 00 00 00       	call   2895d8 <shmem_parse_one+0x278>	2895d4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0278   2895d8:	31 ff                	xor    %edi,%edi
027a   2895da:	44 89 f6             	mov    %r14d,%esi
027d   2895dd:	e8 00 00 00 00       	call   2895e2 <shmem_parse_one+0x282>	2895de: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0282   2895e2:	45 84 f6             	test   %r14b,%r14b
0285   2895e5:	0f 85 02 03 00 00    	jne    2898ed <shmem_parse_one+0x58d>
028b   2895eb:	48 8d 9b ff 0f 00 00 	lea    0xfff(%rbx),%rbx
0292   2895f2:	e8 00 00 00 00       	call   2895f7 <shmem_parse_one+0x297>	2895f3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0297   2895f7:	48 c1 eb 0c          	shr    $0xc,%rbx
029b   2895fb:	41 83 4d 28 01       	orl    $0x1,0x28(%r13)
02a0   289600:	49 89 5d 00          	mov    %rbx,0x0(%r13)
02a4   289604:	31 db                	xor    %ebx,%ebx
02a6   289606:	e9 f4 fd ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
02ab   28960b:	e8 00 00 00 00       	call   289610 <shmem_parse_one+0x2b0>	28960c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02b0   289610:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 289617 <shmem_parse_one+0x2b7>	289613: R_X86_64_PC32	init_user_ns-0x4
02b7   289617:	48 39 45 60          	cmp    %rax,0x60(%rbp)
02bb   28961b:	0f 85 1c 03 00 00    	jne    28993d <shmem_parse_one+0x5dd>
02c1   289621:	e8 00 00 00 00       	call   289626 <shmem_parse_one+0x2c6>	289622: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02c6   289626:	bf 15 00 00 00       	mov    $0x15,%edi
02cb   28962b:	e8 00 00 00 00       	call   289630 <shmem_parse_one+0x2d0>	28962c: R_X86_64_PLT32	capable-0x4
02d0   289630:	89 c3                	mov    %eax,%ebx
02d2   289632:	31 ff                	xor    %edi,%edi
02d4   289634:	89 c6                	mov    %eax,%esi
02d6   289636:	e8 00 00 00 00       	call   28963b <shmem_parse_one+0x2db>	289637: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
02db   28963b:	84 db                	test   %bl,%bl
02dd   28963d:	0f 84 fa 02 00 00    	je     28993d <shmem_parse_one+0x5dd>
02e3   289643:	e8 00 00 00 00       	call   289648 <shmem_parse_one+0x2e8>	289644: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02e8   289648:	31 db                	xor    %ebx,%ebx
02ea   28964a:	41 c6 45 2c 01       	movb   $0x1,0x2c(%r13)
02ef   28964f:	41 83 4d 28 10       	orl    $0x10,0x28(%r13)
02f4   289654:	e9 a6 fd ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
02f9   289659:	e8 00 00 00 00       	call   28965e <shmem_parse_one+0x2fe>	28965a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02fe   28965e:	31 db                	xor    %ebx,%ebx
0300   289660:	41 c6 45 22 01       	movb   $0x1,0x22(%r13)
0305   289665:	41 83 4d 28 08       	orl    $0x8,0x28(%r13)
030a   28966a:	e9 90 fd ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
030f   28966f:	e8 00 00 00 00       	call   289674 <shmem_parse_one+0x314>	289670: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0314   289674:	0f b7 44 24 10       	movzwl 0x10(%rsp),%eax
0319   289679:	31 db                	xor    %ebx,%ebx
031b   28967b:	66 25 ff 0f          	and    $0xfff,%ax
031f   28967f:	66 41 89 45 20       	mov    %ax,0x20(%r13)
0324   289684:	e9 76 fd ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
0329   289689:	e8 00 00 00 00       	call   28968e <shmem_parse_one+0x32e>	28968a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
032e   28968e:	8b 44 24 10          	mov    0x10(%rsp),%eax
0332   289692:	41 83 4d 28 04       	orl    $0x4,0x28(%r13)
0337   289697:	41 89 45 24          	mov    %eax,0x24(%r13)
033b   28969b:	31 db                	xor    %ebx,%ebx
033d   28969d:	e9 5d fd ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
0342   2896a2:	e8 00 00 00 00       	call   2896a7 <shmem_parse_one+0x347>	2896a3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0347   2896a7:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
034c   2896ac:	48 8b 7d 60          	mov    0x60(%rbp),%rdi
0350   2896b0:	44 89 f6             	mov    %r14d,%esi
0353   2896b3:	e8 00 00 00 00       	call   2896b8 <shmem_parse_one+0x358>	2896b4: R_X86_64_PLT32	from_kgid-0x4
0358   2896b8:	8d 18                	lea    (%rax),%ebx
035a   2896ba:	8d 30                	lea    (%rax),%esi
035c   2896bc:	bf ff ff ff ff       	mov    $0xffffffff,%edi
0361   2896c1:	e8 00 00 00 00       	call   2896c6 <shmem_parse_one+0x366>	2896c2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0366   2896c6:	83 fb ff             	cmp    $0xffffffff,%ebx
0369   2896c9:	0f 84 1e 02 00 00    	je     2898ed <shmem_parse_one+0x58d>
036f   2896cf:	e8 00 00 00 00       	call   2896d4 <shmem_parse_one+0x374>	2896d0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0374   2896d4:	31 db                	xor    %ebx,%ebx
0376   2896d6:	45 89 75 1c          	mov    %r14d,0x1c(%r13)
037a   2896da:	e9 20 fd ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
037f   2896df:	e8 00 00 00 00       	call   2896e4 <shmem_parse_one+0x384>	2896e0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0384   2896e4:	48 8d 34 24          	lea    (%rsp),%rsi
0388   2896e8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
038d   2896ed:	e8 00 00 00 00       	call   2896f2 <shmem_parse_one+0x392>	2896ee: R_X86_64_PLT32	memparse-0x4
0392   2896f2:	48 8d 18             	lea    (%rax),%rbx
0395   2896f5:	48 8b 04 24          	mov    (%rsp),%rax
0399   2896f9:	31 ff                	xor    %edi,%edi
039b   2896fb:	44 0f b6 30          	movzbl (%rax),%r14d
039f   2896ff:	44 89 f6             	mov    %r14d,%esi
03a2   289702:	e8 00 00 00 00       	call   289707 <shmem_parse_one+0x3a7>	289703: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
03a7   289707:	45 84 f6             	test   %r14b,%r14b
03aa   28970a:	0f 85 dd 01 00 00    	jne    2898ed <shmem_parse_one+0x58d>
03b0   289710:	e8 00 00 00 00       	call   289715 <shmem_parse_one+0x3b5>	289711: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03b5   289715:	31 ff                	xor    %edi,%edi
03b7   289717:	48 8d 33             	lea    (%rbx),%rsi
03ba   28971a:	e8 00 00 00 00       	call   28971f <shmem_parse_one+0x3bf>	28971b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
03bf   28971f:	48 85 db             	test   %rbx,%rbx
03c2   289722:	0f 84 c5 01 00 00    	je     2898ed <shmem_parse_one+0x58d>
03c8   289728:	e8 00 00 00 00       	call   28972d <shmem_parse_one+0x3cd>	289729: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03cd   28972d:	31 ff                	xor    %edi,%edi
03cf   28972f:	48 8d 33             	lea    (%rbx),%rsi
03d2   289732:	e8 00 00 00 00       	call   289737 <shmem_parse_one+0x3d7>	289733: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
03d7   289737:	48 85 db             	test   %rbx,%rbx
03da   28973a:	0f 88 95 02 00 00    	js     2899d5 <shmem_parse_one+0x675>
03e0   289740:	e8 00 00 00 00       	call   289745 <shmem_parse_one+0x3e5>	289741: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03e5   289745:	49 89 5d 48          	mov    %rbx,0x48(%r13)
03e9   289749:	31 db                	xor    %ebx,%ebx
03eb   28974b:	e9 af fc ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
03f0   289750:	e8 00 00 00 00       	call   289755 <shmem_parse_one+0x3f5>	289751: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03f5   289755:	48 8d 34 24          	lea    (%rsp),%rsi
03f9   289759:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
03fe   28975e:	e8 00 00 00 00       	call   289763 <shmem_parse_one+0x403>	28975f: R_X86_64_PLT32	memparse-0x4
0403   289763:	49 89 45 00          	mov    %rax,0x0(%r13)
0407   289767:	48 8d 18             	lea    (%rax),%rbx
040a   28976a:	48 8b 04 24          	mov    (%rsp),%rax
040e   28976e:	31 ff                	xor    %edi,%edi
0410   289770:	44 0f b6 30          	movzbl (%rax),%r14d
0414   289774:	44 89 f6             	mov    %r14d,%esi
0417   289777:	e8 00 00 00 00       	call   28977c <shmem_parse_one+0x41c>	289778: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
041c   28977c:	45 84 f6             	test   %r14b,%r14b
041f   28977f:	0f 85 68 01 00 00    	jne    2898ed <shmem_parse_one+0x58d>
0425   289785:	e8 00 00 00 00       	call   28978a <shmem_parse_one+0x42a>	289786: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
042a   28978a:	31 ff                	xor    %edi,%edi
042c   28978c:	48 8d 33             	lea    (%rbx),%rsi
042f   28978f:	e8 00 00 00 00       	call   289794 <shmem_parse_one+0x434>	289790: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0434   289794:	48 85 db             	test   %rbx,%rbx
0437   289797:	0f 88 50 01 00 00    	js     2898ed <shmem_parse_one+0x58d>
043d   28979d:	e8 00 00 00 00       	call   2897a2 <shmem_parse_one+0x442>	28979e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0442   2897a2:	31 db                	xor    %ebx,%ebx
0444   2897a4:	41 83 4d 28 01       	orl    $0x1,0x28(%r13)
0449   2897a9:	e9 51 fc ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
044e   2897ae:	e8 00 00 00 00       	call   2897b3 <shmem_parse_one+0x453>	2897af: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0453   2897b3:	48 8d 34 24          	lea    (%rsp),%rsi
0457   2897b7:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
045c   2897bc:	e8 00 00 00 00       	call   2897c1 <shmem_parse_one+0x461>	2897bd: R_X86_64_PLT32	memparse-0x4
0461   2897c1:	49 89 45 08          	mov    %rax,0x8(%r13)
0465   2897c5:	48 8d 18             	lea    (%rax),%rbx
0468   2897c8:	48 8b 04 24          	mov    (%rsp),%rax
046c   2897cc:	31 ff                	xor    %edi,%edi
046e   2897ce:	44 0f b6 30          	movzbl (%rax),%r14d
0472   2897d2:	44 89 f6             	mov    %r14d,%esi
0475   2897d5:	e8 00 00 00 00       	call   2897da <shmem_parse_one+0x47a>	2897d6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
047a   2897da:	45 84 f6             	test   %r14b,%r14b
047d   2897dd:	0f 85 0a 01 00 00    	jne    2898ed <shmem_parse_one+0x58d>
0483   2897e3:	49 be ff ff ff ff ff ff 3f 00 	movabs $0x3fffffffffffff,%r14
048d   2897ed:	e8 00 00 00 00       	call   2897f2 <shmem_parse_one+0x492>	2897ee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0492   2897f2:	48 8d 33             	lea    (%rbx),%rsi
0495   2897f5:	4c 89 f7             	mov    %r14,%rdi
0498   2897f8:	e8 00 00 00 00       	call   2897fd <shmem_parse_one+0x49d>	2897f9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
049d   2897fd:	49 39 de             	cmp    %rbx,%r14
04a0   289800:	0f 82 e7 00 00 00    	jb     2898ed <shmem_parse_one+0x58d>
04a6   289806:	e8 00 00 00 00       	call   28980b <shmem_parse_one+0x4ab>	289807: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04ab   28980b:	31 db                	xor    %ebx,%ebx
04ad   28980d:	41 83 4d 28 02       	orl    $0x2,0x28(%r13)
04b2   289812:	e9 e8 fb ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
04b7   289817:	e8 00 00 00 00       	call   28981c <shmem_parse_one+0x4bc>	289818: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04bc   28981c:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 289823 <shmem_parse_one+0x4c3>	28981f: R_X86_64_PC32	init_user_ns-0x4
04c3   289823:	48 39 45 60          	cmp    %rax,0x60(%rbp)
04c7   289827:	0f 85 ea 00 00 00    	jne    289917 <shmem_parse_one+0x5b7>
04cd   28982d:	e8 00 00 00 00       	call   289832 <shmem_parse_one+0x4d2>	28982e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04d2   289832:	31 db                	xor    %ebx,%ebx
04d4   289834:	41 83 4d 28 20       	orl    $0x20,0x28(%r13)
04d9   289839:	66 41 83 4d 2e 01    	orw    $0x1,0x2e(%r13)
04df   28983f:	e9 bb fb ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
04e4   289844:	e8 00 00 00 00       	call   289849 <shmem_parse_one+0x4e9>	289845: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04e9   289849:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 289850 <shmem_parse_one+0x4f0>	28984c: R_X86_64_PC32	init_user_ns-0x4
04f0   289850:	48 39 45 60          	cmp    %rax,0x60(%rbp)
04f4   289854:	0f 85 bd 00 00 00    	jne    289917 <shmem_parse_one+0x5b7>
04fa   28985a:	e8 00 00 00 00       	call   28985f <shmem_parse_one+0x4ff>	28985b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04ff   28985f:	31 db                	xor    %ebx,%ebx
0501   289861:	41 83 4d 28 20       	orl    $0x20,0x28(%r13)
0506   289866:	66 41 83 4d 2e 03    	orw    $0x3,0x2e(%r13)
050c   28986c:	e9 8e fb ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
0511   289871:	e8 00 00 00 00       	call   289876 <shmem_parse_one+0x516>	289872: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0516   289876:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 28987d <shmem_parse_one+0x51d>	289879: R_X86_64_PC32	init_user_ns-0x4
051d   28987d:	48 39 45 60          	cmp    %rax,0x60(%rbp)
0521   289881:	0f 85 90 00 00 00    	jne    289917 <shmem_parse_one+0x5b7>
0527   289887:	e8 00 00 00 00       	call   28988c <shmem_parse_one+0x52c>	289888: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
052c   28988c:	31 db                	xor    %ebx,%ebx
052e   28988e:	41 83 4d 28 20       	orl    $0x20,0x28(%r13)
0533   289893:	66 41 83 4d 2e 02    	orw    $0x2,0x2e(%r13)
0539   289899:	e9 61 fb ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
053e   28989e:	e8 00 00 00 00       	call   2898a3 <shmem_parse_one+0x543>	28989f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0543   2898a3:	31 db                	xor    %ebx,%ebx
0545   2898a5:	41 c6 45 22 00       	movb   $0x0,0x22(%r13)
054a   2898aa:	41 83 4d 28 08       	orl    $0x8,0x28(%r13)
054f   2898af:	e9 4b fb ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
0554   2898b4:	e8 00 00 00 00       	call   2898b9 <shmem_parse_one+0x559>	2898b5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0559   2898b9:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
055e   2898be:	48 8b 7d 60          	mov    0x60(%rbp),%rdi
0562   2898c2:	44 89 f6             	mov    %r14d,%esi
0565   2898c5:	e8 00 00 00 00       	call   2898ca <shmem_parse_one+0x56a>	2898c6: R_X86_64_PLT32	from_kuid-0x4
056a   2898ca:	8d 18                	lea    (%rax),%ebx
056c   2898cc:	8d 30                	lea    (%rax),%esi
056e   2898ce:	bf ff ff ff ff       	mov    $0xffffffff,%edi
0573   2898d3:	e8 00 00 00 00       	call   2898d8 <shmem_parse_one+0x578>	2898d4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0578   2898d8:	83 fb ff             	cmp    $0xffffffff,%ebx
057b   2898db:	74 10                	je     2898ed <shmem_parse_one+0x58d>
057d   2898dd:	e8 00 00 00 00       	call   2898e2 <shmem_parse_one+0x582>	2898de: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0582   2898e2:	31 db                	xor    %ebx,%ebx
0584   2898e4:	45 89 75 18          	mov    %r14d,0x18(%r13)
0588   2898e8:	e9 12 fb ff ff       	jmp    2893ff <shmem_parse_one+0x9f>
058d   2898ed:	e8 00 00 00 00       	call   2898f2 <shmem_parse_one+0x592>	2898ee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0592   2898f2:	48 8b 75 78          	mov    0x78(%rbp),%rsi
0596   2898f6:	48 8b bd 80 00 00 00 	mov    0x80(%rbp),%rdi
059d   2898fd:	4d 8b 04 24          	mov    (%r12),%r8
05a1   289901:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 289908 <shmem_parse_one+0x5a8>	289904: R_X86_64_PC32	.LC19-0x4
05a8   289908:	ba 65 00 00 00       	mov    $0x65,%edx
05ad   28990d:	e8 00 00 00 00       	call   289912 <shmem_parse_one+0x5b2>	28990e: R_X86_64_PLT32	logfc-0x4
05b2   289912:	e9 e3 fa ff ff       	jmp    2893fa <shmem_parse_one+0x9a>
05b7   289917:	e8 00 00 00 00       	call   28991c <shmem_parse_one+0x5bc>	289918: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05bc   28991c:	48 8b 75 78          	mov    0x78(%rbp),%rsi
05c0   289920:	48 8b bd 80 00 00 00 	mov    0x80(%rbp),%rdi
05c7   289927:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 28992e <shmem_parse_one+0x5ce>	28992a: R_X86_64_PC32	.LC14-0x4
05ce   28992e:	ba 65 00 00 00       	mov    $0x65,%edx
05d3   289933:	e8 00 00 00 00       	call   289938 <shmem_parse_one+0x5d8>	289934: R_X86_64_PLT32	logfc-0x4
05d8   289938:	e9 bd fa ff ff       	jmp    2893fa <shmem_parse_one+0x9a>
05dd   28993d:	e8 00 00 00 00       	call   289942 <shmem_parse_one+0x5e2>	28993e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05e2   289942:	48 8b 75 78          	mov    0x78(%rbp),%rsi
05e6   289946:	48 8b bd 80 00 00 00 	mov    0x80(%rbp),%rdi
05ed   28994d:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 289954 <shmem_parse_one+0x5f4>	289950: R_X86_64_PC32	.LC13-0x4
05f4   289954:	ba 65 00 00 00       	mov    $0x65,%edx
05f9   289959:	e8 00 00 00 00       	call   28995e <shmem_parse_one+0x5fe>	28995a: R_X86_64_PLT32	logfc-0x4
05fe   28995e:	e9 97 fa ff ff       	jmp    2893fa <shmem_parse_one+0x9a>
0603   289963:	e8 00 00 00 00       	call   289968 <shmem_parse_one+0x608>	289964: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0608   289968:	48 8b 75 78          	mov    0x78(%rbp),%rsi
060c   28996c:	48 8b bd 80 00 00 00 	mov    0x80(%rbp),%rdi
0613   289973:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 28997a <shmem_parse_one+0x61a>	289976: R_X86_64_PC32	.LC17-0x4
061a   28997a:	ba 65 00 00 00       	mov    $0x65,%edx
061f   28997f:	e8 00 00 00 00       	call   289984 <shmem_parse_one+0x624>	289980: R_X86_64_PLT32	logfc-0x4
0624   289984:	e9 71 fa ff ff       	jmp    2893fa <shmem_parse_one+0x9a>
0629   289989:	e8 00 00 00 00       	call   28998e <shmem_parse_one+0x62e>	28998a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
062e   28998e:	48 8b 75 78          	mov    0x78(%rbp),%rsi
0632   289992:	48 8b bd 80 00 00 00 	mov    0x80(%rbp),%rdi
0639   289999:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 2899a0 <shmem_parse_one+0x640>	28999c: R_X86_64_PC32	.LC16-0x4
0640   2899a0:	ba 65 00 00 00       	mov    $0x65,%edx
0645   2899a5:	e8 00 00 00 00       	call   2899aa <shmem_parse_one+0x64a>	2899a6: R_X86_64_PLT32	logfc-0x4
064a   2899aa:	e9 4b fa ff ff       	jmp    2893fa <shmem_parse_one+0x9a>
064f   2899af:	e8 00 00 00 00       	call   2899b4 <shmem_parse_one+0x654>	2899b0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0654   2899b4:	48 8b 75 78          	mov    0x78(%rbp),%rsi
0658   2899b8:	48 8b bd 80 00 00 00 	mov    0x80(%rbp),%rdi
065f   2899bf:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 2899c6 <shmem_parse_one+0x666>	2899c2: R_X86_64_PC32	.LC15-0x4
0666   2899c6:	ba 65 00 00 00       	mov    $0x65,%edx
066b   2899cb:	e8 00 00 00 00       	call   2899d0 <shmem_parse_one+0x670>	2899cc: R_X86_64_PLT32	logfc-0x4
0670   2899d0:	e9 25 fa ff ff       	jmp    2893fa <shmem_parse_one+0x9a>
0675   2899d5:	e8 00 00 00 00       	call   2899da <shmem_parse_one+0x67a>	2899d6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
067a   2899da:	48 8b 75 78          	mov    0x78(%rbp),%rsi
067e   2899de:	48 8b bd 80 00 00 00 	mov    0x80(%rbp),%rdi
0685   2899e5:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 2899ec <shmem_parse_one+0x68c>	2899e8: R_X86_64_PC32	.LC18-0x4
068c   2899ec:	ba 65 00 00 00       	mov    $0x65,%edx
0691   2899f1:	e8 00 00 00 00       	call   2899f6 <shmem_parse_one+0x696>	2899f2: R_X86_64_PLT32	logfc-0x4
0696   2899f6:	e9 ff f9 ff ff       	jmp    2893fa <shmem_parse_one+0x9a>
069b   2899fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
