Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC1B17AD5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692982325; x=1724518325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jX1oJ1FlX6SS8kddymQvu+dexFUGwcNfQBxLEWimzmE=;
  b=VaeyXkSLMBcNa4icV7W0dmylqOYGps5giAnqr7KT3XNJHQKtEnNUKQb3
   MyReYPTXW+eRT+v/MEKC3Sy9r3QSxgQdptQOfjNM99Gg6u2wz06L4DTtw
   QU+HyM/mJ6npm1g0M4Bt7x+Tj1h/e8CCekJBqvMWznpAQ+x64ZJFcT8mn
   y9Sar80tcCKq1HnaRyDG4t6wN1ihlhRa0tzlU/5S0kkGgnc0a/EQ9/Pig
   SLtuyQ/SuocjGD6rjgpeBSkwhuWrdxc7TxuSVHA8aCj56j+aObonQ55AU
   Q3wlZM1JPKoynzjzi2lppCNdqyD0l5wnLXtPkhZyVe+YsIiogafGoF7x7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="372152703"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="372152703"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 09:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="737544935"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="737544935"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Aug 2023 09:52:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZa2L-0003oj-0f;
	Fri, 25 Aug 2023 16:51:54 +0000
Date: Sat, 26 Aug 2023 00:51:08 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Borislav Petkov <bp@suse.de>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.14.y 5224/9999] arch/x86/xen/enlighten_pv.o:
 warning: objtool: xen_cpuid()+0x8e: can't find jump dest instruction at
 .text+0x115
Message-ID: <202308260025.COk9J9pu-lkp@intel.com>
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
config: x86_64-randconfig-013-20230824 (https://download.01.org/0day-ci/archive/20230826/202308260025.COk9J9pu-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260025.COk9J9pu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260025.COk9J9pu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/xen/enlighten_pv.c:1218:34: warning: no previous declaration for 'xen_start_kernel' [-Wmissing-declarations]
    asmlinkage __visible void __init xen_start_kernel(void)
                                     ^~~~~~~~~~~~~~~~
>> arch/x86/xen/enlighten_pv.o: warning: objtool: xen_cpuid()+0x8e: can't find jump dest instruction at .text+0x115


objdump-func vmlinux.o xen_cpuid:
0000 0000000000056730 <xen_cpuid>:
0000    56730:	e8 00 00 00 00       	call   56735 <xen_cpuid+0x5>	56731: R_X86_64_PLT32	__fentry__-0x4
0005    56735:	41 56                	push   %r14
0007    56737:	41 55                	push   %r13
0009    56739:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0013    56743:	41 54                	push   %r12
0015    56745:	49 89 d4             	mov    %rdx,%r12
0018    56748:	55                   	push   %rbp
0019    56749:	48 89 fa             	mov    %rdi,%rdx
001c    5674c:	53                   	push   %rbx
001d    5674d:	48 89 fd             	mov    %rdi,%rbp
0020    56750:	48 c1 ea 03          	shr    $0x3,%rdx
0024    56754:	49 89 cd             	mov    %rcx,%r13
0027    56757:	48 83 ec 10          	sub    $0x10,%rsp
002b    5675b:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
002f    5675f:	48 89 f8             	mov    %rdi,%rax
0032    56762:	83 e0 07             	and    $0x7,%eax
0035    56765:	83 c0 03             	add    $0x3,%eax
0038    56768:	38 d0                	cmp    %dl,%al
003a    5676a:	7c 08                	jl     56774 <xen_cpuid+0x44>
003c    5676c:	84 d2                	test   %dl,%dl
003e    5676e:	0f 85 3e 01 00 00    	jne    568b2 <xen_cpuid+0x182>
0044    56774:	8b 45 00             	mov    0x0(%rbp),%eax
0047    56777:	83 f8 05             	cmp    $0x5,%eax
004a    5677a:	0f 84 8a 00 00 00    	je     5680a <xen_cpuid+0xda>
0050    56780:	45 31 f6             	xor    %r14d,%r14d
0053    56783:	4c 89 e1             	mov    %r12,%rcx
0056    56786:	83 f8 0b             	cmp    $0xb,%eax
0059    56789:	41 0f 94 c6          	sete   %r14b
005d    5678d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0067    56797:	48 c1 e9 03          	shr    $0x3,%rcx
006b    5679b:	0f b6 0c 11          	movzbl (%rcx,%rdx,1),%ecx
006f    5679f:	4c 89 e2             	mov    %r12,%rdx
0072    567a2:	41 83 ee 01          	sub    $0x1,%r14d
0076    567a6:	83 e2 07             	and    $0x7,%edx
0079    567a9:	83 c2 03             	add    $0x3,%edx
007c    567ac:	38 ca                	cmp    %cl,%dl
007e    567ae:	7c 08                	jl     567b8 <xen_cpuid+0x88>
0080    567b0:	84 c9                	test   %cl,%cl
0082    567b2:	0f 85 0c 01 00 00    	jne    568c4 <xen_cpuid+0x194>
0088    567b8:	41 8b 0c 24          	mov    (%r12),%ecx
008c    567bc:	0f 0b                	ud2
008e    567be:	78 65                	js     56825 <xen_cpuid+0xf5>
0090    567c0:	6e                   	outsb  %ds:(%rsi),(%dx)
0091    567c1:	0f a2                	cpuid
0093    567c3:	89 45 00             	mov    %eax,0x0(%rbp)
0096    567c6:	89 1e                	mov    %ebx,(%rsi)
0098    567c8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00a2    567d2:	41 89 0c 24          	mov    %ecx,(%r12)
00a6    567d6:	41 89 55 00          	mov    %edx,0x0(%r13)
00aa    567da:	48 89 f2             	mov    %rsi,%rdx
00ad    567dd:	48 c1 ea 03          	shr    $0x3,%rdx
00b1    567e1:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
00b5    567e5:	48 89 f0             	mov    %rsi,%rax
00b8    567e8:	83 e0 07             	and    $0x7,%eax
00bb    567eb:	83 c0 03             	add    $0x3,%eax
00be    567ee:	38 d0                	cmp    %dl,%al
00c0    567f0:	7c 08                	jl     567fa <xen_cpuid+0xca>
00c2    567f2:	84 d2                	test   %dl,%dl
00c4    567f4:	0f 85 e7 00 00 00    	jne    568e1 <xen_cpuid+0x1b1>
00ca    567fa:	44 21 36             	and    %r14d,(%rsi)
00cd    567fd:	48 83 c4 10          	add    $0x10,%rsp
00d1    56801:	5b                   	pop    %rbx
00d2    56802:	5d                   	pop    %rbp
00d3    56803:	41 5c                	pop    %r12
00d5    56805:	41 5d                	pop    %r13
00d7    56807:	41 5e                	pop    %r14
00d9    56809:	c3                   	ret
00da    5680a:	48 89 f2             	mov    %rsi,%rdx
00dd    5680d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00e7    56817:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%rbp)
00ee    5681e:	48 c1 ea 03          	shr    $0x3,%rdx
00f2    56822:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
00f6    56826:	48 89 f0             	mov    %rsi,%rax
00f9    56829:	83 e0 07             	and    $0x7,%eax
00fc    5682c:	83 c0 03             	add    $0x3,%eax
00ff    5682f:	38 d0                	cmp    %dl,%al
0101    56831:	7c 08                	jl     5683b <xen_cpuid+0x10b>
0103    56833:	84 d2                	test   %dl,%dl
0105    56835:	0f 85 bb 00 00 00    	jne    568f6 <xen_cpuid+0x1c6>
010b    5683b:	4c 89 e2             	mov    %r12,%rdx
010e    5683e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0118    56848:	c7 06 00 00 00 00    	movl   $0x0,(%rsi)
011e    5684e:	48 c1 ea 03          	shr    $0x3,%rdx
0122    56852:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 56858 <xen_cpuid+0x128>	56854: R_X86_64_PC32	.data..read_mostly+0x19d8
0128    56858:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
012c    5685c:	4c 89 e0             	mov    %r12,%rax
012f    5685f:	83 e0 07             	and    $0x7,%eax
0132    56862:	83 c0 03             	add    $0x3,%eax
0135    56865:	38 d0                	cmp    %dl,%al
0137    56867:	7c 08                	jl     56871 <xen_cpuid+0x141>
0139    56869:	84 d2                	test   %dl,%dl
013b    5686b:	0f 85 9a 00 00 00    	jne    5690b <xen_cpuid+0x1db>
0141    56871:	4c 89 ea             	mov    %r13,%rdx
0144    56874:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
014e    5687e:	41 89 1c 24          	mov    %ebx,(%r12)
0152    56882:	48 c1 ea 03          	shr    $0x3,%rdx
0156    56886:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 5688c <xen_cpuid+0x15c>	56888: R_X86_64_PC32	.data..read_mostly+0x19d4
015c    5688c:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0160    56890:	4c 89 e8             	mov    %r13,%rax
0163    56893:	83 e0 07             	and    $0x7,%eax
0166    56896:	83 c0 03             	add    $0x3,%eax
0169    56899:	38 d0                	cmp    %dl,%al
016b    5689b:	7c 04                	jl     568a1 <xen_cpuid+0x171>
016d    5689d:	84 d2                	test   %dl,%dl
016f    5689f:	75 77                	jne    56918 <xen_cpuid+0x1e8>
0171    568a1:	41 89 5d 00          	mov    %ebx,0x0(%r13)
0175    568a5:	48 83 c4 10          	add    $0x10,%rsp
0179    568a9:	5b                   	pop    %rbx
017a    568aa:	5d                   	pop    %rbp
017b    568ab:	41 5c                	pop    %r12
017d    568ad:	41 5d                	pop    %r13
017f    568af:	41 5e                	pop    %r14
0181    568b1:	c3                   	ret
0182    568b2:	48 89 34 24          	mov    %rsi,(%rsp)
0186    568b6:	e8 00 00 00 00       	call   568bb <xen_cpuid+0x18b>	568b7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
018b    568bb:	48 8b 34 24          	mov    (%rsp),%rsi
018f    568bf:	e9 b0 fe ff ff       	jmp    56774 <xen_cpuid+0x44>
0194    568c4:	4c 89 e7             	mov    %r12,%rdi
0197    568c7:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
019c    568cc:	89 04 24             	mov    %eax,(%rsp)
019f    568cf:	e8 00 00 00 00       	call   568d4 <xen_cpuid+0x1a4>	568d0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
01a4    568d4:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
01a9    568d9:	8b 04 24             	mov    (%rsp),%eax
01ac    568dc:	e9 d7 fe ff ff       	jmp    567b8 <xen_cpuid+0x88>
01b1    568e1:	48 89 f7             	mov    %rsi,%rdi
01b4    568e4:	48 89 34 24          	mov    %rsi,(%rsp)
01b8    568e8:	e8 00 00 00 00       	call   568ed <xen_cpuid+0x1bd>	568e9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
01bd    568ed:	48 8b 34 24          	mov    (%rsp),%rsi
01c1    568f1:	e9 04 ff ff ff       	jmp    567fa <xen_cpuid+0xca>
01c6    568f6:	48 89 f7             	mov    %rsi,%rdi
01c9    568f9:	48 89 34 24          	mov    %rsi,(%rsp)
01cd    568fd:	e8 00 00 00 00       	call   56902 <xen_cpuid+0x1d2>	568fe: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
01d2    56902:	48 8b 34 24          	mov    (%rsp),%rsi
01d6    56906:	e9 30 ff ff ff       	jmp    5683b <xen_cpuid+0x10b>
01db    5690b:	4c 89 e7             	mov    %r12,%rdi
01de    5690e:	e8 00 00 00 00       	call   56913 <xen_cpuid+0x1e3>	5690f: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
01e3    56913:	e9 59 ff ff ff       	jmp    56871 <xen_cpuid+0x141>
01e8    56918:	4c 89 ef             	mov    %r13,%rdi
01eb    5691b:	e8 00 00 00 00       	call   56920 <xen_cpuid+0x1f0>	5691c: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
01f0    56920:	e9 7c ff ff ff       	jmp    568a1 <xen_cpuid+0x171>
01f5    56925:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
