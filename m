Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BC762E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 05:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693028209; x=1724564209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r06ctireXL2iuyt7JenoWk3+bb4obZbys94kdZ95l+A=;
  b=hfIzo/YZ9WH7N7FghJG7tBBFayYnWUdtUy+y/Blw4W/ML1/Vq7KxBX29
   jz0lP3kIxmXbxp9bo5F1aP9HssW+iWJlI/fasrDwiMGaD2/vGzr7eWK9f
   nK6M+eAAoh5Y0HBnE6MpCu/aawQyEWlect+jOILp1iC773eMhc5gh5XFW
   mspT7mW8NXN8VgM7bgru8kd0wqJA3qTEMkIppWdgd/uDqUosZJ5Zo4DR4
   tLfWcW1Ol0+gHTyLPJNmmVVkuC8dif/y5Ga7jzCunwMEd0WNGMm5jo1S0
   co1Ty1dd8tBpCGYSKmnseHxBq6BlwXp9kTaroc+Qsar/Svu0HDFlGabFa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="405845495"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="405845495"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 22:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="737694336"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="737694336"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Aug 2023 22:36:40 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZlxn-0004OJ-0i;
	Sat, 26 Aug 2023 05:36:08 +0000
Date: Sat, 26 Aug 2023 13:34:54 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Borislav Petkov <bp@suse.de>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.14.y 5224/9999] arch/x86/xen/.tmp_enlighten_pv.o:
 warning: objtool: xen_cpuid()+0x141: can't find jump dest instruction at
 .text+0x1b8
Message-ID: <202308261358.pQjPDKmG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   80b73c056d2076d12f9e50c753bb440fc79f30c9
commit: a59182b3c136838441bf4983f67e423656c78eb4 [5224/9999] objtool: Fix noreturn detection for ignored functions
config: x86_64-randconfig-004-20230823 (https://download.01.org/0day-ci/archive/20230826/202308261358.pQjPDKmG-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261358.pQjPDKmG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261358.pQjPDKmG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/xen/enlighten_pv.c:1218:34: warning: no previous declaration for 'xen_start_kernel' [-Wmissing-declarations]
    asmlinkage __visible void __init xen_start_kernel(void)
                                     ^~~~~~~~~~~~~~~~
>> arch/x86/xen/.tmp_enlighten_pv.o: warning: objtool: xen_cpuid()+0x141: can't find jump dest instruction at .text+0x1b8


objdump-func vmlinux.o xen_cpuid:
0000 000000000003852b <xen_cpuid>:
0000    3852b:	e8 00 00 00 00       	call   38530 <xen_cpuid+0x5>	3852c: R_X86_64_PLT32	__fentry__-0x4
0005    38530:	41 57                	push   %r15
0007    38532:	41 56                	push   %r14
0009    38534:	49 89 d6             	mov    %rdx,%r14
000c    38537:	48 89 fa             	mov    %rdi,%rdx
000f    3853a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0019    38544:	41 55                	push   %r13
001b    38546:	48 c1 ea 03          	shr    $0x3,%rdx
001f    3854a:	41 54                	push   %r12
0021    3854c:	55                   	push   %rbp
0022    3854d:	53                   	push   %rbx
0023    3854e:	8a 14 02             	mov    (%rdx,%rax,1),%dl
0026    38551:	48 89 f8             	mov    %rdi,%rax
0029    38554:	83 e0 07             	and    $0x7,%eax
002c    38557:	49 89 ff             	mov    %rdi,%r15
002f    3855a:	48 89 f5             	mov    %rsi,%rbp
0032    3855d:	83 c0 03             	add    $0x3,%eax
0035    38560:	49 89 cc             	mov    %rcx,%r12
0038    38563:	38 d0                	cmp    %dl,%al
003a    38565:	7c 09                	jl     38570 <xen_cpuid+0x45>
003c    38567:	84 d2                	test   %dl,%dl
003e    38569:	74 05                	je     38570 <xen_cpuid+0x45>
0040    3856b:	e8 00 00 00 00       	call   38570 <xen_cpuid+0x45>	3856c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0045    38570:	41 8b 1f             	mov    (%r15),%ebx
0048    38573:	83 fb 05             	cmp    $0x5,%ebx
004b    38576:	74 37                	je     385af <xen_cpuid+0x84>
004d    38578:	45 31 ed             	xor    %r13d,%r13d
0050    3857b:	4c 89 f2             	mov    %r14,%rdx
0053    3857e:	83 fb 0b             	cmp    $0xb,%ebx
0056    38581:	41 0f 94 c5          	sete   %r13b
005a    38585:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0064    3858f:	48 c1 ea 03          	shr    $0x3,%rdx
0068    38593:	8a 14 02             	mov    (%rdx,%rax,1),%dl
006b    38596:	4c 89 f0             	mov    %r14,%rax
006e    38599:	41 ff cd             	dec    %r13d
0071    3859c:	83 e0 07             	and    $0x7,%eax
0074    3859f:	83 c0 03             	add    $0x3,%eax
0077    385a2:	38 d0                	cmp    %dl,%al
0079    385a4:	0f 8d af 00 00 00    	jge    38659 <xen_cpuid+0x12e>
007f    385aa:	e9 b6 00 00 00       	jmp    38665 <xen_cpuid+0x13a>
0084    385af:	48 89 ea             	mov    %rbp,%rdx
0087    385b2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0091    385bc:	41 c7 07 00 00 00 00 	movl   $0x0,(%r15)
0098    385c3:	48 c1 ea 03          	shr    $0x3,%rdx
009c    385c7:	8a 14 02             	mov    (%rdx,%rax,1),%dl
009f    385ca:	48 89 e8             	mov    %rbp,%rax
00a2    385cd:	83 e0 07             	and    $0x7,%eax
00a5    385d0:	83 c0 03             	add    $0x3,%eax
00a8    385d3:	38 d0                	cmp    %dl,%al
00aa    385d5:	7c 0c                	jl     385e3 <xen_cpuid+0xb8>
00ac    385d7:	84 d2                	test   %dl,%dl
00ae    385d9:	74 08                	je     385e3 <xen_cpuid+0xb8>
00b0    385db:	48 89 ef             	mov    %rbp,%rdi
00b3    385de:	e8 00 00 00 00       	call   385e3 <xen_cpuid+0xb8>	385df: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
00b8    385e3:	4c 89 f2             	mov    %r14,%rdx
00bb    385e6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00c5    385f0:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%rbp)
00cc    385f7:	48 c1 ea 03          	shr    $0x3,%rdx
00d0    385fb:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 38601 <xen_cpuid+0xd6>	385fd: R_X86_64_PC32	.data..read_mostly+0x19d8
00d6    38601:	8a 14 02             	mov    (%rdx,%rax,1),%dl
00d9    38604:	4c 89 f0             	mov    %r14,%rax
00dc    38607:	83 e0 07             	and    $0x7,%eax
00df    3860a:	83 c0 03             	add    $0x3,%eax
00e2    3860d:	38 d0                	cmp    %dl,%al
00e4    3860f:	7c 0c                	jl     3861d <xen_cpuid+0xf2>
00e6    38611:	84 d2                	test   %dl,%dl
00e8    38613:	74 08                	je     3861d <xen_cpuid+0xf2>
00ea    38615:	4c 89 f7             	mov    %r14,%rdi
00ed    38618:	e8 00 00 00 00       	call   3861d <xen_cpuid+0xf2>	38619: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
00f2    3861d:	4c 89 e2             	mov    %r12,%rdx
00f5    38620:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00ff    3862a:	41 89 1e             	mov    %ebx,(%r14)
0102    3862d:	48 c1 ea 03          	shr    $0x3,%rdx
0106    38631:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 38637 <xen_cpuid+0x10c>	38633: R_X86_64_PC32	.data..read_mostly+0x19d4
010c    38637:	8a 14 02             	mov    (%rdx,%rax,1),%dl
010f    3863a:	4c 89 e0             	mov    %r12,%rax
0112    3863d:	83 e0 07             	and    $0x7,%eax
0115    38640:	83 c0 03             	add    $0x3,%eax
0118    38643:	38 d0                	cmp    %dl,%al
011a    38645:	7c 0c                	jl     38653 <xen_cpuid+0x128>
011c    38647:	84 d2                	test   %dl,%dl
011e    38649:	74 08                	je     38653 <xen_cpuid+0x128>
0120    3864b:	4c 89 e7             	mov    %r12,%rdi
0123    3864e:	e8 00 00 00 00       	call   38653 <xen_cpuid+0x128>	3864f: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0128    38653:	41 89 1c 24          	mov    %ebx,(%r12)
012c    38657:	eb 56                	jmp    386af <xen_cpuid+0x184>
012e    38659:	84 d2                	test   %dl,%dl
0130    3865b:	74 08                	je     38665 <xen_cpuid+0x13a>
0132    3865d:	4c 89 f7             	mov    %r14,%rdi
0135    38660:	e8 00 00 00 00       	call   38665 <xen_cpuid+0x13a>	38661: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
013a    38665:	41 8b 0e             	mov    (%r14),%ecx
013d    38668:	89 d8                	mov    %ebx,%eax
013f    3866a:	0f 0b                	ud2
0141    3866c:	78 65                	js     386d3 <xen_get_debugreg+0xb>
0143    3866e:	6e                   	outsb  %ds:(%rsi),(%dx)
0144    3866f:	0f a2                	cpuid
0146    38671:	41 89 07             	mov    %eax,(%r15)
0149    38674:	89 5d 00             	mov    %ebx,0x0(%rbp)
014c    38677:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0156    38681:	41 89 0e             	mov    %ecx,(%r14)
0159    38684:	41 89 14 24          	mov    %edx,(%r12)
015d    38688:	48 89 ea             	mov    %rbp,%rdx
0160    3868b:	48 c1 ea 03          	shr    $0x3,%rdx
0164    3868f:	8a 14 02             	mov    (%rdx,%rax,1),%dl
0167    38692:	48 89 e8             	mov    %rbp,%rax
016a    38695:	83 e0 07             	and    $0x7,%eax
016d    38698:	83 c0 03             	add    $0x3,%eax
0170    3869b:	38 d0                	cmp    %dl,%al
0172    3869d:	7c 0c                	jl     386ab <xen_cpuid+0x180>
0174    3869f:	84 d2                	test   %dl,%dl
0176    386a1:	74 08                	je     386ab <xen_cpuid+0x180>
0178    386a3:	48 89 ef             	mov    %rbp,%rdi
017b    386a6:	e8 00 00 00 00       	call   386ab <xen_cpuid+0x180>	386a7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0180    386ab:	44 21 6d 00          	and    %r13d,0x0(%rbp)
0184    386af:	5b                   	pop    %rbx
0185    386b0:	5d                   	pop    %rbp
0186    386b1:	41 5c                	pop    %r12
0188    386b3:	41 5d                	pop    %r13
018a    386b5:	41 5e                	pop    %r14
018c    386b7:	41 5f                	pop    %r15
018e    386b9:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
