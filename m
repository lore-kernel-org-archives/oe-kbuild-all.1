Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7A8A4A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680689651; x=1712225651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y6NFyBXX89WTvidr2JEDVzTOs7OfzzJgL/pa3SUtWoI=;
  b=UM7FnN8KsdnR8as479AdPuCoNn56r9ruee8zxYvpGqhV6Oqvsibe8Pqp
   0G/Yg+Nh9KBXkdHEmq+n+D4vmJFwM6kyOdWTyKyAMVLOl7CTQteI58QVx
   ZnT/FsMoYjAvgPS0Kjhg8KM/IA08Vs7H5txMgK4LP5YWFDMxvniy++OTl
   gQ+LT5CPR5ox7WkV3PEzXOb2B4w4DzGORvqJZWsR4zsLeMkEYEgIK5oHW
   aCEu6zTmZVDEsa4kbpJTJvcW/s2pwbXrto/rffUmiwrY3emEKeVQn5SRN
   8+NaUJ6ivFqplV7Kg5S13R28nz3GGAJCU2e1hDTHR4fxvca02dbqJMz/2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="407493970"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="407493970"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 03:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="689219807"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="689219807"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Apr 2023 03:14:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk09Y-000QSg-00;
	Wed, 05 Apr 2023 10:14:08 +0000
Date: Wed, 5 Apr 2023 18:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-debug 8/8] vmlinux.o: warning: objtool:
 mptscsih_abort+0x8a6: mpt_halt_firmware() is missing a __noreturn annotation
Message-ID: <202304051837.i0kczE5x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-debug
head:   261316083661e4879d4db1cc7d34efb3f3dfcbbf
commit: 261316083661e4879d4db1cc7d34efb3f3dfcbbf [8/8] objtool: Detect missing __noreturn annotations
config: x86_64-randconfig-r026-20230403 (https://download.01.org/0day-ci/archive/20230405/202304051837.i0kczE5x-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=261316083661e4879d4db1cc7d34efb3f3dfcbbf
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-debug
        git checkout 261316083661e4879d4db1cc7d34efb3f3dfcbbf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051837.i0kczE5x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: mptscsih_abort+0x8a6: mpt_halt_firmware() is missing a __noreturn annotation
>> vmlinux.o: warning: objtool: mptctl_timeout_expired+0x298: mpt_halt_firmware() is missing a __noreturn annotation


objdump-func vmlinux.o mptscsih_abort:
0000 0000000001c0b590 <mptscsih_abort>:
0000  1c0b590:	f3 0f 1e fa          	endbr64
0004  1c0b594:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
000e  1c0b59e:	55                   	push   %rbp
000f  1c0b59f:	48 89 fa             	mov    %rdi,%rdx
0012  1c0b5a2:	48 c1 ea 03          	shr    $0x3,%rdx
0016  1c0b5a6:	48 89 e5             	mov    %rsp,%rbp
0019  1c0b5a9:	41 57                	push   %r15
001b  1c0b5ab:	41 56                	push   %r14
001d  1c0b5ad:	41 55                	push   %r13
001f  1c0b5af:	41 54                	push   %r12
0021  1c0b5b1:	49 89 fc             	mov    %rdi,%r12
0024  1c0b5b4:	53                   	push   %rbx
0025  1c0b5b5:	48 83 ec 40          	sub    $0x40,%rsp
0029  1c0b5b9:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
002d  1c0b5bd:	0f 85 d4 08 00 00    	jne    1c0be97 <mptscsih_abort+0x907>
0033  1c0b5c3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
003d  1c0b5cd:	49 8b 1c 24          	mov    (%r12),%rbx
0041  1c0b5d1:	48 89 da             	mov    %rbx,%rdx
0044  1c0b5d4:	48 c1 ea 03          	shr    $0x3,%rdx
0048  1c0b5d8:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
004c  1c0b5dc:	0f 85 bf 08 00 00    	jne    1c0bea1 <mptscsih_abort+0x911>
0052  1c0b5e2:	48 8b 1b             	mov    (%rbx),%rbx
0055  1c0b5e5:	49 89 de             	mov    %rbx,%r14
0058  1c0b5e8:	49 81 c6 30 0d 00 00 	add    $0xd30,%r14
005f  1c0b5ef:	0f 84 f3 06 00 00    	je     1c0bce8 <mptscsih_abort+0x758>
0065  1c0b5f5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
006f  1c0b5ff:	4c 89 f2             	mov    %r14,%rdx
0072  1c0b602:	48 c1 ea 03          	shr    $0x3,%rdx
0076  1c0b606:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
007a  1c0b60a:	0f 85 f2 08 00 00    	jne    1c0bf02 <mptscsih_abort+0x972>
0080  1c0b610:	48 8b 9b 30 0d 00 00 	mov    0xd30(%rbx),%rbx
0087  1c0b617:	4c 89 e2             	mov    %r12,%rdx
008a  1c0b61a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c0b61d: R_X86_64_32S	.rodata+0x4d9880
0091  1c0b621:	4c 8d 6b 08          	lea    0x8(%rbx),%r13
0095  1c0b625:	4c 89 ee             	mov    %r13,%rsi
0098  1c0b628:	e8 00 00 00 00       	call   1c0b62d <mptscsih_abort+0x9d>	1c0b629: R_X86_64_PLT32	_printk-0x4
009d  1c0b62d:	4c 89 e7             	mov    %r12,%rdi
00a0  1c0b630:	e8 00 00 00 00       	call   1c0b635 <mptscsih_abort+0xa5>	1c0b631: R_X86_64_PLT32	scsi_print_command-0x4
00a5  1c0b635:	4c 89 e2             	mov    %r12,%rdx
00a8  1c0b638:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00b2  1c0b642:	48 c1 ea 03          	shr    $0x3,%rdx
00b6  1c0b646:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
00ba  1c0b64a:	0f 85 90 08 00 00    	jne    1c0bee0 <mptscsih_abort+0x950>
00c0  1c0b650:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00ca  1c0b65a:	4d 8b 3c 24          	mov    (%r12),%r15
00ce  1c0b65e:	49 8d bf e8 00 00 00 	lea    0xe8(%r15),%rdi
00d5  1c0b665:	48 89 fa             	mov    %rdi,%rdx
00d8  1c0b668:	48 c1 ea 03          	shr    $0x3,%rdx
00dc  1c0b66c:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
00e0  1c0b670:	0f 85 99 08 00 00    	jne    1c0bf0f <mptscsih_abort+0x97f>
00e6  1c0b676:	49 8b 97 e8 00 00 00 	mov    0xe8(%r15),%rdx
00ed  1c0b67d:	48 85 d2             	test   %rdx,%rdx
00f0  1c0b680:	0f 84 70 01 00 00    	je     1c0b7f6 <mptscsih_abort+0x266>
00f6  1c0b686:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0100  1c0b690:	48 89 d1             	mov    %rdx,%rcx
0103  1c0b693:	48 c1 e9 03          	shr    $0x3,%rcx
0107  1c0b697:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
010b  1c0b69b:	0f 85 4c 08 00 00    	jne    1c0beed <mptscsih_abort+0x95d>
0111  1c0b6a1:	4c 8b 3a             	mov    (%rdx),%r15
0114  1c0b6a4:	4d 85 ff             	test   %r15,%r15
0117  1c0b6a7:	0f 84 49 01 00 00    	je     1c0b7f6 <mptscsih_abort+0x266>
011d  1c0b6ad:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0127  1c0b6b7:	49 8d 7f 08          	lea    0x8(%r15),%rdi
012b  1c0b6bb:	48 89 f9             	mov    %rdi,%rcx
012e  1c0b6be:	48 c1 e9 03          	shr    $0x3,%rcx
0132  1c0b6c2:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
0136  1c0b6c6:	84 c0                	test   %al,%al
0138  1c0b6c8:	74 06                	je     1c0b6d0 <mptscsih_abort+0x140>
013a  1c0b6ca:	0f 8e 0a 07 00 00    	jle    1c0bdda <mptscsih_abort+0x84a>
0140  1c0b6d0:	41 f6 47 08 40       	testb  $0x40,0x8(%r15)
0145  1c0b6d5:	0f 85 cf 00 00 00    	jne    1c0b7aa <mptscsih_abort+0x21a>
014b  1c0b6db:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0155  1c0b6e5:	49 8d 7f 10          	lea    0x10(%r15),%rdi
0159  1c0b6e9:	48 89 f9             	mov    %rdi,%rcx
015c  1c0b6ec:	48 c1 e9 03          	shr    $0x3,%rcx
0160  1c0b6f0:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
0164  1c0b6f4:	84 c0                	test   %al,%al
0166  1c0b6f6:	74 06                	je     1c0b6fe <mptscsih_abort+0x16e>
0168  1c0b6f8:	0f 8e 16 07 00 00    	jle    1c0be14 <mptscsih_abort+0x884>
016e  1c0b6fe:	41 80 7f 10 00       	cmpb   $0x0,0x10(%r15)
0173  1c0b703:	0f 84 98 01 00 00    	je     1c0b8a1 <mptscsih_abort+0x311>
0179  1c0b709:	48 8d bb c8 00 00 00 	lea    0xc8(%rbx),%rdi
0180  1c0b710:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
018a  1c0b71a:	48 89 fa             	mov    %rdi,%rdx
018d  1c0b71d:	48 c1 ea 03          	shr    $0x3,%rdx
0191  1c0b721:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0195  1c0b725:	84 c0                	test   %al,%al
0197  1c0b727:	74 08                	je     1c0b731 <mptscsih_abort+0x1a1>
0199  1c0b729:	3c 03                	cmp    $0x3,%al
019b  1c0b72b:	0f 8e bb 06 00 00    	jle    1c0bdec <mptscsih_abort+0x85c>
01a1  1c0b731:	f6 83 c9 00 00 00 01 	testb  $0x1,0xc9(%rbx)
01a8  1c0b738:	0f 85 4c 01 00 00    	jne    1c0b88a <mptscsih_abort+0x2fa>
01ae  1c0b73e:	49 8d bc 24 80 01 00 00 	lea    0x180(%r12),%rdi
01b6  1c0b746:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01c0  1c0b750:	48 89 fa             	mov    %rdi,%rdx
01c3  1c0b753:	48 c1 ea 03          	shr    $0x3,%rdx
01c7  1c0b757:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
01cb  1c0b75b:	84 c0                	test   %al,%al
01cd  1c0b75d:	74 08                	je     1c0b767 <mptscsih_abort+0x1d7>
01cf  1c0b75f:	3c 03                	cmp    $0x3,%al
01d1  1c0b761:	0f 8e ef 07 00 00    	jle    1c0bf56 <mptscsih_abort+0x9c6>
01d7  1c0b767:	41 be 03 20 00 00    	mov    $0x2003,%r14d
01dd  1c0b76d:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	1c0b770: R_X86_64_32S	.rodata+0x4d8560
01e4  1c0b774:	41 c7 84 24 80 01 00 00 00 00 08 00 	movl   $0x80000,0x180(%r12)
01f0  1c0b780:	4d 89 e0             	mov    %r12,%r8
01f3  1c0b783:	44 89 f1             	mov    %r14d,%ecx
01f6  1c0b786:	4c 89 fa             	mov    %r15,%rdx
01f9  1c0b789:	4c 89 ee             	mov    %r13,%rsi
01fc  1c0b78c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c0b78f: R_X86_64_32S	.rodata+0x4d9b80
0203  1c0b793:	e8 00 00 00 00       	call   1c0b798 <mptscsih_abort+0x208>	1c0b794: R_X86_64_PLT32	_printk-0x4
0208  1c0b798:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
020c  1c0b79c:	44 89 f0             	mov    %r14d,%eax
020f  1c0b79f:	5b                   	pop    %rbx
0210  1c0b7a0:	41 5c                	pop    %r12
0212  1c0b7a2:	41 5d                	pop    %r13
0214  1c0b7a4:	41 5e                	pop    %r14
0216  1c0b7a6:	41 5f                	pop    %r15
0218  1c0b7a8:	5d                   	pop    %rbp
0219  1c0b7a9:	c3                   	ret
021a  1c0b7aa:	48 8d bb c8 00 00 00 	lea    0xc8(%rbx),%rdi
0221  1c0b7b1:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
022b  1c0b7bb:	48 89 fa             	mov    %rdi,%rdx
022e  1c0b7be:	48 c1 ea 03          	shr    $0x3,%rdx
0232  1c0b7c2:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0236  1c0b7c6:	84 c0                	test   %al,%al
0238  1c0b7c8:	74 08                	je     1c0b7d2 <mptscsih_abort+0x242>
023a  1c0b7ca:	3c 03                	cmp    $0x3,%al
023c  1c0b7cc:	0f 8e 24 06 00 00    	jle    1c0bdf6 <mptscsih_abort+0x866>
0242  1c0b7d2:	f6 83 c9 00 00 00 01 	testb  $0x1,0xc9(%rbx)
0249  1c0b7d9:	0f 84 5f ff ff ff    	je     1c0b73e <mptscsih_abort+0x1ae>
024f  1c0b7df:	4c 89 e2             	mov    %r12,%rdx
0252  1c0b7e2:	4c 89 ee             	mov    %r13,%rsi
0255  1c0b7e5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c0b7e8: R_X86_64_32S	.rodata+0x4d9940
025c  1c0b7ec:	e8 00 00 00 00       	call   1c0b7f1 <mptscsih_abort+0x261>	1c0b7ed: R_X86_64_PLT32	_printk-0x4
0261  1c0b7f1:	e9 48 ff ff ff       	jmp    1c0b73e <mptscsih_abort+0x1ae>
0266  1c0b7f6:	48 8d bb c8 00 00 00 	lea    0xc8(%rbx),%rdi
026d  1c0b7fd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0277  1c0b807:	48 89 fa             	mov    %rdi,%rdx
027a  1c0b80a:	48 c1 ea 03          	shr    $0x3,%rdx
027e  1c0b80e:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0282  1c0b812:	84 c0                	test   %al,%al
0284  1c0b814:	74 08                	je     1c0b81e <mptscsih_abort+0x28e>
0286  1c0b816:	3c 03                	cmp    $0x3,%al
0288  1c0b818:	0f 8e e2 05 00 00    	jle    1c0be00 <mptscsih_abort+0x870>
028e  1c0b81e:	f6 83 c9 00 00 00 01 	testb  $0x1,0xc9(%rbx)
0295  1c0b825:	75 4f                	jne    1c0b876 <mptscsih_abort+0x2e6>
0297  1c0b827:	49 8d bc 24 80 01 00 00 	lea    0x180(%r12),%rdi
029f  1c0b82f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
02a9  1c0b839:	48 89 fa             	mov    %rdi,%rdx
02ac  1c0b83c:	48 c1 ea 03          	shr    $0x3,%rdx
02b0  1c0b840:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
02b4  1c0b844:	84 c0                	test   %al,%al
02b6  1c0b846:	74 08                	je     1c0b850 <mptscsih_abort+0x2c0>
02b8  1c0b848:	3c 03                	cmp    $0x3,%al
02ba  1c0b84a:	0f 8e ba 05 00 00    	jle    1c0be0a <mptscsih_abort+0x87a>
02c0  1c0b850:	4c 89 e7             	mov    %r12,%rdi
02c3  1c0b853:	41 be 02 20 00 00    	mov    $0x2002,%r14d
02c9  1c0b859:	41 c7 84 24 80 01 00 00 00 00 01 00 	movl   $0x10000,0x180(%r12)
02d5  1c0b865:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	1c0b868: R_X86_64_32S	.rodata+0x4d84c0
02dc  1c0b86c:	e8 00 00 00 00       	call   1c0b871 <mptscsih_abort+0x2e1>	1c0b86d: R_X86_64_PLT32	scsi_done-0x4
02e1  1c0b871:	e9 0a ff ff ff       	jmp    1c0b780 <mptscsih_abort+0x1f0>
02e6  1c0b876:	4c 89 e2             	mov    %r12,%rdx
02e9  1c0b879:	4c 89 ee             	mov    %r13,%rsi
02ec  1c0b87c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c0b87f: R_X86_64_32S	.rodata+0x4d98e0
02f3  1c0b883:	e8 00 00 00 00       	call   1c0b888 <mptscsih_abort+0x2f8>	1c0b884: R_X86_64_PLT32	_printk-0x4
02f8  1c0b888:	eb 9d                	jmp    1c0b827 <mptscsih_abort+0x297>
02fa  1c0b88a:	4c 89 e2             	mov    %r12,%rdx
02fd  1c0b88d:	4c 89 ee             	mov    %r13,%rsi
0300  1c0b890:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c0b893: R_X86_64_32S	.rodata+0x4d99a0
0307  1c0b897:	e8 00 00 00 00       	call   1c0b89c <mptscsih_abort+0x30c>	1c0b898: R_X86_64_PLT32	_printk-0x4
030c  1c0b89c:	e9 9d fe ff ff       	jmp    1c0b73e <mptscsih_abort+0x1ae>
0311  1c0b8a1:	4c 8d bb 50 14 00 00 	lea    0x1450(%rbx),%r15
0318  1c0b8a8:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
031c  1c0b8ac:	4c 89 ff             	mov    %r15,%rdi
031f  1c0b8af:	e8 00 00 00 00       	call   1c0b8b4 <mptscsih_abort+0x324>	1c0b8b0: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
0324  1c0b8b4:	48 8d b3 dc 01 00 00 	lea    0x1dc(%rbx),%rsi
032b  1c0b8bb:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
032f  1c0b8bf:	48 89 f1             	mov    %rsi,%rcx
0332  1c0b8c2:	49 89 c1             	mov    %rax,%r9
0335  1c0b8c5:	48 89 75 c8          	mov    %rsi,-0x38(%rbp)
0339  1c0b8c9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0343  1c0b8d3:	48 c1 e9 03          	shr    $0x3,%rcx
0347  1c0b8d7:	0f b6 0c 01          	movzbl (%rcx,%rax,1),%ecx
034b  1c0b8db:	48 89 f0             	mov    %rsi,%rax
034e  1c0b8de:	83 e0 07             	and    $0x7,%eax
0351  1c0b8e1:	83 c0 03             	add    $0x3,%eax
0354  1c0b8e4:	38 c8                	cmp    %cl,%al
0356  1c0b8e6:	7c 08                	jl     1c0b8f0 <mptscsih_abort+0x360>
0358  1c0b8e8:	84 c9                	test   %cl,%cl
035a  1c0b8ea:	0f 85 29 06 00 00    	jne    1c0bf19 <mptscsih_abort+0x989>
0360  1c0b8f0:	8b b3 dc 01 00 00    	mov    0x1dc(%rbx),%esi
0366  1c0b8f6:	85 f6                	test   %esi,%esi
0368  1c0b8f8:	0f 8e 41 04 00 00    	jle    1c0bd3f <mptscsih_abort+0x7af>
036e  1c0b8fe:	48 8d 83 48 14 00 00 	lea    0x1448(%rbx),%rax
0375  1c0b905:	48 89 c1             	mov    %rax,%rcx
0378  1c0b908:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
037c  1c0b90c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0386  1c0b916:	48 c1 e9 03          	shr    $0x3,%rcx
038a  1c0b91a:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
038e  1c0b91e:	0f 85 0e 06 00 00    	jne    1c0bf32 <mptscsih_abort+0x9a2>
0394  1c0b924:	48 8b 83 48 14 00 00 	mov    0x1448(%rbx),%rax
039b  1c0b92b:	45 31 d2             	xor    %r10d,%r10d
039e  1c0b92e:	49 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r8
03a8  1c0b938:	eb 11                	jmp    1c0b94b <mptscsih_abort+0x3bb>
03aa  1c0b93a:	41 83 c2 01          	add    $0x1,%r10d
03ae  1c0b93e:	48 83 c0 08          	add    $0x8,%rax
03b2  1c0b942:	41 39 f2             	cmp    %esi,%r10d
03b5  1c0b945:	0f 84 f4 03 00 00    	je     1c0bd3f <mptscsih_abort+0x7af>
03bb  1c0b94b:	48 89 c1             	mov    %rax,%rcx
03be  1c0b94e:	48 c1 e9 03          	shr    $0x3,%rcx
03c2  1c0b952:	42 80 3c 01 00       	cmpb   $0x0,(%rcx,%r8,1)
03c7  1c0b957:	0f 85 fd 04 00 00    	jne    1c0be5a <mptscsih_abort+0x8ca>
03cd  1c0b95d:	4c 3b 20             	cmp    (%rax),%r12
03d0  1c0b960:	75 d8                	jne    1c0b93a <mptscsih_abort+0x3aa>
03d2  1c0b962:	4c 89 ff             	mov    %r15,%rdi
03d5  1c0b965:	4c 89 ce             	mov    %r9,%rsi
03d8  1c0b968:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
03dc  1c0b96c:	44 89 55 c0          	mov    %r10d,-0x40(%rbp)
03e0  1c0b970:	e8 00 00 00 00       	call   1c0b975 <mptscsih_abort+0x3e5>	1c0b971: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
03e5  1c0b975:	48 8d bb 40 14 00 00 	lea    0x1440(%rbx),%rdi
03ec  1c0b97c:	44 8b 55 c0          	mov    -0x40(%rbp),%r10d
03f0  1c0b980:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
03fa  1c0b98a:	48 89 f9             	mov    %rdi,%rcx
03fd  1c0b98d:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
0401  1c0b991:	48 c1 e9 03          	shr    $0x3,%rcx
0405  1c0b995:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0409  1c0b999:	0f 85 e2 05 00 00    	jne    1c0bf81 <mptscsih_abort+0x9f1>
040f  1c0b99f:	48 8b 83 40 14 00 00 	mov    0x1440(%rbx),%rax
0416  1c0b9a6:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
041a  1c0b9aa:	74 0b                	je     1c0b9b7 <mptscsih_abort+0x427>
041c  1c0b9ac:	48 83 c0 01          	add    $0x1,%rax
0420  1c0b9b0:	48 89 83 40 14 00 00 	mov    %rax,0x1440(%rbx)
0427  1c0b9b7:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	1c0b9ba: R_X86_64_32S	mpt_fwfault_debug
042e  1c0b9be:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0438  1c0b9c8:	48 89 c6             	mov    %rax,%rsi
043b  1c0b9cb:	83 e0 07             	and    $0x7,%eax
043e  1c0b9ce:	48 c1 ee 03          	shr    $0x3,%rsi
0442  1c0b9d2:	83 c0 03             	add    $0x3,%eax
0445  1c0b9d5:	0f b6 0c 0e          	movzbl (%rsi,%rcx,1),%ecx
0449  1c0b9d9:	38 c8                	cmp    %cl,%al
044b  1c0b9db:	7c 08                	jl     1c0b9e5 <mptscsih_abort+0x455>
044d  1c0b9dd:	84 c9                	test   %cl,%cl
044f  1c0b9df:	0f 85 7b 05 00 00    	jne    1c0bf60 <mptscsih_abort+0x9d0>
0455  1c0b9e5:	8b 35 00 00 00 00    	mov    0x0(%rip),%esi        # 1c0b9eb <mptscsih_abort+0x45b>	1c0b9e7: R_X86_64_PC32	mpt_fwfault_debug-0x4
045b  1c0b9eb:	85 f6                	test   %esi,%esi
045d  1c0b9ed:	0f 85 33 04 00 00    	jne    1c0be26 <mptscsih_abort+0x896>
0463  1c0b9f3:	48 8d bb d0 01 00 00 	lea    0x1d0(%rbx),%rdi
046a  1c0b9fa:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0474  1c0ba04:	48 89 f9             	mov    %rdi,%rcx
0477  1c0ba07:	48 c1 e9 03          	shr    $0x3,%rcx
047b  1c0ba0b:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
047f  1c0ba0f:	0f 85 0f 06 00 00    	jne    1c0c024 <mptscsih_abort+0xa94>
0485  1c0ba15:	48 8d bb e0 01 00 00 	lea    0x1e0(%rbx),%rdi
048c  1c0ba1c:	48 8b 83 d0 01 00 00 	mov    0x1d0(%rbx),%rax
0493  1c0ba23:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
049d  1c0ba2d:	48 89 fe             	mov    %rdi,%rsi
04a0  1c0ba30:	48 c1 ee 03          	shr    $0x3,%rsi
04a4  1c0ba34:	0f b6 0c 0e          	movzbl (%rsi,%rcx,1),%ecx
04a8  1c0ba38:	84 c9                	test   %cl,%cl
04aa  1c0ba3a:	74 09                	je     1c0ba45 <mptscsih_abort+0x4b5>
04ac  1c0ba3c:	80 f9 03             	cmp    $0x3,%cl
04af  1c0ba3f:	0f 8e 1b 06 00 00    	jle    1c0c060 <mptscsih_abort+0xad0>
04b5  1c0ba45:	8b 8b e0 01 00 00    	mov    0x1e0(%rbx),%ecx
04bb  1c0ba4b:	41 0f af ca          	imul   %r10d,%ecx
04bf  1c0ba4f:	48 63 c9             	movslq %ecx,%rcx
04c2  1c0ba52:	48 01 c8             	add    %rcx,%rax
04c5  1c0ba55:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
04cf  1c0ba5f:	48 8d 78 08          	lea    0x8(%rax),%rdi
04d3  1c0ba63:	48 89 fe             	mov    %rdi,%rsi
04d6  1c0ba66:	48 c1 ee 03          	shr    $0x3,%rsi
04da  1c0ba6a:	0f b6 0c 0e          	movzbl (%rsi,%rcx,1),%ecx
04de  1c0ba6e:	84 c9                	test   %cl,%cl
04e0  1c0ba70:	74 09                	je     1c0ba7b <mptscsih_abort+0x4eb>
04e2  1c0ba72:	80 f9 03             	cmp    $0x3,%cl
04e5  1c0ba75:	0f 8e c3 05 00 00    	jle    1c0c03e <mptscsih_abort+0xaae>
04eb  1c0ba7b:	48 8d bb e0 00 00 00 	lea    0xe0(%rbx),%rdi
04f2  1c0ba82:	44 8b 48 08          	mov    0x8(%rax),%r9d
04f6  1c0ba86:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0500  1c0ba90:	48 89 f9             	mov    %rdi,%rcx
0503  1c0ba93:	48 c1 e9 03          	shr    $0x3,%rcx
0507  1c0ba97:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
050b  1c0ba9b:	84 c0                	test   %al,%al
050d  1c0ba9d:	74 06                	je     1c0baa5 <mptscsih_abort+0x515>
050f  1c0ba9f:	0f 8e 6e 06 00 00    	jle    1c0c113 <mptscsih_abort+0xb83>
0515  1c0baa5:	0f b6 83 e0 00 00 00 	movzbl 0xe0(%rbx),%eax
051c  1c0baac:	41 bb 28 00 00 00    	mov    $0x28,%r11d
0522  1c0bab2:	84 c0                	test   %al,%al
0524  1c0bab4:	74 13                	je     1c0bac9 <mptscsih_abort+0x539>
0526  1c0bab6:	3c 02                	cmp    $0x2,%al
0528  1c0bab8:	b9 0a 00 00 00       	mov    $0xa,%ecx
052d  1c0babd:	b8 1e 00 00 00       	mov    $0x1e,%eax
0532  1c0bac2:	48 0f 45 c1          	cmovne %rcx,%rax
0536  1c0bac6:	49 89 c3             	mov    %rax,%r11
0539  1c0bac9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0543  1c0bad3:	48 8d 7a 10          	lea    0x10(%rdx),%rdi
0547  1c0bad7:	48 89 f9             	mov    %rdi,%rcx
054a  1c0bada:	48 c1 e9 03          	shr    $0x3,%rcx
054e  1c0bade:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0552  1c0bae2:	0f 85 01 06 00 00    	jne    1c0c0e9 <mptscsih_abort+0xb59>
0558  1c0bae8:	48 89 d1             	mov    %rdx,%rcx
055b  1c0baeb:	4c 8b 42 10          	mov    0x10(%rdx),%r8
055f  1c0baef:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0569  1c0baf9:	48 c1 e9 03          	shr    $0x3,%rcx
056d  1c0bafd:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0571  1c0bb01:	0f 85 ad 05 00 00    	jne    1c0c0b4 <mptscsih_abort+0xb24>
0577  1c0bb07:	48 8b 02             	mov    (%rdx),%rax
057a  1c0bb0a:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0584  1c0bb14:	48 8d 78 0a          	lea    0xa(%rax),%rdi
0588  1c0bb18:	48 89 f9             	mov    %rdi,%rcx
058b  1c0bb1b:	48 c1 e9 03          	shr    $0x3,%rcx
058f  1c0bb1f:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
0593  1c0bb23:	48 89 f9             	mov    %rdi,%rcx
0596  1c0bb26:	83 e1 07             	and    $0x7,%ecx
0599  1c0bb29:	38 ca                	cmp    %cl,%dl
059b  1c0bb2b:	7f 08                	jg     1c0bb35 <mptscsih_abort+0x5a5>
059d  1c0bb2d:	84 d2                	test   %dl,%dl
059f  1c0bb2f:	0f 85 4d 05 00 00    	jne    1c0c082 <mptscsih_abort+0xaf2>
05a5  1c0bb35:	48 8d 78 0b          	lea    0xb(%rax),%rdi
05a9  1c0bb39:	0f b6 48 0a          	movzbl 0xa(%rax),%ecx
05ad  1c0bb3d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
05b7  1c0bb47:	48 89 fe             	mov    %rdi,%rsi
05ba  1c0bb4a:	48 c1 ee 03          	shr    $0x3,%rsi
05be  1c0bb4e:	0f b6 14 16          	movzbl (%rsi,%rdx,1),%edx
05c2  1c0bb52:	48 89 fe             	mov    %rdi,%rsi
05c5  1c0bb55:	83 e6 07             	and    $0x7,%esi
05c8  1c0bb58:	40 38 f2             	cmp    %sil,%dl
05cb  1c0bb5b:	7f 08                	jg     1c0bb65 <mptscsih_abort+0x5d5>
05cd  1c0bb5d:	84 d2                	test   %dl,%dl
05cf  1c0bb5f:	0f 85 7d 04 00 00    	jne    1c0bfe2 <mptscsih_abort+0xa52>
05d5  1c0bb65:	0f b6 50 0b          	movzbl 0xb(%rax),%edx
05d9  1c0bb69:	41 53                	push   %r11
05db  1c0bb6b:	be 01 00 00 00       	mov    $0x1,%esi
05e0  1c0bb70:	4c 89 f7             	mov    %r14,%rdi
05e3  1c0bb73:	44 89 55 c0          	mov    %r10d,-0x40(%rbp)
05e7  1c0bb77:	e8 00 00 00 00       	call   1c0bb7c <mptscsih_abort+0x5ec>	1c0bb78: R_X86_64_PLT32	mptscsih_IssueTaskMgmt-0x4
05ec  1c0bb7c:	4c 89 ff             	mov    %r15,%rdi
05ef  1c0bb7f:	e8 00 00 00 00       	call   1c0bb84 <mptscsih_abort+0x5f4>	1c0bb80: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
05f4  1c0bb84:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
05f8  1c0bb88:	44 8b 55 c0          	mov    -0x40(%rbp),%r10d
05fc  1c0bb8c:	49 89 c0             	mov    %rax,%r8
05ff  1c0bb8f:	59                   	pop    %rcx
0600  1c0bb90:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
060a  1c0bb9a:	48 89 f2             	mov    %rsi,%rdx
060d  1c0bb9d:	48 c1 ea 03          	shr    $0x3,%rdx
0611  1c0bba1:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0615  1c0bba5:	48 89 f0             	mov    %rsi,%rax
0618  1c0bba8:	83 e0 07             	and    $0x7,%eax
061b  1c0bbab:	83 c0 03             	add    $0x3,%eax
061e  1c0bbae:	38 d0                	cmp    %dl,%al
0620  1c0bbb0:	7c 08                	jl     1c0bbba <mptscsih_abort+0x62a>
0622  1c0bbb2:	84 d2                	test   %dl,%dl
0624  1c0bbb4:	0f 85 0f 04 00 00    	jne    1c0bfc9 <mptscsih_abort+0xa39>
062a  1c0bbba:	8b 8b dc 01 00 00    	mov    0x1dc(%rbx),%ecx
0630  1c0bbc0:	85 c9                	test   %ecx,%ecx
0632  1c0bbc2:	0f 8e cd 00 00 00    	jle    1c0bc95 <mptscsih_abort+0x705>
0638  1c0bbc8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0642  1c0bbd2:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
0646  1c0bbd6:	48 c1 ea 03          	shr    $0x3,%rdx
064a  1c0bbda:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
064e  1c0bbde:	0f 85 b7 03 00 00    	jne    1c0bf9b <mptscsih_abort+0xa0b>
0654  1c0bbe4:	4c 8b b3 48 14 00 00 	mov    0x1448(%rbx),%r14
065b  1c0bbeb:	31 c0                	xor    %eax,%eax
065d  1c0bbed:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0667  1c0bbf7:	eb 0f                	jmp    1c0bc08 <mptscsih_abort+0x678>
0669  1c0bbf9:	83 c0 01             	add    $0x1,%eax
066c  1c0bbfc:	49 83 c6 08          	add    $0x8,%r14
0670  1c0bc00:	39 c8                	cmp    %ecx,%eax
0672  1c0bc02:	0f 84 8d 00 00 00    	je     1c0bc95 <mptscsih_abort+0x705>
0678  1c0bc08:	4c 89 f2             	mov    %r14,%rdx
067b  1c0bc0b:	48 c1 ea 03          	shr    $0x3,%rdx
067f  1c0bc0f:	80 3c 32 00          	cmpb   $0x0,(%rdx,%rsi,1)
0683  1c0bc13:	0f 85 95 02 00 00    	jne    1c0beae <mptscsih_abort+0x91e>
0689  1c0bc19:	4d 3b 26             	cmp    (%r14),%r12
068c  1c0bc1c:	75 db                	jne    1c0bbf9 <mptscsih_abort+0x669>
068e  1c0bc1e:	4c 89 c6             	mov    %r8,%rsi
0691  1c0bc21:	4c 89 ff             	mov    %r15,%rdi
0694  1c0bc24:	44 89 55 c8          	mov    %r10d,-0x38(%rbp)
0698  1c0bc28:	89 45 d0             	mov    %eax,-0x30(%rbp)
069b  1c0bc2b:	e8 00 00 00 00       	call   1c0bc30 <mptscsih_abort+0x6a0>	1c0bc2c: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
06a0  1c0bc30:	8b 45 d0             	mov    -0x30(%rbp),%eax
06a3  1c0bc33:	44 8b 55 c8          	mov    -0x38(%rbp),%r10d
06a7  1c0bc37:	44 39 d0             	cmp    %r10d,%eax
06aa  1c0bc3a:	75 64                	jne    1c0bca0 <mptscsih_abort+0x710>
06ac  1c0bc3c:	48 8d bb c8 00 00 00 	lea    0xc8(%rbx),%rdi
06b3  1c0bc43:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
06bd  1c0bc4d:	48 89 fa             	mov    %rdi,%rdx
06c0  1c0bc50:	48 c1 ea 03          	shr    $0x3,%rdx
06c4  1c0bc54:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
06c8  1c0bc58:	84 c0                	test   %al,%al
06ca  1c0bc5a:	74 08                	je     1c0bc64 <mptscsih_abort+0x6d4>
06cc  1c0bc5c:	3c 03                	cmp    $0x3,%al
06ce  1c0bc5e:	0f 8e b6 03 00 00    	jle    1c0c01a <mptscsih_abort+0xa8a>
06d4  1c0bc64:	41 be 03 20 00 00    	mov    $0x2003,%r14d
06da  1c0bc6a:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	1c0bc6d: R_X86_64_32S	.rodata+0x4d8560
06e1  1c0bc71:	f6 83 c9 00 00 00 01 	testb  $0x1,0xc9(%rbx)
06e8  1c0bc78:	0f 84 02 fb ff ff    	je     1c0b780 <mptscsih_abort+0x1f0>
06ee  1c0bc7e:	4c 89 e2             	mov    %r12,%rdx
06f1  1c0bc81:	4c 89 ee             	mov    %r13,%rsi
06f4  1c0bc84:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c0bc87: R_X86_64_32S	.rodata+0x4d9a80
06fb  1c0bc8b:	e8 00 00 00 00       	call   1c0bc90 <mptscsih_abort+0x700>	1c0bc8c: R_X86_64_PLT32	_printk-0x4
0700  1c0bc90:	e9 eb fa ff ff       	jmp    1c0b780 <mptscsih_abort+0x1f0>
0705  1c0bc95:	4c 89 c6             	mov    %r8,%rsi
0708  1c0bc98:	4c 89 ff             	mov    %r15,%rdi
070b  1c0bc9b:	e8 00 00 00 00       	call   1c0bca0 <mptscsih_abort+0x710>	1c0bc9c: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
0710  1c0bca0:	48 8d bb c8 00 00 00 	lea    0xc8(%rbx),%rdi
0717  1c0bca7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0721  1c0bcb1:	48 89 fa             	mov    %rdi,%rdx
0724  1c0bcb4:	48 c1 ea 03          	shr    $0x3,%rdx
0728  1c0bcb8:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
072c  1c0bcbc:	84 c0                	test   %al,%al
072e  1c0bcbe:	74 09                	je     1c0bcc9 <mptscsih_abort+0x739>
0730  1c0bcc0:	3c 03                	cmp    $0x3,%al
0732  1c0bcc2:	7f 05                	jg     1c0bcc9 <mptscsih_abort+0x739>
0734  1c0bcc4:	e8 00 00 00 00       	call   1c0bcc9 <mptscsih_abort+0x739>	1c0bcc5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0739  1c0bcc9:	f6 83 c9 00 00 00 01 	testb  $0x1,0xc9(%rbx)
0740  1c0bcd0:	0f 85 6d 01 00 00    	jne    1c0be43 <mptscsih_abort+0x8b3>
0746  1c0bcd6:	41 be 02 20 00 00    	mov    $0x2002,%r14d
074c  1c0bcdc:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	1c0bcdf: R_X86_64_32S	.rodata+0x4d84c0
0753  1c0bce3:	e9 98 fa ff ff       	jmp    1c0b780 <mptscsih_abort+0x1f0>
0758  1c0bce8:	49 8d bc 24 80 01 00 00 	lea    0x180(%r12),%rdi
0760  1c0bcf0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
076a  1c0bcfa:	48 89 fa             	mov    %rdi,%rdx
076d  1c0bcfd:	48 c1 ea 03          	shr    $0x3,%rdx
0771  1c0bd01:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0775  1c0bd05:	84 c0                	test   %al,%al
0777  1c0bd07:	74 08                	je     1c0bd11 <mptscsih_abort+0x781>
0779  1c0bd09:	3c 03                	cmp    $0x3,%al
077b  1c0bd0b:	0f 8e ae 02 00 00    	jle    1c0bfbf <mptscsih_abort+0xa2f>
0781  1c0bd11:	41 c7 84 24 80 01 00 00 00 00 08 00 	movl   $0x80000,0x180(%r12)
078d  1c0bd1d:	4c 89 e7             	mov    %r12,%rdi
0790  1c0bd20:	41 be 03 20 00 00    	mov    $0x2003,%r14d
0796  1c0bd26:	e8 00 00 00 00       	call   1c0bd2b <mptscsih_abort+0x79b>	1c0bd27: R_X86_64_PLT32	scsi_done-0x4
079b  1c0bd2b:	4c 89 e6             	mov    %r12,%rsi
079e  1c0bd2e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c0bd31: R_X86_64_32S	.rodata+0x4d9820
07a5  1c0bd35:	e8 00 00 00 00       	call   1c0bd3a <mptscsih_abort+0x7aa>	1c0bd36: R_X86_64_PLT32	_printk-0x4
07aa  1c0bd3a:	e9 59 fa ff ff       	jmp    1c0b798 <mptscsih_abort+0x208>
07af  1c0bd3f:	4c 89 ff             	mov    %r15,%rdi
07b2  1c0bd42:	4c 89 ce             	mov    %r9,%rsi
07b5  1c0bd45:	e8 00 00 00 00       	call   1c0bd4a <mptscsih_abort+0x7ba>	1c0bd46: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
07ba  1c0bd4a:	49 8d bc 24 80 01 00 00 	lea    0x180(%r12),%rdi
07c2  1c0bd52:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
07cc  1c0bd5c:	48 89 fa             	mov    %rdi,%rdx
07cf  1c0bd5f:	48 c1 ea 03          	shr    $0x3,%rdx
07d3  1c0bd63:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
07d7  1c0bd67:	84 c0                	test   %al,%al
07d9  1c0bd69:	74 09                	je     1c0bd74 <mptscsih_abort+0x7e4>
07db  1c0bd6b:	3c 03                	cmp    $0x3,%al
07dd  1c0bd6d:	7f 05                	jg     1c0bd74 <mptscsih_abort+0x7e4>
07df  1c0bd6f:	e8 00 00 00 00       	call   1c0bd74 <mptscsih_abort+0x7e4>	1c0bd70: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
07e4  1c0bd74:	48 8d bb c8 00 00 00 	lea    0xc8(%rbx),%rdi
07eb  1c0bd7b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
07f5  1c0bd85:	41 c7 84 24 80 01 00 00 00 00 08 00 	movl   $0x80000,0x180(%r12)
0801  1c0bd91:	48 89 fa             	mov    %rdi,%rdx
0804  1c0bd94:	48 c1 ea 03          	shr    $0x3,%rdx
0808  1c0bd98:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
080c  1c0bd9c:	84 c0                	test   %al,%al
080e  1c0bd9e:	74 09                	je     1c0bda9 <mptscsih_abort+0x819>
0810  1c0bda0:	3c 03                	cmp    $0x3,%al
0812  1c0bda2:	7f 05                	jg     1c0bda9 <mptscsih_abort+0x819>
0814  1c0bda4:	e8 00 00 00 00       	call   1c0bda9 <mptscsih_abort+0x819>	1c0bda5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0819  1c0bda9:	f6 83 c9 00 00 00 01 	testb  $0x1,0xc9(%rbx)
0820  1c0bdb0:	0f 84 20 ff ff ff    	je     1c0bcd6 <mptscsih_abort+0x746>
0826  1c0bdb6:	4c 89 e2             	mov    %r12,%rdx
0829  1c0bdb9:	4c 89 ee             	mov    %r13,%rsi
082c  1c0bdbc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c0bdbf: R_X86_64_32S	.rodata+0x4d9a00
0833  1c0bdc3:	41 be 02 20 00 00    	mov    $0x2002,%r14d
0839  1c0bdc9:	e8 00 00 00 00       	call   1c0bdce <mptscsih_abort+0x83e>	1c0bdca: R_X86_64_PLT32	_printk-0x4
083e  1c0bdce:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	1c0bdd1: R_X86_64_32S	.rodata+0x4d84c0
0845  1c0bdd5:	e9 a6 f9 ff ff       	jmp    1c0b780 <mptscsih_abort+0x1f0>
084a  1c0bdda:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
084e  1c0bdde:	e8 00 00 00 00       	call   1c0bde3 <mptscsih_abort+0x853>	1c0bddf: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0853  1c0bde3:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
0857  1c0bde7:	e9 e4 f8 ff ff       	jmp    1c0b6d0 <mptscsih_abort+0x140>
085c  1c0bdec:	e8 00 00 00 00       	call   1c0bdf1 <mptscsih_abort+0x861>	1c0bded: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0861  1c0bdf1:	e9 3b f9 ff ff       	jmp    1c0b731 <mptscsih_abort+0x1a1>
0866  1c0bdf6:	e8 00 00 00 00       	call   1c0bdfb <mptscsih_abort+0x86b>	1c0bdf7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
086b  1c0bdfb:	e9 d2 f9 ff ff       	jmp    1c0b7d2 <mptscsih_abort+0x242>
0870  1c0be00:	e8 00 00 00 00       	call   1c0be05 <mptscsih_abort+0x875>	1c0be01: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0875  1c0be05:	e9 14 fa ff ff       	jmp    1c0b81e <mptscsih_abort+0x28e>
087a  1c0be0a:	e8 00 00 00 00       	call   1c0be0f <mptscsih_abort+0x87f>	1c0be0b: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
087f  1c0be0f:	e9 3c fa ff ff       	jmp    1c0b850 <mptscsih_abort+0x2c0>
0884  1c0be14:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
0888  1c0be18:	e8 00 00 00 00       	call   1c0be1d <mptscsih_abort+0x88d>	1c0be19: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
088d  1c0be1d:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
0891  1c0be21:	e9 d8 f8 ff ff       	jmp    1c0b6fe <mptscsih_abort+0x16e>
0896  1c0be26:	48 89 df             	mov    %rbx,%rdi
0899  1c0be29:	44 89 55 b8          	mov    %r10d,-0x48(%rbp)
089d  1c0be2d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
08a1  1c0be31:	e8 00 00 00 00       	call   1c0be36 <mptscsih_abort+0x8a6>	1c0be32: R_X86_64_PLT32	mpt_halt_firmware-0x4
08a6  1c0be36:	44 8b 55 b8          	mov    -0x48(%rbp),%r10d
08aa  1c0be3a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
08ae  1c0be3e:	e9 b0 fb ff ff       	jmp    1c0b9f3 <mptscsih_abort+0x463>
08b3  1c0be43:	4c 89 e2             	mov    %r12,%rdx
08b6  1c0be46:	4c 89 ee             	mov    %r13,%rsi
08b9  1c0be49:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c0be4c: R_X86_64_32S	.rodata+0x4d9b00
08c0  1c0be50:	e8 00 00 00 00       	call   1c0be55 <mptscsih_abort+0x8c5>	1c0be51: R_X86_64_PLT32	_printk-0x4
08c5  1c0be55:	e9 7c fe ff ff       	jmp    1c0bcd6 <mptscsih_abort+0x746>
08ca  1c0be5a:	48 89 c7             	mov    %rax,%rdi
08cd  1c0be5d:	89 75 a0             	mov    %esi,-0x60(%rbp)
08d0  1c0be60:	44 89 55 a8          	mov    %r10d,-0x58(%rbp)
08d4  1c0be64:	4c 89 4d b0          	mov    %r9,-0x50(%rbp)
08d8  1c0be68:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
08dc  1c0be6c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
08e0  1c0be70:	e8 00 00 00 00       	call   1c0be75 <mptscsih_abort+0x8e5>	1c0be71: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
08e5  1c0be75:	8b 75 a0             	mov    -0x60(%rbp),%esi
08e8  1c0be78:	44 8b 55 a8          	mov    -0x58(%rbp),%r10d
08ec  1c0be7c:	49 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r8
08f6  1c0be86:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
08fa  1c0be8a:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
08fe  1c0be8e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0902  1c0be92:	e9 c6 fa ff ff       	jmp    1c0b95d <mptscsih_abort+0x3cd>
0907  1c0be97:	e8 00 00 00 00       	call   1c0be9c <mptscsih_abort+0x90c>	1c0be98: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
090c  1c0be9c:	e9 22 f7 ff ff       	jmp    1c0b5c3 <mptscsih_abort+0x33>
0911  1c0bea1:	48 89 df             	mov    %rbx,%rdi
0914  1c0bea4:	e8 00 00 00 00       	call   1c0bea9 <mptscsih_abort+0x919>	1c0bea5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0919  1c0bea9:	e9 34 f7 ff ff       	jmp    1c0b5e2 <mptscsih_abort+0x52>
091e  1c0beae:	4c 89 f7             	mov    %r14,%rdi
0921  1c0beb1:	89 4d b8             	mov    %ecx,-0x48(%rbp)
0924  1c0beb4:	89 45 c0             	mov    %eax,-0x40(%rbp)
0927  1c0beb7:	4c 89 45 c8          	mov    %r8,-0x38(%rbp)
092b  1c0bebb:	44 89 55 d0          	mov    %r10d,-0x30(%rbp)
092f  1c0bebf:	e8 00 00 00 00       	call   1c0bec4 <mptscsih_abort+0x934>	1c0bec0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0934  1c0bec4:	be ff ff 37 00       	mov    $0x37ffff,%esi
0939  1c0bec9:	8b 4d b8             	mov    -0x48(%rbp),%ecx
093c  1c0becc:	8b 45 c0             	mov    -0x40(%rbp),%eax
093f  1c0becf:	4c 8b 45 c8          	mov    -0x38(%rbp),%r8
0943  1c0bed3:	44 8b 55 d0          	mov    -0x30(%rbp),%r10d
0947  1c0bed7:	48 c1 e6 2a          	shl    $0x2a,%rsi
094b  1c0bedb:	e9 39 fd ff ff       	jmp    1c0bc19 <mptscsih_abort+0x689>
0950  1c0bee0:	4c 89 e7             	mov    %r12,%rdi
0953  1c0bee3:	e8 00 00 00 00       	call   1c0bee8 <mptscsih_abort+0x958>	1c0bee4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0958  1c0bee8:	e9 63 f7 ff ff       	jmp    1c0b650 <mptscsih_abort+0xc0>
095d  1c0beed:	48 89 d7             	mov    %rdx,%rdi
0960  1c0bef0:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
0964  1c0bef4:	e8 00 00 00 00       	call   1c0bef9 <mptscsih_abort+0x969>	1c0bef5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0969  1c0bef9:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
096d  1c0befd:	e9 9f f7 ff ff       	jmp    1c0b6a1 <mptscsih_abort+0x111>
0972  1c0bf02:	4c 89 f7             	mov    %r14,%rdi
0975  1c0bf05:	e8 00 00 00 00       	call   1c0bf0a <mptscsih_abort+0x97a>	1c0bf06: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
097a  1c0bf0a:	e9 01 f7 ff ff       	jmp    1c0b610 <mptscsih_abort+0x80>
097f  1c0bf0f:	e8 00 00 00 00       	call   1c0bf14 <mptscsih_abort+0x984>	1c0bf10: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0984  1c0bf14:	e9 5d f7 ff ff       	jmp    1c0b676 <mptscsih_abort+0xe6>
0989  1c0bf19:	48 89 f7             	mov    %rsi,%rdi
098c  1c0bf1c:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
0990  1c0bf20:	e8 00 00 00 00       	call   1c0bf25 <mptscsih_abort+0x995>	1c0bf21: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0995  1c0bf25:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
0999  1c0bf29:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
099d  1c0bf2d:	e9 be f9 ff ff       	jmp    1c0b8f0 <mptscsih_abort+0x360>
09a2  1c0bf32:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
09a6  1c0bf36:	89 75 b0             	mov    %esi,-0x50(%rbp)
09a9  1c0bf39:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
09ad  1c0bf3d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
09b1  1c0bf41:	e8 00 00 00 00       	call   1c0bf46 <mptscsih_abort+0x9b6>	1c0bf42: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
09b6  1c0bf46:	8b 75 b0             	mov    -0x50(%rbp),%esi
09b9  1c0bf49:	4c 8b 4d b8          	mov    -0x48(%rbp),%r9
09bd  1c0bf4d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
09c1  1c0bf51:	e9 ce f9 ff ff       	jmp    1c0b924 <mptscsih_abort+0x394>
09c6  1c0bf56:	e8 00 00 00 00       	call   1c0bf5b <mptscsih_abort+0x9cb>	1c0bf57: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
09cb  1c0bf5b:	e9 07 f8 ff ff       	jmp    1c0b767 <mptscsih_abort+0x1d7>
09d0  1c0bf60:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c0bf63: R_X86_64_32S	mpt_fwfault_debug
09d7  1c0bf67:	44 89 55 b8          	mov    %r10d,-0x48(%rbp)
09db  1c0bf6b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
09df  1c0bf6f:	e8 00 00 00 00       	call   1c0bf74 <mptscsih_abort+0x9e4>	1c0bf70: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
09e4  1c0bf74:	44 8b 55 b8          	mov    -0x48(%rbp),%r10d
09e8  1c0bf78:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
09ec  1c0bf7c:	e9 64 fa ff ff       	jmp    1c0b9e5 <mptscsih_abort+0x455>
09f1  1c0bf81:	44 89 55 b8          	mov    %r10d,-0x48(%rbp)
09f5  1c0bf85:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
09f9  1c0bf89:	e8 00 00 00 00       	call   1c0bf8e <mptscsih_abort+0x9fe>	1c0bf8a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
09fe  1c0bf8e:	44 8b 55 b8          	mov    -0x48(%rbp),%r10d
0a02  1c0bf92:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
0a06  1c0bf96:	e9 04 fa ff ff       	jmp    1c0b99f <mptscsih_abort+0x40f>
0a0b  1c0bf9b:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
0a0f  1c0bf9f:	89 4d b8             	mov    %ecx,-0x48(%rbp)
0a12  1c0bfa2:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
0a16  1c0bfa6:	44 89 55 c8          	mov    %r10d,-0x38(%rbp)
0a1a  1c0bfaa:	e8 00 00 00 00       	call   1c0bfaf <mptscsih_abort+0xa1f>	1c0bfab: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a1f  1c0bfaf:	8b 4d b8             	mov    -0x48(%rbp),%ecx
0a22  1c0bfb2:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
0a26  1c0bfb6:	44 8b 55 c8          	mov    -0x38(%rbp),%r10d
0a2a  1c0bfba:	e9 25 fc ff ff       	jmp    1c0bbe4 <mptscsih_abort+0x654>
0a2f  1c0bfbf:	e8 00 00 00 00       	call   1c0bfc4 <mptscsih_abort+0xa34>	1c0bfc0: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0a34  1c0bfc4:	e9 48 fd ff ff       	jmp    1c0bd11 <mptscsih_abort+0x781>
0a39  1c0bfc9:	48 89 f7             	mov    %rsi,%rdi
0a3c  1c0bfcc:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
0a40  1c0bfd0:	e8 00 00 00 00       	call   1c0bfd5 <mptscsih_abort+0xa45>	1c0bfd1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a45  1c0bfd5:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
0a49  1c0bfd9:	44 8b 55 c0          	mov    -0x40(%rbp),%r10d
0a4d  1c0bfdd:	e9 d8 fb ff ff       	jmp    1c0bbba <mptscsih_abort+0x62a>
0a52  1c0bfe2:	4c 89 5d 98          	mov    %r11,-0x68(%rbp)
0a56  1c0bfe6:	44 89 55 a0          	mov    %r10d,-0x60(%rbp)
0a5a  1c0bfea:	44 89 4d a8          	mov    %r9d,-0x58(%rbp)
0a5e  1c0bfee:	89 4d b0             	mov    %ecx,-0x50(%rbp)
0a61  1c0bff1:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
0a65  1c0bff5:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
0a69  1c0bff9:	e8 00 00 00 00       	call   1c0bffe <mptscsih_abort+0xa6e>	1c0bffa: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0a6e  1c0bffe:	4c 8b 5d 98          	mov    -0x68(%rbp),%r11
0a72  1c0c002:	44 8b 55 a0          	mov    -0x60(%rbp),%r10d
0a76  1c0c006:	44 8b 4d a8          	mov    -0x58(%rbp),%r9d
0a7a  1c0c00a:	8b 4d b0             	mov    -0x50(%rbp),%ecx
0a7d  1c0c00d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
0a81  1c0c011:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
0a85  1c0c015:	e9 4b fb ff ff       	jmp    1c0bb65 <mptscsih_abort+0x5d5>
0a8a  1c0c01a:	e8 00 00 00 00       	call   1c0c01f <mptscsih_abort+0xa8f>	1c0c01b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a8f  1c0c01f:	e9 40 fc ff ff       	jmp    1c0bc64 <mptscsih_abort+0x6d4>
0a94  1c0c024:	44 89 55 b8          	mov    %r10d,-0x48(%rbp)
0a98  1c0c028:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
0a9c  1c0c02c:	e8 00 00 00 00       	call   1c0c031 <mptscsih_abort+0xaa1>	1c0c02d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0aa1  1c0c031:	44 8b 55 b8          	mov    -0x48(%rbp),%r10d
0aa5  1c0c035:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
0aa9  1c0c039:	e9 d7 f9 ff ff       	jmp    1c0ba15 <mptscsih_abort+0x485>
0aae  1c0c03e:	44 89 55 b0          	mov    %r10d,-0x50(%rbp)
0ab2  1c0c042:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
0ab6  1c0c046:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
0aba  1c0c04a:	e8 00 00 00 00       	call   1c0c04f <mptscsih_abort+0xabf>	1c0c04b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0abf  1c0c04f:	44 8b 55 b0          	mov    -0x50(%rbp),%r10d
0ac3  1c0c053:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
0ac7  1c0c057:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
0acb  1c0c05b:	e9 1b fa ff ff       	jmp    1c0ba7b <mptscsih_abort+0x4eb>
0ad0  1c0c060:	44 89 55 b0          	mov    %r10d,-0x50(%rbp)
0ad4  1c0c064:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
0ad8  1c0c068:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
0adc  1c0c06c:	e8 00 00 00 00       	call   1c0c071 <mptscsih_abort+0xae1>	1c0c06d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0ae1  1c0c071:	44 8b 55 b0          	mov    -0x50(%rbp),%r10d
0ae5  1c0c075:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
0ae9  1c0c079:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0aed  1c0c07d:	e9 c3 f9 ff ff       	jmp    1c0ba45 <mptscsih_abort+0x4b5>
0af2  1c0c082:	4c 89 5d a0          	mov    %r11,-0x60(%rbp)
0af6  1c0c086:	44 89 55 a8          	mov    %r10d,-0x58(%rbp)
0afa  1c0c08a:	44 89 4d b0          	mov    %r9d,-0x50(%rbp)
0afe  1c0c08e:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
0b02  1c0c092:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
0b06  1c0c096:	e8 00 00 00 00       	call   1c0c09b <mptscsih_abort+0xb0b>	1c0c097: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0b0b  1c0c09b:	4c 8b 5d a0          	mov    -0x60(%rbp),%r11
0b0f  1c0c09f:	44 8b 55 a8          	mov    -0x58(%rbp),%r10d
0b13  1c0c0a3:	44 8b 4d b0          	mov    -0x50(%rbp),%r9d
0b17  1c0c0a7:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
0b1b  1c0c0ab:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
0b1f  1c0c0af:	e9 81 fa ff ff       	jmp    1c0bb35 <mptscsih_abort+0x5a5>
0b24  1c0c0b4:	48 89 d7             	mov    %rdx,%rdi
0b27  1c0c0b7:	4c 89 5d a0          	mov    %r11,-0x60(%rbp)
0b2b  1c0c0bb:	44 89 55 a8          	mov    %r10d,-0x58(%rbp)
0b2f  1c0c0bf:	44 89 4d b0          	mov    %r9d,-0x50(%rbp)
0b33  1c0c0c3:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
0b37  1c0c0c7:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
0b3b  1c0c0cb:	e8 00 00 00 00       	call   1c0c0d0 <mptscsih_abort+0xb40>	1c0c0cc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b40  1c0c0d0:	4c 8b 5d a0          	mov    -0x60(%rbp),%r11
0b44  1c0c0d4:	44 8b 55 a8          	mov    -0x58(%rbp),%r10d
0b48  1c0c0d8:	44 8b 4d b0          	mov    -0x50(%rbp),%r9d
0b4c  1c0c0dc:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
0b50  1c0c0e0:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
0b54  1c0c0e4:	e9 1e fa ff ff       	jmp    1c0bb07 <mptscsih_abort+0x577>
0b59  1c0c0e9:	4c 89 5d a8          	mov    %r11,-0x58(%rbp)
0b5d  1c0c0ed:	44 89 55 b0          	mov    %r10d,-0x50(%rbp)
0b61  1c0c0f1:	44 89 4d b8          	mov    %r9d,-0x48(%rbp)
0b65  1c0c0f5:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
0b69  1c0c0f9:	e8 00 00 00 00       	call   1c0c0fe <mptscsih_abort+0xb6e>	1c0c0fa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b6e  1c0c0fe:	4c 8b 5d a8          	mov    -0x58(%rbp),%r11
0b72  1c0c102:	44 8b 55 b0          	mov    -0x50(%rbp),%r10d
0b76  1c0c106:	44 8b 4d b8          	mov    -0x48(%rbp),%r9d
0b7a  1c0c10a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
0b7e  1c0c10e:	e9 d5 f9 ff ff       	jmp    1c0bae8 <mptscsih_abort+0x558>
0b83  1c0c113:	44 89 55 b0          	mov    %r10d,-0x50(%rbp)
0b87  1c0c117:	44 89 4d b8          	mov    %r9d,-0x48(%rbp)
0b8b  1c0c11b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
0b8f  1c0c11f:	e8 00 00 00 00       	call   1c0c124 <mptscsih_abort+0xb94>	1c0c120: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0b94  1c0c124:	44 8b 55 b0          	mov    -0x50(%rbp),%r10d
0b98  1c0c128:	44 8b 4d b8          	mov    -0x48(%rbp),%r9d
0b9c  1c0c12c:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
0ba0  1c0c130:	e9 70 f9 ff ff       	jmp    1c0baa5 <mptscsih_abort+0x515>
0ba5  1c0c135:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0baf  1c0c13f:	90                   	nop
0000 0000000000000c30 <abort>:
0000      c30:	f3 0f 1e fa          	endbr64
0004      c34:	90                   	nop
0005      c35:	0f 0b                	ud2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
