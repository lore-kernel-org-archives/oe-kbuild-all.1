Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133E7322B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 13:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681132295; x=1712668295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KI1MnPlkl3UajD08q6QESPFK6q51pNysLbMHlEGz3FU=;
  b=WYOSHJ+IwTQ+uxIKdWoEL1N9xLS8qLqrhiPRlUCJWGY45CBnz8Fgnwj/
   lkosjIe/gIvquaYs32WxYuZWdESxO99iQT7dij4aXSvMdEKFpC2ugfD3+
   f7MTpv/CyludPaKorfCvmbStJ22Me1CrJk37wN2O74LhhnqfOQOWP4OUb
   8HGXLsBFX4p+XfOhxcZrQpOGxlM6U/xPEnUUbXlFGiQkDYjiKux0+fnA2
   XXLuyEPQ4up0I8SqRibTl/eNcuRkGE/YA1RcgxAuMUwoNlsvg6R/2D0Ds
   UfvEPLb1pgjoqzj8c+ZrL3fY94sFslkDph8gqY/CNOHUCSo4DsFiYz3wI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="340837428"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="340837428"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 06:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="665613890"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="665613890"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Apr 2023 06:11:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plrIq-000VO9-2h;
	Mon, 10 Apr 2023 13:11:24 +0000
Date: Mon, 10 Apr 2023 21:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Borislav Petkov <bp@suse.de>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.14.y 5224/9999] arch/x86/xen/.tmp_enlighten_pv.o:
 warning: objtool: xen_cpuid()+0x15b: can't find jump dest instruction at
 .text+0x1f2
Message-ID: <202304102134.trCabOnZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   f03c8bbaf6d9cbebee390e8353c5df75293aff7c
commit: a59182b3c136838441bf4983f67e423656c78eb4 [5224/9999] objtool: Fix noreturn detection for ignored functions
config: x86_64-randconfig-r026-20230410 (https://download.01.org/0day-ci/archive/20230410/202304102134.trCabOnZ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=a59182b3c136838441bf4983f67e423656c78eb4
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.14.y
        git checkout a59182b3c136838441bf4983f67e423656c78eb4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304102134.trCabOnZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/xen/enlighten_pv.c:1218:34: warning: no previous declaration for 'xen_start_kernel' [-Wmissing-declarations]
    asmlinkage __visible void __init xen_start_kernel(void)
                                     ^~~~~~~~~~~~~~~~
>> arch/x86/xen/.tmp_enlighten_pv.o: warning: objtool: xen_cpuid()+0x15b: can't find jump dest instruction at .text+0x1f2


objdump-func vmlinux.o xen_cpuid:
0000 000000000001b710 <xen_cpuid>:
0000    1b710:	e8 00 00 00 00       	call   1b715 <xen_cpuid+0x5>	1b711: R_X86_64_PLT32	__fentry__-0x4
0005    1b715:	41 57                	push   %r15
0007    1b717:	41 56                	push   %r14
0009    1b719:	49 89 d6             	mov    %rdx,%r14
000c    1b71c:	41 55                	push   %r13
000e    1b71e:	41 54                	push   %r12
0010    1b720:	49 89 fd             	mov    %rdi,%r13
0013    1b723:	55                   	push   %rbp
0014    1b724:	53                   	push   %rbx
0015    1b725:	48 89 f5             	mov    %rsi,%rbp
0018    1b728:	49 89 cc             	mov    %rcx,%r12
001b    1b72b:	e8 00 00 00 00       	call   1b730 <xen_cpuid+0x20>	1b72c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0020    1b730:	4c 89 ea             	mov    %r13,%rdx
0023    1b733:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
002d    1b73d:	48 c1 ea 03          	shr    $0x3,%rdx
0031    1b741:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0035    1b745:	4c 89 e8             	mov    %r13,%rax
0038    1b748:	83 e0 07             	and    $0x7,%eax
003b    1b74b:	83 c0 03             	add    $0x3,%eax
003e    1b74e:	38 d0                	cmp    %dl,%al
0040    1b750:	7c 0c                	jl     1b75e <xen_cpuid+0x4e>
0042    1b752:	84 d2                	test   %dl,%dl
0044    1b754:	74 08                	je     1b75e <xen_cpuid+0x4e>
0046    1b756:	4c 89 ef             	mov    %r13,%rdi
0049    1b759:	e8 00 00 00 00       	call   1b75e <xen_cpuid+0x4e>	1b75a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
004e    1b75e:	41 8b 5d 00          	mov    0x0(%r13),%ebx
0052    1b762:	83 fb 05             	cmp    $0x5,%ebx
0055    1b765:	74 3e                	je     1b7a5 <xen_cpuid+0x95>
0057    1b767:	45 31 ff             	xor    %r15d,%r15d
005a    1b76a:	83 fb 0b             	cmp    $0xb,%ebx
005d    1b76d:	41 0f 94 c7          	sete   %r15b
0061    1b771:	e8 00 00 00 00       	call   1b776 <xen_cpuid+0x66>	1b772: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0066    1b776:	4c 89 f2             	mov    %r14,%rdx
0069    1b779:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0073    1b783:	41 83 ef 01          	sub    $0x1,%r15d
0077    1b787:	48 c1 ea 03          	shr    $0x3,%rdx
007b    1b78b:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
007f    1b78f:	4c 89 f0             	mov    %r14,%rax
0082    1b792:	83 e0 07             	and    $0x7,%eax
0085    1b795:	83 c0 03             	add    $0x3,%eax
0088    1b798:	38 d0                	cmp    %dl,%al
008a    1b79a:	0f 8d b8 00 00 00    	jge    1b858 <xen_cpuid+0x148>
0090    1b7a0:	e9 bf 00 00 00       	jmp    1b864 <xen_cpuid+0x154>
0095    1b7a5:	e8 00 00 00 00       	call   1b7aa <xen_cpuid+0x9a>	1b7a6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
009a    1b7aa:	48 89 ea             	mov    %rbp,%rdx
009d    1b7ad:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00a7    1b7b7:	41 c7 45 00 00 00 00 00 	movl   $0x0,0x0(%r13)
00af    1b7bf:	48 c1 ea 03          	shr    $0x3,%rdx
00b3    1b7c3:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
00b7    1b7c7:	48 89 e8             	mov    %rbp,%rax
00ba    1b7ca:	83 e0 07             	and    $0x7,%eax
00bd    1b7cd:	83 c0 03             	add    $0x3,%eax
00c0    1b7d0:	38 d0                	cmp    %dl,%al
00c2    1b7d2:	7c 0c                	jl     1b7e0 <xen_cpuid+0xd0>
00c4    1b7d4:	84 d2                	test   %dl,%dl
00c6    1b7d6:	74 08                	je     1b7e0 <xen_cpuid+0xd0>
00c8    1b7d8:	48 89 ef             	mov    %rbp,%rdi
00cb    1b7db:	e8 00 00 00 00       	call   1b7e0 <xen_cpuid+0xd0>	1b7dc: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
00d0    1b7e0:	4c 89 f2             	mov    %r14,%rdx
00d3    1b7e3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00dd    1b7ed:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%rbp)
00e4    1b7f4:	48 c1 ea 03          	shr    $0x3,%rdx
00e8    1b7f8:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 1b7fe <xen_cpuid+0xee>	1b7fa: R_X86_64_PC32	.data..read_mostly+0x618
00ee    1b7fe:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
00f2    1b802:	4c 89 f0             	mov    %r14,%rax
00f5    1b805:	83 e0 07             	and    $0x7,%eax
00f8    1b808:	83 c0 03             	add    $0x3,%eax
00fb    1b80b:	38 d0                	cmp    %dl,%al
00fd    1b80d:	7c 0c                	jl     1b81b <xen_cpuid+0x10b>
00ff    1b80f:	84 d2                	test   %dl,%dl
0101    1b811:	74 08                	je     1b81b <xen_cpuid+0x10b>
0103    1b813:	4c 89 f7             	mov    %r14,%rdi
0106    1b816:	e8 00 00 00 00       	call   1b81b <xen_cpuid+0x10b>	1b817: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
010b    1b81b:	4c 89 e2             	mov    %r12,%rdx
010e    1b81e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0118    1b828:	41 89 1e             	mov    %ebx,(%r14)
011b    1b82b:	48 c1 ea 03          	shr    $0x3,%rdx
011f    1b82f:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 1b835 <xen_cpuid+0x125>	1b831: R_X86_64_PC32	.data..read_mostly+0x614
0125    1b835:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0129    1b839:	4c 89 e0             	mov    %r12,%rax
012c    1b83c:	83 e0 07             	and    $0x7,%eax
012f    1b83f:	83 c0 03             	add    $0x3,%eax
0132    1b842:	38 d0                	cmp    %dl,%al
0134    1b844:	7c 0c                	jl     1b852 <xen_cpuid+0x142>
0136    1b846:	84 d2                	test   %dl,%dl
0138    1b848:	74 08                	je     1b852 <xen_cpuid+0x142>
013a    1b84a:	4c 89 e7             	mov    %r12,%rdi
013d    1b84d:	e8 00 00 00 00       	call   1b852 <xen_cpuid+0x142>	1b84e: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0142    1b852:	41 89 1c 24          	mov    %ebx,(%r12)
0146    1b856:	eb 58                	jmp    1b8b0 <xen_cpuid+0x1a0>
0148    1b858:	84 d2                	test   %dl,%dl
014a    1b85a:	74 08                	je     1b864 <xen_cpuid+0x154>
014c    1b85c:	4c 89 f7             	mov    %r14,%rdi
014f    1b85f:	e8 00 00 00 00       	call   1b864 <xen_cpuid+0x154>	1b860: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0154    1b864:	41 8b 0e             	mov    (%r14),%ecx
0157    1b867:	89 d8                	mov    %ebx,%eax
0159    1b869:	0f 0b                	ud2
015b    1b86b:	78 65                	js     1b8d2 <xen_set_debugreg+0x12>
015d    1b86d:	6e                   	outsb  %ds:(%rsi),(%dx)
015e    1b86e:	0f a2                	cpuid
0160    1b870:	41 89 45 00          	mov    %eax,0x0(%r13)
0164    1b874:	89 5d 00             	mov    %ebx,0x0(%rbp)
0167    1b877:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0171    1b881:	41 89 0e             	mov    %ecx,(%r14)
0174    1b884:	41 89 14 24          	mov    %edx,(%r12)
0178    1b888:	48 89 ea             	mov    %rbp,%rdx
017b    1b88b:	48 c1 ea 03          	shr    $0x3,%rdx
017f    1b88f:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0183    1b893:	48 89 e8             	mov    %rbp,%rax
0186    1b896:	83 e0 07             	and    $0x7,%eax
0189    1b899:	83 c0 03             	add    $0x3,%eax
018c    1b89c:	38 d0                	cmp    %dl,%al
018e    1b89e:	7c 0c                	jl     1b8ac <xen_cpuid+0x19c>
0190    1b8a0:	84 d2                	test   %dl,%dl
0192    1b8a2:	74 08                	je     1b8ac <xen_cpuid+0x19c>
0194    1b8a4:	48 89 ef             	mov    %rbp,%rdi
0197    1b8a7:	e8 00 00 00 00       	call   1b8ac <xen_cpuid+0x19c>	1b8a8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
019c    1b8ac:	44 21 7d 00          	and    %r15d,0x0(%rbp)
01a0    1b8b0:	5b                   	pop    %rbx
01a1    1b8b1:	5d                   	pop    %rbp
01a2    1b8b2:	41 5c                	pop    %r12
01a4    1b8b4:	41 5d                	pop    %r13
01a6    1b8b6:	41 5e                	pop    %r14
01a8    1b8b8:	41 5f                	pop    %r15
01aa    1b8ba:	e9 00 00 00 00       	jmp    1b8bf <xen_cpuid+0x1af>	1b8bb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01af    1b8bf:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
