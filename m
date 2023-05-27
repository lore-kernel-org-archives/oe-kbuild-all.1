Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EE1644
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 06:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685168546; x=1716704546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xp3EuyTmreMf1ufiCTD41AwSzV3UCmZJyId5Unsdmrs=;
  b=dJzrd08A+LSBQD6mjQ++96tTTR5xH3vtDkZX46+wPqAz+cVB487kdNa3
   m5plLqwg501CVQM9HFFblRKL2wyc/t+JuOEbaZeU9I2mR40Fv74YhqZu3
   Z5mCnkQccTg5KStnBWwYpb84LxmZpiMd1TVwxZe7gr+6NIOM0UYK6oi8T
   9TnEBGcs2kRqJf9TEgsFaFwvtRg5IsrSVO/UtvtuTJUIVukIxj/80+0ON
   VO39k7IFogf1NY2Bd/UUmRWd4tAB34DG8aflci4MhhZnM6dBeYWjd6/sp
   0c98ljFZplhi/0IElgq29v285cwSeNRSs1BKIRZ71k4IMC8Rb0wwKSuHi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="354383193"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="354383193"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 23:22:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="708628451"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="708628451"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 May 2023 23:21:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2nJK-000JoQ-1E;
	Sat, 27 May 2023 06:21:54 +0000
Date: Sat, 27 May 2023 14:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diet 28/34] kernel/bpf/core.o: warning: objtool:
 ___bpf_prog_run+0x7f: can't find switch jump table
Message-ID: <202305271415.1dW5flaz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diet
head:   1fb92a891c743ef5c818c251189f5be7af66fbf9
commit: c1b7445d6401048b2db2bf927f192c316ce304fb [28/34] objtool: Get rid of reloc->jump_table_start
config: x86_64-randconfig-a002-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271415.1dW5flaz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=c1b7445d6401048b2db2bf927f192c316ce304fb
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-diet
        git checkout c1b7445d6401048b2db2bf927f192c316ce304fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271415.1dW5flaz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c:1638:12: warning: no previous prototype for 'bpf_probe_read_kernel' [-Wmissing-prototypes]
    1638 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
         |            ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:2075:6: warning: no previous prototype for 'bpf_patch_call_args' [-Wmissing-prototypes]
    2075 | void bpf_patch_call_args(struct bpf_insn *insn, u32 stack_depth)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/bpf/core.o: warning: objtool: ___bpf_prog_run+0x7f: can't find switch jump table


objdump-func vmlinux.o ___bpf_prog_run:
0000 00000000005275f0 <___bpf_prog_run>:
0000   5275f0:	55                   	push   %rbp
0001   5275f1:	48 8d 47 10          	lea    0x10(%rdi),%rax
0005   5275f5:	48 89 e5             	mov    %rsp,%rbp
0008   5275f8:	41 57                	push   %r15
000a   5275fa:	41 56                	push   %r14
000c   5275fc:	49 89 fe             	mov    %rdi,%r14
000f   5275ff:	41 55                	push   %r13
0011   527601:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
001b   52760b:	41 54                	push   %r12
001d   52760d:	49 89 c4             	mov    %rax,%r12
0020   527610:	53                   	push   %rbx
0021   527611:	49 c1 ec 03          	shr    $0x3,%r12
0025   527615:	48 89 f3             	mov    %rsi,%rbx
0028   527618:	4d 01 ec             	add    %r13,%r12
002b   52761b:	48 83 ec 38          	sub    $0x38,%rsp
002f   52761f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
0036   527626:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
003a   52762a:	48 89 d8             	mov    %rbx,%rax
003d   52762d:	48 89 da             	mov    %rbx,%rdx
0040   527630:	48 c1 e8 03          	shr    $0x3,%rax
0044   527634:	83 e2 07             	and    $0x7,%edx
0047   527637:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
004c   52763c:	38 d0                	cmp    %dl,%al
004e   52763e:	7f 08                	jg     527648 <___bpf_prog_run+0x58>
0050   527640:	84 c0                	test   %al,%al
0052   527642:	0f 85 73 56 00 00    	jne    52ccbb <___bpf_prog_run+0x56cb>
0058   527648:	44 0f b6 3b          	movzbl (%rbx),%r15d
005c   52764c:	49 63 d7             	movslq %r15d,%rdx
005f   52764f:	44 89 f8             	mov    %r15d,%eax
0062   527652:	48 8d 3c d5 00 00 00 00 	lea    0x0(,%rdx,8),%rdi	527656: R_X86_64_32S	.rodata..c_jump_table
006a   52765a:	48 89 fa             	mov    %rdi,%rdx
006d   52765d:	48 c1 ea 03          	shr    $0x3,%rdx
0071   527661:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0076   527666:	0f 85 38 56 00 00    	jne    52cca4 <___bpf_prog_run+0x56b4>
007c   52766c:	49 63 d7             	movslq %r15d,%rdx
007f   52766f:	ff 24 d5 00 00 00 00 	jmp    *0x0(,%rdx,8)	527672: R_X86_64_32S	.rodata..c_jump_table
0086   527676:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
008a   52767a:	48 89 fa             	mov    %rdi,%rdx
008d   52767d:	48 c1 ea 03          	shr    $0x3,%rdx
0091   527681:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
0096   527686:	48 89 fa             	mov    %rdi,%rdx
0099   527689:	83 e2 07             	and    $0x7,%edx
009c   52768c:	83 c2 03             	add    $0x3,%edx
009f   52768f:	38 ca                	cmp    %cl,%dl
00a1   527691:	7c 08                	jl     52769b <___bpf_prog_run+0xab>
00a3   527693:	84 c9                	test   %cl,%cl
00a5   527695:	0f 85 57 6b 00 00    	jne    52e1f2 <___bpf_prog_run+0x6c02>
00ab   52769b:	8b 53 04             	mov    0x4(%rbx),%edx
00ae   52769e:	83 fa 51             	cmp    $0x51,%edx
00b1   5276a1:	0f 84 bf 50 00 00    	je     52c766 <___bpf_prog_run+0x5176>
00b7   5276a7:	0f 8f 29 47 00 00    	jg     52bdd6 <___bpf_prog_run+0x47e6>
00bd   5276ad:	83 fa 40             	cmp    $0x40,%edx
00c0   5276b0:	0f 84 08 52 00 00    	je     52c8be <___bpf_prog_run+0x52ce>
00c6   5276b6:	0f 8e 53 46 00 00    	jle    52bd0f <___bpf_prog_run+0x471f>
00cc   5276bc:	83 fa 41             	cmp    $0x41,%edx
00cf   5276bf:	0f 85 82 45 00 00    	jne    52bc47 <___bpf_prog_run+0x4657>
00d5   5276c5:	83 e0 18             	and    $0x18,%eax
00d8   5276c8:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
00dc   5276cc:	88 45 b8             	mov    %al,-0x48(%rbp)
00df   5276cf:	4c 89 f8             	mov    %r15,%rax
00e2   5276d2:	4c 89 fa             	mov    %r15,%rdx
00e5   5276d5:	48 c1 e8 03          	shr    $0x3,%rax
00e9   5276d9:	83 e2 07             	and    $0x7,%edx
00ec   5276dc:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
00f1   5276e1:	38 d0                	cmp    %dl,%al
00f3   5276e3:	7f 08                	jg     5276ed <___bpf_prog_run+0xfd>
00f5   5276e5:	84 c0                	test   %al,%al
00f7   5276e7:	0f 85 82 56 00 00    	jne    52cd6f <___bpf_prog_run+0x577f>
00fd   5276ed:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0101   5276f1:	c0 e8 04             	shr    $0x4,%al
0104   5276f4:	0f b6 c0             	movzbl %al,%eax
0107   5276f7:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
010b   5276fb:	48 89 c2             	mov    %rax,%rdx
010e   5276fe:	48 c1 ea 03          	shr    $0x3,%rdx
0112   527702:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0117   527707:	0f 85 b5 57 00 00    	jne    52cec2 <___bpf_prog_run+0x58d2>
011d   52770d:	48 8b 00             	mov    (%rax),%rax
0120   527710:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
0124   527714:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0128   527718:	83 e0 0f             	and    $0xf,%eax
012b   52771b:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
012f   52771f:	48 89 c2             	mov    %rax,%rdx
0132   527722:	48 c1 ea 03          	shr    $0x3,%rdx
0136   527726:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
013b   52772b:	0f 85 7c 57 00 00    	jne    52cead <___bpf_prog_run+0x58bd>
0141   527731:	48 8b 00             	mov    (%rax),%rax
0144   527734:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0148   527738:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
014c   52773c:	48 89 f8             	mov    %rdi,%rax
014f   52773f:	48 c1 e8 03          	shr    $0x3,%rax
0153   527743:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0158   527748:	48 89 f8             	mov    %rdi,%rax
015b   52774b:	83 e0 07             	and    $0x7,%eax
015e   52774e:	83 c0 01             	add    $0x1,%eax
0161   527751:	38 d0                	cmp    %dl,%al
0163   527753:	7c 08                	jl     52775d <___bpf_prog_run+0x16d>
0165   527755:	84 d2                	test   %dl,%dl
0167   527757:	0f 85 c8 57 00 00    	jne    52cf25 <___bpf_prog_run+0x5935>
016d   52775d:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
0172   527762:	48 03 55 b0          	add    -0x50(%rbp),%rdx
0176   527766:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
017a   52776a:	0f 85 0d 52 00 00    	jne    52c97d <___bpf_prog_run+0x538d>
0180   527770:	48 89 d7             	mov    %rdx,%rdi
0183   527773:	be 04 00 00 00       	mov    $0x4,%esi
0188   527778:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
018c   52777c:	e8 00 00 00 00       	call   527781 <___bpf_prog_run+0x191>	52777d: R_X86_64_PLT32	__kasan_check_write-0x4
0191   527781:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
0195   527785:	48 89 d0             	mov    %rdx,%rax
0198   527788:	48 c1 e8 03          	shr    $0x3,%rax
019c   52778c:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
01a1   527791:	48 89 d0             	mov    %rdx,%rax
01a4   527794:	83 e0 07             	and    $0x7,%eax
01a7   527797:	83 c0 03             	add    $0x3,%eax
01aa   52779a:	38 c8                	cmp    %cl,%al
01ac   52779c:	7c 10                	jl     5277ae <___bpf_prog_run+0x1be>
01ae   52779e:	84 c9                	test   %cl,%cl
01b0   5277a0:	74 0c                	je     5277ae <___bpf_prog_run+0x1be>
01b2   5277a2:	48 89 d7             	mov    %rdx,%rdi
01b5   5277a5:	e8 00 00 00 00       	call   5277aa <___bpf_prog_run+0x1ba>	5277a6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
01ba   5277aa:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
01be   5277ae:	8b 02                	mov    (%rdx),%eax
01c0   5277b0:	8b 75 c0             	mov    -0x40(%rbp),%esi
01c3   5277b3:	89 c1                	mov    %eax,%ecx
01c5   5277b5:	09 c6                	or     %eax,%esi
01c7   5277b7:	f0 0f b1 32          	lock cmpxchg %esi,(%rdx)
01cb   5277bb:	75 f3                	jne    5277b0 <___bpf_prog_run+0x1c0>
01cd   5277bd:	4c 89 f8             	mov    %r15,%rax
01d0   5277c0:	4c 89 fa             	mov    %r15,%rdx
01d3   5277c3:	48 c1 e8 03          	shr    $0x3,%rax
01d7   5277c7:	83 e2 07             	and    $0x7,%edx
01da   5277ca:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
01df   5277cf:	38 d0                	cmp    %dl,%al
01e1   5277d1:	7f 12                	jg     5277e5 <___bpf_prog_run+0x1f5>
01e3   5277d3:	84 c0                	test   %al,%al
01e5   5277d5:	74 0e                	je     5277e5 <___bpf_prog_run+0x1f5>
01e7   5277d7:	4c 89 ff             	mov    %r15,%rdi
01ea   5277da:	89 4d c0             	mov    %ecx,-0x40(%rbp)
01ed   5277dd:	e8 00 00 00 00       	call   5277e2 <___bpf_prog_run+0x1f2>	5277de: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
01f2   5277e2:	8b 4d c0             	mov    -0x40(%rbp),%ecx
01f5   5277e5:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
01f9   5277e9:	41 89 cf             	mov    %ecx,%r15d
01fc   5277ec:	c0 e8 04             	shr    $0x4,%al
01ff   5277ef:	0f b6 c0             	movzbl %al,%eax
0202   5277f2:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0206   5277f6:	48 89 c2             	mov    %rax,%rdx
0209   5277f9:	48 c1 ea 03          	shr    $0x3,%rdx
020d   5277fd:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0212   527802:	0f 84 21 4a 00 00    	je     52c229 <___bpf_prog_run+0x4c39>
0218   527808:	48 89 c7             	mov    %rax,%rdi
021b   52780b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
021f   52780f:	e8 00 00 00 00       	call   527814 <___bpf_prog_run+0x224>	527810: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0224   527814:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0228   527818:	e9 0c 4a 00 00       	jmp    52c229 <___bpf_prog_run+0x4c39>
022d   52781d:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0231   527821:	48 89 f8             	mov    %rdi,%rax
0234   527824:	48 89 fa             	mov    %rdi,%rdx
0237   527827:	48 c1 e8 03          	shr    $0x3,%rax
023b   52782b:	83 e2 07             	and    $0x7,%edx
023e   52782e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0243   527833:	38 d0                	cmp    %dl,%al
0245   527835:	7f 08                	jg     52783f <___bpf_prog_run+0x24f>
0247   527837:	84 c0                	test   %al,%al
0249   527839:	0f 85 9e 64 00 00    	jne    52dcdd <___bpf_prog_run+0x66ed>
024f   52783f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0253   527843:	c0 e8 04             	shr    $0x4,%al
0256   527846:	0f b6 c0             	movzbl %al,%eax
0259   527849:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
025d   52784d:	4c 89 f8             	mov    %r15,%rax
0260   527850:	48 c1 e8 03          	shr    $0x3,%rax
0264   527854:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0269   527859:	0f 85 22 71 00 00    	jne    52e981 <___bpf_prog_run+0x7391>
026f   52785f:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0273   527863:	49 8b 0f             	mov    (%r15),%rcx
0276   527866:	48 89 f8             	mov    %rdi,%rax
0279   527869:	48 c1 e8 03          	shr    $0x3,%rax
027d   52786d:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0282   527872:	48 89 f8             	mov    %rdi,%rax
0285   527875:	83 e0 07             	and    $0x7,%eax
0288   527878:	83 c0 01             	add    $0x1,%eax
028b   52787b:	38 d0                	cmp    %dl,%al
028d   52787d:	7c 08                	jl     527887 <___bpf_prog_run+0x297>
028f   52787f:	84 d2                	test   %dl,%dl
0291   527881:	0f 85 ec 5d 00 00    	jne    52d673 <___bpf_prog_run+0x6083>
0297   527887:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
029c   52788c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
02a0   527890:	49 01 cf             	add    %rcx,%r15
02a3   527893:	83 e0 0f             	and    $0xf,%eax
02a6   527896:	4c 89 fa             	mov    %r15,%rdx
02a9   527899:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
02ad   52789d:	48 c1 ea 03          	shr    $0x3,%rdx
02b1   5278a1:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
02b6   5278a6:	0f 85 43 71 00 00    	jne    52e9ef <___bpf_prog_run+0x73ff>
02bc   5278ac:	48 89 c2             	mov    %rax,%rdx
02bf   5278af:	4d 8b 3f             	mov    (%r15),%r15
02c2   5278b2:	48 c1 ea 03          	shr    $0x3,%rdx
02c6   5278b6:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
02cb   5278bb:	0f 85 19 71 00 00    	jne    52e9da <___bpf_prog_run+0x73ea>
02d1   5278c1:	4c 89 38             	mov    %r15,(%rax)
02d4   5278c4:	48 83 c3 08          	add    $0x8,%rbx
02d8   5278c8:	e9 5d fd ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
02dd   5278cd:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
02e1   5278d1:	48 89 f8             	mov    %rdi,%rax
02e4   5278d4:	48 c1 e8 03          	shr    $0x3,%rax
02e8   5278d8:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
02ed   5278dd:	48 89 f8             	mov    %rdi,%rax
02f0   5278e0:	83 e0 07             	and    $0x7,%eax
02f3   5278e3:	83 c0 03             	add    $0x3,%eax
02f6   5278e6:	38 d0                	cmp    %dl,%al
02f8   5278e8:	7c 08                	jl     5278f2 <___bpf_prog_run+0x302>
02fa   5278ea:	84 d2                	test   %dl,%dl
02fc   5278ec:	0f 85 b8 62 00 00    	jne    52dbaa <___bpf_prog_run+0x65ba>
0302   5278f2:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0306   5278f6:	48 63 43 04          	movslq 0x4(%rbx),%rax
030a   5278fa:	48 89 fa             	mov    %rdi,%rdx
030d   5278fd:	48 89 f9             	mov    %rdi,%rcx
0310   527900:	48 c1 ea 03          	shr    $0x3,%rdx
0314   527904:	83 e1 07             	and    $0x7,%ecx
0317   527907:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
031c   52790c:	38 ca                	cmp    %cl,%dl
031e   52790e:	7f 08                	jg     527918 <___bpf_prog_run+0x328>
0320   527910:	84 d2                	test   %dl,%dl
0322   527912:	0f 85 58 57 00 00    	jne    52d070 <___bpf_prog_run+0x5a80>
0328   527918:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
032c   52791c:	83 e2 0f             	and    $0xf,%edx
032f   52791f:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
0333   527923:	4c 89 fa             	mov    %r15,%rdx
0336   527926:	48 c1 ea 03          	shr    $0x3,%rdx
033a   52792a:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
033f   52792f:	0f 85 9f 6d 00 00    	jne    52e6d4 <___bpf_prog_run+0x70e4>
0345   527935:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0349   527939:	49 8b 37             	mov    (%r15),%rsi
034c   52793c:	48 89 fa             	mov    %rdi,%rdx
034f   52793f:	48 c1 ea 03          	shr    $0x3,%rdx
0353   527943:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
0358   527948:	48 89 fa             	mov    %rdi,%rdx
035b   52794b:	83 e2 07             	and    $0x7,%edx
035e   52794e:	83 c2 01             	add    $0x1,%edx
0361   527951:	38 ca                	cmp    %cl,%dl
0363   527953:	7c 08                	jl     52795d <___bpf_prog_run+0x36d>
0365   527955:	84 c9                	test   %cl,%cl
0367   527957:	0f 85 fa 56 00 00    	jne    52d057 <___bpf_prog_run+0x5a67>
036d   52795d:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0372   527962:	49 01 f7             	add    %rsi,%r15
0375   527965:	4c 89 fa             	mov    %r15,%rdx
0378   527968:	48 c1 ea 03          	shr    $0x3,%rdx
037c   52796c:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0381   527971:	0f 85 48 6d 00 00    	jne    52e6bf <___bpf_prog_run+0x70cf>
0387   527977:	49 89 07             	mov    %rax,(%r15)
038a   52797a:	48 83 c3 08          	add    $0x8,%rbx
038e   52797e:	e9 a7 fc ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0393   527983:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0397   527987:	48 89 f8             	mov    %rdi,%rax
039a   52798a:	48 89 fa             	mov    %rdi,%rdx
039d   52798d:	48 c1 e8 03          	shr    $0x3,%rax
03a1   527991:	83 e2 07             	and    $0x7,%edx
03a4   527994:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
03a9   527999:	38 d0                	cmp    %dl,%al
03ab   52799b:	7f 08                	jg     5279a5 <___bpf_prog_run+0x3b5>
03ad   52799d:	84 c0                	test   %al,%al
03af   52799f:	0f 85 fb 61 00 00    	jne    52dba0 <___bpf_prog_run+0x65b0>
03b5   5279a5:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
03b9   5279a9:	89 c2                	mov    %eax,%edx
03bb   5279ab:	83 e0 0f             	and    $0xf,%eax
03be   5279ae:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
03c2   5279b2:	c0 ea 04             	shr    $0x4,%dl
03c5   5279b5:	4c 89 f8             	mov    %r15,%rax
03c8   5279b8:	0f b6 d2             	movzbl %dl,%edx
03cb   5279bb:	48 c1 e8 03          	shr    $0x3,%rax
03cf   5279bf:	49 8d 14 d6          	lea    (%r14,%rdx,8),%rdx
03d3   5279c3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
03d8   5279c8:	0f 85 ad 6c 00 00    	jne    52e67b <___bpf_prog_run+0x708b>
03de   5279ce:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
03e2   5279d2:	49 8b 37             	mov    (%r15),%rsi
03e5   5279d5:	48 89 f8             	mov    %rdi,%rax
03e8   5279d8:	48 c1 e8 03          	shr    $0x3,%rax
03ec   5279dc:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
03f1   5279e1:	48 89 f8             	mov    %rdi,%rax
03f4   5279e4:	83 e0 07             	and    $0x7,%eax
03f7   5279e7:	83 c0 01             	add    $0x1,%eax
03fa   5279ea:	38 c8                	cmp    %cl,%al
03fc   5279ec:	7c 08                	jl     5279f6 <___bpf_prog_run+0x406>
03fe   5279ee:	84 c9                	test   %cl,%cl
0400   5279f0:	0f 85 8b 56 00 00    	jne    52d081 <___bpf_prog_run+0x5a91>
0406   5279f6:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
040b   5279fb:	48 89 d0             	mov    %rdx,%rax
040e   5279fe:	48 c1 e8 03          	shr    $0x3,%rax
0412   527a02:	49 01 f7             	add    %rsi,%r15
0415   527a05:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
041a   527a0a:	0f 85 ed 6c 00 00    	jne    52e6fd <___bpf_prog_run+0x710d>
0420   527a10:	48 8b 02             	mov    (%rdx),%rax
0423   527a13:	4c 89 fa             	mov    %r15,%rdx
0426   527a16:	48 c1 ea 03          	shr    $0x3,%rdx
042a   527a1a:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
042f   527a1f:	0f 85 c3 6c 00 00    	jne    52e6e8 <___bpf_prog_run+0x70f8>
0435   527a25:	49 89 07             	mov    %rax,(%r15)
0438   527a28:	48 83 c3 08          	add    $0x8,%rbx
043c   527a2c:	e9 f9 fb ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0441   527a31:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0445   527a35:	48 89 f8             	mov    %rdi,%rax
0448   527a38:	48 89 fa             	mov    %rdi,%rdx
044b   527a3b:	48 c1 e8 03          	shr    $0x3,%rax
044f   527a3f:	83 e2 07             	and    $0x7,%edx
0452   527a42:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0457   527a47:	38 d0                	cmp    %dl,%al
0459   527a49:	7f 08                	jg     527a53 <___bpf_prog_run+0x463>
045b   527a4b:	84 c0                	test   %al,%al
045d   527a4d:	0f 85 43 61 00 00    	jne    52db96 <___bpf_prog_run+0x65a6>
0463   527a53:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0467   527a57:	c0 e8 04             	shr    $0x4,%al
046a   527a5a:	0f b6 c0             	movzbl %al,%eax
046d   527a5d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0471   527a61:	4c 89 f8             	mov    %r15,%rax
0474   527a64:	48 c1 e8 03          	shr    $0x3,%rax
0478   527a68:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
047d   527a6d:	0f 85 88 65 00 00    	jne    52dffb <___bpf_prog_run+0x6a0b>
0483   527a73:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0487   527a77:	4d 8b 3f             	mov    (%r15),%r15
048a   527a7a:	48 89 f8             	mov    %rdi,%rax
048d   527a7d:	48 c1 e8 03          	shr    $0x3,%rax
0491   527a81:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0496   527a86:	48 89 f8             	mov    %rdi,%rax
0499   527a89:	83 e0 07             	and    $0x7,%eax
049c   527a8c:	83 c0 01             	add    $0x1,%eax
049f   527a8f:	38 d0                	cmp    %dl,%al
04a1   527a91:	7c 08                	jl     527a9b <___bpf_prog_run+0x4ab>
04a3   527a93:	84 d2                	test   %dl,%dl
04a5   527a95:	0f 85 1f 53 00 00    	jne    52cdba <___bpf_prog_run+0x57ca>
04ab   527a9b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
04af   527a9f:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
04b4   527aa4:	be 08 00 00 00       	mov    $0x8,%esi
04b9   527aa9:	48 83 c3 08          	add    $0x8,%rbx
04bd   527aad:	83 e0 0f             	and    $0xf,%eax
04c0   527ab0:	4c 01 fa             	add    %r15,%rdx
04c3   527ab3:	49 8d 3c c6          	lea    (%r14,%rax,8),%rdi
04c7   527ab7:	e8 00 00 00 00       	call   527abc <___bpf_prog_run+0x4cc>	527ab8: R_X86_64_PLT32	bpf_probe_read_kernel-0x4
04cc   527abc:	e9 69 fb ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
04d1   527ac1:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
04d5   527ac5:	48 89 f8             	mov    %rdi,%rax
04d8   527ac8:	48 89 fa             	mov    %rdi,%rdx
04db   527acb:	48 c1 e8 03          	shr    $0x3,%rax
04df   527acf:	83 e2 07             	and    $0x7,%edx
04e2   527ad2:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
04e7   527ad7:	38 d0                	cmp    %dl,%al
04e9   527ad9:	7f 08                	jg     527ae3 <___bpf_prog_run+0x4f3>
04eb   527adb:	84 c0                	test   %al,%al
04ed   527add:	0f 85 a9 60 00 00    	jne    52db8c <___bpf_prog_run+0x659c>
04f3   527ae3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
04f7   527ae7:	c0 e8 04             	shr    $0x4,%al
04fa   527aea:	0f b6 c0             	movzbl %al,%eax
04fd   527aed:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0501   527af1:	4c 89 f8             	mov    %r15,%rax
0504   527af4:	48 c1 e8 03          	shr    $0x3,%rax
0508   527af8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
050d   527afd:	0f 85 5d 6c 00 00    	jne    52e760 <___bpf_prog_run+0x7170>
0513   527b03:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0517   527b07:	49 8b 0f             	mov    (%r15),%rcx
051a   527b0a:	48 89 f8             	mov    %rdi,%rax
051d   527b0d:	48 c1 e8 03          	shr    $0x3,%rax
0521   527b11:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0526   527b16:	48 89 f8             	mov    %rdi,%rax
0529   527b19:	83 e0 07             	and    $0x7,%eax
052c   527b1c:	83 c0 01             	add    $0x1,%eax
052f   527b1f:	38 d0                	cmp    %dl,%al
0531   527b21:	7c 08                	jl     527b2b <___bpf_prog_run+0x53b>
0533   527b23:	84 d2                	test   %dl,%dl
0535   527b25:	0f 85 1a 55 00 00    	jne    52d045 <___bpf_prog_run+0x5a55>
053b   527b2b:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0540   527b30:	49 01 cf             	add    %rcx,%r15
0543   527b33:	4c 89 f8             	mov    %r15,%rax
0546   527b36:	48 c1 e8 03          	shr    $0x3,%rax
054a   527b3a:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
054f   527b3f:	4c 89 f8             	mov    %r15,%rax
0552   527b42:	83 e0 07             	and    $0x7,%eax
0555   527b45:	83 c0 03             	add    $0x3,%eax
0558   527b48:	38 d0                	cmp    %dl,%al
055a   527b4a:	7c 08                	jl     527b54 <___bpf_prog_run+0x564>
055c   527b4c:	84 d2                	test   %dl,%dl
055e   527b4e:	0f 85 70 52 00 00    	jne    52cdc4 <___bpf_prog_run+0x57d4>
0564   527b54:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0568   527b58:	45 8b 3f             	mov    (%r15),%r15d
056b   527b5b:	83 e0 0f             	and    $0xf,%eax
056e   527b5e:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0572   527b62:	48 89 c2             	mov    %rax,%rdx
0575   527b65:	48 c1 ea 03          	shr    $0x3,%rdx
0579   527b69:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
057e   527b6e:	0f 85 94 64 00 00    	jne    52e008 <___bpf_prog_run+0x6a18>
0584   527b74:	4c 89 38             	mov    %r15,(%rax)
0587   527b77:	48 83 c3 08          	add    $0x8,%rbx
058b   527b7b:	e9 aa fa ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0590   527b80:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
0594   527b84:	4c 89 f8             	mov    %r15,%rax
0597   527b87:	4c 89 fa             	mov    %r15,%rdx
059a   527b8a:	48 c1 e8 03          	shr    $0x3,%rax
059e   527b8e:	83 e2 07             	and    $0x7,%edx
05a1   527b91:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
05a6   527b96:	38 d0                	cmp    %dl,%al
05a8   527b98:	7f 08                	jg     527ba2 <___bpf_prog_run+0x5b2>
05aa   527b9a:	84 c0                	test   %al,%al
05ac   527b9c:	0f 85 dd 5f 00 00    	jne    52db7f <___bpf_prog_run+0x658f>
05b2   527ba2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
05b6   527ba6:	c0 e8 04             	shr    $0x4,%al
05b9   527ba9:	0f b6 c0             	movzbl %al,%eax
05bc   527bac:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
05c0   527bb0:	48 89 c2             	mov    %rax,%rdx
05c3   527bb3:	48 c1 ea 03          	shr    $0x3,%rdx
05c7   527bb7:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
05cc   527bbc:	0f 85 70 64 00 00    	jne    52e032 <___bpf_prog_run+0x6a42>
05d2   527bc2:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
05d6   527bc6:	48 8b 08             	mov    (%rax),%rcx
05d9   527bc9:	48 89 f8             	mov    %rdi,%rax
05dc   527bcc:	48 c1 e8 03          	shr    $0x3,%rax
05e0   527bd0:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
05e5   527bd5:	48 89 f8             	mov    %rdi,%rax
05e8   527bd8:	83 e0 07             	and    $0x7,%eax
05eb   527bdb:	83 c0 01             	add    $0x1,%eax
05ee   527bde:	38 d0                	cmp    %dl,%al
05f0   527be0:	7c 08                	jl     527bea <___bpf_prog_run+0x5fa>
05f2   527be2:	84 d2                	test   %dl,%dl
05f4   527be4:	0f 85 be 51 00 00    	jne    52cda8 <___bpf_prog_run+0x57b8>
05fa   527bea:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
05fe   527bee:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
0603   527bf3:	be 04 00 00 00       	mov    $0x4,%esi
0608   527bf8:	83 e0 0f             	and    $0xf,%eax
060b   527bfb:	48 01 ca             	add    %rcx,%rdx
060e   527bfe:	49 8d 3c c6          	lea    (%r14,%rax,8),%rdi
0612   527c02:	e8 00 00 00 00       	call   527c07 <___bpf_prog_run+0x617>	527c03: R_X86_64_PLT32	bpf_probe_read_kernel-0x4
0617   527c07:	4c 89 f8             	mov    %r15,%rax
061a   527c0a:	4c 89 fa             	mov    %r15,%rdx
061d   527c0d:	48 c1 e8 03          	shr    $0x3,%rax
0621   527c11:	83 e2 07             	and    $0x7,%edx
0624   527c14:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0629   527c19:	38 d0                	cmp    %dl,%al
062b   527c1b:	7f 08                	jg     527c25 <___bpf_prog_run+0x635>
062d   527c1d:	84 c0                	test   %al,%al
062f   527c1f:	0f 85 76 51 00 00    	jne    52cd9b <___bpf_prog_run+0x57ab>
0635   527c25:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0639   527c29:	83 e0 0f             	and    $0xf,%eax
063c   527c2c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0640   527c30:	4c 89 f8             	mov    %r15,%rax
0643   527c33:	48 c1 e8 03          	shr    $0x3,%rax
0647   527c37:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
064c   527c3c:	84 c0                	test   %al,%al
064e   527c3e:	74 08                	je     527c48 <___bpf_prog_run+0x658>
0650   527c40:	3c 03                	cmp    $0x3,%al
0652   527c42:	0f 8e 46 51 00 00    	jle    52cd8e <___bpf_prog_run+0x579e>
0658   527c48:	4c 89 fa             	mov    %r15,%rdx
065b   527c4b:	41 8b 07             	mov    (%r15),%eax
065e   527c4e:	48 c1 ea 03          	shr    $0x3,%rdx
0662   527c52:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0667   527c57:	0f 85 3d 60 00 00    	jne    52dc9a <___bpf_prog_run+0x66aa>
066d   527c5d:	49 89 07             	mov    %rax,(%r15)
0670   527c60:	48 83 c3 08          	add    $0x8,%rbx
0674   527c64:	e9 c1 f9 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0679   527c69:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
067d   527c6d:	48 89 f8             	mov    %rdi,%rax
0680   527c70:	48 c1 e8 03          	shr    $0x3,%rax
0684   527c74:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0689   527c79:	48 89 f8             	mov    %rdi,%rax
068c   527c7c:	83 e0 07             	and    $0x7,%eax
068f   527c7f:	83 c0 03             	add    $0x3,%eax
0692   527c82:	38 d0                	cmp    %dl,%al
0694   527c84:	7c 08                	jl     527c8e <___bpf_prog_run+0x69e>
0696   527c86:	84 d2                	test   %dl,%dl
0698   527c88:	0f 85 e7 5e 00 00    	jne    52db75 <___bpf_prog_run+0x6585>
069e   527c8e:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
06a2   527c92:	8b 53 04             	mov    0x4(%rbx),%edx
06a5   527c95:	48 89 f8             	mov    %rdi,%rax
06a8   527c98:	48 89 f9             	mov    %rdi,%rcx
06ab   527c9b:	48 c1 e8 03          	shr    $0x3,%rax
06af   527c9f:	83 e1 07             	and    $0x7,%ecx
06b2   527ca2:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
06b7   527ca7:	38 c8                	cmp    %cl,%al
06b9   527ca9:	7f 08                	jg     527cb3 <___bpf_prog_run+0x6c3>
06bb   527cab:	84 c0                	test   %al,%al
06bd   527cad:	0f 85 41 59 00 00    	jne    52d5f4 <___bpf_prog_run+0x6004>
06c3   527cb3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
06c7   527cb7:	83 e0 0f             	and    $0xf,%eax
06ca   527cba:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
06ce   527cbe:	4c 89 f8             	mov    %r15,%rax
06d1   527cc1:	48 c1 e8 03          	shr    $0x3,%rax
06d5   527cc5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
06da   527cca:	0f 85 92 6d 00 00    	jne    52ea62 <___bpf_prog_run+0x7472>
06e0   527cd0:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
06e4   527cd4:	49 8b 37             	mov    (%r15),%rsi
06e7   527cd7:	48 89 f8             	mov    %rdi,%rax
06ea   527cda:	48 c1 e8 03          	shr    $0x3,%rax
06ee   527cde:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
06f3   527ce3:	48 89 f8             	mov    %rdi,%rax
06f6   527ce6:	83 e0 07             	and    $0x7,%eax
06f9   527ce9:	83 c0 01             	add    $0x1,%eax
06fc   527cec:	38 c8                	cmp    %cl,%al
06fe   527cee:	7c 08                	jl     527cf8 <___bpf_prog_run+0x708>
0700   527cf0:	84 c9                	test   %cl,%cl
0702   527cf2:	0f 85 e4 58 00 00    	jne    52d5dc <___bpf_prog_run+0x5fec>
0708   527cf8:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
070d   527cfd:	49 01 f7             	add    %rsi,%r15
0710   527d00:	4c 89 f8             	mov    %r15,%rax
0713   527d03:	48 c1 e8 03          	shr    $0x3,%rax
0717   527d07:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
071c   527d0c:	4c 89 f8             	mov    %r15,%rax
071f   527d0f:	83 e0 07             	and    $0x7,%eax
0722   527d12:	83 c0 03             	add    $0x3,%eax
0725   527d15:	38 c8                	cmp    %cl,%al
0727   527d17:	7c 08                	jl     527d21 <___bpf_prog_run+0x731>
0729   527d19:	84 c9                	test   %cl,%cl
072b   527d1b:	0f 85 a8 58 00 00    	jne    52d5c9 <___bpf_prog_run+0x5fd9>
0731   527d21:	41 89 17             	mov    %edx,(%r15)
0734   527d24:	48 83 c3 08          	add    $0x8,%rbx
0738   527d28:	e9 fd f8 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
073d   527d2d:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0741   527d31:	48 89 f8             	mov    %rdi,%rax
0744   527d34:	48 89 fa             	mov    %rdi,%rdx
0747   527d37:	48 c1 e8 03          	shr    $0x3,%rax
074b   527d3b:	83 e2 07             	and    $0x7,%edx
074e   527d3e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0753   527d43:	38 d0                	cmp    %dl,%al
0755   527d45:	7f 08                	jg     527d4f <___bpf_prog_run+0x75f>
0757   527d47:	84 c0                	test   %al,%al
0759   527d49:	0f 85 1c 5e 00 00    	jne    52db6b <___bpf_prog_run+0x657b>
075f   527d4f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0763   527d53:	c0 e8 04             	shr    $0x4,%al
0766   527d56:	0f b6 c0             	movzbl %al,%eax
0769   527d59:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
076d   527d5d:	4c 89 f8             	mov    %r15,%rax
0770   527d60:	48 c1 e8 03          	shr    $0x3,%rax
0774   527d64:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0779   527d69:	0f 85 28 6b 00 00    	jne    52e897 <___bpf_prog_run+0x72a7>
077f   527d6f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0783   527d73:	49 8b 17             	mov    (%r15),%rdx
0786   527d76:	83 e0 0f             	and    $0xf,%eax
0789   527d79:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
078d   527d7d:	4c 89 f8             	mov    %r15,%rax
0790   527d80:	48 c1 e8 03          	shr    $0x3,%rax
0794   527d84:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0799   527d89:	0f 85 f3 6a 00 00    	jne    52e882 <___bpf_prog_run+0x7292>
079f   527d8f:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
07a3   527d93:	49 8b 37             	mov    (%r15),%rsi
07a6   527d96:	48 89 f8             	mov    %rdi,%rax
07a9   527d99:	48 c1 e8 03          	shr    $0x3,%rax
07ad   527d9d:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
07b2   527da2:	48 89 f8             	mov    %rdi,%rax
07b5   527da5:	83 e0 07             	and    $0x7,%eax
07b8   527da8:	83 c0 01             	add    $0x1,%eax
07bb   527dab:	38 c8                	cmp    %cl,%al
07bd   527dad:	7c 08                	jl     527db7 <___bpf_prog_run+0x7c7>
07bf   527daf:	84 c9                	test   %cl,%cl
07c1   527db1:	0f 85 d0 57 00 00    	jne    52d587 <___bpf_prog_run+0x5f97>
07c7   527db7:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
07cc   527dbc:	49 01 f7             	add    %rsi,%r15
07cf   527dbf:	4c 89 f8             	mov    %r15,%rax
07d2   527dc2:	48 c1 e8 03          	shr    $0x3,%rax
07d6   527dc6:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
07db   527dcb:	4c 89 f8             	mov    %r15,%rax
07de   527dce:	83 e0 07             	and    $0x7,%eax
07e1   527dd1:	83 c0 03             	add    $0x3,%eax
07e4   527dd4:	38 c8                	cmp    %cl,%al
07e6   527dd6:	7c 08                	jl     527de0 <___bpf_prog_run+0x7f0>
07e8   527dd8:	84 c9                	test   %cl,%cl
07ea   527dda:	0f 85 92 57 00 00    	jne    52d572 <___bpf_prog_run+0x5f82>
07f0   527de0:	41 89 17             	mov    %edx,(%r15)
07f3   527de3:	48 83 c3 08          	add    $0x8,%rbx
07f7   527de7:	e9 3e f8 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
07fc   527dec:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0800   527df0:	48 89 f8             	mov    %rdi,%rax
0803   527df3:	48 89 fa             	mov    %rdi,%rdx
0806   527df6:	48 c1 e8 03          	shr    $0x3,%rax
080a   527dfa:	83 e2 07             	and    $0x7,%edx
080d   527dfd:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0812   527e02:	38 d0                	cmp    %dl,%al
0814   527e04:	7f 08                	jg     527e0e <___bpf_prog_run+0x81e>
0816   527e06:	84 c0                	test   %al,%al
0818   527e08:	0f 85 53 5d 00 00    	jne    52db61 <___bpf_prog_run+0x6571>
081e   527e0e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0822   527e12:	c0 e8 04             	shr    $0x4,%al
0825   527e15:	0f b6 c0             	movzbl %al,%eax
0828   527e18:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
082c   527e1c:	4c 89 f8             	mov    %r15,%rax
082f   527e1f:	48 c1 e8 03          	shr    $0x3,%rax
0833   527e23:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0838   527e28:	0f 85 9f 6b 00 00    	jne    52e9cd <___bpf_prog_run+0x73dd>
083e   527e2e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0842   527e32:	49 8b 17             	mov    (%r15),%rdx
0845   527e35:	83 e0 0f             	and    $0xf,%eax
0848   527e38:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
084c   527e3c:	4c 89 f8             	mov    %r15,%rax
084f   527e3f:	48 c1 e8 03          	shr    $0x3,%rax
0853   527e43:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0858   527e48:	0f 85 6a 6b 00 00    	jne    52e9b8 <___bpf_prog_run+0x73c8>
085e   527e4e:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0862   527e52:	49 8b 37             	mov    (%r15),%rsi
0865   527e55:	48 89 f8             	mov    %rdi,%rax
0868   527e58:	48 c1 e8 03          	shr    $0x3,%rax
086c   527e5c:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
0871   527e61:	48 89 f8             	mov    %rdi,%rax
0874   527e64:	83 e0 07             	and    $0x7,%eax
0877   527e67:	83 c0 01             	add    $0x1,%eax
087a   527e6a:	38 c8                	cmp    %cl,%al
087c   527e6c:	7c 08                	jl     527e76 <___bpf_prog_run+0x886>
087e   527e6e:	84 c9                	test   %cl,%cl
0880   527e70:	0f 85 e3 57 00 00    	jne    52d659 <___bpf_prog_run+0x6069>
0886   527e76:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
088b   527e7b:	49 01 f7             	add    %rsi,%r15
088e   527e7e:	4c 89 f8             	mov    %r15,%rax
0891   527e81:	4c 89 f9             	mov    %r15,%rcx
0894   527e84:	48 c1 e8 03          	shr    $0x3,%rax
0898   527e88:	83 e1 07             	and    $0x7,%ecx
089b   527e8b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
08a0   527e90:	38 c8                	cmp    %cl,%al
08a2   527e92:	7f 08                	jg     527e9c <___bpf_prog_run+0x8ac>
08a4   527e94:	84 c0                	test   %al,%al
08a6   527e96:	0f 85 a8 57 00 00    	jne    52d644 <___bpf_prog_run+0x6054>
08ac   527e9c:	41 88 17             	mov    %dl,(%r15)
08af   527e9f:	48 83 c3 08          	add    $0x8,%rbx
08b3   527ea3:	e9 82 f7 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
08b8   527ea8:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
08bc   527eac:	48 89 f8             	mov    %rdi,%rax
08bf   527eaf:	48 89 fa             	mov    %rdi,%rdx
08c2   527eb2:	48 c1 e8 03          	shr    $0x3,%rax
08c6   527eb6:	83 e2 07             	and    $0x7,%edx
08c9   527eb9:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
08ce   527ebe:	38 d0                	cmp    %dl,%al
08d0   527ec0:	7f 08                	jg     527eca <___bpf_prog_run+0x8da>
08d2   527ec2:	84 c0                	test   %al,%al
08d4   527ec4:	0f 85 8d 5c 00 00    	jne    52db57 <___bpf_prog_run+0x6567>
08da   527eca:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
08de   527ece:	c0 e8 04             	shr    $0x4,%al
08e1   527ed1:	0f b6 c0             	movzbl %al,%eax
08e4   527ed4:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
08e8   527ed8:	4c 89 f8             	mov    %r15,%rax
08eb   527edb:	48 c1 e8 03          	shr    $0x3,%rax
08ef   527edf:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
08f4   527ee4:	0f 85 8a 6a 00 00    	jne    52e974 <___bpf_prog_run+0x7384>
08fa   527eea:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
08fe   527eee:	49 8b 17             	mov    (%r15),%rdx
0901   527ef1:	83 e0 0f             	and    $0xf,%eax
0904   527ef4:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0908   527ef8:	4c 89 f8             	mov    %r15,%rax
090b   527efb:	48 c1 e8 03          	shr    $0x3,%rax
090f   527eff:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0914   527f04:	0f 85 55 6a 00 00    	jne    52e95f <___bpf_prog_run+0x736f>
091a   527f0a:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
091e   527f0e:	49 8b 37             	mov    (%r15),%rsi
0921   527f11:	48 89 f8             	mov    %rdi,%rax
0924   527f14:	48 c1 e8 03          	shr    $0x3,%rax
0928   527f18:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
092d   527f1d:	48 89 f8             	mov    %rdi,%rax
0930   527f20:	83 e0 07             	and    $0x7,%eax
0933   527f23:	83 c0 01             	add    $0x1,%eax
0936   527f26:	38 c8                	cmp    %cl,%al
0938   527f28:	7c 08                	jl     527f32 <___bpf_prog_run+0x942>
093a   527f2a:	84 c9                	test   %cl,%cl
093c   527f2c:	0f 85 a0 55 00 00    	jne    52d4d2 <___bpf_prog_run+0x5ee2>
0942   527f32:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0947   527f37:	49 01 f7             	add    %rsi,%r15
094a   527f3a:	4c 89 f8             	mov    %r15,%rax
094d   527f3d:	48 c1 e8 03          	shr    $0x3,%rax
0951   527f41:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
0956   527f46:	4c 89 f8             	mov    %r15,%rax
0959   527f49:	83 e0 07             	and    $0x7,%eax
095c   527f4c:	83 c0 01             	add    $0x1,%eax
095f   527f4f:	38 c8                	cmp    %cl,%al
0961   527f51:	7c 08                	jl     527f5b <___bpf_prog_run+0x96b>
0963   527f53:	84 c9                	test   %cl,%cl
0965   527f55:	0f 85 62 55 00 00    	jne    52d4bd <___bpf_prog_run+0x5ecd>
096b   527f5b:	66 41 89 17          	mov    %dx,(%r15)
096f   527f5f:	48 83 c3 08          	add    $0x8,%rbx
0973   527f63:	e9 c2 f6 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0978   527f68:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
097c   527f6c:	48 89 f8             	mov    %rdi,%rax
097f   527f6f:	48 89 fa             	mov    %rdi,%rdx
0982   527f72:	48 c1 e8 03          	shr    $0x3,%rax
0986   527f76:	83 e2 07             	and    $0x7,%edx
0989   527f79:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
098e   527f7e:	38 d0                	cmp    %dl,%al
0990   527f80:	7f 08                	jg     527f8a <___bpf_prog_run+0x99a>
0992   527f82:	84 c0                	test   %al,%al
0994   527f84:	0f 85 c3 5b 00 00    	jne    52db4d <___bpf_prog_run+0x655d>
099a   527f8a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
099e   527f8e:	83 e0 0f             	and    $0xf,%eax
09a1   527f91:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
09a5   527f95:	4c 89 f8             	mov    %r15,%rax
09a8   527f98:	48 c1 e8 03          	shr    $0x3,%rax
09ac   527f9c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
09b1   527fa1:	0f 85 5d 6a 00 00    	jne    52ea04 <___bpf_prog_run+0x7414>
09b7   527fa7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
09bb   527fab:	49 8b 17             	mov    (%r15),%rdx
09be   527fae:	c0 e8 04             	shr    $0x4,%al
09c1   527fb1:	0f b6 c0             	movzbl %al,%eax
09c4   527fb4:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
09c8   527fb8:	4c 89 f8             	mov    %r15,%rax
09cb   527fbb:	48 c1 e8 03          	shr    $0x3,%rax
09cf   527fbf:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
09d4   527fc4:	0f 85 61 6a 00 00    	jne    52ea2b <___bpf_prog_run+0x743b>
09da   527fca:	41 39 17             	cmp    %edx,(%r15)
09dd   527fcd:	0f 8c 87 43 00 00    	jl     52c35a <___bpf_prog_run+0x4d6a>
09e3   527fd3:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
09e7   527fd7:	48 89 f8             	mov    %rdi,%rax
09ea   527fda:	48 c1 e8 03          	shr    $0x3,%rax
09ee   527fde:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
09f3   527fe3:	48 89 f8             	mov    %rdi,%rax
09f6   527fe6:	83 e0 07             	and    $0x7,%eax
09f9   527fe9:	83 c0 01             	add    $0x1,%eax
09fc   527fec:	38 d0                	cmp    %dl,%al
09fe   527fee:	7c 08                	jl     527ff8 <___bpf_prog_run+0xa08>
0a00   527ff0:	84 d2                	test   %dl,%dl
0a02   527ff2:	0f 85 b3 55 00 00    	jne    52d5ab <___bpf_prog_run+0x5fbb>
0a08   527ff8:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
0a0d   527ffd:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
0a12   528002:	e9 23 f6 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0a17   528007:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0a1b   52800b:	48 89 f8             	mov    %rdi,%rax
0a1e   52800e:	48 89 fa             	mov    %rdi,%rdx
0a21   528011:	48 c1 e8 03          	shr    $0x3,%rax
0a25   528015:	83 e2 07             	and    $0x7,%edx
0a28   528018:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0a2d   52801d:	38 d0                	cmp    %dl,%al
0a2f   52801f:	7f 08                	jg     528029 <___bpf_prog_run+0xa39>
0a31   528021:	84 c0                	test   %al,%al
0a33   528023:	0f 85 1a 5b 00 00    	jne    52db43 <___bpf_prog_run+0x6553>
0a39   528029:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0a3d   52802d:	c0 e8 04             	shr    $0x4,%al
0a40   528030:	0f b6 c0             	movzbl %al,%eax
0a43   528033:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0a47   528037:	4c 89 f8             	mov    %r15,%rax
0a4a   52803a:	48 c1 e8 03          	shr    $0x3,%rax
0a4e   52803e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0a53   528043:	0f 85 70 68 00 00    	jne    52e8b9 <___bpf_prog_run+0x72c9>
0a59   528049:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0a5d   52804d:	49 8b 0f             	mov    (%r15),%rcx
0a60   528050:	48 89 f8             	mov    %rdi,%rax
0a63   528053:	48 c1 e8 03          	shr    $0x3,%rax
0a67   528057:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0a6c   52805c:	48 89 f8             	mov    %rdi,%rax
0a6f   52805f:	83 e0 07             	and    $0x7,%eax
0a72   528062:	83 c0 01             	add    $0x1,%eax
0a75   528065:	38 d0                	cmp    %dl,%al
0a77   528067:	7c 08                	jl     528071 <___bpf_prog_run+0xa81>
0a79   528069:	84 d2                	test   %dl,%dl
0a7b   52806b:	0f 85 c3 54 00 00    	jne    52d534 <___bpf_prog_run+0x5f44>
0a81   528071:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0a86   528076:	49 01 cf             	add    %rcx,%r15
0a89   528079:	4c 89 f8             	mov    %r15,%rax
0a8c   52807c:	48 c1 e8 03          	shr    $0x3,%rax
0a90   528080:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0a95   528085:	4c 89 f8             	mov    %r15,%rax
0a98   528088:	83 e0 07             	and    $0x7,%eax
0a9b   52808b:	83 c0 01             	add    $0x1,%eax
0a9e   52808e:	38 d0                	cmp    %dl,%al
0aa0   528090:	7c 08                	jl     52809a <___bpf_prog_run+0xaaa>
0aa2   528092:	84 d2                	test   %dl,%dl
0aa4   528094:	0f 85 8d 54 00 00    	jne    52d527 <___bpf_prog_run+0x5f37>
0aaa   52809a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0aae   52809e:	45 0f b7 3f          	movzwl (%r15),%r15d
0ab2   5280a2:	83 e0 0f             	and    $0xf,%eax
0ab5   5280a5:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0ab9   5280a9:	48 89 c2             	mov    %rax,%rdx
0abc   5280ac:	48 c1 ea 03          	shr    $0x3,%rdx
0ac0   5280b0:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0ac5   5280b5:	0f 85 33 68 00 00    	jne    52e8ee <___bpf_prog_run+0x72fe>
0acb   5280bb:	4c 89 38             	mov    %r15,(%rax)
0ace   5280be:	48 83 c3 08          	add    $0x8,%rbx
0ad2   5280c2:	e9 63 f5 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0ad7   5280c7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0adb   5280cb:	48 89 f8             	mov    %rdi,%rax
0ade   5280ce:	48 89 fa             	mov    %rdi,%rdx
0ae1   5280d1:	48 c1 e8 03          	shr    $0x3,%rax
0ae5   5280d5:	83 e2 07             	and    $0x7,%edx
0ae8   5280d8:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0aed   5280dd:	38 d0                	cmp    %dl,%al
0aef   5280df:	7f 08                	jg     5280e9 <___bpf_prog_run+0xaf9>
0af1   5280e1:	84 c0                	test   %al,%al
0af3   5280e3:	0f 85 50 5a 00 00    	jne    52db39 <___bpf_prog_run+0x6549>
0af9   5280e9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0afd   5280ed:	83 e0 0f             	and    $0xf,%eax
0b00   5280f0:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0b04   5280f4:	4c 89 f8             	mov    %r15,%rax
0b07   5280f7:	48 c1 e8 03          	shr    $0x3,%rax
0b0b   5280fb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0b10   528100:	0f 85 4f 69 00 00    	jne    52ea55 <___bpf_prog_run+0x7465>
0b16   528106:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
0b1a   52810a:	4d 8b 3f             	mov    (%r15),%r15
0b1d   52810d:	48 89 f8             	mov    %rdi,%rax
0b20   528110:	48 c1 e8 03          	shr    $0x3,%rax
0b24   528114:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0b29   528119:	48 89 f8             	mov    %rdi,%rax
0b2c   52811c:	83 e0 07             	and    $0x7,%eax
0b2f   52811f:	83 c0 03             	add    $0x3,%eax
0b32   528122:	38 d0                	cmp    %dl,%al
0b34   528124:	7c 08                	jl     52812e <___bpf_prog_run+0xb3e>
0b36   528126:	84 d2                	test   %dl,%dl
0b38   528128:	0f 85 0c 55 00 00    	jne    52d63a <___bpf_prog_run+0x604a>
0b3e   52812e:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
0b42   528132:	0f 8f 34 42 00 00    	jg     52c36c <___bpf_prog_run+0x4d7c>
0b48   528138:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0b4c   52813c:	48 89 f8             	mov    %rdi,%rax
0b4f   52813f:	48 c1 e8 03          	shr    $0x3,%rax
0b53   528143:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0b58   528148:	48 89 f8             	mov    %rdi,%rax
0b5b   52814b:	83 e0 07             	and    $0x7,%eax
0b5e   52814e:	83 c0 01             	add    $0x1,%eax
0b61   528151:	38 d0                	cmp    %dl,%al
0b63   528153:	7c 08                	jl     52815d <___bpf_prog_run+0xb6d>
0b65   528155:	84 d2                	test   %dl,%dl
0b67   528157:	0f 85 d3 54 00 00    	jne    52d630 <___bpf_prog_run+0x6040>
0b6d   52815d:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
0b72   528162:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
0b77   528167:	e9 be f4 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0b7c   52816c:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0b80   528170:	48 89 f8             	mov    %rdi,%rax
0b83   528173:	48 89 fa             	mov    %rdi,%rdx
0b86   528176:	48 c1 e8 03          	shr    $0x3,%rax
0b8a   52817a:	83 e2 07             	and    $0x7,%edx
0b8d   52817d:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0b92   528182:	38 d0                	cmp    %dl,%al
0b94   528184:	7f 08                	jg     52818e <___bpf_prog_run+0xb9e>
0b96   528186:	84 c0                	test   %al,%al
0b98   528188:	0f 85 a1 59 00 00    	jne    52db2f <___bpf_prog_run+0x653f>
0b9e   52818e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0ba2   528192:	c0 e8 04             	shr    $0x4,%al
0ba5   528195:	0f b6 c0             	movzbl %al,%eax
0ba8   528198:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0bac   52819c:	4c 89 f8             	mov    %r15,%rax
0baf   52819f:	48 c1 e8 03          	shr    $0x3,%rax
0bb3   5281a3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0bb8   5281a8:	0f 85 91 67 00 00    	jne    52e93f <___bpf_prog_run+0x734f>
0bbe   5281ae:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0bc2   5281b2:	49 8b 0f             	mov    (%r15),%rcx
0bc5   5281b5:	48 89 f8             	mov    %rdi,%rax
0bc8   5281b8:	48 c1 e8 03          	shr    $0x3,%rax
0bcc   5281bc:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0bd1   5281c1:	48 89 f8             	mov    %rdi,%rax
0bd4   5281c4:	83 e0 07             	and    $0x7,%eax
0bd7   5281c7:	83 c0 01             	add    $0x1,%eax
0bda   5281ca:	38 d0                	cmp    %dl,%al
0bdc   5281cc:	7c 08                	jl     5281d6 <___bpf_prog_run+0xbe6>
0bde   5281ce:	84 d2                	test   %dl,%dl
0be0   5281d0:	0f 85 9a 52 00 00    	jne    52d470 <___bpf_prog_run+0x5e80>
0be6   5281d6:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0beb   5281db:	49 01 cf             	add    %rcx,%r15
0bee   5281de:	4c 89 f8             	mov    %r15,%rax
0bf1   5281e1:	4c 89 fa             	mov    %r15,%rdx
0bf4   5281e4:	48 c1 e8 03          	shr    $0x3,%rax
0bf8   5281e8:	83 e2 07             	and    $0x7,%edx
0bfb   5281eb:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0c00   5281f0:	38 d0                	cmp    %dl,%al
0c02   5281f2:	7f 08                	jg     5281fc <___bpf_prog_run+0xc0c>
0c04   5281f4:	84 c0                	test   %al,%al
0c06   5281f6:	0f 85 67 52 00 00    	jne    52d463 <___bpf_prog_run+0x5e73>
0c0c   5281fc:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0c10   528200:	45 0f b6 3f          	movzbl (%r15),%r15d
0c14   528204:	83 e0 0f             	and    $0xf,%eax
0c17   528207:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0c1b   52820b:	48 89 c2             	mov    %rax,%rdx
0c1e   52820e:	48 c1 ea 03          	shr    $0x3,%rdx
0c22   528212:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0c27   528217:	0f 85 f3 66 00 00    	jne    52e910 <___bpf_prog_run+0x7320>
0c2d   52821d:	4c 89 38             	mov    %r15,(%rax)
0c30   528220:	48 83 c3 08          	add    $0x8,%rbx
0c34   528224:	e9 01 f4 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0c39   528229:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0c3d   52822d:	48 89 f8             	mov    %rdi,%rax
0c40   528230:	48 89 fa             	mov    %rdi,%rdx
0c43   528233:	48 c1 e8 03          	shr    $0x3,%rax
0c47   528237:	83 e2 07             	and    $0x7,%edx
0c4a   52823a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0c4f   52823f:	38 d0                	cmp    %dl,%al
0c51   528241:	7f 08                	jg     52824b <___bpf_prog_run+0xc5b>
0c53   528243:	84 c0                	test   %al,%al
0c55   528245:	0f 85 da 58 00 00    	jne    52db25 <___bpf_prog_run+0x6535>
0c5b   52824b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0c5f   52824f:	83 e0 0f             	and    $0xf,%eax
0c62   528252:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0c66   528256:	4c 89 f8             	mov    %r15,%rax
0c69   528259:	48 c1 e8 03          	shr    $0x3,%rax
0c6d   52825d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0c72   528262:	0f 85 a9 67 00 00    	jne    52ea11 <___bpf_prog_run+0x7421>
0c78   528268:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
0c7c   52826c:	4d 8b 3f             	mov    (%r15),%r15
0c7f   52826f:	48 89 f8             	mov    %rdi,%rax
0c82   528272:	48 c1 e8 03          	shr    $0x3,%rax
0c86   528276:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0c8b   52827b:	48 89 f8             	mov    %rdi,%rax
0c8e   52827e:	83 e0 07             	and    $0x7,%eax
0c91   528281:	83 c0 03             	add    $0x3,%eax
0c94   528284:	38 d0                	cmp    %dl,%al
0c96   528286:	7c 08                	jl     528290 <___bpf_prog_run+0xca0>
0c98   528288:	84 d2                	test   %dl,%dl
0c9a   52828a:	0f 85 2f 53 00 00    	jne    52d5bf <___bpf_prog_run+0x5fcf>
0ca0   528290:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
0ca4   528294:	0f 8c c9 40 00 00    	jl     52c363 <___bpf_prog_run+0x4d73>
0caa   52829a:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0cae   52829e:	48 89 f8             	mov    %rdi,%rax
0cb1   5282a1:	48 c1 e8 03          	shr    $0x3,%rax
0cb5   5282a5:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0cba   5282aa:	48 89 f8             	mov    %rdi,%rax
0cbd   5282ad:	83 e0 07             	and    $0x7,%eax
0cc0   5282b0:	83 c0 01             	add    $0x1,%eax
0cc3   5282b3:	38 d0                	cmp    %dl,%al
0cc5   5282b5:	7c 08                	jl     5282bf <___bpf_prog_run+0xccf>
0cc7   5282b7:	84 d2                	test   %dl,%dl
0cc9   5282b9:	0f 85 f6 52 00 00    	jne    52d5b5 <___bpf_prog_run+0x5fc5>
0ccf   5282bf:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
0cd4   5282c4:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
0cd9   5282c9:	e9 5c f3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0cde   5282ce:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
0ce2   5282d2:	4c 89 f8             	mov    %r15,%rax
0ce5   5282d5:	4c 89 fa             	mov    %r15,%rdx
0ce8   5282d8:	48 c1 e8 03          	shr    $0x3,%rax
0cec   5282dc:	83 e2 07             	and    $0x7,%edx
0cef   5282df:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0cf4   5282e4:	38 d0                	cmp    %dl,%al
0cf6   5282e6:	7f 08                	jg     5282f0 <___bpf_prog_run+0xd00>
0cf8   5282e8:	84 c0                	test   %al,%al
0cfa   5282ea:	0f 85 28 58 00 00    	jne    52db18 <___bpf_prog_run+0x6528>
0d00   5282f0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0d04   5282f4:	c0 e8 04             	shr    $0x4,%al
0d07   5282f7:	0f b6 c0             	movzbl %al,%eax
0d0a   5282fa:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0d0e   5282fe:	48 89 c2             	mov    %rax,%rdx
0d11   528301:	48 c1 ea 03          	shr    $0x3,%rdx
0d15   528305:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0d1a   52830a:	0f 85 5d 65 00 00    	jne    52e86d <___bpf_prog_run+0x727d>
0d20   528310:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0d24   528314:	48 8b 08             	mov    (%rax),%rcx
0d27   528317:	48 89 f8             	mov    %rdi,%rax
0d2a   52831a:	48 c1 e8 03          	shr    $0x3,%rax
0d2e   52831e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0d33   528323:	48 89 f8             	mov    %rdi,%rax
0d36   528326:	83 e0 07             	and    $0x7,%eax
0d39   528329:	83 c0 01             	add    $0x1,%eax
0d3c   52832c:	38 d0                	cmp    %dl,%al
0d3e   52832e:	7c 08                	jl     528338 <___bpf_prog_run+0xd48>
0d40   528330:	84 d2                	test   %dl,%dl
0d42   528332:	0f 85 28 52 00 00    	jne    52d560 <___bpf_prog_run+0x5f70>
0d48   528338:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0d4c   52833c:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
0d51   528341:	be 02 00 00 00       	mov    $0x2,%esi
0d56   528346:	83 e0 0f             	and    $0xf,%eax
0d59   528349:	48 01 ca             	add    %rcx,%rdx
0d5c   52834c:	49 8d 3c c6          	lea    (%r14,%rax,8),%rdi
0d60   528350:	e8 00 00 00 00       	call   528355 <___bpf_prog_run+0xd65>	528351: R_X86_64_PLT32	bpf_probe_read_kernel-0x4
0d65   528355:	4c 89 f8             	mov    %r15,%rax
0d68   528358:	4c 89 fa             	mov    %r15,%rdx
0d6b   52835b:	48 c1 e8 03          	shr    $0x3,%rax
0d6f   52835f:	83 e2 07             	and    $0x7,%edx
0d72   528362:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0d77   528367:	38 d0                	cmp    %dl,%al
0d79   528369:	7f 08                	jg     528373 <___bpf_prog_run+0xd83>
0d7b   52836b:	84 c0                	test   %al,%al
0d7d   52836d:	0f 85 e0 51 00 00    	jne    52d553 <___bpf_prog_run+0x5f63>
0d83   528373:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0d87   528377:	83 e0 0f             	and    $0xf,%eax
0d8a   52837a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0d8e   52837e:	4c 89 f8             	mov    %r15,%rax
0d91   528381:	48 c1 e8 03          	shr    $0x3,%rax
0d95   528385:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0d9a   52838a:	84 c0                	test   %al,%al
0d9c   52838c:	74 08                	je     528396 <___bpf_prog_run+0xda6>
0d9e   52838e:	3c 01                	cmp    $0x1,%al
0da0   528390:	0f 8e b0 51 00 00    	jle    52d546 <___bpf_prog_run+0x5f56>
0da6   528396:	4c 89 fa             	mov    %r15,%rdx
0da9   528399:	41 0f b7 07          	movzwl (%r15),%eax
0dad   52839d:	48 c1 ea 03          	shr    $0x3,%rdx
0db1   5283a1:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0db6   5283a6:	0f 85 1a 65 00 00    	jne    52e8c6 <___bpf_prog_run+0x72d6>
0dbc   5283ac:	49 89 07             	mov    %rax,(%r15)
0dbf   5283af:	48 83 c3 08          	add    $0x8,%rbx
0dc3   5283b3:	e9 72 f2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0dc8   5283b8:	90                   	nop
0dc9   5283b9:	90                   	nop
0dca   5283ba:	90                   	nop
0dcb   5283bb:	48 83 c3 08          	add    $0x8,%rbx
0dcf   5283bf:	e9 66 f2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0dd4   5283c4:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
0dd8   5283c8:	4c 89 f8             	mov    %r15,%rax
0ddb   5283cb:	4c 89 fa             	mov    %r15,%rdx
0dde   5283ce:	48 c1 e8 03          	shr    $0x3,%rax
0de2   5283d2:	83 e2 07             	and    $0x7,%edx
0de5   5283d5:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0dea   5283da:	38 d0                	cmp    %dl,%al
0dec   5283dc:	7f 08                	jg     5283e6 <___bpf_prog_run+0xdf6>
0dee   5283de:	84 c0                	test   %al,%al
0df0   5283e0:	0f 85 25 57 00 00    	jne    52db0b <___bpf_prog_run+0x651b>
0df6   5283e6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0dfa   5283ea:	c0 e8 04             	shr    $0x4,%al
0dfd   5283ed:	0f b6 c0             	movzbl %al,%eax
0e00   5283f0:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0e04   5283f4:	48 89 c2             	mov    %rax,%rdx
0e07   5283f7:	48 c1 ea 03          	shr    $0x3,%rdx
0e0b   5283fb:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0e10   528400:	0f 85 3a 66 00 00    	jne    52ea40 <___bpf_prog_run+0x7450>
0e16   528406:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0e1a   52840a:	48 8b 08             	mov    (%rax),%rcx
0e1d   52840d:	48 89 f8             	mov    %rdi,%rax
0e20   528410:	48 c1 e8 03          	shr    $0x3,%rax
0e24   528414:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0e29   528419:	48 89 f8             	mov    %rdi,%rax
0e2c   52841c:	83 e0 07             	and    $0x7,%eax
0e2f   52841f:	83 c0 01             	add    $0x1,%eax
0e32   528422:	38 d0                	cmp    %dl,%al
0e34   528424:	7c 08                	jl     52842e <___bpf_prog_run+0xe3e>
0e36   528426:	84 d2                	test   %dl,%dl
0e38   528428:	0f 85 f0 51 00 00    	jne    52d61e <___bpf_prog_run+0x602e>
0e3e   52842e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0e42   528432:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
0e47   528437:	be 01 00 00 00       	mov    $0x1,%esi
0e4c   52843c:	83 e0 0f             	and    $0xf,%eax
0e4f   52843f:	48 01 ca             	add    %rcx,%rdx
0e52   528442:	49 8d 3c c6          	lea    (%r14,%rax,8),%rdi
0e56   528446:	e8 00 00 00 00       	call   52844b <___bpf_prog_run+0xe5b>	528447: R_X86_64_PLT32	bpf_probe_read_kernel-0x4
0e5b   52844b:	4c 89 f8             	mov    %r15,%rax
0e5e   52844e:	4c 89 fa             	mov    %r15,%rdx
0e61   528451:	48 c1 e8 03          	shr    $0x3,%rax
0e65   528455:	83 e2 07             	and    $0x7,%edx
0e68   528458:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0e6d   52845d:	38 d0                	cmp    %dl,%al
0e6f   52845f:	7f 08                	jg     528469 <___bpf_prog_run+0xe79>
0e71   528461:	84 c0                	test   %al,%al
0e73   528463:	0f 85 a8 51 00 00    	jne    52d611 <___bpf_prog_run+0x6021>
0e79   528469:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0e7d   52846d:	83 e0 0f             	and    $0xf,%eax
0e80   528470:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0e84   528474:	4c 89 f8             	mov    %r15,%rax
0e87   528477:	48 c1 e8 03          	shr    $0x3,%rax
0e8b   52847b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0e90   528480:	84 c0                	test   %al,%al
0e92   528482:	74 06                	je     52848a <___bpf_prog_run+0xe9a>
0e94   528484:	0f 8e 7a 51 00 00    	jle    52d604 <___bpf_prog_run+0x6014>
0e9a   52848a:	4c 89 fa             	mov    %r15,%rdx
0e9d   52848d:	41 0f b6 07          	movzbl (%r15),%eax
0ea1   528491:	48 c1 ea 03          	shr    $0x3,%rdx
0ea5   528495:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0eaa   52849a:	0f 85 25 5f 00 00    	jne    52e3c5 <___bpf_prog_run+0x6dd5>
0eb0   5284a0:	49 89 07             	mov    %rax,(%r15)
0eb3   5284a3:	48 83 c3 08          	add    $0x8,%rbx
0eb7   5284a7:	e9 7e f1 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0ebc   5284ac:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
0ec0   5284b0:	48 89 f8             	mov    %rdi,%rax
0ec3   5284b3:	48 c1 e8 03          	shr    $0x3,%rax
0ec7   5284b7:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0ecc   5284bc:	48 89 f8             	mov    %rdi,%rax
0ecf   5284bf:	83 e0 07             	and    $0x7,%eax
0ed2   5284c2:	83 c0 03             	add    $0x3,%eax
0ed5   5284c5:	38 d0                	cmp    %dl,%al
0ed7   5284c7:	7c 08                	jl     5284d1 <___bpf_prog_run+0xee1>
0ed9   5284c9:	84 d2                	test   %dl,%dl
0edb   5284cb:	0f 85 30 56 00 00    	jne    52db01 <___bpf_prog_run+0x6511>
0ee1   5284d1:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0ee5   5284d5:	8b 53 04             	mov    0x4(%rbx),%edx
0ee8   5284d8:	48 89 f8             	mov    %rdi,%rax
0eeb   5284db:	48 89 f9             	mov    %rdi,%rcx
0eee   5284de:	48 c1 e8 03          	shr    $0x3,%rax
0ef2   5284e2:	83 e1 07             	and    $0x7,%ecx
0ef5   5284e5:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0efa   5284ea:	38 c8                	cmp    %cl,%al
0efc   5284ec:	7f 08                	jg     5284f6 <___bpf_prog_run+0xf06>
0efe   5284ee:	84 c0                	test   %al,%al
0f00   5284f0:	0f 85 b7 4f 00 00    	jne    52d4ad <___bpf_prog_run+0x5ebd>
0f06   5284f6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0f0a   5284fa:	83 e0 0f             	and    $0xf,%eax
0f0d   5284fd:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0f11   528501:	4c 89 f8             	mov    %r15,%rax
0f14   528504:	48 c1 e8 03          	shr    $0x3,%rax
0f18   528508:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0f1d   52850d:	0f 85 39 64 00 00    	jne    52e94c <___bpf_prog_run+0x735c>
0f23   528513:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0f27   528517:	49 8b 37             	mov    (%r15),%rsi
0f2a   52851a:	48 89 f8             	mov    %rdi,%rax
0f2d   52851d:	48 c1 e8 03          	shr    $0x3,%rax
0f31   528521:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
0f36   528526:	48 89 f8             	mov    %rdi,%rax
0f39   528529:	83 e0 07             	and    $0x7,%eax
0f3c   52852c:	83 c0 01             	add    $0x1,%eax
0f3f   52852f:	38 c8                	cmp    %cl,%al
0f41   528531:	7c 08                	jl     52853b <___bpf_prog_run+0xf4b>
0f43   528533:	84 c9                	test   %cl,%cl
0f45   528535:	0f 85 5a 4f 00 00    	jne    52d495 <___bpf_prog_run+0x5ea5>
0f4b   52853b:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0f50   528540:	49 01 f7             	add    %rsi,%r15
0f53   528543:	4c 89 f8             	mov    %r15,%rax
0f56   528546:	4c 89 f9             	mov    %r15,%rcx
0f59   528549:	48 c1 e8 03          	shr    $0x3,%rax
0f5d   52854d:	83 e1 07             	and    $0x7,%ecx
0f60   528550:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0f65   528555:	38 c8                	cmp    %cl,%al
0f67   528557:	7f 08                	jg     528561 <___bpf_prog_run+0xf71>
0f69   528559:	84 c0                	test   %al,%al
0f6b   52855b:	0f 85 21 4f 00 00    	jne    52d482 <___bpf_prog_run+0x5e92>
0f71   528561:	41 88 17             	mov    %dl,(%r15)
0f74   528564:	48 83 c3 08          	add    $0x8,%rbx
0f78   528568:	e9 bd f0 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
0f7d   52856d:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0f81   528571:	48 89 f8             	mov    %rdi,%rax
0f84   528574:	48 89 fa             	mov    %rdi,%rdx
0f87   528577:	48 c1 e8 03          	shr    $0x3,%rax
0f8b   52857b:	83 e2 07             	and    $0x7,%edx
0f8e   52857e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0f93   528583:	38 d0                	cmp    %dl,%al
0f95   528585:	7f 08                	jg     52858f <___bpf_prog_run+0xf9f>
0f97   528587:	84 c0                	test   %al,%al
0f99   528589:	0f 85 68 55 00 00    	jne    52daf7 <___bpf_prog_run+0x6507>
0f9f   52858f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0fa3   528593:	83 e0 0f             	and    $0xf,%eax
0fa6   528596:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0faa   52859a:	4c 89 f8             	mov    %r15,%rax
0fad   52859d:	48 c1 e8 03          	shr    $0x3,%rax
0fb1   5285a1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0fb6   5285a6:	0f 85 72 64 00 00    	jne    52ea1e <___bpf_prog_run+0x742e>
0fbc   5285ac:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0fc0   5285b0:	49 8b 17             	mov    (%r15),%rdx
0fc3   5285b3:	c0 e8 04             	shr    $0x4,%al
0fc6   5285b6:	0f b6 c0             	movzbl %al,%eax
0fc9   5285b9:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0fcd   5285bd:	4c 89 f8             	mov    %r15,%rax
0fd0   5285c0:	48 c1 e8 03          	shr    $0x3,%rax
0fd4   5285c4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0fd9   5285c9:	0f 85 d5 62 00 00    	jne    52e8a4 <___bpf_prog_run+0x72b4>
0fdf   5285cf:	49 3b 17             	cmp    (%r15),%rdx
0fe2   5285d2:	0f 8f 79 3d 00 00    	jg     52c351 <___bpf_prog_run+0x4d61>
0fe8   5285d8:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0fec   5285dc:	48 89 f8             	mov    %rdi,%rax
0fef   5285df:	48 c1 e8 03          	shr    $0x3,%rax
0ff3   5285e3:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0ff8   5285e8:	48 89 f8             	mov    %rdi,%rax
0ffb   5285eb:	83 e0 07             	and    $0x7,%eax
0ffe   5285ee:	83 c0 01             	add    $0x1,%eax
1001   5285f1:	38 d0                	cmp    %dl,%al
1003   5285f3:	7c 08                	jl     5285fd <___bpf_prog_run+0x100d>
1005   5285f5:	84 d2                	test   %dl,%dl
1007   5285f7:	0f 85 a4 4f 00 00    	jne    52d5a1 <___bpf_prog_run+0x5fb1>
100d   5285fd:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1012   528602:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1017   528607:	e9 1e f0 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
101c   52860c:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1020   528610:	48 89 f8             	mov    %rdi,%rax
1023   528613:	48 c1 e8 03          	shr    $0x3,%rax
1027   528617:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
102c   52861c:	48 89 f8             	mov    %rdi,%rax
102f   52861f:	83 e0 07             	and    $0x7,%eax
1032   528622:	83 c0 03             	add    $0x3,%eax
1035   528625:	38 d0                	cmp    %dl,%al
1037   528627:	7c 08                	jl     528631 <___bpf_prog_run+0x1041>
1039   528629:	84 d2                	test   %dl,%dl
103b   52862b:	0f 85 bc 54 00 00    	jne    52daed <___bpf_prog_run+0x64fd>
1041   528631:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1045   528635:	8b 53 04             	mov    0x4(%rbx),%edx
1048   528638:	48 89 f8             	mov    %rdi,%rax
104b   52863b:	48 89 f9             	mov    %rdi,%rcx
104e   52863e:	48 c1 e8 03          	shr    $0x3,%rax
1052   528642:	83 e1 07             	and    $0x7,%ecx
1055   528645:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
105a   52864a:	38 c8                	cmp    %cl,%al
105c   52864c:	7f 08                	jg     528656 <___bpf_prog_run+0x1066>
105e   52864e:	84 c0                	test   %al,%al
1060   528650:	0f 85 c1 4e 00 00    	jne    52d517 <___bpf_prog_run+0x5f27>
1066   528656:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
106a   52865a:	83 e0 0f             	and    $0xf,%eax
106d   52865d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1071   528661:	4c 89 f8             	mov    %r15,%rax
1074   528664:	48 c1 e8 03          	shr    $0x3,%rax
1078   528668:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
107d   52866d:	0f 85 68 62 00 00    	jne    52e8db <___bpf_prog_run+0x72eb>
1083   528673:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1087   528677:	49 8b 37             	mov    (%r15),%rsi
108a   52867a:	48 89 f8             	mov    %rdi,%rax
108d   52867d:	48 c1 e8 03          	shr    $0x3,%rax
1091   528681:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
1096   528686:	48 89 f8             	mov    %rdi,%rax
1099   528689:	83 e0 07             	and    $0x7,%eax
109c   52868c:	83 c0 01             	add    $0x1,%eax
109f   52868f:	38 c8                	cmp    %cl,%al
10a1   528691:	7c 08                	jl     52869b <___bpf_prog_run+0x10ab>
10a3   528693:	84 c9                	test   %cl,%cl
10a5   528695:	0f 85 64 4e 00 00    	jne    52d4ff <___bpf_prog_run+0x5f0f>
10ab   52869b:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
10b0   5286a0:	49 01 f7             	add    %rsi,%r15
10b3   5286a3:	4c 89 f8             	mov    %r15,%rax
10b6   5286a6:	48 c1 e8 03          	shr    $0x3,%rax
10ba   5286aa:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
10bf   5286af:	4c 89 f8             	mov    %r15,%rax
10c2   5286b2:	83 e0 07             	and    $0x7,%eax
10c5   5286b5:	83 c0 01             	add    $0x1,%eax
10c8   5286b8:	38 c8                	cmp    %cl,%al
10ca   5286ba:	7c 08                	jl     5286c4 <___bpf_prog_run+0x10d4>
10cc   5286bc:	84 c9                	test   %cl,%cl
10ce   5286be:	0f 85 28 4e 00 00    	jne    52d4ec <___bpf_prog_run+0x5efc>
10d4   5286c4:	66 41 89 17          	mov    %dx,(%r15)
10d8   5286c8:	48 83 c3 08          	add    $0x8,%rbx
10dc   5286cc:	e9 59 ef ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
10e1   5286d1:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
10e5   5286d5:	48 89 f8             	mov    %rdi,%rax
10e8   5286d8:	48 89 fa             	mov    %rdi,%rdx
10eb   5286db:	48 c1 e8 03          	shr    $0x3,%rax
10ef   5286df:	83 e2 07             	and    $0x7,%edx
10f2   5286e2:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
10f7   5286e7:	38 d0                	cmp    %dl,%al
10f9   5286e9:	7f 08                	jg     5286f3 <___bpf_prog_run+0x1103>
10fb   5286eb:	84 c0                	test   %al,%al
10fd   5286ed:	0f 85 f0 53 00 00    	jne    52dae3 <___bpf_prog_run+0x64f3>
1103   5286f3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1107   5286f7:	83 e0 0f             	and    $0xf,%eax
110a   5286fa:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
110e   5286fe:	4c 89 f8             	mov    %r15,%rax
1111   528701:	48 c1 e8 03          	shr    $0x3,%rax
1115   528705:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
111a   52870a:	0f 85 f3 61 00 00    	jne    52e903 <___bpf_prog_run+0x7313>
1120   528710:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1124   528714:	4d 8b 3f             	mov    (%r15),%r15
1127   528717:	48 89 f8             	mov    %rdi,%rax
112a   52871a:	48 c1 e8 03          	shr    $0x3,%rax
112e   52871e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1133   528723:	48 89 f8             	mov    %rdi,%rax
1136   528726:	83 e0 07             	and    $0x7,%eax
1139   528729:	83 c0 03             	add    $0x3,%eax
113c   52872c:	38 d0                	cmp    %dl,%al
113e   52872e:	7c 08                	jl     528738 <___bpf_prog_run+0x1148>
1140   528730:	84 d2                	test   %dl,%dl
1142   528732:	0f 85 21 4d 00 00    	jne    52d459 <___bpf_prog_run+0x5e69>
1148   528738:	48 63 43 04          	movslq 0x4(%rbx),%rax
114c   52873c:	49 39 c7             	cmp    %rax,%r15
114f   52873f:	0f 8f 03 3c 00 00    	jg     52c348 <___bpf_prog_run+0x4d58>
1155   528745:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1159   528749:	48 89 f8             	mov    %rdi,%rax
115c   52874c:	48 c1 e8 03          	shr    $0x3,%rax
1160   528750:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1165   528755:	48 89 f8             	mov    %rdi,%rax
1168   528758:	83 e0 07             	and    $0x7,%eax
116b   52875b:	83 c0 01             	add    $0x1,%eax
116e   52875e:	38 d0                	cmp    %dl,%al
1170   528760:	7c 08                	jl     52876a <___bpf_prog_run+0x117a>
1172   528762:	84 d2                	test   %dl,%dl
1174   528764:	0f 85 e5 4c 00 00    	jne    52d44f <___bpf_prog_run+0x5e5f>
117a   52876a:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
117f   52876f:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1184   528774:	e9 b1 ee ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1189   528779:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
118d   52877d:	48 89 f8             	mov    %rdi,%rax
1190   528780:	48 89 fa             	mov    %rdi,%rdx
1193   528783:	48 c1 e8 03          	shr    $0x3,%rax
1197   528787:	83 e2 07             	and    $0x7,%edx
119a   52878a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
119f   52878f:	38 d0                	cmp    %dl,%al
11a1   528791:	7f 08                	jg     52879b <___bpf_prog_run+0x11ab>
11a3   528793:	84 c0                	test   %al,%al
11a5   528795:	0f 85 3e 53 00 00    	jne    52dad9 <___bpf_prog_run+0x64e9>
11ab   52879b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
11af   52879f:	83 e0 0f             	and    $0xf,%eax
11b2   5287a2:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
11b6   5287a6:	4c 89 f8             	mov    %r15,%rax
11b9   5287a9:	48 c1 e8 03          	shr    $0x3,%rax
11bd   5287ad:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
11c2   5287b2:	0f 85 7a 61 00 00    	jne    52e932 <___bpf_prog_run+0x7342>
11c8   5287b8:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
11cc   5287bc:	4d 8b 3f             	mov    (%r15),%r15
11cf   5287bf:	48 89 f8             	mov    %rdi,%rax
11d2   5287c2:	48 c1 e8 03          	shr    $0x3,%rax
11d6   5287c6:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
11db   5287cb:	48 89 f8             	mov    %rdi,%rax
11de   5287ce:	83 e0 07             	and    $0x7,%eax
11e1   5287d1:	83 c0 03             	add    $0x3,%eax
11e4   5287d4:	38 d0                	cmp    %dl,%al
11e6   5287d6:	7c 08                	jl     5287e0 <___bpf_prog_run+0x11f0>
11e8   5287d8:	84 d2                	test   %dl,%dl
11ea   5287da:	0f 85 65 4c 00 00    	jne    52d445 <___bpf_prog_run+0x5e55>
11f0   5287e0:	48 63 43 04          	movslq 0x4(%rbx),%rax
11f4   5287e4:	49 39 c7             	cmp    %rax,%r15
11f7   5287e7:	0f 8c 52 3b 00 00    	jl     52c33f <___bpf_prog_run+0x4d4f>
11fd   5287ed:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1201   5287f1:	48 89 f8             	mov    %rdi,%rax
1204   5287f4:	48 c1 e8 03          	shr    $0x3,%rax
1208   5287f8:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
120d   5287fd:	48 89 f8             	mov    %rdi,%rax
1210   528800:	83 e0 07             	and    $0x7,%eax
1213   528803:	83 c0 01             	add    $0x1,%eax
1216   528806:	38 d0                	cmp    %dl,%al
1218   528808:	7c 08                	jl     528812 <___bpf_prog_run+0x1222>
121a   52880a:	84 d2                	test   %dl,%dl
121c   52880c:	0f 85 29 4c 00 00    	jne    52d43b <___bpf_prog_run+0x5e4b>
1222   528812:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1227   528817:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
122c   52881c:	e9 09 ee ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1231   528821:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1235   528825:	48 89 f8             	mov    %rdi,%rax
1238   528828:	48 89 fa             	mov    %rdi,%rdx
123b   52882b:	48 c1 e8 03          	shr    $0x3,%rax
123f   52882f:	83 e2 07             	and    $0x7,%edx
1242   528832:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1247   528837:	38 d0                	cmp    %dl,%al
1249   528839:	7f 08                	jg     528843 <___bpf_prog_run+0x1253>
124b   52883b:	84 c0                	test   %al,%al
124d   52883d:	0f 85 8c 52 00 00    	jne    52dacf <___bpf_prog_run+0x64df>
1253   528843:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1257   528847:	83 e0 0f             	and    $0xf,%eax
125a   52884a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
125e   52884e:	4c 89 f8             	mov    %r15,%rax
1261   528851:	48 c1 e8 03          	shr    $0x3,%rax
1265   528855:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
126a   52885a:	0f 85 80 5f 00 00    	jne    52e7e0 <___bpf_prog_run+0x71f0>
1270   528860:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1274   528864:	49 8b 17             	mov    (%r15),%rdx
1277   528867:	c0 e8 04             	shr    $0x4,%al
127a   52886a:	0f b6 c0             	movzbl %al,%eax
127d   52886d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1281   528871:	4c 89 f8             	mov    %r15,%rax
1284   528874:	48 c1 e8 03          	shr    $0x3,%rax
1288   528878:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
128d   52887d:	0f 85 48 5f 00 00    	jne    52e7cb <___bpf_prog_run+0x71db>
1293   528883:	41 39 17             	cmp    %edx,(%r15)
1296   528886:	0f 8f 2c 3a 00 00    	jg     52c2b8 <___bpf_prog_run+0x4cc8>
129c   52888c:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
12a0   528890:	48 89 f8             	mov    %rdi,%rax
12a3   528893:	48 c1 e8 03          	shr    $0x3,%rax
12a7   528897:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
12ac   52889c:	48 89 f8             	mov    %rdi,%rax
12af   52889f:	83 e0 07             	and    $0x7,%eax
12b2   5288a2:	83 c0 01             	add    $0x1,%eax
12b5   5288a5:	38 d0                	cmp    %dl,%al
12b7   5288a7:	7c 08                	jl     5288b1 <___bpf_prog_run+0x12c1>
12b9   5288a9:	84 d2                	test   %dl,%dl
12bb   5288ab:	0f 85 d0 48 00 00    	jne    52d181 <___bpf_prog_run+0x5b91>
12c1   5288b1:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
12c6   5288b6:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
12cb   5288bb:	e9 6a ed ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
12d0   5288c0:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
12d4   5288c4:	48 89 f8             	mov    %rdi,%rax
12d7   5288c7:	48 89 fa             	mov    %rdi,%rdx
12da   5288ca:	48 c1 e8 03          	shr    $0x3,%rax
12de   5288ce:	83 e2 07             	and    $0x7,%edx
12e1   5288d1:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
12e6   5288d6:	38 d0                	cmp    %dl,%al
12e8   5288d8:	7f 08                	jg     5288e2 <___bpf_prog_run+0x12f2>
12ea   5288da:	84 c0                	test   %al,%al
12ec   5288dc:	0f 85 e3 51 00 00    	jne    52dac5 <___bpf_prog_run+0x64d5>
12f2   5288e2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
12f6   5288e6:	83 e0 0f             	and    $0xf,%eax
12f9   5288e9:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
12fd   5288ed:	4c 89 f8             	mov    %r15,%rax
1300   5288f0:	48 c1 e8 03          	shr    $0x3,%rax
1304   5288f4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1309   5288f9:	0f 85 ef 59 00 00    	jne    52e2ee <___bpf_prog_run+0x6cfe>
130f   5288ff:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1313   528903:	49 8b 17             	mov    (%r15),%rdx
1316   528906:	c0 e8 04             	shr    $0x4,%al
1319   528909:	0f b6 c0             	movzbl %al,%eax
131c   52890c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1320   528910:	4c 89 f8             	mov    %r15,%rax
1323   528913:	48 c1 e8 03          	shr    $0x3,%rax
1327   528917:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
132c   52891c:	0f 85 b7 59 00 00    	jne    52e2d9 <___bpf_prog_run+0x6ce9>
1332   528922:	41 39 17             	cmp    %edx,(%r15)
1335   528925:	0f 82 d5 39 00 00    	jb     52c300 <___bpf_prog_run+0x4d10>
133b   52892b:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
133f   52892f:	48 89 f8             	mov    %rdi,%rax
1342   528932:	48 c1 e8 03          	shr    $0x3,%rax
1346   528936:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
134b   52893b:	48 89 f8             	mov    %rdi,%rax
134e   52893e:	83 e0 07             	and    $0x7,%eax
1351   528941:	83 c0 01             	add    $0x1,%eax
1354   528944:	38 d0                	cmp    %dl,%al
1356   528946:	7c 08                	jl     528950 <___bpf_prog_run+0x1360>
1358   528948:	84 d2                	test   %dl,%dl
135a   52894a:	0f 85 87 4a 00 00    	jne    52d3d7 <___bpf_prog_run+0x5de7>
1360   528950:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1365   528955:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
136a   52895a:	e9 cb ec ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
136f   52895f:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1373   528963:	48 89 f8             	mov    %rdi,%rax
1376   528966:	48 89 fa             	mov    %rdi,%rdx
1379   528969:	48 c1 e8 03          	shr    $0x3,%rax
137d   52896d:	83 e2 07             	and    $0x7,%edx
1380   528970:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1385   528975:	38 d0                	cmp    %dl,%al
1387   528977:	7f 08                	jg     528981 <___bpf_prog_run+0x1391>
1389   528979:	84 c0                	test   %al,%al
138b   52897b:	0f 85 3a 51 00 00    	jne    52dabb <___bpf_prog_run+0x64cb>
1391   528981:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1395   528985:	83 e0 0f             	and    $0xf,%eax
1398   528988:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
139c   52898c:	4c 89 f8             	mov    %r15,%rax
139f   52898f:	48 c1 e8 03          	shr    $0x3,%rax
13a3   528993:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
13a8   528998:	0f 85 c2 5e 00 00    	jne    52e860 <___bpf_prog_run+0x7270>
13ae   52899e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
13b2   5289a2:	49 8b 17             	mov    (%r15),%rdx
13b5   5289a5:	c0 e8 04             	shr    $0x4,%al
13b8   5289a8:	0f b6 c0             	movzbl %al,%eax
13bb   5289ab:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
13bf   5289af:	4c 89 f8             	mov    %r15,%rax
13c2   5289b2:	48 c1 e8 03          	shr    $0x3,%rax
13c6   5289b6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
13cb   5289bb:	0f 85 8a 5e 00 00    	jne    52e84b <___bpf_prog_run+0x725b>
13d1   5289c1:	41 39 17             	cmp    %edx,(%r15)
13d4   5289c4:	0f 8d a6 38 00 00    	jge    52c270 <___bpf_prog_run+0x4c80>
13da   5289ca:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
13de   5289ce:	48 89 f8             	mov    %rdi,%rax
13e1   5289d1:	48 c1 e8 03          	shr    $0x3,%rax
13e5   5289d5:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
13ea   5289da:	48 89 f8             	mov    %rdi,%rax
13ed   5289dd:	83 e0 07             	and    $0x7,%eax
13f0   5289e0:	83 c0 01             	add    $0x1,%eax
13f3   5289e3:	38 d0                	cmp    %dl,%al
13f5   5289e5:	7c 08                	jl     5289ef <___bpf_prog_run+0x13ff>
13f7   5289e7:	84 d2                	test   %dl,%dl
13f9   5289e9:	0f 85 1a 47 00 00    	jne    52d109 <___bpf_prog_run+0x5b19>
13ff   5289ef:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1404   5289f4:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1409   5289f9:	e9 2c ec ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
140e   5289fe:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1412   528a02:	48 89 f8             	mov    %rdi,%rax
1415   528a05:	48 89 fa             	mov    %rdi,%rdx
1418   528a08:	48 c1 e8 03          	shr    $0x3,%rax
141c   528a0c:	83 e2 07             	and    $0x7,%edx
141f   528a0f:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1424   528a14:	38 d0                	cmp    %dl,%al
1426   528a16:	7f 08                	jg     528a20 <___bpf_prog_run+0x1430>
1428   528a18:	84 c0                	test   %al,%al
142a   528a1a:	0f 85 91 50 00 00    	jne    52dab1 <___bpf_prog_run+0x64c1>
1430   528a20:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1434   528a24:	83 e0 0f             	and    $0xf,%eax
1437   528a27:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
143b   528a2b:	4c 89 f8             	mov    %r15,%rax
143e   528a2e:	48 c1 e8 03          	shr    $0x3,%rax
1442   528a32:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1447   528a37:	0f 85 0f 58 00 00    	jne    52e24c <___bpf_prog_run+0x6c5c>
144d   528a3d:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1451   528a41:	49 8b 17             	mov    (%r15),%rdx
1454   528a44:	c0 e8 04             	shr    $0x4,%al
1457   528a47:	0f b6 c0             	movzbl %al,%eax
145a   528a4a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
145e   528a4e:	4c 89 f8             	mov    %r15,%rax
1461   528a51:	48 c1 e8 03          	shr    $0x3,%rax
1465   528a55:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
146a   528a5a:	0f 85 d7 57 00 00    	jne    52e237 <___bpf_prog_run+0x6c47>
1470   528a60:	41 39 17             	cmp    %edx,(%r15)
1473   528a63:	0f 86 bb 38 00 00    	jbe    52c324 <___bpf_prog_run+0x4d34>
1479   528a69:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
147d   528a6d:	48 89 f8             	mov    %rdi,%rax
1480   528a70:	48 c1 e8 03          	shr    $0x3,%rax
1484   528a74:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1489   528a79:	48 89 f8             	mov    %rdi,%rax
148c   528a7c:	83 e0 07             	and    $0x7,%eax
148f   528a7f:	83 c0 01             	add    $0x1,%eax
1492   528a82:	38 d0                	cmp    %dl,%al
1494   528a84:	7c 08                	jl     528a8e <___bpf_prog_run+0x149e>
1496   528a86:	84 d2                	test   %dl,%dl
1498   528a88:	0f 85 85 49 00 00    	jne    52d413 <___bpf_prog_run+0x5e23>
149e   528a8e:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
14a3   528a93:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
14a8   528a98:	e9 8d eb ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
14ad   528a9d:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
14b1   528aa1:	48 89 f8             	mov    %rdi,%rax
14b4   528aa4:	48 89 fa             	mov    %rdi,%rdx
14b7   528aa7:	48 c1 e8 03          	shr    $0x3,%rax
14bb   528aab:	83 e2 07             	and    $0x7,%edx
14be   528aae:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
14c3   528ab3:	38 d0                	cmp    %dl,%al
14c5   528ab5:	7f 08                	jg     528abf <___bpf_prog_run+0x14cf>
14c7   528ab7:	84 c0                	test   %al,%al
14c9   528ab9:	0f 85 e8 4f 00 00    	jne    52daa7 <___bpf_prog_run+0x64b7>
14cf   528abf:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
14d3   528ac3:	83 e0 0f             	and    $0xf,%eax
14d6   528ac6:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
14da   528aca:	4c 89 f8             	mov    %r15,%rax
14dd   528acd:	48 c1 e8 03          	shr    $0x3,%rax
14e1   528ad1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
14e6   528ad6:	0f 85 a6 5c 00 00    	jne    52e782 <___bpf_prog_run+0x7192>
14ec   528adc:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
14f0   528ae0:	49 8b 17             	mov    (%r15),%rdx
14f3   528ae3:	c0 e8 04             	shr    $0x4,%al
14f6   528ae6:	0f b6 c0             	movzbl %al,%eax
14f9   528ae9:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
14fd   528aed:	4c 89 f8             	mov    %r15,%rax
1500   528af0:	48 c1 e8 03          	shr    $0x3,%rax
1504   528af4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1509   528af9:	0f 85 6e 5c 00 00    	jne    52e76d <___bpf_prog_run+0x717d>
150f   528aff:	41 39 17             	cmp    %edx,(%r15)
1512   528b02:	0f 8e 8c 37 00 00    	jle    52c294 <___bpf_prog_run+0x4ca4>
1518   528b08:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
151c   528b0c:	48 89 f8             	mov    %rdi,%rax
151f   528b0f:	48 c1 e8 03          	shr    $0x3,%rax
1523   528b13:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1528   528b18:	48 89 f8             	mov    %rdi,%rax
152b   528b1b:	83 e0 07             	and    $0x7,%eax
152e   528b1e:	83 c0 01             	add    $0x1,%eax
1531   528b21:	38 d0                	cmp    %dl,%al
1533   528b23:	7c 08                	jl     528b2d <___bpf_prog_run+0x153d>
1535   528b25:	84 d2                	test   %dl,%dl
1537   528b27:	0f 85 18 46 00 00    	jne    52d145 <___bpf_prog_run+0x5b55>
153d   528b2d:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1542   528b32:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1547   528b37:	e9 ee ea ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
154c   528b3c:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1550   528b40:	48 89 f8             	mov    %rdi,%rax
1553   528b43:	48 89 fa             	mov    %rdi,%rdx
1556   528b46:	48 c1 e8 03          	shr    $0x3,%rax
155a   528b4a:	83 e2 07             	and    $0x7,%edx
155d   528b4d:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1562   528b52:	38 d0                	cmp    %dl,%al
1564   528b54:	7f 08                	jg     528b5e <___bpf_prog_run+0x156e>
1566   528b56:	84 c0                	test   %al,%al
1568   528b58:	0f 85 3f 4f 00 00    	jne    52da9d <___bpf_prog_run+0x64ad>
156e   528b5e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1572   528b62:	83 e0 0f             	and    $0xf,%eax
1575   528b65:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1579   528b69:	4c 89 f8             	mov    %r15,%rax
157c   528b6c:	48 c1 e8 03          	shr    $0x3,%rax
1580   528b70:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1585   528b75:	0f 85 34 52 00 00    	jne    52ddaf <___bpf_prog_run+0x67bf>
158b   528b7b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
158f   528b7f:	49 8b 17             	mov    (%r15),%rdx
1592   528b82:	c0 e8 04             	shr    $0x4,%al
1595   528b85:	0f b6 c0             	movzbl %al,%eax
1598   528b88:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
159c   528b8c:	4c 89 f8             	mov    %r15,%rax
159f   528b8f:	48 c1 e8 03          	shr    $0x3,%rax
15a3   528b93:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
15a8   528b98:	0f 85 fc 51 00 00    	jne    52dd9a <___bpf_prog_run+0x67aa>
15ae   528b9e:	41 39 17             	cmp    %edx,(%r15)
15b1   528ba1:	0f 87 35 37 00 00    	ja     52c2dc <___bpf_prog_run+0x4cec>
15b7   528ba7:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
15bb   528bab:	48 89 f8             	mov    %rdi,%rax
15be   528bae:	48 c1 e8 03          	shr    $0x3,%rax
15c2   528bb2:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
15c7   528bb7:	48 89 f8             	mov    %rdi,%rax
15ca   528bba:	83 e0 07             	and    $0x7,%eax
15cd   528bbd:	83 c0 01             	add    $0x1,%eax
15d0   528bc0:	38 d0                	cmp    %dl,%al
15d2   528bc2:	7c 08                	jl     528bcc <___bpf_prog_run+0x15dc>
15d4   528bc4:	84 d2                	test   %dl,%dl
15d6   528bc6:	0f 85 f1 45 00 00    	jne    52d1bd <___bpf_prog_run+0x5bcd>
15dc   528bcc:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
15e1   528bd1:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
15e6   528bd6:	e9 4f ea ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
15eb   528bdb:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
15ef   528bdf:	48 89 f8             	mov    %rdi,%rax
15f2   528be2:	48 89 fa             	mov    %rdi,%rdx
15f5   528be5:	48 c1 e8 03          	shr    $0x3,%rax
15f9   528be9:	83 e2 07             	and    $0x7,%edx
15fc   528bec:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1601   528bf1:	38 d0                	cmp    %dl,%al
1603   528bf3:	7f 08                	jg     528bfd <___bpf_prog_run+0x160d>
1605   528bf5:	84 c0                	test   %al,%al
1607   528bf7:	0f 85 96 4e 00 00    	jne    52da93 <___bpf_prog_run+0x64a3>
160d   528bfd:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1611   528c01:	83 e0 0f             	and    $0xf,%eax
1614   528c04:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1618   528c08:	4c 89 f8             	mov    %r15,%rax
161b   528c0b:	48 c1 e8 03          	shr    $0x3,%rax
161f   528c0f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1624   528c14:	0f 85 3a 5a 00 00    	jne    52e654 <___bpf_prog_run+0x7064>
162a   528c1a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
162e   528c1e:	49 8b 17             	mov    (%r15),%rdx
1631   528c21:	c0 e8 04             	shr    $0x4,%al
1634   528c24:	0f b6 c0             	movzbl %al,%eax
1637   528c27:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
163b   528c2b:	4c 89 f8             	mov    %r15,%rax
163e   528c2e:	48 c1 e8 03          	shr    $0x3,%rax
1642   528c32:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1647   528c37:	0f 85 02 5a 00 00    	jne    52e63f <___bpf_prog_run+0x704f>
164d   528c3d:	41 85 17             	test   %edx,(%r15)
1650   528c40:	0f 84 06 36 00 00    	je     52c24c <___bpf_prog_run+0x4c5c>
1656   528c46:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
165a   528c4a:	48 89 f8             	mov    %rdi,%rax
165d   528c4d:	48 c1 e8 03          	shr    $0x3,%rax
1661   528c51:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1666   528c56:	48 89 f8             	mov    %rdi,%rax
1669   528c59:	83 e0 07             	and    $0x7,%eax
166c   528c5c:	83 c0 01             	add    $0x1,%eax
166f   528c5f:	38 d0                	cmp    %dl,%al
1671   528c61:	7c 08                	jl     528c6b <___bpf_prog_run+0x167b>
1673   528c63:	84 d2                	test   %dl,%dl
1675   528c65:	0f 85 62 44 00 00    	jne    52d0cd <___bpf_prog_run+0x5add>
167b   528c6b:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1680   528c70:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1685   528c75:	e9 b0 e9 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
168a   528c7a:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
168e   528c7e:	48 89 f8             	mov    %rdi,%rax
1691   528c81:	48 89 fa             	mov    %rdi,%rdx
1694   528c84:	48 c1 e8 03          	shr    $0x3,%rax
1698   528c88:	83 e2 07             	and    $0x7,%edx
169b   528c8b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
16a0   528c90:	38 d0                	cmp    %dl,%al
16a2   528c92:	7f 08                	jg     528c9c <___bpf_prog_run+0x16ac>
16a4   528c94:	84 c0                	test   %al,%al
16a6   528c96:	0f 85 ed 4d 00 00    	jne    52da89 <___bpf_prog_run+0x6499>
16ac   528c9c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
16b0   528ca0:	83 e0 0f             	and    $0xf,%eax
16b3   528ca3:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
16b7   528ca7:	4c 89 f8             	mov    %r15,%rax
16ba   528caa:	48 c1 e8 03          	shr    $0x3,%rax
16be   528cae:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
16c3   528cb3:	0f 85 71 55 00 00    	jne    52e22a <___bpf_prog_run+0x6c3a>
16c9   528cb9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
16cd   528cbd:	49 8b 17             	mov    (%r15),%rdx
16d0   528cc0:	c0 e8 04             	shr    $0x4,%al
16d3   528cc3:	0f b6 c0             	movzbl %al,%eax
16d6   528cc6:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
16da   528cca:	4c 89 f8             	mov    %r15,%rax
16dd   528ccd:	48 c1 e8 03          	shr    $0x3,%rax
16e1   528cd1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
16e6   528cd6:	0f 85 39 55 00 00    	jne    52e215 <___bpf_prog_run+0x6c25>
16ec   528cdc:	41 39 17             	cmp    %edx,(%r15)
16ef   528cdf:	0f 83 51 36 00 00    	jae    52c336 <___bpf_prog_run+0x4d46>
16f5   528ce5:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
16f9   528ce9:	48 89 f8             	mov    %rdi,%rax
16fc   528cec:	48 c1 e8 03          	shr    $0x3,%rax
1700   528cf0:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1705   528cf5:	48 89 f8             	mov    %rdi,%rax
1708   528cf8:	83 e0 07             	and    $0x7,%eax
170b   528cfb:	83 c0 01             	add    $0x1,%eax
170e   528cfe:	38 d0                	cmp    %dl,%al
1710   528d00:	7c 08                	jl     528d0a <___bpf_prog_run+0x171a>
1712   528d02:	84 d2                	test   %dl,%dl
1714   528d04:	0f 85 1d 47 00 00    	jne    52d427 <___bpf_prog_run+0x5e37>
171a   528d0a:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
171f   528d0f:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1724   528d14:	e9 11 e9 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1729   528d19:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
172d   528d1d:	48 89 f8             	mov    %rdi,%rax
1730   528d20:	48 89 fa             	mov    %rdi,%rdx
1733   528d23:	48 c1 e8 03          	shr    $0x3,%rax
1737   528d27:	83 e2 07             	and    $0x7,%edx
173a   528d2a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
173f   528d2f:	38 d0                	cmp    %dl,%al
1741   528d31:	7f 08                	jg     528d3b <___bpf_prog_run+0x174b>
1743   528d33:	84 c0                	test   %al,%al
1745   528d35:	0f 85 44 4d 00 00    	jne    52da7f <___bpf_prog_run+0x648f>
174b   528d3b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
174f   528d3f:	83 e0 0f             	and    $0xf,%eax
1752   528d42:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1756   528d46:	4c 89 f8             	mov    %r15,%rax
1759   528d49:	48 c1 e8 03          	shr    $0x3,%rax
175d   528d4d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1762   528d52:	0f 85 7e 50 00 00    	jne    52ddd6 <___bpf_prog_run+0x67e6>
1768   528d58:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
176c   528d5c:	4d 8b 3f             	mov    (%r15),%r15
176f   528d5f:	48 89 f8             	mov    %rdi,%rax
1772   528d62:	48 c1 e8 03          	shr    $0x3,%rax
1776   528d66:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
177b   528d6b:	48 89 f8             	mov    %rdi,%rax
177e   528d6e:	83 e0 07             	and    $0x7,%eax
1781   528d71:	83 c0 03             	add    $0x3,%eax
1784   528d74:	38 d0                	cmp    %dl,%al
1786   528d76:	7c 08                	jl     528d80 <___bpf_prog_run+0x1790>
1788   528d78:	84 d2                	test   %dl,%dl
178a   528d7a:	0f 85 ed 43 00 00    	jne    52d16d <___bpf_prog_run+0x5b7d>
1790   528d80:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
1794   528d84:	0f 8d 1c 35 00 00    	jge    52c2a6 <___bpf_prog_run+0x4cb6>
179a   528d8a:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
179e   528d8e:	48 89 f8             	mov    %rdi,%rax
17a1   528d91:	48 c1 e8 03          	shr    $0x3,%rax
17a5   528d95:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
17aa   528d9a:	48 89 f8             	mov    %rdi,%rax
17ad   528d9d:	83 e0 07             	and    $0x7,%eax
17b0   528da0:	83 c0 01             	add    $0x1,%eax
17b3   528da3:	38 d0                	cmp    %dl,%al
17b5   528da5:	7c 08                	jl     528daf <___bpf_prog_run+0x17bf>
17b7   528da7:	84 d2                	test   %dl,%dl
17b9   528da9:	0f 85 b4 43 00 00    	jne    52d163 <___bpf_prog_run+0x5b73>
17bf   528daf:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
17c4   528db4:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
17c9   528db9:	e9 6c e8 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
17ce   528dbe:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
17d2   528dc2:	48 89 f8             	mov    %rdi,%rax
17d5   528dc5:	48 89 fa             	mov    %rdi,%rdx
17d8   528dc8:	48 c1 e8 03          	shr    $0x3,%rax
17dc   528dcc:	83 e2 07             	and    $0x7,%edx
17df   528dcf:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
17e4   528dd4:	38 d0                	cmp    %dl,%al
17e6   528dd6:	7f 08                	jg     528de0 <___bpf_prog_run+0x17f0>
17e8   528dd8:	84 c0                	test   %al,%al
17ea   528dda:	0f 85 95 4c 00 00    	jne    52da75 <___bpf_prog_run+0x6485>
17f0   528de0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
17f4   528de4:	83 e0 0f             	and    $0xf,%eax
17f7   528de7:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
17fb   528deb:	4c 89 f8             	mov    %r15,%rax
17fe   528dee:	48 c1 e8 03          	shr    $0x3,%rax
1802   528df2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1807   528df7:	0f 85 11 4f 00 00    	jne    52dd0e <___bpf_prog_run+0x671e>
180d   528dfd:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1811   528e01:	4d 8b 3f             	mov    (%r15),%r15
1814   528e04:	48 89 f8             	mov    %rdi,%rax
1817   528e07:	48 c1 e8 03          	shr    $0x3,%rax
181b   528e0b:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1820   528e10:	48 89 f8             	mov    %rdi,%rax
1823   528e13:	83 e0 07             	and    $0x7,%eax
1826   528e16:	83 c0 03             	add    $0x3,%eax
1829   528e19:	38 d0                	cmp    %dl,%al
182b   528e1b:	7c 08                	jl     528e25 <___bpf_prog_run+0x1835>
182d   528e1d:	84 d2                	test   %dl,%dl
182f   528e1f:	0f 85 9e 45 00 00    	jne    52d3c3 <___bpf_prog_run+0x5dd3>
1835   528e25:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
1839   528e29:	0f 82 bf 34 00 00    	jb     52c2ee <___bpf_prog_run+0x4cfe>
183f   528e2f:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1843   528e33:	48 89 f8             	mov    %rdi,%rax
1846   528e36:	48 c1 e8 03          	shr    $0x3,%rax
184a   528e3a:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
184f   528e3f:	48 89 f8             	mov    %rdi,%rax
1852   528e42:	83 e0 07             	and    $0x7,%eax
1855   528e45:	83 c0 01             	add    $0x1,%eax
1858   528e48:	38 d0                	cmp    %dl,%al
185a   528e4a:	7c 08                	jl     528e54 <___bpf_prog_run+0x1864>
185c   528e4c:	84 d2                	test   %dl,%dl
185e   528e4e:	0f 85 87 43 00 00    	jne    52d1db <___bpf_prog_run+0x5beb>
1864   528e54:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1869   528e59:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
186e   528e5e:	e9 c7 e7 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1873   528e63:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1877   528e67:	48 89 f8             	mov    %rdi,%rax
187a   528e6a:	48 89 fa             	mov    %rdi,%rdx
187d   528e6d:	48 c1 e8 03          	shr    $0x3,%rax
1881   528e71:	83 e2 07             	and    $0x7,%edx
1884   528e74:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1889   528e79:	38 d0                	cmp    %dl,%al
188b   528e7b:	7f 08                	jg     528e85 <___bpf_prog_run+0x1895>
188d   528e7d:	84 c0                	test   %al,%al
188f   528e7f:	0f 85 e6 4b 00 00    	jne    52da6b <___bpf_prog_run+0x647b>
1895   528e85:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1899   528e89:	83 e0 0f             	and    $0xf,%eax
189c   528e8c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
18a0   528e90:	4c 89 f8             	mov    %r15,%rax
18a3   528e93:	48 c1 e8 03          	shr    $0x3,%rax
18a7   528e97:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
18ac   528e9c:	0f 85 4b 59 00 00    	jne    52e7ed <___bpf_prog_run+0x71fd>
18b2   528ea2:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
18b6   528ea6:	4d 8b 3f             	mov    (%r15),%r15
18b9   528ea9:	48 89 f8             	mov    %rdi,%rax
18bc   528eac:	48 c1 e8 03          	shr    $0x3,%rax
18c0   528eb0:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
18c5   528eb5:	48 89 f8             	mov    %rdi,%rax
18c8   528eb8:	83 e0 07             	and    $0x7,%eax
18cb   528ebb:	83 c0 03             	add    $0x3,%eax
18ce   528ebe:	38 d0                	cmp    %dl,%al
18d0   528ec0:	7c 08                	jl     528eca <___bpf_prog_run+0x18da>
18d2   528ec2:	84 d2                	test   %dl,%dl
18d4   528ec4:	0f 85 2b 42 00 00    	jne    52d0f5 <___bpf_prog_run+0x5b05>
18da   528eca:	44 85 7b 04          	test   %r15d,0x4(%rbx)
18de   528ece:	0f 84 8a 33 00 00    	je     52c25e <___bpf_prog_run+0x4c6e>
18e4   528ed4:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
18e8   528ed8:	48 89 f8             	mov    %rdi,%rax
18eb   528edb:	48 c1 e8 03          	shr    $0x3,%rax
18ef   528edf:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
18f4   528ee4:	48 89 f8             	mov    %rdi,%rax
18f7   528ee7:	83 e0 07             	and    $0x7,%eax
18fa   528eea:	83 c0 01             	add    $0x1,%eax
18fd   528eed:	38 d0                	cmp    %dl,%al
18ff   528eef:	7c 08                	jl     528ef9 <___bpf_prog_run+0x1909>
1901   528ef1:	84 d2                	test   %dl,%dl
1903   528ef3:	0f 85 f2 41 00 00    	jne    52d0eb <___bpf_prog_run+0x5afb>
1909   528ef9:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
190e   528efe:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1913   528f03:	e9 22 e7 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1918   528f08:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
191c   528f0c:	48 89 f8             	mov    %rdi,%rax
191f   528f0f:	48 89 fa             	mov    %rdi,%rdx
1922   528f12:	48 c1 e8 03          	shr    $0x3,%rax
1926   528f16:	83 e2 07             	and    $0x7,%edx
1929   528f19:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
192e   528f1e:	38 d0                	cmp    %dl,%al
1930   528f20:	7f 08                	jg     528f2a <___bpf_prog_run+0x193a>
1932   528f22:	84 c0                	test   %al,%al
1934   528f24:	0f 85 37 4b 00 00    	jne    52da61 <___bpf_prog_run+0x6471>
193a   528f2a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
193e   528f2e:	83 e0 0f             	and    $0xf,%eax
1941   528f31:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1945   528f35:	4c 89 f8             	mov    %r15,%rax
1948   528f38:	48 c1 e8 03          	shr    $0x3,%rax
194c   528f3c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1951   528f41:	0f 85 41 53 00 00    	jne    52e288 <___bpf_prog_run+0x6c98>
1957   528f47:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
195b   528f4b:	4d 8b 3f             	mov    (%r15),%r15
195e   528f4e:	48 89 f8             	mov    %rdi,%rax
1961   528f51:	48 c1 e8 03          	shr    $0x3,%rax
1965   528f55:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
196a   528f5a:	48 89 f8             	mov    %rdi,%rax
196d   528f5d:	83 e0 07             	and    $0x7,%eax
1970   528f60:	83 c0 03             	add    $0x3,%eax
1973   528f63:	38 d0                	cmp    %dl,%al
1975   528f65:	7c 08                	jl     528f6f <___bpf_prog_run+0x197f>
1977   528f67:	84 d2                	test   %dl,%dl
1979   528f69:	0f 85 90 44 00 00    	jne    52d3ff <___bpf_prog_run+0x5e0f>
197f   528f6f:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
1983   528f73:	0f 86 99 33 00 00    	jbe    52c312 <___bpf_prog_run+0x4d22>
1989   528f79:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
198d   528f7d:	48 89 f8             	mov    %rdi,%rax
1990   528f80:	48 c1 e8 03          	shr    $0x3,%rax
1994   528f84:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1999   528f89:	48 89 f8             	mov    %rdi,%rax
199c   528f8c:	83 e0 07             	and    $0x7,%eax
199f   528f8f:	83 c0 01             	add    $0x1,%eax
19a2   528f92:	38 d0                	cmp    %dl,%al
19a4   528f94:	7c 08                	jl     528f9e <___bpf_prog_run+0x19ae>
19a6   528f96:	84 d2                	test   %dl,%dl
19a8   528f98:	0f 85 57 44 00 00    	jne    52d3f5 <___bpf_prog_run+0x5e05>
19ae   528f9e:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
19b3   528fa3:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
19b8   528fa8:	e9 7d e6 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
19bd   528fad:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
19c1   528fb1:	48 89 f8             	mov    %rdi,%rax
19c4   528fb4:	48 89 fa             	mov    %rdi,%rdx
19c7   528fb7:	48 c1 e8 03          	shr    $0x3,%rax
19cb   528fbb:	83 e2 07             	and    $0x7,%edx
19ce   528fbe:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
19d3   528fc3:	38 d0                	cmp    %dl,%al
19d5   528fc5:	7f 08                	jg     528fcf <___bpf_prog_run+0x19df>
19d7   528fc7:	84 c0                	test   %al,%al
19d9   528fc9:	0f 85 88 4a 00 00    	jne    52da57 <___bpf_prog_run+0x6467>
19df   528fcf:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
19e3   528fd3:	83 e0 0f             	and    $0xf,%eax
19e6   528fd6:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
19ea   528fda:	4c 89 f8             	mov    %r15,%rax
19ed   528fdd:	48 c1 e8 03          	shr    $0x3,%rax
19f1   528fe1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
19f6   528fe6:	0f 85 a3 57 00 00    	jne    52e78f <___bpf_prog_run+0x719f>
19fc   528fec:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1a00   528ff0:	4d 8b 3f             	mov    (%r15),%r15
1a03   528ff3:	48 89 f8             	mov    %rdi,%rax
1a06   528ff6:	48 c1 e8 03          	shr    $0x3,%rax
1a0a   528ffa:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1a0f   528fff:	48 89 f8             	mov    %rdi,%rax
1a12   529002:	83 e0 07             	and    $0x7,%eax
1a15   529005:	83 c0 03             	add    $0x3,%eax
1a18   529008:	38 d0                	cmp    %dl,%al
1a1a   52900a:	7c 08                	jl     529014 <___bpf_prog_run+0x1a24>
1a1c   52900c:	84 d2                	test   %dl,%dl
1a1e   52900e:	0f 85 1d 41 00 00    	jne    52d131 <___bpf_prog_run+0x5b41>
1a24   529014:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
1a28   529018:	0f 8e 64 32 00 00    	jle    52c282 <___bpf_prog_run+0x4c92>
1a2e   52901e:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1a32   529022:	48 89 f8             	mov    %rdi,%rax
1a35   529025:	48 c1 e8 03          	shr    $0x3,%rax
1a39   529029:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1a3e   52902e:	48 89 f8             	mov    %rdi,%rax
1a41   529031:	83 e0 07             	and    $0x7,%eax
1a44   529034:	83 c0 01             	add    $0x1,%eax
1a47   529037:	38 d0                	cmp    %dl,%al
1a49   529039:	7c 08                	jl     529043 <___bpf_prog_run+0x1a53>
1a4b   52903b:	84 d2                	test   %dl,%dl
1a4d   52903d:	0f 85 e4 40 00 00    	jne    52d127 <___bpf_prog_run+0x5b37>
1a53   529043:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1a58   529048:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1a5d   52904d:	e9 d8 e5 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1a62   529052:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1a66   529056:	48 89 f8             	mov    %rdi,%rax
1a69   529059:	48 89 fa             	mov    %rdi,%rdx
1a6c   52905c:	48 c1 e8 03          	shr    $0x3,%rax
1a70   529060:	83 e2 07             	and    $0x7,%edx
1a73   529063:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1a78   529068:	38 d0                	cmp    %dl,%al
1a7a   52906a:	7f 08                	jg     529074 <___bpf_prog_run+0x1a84>
1a7c   52906c:	84 c0                	test   %al,%al
1a7e   52906e:	0f 85 d9 49 00 00    	jne    52da4d <___bpf_prog_run+0x645d>
1a84   529074:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1a88   529078:	83 e0 0f             	and    $0xf,%eax
1a8b   52907b:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1a8f   52907f:	4c 89 f8             	mov    %r15,%rax
1a92   529082:	48 c1 e8 03          	shr    $0x3,%rax
1a96   529086:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1a9b   52908b:	0f 85 2b 4d 00 00    	jne    52ddbc <___bpf_prog_run+0x67cc>
1aa1   529091:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1aa5   529095:	4d 8b 3f             	mov    (%r15),%r15
1aa8   529098:	48 89 f8             	mov    %rdi,%rax
1aab   52909b:	48 c1 e8 03          	shr    $0x3,%rax
1aaf   52909f:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1ab4   5290a4:	48 89 f8             	mov    %rdi,%rax
1ab7   5290a7:	83 e0 07             	and    $0x7,%eax
1aba   5290aa:	83 c0 03             	add    $0x3,%eax
1abd   5290ad:	38 d0                	cmp    %dl,%al
1abf   5290af:	7c 08                	jl     5290b9 <___bpf_prog_run+0x1ac9>
1ac1   5290b1:	84 d2                	test   %dl,%dl
1ac3   5290b3:	0f 85 f0 40 00 00    	jne    52d1a9 <___bpf_prog_run+0x5bb9>
1ac9   5290b9:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
1acd   5290bd:	0f 83 07 32 00 00    	jae    52c2ca <___bpf_prog_run+0x4cda>
1ad3   5290c3:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1ad7   5290c7:	48 89 f8             	mov    %rdi,%rax
1ada   5290ca:	48 c1 e8 03          	shr    $0x3,%rax
1ade   5290ce:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1ae3   5290d3:	48 89 f8             	mov    %rdi,%rax
1ae6   5290d6:	83 e0 07             	and    $0x7,%eax
1ae9   5290d9:	83 c0 01             	add    $0x1,%eax
1aec   5290dc:	38 d0                	cmp    %dl,%al
1aee   5290de:	7c 08                	jl     5290e8 <___bpf_prog_run+0x1af8>
1af0   5290e0:	84 d2                	test   %dl,%dl
1af2   5290e2:	0f 85 b7 40 00 00    	jne    52d19f <___bpf_prog_run+0x5baf>
1af8   5290e8:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1afd   5290ed:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1b02   5290f2:	e9 33 e5 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1b07   5290f7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1b0b   5290fb:	48 89 f8             	mov    %rdi,%rax
1b0e   5290fe:	48 89 fa             	mov    %rdi,%rdx
1b11   529101:	48 c1 e8 03          	shr    $0x3,%rax
1b15   529105:	83 e2 07             	and    $0x7,%edx
1b18   529108:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1b1d   52910d:	38 d0                	cmp    %dl,%al
1b1f   52910f:	7f 08                	jg     529119 <___bpf_prog_run+0x1b29>
1b21   529111:	84 c0                	test   %al,%al
1b23   529113:	0f 85 2a 49 00 00    	jne    52da43 <___bpf_prog_run+0x6453>
1b29   529119:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1b2d   52911d:	83 e0 0f             	and    $0xf,%eax
1b30   529120:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1b34   529124:	4c 89 f8             	mov    %r15,%rax
1b37   529127:	48 c1 e8 03          	shr    $0x3,%rax
1b3b   52912b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1b40   529130:	0f 85 2b 55 00 00    	jne    52e661 <___bpf_prog_run+0x7071>
1b46   529136:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1b4a   52913a:	4d 8b 3f             	mov    (%r15),%r15
1b4d   52913d:	48 89 f8             	mov    %rdi,%rax
1b50   529140:	48 c1 e8 03          	shr    $0x3,%rax
1b54   529144:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1b59   529149:	48 89 f8             	mov    %rdi,%rax
1b5c   52914c:	83 e0 07             	and    $0x7,%eax
1b5f   52914f:	83 c0 03             	add    $0x3,%eax
1b62   529152:	38 d0                	cmp    %dl,%al
1b64   529154:	7c 08                	jl     52915e <___bpf_prog_run+0x1b6e>
1b66   529156:	84 d2                	test   %dl,%dl
1b68   529158:	0f 85 5b 3f 00 00    	jne    52d0b9 <___bpf_prog_run+0x5ac9>
1b6e   52915e:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
1b72   529162:	0f 87 d2 30 00 00    	ja     52c23a <___bpf_prog_run+0x4c4a>
1b78   529168:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1b7c   52916c:	48 89 f8             	mov    %rdi,%rax
1b7f   52916f:	48 c1 e8 03          	shr    $0x3,%rax
1b83   529173:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1b88   529178:	48 89 f8             	mov    %rdi,%rax
1b8b   52917b:	83 e0 07             	and    $0x7,%eax
1b8e   52917e:	83 c0 01             	add    $0x1,%eax
1b91   529181:	38 d0                	cmp    %dl,%al
1b93   529183:	7c 08                	jl     52918d <___bpf_prog_run+0x1b9d>
1b95   529185:	84 d2                	test   %dl,%dl
1b97   529187:	0f 85 22 3f 00 00    	jne    52d0af <___bpf_prog_run+0x5abf>
1b9d   52918d:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1ba2   529192:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1ba7   529197:	e9 8e e4 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1bac   52919c:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1bb0   5291a0:	48 89 f8             	mov    %rdi,%rax
1bb3   5291a3:	48 89 fa             	mov    %rdi,%rdx
1bb6   5291a6:	48 c1 e8 03          	shr    $0x3,%rax
1bba   5291aa:	83 e2 07             	and    $0x7,%edx
1bbd   5291ad:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1bc2   5291b2:	38 d0                	cmp    %dl,%al
1bc4   5291b4:	7f 08                	jg     5291be <___bpf_prog_run+0x1bce>
1bc6   5291b6:	84 c0                	test   %al,%al
1bc8   5291b8:	0f 85 7b 48 00 00    	jne    52da39 <___bpf_prog_run+0x6449>
1bce   5291be:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1bd2   5291c2:	83 e0 0f             	and    $0xf,%eax
1bd5   5291c5:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1bd9   5291c9:	4c 89 f8             	mov    %r15,%rax
1bdc   5291cc:	48 c1 e8 03          	shr    $0x3,%rax
1be0   5291d0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1be5   5291d5:	0f 85 4a 57 00 00    	jne    52e925 <___bpf_prog_run+0x7335>
1beb   5291db:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1bef   5291df:	4d 8b 3f             	mov    (%r15),%r15
1bf2   5291e2:	48 89 f8             	mov    %rdi,%rax
1bf5   5291e5:	48 c1 e8 03          	shr    $0x3,%rax
1bf9   5291e9:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1bfe   5291ee:	48 89 f8             	mov    %rdi,%rax
1c01   5291f1:	83 e0 07             	and    $0x7,%eax
1c04   5291f4:	83 c0 03             	add    $0x3,%eax
1c07   5291f7:	38 d0                	cmp    %dl,%al
1c09   5291f9:	7c 08                	jl     529203 <___bpf_prog_run+0x1c13>
1c0b   5291fb:	84 d2                	test   %dl,%dl
1c0d   5291fd:	0f 85 2e 42 00 00    	jne    52d431 <___bpf_prog_run+0x5e41>
1c13   529203:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
1c17   529207:	0f 84 22 32 00 00    	je     52c42f <___bpf_prog_run+0x4e3f>
1c1d   52920d:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1c21   529211:	48 89 f8             	mov    %rdi,%rax
1c24   529214:	48 c1 e8 03          	shr    $0x3,%rax
1c28   529218:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1c2d   52921d:	48 89 f8             	mov    %rdi,%rax
1c30   529220:	83 e0 07             	and    $0x7,%eax
1c33   529223:	83 c0 01             	add    $0x1,%eax
1c36   529226:	38 d0                	cmp    %dl,%al
1c38   529228:	7c 08                	jl     529232 <___bpf_prog_run+0x1c42>
1c3a   52922a:	84 d2                	test   %dl,%dl
1c3c   52922c:	0f 85 8a 4a 00 00    	jne    52dcbc <___bpf_prog_run+0x66cc>
1c42   529232:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1c47   529237:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1c4c   52923c:	e9 e9 e3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1c51   529241:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1c55   529245:	48 89 f8             	mov    %rdi,%rax
1c58   529248:	48 89 fa             	mov    %rdi,%rdx
1c5b   52924b:	48 c1 e8 03          	shr    $0x3,%rax
1c5f   52924f:	83 e2 07             	and    $0x7,%edx
1c62   529252:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1c67   529257:	38 d0                	cmp    %dl,%al
1c69   529259:	7f 08                	jg     529263 <___bpf_prog_run+0x1c73>
1c6b   52925b:	84 c0                	test   %al,%al
1c6d   52925d:	0f 85 cc 47 00 00    	jne    52da2f <___bpf_prog_run+0x643f>
1c73   529263:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1c77   529267:	83 e0 0f             	and    $0xf,%eax
1c7a   52926a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1c7e   52926e:	4c 89 f8             	mov    %r15,%rax
1c81   529271:	48 c1 e8 03          	shr    $0x3,%rax
1c85   529275:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1c8a   52927a:	0f 85 3e 55 00 00    	jne    52e7be <___bpf_prog_run+0x71ce>
1c90   529280:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1c94   529284:	49 8b 17             	mov    (%r15),%rdx
1c97   529287:	c0 e8 04             	shr    $0x4,%al
1c9a   52928a:	0f b6 c0             	movzbl %al,%eax
1c9d   52928d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1ca1   529291:	4c 89 f8             	mov    %r15,%rax
1ca4   529294:	48 c1 e8 03          	shr    $0x3,%rax
1ca8   529298:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1cad   52929d:	0f 85 06 55 00 00    	jne    52e7a9 <___bpf_prog_run+0x71b9>
1cb3   5292a3:	49 3b 17             	cmp    (%r15),%rdx
1cb6   5292a6:	0f 8c 03 30 00 00    	jl     52c2af <___bpf_prog_run+0x4cbf>
1cbc   5292ac:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1cc0   5292b0:	48 89 f8             	mov    %rdi,%rax
1cc3   5292b3:	48 c1 e8 03          	shr    $0x3,%rax
1cc7   5292b7:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1ccc   5292bc:	48 89 f8             	mov    %rdi,%rax
1ccf   5292bf:	83 e0 07             	and    $0x7,%eax
1cd2   5292c2:	83 c0 01             	add    $0x1,%eax
1cd5   5292c5:	38 d0                	cmp    %dl,%al
1cd7   5292c7:	7c 08                	jl     5292d1 <___bpf_prog_run+0x1ce1>
1cd9   5292c9:	84 d2                	test   %dl,%dl
1cdb   5292cb:	0f 85 a6 3e 00 00    	jne    52d177 <___bpf_prog_run+0x5b87>
1ce1   5292d1:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1ce6   5292d6:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1ceb   5292db:	e9 4a e3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1cf0   5292e0:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1cf4   5292e4:	48 89 f8             	mov    %rdi,%rax
1cf7   5292e7:	48 89 fa             	mov    %rdi,%rdx
1cfa   5292ea:	48 c1 e8 03          	shr    $0x3,%rax
1cfe   5292ee:	83 e2 07             	and    $0x7,%edx
1d01   5292f1:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1d06   5292f6:	38 d0                	cmp    %dl,%al
1d08   5292f8:	7f 08                	jg     529302 <___bpf_prog_run+0x1d12>
1d0a   5292fa:	84 c0                	test   %al,%al
1d0c   5292fc:	0f 85 23 47 00 00    	jne    52da25 <___bpf_prog_run+0x6435>
1d12   529302:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1d16   529306:	83 e0 0f             	and    $0xf,%eax
1d19   529309:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1d1d   52930d:	4c 89 f8             	mov    %r15,%rax
1d20   529310:	48 c1 e8 03          	shr    $0x3,%rax
1d24   529314:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1d29   529319:	0f 85 ad 4f 00 00    	jne    52e2cc <___bpf_prog_run+0x6cdc>
1d2f   52931f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1d33   529323:	49 8b 17             	mov    (%r15),%rdx
1d36   529326:	c0 e8 04             	shr    $0x4,%al
1d39   529329:	0f b6 c0             	movzbl %al,%eax
1d3c   52932c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1d40   529330:	4c 89 f8             	mov    %r15,%rax
1d43   529333:	48 c1 e8 03          	shr    $0x3,%rax
1d47   529337:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1d4c   52933c:	0f 85 75 4f 00 00    	jne    52e2b7 <___bpf_prog_run+0x6cc7>
1d52   529342:	49 3b 17             	cmp    (%r15),%rdx
1d55   529345:	0f 87 ac 2f 00 00    	ja     52c2f7 <___bpf_prog_run+0x4d07>
1d5b   52934b:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1d5f   52934f:	48 89 f8             	mov    %rdi,%rax
1d62   529352:	48 c1 e8 03          	shr    $0x3,%rax
1d66   529356:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1d6b   52935b:	48 89 f8             	mov    %rdi,%rax
1d6e   52935e:	83 e0 07             	and    $0x7,%eax
1d71   529361:	83 c0 01             	add    $0x1,%eax
1d74   529364:	38 d0                	cmp    %dl,%al
1d76   529366:	7c 08                	jl     529370 <___bpf_prog_run+0x1d80>
1d78   529368:	84 d2                	test   %dl,%dl
1d7a   52936a:	0f 85 5d 40 00 00    	jne    52d3cd <___bpf_prog_run+0x5ddd>
1d80   529370:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1d85   529375:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1d8a   52937a:	e9 ab e2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1d8f   52937f:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1d93   529383:	48 89 f8             	mov    %rdi,%rax
1d96   529386:	48 89 fa             	mov    %rdi,%rdx
1d99   529389:	48 c1 e8 03          	shr    $0x3,%rax
1d9d   52938d:	83 e2 07             	and    $0x7,%edx
1da0   529390:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1da5   529395:	38 d0                	cmp    %dl,%al
1da7   529397:	7f 08                	jg     5293a1 <___bpf_prog_run+0x1db1>
1da9   529399:	84 c0                	test   %al,%al
1dab   52939b:	0f 85 7a 46 00 00    	jne    52da1b <___bpf_prog_run+0x642b>
1db1   5293a1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1db5   5293a5:	83 e0 0f             	and    $0xf,%eax
1db8   5293a8:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1dbc   5293ac:	4c 89 f8             	mov    %r15,%rax
1dbf   5293af:	48 c1 e8 03          	shr    $0x3,%rax
1dc3   5293b3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1dc8   5293b8:	0f 85 80 54 00 00    	jne    52e83e <___bpf_prog_run+0x724e>
1dce   5293be:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1dd2   5293c2:	49 8b 17             	mov    (%r15),%rdx
1dd5   5293c5:	c0 e8 04             	shr    $0x4,%al
1dd8   5293c8:	0f b6 c0             	movzbl %al,%eax
1ddb   5293cb:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1ddf   5293cf:	4c 89 f8             	mov    %r15,%rax
1de2   5293d2:	48 c1 e8 03          	shr    $0x3,%rax
1de6   5293d6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1deb   5293db:	0f 85 48 54 00 00    	jne    52e829 <___bpf_prog_run+0x7239>
1df1   5293e1:	49 3b 17             	cmp    (%r15),%rdx
1df4   5293e4:	0f 8e 7d 2e 00 00    	jle    52c267 <___bpf_prog_run+0x4c77>
1dfa   5293ea:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1dfe   5293ee:	48 89 f8             	mov    %rdi,%rax
1e01   5293f1:	48 c1 e8 03          	shr    $0x3,%rax
1e05   5293f5:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1e0a   5293fa:	48 89 f8             	mov    %rdi,%rax
1e0d   5293fd:	83 e0 07             	and    $0x7,%eax
1e10   529400:	83 c0 01             	add    $0x1,%eax
1e13   529403:	38 d0                	cmp    %dl,%al
1e15   529405:	7c 08                	jl     52940f <___bpf_prog_run+0x1e1f>
1e17   529407:	84 d2                	test   %dl,%dl
1e19   529409:	0f 85 f0 3c 00 00    	jne    52d0ff <___bpf_prog_run+0x5b0f>
1e1f   52940f:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1e24   529414:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1e29   529419:	e9 0c e2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1e2e   52941e:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1e32   529422:	48 89 f8             	mov    %rdi,%rax
1e35   529425:	48 89 fa             	mov    %rdi,%rdx
1e38   529428:	48 c1 e8 03          	shr    $0x3,%rax
1e3c   52942c:	83 e2 07             	and    $0x7,%edx
1e3f   52942f:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1e44   529434:	38 d0                	cmp    %dl,%al
1e46   529436:	7f 08                	jg     529440 <___bpf_prog_run+0x1e50>
1e48   529438:	84 c0                	test   %al,%al
1e4a   52943a:	0f 85 d1 45 00 00    	jne    52da11 <___bpf_prog_run+0x6421>
1e50   529440:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1e54   529444:	83 e0 0f             	and    $0xf,%eax
1e57   529447:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1e5b   52944b:	4c 89 f8             	mov    %r15,%rax
1e5e   52944e:	48 c1 e8 03          	shr    $0x3,%rax
1e62   529452:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1e67   529457:	0f 85 4d 4e 00 00    	jne    52e2aa <___bpf_prog_run+0x6cba>
1e6d   52945d:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1e71   529461:	49 8b 17             	mov    (%r15),%rdx
1e74   529464:	c0 e8 04             	shr    $0x4,%al
1e77   529467:	0f b6 c0             	movzbl %al,%eax
1e7a   52946a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1e7e   52946e:	4c 89 f8             	mov    %r15,%rax
1e81   529471:	48 c1 e8 03          	shr    $0x3,%rax
1e85   529475:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1e8a   52947a:	0f 85 15 4e 00 00    	jne    52e295 <___bpf_prog_run+0x6ca5>
1e90   529480:	49 3b 17             	cmp    (%r15),%rdx
1e93   529483:	0f 83 92 2e 00 00    	jae    52c31b <___bpf_prog_run+0x4d2b>
1e99   529489:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1e9d   52948d:	48 89 f8             	mov    %rdi,%rax
1ea0   529490:	48 c1 e8 03          	shr    $0x3,%rax
1ea4   529494:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1ea9   529499:	48 89 f8             	mov    %rdi,%rax
1eac   52949c:	83 e0 07             	and    $0x7,%eax
1eaf   52949f:	83 c0 01             	add    $0x1,%eax
1eb2   5294a2:	38 d0                	cmp    %dl,%al
1eb4   5294a4:	7c 08                	jl     5294ae <___bpf_prog_run+0x1ebe>
1eb6   5294a6:	84 d2                	test   %dl,%dl
1eb8   5294a8:	0f 85 5b 3f 00 00    	jne    52d409 <___bpf_prog_run+0x5e19>
1ebe   5294ae:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1ec3   5294b3:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1ec8   5294b8:	e9 6d e1 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1ecd   5294bd:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1ed1   5294c1:	48 89 f8             	mov    %rdi,%rax
1ed4   5294c4:	48 89 fa             	mov    %rdi,%rdx
1ed7   5294c7:	48 c1 e8 03          	shr    $0x3,%rax
1edb   5294cb:	83 e2 07             	and    $0x7,%edx
1ede   5294ce:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1ee3   5294d3:	38 d0                	cmp    %dl,%al
1ee5   5294d5:	7f 08                	jg     5294df <___bpf_prog_run+0x1eef>
1ee7   5294d7:	84 c0                	test   %al,%al
1ee9   5294d9:	0f 85 28 45 00 00    	jne    52da07 <___bpf_prog_run+0x6417>
1eef   5294df:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1ef3   5294e3:	83 e0 0f             	and    $0xf,%eax
1ef6   5294e6:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1efa   5294ea:	4c 89 f8             	mov    %r15,%rax
1efd   5294ed:	48 c1 e8 03          	shr    $0x3,%rax
1f01   5294f1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1f06   5294f6:	0f 85 20 53 00 00    	jne    52e81c <___bpf_prog_run+0x722c>
1f0c   5294fc:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1f10   529500:	49 8b 17             	mov    (%r15),%rdx
1f13   529503:	c0 e8 04             	shr    $0x4,%al
1f16   529506:	0f b6 c0             	movzbl %al,%eax
1f19   529509:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1f1d   52950d:	4c 89 f8             	mov    %r15,%rax
1f20   529510:	48 c1 e8 03          	shr    $0x3,%rax
1f24   529514:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1f29   529519:	0f 85 e8 52 00 00    	jne    52e807 <___bpf_prog_run+0x7217>
1f2f   52951f:	49 3b 17             	cmp    (%r15),%rdx
1f32   529522:	0f 8d 63 2d 00 00    	jge    52c28b <___bpf_prog_run+0x4c9b>
1f38   529528:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1f3c   52952c:	48 89 f8             	mov    %rdi,%rax
1f3f   52952f:	48 c1 e8 03          	shr    $0x3,%rax
1f43   529533:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1f48   529538:	48 89 f8             	mov    %rdi,%rax
1f4b   52953b:	83 e0 07             	and    $0x7,%eax
1f4e   52953e:	83 c0 01             	add    $0x1,%eax
1f51   529541:	38 d0                	cmp    %dl,%al
1f53   529543:	7c 08                	jl     52954d <___bpf_prog_run+0x1f5d>
1f55   529545:	84 d2                	test   %dl,%dl
1f57   529547:	0f 85 ee 3b 00 00    	jne    52d13b <___bpf_prog_run+0x5b4b>
1f5d   52954d:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1f62   529552:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1f67   529557:	e9 ce e0 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
1f6c   52955c:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1f70   529560:	48 89 f8             	mov    %rdi,%rax
1f73   529563:	48 89 fa             	mov    %rdi,%rdx
1f76   529566:	48 c1 e8 03          	shr    $0x3,%rax
1f7a   52956a:	83 e2 07             	and    $0x7,%edx
1f7d   52956d:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1f82   529572:	38 d0                	cmp    %dl,%al
1f84   529574:	7f 08                	jg     52957e <___bpf_prog_run+0x1f8e>
1f86   529576:	84 c0                	test   %al,%al
1f88   529578:	0f 85 7f 44 00 00    	jne    52d9fd <___bpf_prog_run+0x640d>
1f8e   52957e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1f92   529582:	83 e0 0f             	and    $0xf,%eax
1f95   529585:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1f99   529589:	4c 89 f8             	mov    %r15,%rax
1f9c   52958c:	48 c1 e8 03          	shr    $0x3,%rax
1fa0   529590:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1fa5   529595:	0f 85 6a 48 00 00    	jne    52de05 <___bpf_prog_run+0x6815>
1fab   52959b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1faf   52959f:	49 8b 17             	mov    (%r15),%rdx
1fb2   5295a2:	c0 e8 04             	shr    $0x4,%al
1fb5   5295a5:	0f b6 c0             	movzbl %al,%eax
1fb8   5295a8:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1fbc   5295ac:	4c 89 f8             	mov    %r15,%rax
1fbf   5295af:	48 c1 e8 03          	shr    $0x3,%rax
1fc3   5295b3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1fc8   5295b8:	0f 85 32 48 00 00    	jne    52ddf0 <___bpf_prog_run+0x6800>
1fce   5295be:	49 3b 17             	cmp    (%r15),%rdx
1fd1   5295c1:	0f 82 0c 2d 00 00    	jb     52c2d3 <___bpf_prog_run+0x4ce3>
1fd7   5295c7:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1fdb   5295cb:	48 89 f8             	mov    %rdi,%rax
1fde   5295ce:	48 c1 e8 03          	shr    $0x3,%rax
1fe2   5295d2:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1fe7   5295d7:	48 89 f8             	mov    %rdi,%rax
1fea   5295da:	83 e0 07             	and    $0x7,%eax
1fed   5295dd:	83 c0 01             	add    $0x1,%eax
1ff0   5295e0:	38 d0                	cmp    %dl,%al
1ff2   5295e2:	7c 08                	jl     5295ec <___bpf_prog_run+0x1ffc>
1ff4   5295e4:	84 d2                	test   %dl,%dl
1ff6   5295e6:	0f 85 c7 3b 00 00    	jne    52d1b3 <___bpf_prog_run+0x5bc3>
1ffc   5295ec:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
2001   5295f1:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
2006   5295f6:	e9 2f e0 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
200b   5295fb:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
200f   5295ff:	48 89 f8             	mov    %rdi,%rax
2012   529602:	48 89 fa             	mov    %rdi,%rdx
2015   529605:	48 c1 e8 03          	shr    $0x3,%rax
2019   529609:	83 e2 07             	and    $0x7,%edx
201c   52960c:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2021   529611:	38 d0                	cmp    %dl,%al
2023   529613:	7f 08                	jg     52961d <___bpf_prog_run+0x202d>
2025   529615:	84 c0                	test   %al,%al
2027   529617:	0f 85 d6 43 00 00    	jne    52d9f3 <___bpf_prog_run+0x6403>
202d   52961d:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2031   529621:	83 e0 0f             	and    $0xf,%eax
2034   529624:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2038   529628:	4c 89 f8             	mov    %r15,%rax
203b   52962b:	48 c1 e8 03          	shr    $0x3,%rax
203f   52962f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2044   529634:	0f 85 78 50 00 00    	jne    52e6b2 <___bpf_prog_run+0x70c2>
204a   52963a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
204e   52963e:	4d 8b 3f             	mov    (%r15),%r15
2051   529641:	c0 e8 04             	shr    $0x4,%al
2054   529644:	0f b6 c0             	movzbl %al,%eax
2057   529647:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
205b   52964b:	48 89 c2             	mov    %rax,%rdx
205e   52964e:	48 c1 ea 03          	shr    $0x3,%rdx
2062   529652:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
2067   529657:	0f 85 40 50 00 00    	jne    52e69d <___bpf_prog_run+0x70ad>
206d   52965d:	4c 23 38             	and    (%rax),%r15
2070   529660:	0f 84 dd 2b 00 00    	je     52c243 <___bpf_prog_run+0x4c53>
2076   529666:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
207a   52966a:	48 89 f8             	mov    %rdi,%rax
207d   52966d:	48 c1 e8 03          	shr    $0x3,%rax
2081   529671:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2086   529676:	48 89 f8             	mov    %rdi,%rax
2089   529679:	83 e0 07             	and    $0x7,%eax
208c   52967c:	83 c0 01             	add    $0x1,%eax
208f   52967f:	38 d0                	cmp    %dl,%al
2091   529681:	7c 08                	jl     52968b <___bpf_prog_run+0x209b>
2093   529683:	84 d2                	test   %dl,%dl
2095   529685:	0f 85 38 3a 00 00    	jne    52d0c3 <___bpf_prog_run+0x5ad3>
209b   52968b:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
20a0   529690:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
20a5   529695:	e9 90 df ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
20aa   52969a:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
20ae   52969e:	48 89 f8             	mov    %rdi,%rax
20b1   5296a1:	48 89 fa             	mov    %rdi,%rdx
20b4   5296a4:	48 c1 e8 03          	shr    $0x3,%rax
20b8   5296a8:	83 e2 07             	and    $0x7,%edx
20bb   5296ab:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
20c0   5296b0:	38 d0                	cmp    %dl,%al
20c2   5296b2:	7f 08                	jg     5296bc <___bpf_prog_run+0x20cc>
20c4   5296b4:	84 c0                	test   %al,%al
20c6   5296b6:	0f 85 2d 43 00 00    	jne    52d9e9 <___bpf_prog_run+0x63f9>
20cc   5296bc:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
20d0   5296c0:	83 e0 0f             	and    $0xf,%eax
20d3   5296c3:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
20d7   5296c7:	4c 89 f8             	mov    %r15,%rax
20da   5296ca:	48 c1 e8 03          	shr    $0x3,%rax
20de   5296ce:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
20e3   5296d3:	0f 85 95 4b 00 00    	jne    52e26e <___bpf_prog_run+0x6c7e>
20e9   5296d9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
20ed   5296dd:	49 8b 17             	mov    (%r15),%rdx
20f0   5296e0:	c0 e8 04             	shr    $0x4,%al
20f3   5296e3:	0f b6 c0             	movzbl %al,%eax
20f6   5296e6:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
20fa   5296ea:	4c 89 f8             	mov    %r15,%rax
20fd   5296ed:	48 c1 e8 03          	shr    $0x3,%rax
2101   5296f1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2106   5296f6:	0f 85 5d 4b 00 00    	jne    52e259 <___bpf_prog_run+0x6c69>
210c   5296fc:	49 3b 17             	cmp    (%r15),%rdx
210f   5296ff:	0f 86 28 2c 00 00    	jbe    52c32d <___bpf_prog_run+0x4d3d>
2115   529705:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
2119   529709:	48 89 f8             	mov    %rdi,%rax
211c   52970c:	48 c1 e8 03          	shr    $0x3,%rax
2120   529710:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2125   529715:	48 89 f8             	mov    %rdi,%rax
2128   529718:	83 e0 07             	and    $0x7,%eax
212b   52971b:	83 c0 01             	add    $0x1,%eax
212e   52971e:	38 d0                	cmp    %dl,%al
2130   529720:	7c 08                	jl     52972a <___bpf_prog_run+0x213a>
2132   529722:	84 d2                	test   %dl,%dl
2134   529724:	0f 85 f3 3c 00 00    	jne    52d41d <___bpf_prog_run+0x5e2d>
213a   52972a:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
213f   52972f:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
2144   529734:	e9 f1 de ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2149   529739:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
214d   52973d:	48 89 f8             	mov    %rdi,%rax
2150   529740:	48 89 fa             	mov    %rdi,%rdx
2153   529743:	48 c1 e8 03          	shr    $0x3,%rax
2157   529747:	83 e2 07             	and    $0x7,%edx
215a   52974a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
215f   52974f:	38 d0                	cmp    %dl,%al
2161   529751:	7f 08                	jg     52975b <___bpf_prog_run+0x216b>
2163   529753:	84 c0                	test   %al,%al
2165   529755:	0f 85 84 42 00 00    	jne    52d9df <___bpf_prog_run+0x63ef>
216b   52975b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
216f   52975f:	83 e0 0f             	and    $0xf,%eax
2172   529762:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2176   529766:	4c 89 f8             	mov    %r15,%rax
2179   529769:	48 c1 e8 03          	shr    $0x3,%rax
217d   52976d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2182   529772:	0f 85 24 50 00 00    	jne    52e79c <___bpf_prog_run+0x71ac>
2188   529778:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
218c   52977c:	4d 8b 3f             	mov    (%r15),%r15
218f   52977f:	48 89 f8             	mov    %rdi,%rax
2192   529782:	48 c1 e8 03          	shr    $0x3,%rax
2196   529786:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
219b   52978b:	48 89 f8             	mov    %rdi,%rax
219e   52978e:	83 e0 07             	and    $0x7,%eax
21a1   529791:	83 c0 03             	add    $0x3,%eax
21a4   529794:	38 d0                	cmp    %dl,%al
21a6   529796:	7c 08                	jl     5297a0 <___bpf_prog_run+0x21b0>
21a8   529798:	84 d2                	test   %dl,%dl
21aa   52979a:	0f 85 b9 39 00 00    	jne    52d159 <___bpf_prog_run+0x5b69>
21b0   5297a0:	48 63 43 04          	movslq 0x4(%rbx),%rax
21b4   5297a4:	49 39 c7             	cmp    %rax,%r15
21b7   5297a7:	0f 8d f0 2a 00 00    	jge    52c29d <___bpf_prog_run+0x4cad>
21bd   5297ad:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
21c1   5297b1:	48 89 f8             	mov    %rdi,%rax
21c4   5297b4:	48 c1 e8 03          	shr    $0x3,%rax
21c8   5297b8:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
21cd   5297bd:	48 89 f8             	mov    %rdi,%rax
21d0   5297c0:	83 e0 07             	and    $0x7,%eax
21d3   5297c3:	83 c0 01             	add    $0x1,%eax
21d6   5297c6:	38 d0                	cmp    %dl,%al
21d8   5297c8:	7c 08                	jl     5297d2 <___bpf_prog_run+0x21e2>
21da   5297ca:	84 d2                	test   %dl,%dl
21dc   5297cc:	0f 85 7d 39 00 00    	jne    52d14f <___bpf_prog_run+0x5b5f>
21e2   5297d2:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
21e7   5297d7:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
21ec   5297dc:	e9 49 de ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
21f1   5297e1:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
21f5   5297e5:	48 89 f8             	mov    %rdi,%rax
21f8   5297e8:	48 89 fa             	mov    %rdi,%rdx
21fb   5297eb:	48 c1 e8 03          	shr    $0x3,%rax
21ff   5297ef:	83 e2 07             	and    $0x7,%edx
2202   5297f2:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2207   5297f7:	38 d0                	cmp    %dl,%al
2209   5297f9:	7f 08                	jg     529803 <___bpf_prog_run+0x2213>
220b   5297fb:	84 c0                	test   %al,%al
220d   5297fd:	0f 85 d2 41 00 00    	jne    52d9d5 <___bpf_prog_run+0x63e5>
2213   529803:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2217   529807:	83 e0 0f             	and    $0xf,%eax
221a   52980a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
221e   52980e:	4c 89 f8             	mov    %r15,%rax
2221   529811:	48 c1 e8 03          	shr    $0x3,%rax
2225   529815:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
222a   52981a:	0f 85 a9 45 00 00    	jne    52ddc9 <___bpf_prog_run+0x67d9>
2230   529820:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2234   529824:	4d 8b 3f             	mov    (%r15),%r15
2237   529827:	48 89 f8             	mov    %rdi,%rax
223a   52982a:	48 c1 e8 03          	shr    $0x3,%rax
223e   52982e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2243   529833:	48 89 f8             	mov    %rdi,%rax
2246   529836:	83 e0 07             	and    $0x7,%eax
2249   529839:	83 c0 03             	add    $0x3,%eax
224c   52983c:	38 d0                	cmp    %dl,%al
224e   52983e:	7c 08                	jl     529848 <___bpf_prog_run+0x2258>
2250   529840:	84 d2                	test   %dl,%dl
2252   529842:	0f 85 89 39 00 00    	jne    52d1d1 <___bpf_prog_run+0x5be1>
2258   529848:	48 63 43 04          	movslq 0x4(%rbx),%rax
225c   52984c:	49 39 c7             	cmp    %rax,%r15
225f   52984f:	0f 82 90 2a 00 00    	jb     52c2e5 <___bpf_prog_run+0x4cf5>
2265   529855:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
2269   529859:	48 89 f8             	mov    %rdi,%rax
226c   52985c:	48 c1 e8 03          	shr    $0x3,%rax
2270   529860:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2275   529865:	48 89 f8             	mov    %rdi,%rax
2278   529868:	83 e0 07             	and    $0x7,%eax
227b   52986b:	83 c0 01             	add    $0x1,%eax
227e   52986e:	38 d0                	cmp    %dl,%al
2280   529870:	7c 08                	jl     52987a <___bpf_prog_run+0x228a>
2282   529872:	84 d2                	test   %dl,%dl
2284   529874:	0f 85 4d 39 00 00    	jne    52d1c7 <___bpf_prog_run+0x5bd7>
228a   52987a:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
228f   52987f:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
2294   529884:	e9 a1 dd ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2299   529889:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
229d   52988d:	48 89 f8             	mov    %rdi,%rax
22a0   529890:	48 89 fa             	mov    %rdi,%rdx
22a3   529893:	48 c1 e8 03          	shr    $0x3,%rax
22a7   529897:	83 e2 07             	and    $0x7,%edx
22aa   52989a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
22af   52989f:	38 d0                	cmp    %dl,%al
22b1   5298a1:	7f 08                	jg     5298ab <___bpf_prog_run+0x22bb>
22b3   5298a3:	84 c0                	test   %al,%al
22b5   5298a5:	0f 85 20 41 00 00    	jne    52d9cb <___bpf_prog_run+0x63db>
22bb   5298ab:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
22bf   5298af:	83 e0 0f             	and    $0xf,%eax
22c2   5298b2:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
22c6   5298b6:	4c 89 f8             	mov    %r15,%rax
22c9   5298b9:	48 c1 e8 03          	shr    $0x3,%rax
22cd   5298bd:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
22d2   5298c2:	0f 85 a6 4d 00 00    	jne    52e66e <___bpf_prog_run+0x707e>
22d8   5298c8:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
22dc   5298cc:	4d 8b 3f             	mov    (%r15),%r15
22df   5298cf:	48 89 f8             	mov    %rdi,%rax
22e2   5298d2:	48 c1 e8 03          	shr    $0x3,%rax
22e6   5298d6:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
22eb   5298db:	48 89 f8             	mov    %rdi,%rax
22ee   5298de:	83 e0 07             	and    $0x7,%eax
22f1   5298e1:	83 c0 03             	add    $0x3,%eax
22f4   5298e4:	38 d0                	cmp    %dl,%al
22f6   5298e6:	7c 08                	jl     5298f0 <___bpf_prog_run+0x2300>
22f8   5298e8:	84 d2                	test   %dl,%dl
22fa   5298ea:	0f 85 f1 37 00 00    	jne    52d0e1 <___bpf_prog_run+0x5af1>
2300   5298f0:	48 63 43 04          	movslq 0x4(%rbx),%rax
2304   5298f4:	4c 85 f8             	test   %r15,%rax
2307   5298f7:	0f 84 58 29 00 00    	je     52c255 <___bpf_prog_run+0x4c65>
230d   5298fd:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
2311   529901:	48 89 f8             	mov    %rdi,%rax
2314   529904:	48 c1 e8 03          	shr    $0x3,%rax
2318   529908:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
231d   52990d:	48 89 f8             	mov    %rdi,%rax
2320   529910:	83 e0 07             	and    $0x7,%eax
2323   529913:	83 c0 01             	add    $0x1,%eax
2326   529916:	38 d0                	cmp    %dl,%al
2328   529918:	7c 08                	jl     529922 <___bpf_prog_run+0x2332>
232a   52991a:	84 d2                	test   %dl,%dl
232c   52991c:	0f 85 b5 37 00 00    	jne    52d0d7 <___bpf_prog_run+0x5ae7>
2332   529922:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
2337   529927:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
233c   52992c:	e9 f9 dc ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2341   529931:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2345   529935:	48 89 f8             	mov    %rdi,%rax
2348   529938:	48 89 fa             	mov    %rdi,%rdx
234b   52993b:	48 c1 e8 03          	shr    $0x3,%rax
234f   52993f:	83 e2 07             	and    $0x7,%edx
2352   529942:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2357   529947:	38 d0                	cmp    %dl,%al
2359   529949:	7f 08                	jg     529953 <___bpf_prog_run+0x2363>
235b   52994b:	84 c0                	test   %al,%al
235d   52994d:	0f 85 6e 40 00 00    	jne    52d9c1 <___bpf_prog_run+0x63d1>
2363   529953:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2367   529957:	83 e0 0f             	and    $0xf,%eax
236a   52995a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
236e   52995e:	4c 89 f8             	mov    %r15,%rax
2371   529961:	48 c1 e8 03          	shr    $0x3,%rax
2375   529965:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
237a   52996a:	0f 85 0b 49 00 00    	jne    52e27b <___bpf_prog_run+0x6c8b>
2380   529970:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2384   529974:	4d 8b 3f             	mov    (%r15),%r15
2387   529977:	48 89 f8             	mov    %rdi,%rax
238a   52997a:	48 c1 e8 03          	shr    $0x3,%rax
238e   52997e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2393   529983:	48 89 f8             	mov    %rdi,%rax
2396   529986:	83 e0 07             	and    $0x7,%eax
2399   529989:	83 c0 03             	add    $0x3,%eax
239c   52998c:	38 d0                	cmp    %dl,%al
239e   52998e:	7c 08                	jl     529998 <___bpf_prog_run+0x23a8>
23a0   529990:	84 d2                	test   %dl,%dl
23a2   529992:	0f 85 53 3a 00 00    	jne    52d3eb <___bpf_prog_run+0x5dfb>
23a8   529998:	48 63 43 04          	movslq 0x4(%rbx),%rax
23ac   52999c:	49 39 c7             	cmp    %rax,%r15
23af   52999f:	0f 86 64 29 00 00    	jbe    52c309 <___bpf_prog_run+0x4d19>
23b5   5299a5:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
23b9   5299a9:	48 89 f8             	mov    %rdi,%rax
23bc   5299ac:	48 c1 e8 03          	shr    $0x3,%rax
23c0   5299b0:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
23c5   5299b5:	48 89 f8             	mov    %rdi,%rax
23c8   5299b8:	83 e0 07             	and    $0x7,%eax
23cb   5299bb:	83 c0 01             	add    $0x1,%eax
23ce   5299be:	38 d0                	cmp    %dl,%al
23d0   5299c0:	7c 08                	jl     5299ca <___bpf_prog_run+0x23da>
23d2   5299c2:	84 d2                	test   %dl,%dl
23d4   5299c4:	0f 85 17 3a 00 00    	jne    52d3e1 <___bpf_prog_run+0x5df1>
23da   5299ca:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
23df   5299cf:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
23e4   5299d4:	e9 51 dc ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
23e9   5299d9:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
23ed   5299dd:	48 89 f8             	mov    %rdi,%rax
23f0   5299e0:	48 89 fa             	mov    %rdi,%rdx
23f3   5299e3:	48 c1 e8 03          	shr    $0x3,%rax
23f7   5299e7:	83 e2 07             	and    $0x7,%edx
23fa   5299ea:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
23ff   5299ef:	38 d0                	cmp    %dl,%al
2401   5299f1:	7f 08                	jg     5299fb <___bpf_prog_run+0x240b>
2403   5299f3:	84 c0                	test   %al,%al
2405   5299f5:	0f 85 bc 3f 00 00    	jne    52d9b7 <___bpf_prog_run+0x63c7>
240b   5299fb:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
240f   5299ff:	83 e0 0f             	and    $0xf,%eax
2412   529a02:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2416   529a06:	4c 89 f8             	mov    %r15,%rax
2419   529a09:	48 c1 e8 03          	shr    $0x3,%rax
241d   529a0d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2422   529a12:	0f 85 e2 4d 00 00    	jne    52e7fa <___bpf_prog_run+0x720a>
2428   529a18:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
242c   529a1c:	4d 8b 3f             	mov    (%r15),%r15
242f   529a1f:	48 89 f8             	mov    %rdi,%rax
2432   529a22:	48 c1 e8 03          	shr    $0x3,%rax
2436   529a26:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
243b   529a2b:	48 89 f8             	mov    %rdi,%rax
243e   529a2e:	83 e0 07             	and    $0x7,%eax
2441   529a31:	83 c0 03             	add    $0x3,%eax
2444   529a34:	38 d0                	cmp    %dl,%al
2446   529a36:	7c 08                	jl     529a40 <___bpf_prog_run+0x2450>
2448   529a38:	84 d2                	test   %dl,%dl
244a   529a3a:	0f 85 dd 36 00 00    	jne    52d11d <___bpf_prog_run+0x5b2d>
2450   529a40:	48 63 43 04          	movslq 0x4(%rbx),%rax
2454   529a44:	49 39 c7             	cmp    %rax,%r15
2457   529a47:	0f 8e 2c 28 00 00    	jle    52c279 <___bpf_prog_run+0x4c89>
245d   529a4d:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
2461   529a51:	48 89 f8             	mov    %rdi,%rax
2464   529a54:	48 c1 e8 03          	shr    $0x3,%rax
2468   529a58:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
246d   529a5d:	48 89 f8             	mov    %rdi,%rax
2470   529a60:	83 e0 07             	and    $0x7,%eax
2473   529a63:	83 c0 01             	add    $0x1,%eax
2476   529a66:	38 d0                	cmp    %dl,%al
2478   529a68:	7c 08                	jl     529a72 <___bpf_prog_run+0x2482>
247a   529a6a:	84 d2                	test   %dl,%dl
247c   529a6c:	0f 85 a1 36 00 00    	jne    52d113 <___bpf_prog_run+0x5b23>
2482   529a72:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
2487   529a77:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
248c   529a7c:	e9 a9 db ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2491   529a81:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2495   529a85:	48 89 f8             	mov    %rdi,%rax
2498   529a88:	48 89 fa             	mov    %rdi,%rdx
249b   529a8b:	48 c1 e8 03          	shr    $0x3,%rax
249f   529a8f:	83 e2 07             	and    $0x7,%edx
24a2   529a92:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
24a7   529a97:	38 d0                	cmp    %dl,%al
24a9   529a99:	7f 08                	jg     529aa3 <___bpf_prog_run+0x24b3>
24ab   529a9b:	84 c0                	test   %al,%al
24ad   529a9d:	0f 85 0a 3f 00 00    	jne    52d9ad <___bpf_prog_run+0x63bd>
24b3   529aa3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
24b7   529aa7:	83 e0 0f             	and    $0xf,%eax
24ba   529aaa:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
24be   529aae:	4c 89 f8             	mov    %r15,%rax
24c1   529ab1:	48 c1 e8 03          	shr    $0x3,%rax
24c5   529ab5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
24ca   529aba:	0f 85 23 43 00 00    	jne    52dde3 <___bpf_prog_run+0x67f3>
24d0   529ac0:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
24d4   529ac4:	4d 8b 3f             	mov    (%r15),%r15
24d7   529ac7:	48 89 f8             	mov    %rdi,%rax
24da   529aca:	48 c1 e8 03          	shr    $0x3,%rax
24de   529ace:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
24e3   529ad3:	48 89 f8             	mov    %rdi,%rax
24e6   529ad6:	83 e0 07             	and    $0x7,%eax
24e9   529ad9:	83 c0 03             	add    $0x3,%eax
24ec   529adc:	38 d0                	cmp    %dl,%al
24ee   529ade:	7c 08                	jl     529ae8 <___bpf_prog_run+0x24f8>
24f0   529ae0:	84 d2                	test   %dl,%dl
24f2   529ae2:	0f 85 ad 36 00 00    	jne    52d195 <___bpf_prog_run+0x5ba5>
24f8   529ae8:	48 63 43 04          	movslq 0x4(%rbx),%rax
24fc   529aec:	49 39 c7             	cmp    %rax,%r15
24ff   529aef:	0f 83 cc 27 00 00    	jae    52c2c1 <___bpf_prog_run+0x4cd1>
2505   529af5:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
2509   529af9:	48 89 f8             	mov    %rdi,%rax
250c   529afc:	48 c1 e8 03          	shr    $0x3,%rax
2510   529b00:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2515   529b05:	48 89 f8             	mov    %rdi,%rax
2518   529b08:	83 e0 07             	and    $0x7,%eax
251b   529b0b:	83 c0 01             	add    $0x1,%eax
251e   529b0e:	38 d0                	cmp    %dl,%al
2520   529b10:	7c 08                	jl     529b1a <___bpf_prog_run+0x252a>
2522   529b12:	84 d2                	test   %dl,%dl
2524   529b14:	0f 85 71 36 00 00    	jne    52d18b <___bpf_prog_run+0x5b9b>
252a   529b1a:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
252f   529b1f:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
2534   529b24:	e9 01 db ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2539   529b29:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
253d   529b2d:	48 89 f8             	mov    %rdi,%rax
2540   529b30:	48 89 fa             	mov    %rdi,%rdx
2543   529b33:	48 c1 e8 03          	shr    $0x3,%rax
2547   529b37:	83 e2 07             	and    $0x7,%edx
254a   529b3a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
254f   529b3f:	38 d0                	cmp    %dl,%al
2551   529b41:	7f 08                	jg     529b4b <___bpf_prog_run+0x255b>
2553   529b43:	84 c0                	test   %al,%al
2555   529b45:	0f 85 58 3e 00 00    	jne    52d9a3 <___bpf_prog_run+0x63b3>
255b   529b4b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
255f   529b4f:	83 e0 0f             	and    $0xf,%eax
2562   529b52:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2566   529b56:	4c 89 f8             	mov    %r15,%rax
2569   529b59:	48 c1 e8 03          	shr    $0x3,%rax
256d   529b5d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2572   529b62:	0f 85 28 4b 00 00    	jne    52e690 <___bpf_prog_run+0x70a0>
2578   529b68:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
257c   529b6c:	4d 8b 3f             	mov    (%r15),%r15
257f   529b6f:	48 89 f8             	mov    %rdi,%rax
2582   529b72:	48 c1 e8 03          	shr    $0x3,%rax
2586   529b76:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
258b   529b7b:	48 89 f8             	mov    %rdi,%rax
258e   529b7e:	83 e0 07             	and    $0x7,%eax
2591   529b81:	83 c0 03             	add    $0x3,%eax
2594   529b84:	38 d0                	cmp    %dl,%al
2596   529b86:	7c 08                	jl     529b90 <___bpf_prog_run+0x25a0>
2598   529b88:	84 d2                	test   %dl,%dl
259a   529b8a:	0f 85 15 35 00 00    	jne    52d0a5 <___bpf_prog_run+0x5ab5>
25a0   529b90:	48 63 43 04          	movslq 0x4(%rbx),%rax
25a4   529b94:	49 39 c7             	cmp    %rax,%r15
25a7   529b97:	0f 87 94 26 00 00    	ja     52c231 <___bpf_prog_run+0x4c41>
25ad   529b9d:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
25b1   529ba1:	48 89 f8             	mov    %rdi,%rax
25b4   529ba4:	48 c1 e8 03          	shr    $0x3,%rax
25b8   529ba8:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
25bd   529bad:	48 89 f8             	mov    %rdi,%rax
25c0   529bb0:	83 e0 07             	and    $0x7,%eax
25c3   529bb3:	83 c0 01             	add    $0x1,%eax
25c6   529bb6:	38 d0                	cmp    %dl,%al
25c8   529bb8:	7c 08                	jl     529bc2 <___bpf_prog_run+0x25d2>
25ca   529bba:	84 d2                	test   %dl,%dl
25cc   529bbc:	0f 85 d9 34 00 00    	jne    52d09b <___bpf_prog_run+0x5aab>
25d2   529bc2:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
25d7   529bc7:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
25dc   529bcc:	e9 59 da ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
25e1   529bd1:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
25e5   529bd5:	48 89 f8             	mov    %rdi,%rax
25e8   529bd8:	48 89 fa             	mov    %rdi,%rdx
25eb   529bdb:	48 c1 e8 03          	shr    $0x3,%rax
25ef   529bdf:	83 e2 07             	and    $0x7,%edx
25f2   529be2:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
25f7   529be7:	38 d0                	cmp    %dl,%al
25f9   529be9:	7f 08                	jg     529bf3 <___bpf_prog_run+0x2603>
25fb   529beb:	84 c0                	test   %al,%al
25fd   529bed:	0f 85 a6 3d 00 00    	jne    52d999 <___bpf_prog_run+0x63a9>
2603   529bf3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2607   529bf7:	83 e0 0f             	and    $0xf,%eax
260a   529bfa:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
260e   529bfe:	4c 89 f8             	mov    %r15,%rax
2611   529c01:	48 c1 e8 03          	shr    $0x3,%rax
2615   529c05:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
261a   529c0a:	0f 85 16 40 00 00    	jne    52dc26 <___bpf_prog_run+0x6636>
2620   529c10:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2624   529c14:	4d 8b 3f             	mov    (%r15),%r15
2627   529c17:	48 89 f8             	mov    %rdi,%rax
262a   529c1a:	48 c1 e8 03          	shr    $0x3,%rax
262e   529c1e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2633   529c23:	48 89 f8             	mov    %rdi,%rax
2636   529c26:	83 e0 07             	and    $0x7,%eax
2639   529c29:	83 c0 03             	add    $0x3,%eax
263c   529c2c:	38 d0                	cmp    %dl,%al
263e   529c2e:	7c 08                	jl     529c38 <___bpf_prog_run+0x2648>
2640   529c30:	84 d2                	test   %dl,%dl
2642   529c32:	0f 85 f4 36 00 00    	jne    52d32c <___bpf_prog_run+0x5d3c>
2648   529c38:	48 63 43 04          	movslq 0x4(%rbx),%rax
264c   529c3c:	49 39 c7             	cmp    %rax,%r15
264f   529c3f:	0f 84 d8 27 00 00    	je     52c41d <___bpf_prog_run+0x4e2d>
2655   529c45:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
2659   529c49:	48 89 f8             	mov    %rdi,%rax
265c   529c4c:	48 c1 e8 03          	shr    $0x3,%rax
2660   529c50:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2665   529c55:	48 89 f8             	mov    %rdi,%rax
2668   529c58:	83 e0 07             	and    $0x7,%eax
266b   529c5b:	83 c0 01             	add    $0x1,%eax
266e   529c5e:	38 d0                	cmp    %dl,%al
2670   529c60:	7c 08                	jl     529c6a <___bpf_prog_run+0x267a>
2672   529c62:	84 d2                	test   %dl,%dl
2674   529c64:	0f 85 5c 40 00 00    	jne    52dcc6 <___bpf_prog_run+0x66d6>
267a   529c6a:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
267f   529c6f:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
2684   529c74:	e9 b1 d9 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2689   529c79:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
268d   529c7d:	48 89 f8             	mov    %rdi,%rax
2690   529c80:	48 89 fa             	mov    %rdi,%rdx
2693   529c83:	48 c1 e8 03          	shr    $0x3,%rax
2697   529c87:	83 e2 07             	and    $0x7,%edx
269a   529c8a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
269f   529c8f:	38 d0                	cmp    %dl,%al
26a1   529c91:	7f 08                	jg     529c9b <___bpf_prog_run+0x26ab>
26a3   529c93:	84 c0                	test   %al,%al
26a5   529c95:	0f 85 f4 3c 00 00    	jne    52d98f <___bpf_prog_run+0x639f>
26ab   529c9b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
26af   529c9f:	83 e0 0f             	and    $0xf,%eax
26b2   529ca2:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
26b6   529ca6:	4c 89 f8             	mov    %r15,%rax
26b9   529ca9:	48 c1 e8 03          	shr    $0x3,%rax
26bd   529cad:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
26c2   529cb2:	0f 85 6c 44 00 00    	jne    52e124 <___bpf_prog_run+0x6b34>
26c8   529cb8:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
26cc   529cbc:	49 8b 17             	mov    (%r15),%rdx
26cf   529cbf:	c0 e8 04             	shr    $0x4,%al
26d2   529cc2:	0f b6 c0             	movzbl %al,%eax
26d5   529cc5:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
26d9   529cc9:	4c 89 f8             	mov    %r15,%rax
26dc   529ccc:	48 c1 e8 03          	shr    $0x3,%rax
26e0   529cd0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
26e5   529cd5:	0f 85 e3 43 00 00    	jne    52e0be <___bpf_prog_run+0x6ace>
26eb   529cdb:	41 39 17             	cmp    %edx,(%r15)
26ee   529cde:	0f 84 f0 27 00 00    	je     52c4d4 <___bpf_prog_run+0x4ee4>
26f4   529ce4:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
26f8   529ce8:	48 89 f8             	mov    %rdi,%rax
26fb   529ceb:	48 c1 e8 03          	shr    $0x3,%rax
26ff   529cef:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2704   529cf4:	48 89 f8             	mov    %rdi,%rax
2707   529cf7:	83 e0 07             	and    $0x7,%eax
270a   529cfa:	83 c0 01             	add    $0x1,%eax
270d   529cfd:	38 d0                	cmp    %dl,%al
270f   529cff:	7c 08                	jl     529d09 <___bpf_prog_run+0x2719>
2711   529d01:	84 d2                	test   %dl,%dl
2713   529d03:	0f 85 ab 3e 00 00    	jne    52dbb4 <___bpf_prog_run+0x65c4>
2719   529d09:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
271e   529d0e:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
2723   529d13:	e9 12 d9 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2728   529d18:	4c 8d 43 01          	lea    0x1(%rbx),%r8
272c   529d1c:	4c 89 c0             	mov    %r8,%rax
272f   529d1f:	4c 89 c2             	mov    %r8,%rdx
2732   529d22:	48 c1 e8 03          	shr    $0x3,%rax
2736   529d26:	83 e2 07             	and    $0x7,%edx
2739   529d29:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
273e   529d2e:	38 d0                	cmp    %dl,%al
2740   529d30:	7f 08                	jg     529d3a <___bpf_prog_run+0x274a>
2742   529d32:	84 c0                	test   %al,%al
2744   529d34:	0f 85 40 3c 00 00    	jne    52d97a <___bpf_prog_run+0x638a>
274a   529d3a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
274e   529d3e:	83 e0 0f             	and    $0xf,%eax
2751   529d41:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2755   529d45:	4c 89 f8             	mov    %r15,%rax
2758   529d48:	48 c1 e8 03          	shr    $0x3,%rax
275c   529d4c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2761   529d51:	0f 85 83 46 00 00    	jne    52e3da <___bpf_prog_run+0x6dea>
2767   529d57:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
276b   529d5b:	49 8b 07             	mov    (%r15),%rax
276e   529d5e:	4c 89 ca             	mov    %r9,%rdx
2771   529d61:	48 c1 ea 03          	shr    $0x3,%rdx
2775   529d65:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
277a   529d6a:	4c 89 ca             	mov    %r9,%rdx
277d   529d6d:	83 e2 07             	and    $0x7,%edx
2780   529d70:	83 c2 03             	add    $0x3,%edx
2783   529d73:	38 ca                	cmp    %cl,%dl
2785   529d75:	7c 08                	jl     529d7f <___bpf_prog_run+0x278f>
2787   529d77:	84 c9                	test   %cl,%cl
2789   529d79:	0f 85 e5 34 00 00    	jne    52d264 <___bpf_prog_run+0x5c74>
278f   529d7f:	8b 4b 04             	mov    0x4(%rbx),%ecx
2792   529d82:	83 f9 1f             	cmp    $0x1f,%ecx
2795   529d85:	0f 87 00 00 00 00    	ja     529d8b <___bpf_prog_run+0x279b>	529d87: R_X86_64_PC32	.text.unlikely+0x7749
279b   529d8b:	4c 89 fa             	mov    %r15,%rdx
279e   529d8e:	d3 e8                	shr    %cl,%eax
27a0   529d90:	48 c1 ea 03          	shr    $0x3,%rdx
27a4   529d94:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
27a9   529d99:	0f 85 86 45 00 00    	jne    52e325 <___bpf_prog_run+0x6d35>
27af   529d9f:	49 89 07             	mov    %rax,(%r15)
27b2   529da2:	48 83 c3 08          	add    $0x8,%rbx
27b6   529da6:	e9 7f d8 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
27bb   529dab:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
27bf   529daf:	48 89 f8             	mov    %rdi,%rax
27c2   529db2:	48 89 fa             	mov    %rdi,%rdx
27c5   529db5:	48 c1 e8 03          	shr    $0x3,%rax
27c9   529db9:	83 e2 07             	and    $0x7,%edx
27cc   529dbc:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
27d1   529dc1:	38 d0                	cmp    %dl,%al
27d3   529dc3:	7f 08                	jg     529dcd <___bpf_prog_run+0x27dd>
27d5   529dc5:	84 c0                	test   %al,%al
27d7   529dc7:	0f 85 a3 3b 00 00    	jne    52d970 <___bpf_prog_run+0x6380>
27dd   529dcd:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
27e1   529dd1:	c0 e8 04             	shr    $0x4,%al
27e4   529dd4:	0f b6 c0             	movzbl %al,%eax
27e7   529dd7:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
27eb   529ddb:	4c 89 f8             	mov    %r15,%rax
27ee   529dde:	48 c1 e8 03          	shr    $0x3,%rax
27f2   529de2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
27f7   529de7:	0f 85 63 43 00 00    	jne    52e150 <___bpf_prog_run+0x6b60>
27fd   529ded:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2801   529df1:	49 8b 0f             	mov    (%r15),%rcx
2804   529df4:	83 e0 0f             	and    $0xf,%eax
2807   529df7:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
280b   529dfb:	4c 89 f8             	mov    %r15,%rax
280e   529dfe:	48 c1 e8 03          	shr    $0x3,%rax
2812   529e02:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2817   529e07:	0f 85 da 3e 00 00    	jne    52dce7 <___bpf_prog_run+0x66f7>
281d   529e0d:	49 8b 07             	mov    (%r15),%rax
2820   529e10:	31 d2                	xor    %edx,%edx
2822   529e12:	48 83 c3 08          	add    $0x8,%rbx
2826   529e16:	48 f7 f1             	div    %rcx
2829   529e19:	49 89 07             	mov    %rax,(%r15)
282c   529e1c:	e9 09 d8 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2831   529e21:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2835   529e25:	48 89 f8             	mov    %rdi,%rax
2838   529e28:	48 89 fa             	mov    %rdi,%rdx
283b   529e2b:	48 c1 e8 03          	shr    $0x3,%rax
283f   529e2f:	83 e2 07             	and    $0x7,%edx
2842   529e32:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2847   529e37:	38 d0                	cmp    %dl,%al
2849   529e39:	7f 08                	jg     529e43 <___bpf_prog_run+0x2853>
284b   529e3b:	84 c0                	test   %al,%al
284d   529e3d:	0f 85 23 3b 00 00    	jne    52d966 <___bpf_prog_run+0x6376>
2853   529e43:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2857   529e47:	83 e0 0f             	and    $0xf,%eax
285a   529e4a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
285e   529e4e:	4c 89 f8             	mov    %r15,%rax
2861   529e51:	48 c1 e8 03          	shr    $0x3,%rax
2865   529e55:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
286a   529e5a:	0f 85 c6 45 00 00    	jne    52e426 <___bpf_prog_run+0x6e36>
2870   529e60:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2874   529e64:	49 8b 07             	mov    (%r15),%rax
2877   529e67:	48 89 fa             	mov    %rdi,%rdx
287a   529e6a:	48 c1 ea 03          	shr    $0x3,%rdx
287e   529e6e:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2883   529e73:	48 89 fa             	mov    %rdi,%rdx
2886   529e76:	83 e2 07             	and    $0x7,%edx
2889   529e79:	83 c2 03             	add    $0x3,%edx
288c   529e7c:	38 ca                	cmp    %cl,%dl
288e   529e7e:	7c 08                	jl     529e88 <___bpf_prog_run+0x2898>
2890   529e80:	84 c9                	test   %cl,%cl
2892   529e82:	0f 85 5c 34 00 00    	jne    52d2e4 <___bpf_prog_run+0x5cf4>
2898   529e88:	0b 43 04             	or     0x4(%rbx),%eax
289b   529e8b:	48 83 c3 08          	add    $0x8,%rbx
289f   529e8f:	49 89 07             	mov    %rax,(%r15)
28a2   529e92:	e9 93 d7 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
28a7   529e97:	41 80 3c 24 00       	cmpb   $0x0,(%r12)
28ac   529e9c:	0f 85 ea 3d 00 00    	jne    52dc8c <___bpf_prog_run+0x669c>
28b2   529ea2:	49 8d 7e 18          	lea    0x18(%r14),%rdi
28b6   529ea6:	49 8b 56 10          	mov    0x10(%r14),%rdx
28ba   529eaa:	48 89 f8             	mov    %rdi,%rax
28bd   529ead:	48 c1 e8 03          	shr    $0x3,%rax
28c1   529eb1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
28c6   529eb6:	0f 85 be 3d 00 00    	jne    52dc7a <___bpf_prog_run+0x668a>
28cc   529ebc:	48 8d 7a 24          	lea    0x24(%rdx),%rdi
28d0   529ec0:	4d 8b 7e 18          	mov    0x18(%r14),%r15
28d4   529ec4:	48 89 f8             	mov    %rdi,%rax
28d7   529ec7:	48 c1 e8 03          	shr    $0x3,%rax
28db   529ecb:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
28e0   529ed0:	48 89 f8             	mov    %rdi,%rax
28e3   529ed3:	83 e0 07             	and    $0x7,%eax
28e6   529ed6:	83 c0 03             	add    $0x3,%eax
28e9   529ed9:	38 c8                	cmp    %cl,%al
28eb   529edb:	7c 08                	jl     529ee5 <___bpf_prog_run+0x28f5>
28ed   529edd:	84 c9                	test   %cl,%cl
28ef   529edf:	0f 85 6f 3a 00 00    	jne    52d954 <___bpf_prog_run+0x6364>
28f5   529ee5:	44 39 7a 24          	cmp    %r15d,0x24(%rdx)
28f9   529ee9:	0f 86 d6 24 00 00    	jbe    52c3c5 <___bpf_prog_run+0x4dd5>
28ff   529eef:	8b 45 d4             	mov    -0x2c(%rbp),%eax
2902   529ef2:	83 f8 20             	cmp    $0x20,%eax
2905   529ef5:	0f 87 ca 24 00 00    	ja     52c3c5 <___bpf_prog_run+0x4dd5>
290b   529efb:	83 c0 01             	add    $0x1,%eax
290e   529efe:	89 45 d4             	mov    %eax,-0x2c(%rbp)
2911   529f01:	44 89 f8             	mov    %r15d,%eax
2914   529f04:	48 8d bc c2 d0 01 00 00 	lea    0x1d0(%rdx,%rax,8),%rdi
291c   529f0c:	48 89 f8             	mov    %rdi,%rax
291f   529f0f:	48 c1 e8 03          	shr    $0x3,%rax
2923   529f13:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2928   529f18:	0f 85 e5 42 00 00    	jne    52e203 <___bpf_prog_run+0x6c13>
292e   529f1e:	44 89 f8             	mov    %r15d,%eax
2931   529f21:	48 83 c0 3a          	add    $0x3a,%rax
2935   529f25:	48 8b 04 c2          	mov    (%rdx,%rax,8),%rax
2939   529f29:	48 85 c0             	test   %rax,%rax
293c   529f2c:	0f 84 93 24 00 00    	je     52c3c5 <___bpf_prog_run+0x4dd5>
2942   529f32:	48 8d 58 48          	lea    0x48(%rax),%rbx
2946   529f36:	e9 ef d6 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
294b   529f3b:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
294f   529f3f:	48 89 f8             	mov    %rdi,%rax
2952   529f42:	48 89 fa             	mov    %rdi,%rdx
2955   529f45:	48 c1 e8 03          	shr    $0x3,%rax
2959   529f49:	83 e2 07             	and    $0x7,%edx
295c   529f4c:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2961   529f51:	38 d0                	cmp    %dl,%al
2963   529f53:	7f 08                	jg     529f5d <___bpf_prog_run+0x296d>
2965   529f55:	84 c0                	test   %al,%al
2967   529f57:	0f 85 ed 39 00 00    	jne    52d94a <___bpf_prog_run+0x635a>
296d   529f5d:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2971   529f61:	83 e0 0f             	and    $0xf,%eax
2974   529f64:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2978   529f68:	4c 89 f8             	mov    %r15,%rax
297b   529f6b:	48 c1 e8 03          	shr    $0x3,%rax
297f   529f6f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2984   529f74:	0f 85 28 3f 00 00    	jne    52dea2 <___bpf_prog_run+0x68b2>
298a   529f7a:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
298e   529f7e:	49 8b 07             	mov    (%r15),%rax
2991   529f81:	48 89 fa             	mov    %rdi,%rdx
2994   529f84:	48 c1 ea 03          	shr    $0x3,%rdx
2998   529f88:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
299d   529f8d:	48 89 fa             	mov    %rdi,%rdx
29a0   529f90:	83 e2 07             	and    $0x7,%edx
29a3   529f93:	83 c2 03             	add    $0x3,%edx
29a6   529f96:	38 ca                	cmp    %cl,%dl
29a8   529f98:	7c 08                	jl     529fa2 <___bpf_prog_run+0x29b2>
29aa   529f9a:	84 c9                	test   %cl,%cl
29ac   529f9c:	0f 85 79 32 00 00    	jne    52d21b <___bpf_prog_run+0x5c2b>
29b2   529fa2:	0f af 43 04          	imul   0x4(%rbx),%eax
29b6   529fa6:	48 83 c3 08          	add    $0x8,%rbx
29ba   529faa:	49 89 07             	mov    %rax,(%r15)
29bd   529fad:	e9 78 d6 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
29c2   529fb2:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
29c6   529fb6:	48 89 f8             	mov    %rdi,%rax
29c9   529fb9:	48 89 fa             	mov    %rdi,%rdx
29cc   529fbc:	48 c1 e8 03          	shr    $0x3,%rax
29d0   529fc0:	83 e2 07             	and    $0x7,%edx
29d3   529fc3:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
29d8   529fc8:	38 d0                	cmp    %dl,%al
29da   529fca:	7f 08                	jg     529fd4 <___bpf_prog_run+0x29e4>
29dc   529fcc:	84 c0                	test   %al,%al
29de   529fce:	0f 85 6c 39 00 00    	jne    52d940 <___bpf_prog_run+0x6350>
29e4   529fd4:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
29e8   529fd8:	c0 e8 04             	shr    $0x4,%al
29eb   529fdb:	0f b6 c0             	movzbl %al,%eax
29ee   529fde:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
29f2   529fe2:	4c 89 f8             	mov    %r15,%rax
29f5   529fe5:	48 c1 e8 03          	shr    $0x3,%rax
29f9   529fe9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
29fe   529fee:	0f 85 e5 3f 00 00    	jne    52dfd9 <___bpf_prog_run+0x69e9>
2a04   529ff4:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2a08   529ff8:	49 8b 0f             	mov    (%r15),%rcx
2a0b   529ffb:	83 e0 0f             	and    $0xf,%eax
2a0e   529ffe:	83 e1 1f             	and    $0x1f,%ecx
2a11   52a001:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2a15   52a005:	4c 89 f8             	mov    %r15,%rax
2a18   52a008:	48 c1 e8 03          	shr    $0x3,%rax
2a1c   52a00c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2a21   52a011:	0f 85 ad 3f 00 00    	jne    52dfc4 <___bpf_prog_run+0x69d4>
2a27   52a017:	41 8b 07             	mov    (%r15),%eax
2a2a   52a01a:	48 83 c3 08          	add    $0x8,%rbx
2a2e   52a01e:	d3 f8                	sar    %cl,%eax
2a30   52a020:	49 89 07             	mov    %rax,(%r15)
2a33   52a023:	e9 02 d6 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2a38   52a028:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2a3c   52a02c:	48 89 f8             	mov    %rdi,%rax
2a3f   52a02f:	48 89 fa             	mov    %rdi,%rdx
2a42   52a032:	48 c1 e8 03          	shr    $0x3,%rax
2a46   52a036:	83 e2 07             	and    $0x7,%edx
2a49   52a039:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2a4e   52a03e:	38 d0                	cmp    %dl,%al
2a50   52a040:	7f 08                	jg     52a04a <___bpf_prog_run+0x2a5a>
2a52   52a042:	84 c0                	test   %al,%al
2a54   52a044:	0f 85 ec 38 00 00    	jne    52d936 <___bpf_prog_run+0x6346>
2a5a   52a04a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2a5e   52a04e:	83 e0 0f             	and    $0xf,%eax
2a61   52a051:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2a65   52a055:	4c 89 f8             	mov    %r15,%rax
2a68   52a058:	48 c1 e8 03          	shr    $0x3,%rax
2a6c   52a05c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2a71   52a061:	0f 85 54 41 00 00    	jne    52e1bb <___bpf_prog_run+0x6bcb>
2a77   52a067:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2a7b   52a06b:	49 8b 07             	mov    (%r15),%rax
2a7e   52a06e:	48 89 fa             	mov    %rdi,%rdx
2a81   52a071:	48 c1 ea 03          	shr    $0x3,%rdx
2a85   52a075:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2a8a   52a07a:	48 89 fa             	mov    %rdi,%rdx
2a8d   52a07d:	83 e2 07             	and    $0x7,%edx
2a90   52a080:	83 c2 03             	add    $0x3,%edx
2a93   52a083:	38 ca                	cmp    %cl,%dl
2a95   52a085:	7c 08                	jl     52a08f <___bpf_prog_run+0x2a9f>
2a97   52a087:	84 c9                	test   %cl,%cl
2a99   52a089:	0f 85 79 32 00 00    	jne    52d308 <___bpf_prog_run+0x5d18>
2a9f   52a08f:	2b 43 04             	sub    0x4(%rbx),%eax
2aa2   52a092:	48 83 c3 08          	add    $0x8,%rbx
2aa6   52a096:	49 89 07             	mov    %rax,(%r15)
2aa9   52a099:	e9 8c d5 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2aae   52a09e:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2ab2   52a0a2:	48 89 f8             	mov    %rdi,%rax
2ab5   52a0a5:	48 89 fa             	mov    %rdi,%rdx
2ab8   52a0a8:	48 c1 e8 03          	shr    $0x3,%rax
2abc   52a0ac:	83 e2 07             	and    $0x7,%edx
2abf   52a0af:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2ac4   52a0b4:	38 d0                	cmp    %dl,%al
2ac6   52a0b6:	7f 08                	jg     52a0c0 <___bpf_prog_run+0x2ad0>
2ac8   52a0b8:	84 c0                	test   %al,%al
2aca   52a0ba:	0f 85 6c 38 00 00    	jne    52d92c <___bpf_prog_run+0x633c>
2ad0   52a0c0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2ad4   52a0c4:	83 e0 0f             	and    $0xf,%eax
2ad7   52a0c7:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2adb   52a0cb:	4c 89 f8             	mov    %r15,%rax
2ade   52a0ce:	48 c1 e8 03          	shr    $0x3,%rax
2ae2   52a0d2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2ae7   52a0d7:	0f 85 18 40 00 00    	jne    52e0f5 <___bpf_prog_run+0x6b05>
2aed   52a0dd:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2af1   52a0e1:	49 8b 17             	mov    (%r15),%rdx
2af4   52a0e4:	c0 e8 04             	shr    $0x4,%al
2af7   52a0e7:	0f b6 c0             	movzbl %al,%eax
2afa   52a0ea:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2afe   52a0ee:	4c 89 f8             	mov    %r15,%rax
2b01   52a0f1:	48 c1 e8 03          	shr    $0x3,%rax
2b05   52a0f5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2b0a   52a0fa:	0f 85 e0 3f 00 00    	jne    52e0e0 <___bpf_prog_run+0x6af0>
2b10   52a100:	41 39 17             	cmp    %edx,(%r15)
2b13   52a103:	0f 84 d4 23 00 00    	je     52c4dd <___bpf_prog_run+0x4eed>
2b19   52a109:	48 83 c3 08          	add    $0x8,%rbx
2b1d   52a10d:	e9 18 d5 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2b22   52a112:	4c 8d 43 01          	lea    0x1(%rbx),%r8
2b26   52a116:	4c 89 c0             	mov    %r8,%rax
2b29   52a119:	4c 89 c2             	mov    %r8,%rdx
2b2c   52a11c:	48 c1 e8 03          	shr    $0x3,%rax
2b30   52a120:	83 e2 07             	and    $0x7,%edx
2b33   52a123:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2b38   52a128:	38 d0                	cmp    %dl,%al
2b3a   52a12a:	7f 08                	jg     52a134 <___bpf_prog_run+0x2b44>
2b3c   52a12c:	84 c0                	test   %al,%al
2b3e   52a12e:	0f 85 e3 37 00 00    	jne    52d917 <___bpf_prog_run+0x6327>
2b44   52a134:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2b48   52a138:	83 e0 0f             	and    $0xf,%eax
2b4b   52a13b:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2b4f   52a13f:	4c 89 f8             	mov    %r15,%rax
2b52   52a142:	48 c1 e8 03          	shr    $0x3,%rax
2b56   52a146:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2b5b   52a14b:	0f 85 e9 41 00 00    	jne    52e33a <___bpf_prog_run+0x6d4a>
2b61   52a151:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
2b65   52a155:	49 8b 07             	mov    (%r15),%rax
2b68   52a158:	4c 89 ca             	mov    %r9,%rdx
2b6b   52a15b:	48 c1 ea 03          	shr    $0x3,%rdx
2b6f   52a15f:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2b74   52a164:	4c 89 ca             	mov    %r9,%rdx
2b77   52a167:	83 e2 07             	and    $0x7,%edx
2b7a   52a16a:	83 c2 03             	add    $0x3,%edx
2b7d   52a16d:	38 ca                	cmp    %cl,%dl
2b7f   52a16f:	7c 08                	jl     52a179 <___bpf_prog_run+0x2b89>
2b81   52a171:	84 c9                	test   %cl,%cl
2b83   52a173:	0f 85 b4 30 00 00    	jne    52d22d <___bpf_prog_run+0x5c3d>
2b89   52a179:	8b 4b 04             	mov    0x4(%rbx),%ecx
2b8c   52a17c:	83 f9 1f             	cmp    $0x1f,%ecx
2b8f   52a17f:	0f 87 00 00 00 00    	ja     52a185 <___bpf_prog_run+0x2b95>	52a181: R_X86_64_PC32	.text.unlikely+0x79cd
2b95   52a185:	4c 89 fa             	mov    %r15,%rdx
2b98   52a188:	d3 e0                	shl    %cl,%eax
2b9a   52a18a:	48 c1 ea 03          	shr    $0x3,%rdx
2b9e   52a18e:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
2ba3   52a193:	0f 85 e7 3c 00 00    	jne    52de80 <___bpf_prog_run+0x6890>
2ba9   52a199:	49 89 07             	mov    %rax,(%r15)
2bac   52a19c:	48 83 c3 08          	add    $0x8,%rbx
2bb0   52a1a0:	e9 85 d4 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2bb5   52a1a5:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2bb9   52a1a9:	48 89 f8             	mov    %rdi,%rax
2bbc   52a1ac:	48 89 fa             	mov    %rdi,%rdx
2bbf   52a1af:	48 c1 e8 03          	shr    $0x3,%rax
2bc3   52a1b3:	83 e2 07             	and    $0x7,%edx
2bc6   52a1b6:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2bcb   52a1bb:	38 d0                	cmp    %dl,%al
2bcd   52a1bd:	7f 08                	jg     52a1c7 <___bpf_prog_run+0x2bd7>
2bcf   52a1bf:	84 c0                	test   %al,%al
2bd1   52a1c1:	0f 85 46 37 00 00    	jne    52d90d <___bpf_prog_run+0x631d>
2bd7   52a1c7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2bdb   52a1cb:	c0 e8 04             	shr    $0x4,%al
2bde   52a1ce:	0f b6 c0             	movzbl %al,%eax
2be1   52a1d1:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2be5   52a1d5:	4c 89 f8             	mov    %r15,%rax
2be8   52a1d8:	48 c1 e8 03          	shr    $0x3,%rax
2bec   52a1dc:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2bf1   52a1e1:	0f 85 ec 43 00 00    	jne    52e5d3 <___bpf_prog_run+0x6fe3>
2bf7   52a1e7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2bfb   52a1eb:	49 8b 0f             	mov    (%r15),%rcx
2bfe   52a1ee:	83 e0 0f             	and    $0xf,%eax
2c01   52a1f1:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2c05   52a1f5:	4c 89 f8             	mov    %r15,%rax
2c08   52a1f8:	48 c1 e8 03          	shr    $0x3,%rax
2c0c   52a1fc:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2c11   52a201:	0f 85 b7 43 00 00    	jne    52e5be <___bpf_prog_run+0x6fce>
2c17   52a207:	49 8b 07             	mov    (%r15),%rax
2c1a   52a20a:	31 d2                	xor    %edx,%edx
2c1c   52a20c:	49 8d 7e 58          	lea    0x58(%r14),%rdi
2c20   52a210:	48 f7 f1             	div    %rcx
2c23   52a213:	48 89 f8             	mov    %rdi,%rax
2c26   52a216:	48 c1 e8 03          	shr    $0x3,%rax
2c2a   52a21a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2c2f   52a21f:	0f 85 87 43 00 00    	jne    52e5ac <___bpf_prog_run+0x6fbc>
2c35   52a225:	49 89 56 58          	mov    %rdx,0x58(%r14)
2c39   52a229:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2c3d   52a22d:	83 e0 0f             	and    $0xf,%eax
2c40   52a230:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2c44   52a234:	4c 89 f8             	mov    %r15,%rax
2c47   52a237:	48 c1 e8 03          	shr    $0x3,%rax
2c4b   52a23b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2c50   52a240:	0f 85 51 43 00 00    	jne    52e597 <___bpf_prog_run+0x6fa7>
2c56   52a246:	49 89 17             	mov    %rdx,(%r15)
2c59   52a249:	48 83 c3 08          	add    $0x8,%rbx
2c5d   52a24d:	e9 d8 d3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2c62   52a252:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2c66   52a256:	48 89 f8             	mov    %rdi,%rax
2c69   52a259:	48 89 fa             	mov    %rdi,%rdx
2c6c   52a25c:	48 c1 e8 03          	shr    $0x3,%rax
2c70   52a260:	83 e2 07             	and    $0x7,%edx
2c73   52a263:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2c78   52a268:	38 d0                	cmp    %dl,%al
2c7a   52a26a:	7f 08                	jg     52a274 <___bpf_prog_run+0x2c84>
2c7c   52a26c:	84 c0                	test   %al,%al
2c7e   52a26e:	0f 85 8f 36 00 00    	jne    52d903 <___bpf_prog_run+0x6313>
2c84   52a274:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2c88   52a278:	83 e0 0f             	and    $0xf,%eax
2c8b   52a27b:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2c8f   52a27f:	4c 89 f8             	mov    %r15,%rax
2c92   52a282:	48 c1 e8 03          	shr    $0x3,%rax
2c96   52a286:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2c9b   52a28b:	0f 85 2d 42 00 00    	jne    52e4be <___bpf_prog_run+0x6ece>
2ca1   52a291:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2ca5   52a295:	49 8b 07             	mov    (%r15),%rax
2ca8   52a298:	48 89 fa             	mov    %rdi,%rdx
2cab   52a29b:	48 c1 ea 03          	shr    $0x3,%rdx
2caf   52a29f:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2cb4   52a2a4:	48 89 fa             	mov    %rdi,%rdx
2cb7   52a2a7:	83 e2 07             	and    $0x7,%edx
2cba   52a2aa:	83 c2 03             	add    $0x3,%edx
2cbd   52a2ad:	38 ca                	cmp    %cl,%dl
2cbf   52a2af:	7c 08                	jl     52a2b9 <___bpf_prog_run+0x2cc9>
2cc1   52a2b1:	84 c9                	test   %cl,%cl
2cc3   52a2b3:	0f 85 07 30 00 00    	jne    52d2c0 <___bpf_prog_run+0x5cd0>
2cc9   52a2b9:	23 43 04             	and    0x4(%rbx),%eax
2ccc   52a2bc:	48 83 c3 08          	add    $0x8,%rbx
2cd0   52a2c0:	49 89 07             	mov    %rax,(%r15)
2cd3   52a2c3:	e9 62 d3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2cd8   52a2c8:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2cdc   52a2cc:	48 89 f8             	mov    %rdi,%rax
2cdf   52a2cf:	48 c1 e8 03          	shr    $0x3,%rax
2ce3   52a2d3:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2ce8   52a2d8:	48 89 f8             	mov    %rdi,%rax
2ceb   52a2db:	83 e0 07             	and    $0x7,%eax
2cee   52a2de:	83 c0 03             	add    $0x3,%eax
2cf1   52a2e1:	38 d0                	cmp    %dl,%al
2cf3   52a2e3:	7c 08                	jl     52a2ed <___bpf_prog_run+0x2cfd>
2cf5   52a2e5:	84 d2                	test   %dl,%dl
2cf7   52a2e7:	0f 85 0c 36 00 00    	jne    52d8f9 <___bpf_prog_run+0x6309>
2cfd   52a2ed:	8b 43 04             	mov    0x4(%rbx),%eax
2d00   52a2f0:	83 f8 20             	cmp    $0x20,%eax
2d03   52a2f3:	0f 84 b7 22 00 00    	je     52c5b0 <___bpf_prog_run+0x4fc0>
2d09   52a2f9:	83 f8 40             	cmp    $0x40,%eax
2d0c   52a2fc:	0f 84 61 22 00 00    	je     52c563 <___bpf_prog_run+0x4f73>
2d12   52a302:	83 f8 10             	cmp    $0x10,%eax
2d15   52a305:	0f 84 06 22 00 00    	je     52c511 <___bpf_prog_run+0x4f21>
2d1b   52a30b:	48 83 c3 08          	add    $0x8,%rbx
2d1f   52a30f:	e9 16 d3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2d24   52a314:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2d28   52a318:	48 89 f8             	mov    %rdi,%rax
2d2b   52a31b:	48 89 fa             	mov    %rdi,%rdx
2d2e   52a31e:	48 c1 e8 03          	shr    $0x3,%rax
2d32   52a322:	83 e2 07             	and    $0x7,%edx
2d35   52a325:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2d3a   52a32a:	38 d0                	cmp    %dl,%al
2d3c   52a32c:	7f 08                	jg     52a336 <___bpf_prog_run+0x2d46>
2d3e   52a32e:	84 c0                	test   %al,%al
2d40   52a330:	0f 85 b9 35 00 00    	jne    52d8ef <___bpf_prog_run+0x62ff>
2d46   52a336:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2d4a   52a33a:	83 e0 0f             	and    $0xf,%eax
2d4d   52a33d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2d51   52a341:	4c 89 f8             	mov    %r15,%rax
2d54   52a344:	48 c1 e8 03          	shr    $0x3,%rax
2d58   52a348:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2d5d   52a34d:	0f 85 42 3b 00 00    	jne    52de95 <___bpf_prog_run+0x68a5>
2d63   52a353:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2d67   52a357:	49 8b 07             	mov    (%r15),%rax
2d6a   52a35a:	48 89 fa             	mov    %rdi,%rdx
2d6d   52a35d:	48 c1 ea 03          	shr    $0x3,%rdx
2d71   52a361:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2d76   52a366:	48 89 fa             	mov    %rdi,%rdx
2d79   52a369:	83 e2 07             	and    $0x7,%edx
2d7c   52a36c:	83 c2 03             	add    $0x3,%edx
2d7f   52a36f:	38 ca                	cmp    %cl,%dl
2d81   52a371:	7c 08                	jl     52a37b <___bpf_prog_run+0x2d8b>
2d83   52a373:	84 c9                	test   %cl,%cl
2d85   52a375:	0f 85 8e 2e 00 00    	jne    52d209 <___bpf_prog_run+0x5c19>
2d8b   52a37b:	33 43 04             	xor    0x4(%rbx),%eax
2d8e   52a37e:	48 83 c3 08          	add    $0x8,%rbx
2d92   52a382:	49 89 07             	mov    %rax,(%r15)
2d95   52a385:	e9 a0 d2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2d9a   52a38a:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2d9e   52a38e:	48 89 f8             	mov    %rdi,%rax
2da1   52a391:	48 c1 e8 03          	shr    $0x3,%rax
2da5   52a395:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2daa   52a39a:	48 89 f8             	mov    %rdi,%rax
2dad   52a39d:	83 e0 07             	and    $0x7,%eax
2db0   52a3a0:	83 c0 03             	add    $0x3,%eax
2db3   52a3a3:	38 d0                	cmp    %dl,%al
2db5   52a3a5:	7c 08                	jl     52a3af <___bpf_prog_run+0x2dbf>
2db7   52a3a7:	84 d2                	test   %dl,%dl
2db9   52a3a9:	0f 85 36 35 00 00    	jne    52d8e5 <___bpf_prog_run+0x62f5>
2dbf   52a3af:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2dc3   52a3b3:	44 8b 7b 04          	mov    0x4(%rbx),%r15d
2dc7   52a3b7:	48 89 f8             	mov    %rdi,%rax
2dca   52a3ba:	48 89 fa             	mov    %rdi,%rdx
2dcd   52a3bd:	48 c1 e8 03          	shr    $0x3,%rax
2dd1   52a3c1:	83 e2 07             	and    $0x7,%edx
2dd4   52a3c4:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2dd9   52a3c9:	38 d0                	cmp    %dl,%al
2ddb   52a3cb:	7f 08                	jg     52a3d5 <___bpf_prog_run+0x2de5>
2ddd   52a3cd:	84 c0                	test   %al,%al
2ddf   52a3cf:	0f 85 6b 2f 00 00    	jne    52d340 <___bpf_prog_run+0x5d50>
2de5   52a3d5:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2de9   52a3d9:	83 e0 0f             	and    $0xf,%eax
2dec   52a3dc:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
2df0   52a3e0:	48 89 c2             	mov    %rax,%rdx
2df3   52a3e3:	48 c1 ea 03          	shr    $0x3,%rdx
2df7   52a3e7:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
2dfc   52a3ec:	0f 85 1d 3d 00 00    	jne    52e10f <___bpf_prog_run+0x6b1f>
2e02   52a3f2:	4c 89 38             	mov    %r15,(%rax)
2e05   52a3f5:	48 83 c3 08          	add    $0x8,%rbx
2e09   52a3f9:	e9 2c d2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2e0e   52a3fe:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2e12   52a402:	48 89 f8             	mov    %rdi,%rax
2e15   52a405:	48 89 fa             	mov    %rdi,%rdx
2e18   52a408:	48 c1 e8 03          	shr    $0x3,%rax
2e1c   52a40c:	83 e2 07             	and    $0x7,%edx
2e1f   52a40f:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2e24   52a414:	38 d0                	cmp    %dl,%al
2e26   52a416:	7f 08                	jg     52a420 <___bpf_prog_run+0x2e30>
2e28   52a418:	84 c0                	test   %al,%al
2e2a   52a41a:	0f 85 bb 34 00 00    	jne    52d8db <___bpf_prog_run+0x62eb>
2e30   52a420:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2e34   52a424:	83 e0 0f             	and    $0xf,%eax
2e37   52a427:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2e3b   52a42b:	4c 89 f8             	mov    %r15,%rax
2e3e   52a42e:	48 c1 e8 03          	shr    $0x3,%rax
2e42   52a432:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2e47   52a437:	0f 85 dc 37 00 00    	jne    52dc19 <___bpf_prog_run+0x6629>
2e4d   52a43d:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2e51   52a441:	49 8b 07             	mov    (%r15),%rax
2e54   52a444:	48 89 fa             	mov    %rdi,%rdx
2e57   52a447:	48 c1 ea 03          	shr    $0x3,%rdx
2e5b   52a44b:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2e60   52a450:	48 89 fa             	mov    %rdi,%rdx
2e63   52a453:	83 e2 07             	and    $0x7,%edx
2e66   52a456:	83 c2 03             	add    $0x3,%edx
2e69   52a459:	38 ca                	cmp    %cl,%dl
2e6b   52a45b:	7c 08                	jl     52a465 <___bpf_prog_run+0x2e75>
2e6d   52a45d:	84 c9                	test   %cl,%cl
2e6f   52a45f:	0f 85 b5 2e 00 00    	jne    52d31a <___bpf_prog_run+0x5d2a>
2e75   52a465:	03 43 04             	add    0x4(%rbx),%eax
2e78   52a468:	48 83 c3 08          	add    $0x8,%rbx
2e7c   52a46c:	49 89 07             	mov    %rax,(%r15)
2e7f   52a46f:	e9 b6 d1 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2e84   52a474:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2e88   52a478:	48 89 f8             	mov    %rdi,%rax
2e8b   52a47b:	48 89 fa             	mov    %rdi,%rdx
2e8e   52a47e:	48 c1 e8 03          	shr    $0x3,%rax
2e92   52a482:	83 e2 07             	and    $0x7,%edx
2e95   52a485:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2e9a   52a48a:	38 d0                	cmp    %dl,%al
2e9c   52a48c:	7f 08                	jg     52a496 <___bpf_prog_run+0x2ea6>
2e9e   52a48e:	84 c0                	test   %al,%al
2ea0   52a490:	0f 85 3b 34 00 00    	jne    52d8d1 <___bpf_prog_run+0x62e1>
2ea6   52a496:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2eaa   52a49a:	83 e0 0f             	and    $0xf,%eax
2ead   52a49d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2eb1   52a4a1:	4c 89 f8             	mov    %r15,%rax
2eb4   52a4a4:	48 c1 e8 03          	shr    $0x3,%rax
2eb8   52a4a8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2ebd   52a4ad:	0f 85 cc 3c 00 00    	jne    52e17f <___bpf_prog_run+0x6b8f>
2ec3   52a4b3:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2ec7   52a4b7:	4d 8b 3f             	mov    (%r15),%r15
2eca   52a4ba:	48 89 f8             	mov    %rdi,%rax
2ecd   52a4bd:	48 c1 e8 03          	shr    $0x3,%rax
2ed1   52a4c1:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2ed6   52a4c6:	48 89 f8             	mov    %rdi,%rax
2ed9   52a4c9:	83 e0 07             	and    $0x7,%eax
2edc   52a4cc:	83 c0 03             	add    $0x3,%eax
2edf   52a4cf:	38 d0                	cmp    %dl,%al
2ee1   52a4d1:	7c 08                	jl     52a4db <___bpf_prog_run+0x2eeb>
2ee3   52a4d3:	84 d2                	test   %dl,%dl
2ee5   52a4d5:	0f 85 cf 31 00 00    	jne    52d6aa <___bpf_prog_run+0x60ba>
2eeb   52a4db:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
2eef   52a4df:	0f 84 53 1f 00 00    	je     52c438 <___bpf_prog_run+0x4e48>
2ef5   52a4e5:	48 83 c3 08          	add    $0x8,%rbx
2ef9   52a4e9:	e9 3c d1 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2efe   52a4ee:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2f02   52a4f2:	48 89 f8             	mov    %rdi,%rax
2f05   52a4f5:	48 89 fa             	mov    %rdi,%rdx
2f08   52a4f8:	48 c1 e8 03          	shr    $0x3,%rax
2f0c   52a4fc:	83 e2 07             	and    $0x7,%edx
2f0f   52a4ff:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2f14   52a504:	38 d0                	cmp    %dl,%al
2f16   52a506:	7f 08                	jg     52a510 <___bpf_prog_run+0x2f20>
2f18   52a508:	84 c0                	test   %al,%al
2f1a   52a50a:	0f 85 b7 33 00 00    	jne    52d8c7 <___bpf_prog_run+0x62d7>
2f20   52a510:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2f24   52a514:	c0 e8 04             	shr    $0x4,%al
2f27   52a517:	0f b6 c0             	movzbl %al,%eax
2f2a   52a51a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2f2e   52a51e:	4c 89 f8             	mov    %r15,%rax
2f31   52a521:	48 c1 e8 03          	shr    $0x3,%rax
2f35   52a525:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2f3a   52a52a:	0f 85 3f 3e 00 00    	jne    52e36f <___bpf_prog_run+0x6d7f>
2f40   52a530:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2f44   52a534:	49 8b 0f             	mov    (%r15),%rcx
2f47   52a537:	83 e0 0f             	and    $0xf,%eax
2f4a   52a53a:	83 e1 1f             	and    $0x1f,%ecx
2f4d   52a53d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2f51   52a541:	4c 89 f8             	mov    %r15,%rax
2f54   52a544:	48 c1 e8 03          	shr    $0x3,%rax
2f58   52a548:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2f5d   52a54d:	0f 85 09 3e 00 00    	jne    52e35c <___bpf_prog_run+0x6d6c>
2f63   52a553:	41 8b 07             	mov    (%r15),%eax
2f66   52a556:	48 83 c3 08          	add    $0x8,%rbx
2f6a   52a55a:	d3 e8                	shr    %cl,%eax
2f6c   52a55c:	49 89 07             	mov    %rax,(%r15)
2f6f   52a55f:	e9 c6 d0 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
2f74   52a564:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2f78   52a568:	48 89 f8             	mov    %rdi,%rax
2f7b   52a56b:	48 c1 e8 03          	shr    $0x3,%rax
2f7f   52a56f:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2f84   52a574:	48 89 f8             	mov    %rdi,%rax
2f87   52a577:	83 e0 07             	and    $0x7,%eax
2f8a   52a57a:	83 c0 03             	add    $0x3,%eax
2f8d   52a57d:	38 d0                	cmp    %dl,%al
2f8f   52a57f:	7c 08                	jl     52a589 <___bpf_prog_run+0x2f99>
2f91   52a581:	84 d2                	test   %dl,%dl
2f93   52a583:	0f 85 34 33 00 00    	jne    52d8bd <___bpf_prog_run+0x62cd>
2f99   52a589:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2f9d   52a58d:	48 63 4b 04          	movslq 0x4(%rbx),%rcx
2fa1   52a591:	48 89 f8             	mov    %rdi,%rax
2fa4   52a594:	48 89 fa             	mov    %rdi,%rdx
2fa7   52a597:	48 c1 e8 03          	shr    $0x3,%rax
2fab   52a59b:	83 e2 07             	and    $0x7,%edx
2fae   52a59e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2fb3   52a5a3:	38 d0                	cmp    %dl,%al
2fb5   52a5a5:	7f 08                	jg     52a5af <___bpf_prog_run+0x2fbf>
2fb7   52a5a7:	84 c0                	test   %al,%al
2fb9   52a5a9:	0f 85 f0 2d 00 00    	jne    52d39f <___bpf_prog_run+0x5daf>
2fbf   52a5af:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2fc3   52a5b3:	83 e0 0f             	and    $0xf,%eax
2fc6   52a5b6:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2fca   52a5ba:	4c 89 f8             	mov    %r15,%rax
2fcd   52a5bd:	48 c1 e8 03          	shr    $0x3,%rax
2fd1   52a5c1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2fd6   52a5c6:	0f 85 d7 3d 00 00    	jne    52e3a3 <___bpf_prog_run+0x6db3>
2fdc   52a5cc:	49 8b 07             	mov    (%r15),%rax
2fdf   52a5cf:	31 d2                	xor    %edx,%edx
2fe1   52a5d1:	49 8d 7e 58          	lea    0x58(%r14),%rdi
2fe5   52a5d5:	48 f7 f1             	div    %rcx
2fe8   52a5d8:	48 89 f8             	mov    %rdi,%rax
2feb   52a5db:	48 c1 e8 03          	shr    $0x3,%rax
2fef   52a5df:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2ff4   52a5e4:	0f 85 a7 3d 00 00    	jne    52e391 <___bpf_prog_run+0x6da1>
2ffa   52a5ea:	49 89 56 58          	mov    %rdx,0x58(%r14)
2ffe   52a5ee:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3002   52a5f2:	83 e0 0f             	and    $0xf,%eax
3005   52a5f5:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3009   52a5f9:	4c 89 f8             	mov    %r15,%rax
300c   52a5fc:	48 c1 e8 03          	shr    $0x3,%rax
3010   52a600:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3015   52a605:	0f 85 ff 3f 00 00    	jne    52e60a <___bpf_prog_run+0x701a>
301b   52a60b:	49 89 17             	mov    %rdx,(%r15)
301e   52a60e:	48 83 c3 08          	add    $0x8,%rbx
3022   52a612:	e9 13 d0 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3027   52a617:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
302b   52a61b:	48 89 f8             	mov    %rdi,%rax
302e   52a61e:	48 89 fa             	mov    %rdi,%rdx
3031   52a621:	48 c1 e8 03          	shr    $0x3,%rax
3035   52a625:	83 e2 07             	and    $0x7,%edx
3038   52a628:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
303d   52a62d:	38 d0                	cmp    %dl,%al
303f   52a62f:	7f 08                	jg     52a639 <___bpf_prog_run+0x3049>
3041   52a631:	84 c0                	test   %al,%al
3043   52a633:	0f 85 7a 32 00 00    	jne    52d8b3 <___bpf_prog_run+0x62c3>
3049   52a639:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
304d   52a63d:	83 e0 0f             	and    $0xf,%eax
3050   52a640:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3054   52a644:	4c 89 f8             	mov    %r15,%rax
3057   52a647:	48 c1 e8 03          	shr    $0x3,%rax
305b   52a64b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3060   52a650:	0f 85 4e 3e 00 00    	jne    52e4a4 <___bpf_prog_run+0x6eb4>
3066   52a656:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
306a   52a65a:	49 8b 17             	mov    (%r15),%rdx
306d   52a65d:	c0 e8 04             	shr    $0x4,%al
3070   52a660:	0f b6 c0             	movzbl %al,%eax
3073   52a663:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
3077   52a667:	48 89 c1             	mov    %rax,%rcx
307a   52a66a:	48 c1 e9 03          	shr    $0x3,%rcx
307e   52a66e:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
3083   52a673:	0f 85 0e 3e 00 00    	jne    52e487 <___bpf_prog_run+0x6e97>
3089   52a679:	0b 10                	or     (%rax),%edx
308b   52a67b:	48 83 c3 08          	add    $0x8,%rbx
308f   52a67f:	89 d0                	mov    %edx,%eax
3091   52a681:	49 89 07             	mov    %rax,(%r15)
3094   52a684:	e9 a1 cf ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3099   52a689:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
309d   52a68d:	48 89 f8             	mov    %rdi,%rax
30a0   52a690:	48 c1 e8 03          	shr    $0x3,%rax
30a4   52a694:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
30a9   52a699:	48 89 f8             	mov    %rdi,%rax
30ac   52a69c:	83 e0 07             	and    $0x7,%eax
30af   52a69f:	83 c0 03             	add    $0x3,%eax
30b2   52a6a2:	38 d0                	cmp    %dl,%al
30b4   52a6a4:	7c 08                	jl     52a6ae <___bpf_prog_run+0x30be>
30b6   52a6a6:	84 d2                	test   %dl,%dl
30b8   52a6a8:	0f 85 fb 31 00 00    	jne    52d8a9 <___bpf_prog_run+0x62b9>
30be   52a6ae:	49 8d 7e 28          	lea    0x28(%r14),%rdi
30c2   52a6b2:	4c 63 7b 04          	movslq 0x4(%rbx),%r15
30c6   52a6b6:	48 89 f8             	mov    %rdi,%rax
30c9   52a6b9:	48 c1 e8 03          	shr    $0x3,%rax
30cd   52a6bd:	49 81 c7 00 00 00 00 	add    $0x0,%r15	52a6c0: R_X86_64_32S	__bpf_call_base
30d4   52a6c4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
30d9   52a6c9:	0f 85 80 36 00 00    	jne    52dd4f <___bpf_prog_run+0x675f>
30df   52a6cf:	49 8d 7e 20          	lea    0x20(%r14),%rdi
30e3   52a6d3:	4d 8b 46 28          	mov    0x28(%r14),%r8
30e7   52a6d7:	48 89 f8             	mov    %rdi,%rax
30ea   52a6da:	48 c1 e8 03          	shr    $0x3,%rax
30ee   52a6de:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
30f3   52a6e3:	0f 85 54 36 00 00    	jne    52dd3d <___bpf_prog_run+0x674d>
30f9   52a6e9:	49 8d 7e 18          	lea    0x18(%r14),%rdi
30fd   52a6ed:	49 8b 4e 20          	mov    0x20(%r14),%rcx
3101   52a6f1:	48 89 f8             	mov    %rdi,%rax
3104   52a6f4:	48 c1 e8 03          	shr    $0x3,%rax
3108   52a6f8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
310d   52a6fd:	0f 85 a1 39 00 00    	jne    52e0a4 <___bpf_prog_run+0x6ab4>
3113   52a703:	41 80 3c 24 00       	cmpb   $0x0,(%r12)
3118   52a708:	49 8b 56 18          	mov    0x18(%r14),%rdx
311c   52a70c:	0f 85 6c 39 00 00    	jne    52e07e <___bpf_prog_run+0x6a8e>
3122   52a712:	49 8d 7e 08          	lea    0x8(%r14),%rdi
3126   52a716:	49 8b 76 10          	mov    0x10(%r14),%rsi
312a   52a71a:	48 89 f8             	mov    %rdi,%rax
312d   52a71d:	48 c1 e8 03          	shr    $0x3,%rax
3131   52a721:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3136   52a726:	0f 85 28 39 00 00    	jne    52e054 <___bpf_prog_run+0x6a64>
313c   52a72c:	49 8b 7e 08          	mov    0x8(%r14),%rdi
3140   52a730:	41 ff d7             	call   *%r15
3143   52a733:	49 89 c7             	mov    %rax,%r15
3146   52a736:	4c 89 f0             	mov    %r14,%rax
3149   52a739:	48 c1 e8 03          	shr    $0x3,%rax
314d   52a73d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3152   52a742:	0f 85 ff 38 00 00    	jne    52e047 <___bpf_prog_run+0x6a57>
3158   52a748:	4d 89 3e             	mov    %r15,(%r14)
315b   52a74b:	48 83 c3 08          	add    $0x8,%rbx
315f   52a74f:	e9 d6 ce ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3164   52a754:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3168   52a758:	48 89 f8             	mov    %rdi,%rax
316b   52a75b:	48 89 fa             	mov    %rdi,%rdx
316e   52a75e:	48 c1 e8 03          	shr    $0x3,%rax
3172   52a762:	83 e2 07             	and    $0x7,%edx
3175   52a765:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
317a   52a76a:	38 d0                	cmp    %dl,%al
317c   52a76c:	7f 08                	jg     52a776 <___bpf_prog_run+0x3186>
317e   52a76e:	84 c0                	test   %al,%al
3180   52a770:	0f 85 29 31 00 00    	jne    52d89f <___bpf_prog_run+0x62af>
3186   52a776:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
318a   52a77a:	83 e0 0f             	and    $0xf,%eax
318d   52a77d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3191   52a781:	4c 89 f8             	mov    %r15,%rax
3194   52a784:	48 c1 e8 03          	shr    $0x3,%rax
3198   52a788:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
319d   52a78d:	0f 85 63 37 00 00    	jne    52def6 <___bpf_prog_run+0x6906>
31a3   52a793:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
31a7   52a797:	49 8b 17             	mov    (%r15),%rdx
31aa   52a79a:	c0 e8 04             	shr    $0x4,%al
31ad   52a79d:	0f b6 c0             	movzbl %al,%eax
31b0   52a7a0:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
31b4   52a7a4:	48 89 c1             	mov    %rax,%rcx
31b7   52a7a7:	48 c1 e9 03          	shr    $0x3,%rcx
31bb   52a7ab:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
31c0   52a7b0:	0f 85 23 37 00 00    	jne    52ded9 <___bpf_prog_run+0x68e9>
31c6   52a7b6:	0f af 10             	imul   (%rax),%edx
31c9   52a7b9:	48 83 c3 08          	add    $0x8,%rbx
31cd   52a7bd:	89 d0                	mov    %edx,%eax
31cf   52a7bf:	49 89 07             	mov    %rax,(%r15)
31d2   52a7c2:	e9 63 ce ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
31d7   52a7c7:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
31db   52a7cb:	48 89 f8             	mov    %rdi,%rax
31de   52a7ce:	48 c1 e8 03          	shr    $0x3,%rax
31e2   52a7d2:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
31e7   52a7d7:	48 89 f8             	mov    %rdi,%rax
31ea   52a7da:	83 e0 07             	and    $0x7,%eax
31ed   52a7dd:	83 c0 03             	add    $0x3,%eax
31f0   52a7e0:	38 d0                	cmp    %dl,%al
31f2   52a7e2:	7c 08                	jl     52a7ec <___bpf_prog_run+0x31fc>
31f4   52a7e4:	84 d2                	test   %dl,%dl
31f6   52a7e6:	0f 85 a9 30 00 00    	jne    52d895 <___bpf_prog_run+0x62a5>
31fc   52a7ec:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3200   52a7f0:	4c 63 7b 04          	movslq 0x4(%rbx),%r15
3204   52a7f4:	48 89 f8             	mov    %rdi,%rax
3207   52a7f7:	48 89 fa             	mov    %rdi,%rdx
320a   52a7fa:	48 c1 e8 03          	shr    $0x3,%rax
320e   52a7fe:	83 e2 07             	and    $0x7,%edx
3211   52a801:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3216   52a806:	38 d0                	cmp    %dl,%al
3218   52a808:	7f 08                	jg     52a812 <___bpf_prog_run+0x3222>
321a   52a80a:	84 c0                	test   %al,%al
321c   52a80c:	0f 85 42 2b 00 00    	jne    52d354 <___bpf_prog_run+0x5d64>
3222   52a812:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3226   52a816:	83 e0 0f             	and    $0xf,%eax
3229   52a819:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
322d   52a81d:	48 89 c2             	mov    %rax,%rdx
3230   52a820:	48 c1 ea 03          	shr    $0x3,%rdx
3234   52a824:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
3239   52a829:	0f 85 d3 3c 00 00    	jne    52e502 <___bpf_prog_run+0x6f12>
323f   52a82f:	4c 89 38             	mov    %r15,(%rax)
3242   52a832:	48 83 c3 08          	add    $0x8,%rbx
3246   52a836:	e9 ef cd ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
324b   52a83b:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
324f   52a83f:	48 89 f8             	mov    %rdi,%rax
3252   52a842:	48 89 fa             	mov    %rdi,%rdx
3255   52a845:	48 c1 e8 03          	shr    $0x3,%rax
3259   52a849:	83 e2 07             	and    $0x7,%edx
325c   52a84c:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3261   52a851:	38 d0                	cmp    %dl,%al
3263   52a853:	7f 08                	jg     52a85d <___bpf_prog_run+0x326d>
3265   52a855:	84 c0                	test   %al,%al
3267   52a857:	0f 85 2e 30 00 00    	jne    52d88b <___bpf_prog_run+0x629b>
326d   52a85d:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3271   52a861:	83 e0 0f             	and    $0xf,%eax
3274   52a864:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3278   52a868:	4c 89 f8             	mov    %r15,%rax
327b   52a86b:	48 c1 e8 03          	shr    $0x3,%rax
327f   52a86f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3284   52a874:	0f 85 d6 33 00 00    	jne    52dc50 <___bpf_prog_run+0x6660>
328a   52a87a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
328e   52a87e:	49 8b 17             	mov    (%r15),%rdx
3291   52a881:	c0 e8 04             	shr    $0x4,%al
3294   52a884:	0f b6 c0             	movzbl %al,%eax
3297   52a887:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
329b   52a88b:	48 89 c1             	mov    %rax,%rcx
329e   52a88e:	48 c1 e9 03          	shr    $0x3,%rcx
32a2   52a892:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
32a7   52a897:	0f 85 96 33 00 00    	jne    52dc33 <___bpf_prog_run+0x6643>
32ad   52a89d:	2b 10                	sub    (%rax),%edx
32af   52a89f:	48 83 c3 08          	add    $0x8,%rbx
32b3   52a8a3:	89 d0                	mov    %edx,%eax
32b5   52a8a5:	49 89 07             	mov    %rax,(%r15)
32b8   52a8a8:	e9 7d cd ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
32bd   52a8ad:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
32c7   52a8b7:	4c 89 f2             	mov    %r14,%rdx
32ca   52a8ba:	48 c1 ea 03          	shr    $0x3,%rdx
32ce   52a8be:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
32d2   52a8c2:	0f 85 d4 41 00 00    	jne    52ea9c <___bpf_prog_run+0x74ac>
32d8   52a8c8:	49 8b 06             	mov    (%r14),%rax
32db   52a8cb:	48 83 c4 38          	add    $0x38,%rsp
32df   52a8cf:	5b                   	pop    %rbx
32e0   52a8d0:	41 5c                	pop    %r12
32e2   52a8d2:	41 5d                	pop    %r13
32e4   52a8d4:	41 5e                	pop    %r14
32e6   52a8d6:	41 5f                	pop    %r15
32e8   52a8d8:	5d                   	pop    %rbp
32e9   52a8d9:	31 d2                	xor    %edx,%edx
32eb   52a8db:	31 c9                	xor    %ecx,%ecx
32ed   52a8dd:	31 f6                	xor    %esi,%esi
32ef   52a8df:	31 ff                	xor    %edi,%edi
32f1   52a8e1:	45 31 c0             	xor    %r8d,%r8d
32f4   52a8e4:	45 31 c9             	xor    %r9d,%r9d
32f7   52a8e7:	c3                   	ret
32f8   52a8e8:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
32fc   52a8ec:	48 89 f8             	mov    %rdi,%rax
32ff   52a8ef:	48 89 fa             	mov    %rdi,%rdx
3302   52a8f2:	48 c1 e8 03          	shr    $0x3,%rax
3306   52a8f6:	83 e2 07             	and    $0x7,%edx
3309   52a8f9:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
330e   52a8fe:	38 d0                	cmp    %dl,%al
3310   52a900:	7f 08                	jg     52a90a <___bpf_prog_run+0x331a>
3312   52a902:	84 c0                	test   %al,%al
3314   52a904:	0f 85 77 2f 00 00    	jne    52d881 <___bpf_prog_run+0x6291>
331a   52a90a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
331e   52a90e:	c0 e8 04             	shr    $0x4,%al
3321   52a911:	0f b6 c0             	movzbl %al,%eax
3324   52a914:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3328   52a918:	4c 89 f8             	mov    %r15,%rax
332b   52a91b:	48 c1 e8 03          	shr    $0x3,%rax
332f   52a91f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3334   52a924:	0f 85 08 3d 00 00    	jne    52e632 <___bpf_prog_run+0x7042>
333a   52a92a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
333e   52a92e:	49 8b 0f             	mov    (%r15),%rcx
3341   52a931:	83 e0 0f             	and    $0xf,%eax
3344   52a934:	83 e1 1f             	and    $0x1f,%ecx
3347   52a937:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
334b   52a93b:	4c 89 f8             	mov    %r15,%rax
334e   52a93e:	48 c1 e8 03          	shr    $0x3,%rax
3352   52a942:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3357   52a947:	0f 85 d2 3c 00 00    	jne    52e61f <___bpf_prog_run+0x702f>
335d   52a94d:	41 8b 07             	mov    (%r15),%eax
3360   52a950:	48 83 c3 08          	add    $0x8,%rbx
3364   52a954:	d3 e0                	shl    %cl,%eax
3366   52a956:	49 89 07             	mov    %rax,(%r15)
3369   52a959:	e9 cc cc ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
336e   52a95e:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3372   52a962:	48 89 f8             	mov    %rdi,%rax
3375   52a965:	48 89 fa             	mov    %rdi,%rdx
3378   52a968:	48 c1 e8 03          	shr    $0x3,%rax
337c   52a96c:	83 e2 07             	and    $0x7,%edx
337f   52a96f:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3384   52a974:	38 d0                	cmp    %dl,%al
3386   52a976:	7f 08                	jg     52a980 <___bpf_prog_run+0x3390>
3388   52a978:	84 c0                	test   %al,%al
338a   52a97a:	0f 85 f7 2e 00 00    	jne    52d877 <___bpf_prog_run+0x6287>
3390   52a980:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3394   52a984:	c0 e8 04             	shr    $0x4,%al
3397   52a987:	0f b6 c0             	movzbl %al,%eax
339a   52a98a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
339e   52a98e:	4c 89 f8             	mov    %r15,%rax
33a1   52a991:	48 c1 e8 03          	shr    $0x3,%rax
33a5   52a995:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
33aa   52a99a:	0f 85 33 37 00 00    	jne    52e0d3 <___bpf_prog_run+0x6ae3>
33b0   52a9a0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
33b4   52a9a4:	49 8b 0f             	mov    (%r15),%rcx
33b7   52a9a7:	83 e0 0f             	and    $0xf,%eax
33ba   52a9aa:	83 e1 3f             	and    $0x3f,%ecx
33bd   52a9ad:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
33c1   52a9b1:	4c 89 f8             	mov    %r15,%rax
33c4   52a9b4:	48 c1 e8 03          	shr    $0x3,%rax
33c8   52a9b8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
33cd   52a9bd:	0f 85 6e 37 00 00    	jne    52e131 <___bpf_prog_run+0x6b41>
33d3   52a9c3:	49 d3 27             	shlq   %cl,(%r15)
33d6   52a9c6:	48 83 c3 08          	add    $0x8,%rbx
33da   52a9ca:	e9 5b cc ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
33df   52a9cf:	4c 8d 43 01          	lea    0x1(%rbx),%r8
33e3   52a9d3:	4c 89 c0             	mov    %r8,%rax
33e6   52a9d6:	4c 89 c2             	mov    %r8,%rdx
33e9   52a9d9:	48 c1 e8 03          	shr    $0x3,%rax
33ed   52a9dd:	83 e2 07             	and    $0x7,%edx
33f0   52a9e0:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
33f5   52a9e5:	38 d0                	cmp    %dl,%al
33f7   52a9e7:	7f 08                	jg     52a9f1 <___bpf_prog_run+0x3401>
33f9   52a9e9:	84 c0                	test   %al,%al
33fb   52a9eb:	0f 85 71 2e 00 00    	jne    52d862 <___bpf_prog_run+0x6272>
3401   52a9f1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3405   52a9f5:	83 e0 0f             	and    $0xf,%eax
3408   52a9f8:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
340c   52a9fc:	4c 89 f8             	mov    %r15,%rax
340f   52a9ff:	48 c1 e8 03          	shr    $0x3,%rax
3413   52aa03:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3418   52aa08:	0f 85 1a 33 00 00    	jne    52dd28 <___bpf_prog_run+0x6738>
341e   52aa0e:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
3422   52aa12:	49 8b 07             	mov    (%r15),%rax
3425   52aa15:	4c 89 ca             	mov    %r9,%rdx
3428   52aa18:	48 c1 ea 03          	shr    $0x3,%rdx
342c   52aa1c:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
3431   52aa21:	4c 89 ca             	mov    %r9,%rdx
3434   52aa24:	83 e2 07             	and    $0x7,%edx
3437   52aa27:	83 c2 03             	add    $0x3,%edx
343a   52aa2a:	38 ca                	cmp    %cl,%dl
343c   52aa2c:	7c 08                	jl     52aa36 <___bpf_prog_run+0x3446>
343e   52aa2e:	84 c9                	test   %cl,%cl
3440   52aa30:	0f 85 7e 2c 00 00    	jne    52d6b4 <___bpf_prog_run+0x60c4>
3446   52aa36:	8b 4b 04             	mov    0x4(%rbx),%ecx
3449   52aa39:	83 f9 3f             	cmp    $0x3f,%ecx
344c   52aa3c:	0f 87 00 00 00 00    	ja     52aa42 <___bpf_prog_run+0x3452>	52aa3e: R_X86_64_PC32	.text.unlikely+0x76cc
3452   52aa42:	4c 89 fa             	mov    %r15,%rdx
3455   52aa45:	48 d3 e0             	shl    %cl,%rax
3458   52aa48:	48 c1 ea 03          	shr    $0x3,%rdx
345c   52aa4c:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
3461   52aa51:	0f 85 35 37 00 00    	jne    52e18c <___bpf_prog_run+0x6b9c>
3467   52aa57:	49 89 07             	mov    %rax,(%r15)
346a   52aa5a:	48 83 c3 08          	add    $0x8,%rbx
346e   52aa5e:	e9 c7 cb ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3473   52aa63:	4c 8d 43 01          	lea    0x1(%rbx),%r8
3477   52aa67:	4c 89 c0             	mov    %r8,%rax
347a   52aa6a:	4c 89 c2             	mov    %r8,%rdx
347d   52aa6d:	48 c1 e8 03          	shr    $0x3,%rax
3481   52aa71:	83 e2 07             	and    $0x7,%edx
3484   52aa74:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3489   52aa79:	38 d0                	cmp    %dl,%al
348b   52aa7b:	7f 08                	jg     52aa85 <___bpf_prog_run+0x3495>
348d   52aa7d:	84 c0                	test   %al,%al
348f   52aa7f:	0f 85 c8 2d 00 00    	jne    52d84d <___bpf_prog_run+0x625d>
3495   52aa85:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3499   52aa89:	83 e0 0f             	and    $0xf,%eax
349c   52aa8c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
34a0   52aa90:	4c 89 f8             	mov    %r15,%rax
34a3   52aa93:	48 c1 e8 03          	shr    $0x3,%rax
34a7   52aa97:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
34ac   52aa9c:	0f 85 ec 3e 00 00    	jne    52e98e <___bpf_prog_run+0x739e>
34b2   52aaa2:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
34b6   52aaa6:	49 8b 07             	mov    (%r15),%rax
34b9   52aaa9:	4c 89 ca             	mov    %r9,%rdx
34bc   52aaac:	48 c1 ea 03          	shr    $0x3,%rdx
34c0   52aab0:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
34c5   52aab5:	4c 89 ca             	mov    %r9,%rdx
34c8   52aab8:	83 e2 07             	and    $0x7,%edx
34cb   52aabb:	83 c2 03             	add    $0x3,%edx
34ce   52aabe:	38 ca                	cmp    %cl,%dl
34d0   52aac0:	7c 08                	jl     52aaca <___bpf_prog_run+0x34da>
34d2   52aac2:	84 c9                	test   %cl,%cl
34d4   52aac4:	0f 85 bb 2b 00 00    	jne    52d685 <___bpf_prog_run+0x6095>
34da   52aaca:	8b 4b 04             	mov    0x4(%rbx),%ecx
34dd   52aacd:	83 f9 3f             	cmp    $0x3f,%ecx
34e0   52aad0:	0f 87 00 00 00 00    	ja     52aad6 <___bpf_prog_run+0x34e6>	52aad2: R_X86_64_PC32	.text.unlikely+0x7822
34e6   52aad6:	4c 89 fa             	mov    %r15,%rdx
34e9   52aad9:	48 d3 e8             	shr    %cl,%rax
34ec   52aadc:	48 c1 ea 03          	shr    $0x3,%rdx
34f0   52aae0:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
34f5   52aae5:	0f 85 b8 3e 00 00    	jne    52e9a3 <___bpf_prog_run+0x73b3>
34fb   52aaeb:	49 89 07             	mov    %rax,(%r15)
34fe   52aaee:	48 83 c3 08          	add    $0x8,%rbx
3502   52aaf2:	e9 33 cb ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3507   52aaf7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
350b   52aafb:	48 89 f8             	mov    %rdi,%rax
350e   52aafe:	48 89 fa             	mov    %rdi,%rdx
3511   52ab01:	48 c1 e8 03          	shr    $0x3,%rax
3515   52ab05:	83 e2 07             	and    $0x7,%edx
3518   52ab08:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
351d   52ab0d:	38 d0                	cmp    %dl,%al
351f   52ab0f:	7f 08                	jg     52ab19 <___bpf_prog_run+0x3529>
3521   52ab11:	84 c0                	test   %al,%al
3523   52ab13:	0f 85 2a 2d 00 00    	jne    52d843 <___bpf_prog_run+0x6253>
3529   52ab19:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
352d   52ab1d:	c0 e8 04             	shr    $0x4,%al
3530   52ab20:	0f b6 c0             	movzbl %al,%eax
3533   52ab23:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3537   52ab27:	4c 89 f8             	mov    %r15,%rax
353a   52ab2a:	48 c1 e8 03          	shr    $0x3,%rax
353e   52ab2e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3543   52ab33:	0f 85 d3 30 00 00    	jne    52dc0c <___bpf_prog_run+0x661c>
3549   52ab39:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
354d   52ab3d:	49 8b 0f             	mov    (%r15),%rcx
3550   52ab40:	83 e0 0f             	and    $0xf,%eax
3553   52ab43:	83 e1 3f             	and    $0x3f,%ecx
3556   52ab46:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
355a   52ab4a:	4c 89 f8             	mov    %r15,%rax
355d   52ab4d:	48 c1 e8 03          	shr    $0x3,%rax
3561   52ab51:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3566   52ab56:	0f 85 9b 30 00 00    	jne    52dbf7 <___bpf_prog_run+0x6607>
356c   52ab5c:	49 d3 2f             	shrq   %cl,(%r15)
356f   52ab5f:	48 83 c3 08          	add    $0x8,%rbx
3573   52ab63:	e9 c2 ca ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3578   52ab68:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
357c   52ab6c:	48 89 f8             	mov    %rdi,%rax
357f   52ab6f:	48 89 fa             	mov    %rdi,%rdx
3582   52ab72:	48 c1 e8 03          	shr    $0x3,%rax
3586   52ab76:	83 e2 07             	and    $0x7,%edx
3589   52ab79:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
358e   52ab7e:	38 d0                	cmp    %dl,%al
3590   52ab80:	7f 08                	jg     52ab8a <___bpf_prog_run+0x359a>
3592   52ab82:	84 c0                	test   %al,%al
3594   52ab84:	0f 85 af 2c 00 00    	jne    52d839 <___bpf_prog_run+0x6249>
359a   52ab8a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
359e   52ab8e:	83 e0 0f             	and    $0xf,%eax
35a1   52ab91:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
35a5   52ab95:	4c 89 f8             	mov    %r15,%rax
35a8   52ab98:	48 c1 e8 03          	shr    $0x3,%rax
35ac   52ab9c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
35b1   52aba1:	0f 85 25 33 00 00    	jne    52decc <___bpf_prog_run+0x68dc>
35b7   52aba7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
35bb   52abab:	49 8b 17             	mov    (%r15),%rdx
35be   52abae:	c0 e8 04             	shr    $0x4,%al
35c1   52abb1:	0f b6 c0             	movzbl %al,%eax
35c4   52abb4:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
35c8   52abb8:	48 89 c1             	mov    %rax,%rcx
35cb   52abbb:	48 c1 e9 03          	shr    $0x3,%rcx
35cf   52abbf:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
35d4   52abc4:	0f 85 e5 32 00 00    	jne    52deaf <___bpf_prog_run+0x68bf>
35da   52abca:	33 10                	xor    (%rax),%edx
35dc   52abcc:	48 83 c3 08          	add    $0x8,%rbx
35e0   52abd0:	89 d0                	mov    %edx,%eax
35e2   52abd2:	49 89 07             	mov    %rax,(%r15)
35e5   52abd5:	e9 50 ca ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
35ea   52abda:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
35ee   52abde:	48 89 f8             	mov    %rdi,%rax
35f1   52abe1:	48 89 fa             	mov    %rdi,%rdx
35f4   52abe4:	48 c1 e8 03          	shr    $0x3,%rax
35f8   52abe8:	83 e2 07             	and    $0x7,%edx
35fb   52abeb:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3600   52abf0:	38 d0                	cmp    %dl,%al
3602   52abf2:	7f 08                	jg     52abfc <___bpf_prog_run+0x360c>
3604   52abf4:	84 c0                	test   %al,%al
3606   52abf6:	0f 85 33 2c 00 00    	jne    52d82f <___bpf_prog_run+0x623f>
360c   52abfc:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3610   52ac00:	c0 e8 04             	shr    $0x4,%al
3613   52ac03:	0f b6 c0             	movzbl %al,%eax
3616   52ac06:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
361a   52ac0a:	4c 89 f8             	mov    %r15,%rax
361d   52ac0d:	48 c1 e8 03          	shr    $0x3,%rax
3621   52ac11:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3626   52ac16:	0f 85 fb 38 00 00    	jne    52e517 <___bpf_prog_run+0x6f27>
362c   52ac1c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3630   52ac20:	49 8b 0f             	mov    (%r15),%rcx
3633   52ac23:	83 e0 0f             	and    $0xf,%eax
3636   52ac26:	83 e1 3f             	and    $0x3f,%ecx
3639   52ac29:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
363d   52ac2d:	4c 89 f8             	mov    %r15,%rax
3640   52ac30:	48 c1 e8 03          	shr    $0x3,%rax
3644   52ac34:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3649   52ac39:	0f 85 2e 39 00 00    	jne    52e56d <___bpf_prog_run+0x6f7d>
364f   52ac3f:	49 d3 3f             	sarq   %cl,(%r15)
3652   52ac42:	48 83 c3 08          	add    $0x8,%rbx
3656   52ac46:	e9 df c9 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
365b   52ac4b:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
365f   52ac4f:	48 89 f8             	mov    %rdi,%rax
3662   52ac52:	48 89 fa             	mov    %rdi,%rdx
3665   52ac55:	48 c1 e8 03          	shr    $0x3,%rax
3669   52ac59:	83 e2 07             	and    $0x7,%edx
366c   52ac5c:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3671   52ac61:	38 d0                	cmp    %dl,%al
3673   52ac63:	7f 08                	jg     52ac6d <___bpf_prog_run+0x367d>
3675   52ac65:	84 c0                	test   %al,%al
3677   52ac67:	0f 85 b8 2b 00 00    	jne    52d825 <___bpf_prog_run+0x6235>
367d   52ac6d:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3681   52ac71:	83 e0 0f             	and    $0xf,%eax
3684   52ac74:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3688   52ac78:	4c 89 f8             	mov    %r15,%rax
368b   52ac7b:	48 c1 e8 03          	shr    $0x3,%rax
368f   52ac7f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3694   52ac84:	0f 85 f0 37 00 00    	jne    52e47a <___bpf_prog_run+0x6e8a>
369a   52ac8a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
369e   52ac8e:	49 8b 17             	mov    (%r15),%rdx
36a1   52ac91:	c0 e8 04             	shr    $0x4,%al
36a4   52ac94:	0f b6 c0             	movzbl %al,%eax
36a7   52ac97:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
36ab   52ac9b:	48 89 c1             	mov    %rax,%rcx
36ae   52ac9e:	48 c1 e9 03          	shr    $0x3,%rcx
36b2   52aca2:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
36b7   52aca7:	0f 85 b0 37 00 00    	jne    52e45d <___bpf_prog_run+0x6e6d>
36bd   52acad:	23 10                	and    (%rax),%edx
36bf   52acaf:	48 83 c3 08          	add    $0x8,%rbx
36c3   52acb3:	89 d0                	mov    %edx,%eax
36c5   52acb5:	49 89 07             	mov    %rax,(%r15)
36c8   52acb8:	e9 6d c9 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
36cd   52acbd:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
36d1   52acc1:	48 89 f8             	mov    %rdi,%rax
36d4   52acc4:	48 c1 e8 03          	shr    $0x3,%rax
36d8   52acc8:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
36dd   52accd:	48 89 f8             	mov    %rdi,%rax
36e0   52acd0:	83 e0 07             	and    $0x7,%eax
36e3   52acd3:	83 c0 03             	add    $0x3,%eax
36e6   52acd6:	38 d0                	cmp    %dl,%al
36e8   52acd8:	7c 08                	jl     52ace2 <___bpf_prog_run+0x36f2>
36ea   52acda:	84 d2                	test   %dl,%dl
36ec   52acdc:	0f 85 39 2b 00 00    	jne    52d81b <___bpf_prog_run+0x622b>
36f2   52ace2:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
36f6   52ace6:	48 63 4b 04          	movslq 0x4(%rbx),%rcx
36fa   52acea:	48 89 f8             	mov    %rdi,%rax
36fd   52aced:	48 89 fa             	mov    %rdi,%rdx
3700   52acf0:	48 c1 e8 03          	shr    $0x3,%rax
3704   52acf4:	83 e2 07             	and    $0x7,%edx
3707   52acf7:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
370c   52acfc:	38 d0                	cmp    %dl,%al
370e   52acfe:	7f 08                	jg     52ad08 <___bpf_prog_run+0x3718>
3710   52ad00:	84 c0                	test   %al,%al
3712   52ad02:	0f 85 74 20 00 00    	jne    52cd7c <___bpf_prog_run+0x578c>
3718   52ad08:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
371c   52ad0c:	83 e0 0f             	and    $0xf,%eax
371f   52ad0f:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3723   52ad13:	4c 89 f8             	mov    %r15,%rax
3726   52ad16:	48 c1 e8 03          	shr    $0x3,%rax
372a   52ad1a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
372f   52ad1f:	0f 85 f8 32 00 00    	jne    52e01d <___bpf_prog_run+0x6a2d>
3735   52ad25:	49 8b 07             	mov    (%r15),%rax
3738   52ad28:	31 d2                	xor    %edx,%edx
373a   52ad2a:	48 83 c3 08          	add    $0x8,%rbx
373e   52ad2e:	48 f7 f1             	div    %rcx
3741   52ad31:	49 89 07             	mov    %rax,(%r15)
3744   52ad34:	e9 f1 c8 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3749   52ad39:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
374d   52ad3d:	48 89 f8             	mov    %rdi,%rax
3750   52ad40:	48 89 fa             	mov    %rdi,%rdx
3753   52ad43:	48 c1 e8 03          	shr    $0x3,%rax
3757   52ad47:	83 e2 07             	and    $0x7,%edx
375a   52ad4a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
375f   52ad4f:	38 d0                	cmp    %dl,%al
3761   52ad51:	7f 08                	jg     52ad5b <___bpf_prog_run+0x376b>
3763   52ad53:	84 c0                	test   %al,%al
3765   52ad55:	0f 85 b6 2a 00 00    	jne    52d811 <___bpf_prog_run+0x6221>
376b   52ad5b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
376f   52ad5f:	83 e0 0f             	and    $0xf,%eax
3772   52ad62:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3776   52ad66:	4c 89 f8             	mov    %r15,%rax
3779   52ad69:	48 c1 e8 03          	shr    $0x3,%rax
377d   52ad6d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3782   52ad72:	0f 85 9a 30 00 00    	jne    52de12 <___bpf_prog_run+0x6822>
3788   52ad78:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
378c   52ad7c:	49 8b 0f             	mov    (%r15),%rcx
378f   52ad7f:	48 89 f8             	mov    %rdi,%rax
3792   52ad82:	48 c1 e8 03          	shr    $0x3,%rax
3796   52ad86:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
379b   52ad8b:	48 89 f8             	mov    %rdi,%rax
379e   52ad8e:	83 e0 07             	and    $0x7,%eax
37a1   52ad91:	83 c0 03             	add    $0x3,%eax
37a4   52ad94:	38 d0                	cmp    %dl,%al
37a6   52ad96:	7c 08                	jl     52ada0 <___bpf_prog_run+0x37b0>
37a8   52ad98:	84 d2                	test   %dl,%dl
37aa   52ad9a:	0f 85 45 24 00 00    	jne    52d1e5 <___bpf_prog_run+0x5bf5>
37b0   52ada0:	48 63 43 04          	movslq 0x4(%rbx),%rax
37b4   52ada4:	48 83 c3 08          	add    $0x8,%rbx
37b8   52ada8:	48 0f af c1          	imul   %rcx,%rax
37bc   52adac:	49 89 07             	mov    %rax,(%r15)
37bf   52adaf:	e9 76 c8 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
37c4   52adb4:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
37c8   52adb8:	48 89 f8             	mov    %rdi,%rax
37cb   52adbb:	48 89 fa             	mov    %rdi,%rdx
37ce   52adbe:	48 c1 e8 03          	shr    $0x3,%rax
37d2   52adc2:	83 e2 07             	and    $0x7,%edx
37d5   52adc5:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
37da   52adca:	38 d0                	cmp    %dl,%al
37dc   52adcc:	7f 08                	jg     52add6 <___bpf_prog_run+0x37e6>
37de   52adce:	84 c0                	test   %al,%al
37e0   52add0:	0f 85 31 2a 00 00    	jne    52d807 <___bpf_prog_run+0x6217>
37e6   52add6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
37ea   52adda:	83 e0 0f             	and    $0xf,%eax
37ed   52addd:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
37f1   52ade1:	4c 89 f8             	mov    %r15,%rax
37f4   52ade4:	48 c1 e8 03          	shr    $0x3,%rax
37f8   52ade8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
37fd   52aded:	0f 85 bc 2e 00 00    	jne    52dcaf <___bpf_prog_run+0x66bf>
3803   52adf3:	49 f7 1f             	negq   (%r15)
3806   52adf6:	48 83 c3 08          	add    $0x8,%rbx
380a   52adfa:	e9 2b c8 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
380f   52adff:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3813   52ae03:	48 89 f8             	mov    %rdi,%rax
3816   52ae06:	48 89 fa             	mov    %rdi,%rdx
3819   52ae09:	48 c1 e8 03          	shr    $0x3,%rax
381d   52ae0d:	83 e2 07             	and    $0x7,%edx
3820   52ae10:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3825   52ae15:	38 d0                	cmp    %dl,%al
3827   52ae17:	7f 08                	jg     52ae21 <___bpf_prog_run+0x3831>
3829   52ae19:	84 c0                	test   %al,%al
382b   52ae1b:	0f 85 dc 29 00 00    	jne    52d7fd <___bpf_prog_run+0x620d>
3831   52ae21:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3835   52ae25:	83 e0 0f             	and    $0xf,%eax
3838   52ae28:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
383c   52ae2c:	4c 89 f8             	mov    %r15,%rax
383f   52ae2f:	48 c1 e8 03          	shr    $0x3,%rax
3843   52ae33:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3848   52ae38:	0f 85 63 33 00 00    	jne    52e1a1 <___bpf_prog_run+0x6bb1>
384e   52ae3e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3852   52ae42:	49 8b 17             	mov    (%r15),%rdx
3855   52ae45:	c0 e8 04             	shr    $0x4,%al
3858   52ae48:	0f b6 c0             	movzbl %al,%eax
385b   52ae4b:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
385f   52ae4f:	48 89 c1             	mov    %rax,%rcx
3862   52ae52:	48 c1 e9 03          	shr    $0x3,%rcx
3866   52ae56:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
386b   52ae5b:	0f 85 fc 2d 00 00    	jne    52dc5d <___bpf_prog_run+0x666d>
3871   52ae61:	03 10                	add    (%rax),%edx
3873   52ae63:	48 83 c3 08          	add    $0x8,%rbx
3877   52ae67:	89 d0                	mov    %edx,%eax
3879   52ae69:	49 89 07             	mov    %rax,(%r15)
387c   52ae6c:	e9 b9 c7 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3881   52ae71:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3885   52ae75:	48 89 f8             	mov    %rdi,%rax
3888   52ae78:	48 89 fa             	mov    %rdi,%rdx
388b   52ae7b:	48 c1 e8 03          	shr    $0x3,%rax
388f   52ae7f:	83 e2 07             	and    $0x7,%edx
3892   52ae82:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3897   52ae87:	38 d0                	cmp    %dl,%al
3899   52ae89:	7f 08                	jg     52ae93 <___bpf_prog_run+0x38a3>
389b   52ae8b:	84 c0                	test   %al,%al
389d   52ae8d:	0f 85 60 29 00 00    	jne    52d7f3 <___bpf_prog_run+0x6203>
38a3   52ae93:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
38a7   52ae97:	83 e0 0f             	and    $0xf,%eax
38aa   52ae9a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
38ae   52ae9e:	4c 89 f8             	mov    %r15,%rax
38b1   52aea1:	48 c1 e8 03          	shr    $0x3,%rax
38b5   52aea5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
38ba   52aeaa:	0f 85 92 30 00 00    	jne    52df42 <___bpf_prog_run+0x6952>
38c0   52aeb0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
38c4   52aeb4:	49 8b 17             	mov    (%r15),%rdx
38c7   52aeb7:	c0 e8 04             	shr    $0x4,%al
38ca   52aeba:	0f b6 c0             	movzbl %al,%eax
38cd   52aebd:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
38d1   52aec1:	4c 89 f8             	mov    %r15,%rax
38d4   52aec4:	48 c1 e8 03          	shr    $0x3,%rax
38d8   52aec8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
38dd   52aecd:	0f 85 5a 30 00 00    	jne    52df2d <___bpf_prog_run+0x693d>
38e3   52aed3:	49 3b 17             	cmp    (%r15),%rdx
38e6   52aed6:	0f 84 4a 15 00 00    	je     52c426 <___bpf_prog_run+0x4e36>
38ec   52aedc:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
38f0   52aee0:	48 89 f8             	mov    %rdi,%rax
38f3   52aee3:	48 c1 e8 03          	shr    $0x3,%rax
38f7   52aee7:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
38fc   52aeec:	48 89 f8             	mov    %rdi,%rax
38ff   52aeef:	83 e0 07             	and    $0x7,%eax
3902   52aef2:	83 c0 01             	add    $0x1,%eax
3905   52aef5:	38 d0                	cmp    %dl,%al
3907   52aef7:	7c 08                	jl     52af01 <___bpf_prog_run+0x3911>
3909   52aef9:	84 d2                	test   %dl,%dl
390b   52aefb:	0f 85 bd 2c 00 00    	jne    52dbbe <___bpf_prog_run+0x65ce>
3911   52af01:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
3916   52af06:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
391b   52af0b:	e9 1a c7 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3920   52af10:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3924   52af14:	48 89 f8             	mov    %rdi,%rax
3927   52af17:	48 89 fa             	mov    %rdi,%rdx
392a   52af1a:	48 c1 e8 03          	shr    $0x3,%rax
392e   52af1e:	83 e2 07             	and    $0x7,%edx
3931   52af21:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3936   52af26:	38 d0                	cmp    %dl,%al
3938   52af28:	7f 08                	jg     52af32 <___bpf_prog_run+0x3942>
393a   52af2a:	84 c0                	test   %al,%al
393c   52af2c:	0f 85 b7 28 00 00    	jne    52d7e9 <___bpf_prog_run+0x61f9>
3942   52af32:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3946   52af36:	83 e0 0f             	and    $0xf,%eax
3949   52af39:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
394d   52af3d:	4c 89 f8             	mov    %r15,%rax
3950   52af40:	48 c1 e8 03          	shr    $0x3,%rax
3954   52af44:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3959   52af49:	0f 85 00 34 00 00    	jne    52e34f <___bpf_prog_run+0x6d5f>
395f   52af4f:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3963   52af53:	49 8b 0f             	mov    (%r15),%rcx
3966   52af56:	48 89 f8             	mov    %rdi,%rax
3969   52af59:	48 c1 e8 03          	shr    $0x3,%rax
396d   52af5d:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3972   52af62:	48 89 f8             	mov    %rdi,%rax
3975   52af65:	83 e0 07             	and    $0x7,%eax
3978   52af68:	83 c0 03             	add    $0x3,%eax
397b   52af6b:	38 d0                	cmp    %dl,%al
397d   52af6d:	7c 08                	jl     52af77 <___bpf_prog_run+0x3987>
397f   52af6f:	84 d2                	test   %dl,%dl
3981   52af71:	0f 85 db 22 00 00    	jne    52d252 <___bpf_prog_run+0x5c62>
3987   52af77:	48 63 43 04          	movslq 0x4(%rbx),%rax
398b   52af7b:	48 83 c3 08          	add    $0x8,%rbx
398f   52af7f:	48 31 c8             	xor    %rcx,%rax
3992   52af82:	49 89 07             	mov    %rax,(%r15)
3995   52af85:	e9 a0 c6 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
399a   52af8a:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
399e   52af8e:	48 89 f8             	mov    %rdi,%rax
39a1   52af91:	48 89 fa             	mov    %rdi,%rdx
39a4   52af94:	48 c1 e8 03          	shr    $0x3,%rax
39a8   52af98:	83 e2 07             	and    $0x7,%edx
39ab   52af9b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
39b0   52afa0:	38 d0                	cmp    %dl,%al
39b2   52afa2:	7f 08                	jg     52afac <___bpf_prog_run+0x39bc>
39b4   52afa4:	84 c0                	test   %al,%al
39b6   52afa6:	0f 85 33 28 00 00    	jne    52d7df <___bpf_prog_run+0x61ef>
39bc   52afac:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
39c0   52afb0:	83 e0 0f             	and    $0xf,%eax
39c3   52afb3:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
39c7   52afb7:	4c 89 f8             	mov    %r15,%rax
39ca   52afba:	48 c1 e8 03          	shr    $0x3,%rax
39ce   52afbe:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
39d3   52afc3:	0f 85 ef 33 00 00    	jne    52e3b8 <___bpf_prog_run+0x6dc8>
39d9   52afc9:	49 8d 7e 58          	lea    0x58(%r14),%rdi
39dd   52afcd:	41 8b 07             	mov    (%r15),%eax
39e0   52afd0:	48 89 fa             	mov    %rdi,%rdx
39e3   52afd3:	48 c1 ea 03          	shr    $0x3,%rdx
39e7   52afd7:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
39ec   52afdc:	0f 85 1a 2d 00 00    	jne    52dcfc <___bpf_prog_run+0x670c>
39f2   52afe2:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
39f6   52afe6:	49 89 46 58          	mov    %rax,0x58(%r14)
39fa   52afea:	48 89 fa             	mov    %rdi,%rdx
39fd   52afed:	48 c1 ea 03          	shr    $0x3,%rdx
3a01   52aff1:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
3a06   52aff6:	48 89 fa             	mov    %rdi,%rdx
3a09   52aff9:	83 e2 07             	and    $0x7,%edx
3a0c   52affc:	83 c2 03             	add    $0x3,%edx
3a0f   52afff:	38 ca                	cmp    %cl,%dl
3a11   52b001:	7c 08                	jl     52b00b <___bpf_prog_run+0x3a1b>
3a13   52b003:	84 c9                	test   %cl,%cl
3a15   52b005:	0f 85 a6 23 00 00    	jne    52d3b1 <___bpf_prog_run+0x5dc1>
3a1b   52b00b:	8b 4b 04             	mov    0x4(%rbx),%ecx
3a1e   52b00e:	31 d2                	xor    %edx,%edx
3a20   52b010:	48 f7 f1             	div    %rcx
3a23   52b013:	49 89 46 58          	mov    %rax,0x58(%r14)
3a27   52b017:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3a2b   52b01b:	83 e0 0f             	and    $0xf,%eax
3a2e   52b01e:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3a32   52b022:	4c 89 f8             	mov    %r15,%rax
3a35   52b025:	48 c1 e8 03          	shr    $0x3,%rax
3a39   52b029:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3a3e   52b02e:	0f 85 48 33 00 00    	jne    52e37c <___bpf_prog_run+0x6d8c>
3a44   52b034:	49 89 17             	mov    %rdx,(%r15)
3a47   52b037:	48 83 c3 08          	add    $0x8,%rbx
3a4b   52b03b:	e9 ea c5 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3a50   52b040:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3a54   52b044:	48 89 f8             	mov    %rdi,%rax
3a57   52b047:	48 89 fa             	mov    %rdi,%rdx
3a5a   52b04a:	48 c1 e8 03          	shr    $0x3,%rax
3a5e   52b04e:	83 e2 07             	and    $0x7,%edx
3a61   52b051:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3a66   52b056:	38 d0                	cmp    %dl,%al
3a68   52b058:	7f 08                	jg     52b062 <___bpf_prog_run+0x3a72>
3a6a   52b05a:	84 c0                	test   %al,%al
3a6c   52b05c:	0f 85 73 27 00 00    	jne    52d7d5 <___bpf_prog_run+0x61e5>
3a72   52b062:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3a76   52b066:	83 e0 0f             	and    $0xf,%eax
3a79   52b069:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3a7d   52b06d:	4c 89 f8             	mov    %r15,%rax
3a80   52b070:	48 c1 e8 03          	shr    $0x3,%rax
3a84   52b074:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3a89   52b079:	0f 85 9a 33 00 00    	jne    52e419 <___bpf_prog_run+0x6e29>
3a8f   52b07f:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3a93   52b083:	49 8b 0f             	mov    (%r15),%rcx
3a96   52b086:	48 89 f8             	mov    %rdi,%rax
3a99   52b089:	48 c1 e8 03          	shr    $0x3,%rax
3a9d   52b08d:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3aa2   52b092:	48 89 f8             	mov    %rdi,%rax
3aa5   52b095:	83 e0 07             	and    $0x7,%eax
3aa8   52b098:	83 c0 03             	add    $0x3,%eax
3aab   52b09b:	38 d0                	cmp    %dl,%al
3aad   52b09d:	7c 08                	jl     52b0a7 <___bpf_prog_run+0x3ab7>
3aaf   52b09f:	84 d2                	test   %dl,%dl
3ab1   52b0a1:	0f 85 2b 22 00 00    	jne    52d2d2 <___bpf_prog_run+0x5ce2>
3ab7   52b0a7:	48 63 43 04          	movslq 0x4(%rbx),%rax
3abb   52b0ab:	48 83 c3 08          	add    $0x8,%rbx
3abf   52b0af:	48 09 c8             	or     %rcx,%rax
3ac2   52b0b2:	49 89 07             	mov    %rax,(%r15)
3ac5   52b0b5:	e9 70 c5 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3aca   52b0ba:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3ace   52b0be:	48 89 f8             	mov    %rdi,%rax
3ad1   52b0c1:	48 c1 e8 03          	shr    $0x3,%rax
3ad5   52b0c5:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3ada   52b0ca:	48 89 f8             	mov    %rdi,%rax
3add   52b0cd:	83 e0 07             	and    $0x7,%eax
3ae0   52b0d0:	83 c0 03             	add    $0x3,%eax
3ae3   52b0d3:	38 d0                	cmp    %dl,%al
3ae5   52b0d5:	7c 08                	jl     52b0df <___bpf_prog_run+0x3aef>
3ae7   52b0d7:	84 d2                	test   %dl,%dl
3ae9   52b0d9:	0f 85 ec 26 00 00    	jne    52d7cb <___bpf_prog_run+0x61db>
3aef   52b0df:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
3af3   52b0e3:	4c 63 7b 04          	movslq 0x4(%rbx),%r15
3af7   52b0e7:	48 89 f8             	mov    %rdi,%rax
3afa   52b0ea:	48 c1 e8 03          	shr    $0x3,%rax
3afe   52b0ee:	49 81 c7 00 00 00 00 	add    $0x0,%r15	52b0f1: R_X86_64_32S	__bpf_call_base
3b05   52b0f5:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3b0a   52b0fa:	48 89 f8             	mov    %rdi,%rax
3b0d   52b0fd:	83 e0 07             	and    $0x7,%eax
3b10   52b100:	83 c0 01             	add    $0x1,%eax
3b13   52b103:	38 d0                	cmp    %dl,%al
3b15   52b105:	7c 08                	jl     52b10f <___bpf_prog_run+0x3b1f>
3b17   52b107:	84 d2                	test   %dl,%dl
3b19   52b109:	0f 85 2c 1f 00 00    	jne    52d03b <___bpf_prog_run+0x5a4b>
3b1f   52b10f:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
3b24   52b114:	49 8d 7e 28          	lea    0x28(%r14),%rdi
3b28   52b118:	4c 8d 4c c3 08       	lea    0x8(%rbx,%rax,8),%r9
3b2d   52b11d:	48 89 f8             	mov    %rdi,%rax
3b30   52b120:	48 c1 e8 03          	shr    $0x3,%rax
3b34   52b124:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3b39   52b129:	0f 85 1f 36 00 00    	jne    52e74e <___bpf_prog_run+0x715e>
3b3f   52b12f:	49 8d 7e 20          	lea    0x20(%r14),%rdi
3b43   52b133:	4d 8b 46 28          	mov    0x28(%r14),%r8
3b47   52b137:	48 89 f8             	mov    %rdi,%rax
3b4a   52b13a:	48 c1 e8 03          	shr    $0x3,%rax
3b4e   52b13e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3b53   52b143:	0f 85 eb 35 00 00    	jne    52e734 <___bpf_prog_run+0x7144>
3b59   52b149:	49 8d 7e 18          	lea    0x18(%r14),%rdi
3b5d   52b14d:	49 8b 4e 20          	mov    0x20(%r14),%rcx
3b61   52b151:	48 89 f8             	mov    %rdi,%rax
3b64   52b154:	48 c1 e8 03          	shr    $0x3,%rax
3b68   52b158:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3b6d   52b15d:	0f 85 af 35 00 00    	jne    52e712 <___bpf_prog_run+0x7122>
3b73   52b163:	41 80 3c 24 00       	cmpb   $0x0,(%r12)
3b78   52b168:	49 8b 56 18          	mov    0x18(%r14),%rdx
3b7c   52b16c:	0f 85 0f 2e 00 00    	jne    52df81 <___bpf_prog_run+0x6991>
3b82   52b172:	49 8d 7e 08          	lea    0x8(%r14),%rdi
3b86   52b176:	49 8b 76 10          	mov    0x10(%r14),%rsi
3b8a   52b17a:	48 89 f8             	mov    %rdi,%rax
3b8d   52b17d:	48 c1 e8 03          	shr    $0x3,%rax
3b91   52b181:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3b96   52b186:	0f 85 c3 2d 00 00    	jne    52df4f <___bpf_prog_run+0x695f>
3b9c   52b18c:	49 8b 7e 08          	mov    0x8(%r14),%rdi
3ba0   52b190:	41 ff d7             	call   *%r15
3ba3   52b193:	49 89 c7             	mov    %rax,%r15
3ba6   52b196:	4c 89 f0             	mov    %r14,%rax
3ba9   52b199:	48 c1 e8 03          	shr    $0x3,%rax
3bad   52b19d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3bb2   52b1a2:	0f 85 73 2b 00 00    	jne    52dd1b <___bpf_prog_run+0x672b>
3bb8   52b1a8:	4d 89 3e             	mov    %r15,(%r14)
3bbb   52b1ab:	48 83 c3 08          	add    $0x8,%rbx
3bbf   52b1af:	e9 76 c4 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3bc4   52b1b4:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3bc8   52b1b8:	48 89 f8             	mov    %rdi,%rax
3bcb   52b1bb:	48 89 fa             	mov    %rdi,%rdx
3bce   52b1be:	48 c1 e8 03          	shr    $0x3,%rax
3bd2   52b1c2:	83 e2 07             	and    $0x7,%edx
3bd5   52b1c5:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3bda   52b1ca:	38 d0                	cmp    %dl,%al
3bdc   52b1cc:	7f 08                	jg     52b1d6 <___bpf_prog_run+0x3be6>
3bde   52b1ce:	84 c0                	test   %al,%al
3be0   52b1d0:	0f 85 eb 25 00 00    	jne    52d7c1 <___bpf_prog_run+0x61d1>
3be6   52b1d6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3bea   52b1da:	83 e0 0f             	and    $0xf,%eax
3bed   52b1dd:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3bf1   52b1e1:	4c 89 f8             	mov    %r15,%rax
3bf4   52b1e4:	48 c1 e8 03          	shr    $0x3,%rax
3bf8   52b1e8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3bfd   52b1ed:	0f 85 2d 2d 00 00    	jne    52df20 <___bpf_prog_run+0x6930>
3c03   52b1f3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3c07   52b1f7:	49 8b 17             	mov    (%r15),%rdx
3c0a   52b1fa:	c0 e8 04             	shr    $0x4,%al
3c0d   52b1fd:	0f b6 c0             	movzbl %al,%eax
3c10   52b200:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
3c14   52b204:	48 89 c1             	mov    %rax,%rcx
3c17   52b207:	48 c1 e9 03          	shr    $0x3,%rcx
3c1b   52b20b:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
3c20   52b210:	0f 85 ed 2c 00 00    	jne    52df03 <___bpf_prog_run+0x6913>
3c26   52b216:	48 0f af 10          	imul   (%rax),%rdx
3c2a   52b21a:	48 83 c3 08          	add    $0x8,%rbx
3c2e   52b21e:	49 89 17             	mov    %rdx,(%r15)
3c31   52b221:	e9 04 c4 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3c36   52b226:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3c3a   52b22a:	48 89 f8             	mov    %rdi,%rax
3c3d   52b22d:	48 c1 e8 03          	shr    $0x3,%rax
3c41   52b231:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3c46   52b236:	48 89 f8             	mov    %rdi,%rax
3c49   52b239:	83 e0 07             	and    $0x7,%eax
3c4c   52b23c:	83 c0 03             	add    $0x3,%eax
3c4f   52b23f:	38 d0                	cmp    %dl,%al
3c51   52b241:	7c 08                	jl     52b24b <___bpf_prog_run+0x3c5b>
3c53   52b243:	84 d2                	test   %dl,%dl
3c55   52b245:	0f 85 6c 25 00 00    	jne    52d7b7 <___bpf_prog_run+0x61c7>
3c5b   52b24b:	48 8d 7b 0c          	lea    0xc(%rbx),%rdi
3c5f   52b24f:	44 8b 7b 04          	mov    0x4(%rbx),%r15d
3c63   52b253:	48 89 f8             	mov    %rdi,%rax
3c66   52b256:	48 c1 e8 03          	shr    $0x3,%rax
3c6a   52b25a:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3c6f   52b25f:	48 89 f8             	mov    %rdi,%rax
3c72   52b262:	83 e0 07             	and    $0x7,%eax
3c75   52b265:	83 c0 03             	add    $0x3,%eax
3c78   52b268:	38 d0                	cmp    %dl,%al
3c7a   52b26a:	7c 08                	jl     52b274 <___bpf_prog_run+0x3c84>
3c7c   52b26c:	84 d2                	test   %dl,%dl
3c7e   52b26e:	0f 85 fc 20 00 00    	jne    52d370 <___bpf_prog_run+0x5d80>
3c84   52b274:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3c88   52b278:	8b 43 0c             	mov    0xc(%rbx),%eax
3c8b   52b27b:	48 89 fa             	mov    %rdi,%rdx
3c8e   52b27e:	48 89 f9             	mov    %rdi,%rcx
3c91   52b281:	48 c1 ea 03          	shr    $0x3,%rdx
3c95   52b285:	83 e1 07             	and    $0x7,%ecx
3c98   52b288:	48 c1 e0 20          	shl    $0x20,%rax
3c9c   52b28c:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
3ca1   52b291:	38 ca                	cmp    %cl,%dl
3ca3   52b293:	7f 08                	jg     52b29d <___bpf_prog_run+0x3cad>
3ca5   52b295:	84 d2                	test   %dl,%dl
3ca7   52b297:	0f 85 c1 20 00 00    	jne    52d35e <___bpf_prog_run+0x5d6e>
3cad   52b29d:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
3cb1   52b2a1:	49 09 c7             	or     %rax,%r15
3cb4   52b2a4:	83 e2 0f             	and    $0xf,%edx
3cb7   52b2a7:	49 8d 14 d6          	lea    (%r14,%rdx,8),%rdx
3cbb   52b2ab:	48 89 d0             	mov    %rdx,%rax
3cbe   52b2ae:	48 c1 e8 03          	shr    $0x3,%rax
3cc2   52b2b2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3cc7   52b2b7:	0f 85 f2 2c 00 00    	jne    52dfaf <___bpf_prog_run+0x69bf>
3ccd   52b2bd:	4c 89 3a             	mov    %r15,(%rdx)
3cd0   52b2c0:	48 83 c3 10          	add    $0x10,%rbx
3cd4   52b2c4:	e9 61 c3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3cd9   52b2c9:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3cdd   52b2cd:	48 89 f8             	mov    %rdi,%rax
3ce0   52b2d0:	48 89 fa             	mov    %rdi,%rdx
3ce3   52b2d3:	48 c1 e8 03          	shr    $0x3,%rax
3ce7   52b2d7:	83 e2 07             	and    $0x7,%edx
3cea   52b2da:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3cef   52b2df:	38 d0                	cmp    %dl,%al
3cf1   52b2e1:	7f 08                	jg     52b2eb <___bpf_prog_run+0x3cfb>
3cf3   52b2e3:	84 c0                	test   %al,%al
3cf5   52b2e5:	0f 85 c2 24 00 00    	jne    52d7ad <___bpf_prog_run+0x61bd>
3cfb   52b2eb:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3cff   52b2ef:	83 e0 0f             	and    $0xf,%eax
3d02   52b2f2:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3d06   52b2f6:	4c 89 f8             	mov    %r15,%rax
3d09   52b2f9:	48 c1 e8 03          	shr    $0x3,%rax
3d0d   52b2fd:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3d12   52b302:	0f 85 a6 2e 00 00    	jne    52e1ae <___bpf_prog_run+0x6bbe>
3d18   52b308:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3d1c   52b30c:	49 8b 07             	mov    (%r15),%rax
3d1f   52b30f:	48 89 fa             	mov    %rdi,%rdx
3d22   52b312:	48 c1 ea 03          	shr    $0x3,%rdx
3d26   52b316:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
3d2b   52b31b:	48 89 fa             	mov    %rdi,%rdx
3d2e   52b31e:	83 e2 07             	and    $0x7,%edx
3d31   52b321:	83 c2 03             	add    $0x3,%edx
3d34   52b324:	38 ca                	cmp    %cl,%dl
3d36   52b326:	7c 08                	jl     52b330 <___bpf_prog_run+0x3d40>
3d38   52b328:	84 c9                	test   %cl,%cl
3d3a   52b32a:	0f 85 c6 1f 00 00    	jne    52d2f6 <___bpf_prog_run+0x5d06>
3d40   52b330:	48 63 53 04          	movslq 0x4(%rbx),%rdx
3d44   52b334:	48 83 c3 08          	add    $0x8,%rbx
3d48   52b338:	48 29 d0             	sub    %rdx,%rax
3d4b   52b33b:	49 89 07             	mov    %rax,(%r15)
3d4e   52b33e:	e9 e7 c2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3d53   52b343:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3d57   52b347:	48 89 f8             	mov    %rdi,%rax
3d5a   52b34a:	48 89 fa             	mov    %rdi,%rdx
3d5d   52b34d:	48 c1 e8 03          	shr    $0x3,%rax
3d61   52b351:	83 e2 07             	and    $0x7,%edx
3d64   52b354:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3d69   52b359:	38 d0                	cmp    %dl,%al
3d6b   52b35b:	7f 08                	jg     52b365 <___bpf_prog_run+0x3d75>
3d6d   52b35d:	84 c0                	test   %al,%al
3d6f   52b35f:	0f 85 3e 24 00 00    	jne    52d7a3 <___bpf_prog_run+0x61b3>
3d75   52b365:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3d79   52b369:	83 e0 0f             	and    $0xf,%eax
3d7c   52b36c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3d80   52b370:	4c 89 f8             	mov    %r15,%rax
3d83   52b373:	48 c1 e8 03          	shr    $0x3,%rax
3d87   52b377:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3d8c   52b37c:	0f 85 f0 2d 00 00    	jne    52e172 <___bpf_prog_run+0x6b82>
3d92   52b382:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3d96   52b386:	49 8b 17             	mov    (%r15),%rdx
3d99   52b389:	c0 e8 04             	shr    $0x4,%al
3d9c   52b38c:	0f b6 c0             	movzbl %al,%eax
3d9f   52b38f:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3da3   52b393:	4c 89 f8             	mov    %r15,%rax
3da6   52b396:	48 c1 e8 03          	shr    $0x3,%rax
3daa   52b39a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3daf   52b39f:	0f 85 b8 2d 00 00    	jne    52e15d <___bpf_prog_run+0x6b6d>
3db5   52b3a5:	49 3b 17             	cmp    (%r15),%rdx
3db8   52b3a8:	0f 84 f2 10 00 00    	je     52c4a0 <___bpf_prog_run+0x4eb0>
3dbe   52b3ae:	48 83 c3 08          	add    $0x8,%rbx
3dc2   52b3b2:	e9 73 c2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3dc7   52b3b7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3dcb   52b3bb:	48 89 f8             	mov    %rdi,%rax
3dce   52b3be:	48 89 fa             	mov    %rdi,%rdx
3dd1   52b3c1:	48 c1 e8 03          	shr    $0x3,%rax
3dd5   52b3c5:	83 e2 07             	and    $0x7,%edx
3dd8   52b3c8:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3ddd   52b3cd:	38 d0                	cmp    %dl,%al
3ddf   52b3cf:	7f 08                	jg     52b3d9 <___bpf_prog_run+0x3de9>
3de1   52b3d1:	84 c0                	test   %al,%al
3de3   52b3d3:	0f 85 c0 23 00 00    	jne    52d799 <___bpf_prog_run+0x61a9>
3de9   52b3d9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3ded   52b3dd:	83 e0 0f             	and    $0xf,%eax
3df0   52b3e0:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3df4   52b3e4:	4c 89 f8             	mov    %r15,%rax
3df7   52b3e7:	48 c1 e8 03          	shr    $0x3,%rax
3dfb   52b3eb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3e00   52b3f0:	0f 85 7d 2a 00 00    	jne    52de73 <___bpf_prog_run+0x6883>
3e06   52b3f6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3e0a   52b3fa:	49 8b 17             	mov    (%r15),%rdx
3e0d   52b3fd:	c0 e8 04             	shr    $0x4,%al
3e10   52b400:	0f b6 c0             	movzbl %al,%eax
3e13   52b403:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
3e17   52b407:	48 89 c1             	mov    %rax,%rcx
3e1a   52b40a:	48 c1 e9 03          	shr    $0x3,%rcx
3e1e   52b40e:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
3e23   52b413:	0f 85 3d 2a 00 00    	jne    52de56 <___bpf_prog_run+0x6866>
3e29   52b419:	48 33 10             	xor    (%rax),%rdx
3e2c   52b41c:	48 83 c3 08          	add    $0x8,%rbx
3e30   52b420:	49 89 17             	mov    %rdx,(%r15)
3e33   52b423:	e9 02 c2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3e38   52b428:	4c 8d 43 01          	lea    0x1(%rbx),%r8
3e3c   52b42c:	4c 89 c0             	mov    %r8,%rax
3e3f   52b42f:	4c 89 c2             	mov    %r8,%rdx
3e42   52b432:	48 c1 e8 03          	shr    $0x3,%rax
3e46   52b436:	83 e2 07             	and    $0x7,%edx
3e49   52b439:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3e4e   52b43e:	38 d0                	cmp    %dl,%al
3e50   52b440:	7f 08                	jg     52b44a <___bpf_prog_run+0x3e5a>
3e52   52b442:	84 c0                	test   %al,%al
3e54   52b444:	0f 85 3a 23 00 00    	jne    52d784 <___bpf_prog_run+0x6194>
3e5a   52b44a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3e5e   52b44e:	83 e0 0f             	and    $0xf,%eax
3e61   52b451:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3e65   52b455:	4c 89 f8             	mov    %r15,%rax
3e68   52b458:	48 c1 e8 03          	shr    $0x3,%rax
3e6c   52b45c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3e71   52b461:	0f 85 1b 31 00 00    	jne    52e582 <___bpf_prog_run+0x6f92>
3e77   52b467:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
3e7b   52b46b:	49 8b 07             	mov    (%r15),%rax
3e7e   52b46e:	4c 89 ca             	mov    %r9,%rdx
3e81   52b471:	48 c1 ea 03          	shr    $0x3,%rdx
3e85   52b475:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
3e8a   52b47a:	4c 89 ca             	mov    %r9,%rdx
3e8d   52b47d:	83 e2 07             	and    $0x7,%edx
3e90   52b480:	83 c2 03             	add    $0x3,%edx
3e93   52b483:	38 ca                	cmp    %cl,%dl
3e95   52b485:	7c 08                	jl     52b48f <___bpf_prog_run+0x3e9f>
3e97   52b487:	84 c9                	test   %cl,%cl
3e99   52b489:	0f 85 eb 1e 00 00    	jne    52d37a <___bpf_prog_run+0x5d8a>
3e9f   52b48f:	8b 4b 04             	mov    0x4(%rbx),%ecx
3ea2   52b492:	83 f9 3f             	cmp    $0x3f,%ecx
3ea5   52b495:	0f 87 00 00 00 00    	ja     52b49b <___bpf_prog_run+0x3eab>	52b497: R_X86_64_PC32	.text.unlikely+0x7950
3eab   52b49b:	4c 89 fa             	mov    %r15,%rdx
3eae   52b49e:	48 d3 f8             	sar    %cl,%rax
3eb1   52b4a1:	48 c1 ea 03          	shr    $0x3,%rdx
3eb5   52b4a5:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
3eba   52b4aa:	0f 85 74 30 00 00    	jne    52e524 <___bpf_prog_run+0x6f34>
3ec0   52b4b0:	49 89 07             	mov    %rax,(%r15)
3ec3   52b4b3:	48 83 c3 08          	add    $0x8,%rbx
3ec7   52b4b7:	e9 6e c1 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3ecc   52b4bc:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3ed0   52b4c0:	48 89 f8             	mov    %rdi,%rax
3ed3   52b4c3:	48 89 fa             	mov    %rdi,%rdx
3ed6   52b4c6:	48 c1 e8 03          	shr    $0x3,%rax
3eda   52b4ca:	83 e2 07             	and    $0x7,%edx
3edd   52b4cd:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3ee2   52b4d2:	38 d0                	cmp    %dl,%al
3ee4   52b4d4:	7f 08                	jg     52b4de <___bpf_prog_run+0x3eee>
3ee6   52b4d6:	84 c0                	test   %al,%al
3ee8   52b4d8:	0f 85 9c 22 00 00    	jne    52d77a <___bpf_prog_run+0x618a>
3eee   52b4de:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3ef2   52b4e2:	83 e0 0f             	and    $0xf,%eax
3ef5   52b4e5:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3ef9   52b4e9:	4c 89 f8             	mov    %r15,%rax
3efc   52b4ec:	48 c1 e8 03          	shr    $0x3,%rax
3f00   52b4f0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3f05   52b4f5:	0f 85 b6 2f 00 00    	jne    52e4b1 <___bpf_prog_run+0x6ec1>
3f0b   52b4fb:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3f0f   52b4ff:	49 8b 0f             	mov    (%r15),%rcx
3f12   52b502:	48 89 f8             	mov    %rdi,%rax
3f15   52b505:	48 c1 e8 03          	shr    $0x3,%rax
3f19   52b509:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3f1e   52b50e:	48 89 f8             	mov    %rdi,%rax
3f21   52b511:	83 e0 07             	and    $0x7,%eax
3f24   52b514:	83 c0 03             	add    $0x3,%eax
3f27   52b517:	38 d0                	cmp    %dl,%al
3f29   52b519:	7c 08                	jl     52b523 <___bpf_prog_run+0x3f33>
3f2b   52b51b:	84 d2                	test   %dl,%dl
3f2d   52b51d:	0f 85 8b 1d 00 00    	jne    52d2ae <___bpf_prog_run+0x5cbe>
3f33   52b523:	48 63 43 04          	movslq 0x4(%rbx),%rax
3f37   52b527:	48 83 c3 08          	add    $0x8,%rbx
3f3b   52b52b:	48 21 c8             	and    %rcx,%rax
3f3e   52b52e:	49 89 07             	mov    %rax,(%r15)
3f41   52b531:	e9 f4 c0 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
3f46   52b536:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3f4a   52b53a:	48 89 f8             	mov    %rdi,%rax
3f4d   52b53d:	48 89 fa             	mov    %rdi,%rdx
3f50   52b540:	48 c1 e8 03          	shr    $0x3,%rax
3f54   52b544:	83 e2 07             	and    $0x7,%edx
3f57   52b547:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3f5c   52b54c:	38 d0                	cmp    %dl,%al
3f5e   52b54e:	7f 08                	jg     52b558 <___bpf_prog_run+0x3f68>
3f60   52b550:	84 c0                	test   %al,%al
3f62   52b552:	0f 85 18 22 00 00    	jne    52d770 <___bpf_prog_run+0x6180>
3f68   52b558:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3f6c   52b55c:	83 e0 0f             	and    $0xf,%eax
3f6f   52b55f:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3f73   52b563:	4c 89 f8             	mov    %r15,%rax
3f76   52b566:	48 c1 e8 03          	shr    $0x3,%rax
3f7a   52b56a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3f7f   52b56f:	0f 85 8d 2b 00 00    	jne    52e102 <___bpf_prog_run+0x6b12>
3f85   52b575:	49 8d 7e 58          	lea    0x58(%r14),%rdi
3f89   52b579:	45 8b 3f             	mov    (%r15),%r15d
3f8c   52b57c:	48 89 f8             	mov    %rdi,%rax
3f8f   52b57f:	48 c1 e8 03          	shr    $0x3,%rax
3f93   52b583:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3f98   52b588:	0f 85 b8 2b 00 00    	jne    52e146 <___bpf_prog_run+0x6b56>
3f9e   52b58e:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3fa2   52b592:	4d 89 7e 58          	mov    %r15,0x58(%r14)
3fa6   52b596:	48 89 f8             	mov    %rdi,%rax
3fa9   52b599:	48 c1 e8 03          	shr    $0x3,%rax
3fad   52b59d:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3fb2   52b5a2:	48 89 f8             	mov    %rdi,%rax
3fb5   52b5a5:	83 e0 07             	and    $0x7,%eax
3fb8   52b5a8:	83 c0 03             	add    $0x3,%eax
3fbb   52b5ab:	38 d0                	cmp    %dl,%al
3fbd   52b5ad:	7c 08                	jl     52b5b7 <___bpf_prog_run+0x3fc7>
3fbf   52b5af:	84 d2                	test   %dl,%dl
3fc1   52b5b1:	0f 85 7f 1d 00 00    	jne    52d336 <___bpf_prog_run+0x5d46>
3fc7   52b5b7:	8b 4b 04             	mov    0x4(%rbx),%ecx
3fca   52b5ba:	4c 89 f8             	mov    %r15,%rax
3fcd   52b5bd:	31 d2                	xor    %edx,%edx
3fcf   52b5bf:	48 f7 f1             	div    %rcx
3fd2   52b5c2:	49 89 46 58          	mov    %rax,0x58(%r14)
3fd6   52b5c6:	49 89 c7             	mov    %rax,%r15
3fd9   52b5c9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3fdd   52b5cd:	83 e0 0f             	and    $0xf,%eax
3fe0   52b5d0:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
3fe4   52b5d4:	48 89 c2             	mov    %rax,%rdx
3fe7   52b5d7:	48 c1 ea 03          	shr    $0x3,%rdx
3feb   52b5db:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
3ff0   52b5e0:	0f 85 fc 25 00 00    	jne    52dbe2 <___bpf_prog_run+0x65f2>
3ff6   52b5e6:	4c 89 38             	mov    %r15,(%rax)
3ff9   52b5e9:	48 83 c3 08          	add    $0x8,%rbx
3ffd   52b5ed:	e9 38 c0 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4002   52b5f2:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4006   52b5f6:	48 89 f8             	mov    %rdi,%rax
4009   52b5f9:	48 89 fa             	mov    %rdi,%rdx
400c   52b5fc:	48 c1 e8 03          	shr    $0x3,%rax
4010   52b600:	83 e2 07             	and    $0x7,%edx
4013   52b603:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4018   52b608:	38 d0                	cmp    %dl,%al
401a   52b60a:	7f 08                	jg     52b614 <___bpf_prog_run+0x4024>
401c   52b60c:	84 c0                	test   %al,%al
401e   52b60e:	0f 85 52 21 00 00    	jne    52d766 <___bpf_prog_run+0x6176>
4024   52b614:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4028   52b618:	83 e0 0f             	and    $0xf,%eax
402b   52b61b:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
402f   52b61f:	4c 89 f8             	mov    %r15,%rax
4032   52b622:	48 c1 e8 03          	shr    $0x3,%rax
4036   52b626:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
403b   52b62b:	0f 85 ee 27 00 00    	jne    52de1f <___bpf_prog_run+0x682f>
4041   52b631:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
4045   52b635:	49 8b 0f             	mov    (%r15),%rcx
4048   52b638:	48 89 f8             	mov    %rdi,%rax
404b   52b63b:	48 c1 e8 03          	shr    $0x3,%rax
404f   52b63f:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4054   52b644:	48 89 f8             	mov    %rdi,%rax
4057   52b647:	83 e0 07             	and    $0x7,%eax
405a   52b64a:	83 c0 03             	add    $0x3,%eax
405d   52b64d:	38 d0                	cmp    %dl,%al
405f   52b64f:	7c 08                	jl     52b659 <___bpf_prog_run+0x4069>
4061   52b651:	84 d2                	test   %dl,%dl
4063   52b653:	0f 85 9e 1b 00 00    	jne    52d1f7 <___bpf_prog_run+0x5c07>
4069   52b659:	48 63 43 04          	movslq 0x4(%rbx),%rax
406d   52b65d:	48 83 c3 08          	add    $0x8,%rbx
4071   52b661:	48 01 c8             	add    %rcx,%rax
4074   52b664:	49 89 07             	mov    %rax,(%r15)
4077   52b667:	e9 be bf ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
407c   52b66c:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4080   52b670:	48 89 f8             	mov    %rdi,%rax
4083   52b673:	48 89 fa             	mov    %rdi,%rdx
4086   52b676:	48 c1 e8 03          	shr    $0x3,%rax
408a   52b67a:	83 e2 07             	and    $0x7,%edx
408d   52b67d:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4092   52b682:	38 d0                	cmp    %dl,%al
4094   52b684:	7f 08                	jg     52b68e <___bpf_prog_run+0x409e>
4096   52b686:	84 c0                	test   %al,%al
4098   52b688:	0f 85 ce 20 00 00    	jne    52d75c <___bpf_prog_run+0x616c>
409e   52b68e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
40a2   52b692:	c0 e8 04             	shr    $0x4,%al
40a5   52b695:	0f b6 c0             	movzbl %al,%eax
40a8   52b698:	49 8d 14 c6          	lea    (%r14,%rax,8),%rdx
40ac   52b69c:	48 89 d0             	mov    %rdx,%rax
40af   52b69f:	48 c1 e8 03          	shr    $0x3,%rax
40b3   52b6a3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
40b8   52b6a8:	0f 85 47 2f 00 00    	jne    52e5f5 <___bpf_prog_run+0x7005>
40be   52b6ae:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
40c2   52b6b2:	83 e0 0f             	and    $0xf,%eax
40c5   52b6b5:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
40c9   52b6b9:	8b 02                	mov    (%rdx),%eax
40cb   52b6bb:	4c 89 fa             	mov    %r15,%rdx
40ce   52b6be:	48 c1 ea 03          	shr    $0x3,%rdx
40d2   52b6c2:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
40d7   52b6c7:	0f 85 13 2f 00 00    	jne    52e5e0 <___bpf_prog_run+0x6ff0>
40dd   52b6cd:	49 89 07             	mov    %rax,(%r15)
40e0   52b6d0:	48 83 c3 08          	add    $0x8,%rbx
40e4   52b6d4:	e9 51 bf ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
40e9   52b6d9:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
40ed   52b6dd:	48 89 f8             	mov    %rdi,%rax
40f0   52b6e0:	48 89 fa             	mov    %rdi,%rdx
40f3   52b6e3:	48 c1 e8 03          	shr    $0x3,%rax
40f7   52b6e7:	83 e2 07             	and    $0x7,%edx
40fa   52b6ea:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
40ff   52b6ef:	38 d0                	cmp    %dl,%al
4101   52b6f1:	7f 08                	jg     52b6fb <___bpf_prog_run+0x410b>
4103   52b6f3:	84 c0                	test   %al,%al
4105   52b6f5:	0f 85 57 20 00 00    	jne    52d752 <___bpf_prog_run+0x6162>
410b   52b6fb:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
410f   52b6ff:	83 e0 0f             	and    $0xf,%eax
4112   52b702:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4116   52b706:	4c 89 f8             	mov    %r15,%rax
4119   52b709:	48 c1 e8 03          	shr    $0x3,%rax
411d   52b70d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4122   52b712:	0f 85 cd 2a 00 00    	jne    52e1e5 <___bpf_prog_run+0x6bf5>
4128   52b718:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
412c   52b71c:	49 8b 17             	mov    (%r15),%rdx
412f   52b71f:	c0 e8 04             	shr    $0x4,%al
4132   52b722:	0f b6 c0             	movzbl %al,%eax
4135   52b725:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4139   52b729:	48 89 c1             	mov    %rax,%rcx
413c   52b72c:	48 c1 e9 03          	shr    $0x3,%rcx
4140   52b730:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
4145   52b735:	0f 85 8d 2a 00 00    	jne    52e1c8 <___bpf_prog_run+0x6bd8>
414b   52b73b:	48 0b 10             	or     (%rax),%rdx
414e   52b73e:	48 83 c3 08          	add    $0x8,%rbx
4152   52b742:	49 89 17             	mov    %rdx,(%r15)
4155   52b745:	e9 e0 be ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
415a   52b74a:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
415e   52b74e:	48 89 f8             	mov    %rdi,%rax
4161   52b751:	48 89 fa             	mov    %rdi,%rdx
4164   52b754:	48 c1 e8 03          	shr    $0x3,%rax
4168   52b758:	83 e2 07             	and    $0x7,%edx
416b   52b75b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4170   52b760:	38 d0                	cmp    %dl,%al
4172   52b762:	7f 08                	jg     52b76c <___bpf_prog_run+0x417c>
4174   52b764:	84 c0                	test   %al,%al
4176   52b766:	0f 85 dc 1f 00 00    	jne    52d748 <___bpf_prog_run+0x6158>
417c   52b76c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4180   52b770:	83 e0 0f             	and    $0xf,%eax
4183   52b773:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4187   52b777:	4c 89 f8             	mov    %r15,%rax
418a   52b77a:	48 c1 e8 03          	shr    $0x3,%rax
418e   52b77e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4193   52b783:	0f 85 6c 2d 00 00    	jne    52e4f5 <___bpf_prog_run+0x6f05>
4199   52b789:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
419d   52b78d:	4d 8b 3f             	mov    (%r15),%r15
41a0   52b790:	48 89 f8             	mov    %rdi,%rax
41a3   52b793:	48 c1 e8 03          	shr    $0x3,%rax
41a7   52b797:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
41ac   52b79c:	48 89 f8             	mov    %rdi,%rax
41af   52b79f:	83 e0 07             	and    $0x7,%eax
41b2   52b7a2:	83 c0 03             	add    $0x3,%eax
41b5   52b7a5:	38 d0                	cmp    %dl,%al
41b7   52b7a7:	7c 08                	jl     52b7b1 <___bpf_prog_run+0x41c1>
41b9   52b7a9:	84 d2                	test   %dl,%dl
41bb   52b7ab:	0f 85 99 1b 00 00    	jne    52d34a <___bpf_prog_run+0x5d5a>
41c1   52b7b1:	48 63 43 04          	movslq 0x4(%rbx),%rax
41c5   52b7b5:	49 39 c7             	cmp    %rax,%r15
41c8   52b7b8:	0f 84 ae 0c 00 00    	je     52c46c <___bpf_prog_run+0x4e7c>
41ce   52b7be:	48 83 c3 08          	add    $0x8,%rbx
41d2   52b7c2:	e9 63 be ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
41d7   52b7c7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
41db   52b7cb:	48 89 f8             	mov    %rdi,%rax
41de   52b7ce:	48 89 fa             	mov    %rdi,%rdx
41e1   52b7d1:	48 c1 e8 03          	shr    $0x3,%rax
41e5   52b7d5:	83 e2 07             	and    $0x7,%edx
41e8   52b7d8:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
41ed   52b7dd:	38 d0                	cmp    %dl,%al
41ef   52b7df:	7f 08                	jg     52b7e9 <___bpf_prog_run+0x41f9>
41f1   52b7e1:	84 c0                	test   %al,%al
41f3   52b7e3:	0f 85 55 1f 00 00    	jne    52d73e <___bpf_prog_run+0x614e>
41f9   52b7e9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
41fd   52b7ed:	83 e0 0f             	and    $0xf,%eax
4200   52b7f0:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4204   52b7f4:	4c 89 f8             	mov    %r15,%rax
4207   52b7f7:	48 c1 e8 03          	shr    $0x3,%rax
420b   52b7fb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4210   52b800:	0f 85 12 2b 00 00    	jne    52e318 <___bpf_prog_run+0x6d28>
4216   52b806:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
421a   52b80a:	49 8b 17             	mov    (%r15),%rdx
421d   52b80d:	c0 e8 04             	shr    $0x4,%al
4220   52b810:	0f b6 c0             	movzbl %al,%eax
4223   52b813:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4227   52b817:	48 89 c1             	mov    %rax,%rcx
422a   52b81a:	48 c1 e9 03          	shr    $0x3,%rcx
422e   52b81e:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
4233   52b823:	0f 85 d2 2a 00 00    	jne    52e2fb <___bpf_prog_run+0x6d0b>
4239   52b829:	48 2b 10             	sub    (%rax),%rdx
423c   52b82c:	48 83 c3 08          	add    $0x8,%rbx
4240   52b830:	49 89 17             	mov    %rdx,(%r15)
4243   52b833:	e9 f2 bd ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4248   52b838:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
424c   52b83c:	48 89 f8             	mov    %rdi,%rax
424f   52b83f:	48 89 fa             	mov    %rdi,%rdx
4252   52b842:	48 c1 e8 03          	shr    $0x3,%rax
4256   52b846:	83 e2 07             	and    $0x7,%edx
4259   52b849:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
425e   52b84e:	38 d0                	cmp    %dl,%al
4260   52b850:	7f 08                	jg     52b85a <___bpf_prog_run+0x426a>
4262   52b852:	84 c0                	test   %al,%al
4264   52b854:	0f 85 da 1e 00 00    	jne    52d734 <___bpf_prog_run+0x6144>
426a   52b85a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
426e   52b85e:	83 e0 0f             	and    $0xf,%eax
4271   52b861:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4275   52b865:	4c 89 f8             	mov    %r15,%rax
4278   52b868:	48 c1 e8 03          	shr    $0x3,%rax
427c   52b86c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4281   52b871:	0f 85 e9 2c 00 00    	jne    52e560 <___bpf_prog_run+0x6f70>
4287   52b877:	49 8d 7e 58          	lea    0x58(%r14),%rdi
428b   52b87b:	41 8b 07             	mov    (%r15),%eax
428e   52b87e:	48 89 fa             	mov    %rdi,%rdx
4291   52b881:	48 c1 ea 03          	shr    $0x3,%rdx
4295   52b885:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
429a   52b88a:	0f 85 be 2c 00 00    	jne    52e54e <___bpf_prog_run+0x6f5e>
42a0   52b890:	49 89 46 58          	mov    %rax,0x58(%r14)
42a4   52b894:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
42a8   52b898:	c0 ea 04             	shr    $0x4,%dl
42ab   52b89b:	0f b6 d2             	movzbl %dl,%edx
42ae   52b89e:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
42b2   52b8a2:	4c 89 fa             	mov    %r15,%rdx
42b5   52b8a5:	48 c1 ea 03          	shr    $0x3,%rdx
42b9   52b8a9:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
42be   52b8ae:	0f 85 85 2c 00 00    	jne    52e539 <___bpf_prog_run+0x6f49>
42c4   52b8b4:	41 8b 0f             	mov    (%r15),%ecx
42c7   52b8b7:	31 d2                	xor    %edx,%edx
42c9   52b8b9:	48 f7 f1             	div    %rcx
42cc   52b8bc:	49 89 46 58          	mov    %rax,0x58(%r14)
42d0   52b8c0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
42d4   52b8c4:	83 e0 0f             	and    $0xf,%eax
42d7   52b8c7:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
42db   52b8cb:	4c 89 f8             	mov    %r15,%rax
42de   52b8ce:	48 c1 e8 03          	shr    $0x3,%rax
42e2   52b8d2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
42e7   52b8d7:	0f 85 09 27 00 00    	jne    52dfe6 <___bpf_prog_run+0x69f6>
42ed   52b8dd:	49 89 17             	mov    %rdx,(%r15)
42f0   52b8e0:	48 83 c3 08          	add    $0x8,%rbx
42f4   52b8e4:	e9 41 bd ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
42f9   52b8e9:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
42fd   52b8ed:	48 89 f8             	mov    %rdi,%rax
4300   52b8f0:	48 89 fa             	mov    %rdi,%rdx
4303   52b8f3:	48 c1 e8 03          	shr    $0x3,%rax
4307   52b8f7:	83 e2 07             	and    $0x7,%edx
430a   52b8fa:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
430f   52b8ff:	38 d0                	cmp    %dl,%al
4311   52b901:	7f 08                	jg     52b90b <___bpf_prog_run+0x431b>
4313   52b903:	84 c0                	test   %al,%al
4315   52b905:	0f 85 1f 1e 00 00    	jne    52d72a <___bpf_prog_run+0x613a>
431b   52b90b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
431f   52b90f:	83 e0 0f             	and    $0xf,%eax
4322   52b912:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4326   52b916:	4c 89 f8             	mov    %r15,%rax
4329   52b919:	48 c1 e8 03          	shr    $0x3,%rax
432d   52b91d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4332   52b922:	0f 85 c0 2b 00 00    	jne    52e4e8 <___bpf_prog_run+0x6ef8>
4338   52b928:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
433c   52b92c:	49 8b 17             	mov    (%r15),%rdx
433f   52b92f:	c0 e8 04             	shr    $0x4,%al
4342   52b932:	0f b6 c0             	movzbl %al,%eax
4345   52b935:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4349   52b939:	48 89 c1             	mov    %rax,%rcx
434c   52b93c:	48 c1 e9 03          	shr    $0x3,%rcx
4350   52b940:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
4355   52b945:	0f 85 80 2b 00 00    	jne    52e4cb <___bpf_prog_run+0x6edb>
435b   52b94b:	48 23 10             	and    (%rax),%rdx
435e   52b94e:	48 83 c3 08          	add    $0x8,%rbx
4362   52b952:	49 89 17             	mov    %rdx,(%r15)
4365   52b955:	e9 d0 bc ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
436a   52b95a:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
436e   52b95e:	48 89 f8             	mov    %rdi,%rax
4371   52b961:	48 c1 e8 03          	shr    $0x3,%rax
4375   52b965:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
437a   52b96a:	48 89 f8             	mov    %rdi,%rax
437d   52b96d:	83 e0 07             	and    $0x7,%eax
4380   52b970:	83 c0 03             	add    $0x3,%eax
4383   52b973:	38 d0                	cmp    %dl,%al
4385   52b975:	7c 08                	jl     52b97f <___bpf_prog_run+0x438f>
4387   52b977:	84 d2                	test   %dl,%dl
4389   52b979:	0f 85 a1 1d 00 00    	jne    52d720 <___bpf_prog_run+0x6130>
438f   52b97f:	8b 43 04             	mov    0x4(%rbx),%eax
4392   52b982:	83 f8 10             	cmp    $0x10,%eax
4395   52b985:	0f 84 43 0a 00 00    	je     52c3ce <___bpf_prog_run+0x4dde>
439b   52b98b:	83 f8 20             	cmp    $0x20,%eax
439e   52b98e:	0f 84 e1 09 00 00    	je     52c375 <___bpf_prog_run+0x4d85>
43a4   52b994:	48 83 c3 08          	add    $0x8,%rbx
43a8   52b998:	e9 8d bc ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
43ad   52b99d:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
43b1   52b9a1:	48 89 f8             	mov    %rdi,%rax
43b4   52b9a4:	48 89 fa             	mov    %rdi,%rdx
43b7   52b9a7:	48 c1 e8 03          	shr    $0x3,%rax
43bb   52b9ab:	83 e2 07             	and    $0x7,%edx
43be   52b9ae:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
43c3   52b9b3:	38 d0                	cmp    %dl,%al
43c5   52b9b5:	7f 08                	jg     52b9bf <___bpf_prog_run+0x43cf>
43c7   52b9b7:	84 c0                	test   %al,%al
43c9   52b9b9:	0f 85 57 1d 00 00    	jne    52d716 <___bpf_prog_run+0x6126>
43cf   52b9bf:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
43d3   52b9c3:	83 e0 0f             	and    $0xf,%eax
43d6   52b9c6:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
43da   52b9ca:	4c 89 f8             	mov    %r15,%rax
43dd   52b9cd:	48 c1 e8 03          	shr    $0x3,%rax
43e1   52b9d1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
43e6   52b9d6:	0f 85 6d 24 00 00    	jne    52de49 <___bpf_prog_run+0x6859>
43ec   52b9dc:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
43f0   52b9e0:	49 8b 17             	mov    (%r15),%rdx
43f3   52b9e3:	c0 e8 04             	shr    $0x4,%al
43f6   52b9e6:	0f b6 c0             	movzbl %al,%eax
43f9   52b9e9:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
43fd   52b9ed:	48 89 c1             	mov    %rax,%rcx
4400   52b9f0:	48 c1 e9 03          	shr    $0x3,%rcx
4404   52b9f4:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
4409   52b9f9:	0f 85 2d 24 00 00    	jne    52de2c <___bpf_prog_run+0x683c>
440f   52b9ff:	48 03 10             	add    (%rax),%rdx
4412   52ba02:	48 83 c3 08          	add    $0x8,%rbx
4416   52ba06:	49 89 17             	mov    %rdx,(%r15)
4419   52ba09:	e9 1c bc ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
441e   52ba0e:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4422   52ba12:	48 89 f8             	mov    %rdi,%rax
4425   52ba15:	48 89 fa             	mov    %rdi,%rdx
4428   52ba18:	48 c1 e8 03          	shr    $0x3,%rax
442c   52ba1c:	83 e2 07             	and    $0x7,%edx
442f   52ba1f:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4434   52ba24:	38 d0                	cmp    %dl,%al
4436   52ba26:	7f 08                	jg     52ba30 <___bpf_prog_run+0x4440>
4438   52ba28:	84 c0                	test   %al,%al
443a   52ba2a:	0f 85 dc 1c 00 00    	jne    52d70c <___bpf_prog_run+0x611c>
4440   52ba30:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4444   52ba34:	89 c2                	mov    %eax,%edx
4446   52ba36:	83 e0 0f             	and    $0xf,%eax
4449   52ba39:	c0 ea 04             	shr    $0x4,%dl
444c   52ba3c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4450   52ba40:	0f b6 d2             	movzbl %dl,%edx
4453   52ba43:	49 8d 14 d6          	lea    (%r14,%rdx,8),%rdx
4457   52ba47:	48 89 d0             	mov    %rdx,%rax
445a   52ba4a:	48 c1 e8 03          	shr    $0x3,%rax
445e   52ba4e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4463   52ba53:	0f 85 ef 29 00 00    	jne    52e448 <___bpf_prog_run+0x6e58>
4469   52ba59:	48 8b 02             	mov    (%rdx),%rax
446c   52ba5c:	4c 89 fa             	mov    %r15,%rdx
446f   52ba5f:	48 c1 ea 03          	shr    $0x3,%rdx
4473   52ba63:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4478   52ba68:	0f 85 c5 29 00 00    	jne    52e433 <___bpf_prog_run+0x6e43>
447e   52ba6e:	49 89 07             	mov    %rax,(%r15)
4481   52ba71:	48 83 c3 08          	add    $0x8,%rbx
4485   52ba75:	e9 b0 bb ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
448a   52ba7a:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
448e   52ba7e:	48 89 f8             	mov    %rdi,%rax
4491   52ba81:	48 c1 e8 03          	shr    $0x3,%rax
4495   52ba85:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
449a   52ba8a:	48 89 f8             	mov    %rdi,%rax
449d   52ba8d:	83 e0 07             	and    $0x7,%eax
44a0   52ba90:	83 c0 01             	add    $0x1,%eax
44a3   52ba93:	38 d0                	cmp    %dl,%al
44a5   52ba95:	7c 08                	jl     52ba9f <___bpf_prog_run+0x44af>
44a7   52ba97:	84 d2                	test   %dl,%dl
44a9   52ba99:	0f 85 63 1c 00 00    	jne    52d702 <___bpf_prog_run+0x6112>
44af   52ba9f:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
44b4   52baa4:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
44b9   52baa9:	e9 7c bb ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
44be   52baae:	4c 8d 43 01          	lea    0x1(%rbx),%r8
44c2   52bab2:	4c 89 c0             	mov    %r8,%rax
44c5   52bab5:	4c 89 c2             	mov    %r8,%rdx
44c8   52bab8:	48 c1 e8 03          	shr    $0x3,%rax
44cc   52babc:	83 e2 07             	and    $0x7,%edx
44cf   52babf:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
44d4   52bac4:	38 d0                	cmp    %dl,%al
44d6   52bac6:	7f 08                	jg     52bad0 <___bpf_prog_run+0x44e0>
44d8   52bac8:	84 c0                	test   %al,%al
44da   52baca:	0f 85 1d 1c 00 00    	jne    52d6ed <___bpf_prog_run+0x60fd>
44e0   52bad0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
44e4   52bad4:	83 e0 0f             	and    $0xf,%eax
44e7   52bad7:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
44eb   52badb:	4c 89 f8             	mov    %r15,%rax
44ee   52bade:	48 c1 e8 03          	shr    $0x3,%rax
44f2   52bae2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
44f7   52bae7:	0f 85 02 29 00 00    	jne    52e3ef <___bpf_prog_run+0x6dff>
44fd   52baed:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
4501   52baf1:	49 8b 07             	mov    (%r15),%rax
4504   52baf4:	4c 89 ca             	mov    %r9,%rdx
4507   52baf7:	48 c1 ea 03          	shr    $0x3,%rdx
450b   52bafb:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
4510   52bb00:	4c 89 ca             	mov    %r9,%rdx
4513   52bb03:	83 e2 07             	and    $0x7,%edx
4516   52bb06:	83 c2 03             	add    $0x3,%edx
4519   52bb09:	38 ca                	cmp    %cl,%dl
451b   52bb0b:	7c 08                	jl     52bb15 <___bpf_prog_run+0x4525>
451d   52bb0d:	84 c9                	test   %cl,%cl
451f   52bb0f:	0f 85 74 17 00 00    	jne    52d289 <___bpf_prog_run+0x5c99>
4525   52bb15:	8b 4b 04             	mov    0x4(%rbx),%ecx
4528   52bb18:	83 f9 1f             	cmp    $0x1f,%ecx
452b   52bb1b:	0f 87 00 00 00 00    	ja     52bb21 <___bpf_prog_run+0x4531>	52bb1d: R_X86_64_PC32	.text.unlikely+0x789f
4531   52bb21:	4c 89 fa             	mov    %r15,%rdx
4534   52bb24:	d3 f8                	sar    %cl,%eax
4536   52bb26:	48 c1 ea 03          	shr    $0x3,%rdx
453a   52bb2a:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
453f   52bb2f:	0f 85 cf 28 00 00    	jne    52e404 <___bpf_prog_run+0x6e14>
4545   52bb35:	49 89 07             	mov    %rax,(%r15)
4548   52bb38:	48 83 c3 08          	add    $0x8,%rbx
454c   52bb3c:	e9 e9 ba ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4551   52bb41:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4555   52bb45:	48 89 f8             	mov    %rdi,%rax
4558   52bb48:	48 89 fa             	mov    %rdi,%rdx
455b   52bb4b:	48 c1 e8 03          	shr    $0x3,%rax
455f   52bb4f:	83 e2 07             	and    $0x7,%edx
4562   52bb52:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4567   52bb57:	38 d0                	cmp    %dl,%al
4569   52bb59:	7f 08                	jg     52bb63 <___bpf_prog_run+0x4573>
456b   52bb5b:	84 c0                	test   %al,%al
456d   52bb5d:	0f 85 80 1b 00 00    	jne    52d6e3 <___bpf_prog_run+0x60f3>
4573   52bb63:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4577   52bb67:	83 e0 0f             	and    $0xf,%eax
457a   52bb6a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
457e   52bb6e:	4c 89 f8             	mov    %r15,%rax
4581   52bb71:	48 c1 e8 03          	shr    $0x3,%rax
4585   52bb75:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
458a   52bb7a:	0f 85 0d 22 00 00    	jne    52dd8d <___bpf_prog_run+0x679d>
4590   52bb80:	49 8d 7e 58          	lea    0x58(%r14),%rdi
4594   52bb84:	45 8b 3f             	mov    (%r15),%r15d
4597   52bb87:	48 89 f8             	mov    %rdi,%rax
459a   52bb8a:	48 c1 e8 03          	shr    $0x3,%rax
459e   52bb8e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
45a3   52bb93:	0f 85 ea 21 00 00    	jne    52dd83 <___bpf_prog_run+0x6793>
45a9   52bb99:	4d 89 7e 58          	mov    %r15,0x58(%r14)
45ad   52bb9d:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
45b1   52bba1:	c0 e8 04             	shr    $0x4,%al
45b4   52bba4:	0f b6 c0             	movzbl %al,%eax
45b7   52bba7:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
45bb   52bbab:	48 89 c2             	mov    %rax,%rdx
45be   52bbae:	48 c1 ea 03          	shr    $0x3,%rdx
45c2   52bbb2:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
45c7   52bbb7:	0f 85 b1 21 00 00    	jne    52dd6e <___bpf_prog_run+0x677e>
45cd   52bbbd:	8b 08                	mov    (%rax),%ecx
45cf   52bbbf:	31 d2                	xor    %edx,%edx
45d1   52bbc1:	4c 89 f8             	mov    %r15,%rax
45d4   52bbc4:	48 f7 f1             	div    %rcx
45d7   52bbc7:	49 89 46 58          	mov    %rax,0x58(%r14)
45db   52bbcb:	49 89 c7             	mov    %rax,%r15
45de   52bbce:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
45e2   52bbd2:	83 e0 0f             	and    $0xf,%eax
45e5   52bbd5:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
45e9   52bbd9:	48 89 c2             	mov    %rax,%rdx
45ec   52bbdc:	48 c1 ea 03          	shr    $0x3,%rdx
45f0   52bbe0:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
45f5   52bbe5:	0f 85 6e 21 00 00    	jne    52dd59 <___bpf_prog_run+0x6769>
45fb   52bbeb:	4c 89 38             	mov    %r15,(%rax)
45fe   52bbee:	48 83 c3 08          	add    $0x8,%rbx
4602   52bbf2:	e9 33 ba ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4607   52bbf7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
460b   52bbfb:	48 89 f8             	mov    %rdi,%rax
460e   52bbfe:	48 89 fa             	mov    %rdi,%rdx
4611   52bc01:	48 c1 e8 03          	shr    $0x3,%rax
4615   52bc05:	83 e2 07             	and    $0x7,%edx
4618   52bc08:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
461d   52bc0d:	38 d0                	cmp    %dl,%al
461f   52bc0f:	7f 08                	jg     52bc19 <___bpf_prog_run+0x4629>
4621   52bc11:	84 c0                	test   %al,%al
4623   52bc13:	0f 85 c0 1a 00 00    	jne    52d6d9 <___bpf_prog_run+0x60e9>
4629   52bc19:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
462d   52bc1d:	83 e0 0f             	and    $0xf,%eax
4630   52bc20:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4634   52bc24:	4c 89 f8             	mov    %r15,%rax
4637   52bc27:	48 c1 e8 03          	shr    $0x3,%rax
463b   52bc2b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4640   52bc30:	0f 85 59 2e 00 00    	jne    52ea8f <___bpf_prog_run+0x749f>
4646   52bc36:	41 8b 07             	mov    (%r15),%eax
4649   52bc39:	48 83 c3 08          	add    $0x8,%rbx
464d   52bc3d:	f7 d8                	neg    %eax
464f   52bc3f:	49 89 07             	mov    %rax,(%r15)
4652   52bc42:	e9 e3 b9 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4657   52bc47:	83 fa 50             	cmp    $0x50,%edx
465a   52bc4a:	0f 85 ae 09 00 00    	jne    52c5fe <___bpf_prog_run+0x500e>
4660   52bc50:	83 e0 18             	and    $0x18,%eax
4663   52bc53:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4667   52bc57:	88 45 b8             	mov    %al,-0x48(%rbp)
466a   52bc5a:	48 89 f8             	mov    %rdi,%rax
466d   52bc5d:	48 89 fa             	mov    %rdi,%rdx
4670   52bc60:	48 c1 e8 03          	shr    $0x3,%rax
4674   52bc64:	83 e2 07             	and    $0x7,%edx
4677   52bc67:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
467c   52bc6c:	38 d0                	cmp    %dl,%al
467e   52bc6e:	7f 08                	jg     52bc78 <___bpf_prog_run+0x4688>
4680   52bc70:	84 c0                	test   %al,%al
4682   52bc72:	0f 85 d9 10 00 00    	jne    52cd51 <___bpf_prog_run+0x5761>
4688   52bc78:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
468c   52bc7c:	c0 e8 04             	shr    $0x4,%al
468f   52bc7f:	0f b6 c0             	movzbl %al,%eax
4692   52bc82:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4696   52bc86:	4c 89 f8             	mov    %r15,%rax
4699   52bc89:	48 c1 e8 03          	shr    $0x3,%rax
469d   52bc8d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
46a2   52bc92:	0f 85 a4 12 00 00    	jne    52cf3c <___bpf_prog_run+0x594c>
46a8   52bc98:	49 8b 07             	mov    (%r15),%rax
46ab   52bc9b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
46af   52bc9f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
46b3   52bca3:	83 e0 0f             	and    $0xf,%eax
46b6   52bca6:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
46ba   52bcaa:	4c 89 fa             	mov    %r15,%rdx
46bd   52bcad:	48 c1 ea 03          	shr    $0x3,%rdx
46c1   52bcb1:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
46c6   52bcb6:	0f 85 73 12 00 00    	jne    52cf2f <___bpf_prog_run+0x593f>
46cc   52bcbc:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
46d0   52bcc0:	4d 8b 3f             	mov    (%r15),%r15
46d3   52bcc3:	48 89 f8             	mov    %rdi,%rax
46d6   52bcc6:	48 c1 e8 03          	shr    $0x3,%rax
46da   52bcca:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
46df   52bccf:	48 89 f8             	mov    %rdi,%rax
46e2   52bcd2:	83 e0 07             	and    $0x7,%eax
46e5   52bcd5:	83 c0 01             	add    $0x1,%eax
46e8   52bcd8:	38 d0                	cmp    %dl,%al
46ea   52bcda:	7c 08                	jl     52bce4 <___bpf_prog_run+0x46f4>
46ec   52bcdc:	84 d2                	test   %dl,%dl
46ee   52bcde:	0f 85 89 12 00 00    	jne    52cf6d <___bpf_prog_run+0x597d>
46f4   52bce4:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
46f9   52bce9:	49 01 d7             	add    %rdx,%r15
46fc   52bcec:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
4700   52bcf0:	0f 85 7a 0f 00 00    	jne    52cc70 <___bpf_prog_run+0x5680>
4706   52bcf6:	be 04 00 00 00       	mov    $0x4,%esi
470b   52bcfb:	4c 89 ff             	mov    %r15,%rdi
470e   52bcfe:	e8 00 00 00 00       	call   52bd03 <___bpf_prog_run+0x4713>	52bcff: R_X86_64_PLT32	__kasan_check_write-0x4
4713   52bd03:	8b 45 c0             	mov    -0x40(%rbp),%eax
4716   52bd06:	f0 41 21 07          	lock and %eax,(%r15)
471a   52bd0a:	e9 d4 01 00 00       	jmp    52bee3 <___bpf_prog_run+0x48f3>
471f   52bd0f:	85 d2                	test   %edx,%edx
4721   52bd11:	0f 85 d5 01 00 00    	jne    52beec <___bpf_prog_run+0x48fc>
4727   52bd17:	83 e0 18             	and    $0x18,%eax
472a   52bd1a:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
472e   52bd1e:	88 45 b8             	mov    %al,-0x48(%rbp)
4731   52bd21:	48 89 f8             	mov    %rdi,%rax
4734   52bd24:	48 89 fa             	mov    %rdi,%rdx
4737   52bd27:	48 c1 e8 03          	shr    $0x3,%rax
473b   52bd2b:	83 e2 07             	and    $0x7,%edx
473e   52bd2e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4743   52bd33:	38 d0                	cmp    %dl,%al
4745   52bd35:	7f 08                	jg     52bd3f <___bpf_prog_run+0x474f>
4747   52bd37:	84 c0                	test   %al,%al
4749   52bd39:	0f 85 64 11 00 00    	jne    52cea3 <___bpf_prog_run+0x58b3>
474f   52bd3f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4753   52bd43:	c0 e8 04             	shr    $0x4,%al
4756   52bd46:	0f b6 c0             	movzbl %al,%eax
4759   52bd49:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
475d   52bd4d:	4c 89 f8             	mov    %r15,%rax
4760   52bd50:	48 c1 e8 03          	shr    $0x3,%rax
4764   52bd54:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4769   52bd59:	0f 85 01 12 00 00    	jne    52cf60 <___bpf_prog_run+0x5970>
476f   52bd5f:	49 8b 07             	mov    (%r15),%rax
4772   52bd62:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
4776   52bd66:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
477a   52bd6a:	83 e0 0f             	and    $0xf,%eax
477d   52bd6d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4781   52bd71:	4c 89 fa             	mov    %r15,%rdx
4784   52bd74:	48 c1 ea 03          	shr    $0x3,%rdx
4788   52bd78:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
478d   52bd7d:	0f 85 d0 11 00 00    	jne    52cf53 <___bpf_prog_run+0x5963>
4793   52bd83:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4797   52bd87:	4d 8b 3f             	mov    (%r15),%r15
479a   52bd8a:	48 89 f8             	mov    %rdi,%rax
479d   52bd8d:	48 c1 e8 03          	shr    $0x3,%rax
47a1   52bd91:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
47a6   52bd96:	48 89 f8             	mov    %rdi,%rax
47a9   52bd99:	83 e0 07             	and    $0x7,%eax
47ac   52bd9c:	83 c0 01             	add    $0x1,%eax
47af   52bd9f:	38 d0                	cmp    %dl,%al
47b1   52bda1:	7c 08                	jl     52bdab <___bpf_prog_run+0x47bb>
47b3   52bda3:	84 d2                	test   %dl,%dl
47b5   52bda5:	0f 85 9e 11 00 00    	jne    52cf49 <___bpf_prog_run+0x5959>
47bb   52bdab:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
47c0   52bdb0:	49 01 d7             	add    %rdx,%r15
47c3   52bdb3:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
47c7   52bdb7:	0f 85 cd 0e 00 00    	jne    52cc8a <___bpf_prog_run+0x569a>
47cd   52bdbd:	be 04 00 00 00       	mov    $0x4,%esi
47d2   52bdc2:	4c 89 ff             	mov    %r15,%rdi
47d5   52bdc5:	e8 00 00 00 00       	call   52bdca <___bpf_prog_run+0x47da>	52bdc6: R_X86_64_PLT32	__kasan_check_write-0x4
47da   52bdca:	8b 45 c0             	mov    -0x40(%rbp),%eax
47dd   52bdcd:	f0 41 01 07          	lock add %eax,(%r15)
47e1   52bdd1:	e9 0d 01 00 00       	jmp    52bee3 <___bpf_prog_run+0x48f3>
47e6   52bdd6:	81 fa e1 00 00 00    	cmp    $0xe1,%edx
47ec   52bddc:	0f 84 5f 08 00 00    	je     52c641 <___bpf_prog_run+0x5051>
47f2   52bde2:	0f 8e 27 02 00 00    	jle    52c00f <___bpf_prog_run+0x4a1f>
47f8   52bde8:	81 fa f1 00 00 00    	cmp    $0xf1,%edx
47fe   52bdee:	0f 85 0a 08 00 00    	jne    52c5fe <___bpf_prog_run+0x500e>
4804   52bdf4:	83 e0 18             	and    $0x18,%eax
4807   52bdf7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
480b   52bdfb:	88 45 b0             	mov    %al,-0x50(%rbp)
480e   52bdfe:	48 89 f8             	mov    %rdi,%rax
4811   52be01:	48 89 fa             	mov    %rdi,%rdx
4814   52be04:	48 c1 e8 03          	shr    $0x3,%rax
4818   52be08:	83 e2 07             	and    $0x7,%edx
481b   52be0b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4820   52be10:	38 d0                	cmp    %dl,%al
4822   52be12:	7f 08                	jg     52be1c <___bpf_prog_run+0x482c>
4824   52be14:	84 c0                	test   %al,%al
4826   52be16:	0f 85 3f 0f 00 00    	jne    52cd5b <___bpf_prog_run+0x576b>
482c   52be1c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4830   52be20:	c0 e8 04             	shr    $0x4,%al
4833   52be23:	0f b6 c0             	movzbl %al,%eax
4836   52be26:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
483a   52be2a:	4c 89 f8             	mov    %r15,%rax
483d   52be2d:	48 c1 e8 03          	shr    $0x3,%rax
4841   52be31:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4846   52be36:	0f 85 11 10 00 00    	jne    52ce4d <___bpf_prog_run+0x585d>
484c   52be3c:	49 8b 07             	mov    (%r15),%rax
484f   52be3f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
4853   52be43:	4c 89 f0             	mov    %r14,%rax
4856   52be46:	48 c1 e8 03          	shr    $0x3,%rax
485a   52be4a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
485f   52be4f:	0f 85 eb 0f 00 00    	jne    52ce40 <___bpf_prog_run+0x5850>
4865   52be55:	49 8b 06             	mov    (%r14),%rax
4868   52be58:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
486c   52be5c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4870   52be60:	83 e0 0f             	and    $0xf,%eax
4873   52be63:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4877   52be67:	4c 89 fa             	mov    %r15,%rdx
487a   52be6a:	48 c1 ea 03          	shr    $0x3,%rdx
487e   52be6e:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4883   52be73:	0f 85 ba 0f 00 00    	jne    52ce33 <___bpf_prog_run+0x5843>
4889   52be79:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
488d   52be7d:	4d 8b 3f             	mov    (%r15),%r15
4890   52be80:	48 89 f8             	mov    %rdi,%rax
4893   52be83:	48 c1 e8 03          	shr    $0x3,%rax
4897   52be87:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
489c   52be8c:	48 89 f8             	mov    %rdi,%rax
489f   52be8f:	83 e0 07             	and    $0x7,%eax
48a2   52be92:	83 c0 01             	add    $0x1,%eax
48a5   52be95:	38 d0                	cmp    %dl,%al
48a7   52be97:	7c 08                	jl     52bea1 <___bpf_prog_run+0x48b1>
48a9   52be99:	84 d2                	test   %dl,%dl
48ab   52be9b:	0f 85 88 0f 00 00    	jne    52ce29 <___bpf_prog_run+0x5839>
48b1   52bea1:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
48b6   52bea6:	49 01 d7             	add    %rdx,%r15
48b9   52bea9:	80 7d b0 00          	cmpb   $0x0,-0x50(%rbp)
48bd   52bead:	0f 85 6f 0d 00 00    	jne    52cc22 <___bpf_prog_run+0x5632>
48c3   52beb3:	be 04 00 00 00       	mov    $0x4,%esi
48c8   52beb8:	4c 89 ff             	mov    %r15,%rdi
48cb   52bebb:	e8 00 00 00 00       	call   52bec0 <___bpf_prog_run+0x48d0>	52bebc: R_X86_64_PLT32	__kasan_check_write-0x4
48d0   52bec0:	8b 45 b8             	mov    -0x48(%rbp),%eax
48d3   52bec3:	8b 75 c0             	mov    -0x40(%rbp),%esi
48d6   52bec6:	f0 41 0f b1 37       	lock cmpxchg %esi,(%r15)
48db   52becb:	41 89 c7             	mov    %eax,%r15d
48de   52bece:	4c 89 f0             	mov    %r14,%rax
48e1   52bed1:	48 c1 e8 03          	shr    $0x3,%rax
48e5   52bed5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
48ea   52beda:	0f 85 3c 0f 00 00    	jne    52ce1c <___bpf_prog_run+0x582c>
48f0   52bee0:	4d 89 3e             	mov    %r15,(%r14)
48f3   52bee3:	48 83 c3 08          	add    $0x8,%rbx
48f7   52bee7:	e9 3e b7 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
48fc   52beec:	83 fa 01             	cmp    $0x1,%edx
48ff   52beef:	0f 85 09 07 00 00    	jne    52c5fe <___bpf_prog_run+0x500e>
4905   52bef5:	83 e0 18             	and    $0x18,%eax
4908   52bef8:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
490c   52befc:	88 45 b8             	mov    %al,-0x48(%rbp)
490f   52beff:	4c 89 f8             	mov    %r15,%rax
4912   52bf02:	4c 89 fa             	mov    %r15,%rdx
4915   52bf05:	48 c1 e8 03          	shr    $0x3,%rax
4919   52bf09:	83 e2 07             	and    $0x7,%edx
491c   52bf0c:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4921   52bf11:	38 d0                	cmp    %dl,%al
4923   52bf13:	7f 08                	jg     52bf1d <___bpf_prog_run+0x492d>
4925   52bf15:	84 c0                	test   %al,%al
4927   52bf17:	0f 85 fb 0f 00 00    	jne    52cf18 <___bpf_prog_run+0x5928>
492d   52bf1d:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4931   52bf21:	c0 e8 04             	shr    $0x4,%al
4934   52bf24:	0f b6 c0             	movzbl %al,%eax
4937   52bf27:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
493b   52bf2b:	48 89 c2             	mov    %rax,%rdx
493e   52bf2e:	48 c1 ea 03          	shr    $0x3,%rdx
4942   52bf32:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4947   52bf37:	0f 85 ca 0e 00 00    	jne    52ce07 <___bpf_prog_run+0x5817>
494d   52bf3d:	48 8b 00             	mov    (%rax),%rax
4950   52bf40:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
4954   52bf44:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4958   52bf48:	83 e0 0f             	and    $0xf,%eax
495b   52bf4b:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
495f   52bf4f:	48 89 c2             	mov    %rax,%rdx
4962   52bf52:	48 c1 ea 03          	shr    $0x3,%rdx
4966   52bf56:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
496b   52bf5b:	0f 85 91 0e 00 00    	jne    52cdf2 <___bpf_prog_run+0x5802>
4971   52bf61:	48 8b 00             	mov    (%rax),%rax
4974   52bf64:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4978   52bf68:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
497c   52bf6c:	48 89 f8             	mov    %rdi,%rax
497f   52bf6f:	48 c1 e8 03          	shr    $0x3,%rax
4983   52bf73:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4988   52bf78:	48 89 f8             	mov    %rdi,%rax
498b   52bf7b:	83 e0 07             	and    $0x7,%eax
498e   52bf7e:	83 c0 01             	add    $0x1,%eax
4991   52bf81:	38 d0                	cmp    %dl,%al
4993   52bf83:	7c 08                	jl     52bf8d <___bpf_prog_run+0x499d>
4995   52bf85:	84 d2                	test   %dl,%dl
4997   52bf87:	0f 85 5b 0e 00 00    	jne    52cde8 <___bpf_prog_run+0x57f8>
499d   52bf8d:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
49a2   52bf92:	48 03 55 b0          	add    -0x50(%rbp),%rdx
49a6   52bf96:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
49aa   52bf9a:	0f 85 05 0c 00 00    	jne    52cba5 <___bpf_prog_run+0x55b5>
49b0   52bfa0:	48 89 d7             	mov    %rdx,%rdi
49b3   52bfa3:	be 04 00 00 00       	mov    $0x4,%esi
49b8   52bfa8:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
49bc   52bfac:	e8 00 00 00 00       	call   52bfb1 <___bpf_prog_run+0x49c1>	52bfad: R_X86_64_PLT32	__kasan_check_write-0x4
49c1   52bfb1:	8b 45 c0             	mov    -0x40(%rbp),%eax
49c4   52bfb4:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
49c8   52bfb8:	f0 0f c1 02          	lock xadd %eax,(%rdx)
49cc   52bfbc:	4c 89 fa             	mov    %r15,%rdx
49cf   52bfbf:	4c 89 f9             	mov    %r15,%rcx
49d2   52bfc2:	48 c1 ea 03          	shr    $0x3,%rdx
49d6   52bfc6:	83 e1 07             	and    $0x7,%ecx
49d9   52bfc9:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
49de   52bfce:	38 ca                	cmp    %cl,%dl
49e0   52bfd0:	7f 12                	jg     52bfe4 <___bpf_prog_run+0x49f4>
49e2   52bfd2:	84 d2                	test   %dl,%dl
49e4   52bfd4:	74 0e                	je     52bfe4 <___bpf_prog_run+0x49f4>
49e6   52bfd6:	4c 89 ff             	mov    %r15,%rdi
49e9   52bfd9:	89 45 c0             	mov    %eax,-0x40(%rbp)
49ec   52bfdc:	e8 00 00 00 00       	call   52bfe1 <___bpf_prog_run+0x49f1>	52bfdd: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
49f1   52bfe1:	8b 45 c0             	mov    -0x40(%rbp),%eax
49f4   52bfe4:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
49f8   52bfe8:	41 89 c7             	mov    %eax,%r15d
49fb   52bfeb:	c0 ea 04             	shr    $0x4,%dl
49fe   52bfee:	0f b6 d2             	movzbl %dl,%edx
4a01   52bff1:	49 8d 14 d6          	lea    (%r14,%rdx,8),%rdx
4a05   52bff5:	48 89 d0             	mov    %rdx,%rax
4a08   52bff8:	48 c1 e8 03          	shr    $0x3,%rax
4a0c   52bffc:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4a11   52c001:	0f 85 df 0c 00 00    	jne    52cce6 <___bpf_prog_run+0x56f6>
4a17   52c007:	4c 89 3a             	mov    %r15,(%rdx)
4a1a   52c00a:	e9 d4 fe ff ff       	jmp    52bee3 <___bpf_prog_run+0x48f3>
4a1f   52c00f:	81 fa a0 00 00 00    	cmp    $0xa0,%edx
4a25   52c015:	0f 85 bf 00 00 00    	jne    52c0da <___bpf_prog_run+0x4aea>
4a2b   52c01b:	83 e0 18             	and    $0x18,%eax
4a2e   52c01e:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4a32   52c022:	88 45 b8             	mov    %al,-0x48(%rbp)
4a35   52c025:	48 89 f8             	mov    %rdi,%rax
4a38   52c028:	48 89 fa             	mov    %rdi,%rdx
4a3b   52c02b:	48 c1 e8 03          	shr    $0x3,%rax
4a3f   52c02f:	83 e2 07             	and    $0x7,%edx
4a42   52c032:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4a47   52c037:	38 d0                	cmp    %dl,%al
4a49   52c039:	7f 08                	jg     52c043 <___bpf_prog_run+0x4a53>
4a4b   52c03b:	84 c0                	test   %al,%al
4a4d   52c03d:	0f 85 22 0d 00 00    	jne    52cd65 <___bpf_prog_run+0x5775>
4a53   52c043:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4a57   52c047:	c0 e8 04             	shr    $0x4,%al
4a5a   52c04a:	0f b6 c0             	movzbl %al,%eax
4a5d   52c04d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4a61   52c051:	4c 89 f8             	mov    %r15,%rax
4a64   52c054:	48 c1 e8 03          	shr    $0x3,%rax
4a68   52c058:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4a6d   52c05d:	0f 85 78 0d 00 00    	jne    52cddb <___bpf_prog_run+0x57eb>
4a73   52c063:	49 8b 07             	mov    (%r15),%rax
4a76   52c066:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
4a7a   52c06a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4a7e   52c06e:	83 e0 0f             	and    $0xf,%eax
4a81   52c071:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4a85   52c075:	4c 89 fa             	mov    %r15,%rdx
4a88   52c078:	48 c1 ea 03          	shr    $0x3,%rdx
4a8c   52c07c:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4a91   52c081:	0f 85 84 0e 00 00    	jne    52cf0b <___bpf_prog_run+0x591b>
4a97   52c087:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4a9b   52c08b:	4d 8b 3f             	mov    (%r15),%r15
4a9e   52c08e:	48 89 f8             	mov    %rdi,%rax
4aa1   52c091:	48 c1 e8 03          	shr    $0x3,%rax
4aa5   52c095:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4aaa   52c09a:	48 89 f8             	mov    %rdi,%rax
4aad   52c09d:	83 e0 07             	and    $0x7,%eax
4ab0   52c0a0:	83 c0 01             	add    $0x1,%eax
4ab3   52c0a3:	38 d0                	cmp    %dl,%al
4ab5   52c0a5:	7c 08                	jl     52c0af <___bpf_prog_run+0x4abf>
4ab7   52c0a7:	84 d2                	test   %dl,%dl
4ab9   52c0a9:	0f 85 52 0e 00 00    	jne    52cf01 <___bpf_prog_run+0x5911>
4abf   52c0af:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
4ac4   52c0b4:	49 01 d7             	add    %rdx,%r15
4ac7   52c0b7:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
4acb   52c0bb:	0f 85 95 0b 00 00    	jne    52cc56 <___bpf_prog_run+0x5666>
4ad1   52c0c1:	be 04 00 00 00       	mov    $0x4,%esi
4ad6   52c0c6:	4c 89 ff             	mov    %r15,%rdi
4ad9   52c0c9:	e8 00 00 00 00       	call   52c0ce <___bpf_prog_run+0x4ade>	52c0ca: R_X86_64_PLT32	__kasan_check_write-0x4
4ade   52c0ce:	8b 45 c0             	mov    -0x40(%rbp),%eax
4ae1   52c0d1:	f0 41 31 07          	lock xor %eax,(%r15)
4ae5   52c0d5:	e9 09 fe ff ff       	jmp    52bee3 <___bpf_prog_run+0x48f3>
4aea   52c0da:	81 fa a1 00 00 00    	cmp    $0xa1,%edx
4af0   52c0e0:	0f 85 18 05 00 00    	jne    52c5fe <___bpf_prog_run+0x500e>
4af6   52c0e6:	83 e0 18             	and    $0x18,%eax
4af9   52c0e9:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
4afd   52c0ed:	88 45 b8             	mov    %al,-0x48(%rbp)
4b00   52c0f0:	4c 89 f8             	mov    %r15,%rax
4b03   52c0f3:	4c 89 fa             	mov    %r15,%rdx
4b06   52c0f6:	48 c1 e8 03          	shr    $0x3,%rax
4b0a   52c0fa:	83 e2 07             	and    $0x7,%edx
4b0d   52c0fd:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4b12   52c102:	38 d0                	cmp    %dl,%al
4b14   52c104:	7f 08                	jg     52c10e <___bpf_prog_run+0x4b1e>
4b16   52c106:	84 c0                	test   %al,%al
4b18   52c108:	0f 85 88 0d 00 00    	jne    52ce96 <___bpf_prog_run+0x58a6>
4b1e   52c10e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4b22   52c112:	c0 e8 04             	shr    $0x4,%al
4b25   52c115:	0f b6 c0             	movzbl %al,%eax
4b28   52c118:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4b2c   52c11c:	48 89 c2             	mov    %rax,%rdx
4b2f   52c11f:	48 c1 ea 03          	shr    $0x3,%rdx
4b33   52c123:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4b38   52c128:	0f 85 be 0d 00 00    	jne    52ceec <___bpf_prog_run+0x58fc>
4b3e   52c12e:	48 8b 00             	mov    (%rax),%rax
4b41   52c131:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
4b45   52c135:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4b49   52c139:	83 e0 0f             	and    $0xf,%eax
4b4c   52c13c:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4b50   52c140:	48 89 c2             	mov    %rax,%rdx
4b53   52c143:	48 c1 ea 03          	shr    $0x3,%rdx
4b57   52c147:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4b5c   52c14c:	0f 85 85 0d 00 00    	jne    52ced7 <___bpf_prog_run+0x58e7>
4b62   52c152:	48 8b 00             	mov    (%rax),%rax
4b65   52c155:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4b69   52c159:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
4b6d   52c15d:	48 89 f8             	mov    %rdi,%rax
4b70   52c160:	48 c1 e8 03          	shr    $0x3,%rax
4b74   52c164:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4b79   52c169:	48 89 f8             	mov    %rdi,%rax
4b7c   52c16c:	83 e0 07             	and    $0x7,%eax
4b7f   52c16f:	83 c0 01             	add    $0x1,%eax
4b82   52c172:	38 d0                	cmp    %dl,%al
4b84   52c174:	7c 08                	jl     52c17e <___bpf_prog_run+0x4b8e>
4b86   52c176:	84 d2                	test   %dl,%dl
4b88   52c178:	0f 85 53 0c 00 00    	jne    52cdd1 <___bpf_prog_run+0x57e1>
4b8e   52c17e:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
4b93   52c183:	48 03 55 b0          	add    -0x50(%rbp),%rdx
4b97   52c187:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
4b9b   52c18b:	0f 85 89 09 00 00    	jne    52cb1a <___bpf_prog_run+0x552a>
4ba1   52c191:	48 89 d7             	mov    %rdx,%rdi
4ba4   52c194:	be 04 00 00 00       	mov    $0x4,%esi
4ba9   52c199:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
4bad   52c19d:	e8 00 00 00 00       	call   52c1a2 <___bpf_prog_run+0x4bb2>	52c19e: R_X86_64_PLT32	__kasan_check_write-0x4
4bb2   52c1a2:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
4bb6   52c1a6:	48 89 d0             	mov    %rdx,%rax
4bb9   52c1a9:	48 c1 e8 03          	shr    $0x3,%rax
4bbd   52c1ad:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
4bc2   52c1b2:	48 89 d0             	mov    %rdx,%rax
4bc5   52c1b5:	83 e0 07             	and    $0x7,%eax
4bc8   52c1b8:	83 c0 03             	add    $0x3,%eax
4bcb   52c1bb:	38 c8                	cmp    %cl,%al
4bcd   52c1bd:	7c 10                	jl     52c1cf <___bpf_prog_run+0x4bdf>
4bcf   52c1bf:	84 c9                	test   %cl,%cl
4bd1   52c1c1:	74 0c                	je     52c1cf <___bpf_prog_run+0x4bdf>
4bd3   52c1c3:	48 89 d7             	mov    %rdx,%rdi
4bd6   52c1c6:	e8 00 00 00 00       	call   52c1cb <___bpf_prog_run+0x4bdb>	52c1c7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4bdb   52c1cb:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
4bdf   52c1cf:	8b 02                	mov    (%rdx),%eax
4be1   52c1d1:	8b 75 c0             	mov    -0x40(%rbp),%esi
4be4   52c1d4:	89 c1                	mov    %eax,%ecx
4be6   52c1d6:	31 c6                	xor    %eax,%esi
4be8   52c1d8:	f0 0f b1 32          	lock cmpxchg %esi,(%rdx)
4bec   52c1dc:	75 f3                	jne    52c1d1 <___bpf_prog_run+0x4be1>
4bee   52c1de:	4c 89 f8             	mov    %r15,%rax
4bf1   52c1e1:	4c 89 fa             	mov    %r15,%rdx
4bf4   52c1e4:	48 c1 e8 03          	shr    $0x3,%rax
4bf8   52c1e8:	83 e2 07             	and    $0x7,%edx
4bfb   52c1eb:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4c00   52c1f0:	38 d0                	cmp    %dl,%al
4c02   52c1f2:	7f 12                	jg     52c206 <___bpf_prog_run+0x4c16>
4c04   52c1f4:	84 c0                	test   %al,%al
4c06   52c1f6:	74 0e                	je     52c206 <___bpf_prog_run+0x4c16>
4c08   52c1f8:	4c 89 ff             	mov    %r15,%rdi
4c0b   52c1fb:	89 4d c0             	mov    %ecx,-0x40(%rbp)
4c0e   52c1fe:	e8 00 00 00 00       	call   52c203 <___bpf_prog_run+0x4c13>	52c1ff: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4c13   52c203:	8b 4d c0             	mov    -0x40(%rbp),%ecx
4c16   52c206:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4c1a   52c20a:	41 89 cf             	mov    %ecx,%r15d
4c1d   52c20d:	c0 e8 04             	shr    $0x4,%al
4c20   52c210:	0f b6 c0             	movzbl %al,%eax
4c23   52c213:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4c27   52c217:	48 89 c2             	mov    %rax,%rdx
4c2a   52c21a:	48 c1 ea 03          	shr    $0x3,%rdx
4c2e   52c21e:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4c33   52c223:	0f 85 d2 0a 00 00    	jne    52ccfb <___bpf_prog_run+0x570b>
4c39   52c229:	4c 89 38             	mov    %r15,(%rax)
4c3c   52c22c:	e9 b2 fc ff ff       	jmp    52bee3 <___bpf_prog_run+0x48f3>
4c41   52c231:	48 83 c3 08          	add    $0x8,%rbx
4c45   52c235:	e9 f0 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4c4a   52c23a:	48 83 c3 08          	add    $0x8,%rbx
4c4e   52c23e:	e9 e7 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4c53   52c243:	48 83 c3 08          	add    $0x8,%rbx
4c57   52c247:	e9 de b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4c5c   52c24c:	48 83 c3 08          	add    $0x8,%rbx
4c60   52c250:	e9 d5 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4c65   52c255:	48 83 c3 08          	add    $0x8,%rbx
4c69   52c259:	e9 cc b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4c6e   52c25e:	48 83 c3 08          	add    $0x8,%rbx
4c72   52c262:	e9 c3 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4c77   52c267:	48 83 c3 08          	add    $0x8,%rbx
4c7b   52c26b:	e9 ba b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4c80   52c270:	48 83 c3 08          	add    $0x8,%rbx
4c84   52c274:	e9 b1 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4c89   52c279:	48 83 c3 08          	add    $0x8,%rbx
4c8d   52c27d:	e9 a8 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4c92   52c282:	48 83 c3 08          	add    $0x8,%rbx
4c96   52c286:	e9 9f b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4c9b   52c28b:	48 83 c3 08          	add    $0x8,%rbx
4c9f   52c28f:	e9 96 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4ca4   52c294:	48 83 c3 08          	add    $0x8,%rbx
4ca8   52c298:	e9 8d b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4cad   52c29d:	48 83 c3 08          	add    $0x8,%rbx
4cb1   52c2a1:	e9 84 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4cb6   52c2a6:	48 83 c3 08          	add    $0x8,%rbx
4cba   52c2aa:	e9 7b b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4cbf   52c2af:	48 83 c3 08          	add    $0x8,%rbx
4cc3   52c2b3:	e9 72 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4cc8   52c2b8:	48 83 c3 08          	add    $0x8,%rbx
4ccc   52c2bc:	e9 69 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4cd1   52c2c1:	48 83 c3 08          	add    $0x8,%rbx
4cd5   52c2c5:	e9 60 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4cda   52c2ca:	48 83 c3 08          	add    $0x8,%rbx
4cde   52c2ce:	e9 57 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4ce3   52c2d3:	48 83 c3 08          	add    $0x8,%rbx
4ce7   52c2d7:	e9 4e b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4cec   52c2dc:	48 83 c3 08          	add    $0x8,%rbx
4cf0   52c2e0:	e9 45 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4cf5   52c2e5:	48 83 c3 08          	add    $0x8,%rbx
4cf9   52c2e9:	e9 3c b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4cfe   52c2ee:	48 83 c3 08          	add    $0x8,%rbx
4d02   52c2f2:	e9 33 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d07   52c2f7:	48 83 c3 08          	add    $0x8,%rbx
4d0b   52c2fb:	e9 2a b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d10   52c300:	48 83 c3 08          	add    $0x8,%rbx
4d14   52c304:	e9 21 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d19   52c309:	48 83 c3 08          	add    $0x8,%rbx
4d1d   52c30d:	e9 18 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d22   52c312:	48 83 c3 08          	add    $0x8,%rbx
4d26   52c316:	e9 0f b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d2b   52c31b:	48 83 c3 08          	add    $0x8,%rbx
4d2f   52c31f:	e9 06 b3 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d34   52c324:	48 83 c3 08          	add    $0x8,%rbx
4d38   52c328:	e9 fd b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d3d   52c32d:	48 83 c3 08          	add    $0x8,%rbx
4d41   52c331:	e9 f4 b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d46   52c336:	48 83 c3 08          	add    $0x8,%rbx
4d4a   52c33a:	e9 eb b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d4f   52c33f:	48 83 c3 08          	add    $0x8,%rbx
4d53   52c343:	e9 e2 b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d58   52c348:	48 83 c3 08          	add    $0x8,%rbx
4d5c   52c34c:	e9 d9 b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d61   52c351:	48 83 c3 08          	add    $0x8,%rbx
4d65   52c355:	e9 d0 b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d6a   52c35a:	48 83 c3 08          	add    $0x8,%rbx
4d6e   52c35e:	e9 c7 b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d73   52c363:	48 83 c3 08          	add    $0x8,%rbx
4d77   52c367:	e9 be b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d7c   52c36c:	48 83 c3 08          	add    $0x8,%rbx
4d80   52c370:	e9 b5 b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4d85   52c375:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4d89   52c379:	48 89 f8             	mov    %rdi,%rax
4d8c   52c37c:	48 89 fa             	mov    %rdi,%rdx
4d8f   52c37f:	48 c1 e8 03          	shr    $0x3,%rax
4d93   52c383:	83 e2 07             	and    $0x7,%edx
4d96   52c386:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4d9b   52c38b:	38 d0                	cmp    %dl,%al
4d9d   52c38d:	7f 08                	jg     52c397 <___bpf_prog_run+0x4da7>
4d9f   52c38f:	84 c0                	test   %al,%al
4da1   52c391:	0f 85 e1 0a 00 00    	jne    52ce78 <___bpf_prog_run+0x5888>
4da7   52c397:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4dab   52c39b:	83 e0 0f             	and    $0xf,%eax
4dae   52c39e:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4db2   52c3a2:	4c 89 f8             	mov    %r15,%rax
4db5   52c3a5:	48 c1 e8 03          	shr    $0x3,%rax
4db9   52c3a9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4dbe   52c3ae:	0f 85 ce 26 00 00    	jne    52ea82 <___bpf_prog_run+0x7492>
4dc4   52c3b4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
4dc9   52c3b9:	48 83 c3 08          	add    $0x8,%rbx
4dcd   52c3bd:	49 21 07             	and    %rax,(%r15)
4dd0   52c3c0:	e9 65 b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4dd5   52c3c5:	48 83 c3 08          	add    $0x8,%rbx
4dd9   52c3c9:	e9 5c b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4dde   52c3ce:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4de2   52c3d2:	48 89 f8             	mov    %rdi,%rax
4de5   52c3d5:	48 89 fa             	mov    %rdi,%rdx
4de8   52c3d8:	48 c1 e8 03          	shr    $0x3,%rax
4dec   52c3dc:	83 e2 07             	and    $0x7,%edx
4def   52c3df:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4df4   52c3e4:	38 d0                	cmp    %dl,%al
4df6   52c3e6:	7f 08                	jg     52c3f0 <___bpf_prog_run+0x4e00>
4df8   52c3e8:	84 c0                	test   %al,%al
4dfa   52c3ea:	0f 85 e2 08 00 00    	jne    52ccd2 <___bpf_prog_run+0x56e2>
4e00   52c3f0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4e04   52c3f4:	83 e0 0f             	and    $0xf,%eax
4e07   52c3f7:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4e0b   52c3fb:	4c 89 f8             	mov    %r15,%rax
4e0e   52c3fe:	48 c1 e8 03          	shr    $0x3,%rax
4e12   52c402:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4e17   52c407:	0f 85 68 26 00 00    	jne    52ea75 <___bpf_prog_run+0x7485>
4e1d   52c40d:	49 81 27 ff ff 00 00 	andq   $0xffff,(%r15)
4e24   52c414:	48 83 c3 08          	add    $0x8,%rbx
4e28   52c418:	e9 0d b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4e2d   52c41d:	48 83 c3 08          	add    $0x8,%rbx
4e31   52c421:	e9 04 b2 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4e36   52c426:	48 83 c3 08          	add    $0x8,%rbx
4e3a   52c42a:	e9 fb b1 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4e3f   52c42f:	48 83 c3 08          	add    $0x8,%rbx
4e43   52c433:	e9 f2 b1 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4e48   52c438:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4e4c   52c43c:	48 89 f8             	mov    %rdi,%rax
4e4f   52c43f:	48 c1 e8 03          	shr    $0x3,%rax
4e53   52c443:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4e58   52c448:	48 89 f8             	mov    %rdi,%rax
4e5b   52c44b:	83 e0 07             	and    $0x7,%eax
4e5e   52c44e:	83 c0 01             	add    $0x1,%eax
4e61   52c451:	38 d0                	cmp    %dl,%al
4e63   52c453:	7c 08                	jl     52c45d <___bpf_prog_run+0x4e6d>
4e65   52c455:	84 d2                	test   %dl,%dl
4e67   52c457:	0f 85 7f 08 00 00    	jne    52ccdc <___bpf_prog_run+0x56ec>
4e6d   52c45d:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
4e72   52c462:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
4e77   52c467:	e9 be b1 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4e7c   52c46c:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4e80   52c470:	48 89 f8             	mov    %rdi,%rax
4e83   52c473:	48 c1 e8 03          	shr    $0x3,%rax
4e87   52c477:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4e8c   52c47c:	48 89 f8             	mov    %rdi,%rax
4e8f   52c47f:	83 e0 07             	and    $0x7,%eax
4e92   52c482:	83 c0 01             	add    $0x1,%eax
4e95   52c485:	38 d0                	cmp    %dl,%al
4e97   52c487:	7c 08                	jl     52c491 <___bpf_prog_run+0x4ea1>
4e99   52c489:	84 d2                	test   %dl,%dl
4e9b   52c48b:	0f 85 f1 09 00 00    	jne    52ce82 <___bpf_prog_run+0x5892>
4ea1   52c491:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
4ea6   52c496:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
4eab   52c49b:	e9 8a b1 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4eb0   52c4a0:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4eb4   52c4a4:	48 89 f8             	mov    %rdi,%rax
4eb7   52c4a7:	48 c1 e8 03          	shr    $0x3,%rax
4ebb   52c4ab:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4ec0   52c4b0:	48 89 f8             	mov    %rdi,%rax
4ec3   52c4b3:	83 e0 07             	and    $0x7,%eax
4ec6   52c4b6:	83 c0 01             	add    $0x1,%eax
4ec9   52c4b9:	38 d0                	cmp    %dl,%al
4ecb   52c4bb:	7c 08                	jl     52c4c5 <___bpf_prog_run+0x4ed5>
4ecd   52c4bd:	84 d2                	test   %dl,%dl
4ecf   52c4bf:	0f 85 c7 09 00 00    	jne    52ce8c <___bpf_prog_run+0x589c>
4ed5   52c4c5:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
4eda   52c4ca:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
4edf   52c4cf:	e9 56 b1 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4ee4   52c4d4:	48 83 c3 08          	add    $0x8,%rbx
4ee8   52c4d8:	e9 4d b1 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4eed   52c4dd:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4ef1   52c4e1:	48 89 f8             	mov    %rdi,%rax
4ef4   52c4e4:	48 c1 e8 03          	shr    $0x3,%rax
4ef8   52c4e8:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4efd   52c4ed:	48 89 f8             	mov    %rdi,%rax
4f00   52c4f0:	83 e0 07             	and    $0x7,%eax
4f03   52c4f3:	83 c0 01             	add    $0x1,%eax
4f06   52c4f6:	38 d0                	cmp    %dl,%al
4f08   52c4f8:	7c 08                	jl     52c502 <___bpf_prog_run+0x4f12>
4f0a   52c4fa:	84 d2                	test   %dl,%dl
4f0c   52c4fc:	0f 85 c6 07 00 00    	jne    52ccc8 <___bpf_prog_run+0x56d8>
4f12   52c502:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
4f17   52c507:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
4f1c   52c50c:	e9 19 b1 ff ff       	jmp    52762a <___bpf_prog_run+0x3a>
4f21   52c511:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4f25   52c515:	48 89 f8             	mov    %rdi,%rax
4f28   52c518:	48 89 fa             	mov    %rdi,%rdx
4f2b   52c51b:	48 c1 e8 03          	shr    $0x3,%rax
4f2f   52c51f:	83 e2 07             	and    $0x7,%edx
4f32   52c522:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4f37   52c527:	38 d0                	cmp    %dl,%al
4f39   52c529:	7f 08                	jg     52c533 <___bpf_prog_run+0x4f43>
4f3b   52c52b:	84 c0                	test   %al,%al
4f3d   52c52d:	0f 85 27 09 00 00    	jne    52ce5a <___bpf_prog_run+0x586a>
4f43   52c533:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4f47   52c537:	83 e0 0f             	and    $0xf,%eax
4f4a   52c53a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4f4e   52c53e:	4c 89 f8             	mov    %r15,%rax
4f51   52c541:	48 c1 e8 03          	shr    $0x3,%rax
4f55   52c545:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4f5a   52c54a:	0f 85 78 16 00 00    	jne    52dbc8 <___bpf_prog_run+0x65d8>
4f60   52c550:	41 0f b7 07          	movzwl (%r15),%eax
4f64   52c554:	66 c1 c0 08          	rol    $0x8,%ax
4f68   52c558:	0f b7 c0             	movzwl %ax,%eax
4f6b   52c55b:	49 89 07             	mov    %rax,(%r15)
4f6e   52c55e:	e9 a8 dd ff ff       	jmp    52a30b <___bpf_prog_run+0x2d1b>
4f73   52c563:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4f77   52c567:	48 89 f8             	mov    %rdi,%rax
4f7a   52c56a:	48 89 fa             	mov    %rdi,%rdx
4f7d   52c56d:	48 c1 e8 03          	shr    $0x3,%rax
4f81   52c571:	83 e2 07             	and    $0x7,%edx
4f84   52c574:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4f89   52c579:	38 d0                	cmp    %dl,%al
4f8b   52c57b:	7f 08                	jg     52c585 <___bpf_prog_run+0x4f95>
4f8d   52c57d:	84 c0                	test   %al,%al
4f8f   52c57f:	0f 85 df 08 00 00    	jne    52ce64 <___bpf_prog_run+0x5874>
4f95   52c585:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4f99   52c589:	83 e0 0f             	and    $0xf,%eax
4f9c   52c58c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4fa0   52c590:	4c 89 f8             	mov    %r15,%rax
4fa3   52c593:	48 c1 e8 03          	shr    $0x3,%rax
4fa7   52c597:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4fac   52c59c:	0f 85 2e 17 00 00    	jne    52dcd0 <___bpf_prog_run+0x66e0>
4fb2   52c5a2:	49 8b 07             	mov    (%r15),%rax
4fb5   52c5a5:	48 0f c8             	bswap  %rax
4fb8   52c5a8:	49 89 07             	mov    %rax,(%r15)
4fbb   52c5ab:	e9 5b dd ff ff       	jmp    52a30b <___bpf_prog_run+0x2d1b>
4fc0   52c5b0:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4fc4   52c5b4:	48 89 f8             	mov    %rdi,%rax
4fc7   52c5b7:	48 89 fa             	mov    %rdi,%rdx
4fca   52c5ba:	48 c1 e8 03          	shr    $0x3,%rax
4fce   52c5be:	83 e2 07             	and    $0x7,%edx
4fd1   52c5c1:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4fd6   52c5c6:	38 d0                	cmp    %dl,%al
4fd8   52c5c8:	7f 08                	jg     52c5d2 <___bpf_prog_run+0x4fe2>
4fda   52c5ca:	84 c0                	test   %al,%al
4fdc   52c5cc:	0f 85 9c 08 00 00    	jne    52ce6e <___bpf_prog_run+0x587e>
4fe2   52c5d2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4fe6   52c5d6:	83 e0 0f             	and    $0xf,%eax
4fe9   52c5d9:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4fed   52c5dd:	4c 89 f8             	mov    %r15,%rax
4ff0   52c5e0:	48 c1 e8 03          	shr    $0x3,%rax
4ff4   52c5e4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4ff9   52c5e9:	0f 85 e6 15 00 00    	jne    52dbd5 <___bpf_prog_run+0x65e5>
4fff   52c5ef:	49 8b 07             	mov    (%r15),%rax
5002   52c5f2:	0f c8                	bswap  %eax
5004   52c5f4:	89 c0                	mov    %eax,%eax
5006   52c5f6:	49 89 07             	mov    %rax,(%r15)
5009   52c5f9:	e9 0d dd ff ff       	jmp    52a30b <___bpf_prog_run+0x2d1b>
500e   52c5fe:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5018   52c608:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
501c   52c60c:	48 89 fa             	mov    %rdi,%rdx
501f   52c60f:	48 c1 ea 03          	shr    $0x3,%rdx
5023   52c613:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
5027   52c617:	48 89 f8             	mov    %rdi,%rax
502a   52c61a:	83 e0 07             	and    $0x7,%eax
502d   52c61d:	83 c0 03             	add    $0x3,%eax
5030   52c620:	38 d0                	cmp    %dl,%al
5032   52c622:	7c 09                	jl     52c62d <___bpf_prog_run+0x503d>
5034   52c624:	84 d2                	test   %dl,%dl
5036   52c626:	74 05                	je     52c62d <___bpf_prog_run+0x503d>
5038   52c628:	e8 00 00 00 00       	call   52c62d <___bpf_prog_run+0x503d>	52c629: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
503d   52c62d:	8b 53 04             	mov    0x4(%rbx),%edx
5040   52c630:	44 89 fe             	mov    %r15d,%esi
5043   52c633:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	52c636: R_X86_64_32S	.rodata+0xd4940
504a   52c63a:	e8 00 00 00 00       	call   52c63f <___bpf_prog_run+0x504f>	52c63b: R_X86_64_PLT32	_printk-0x4
504f   52c63f:	0f 0b                	ud2
5051   52c641:	83 e0 18             	and    $0x18,%eax
5054   52c644:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
5058   52c648:	88 45 b8             	mov    %al,-0x48(%rbp)
505b   52c64b:	4c 89 f8             	mov    %r15,%rax
505e   52c64e:	4c 89 fa             	mov    %r15,%rdx
5061   52c651:	48 c1 e8 03          	shr    $0x3,%rax
5065   52c655:	83 e2 07             	and    $0x7,%edx
5068   52c658:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
506d   52c65d:	38 d0                	cmp    %dl,%al
506f   52c65f:	7f 08                	jg     52c669 <___bpf_prog_run+0x5079>
5071   52c661:	84 c0                	test   %al,%al
5073   52c663:	0f 85 db 06 00 00    	jne    52cd44 <___bpf_prog_run+0x5754>
5079   52c669:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
507d   52c66d:	c0 e8 04             	shr    $0x4,%al
5080   52c670:	0f b6 c0             	movzbl %al,%eax
5083   52c673:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
5087   52c677:	48 89 c2             	mov    %rax,%rdx
508a   52c67a:	48 c1 ea 03          	shr    $0x3,%rdx
508e   52c67e:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
5093   52c683:	0f 85 a6 06 00 00    	jne    52cd2f <___bpf_prog_run+0x573f>
5099   52c689:	48 8b 00             	mov    (%rax),%rax
509c   52c68c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
50a0   52c690:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
50a4   52c694:	83 e0 0f             	and    $0xf,%eax
50a7   52c697:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
50ab   52c69b:	48 89 c2             	mov    %rax,%rdx
50ae   52c69e:	48 c1 ea 03          	shr    $0x3,%rdx
50b2   52c6a2:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
50b7   52c6a7:	0f 85 6d 06 00 00    	jne    52cd1a <___bpf_prog_run+0x572a>
50bd   52c6ad:	48 8b 00             	mov    (%rax),%rax
50c0   52c6b0:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
50c4   52c6b4:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
50c8   52c6b8:	48 89 f8             	mov    %rdi,%rax
50cb   52c6bb:	48 c1 e8 03          	shr    $0x3,%rax
50cf   52c6bf:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
50d4   52c6c4:	48 89 f8             	mov    %rdi,%rax
50d7   52c6c7:	83 e0 07             	and    $0x7,%eax
50da   52c6ca:	83 c0 01             	add    $0x1,%eax
50dd   52c6cd:	38 d0                	cmp    %dl,%al
50df   52c6cf:	7c 08                	jl     52c6d9 <___bpf_prog_run+0x50e9>
50e1   52c6d1:	84 d2                	test   %dl,%dl
50e3   52c6d3:	0f 85 37 06 00 00    	jne    52cd10 <___bpf_prog_run+0x5720>
50e9   52c6d9:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
50ee   52c6de:	48 03 55 b0          	add    -0x50(%rbp),%rdx
50f2   52c6e2:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
50f6   52c6e6:	0f 85 c0 03 00 00    	jne    52caac <___bpf_prog_run+0x54bc>
50fc   52c6ec:	48 89 d7             	mov    %rdx,%rdi
50ff   52c6ef:	be 04 00 00 00       	mov    $0x4,%esi
5104   52c6f4:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
5108   52c6f8:	e8 00 00 00 00       	call   52c6fd <___bpf_prog_run+0x510d>	52c6f9: R_X86_64_PLT32	__kasan_check_write-0x4
510d   52c6fd:	8b 45 c0             	mov    -0x40(%rbp),%eax
5110   52c700:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
5114   52c704:	87 02                	xchg   %eax,(%rdx)
5116   52c706:	4c 89 fa             	mov    %r15,%rdx
5119   52c709:	4c 89 f9             	mov    %r15,%rcx
511c   52c70c:	48 c1 ea 03          	shr    $0x3,%rdx
5120   52c710:	83 e1 07             	and    $0x7,%ecx
5123   52c713:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
5128   52c718:	38 ca                	cmp    %cl,%dl
512a   52c71a:	7f 12                	jg     52c72e <___bpf_prog_run+0x513e>
512c   52c71c:	84 d2                	test   %dl,%dl
512e   52c71e:	74 0e                	je     52c72e <___bpf_prog_run+0x513e>
5130   52c720:	4c 89 ff             	mov    %r15,%rdi
5133   52c723:	89 45 c0             	mov    %eax,-0x40(%rbp)
5136   52c726:	e8 00 00 00 00       	call   52c72b <___bpf_prog_run+0x513b>	52c727: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
513b   52c72b:	8b 45 c0             	mov    -0x40(%rbp),%eax
513e   52c72e:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
5142   52c732:	41 89 c7             	mov    %eax,%r15d
5145   52c735:	c0 ea 04             	shr    $0x4,%dl
5148   52c738:	0f b6 d2             	movzbl %dl,%edx
514b   52c73b:	49 8d 14 d6          	lea    (%r14,%rdx,8),%rdx
514f   52c73f:	48 89 d0             	mov    %rdx,%rax
5152   52c742:	48 c1 e8 03          	shr    $0x3,%rax
5156   52c746:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
515b   52c74b:	0f 84 b6 f8 ff ff    	je     52c007 <___bpf_prog_run+0x4a17>
5161   52c751:	48 89 d7             	mov    %rdx,%rdi
5164   52c754:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
5168   52c758:	e8 00 00 00 00       	call   52c75d <___bpf_prog_run+0x516d>	52c759: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
516d   52c75d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5171   52c761:	e9 a1 f8 ff ff       	jmp    52c007 <___bpf_prog_run+0x4a17>
5176   52c766:	83 e0 18             	and    $0x18,%eax
5179   52c769:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
517d   52c76d:	88 45 b8             	mov    %al,-0x48(%rbp)
5180   52c770:	4c 89 f8             	mov    %r15,%rax
5183   52c773:	4c 89 fa             	mov    %r15,%rdx
5186   52c776:	48 c1 e8 03          	shr    $0x3,%rax
518a   52c77a:	83 e2 07             	and    $0x7,%edx
518d   52c77d:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
5192   52c782:	38 d0                	cmp    %dl,%al
5194   52c784:	7f 08                	jg     52c78e <___bpf_prog_run+0x519e>
5196   52c786:	84 c0                	test   %al,%al
5198   52c788:	0f 85 1d 08 00 00    	jne    52cfab <___bpf_prog_run+0x59bb>
519e   52c78e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
51a2   52c792:	c0 e8 04             	shr    $0x4,%al
51a5   52c795:	0f b6 c0             	movzbl %al,%eax
51a8   52c798:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
51ac   52c79c:	48 89 c2             	mov    %rax,%rdx
51af   52c79f:	48 c1 ea 03          	shr    $0x3,%rdx
51b3   52c7a3:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
51b8   52c7a8:	0f 85 e8 07 00 00    	jne    52cf96 <___bpf_prog_run+0x59a6>
51be   52c7ae:	48 8b 00             	mov    (%rax),%rax
51c1   52c7b1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
51c5   52c7b5:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
51c9   52c7b9:	83 e0 0f             	and    $0xf,%eax
51cc   52c7bc:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
51d0   52c7c0:	48 89 c2             	mov    %rax,%rdx
51d3   52c7c3:	48 c1 ea 03          	shr    $0x3,%rdx
51d7   52c7c7:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
51dc   52c7cc:	0f 85 af 07 00 00    	jne    52cf81 <___bpf_prog_run+0x5991>
51e2   52c7d2:	48 8b 00             	mov    (%rax),%rax
51e5   52c7d5:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
51e9   52c7d9:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
51ed   52c7dd:	48 89 f8             	mov    %rdi,%rax
51f0   52c7e0:	48 c1 e8 03          	shr    $0x3,%rax
51f4   52c7e4:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
51f9   52c7e9:	48 89 f8             	mov    %rdi,%rax
51fc   52c7ec:	83 e0 07             	and    $0x7,%eax
51ff   52c7ef:	83 c0 01             	add    $0x1,%eax
5202   52c7f2:	38 d0                	cmp    %dl,%al
5204   52c7f4:	7c 08                	jl     52c7fe <___bpf_prog_run+0x520e>
5206   52c7f6:	84 d2                	test   %dl,%dl
5208   52c7f8:	0f 85 79 07 00 00    	jne    52cf77 <___bpf_prog_run+0x5987>
520e   52c7fe:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
5213   52c803:	48 03 55 b0          	add    -0x50(%rbp),%rdx
5217   52c807:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
521b   52c80b:	0f 85 10 02 00 00    	jne    52ca21 <___bpf_prog_run+0x5431>
5221   52c811:	48 89 d7             	mov    %rdx,%rdi
5224   52c814:	be 04 00 00 00       	mov    $0x4,%esi
5229   52c819:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
522d   52c81d:	e8 00 00 00 00       	call   52c822 <___bpf_prog_run+0x5232>	52c81e: R_X86_64_PLT32	__kasan_check_write-0x4
5232   52c822:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
5236   52c826:	48 89 d0             	mov    %rdx,%rax
5239   52c829:	48 c1 e8 03          	shr    $0x3,%rax
523d   52c82d:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
5242   52c832:	48 89 d0             	mov    %rdx,%rax
5245   52c835:	83 e0 07             	and    $0x7,%eax
5248   52c838:	83 c0 03             	add    $0x3,%eax
524b   52c83b:	38 c8                	cmp    %cl,%al
524d   52c83d:	7c 10                	jl     52c84f <___bpf_prog_run+0x525f>
524f   52c83f:	84 c9                	test   %cl,%cl
5251   52c841:	74 0c                	je     52c84f <___bpf_prog_run+0x525f>
5253   52c843:	48 89 d7             	mov    %rdx,%rdi
5256   52c846:	e8 00 00 00 00       	call   52c84b <___bpf_prog_run+0x525b>	52c847: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
525b   52c84b:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
525f   52c84f:	8b 02                	mov    (%rdx),%eax
5261   52c851:	8b 75 c0             	mov    -0x40(%rbp),%esi
5264   52c854:	89 c1                	mov    %eax,%ecx
5266   52c856:	21 c6                	and    %eax,%esi
5268   52c858:	f0 0f b1 32          	lock cmpxchg %esi,(%rdx)
526c   52c85c:	75 f3                	jne    52c851 <___bpf_prog_run+0x5261>
526e   52c85e:	4c 89 f8             	mov    %r15,%rax
5271   52c861:	4c 89 fa             	mov    %r15,%rdx
5274   52c864:	48 c1 e8 03          	shr    $0x3,%rax
5278   52c868:	83 e2 07             	and    $0x7,%edx
527b   52c86b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
5280   52c870:	38 d0                	cmp    %dl,%al
5282   52c872:	7f 12                	jg     52c886 <___bpf_prog_run+0x5296>
5284   52c874:	84 c0                	test   %al,%al
5286   52c876:	74 0e                	je     52c886 <___bpf_prog_run+0x5296>
5288   52c878:	4c 89 ff             	mov    %r15,%rdi
528b   52c87b:	89 4d c0             	mov    %ecx,-0x40(%rbp)
528e   52c87e:	e8 00 00 00 00       	call   52c883 <___bpf_prog_run+0x5293>	52c87f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5293   52c883:	8b 4d c0             	mov    -0x40(%rbp),%ecx
5296   52c886:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
529a   52c88a:	41 89 cf             	mov    %ecx,%r15d
529d   52c88d:	c0 e8 04             	shr    $0x4,%al
52a0   52c890:	0f b6 c0             	movzbl %al,%eax
52a3   52c893:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
52a7   52c897:	48 89 c2             	mov    %rax,%rdx
52aa   52c89a:	48 c1 ea 03          	shr    $0x3,%rdx
52ae   52c89e:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
52b3   52c8a3:	0f 84 80 f9 ff ff    	je     52c229 <___bpf_prog_run+0x4c39>
52b9   52c8a9:	48 89 c7             	mov    %rax,%rdi
52bc   52c8ac:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
52c0   52c8b0:	e8 00 00 00 00       	call   52c8b5 <___bpf_prog_run+0x52c5>	52c8b1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
52c5   52c8b5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
52c9   52c8b9:	e9 6b f9 ff ff       	jmp    52c229 <___bpf_prog_run+0x4c39>
52ce   52c8be:	83 e0 18             	and    $0x18,%eax
52d1   52c8c1:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
52d5   52c8c5:	88 45 b8             	mov    %al,-0x48(%rbp)
52d8   52c8c8:	48 89 f8             	mov    %rdi,%rax
52db   52c8cb:	48 89 fa             	mov    %rdi,%rdx
52de   52c8ce:	48 c1 e8 03          	shr    $0x3,%rax
52e2   52c8d2:	83 e2 07             	and    $0x7,%edx
52e5   52c8d5:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
52ea   52c8da:	38 d0                	cmp    %dl,%al
52ec   52c8dc:	7f 08                	jg     52c8e6 <___bpf_prog_run+0x52f6>
52ee   52c8de:	84 c0                	test   %al,%al
52f0   52c8e0:	0f 85 4b 07 00 00    	jne    52d031 <___bpf_prog_run+0x5a41>
52f6   52c8e6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
52fa   52c8ea:	c0 e8 04             	shr    $0x4,%al
52fd   52c8ed:	0f b6 c0             	movzbl %al,%eax
5300   52c8f0:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
5304   52c8f4:	4c 89 f8             	mov    %r15,%rax
5307   52c8f7:	48 c1 e8 03          	shr    $0x3,%rax
530b   52c8fb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5310   52c900:	0f 85 1e 07 00 00    	jne    52d024 <___bpf_prog_run+0x5a34>
5316   52c906:	49 8b 07             	mov    (%r15),%rax
5319   52c909:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
531d   52c90d:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
5321   52c911:	83 e0 0f             	and    $0xf,%eax
5324   52c914:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
5328   52c918:	4c 89 fa             	mov    %r15,%rdx
532b   52c91b:	48 c1 ea 03          	shr    $0x3,%rdx
532f   52c91f:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
5334   52c924:	0f 85 ed 06 00 00    	jne    52d017 <___bpf_prog_run+0x5a27>
533a   52c92a:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
533e   52c92e:	4d 8b 3f             	mov    (%r15),%r15
5341   52c931:	48 89 f8             	mov    %rdi,%rax
5344   52c934:	48 c1 e8 03          	shr    $0x3,%rax
5348   52c938:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
534d   52c93d:	48 89 f8             	mov    %rdi,%rax
5350   52c940:	83 e0 07             	and    $0x7,%eax
5353   52c943:	83 c0 01             	add    $0x1,%eax
5356   52c946:	38 d0                	cmp    %dl,%al
5358   52c948:	7c 08                	jl     52c952 <___bpf_prog_run+0x5362>
535a   52c94a:	84 d2                	test   %dl,%dl
535c   52c94c:	0f 85 bb 06 00 00    	jne    52d00d <___bpf_prog_run+0x5a1d>
5362   52c952:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
5367   52c957:	49 01 d7             	add    %rdx,%r15
536a   52c95a:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
536e   52c95e:	0f 85 a3 00 00 00    	jne    52ca07 <___bpf_prog_run+0x5417>
5374   52c964:	be 04 00 00 00       	mov    $0x4,%esi
5379   52c969:	4c 89 ff             	mov    %r15,%rdi
537c   52c96c:	e8 00 00 00 00       	call   52c971 <___bpf_prog_run+0x5381>	52c96d: R_X86_64_PLT32	__kasan_check_write-0x4
5381   52c971:	8b 45 c0             	mov    -0x40(%rbp),%eax
5384   52c974:	f0 41 09 07          	lock or %eax,(%r15)
5388   52c978:	e9 66 f5 ff ff       	jmp    52bee3 <___bpf_prog_run+0x48f3>
538d   52c97d:	48 89 d7             	mov    %rdx,%rdi
5390   52c980:	be 08 00 00 00       	mov    $0x8,%esi
5395   52c985:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
5399   52c989:	e8 00 00 00 00       	call   52c98e <___bpf_prog_run+0x539e>	52c98a: R_X86_64_PLT32	__kasan_check_write-0x4
539e   52c98e:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
53a2   52c992:	48 89 d0             	mov    %rdx,%rax
53a5   52c995:	48 c1 e8 03          	shr    $0x3,%rax
53a9   52c999:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
53ae   52c99e:	0f 85 58 06 00 00    	jne    52cffc <___bpf_prog_run+0x5a0c>
53b4   52c9a4:	48 8b 02             	mov    (%rdx),%rax
53b7   52c9a7:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
53bb   52c9ab:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
53bf   52c9af:	48 09 c1             	or     %rax,%rcx
53c2   52c9b2:	f0 48 0f b1 0a       	lock cmpxchg %rcx,(%rdx)
53c7   52c9b7:	75 ee                	jne    52c9a7 <___bpf_prog_run+0x53b7>
53c9   52c9b9:	4c 89 f8             	mov    %r15,%rax
53cc   52c9bc:	4c 89 fa             	mov    %r15,%rdx
53cf   52c9bf:	48 c1 e8 03          	shr    $0x3,%rax
53d3   52c9c3:	83 e2 07             	and    $0x7,%edx
53d6   52c9c6:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
53db   52c9cb:	38 d0                	cmp    %dl,%al
53dd   52c9cd:	7f 0c                	jg     52c9db <___bpf_prog_run+0x53eb>
53df   52c9cf:	84 c0                	test   %al,%al
53e1   52c9d1:	74 08                	je     52c9db <___bpf_prog_run+0x53eb>
53e3   52c9d3:	4c 89 ff             	mov    %r15,%rdi
53e6   52c9d6:	e8 00 00 00 00       	call   52c9db <___bpf_prog_run+0x53eb>	52c9d7: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
53eb   52c9db:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
53ef   52c9df:	c0 e8 04             	shr    $0x4,%al
53f2   52c9e2:	0f b6 c0             	movzbl %al,%eax
53f5   52c9e5:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
53f9   52c9e9:	4c 89 f8             	mov    %r15,%rax
53fc   52c9ec:	48 c1 e8 03          	shr    $0x3,%rax
5400   52c9f0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5405   52c9f5:	0f 85 f4 05 00 00    	jne    52cfef <___bpf_prog_run+0x59ff>
540b   52c9fb:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
540f   52c9ff:	49 89 07             	mov    %rax,(%r15)
5412   52ca02:	e9 dc f4 ff ff       	jmp    52bee3 <___bpf_prog_run+0x48f3>
5417   52ca07:	be 08 00 00 00       	mov    $0x8,%esi
541c   52ca0c:	4c 89 ff             	mov    %r15,%rdi
541f   52ca0f:	e8 00 00 00 00       	call   52ca14 <___bpf_prog_run+0x5424>	52ca10: R_X86_64_PLT32	__kasan_check_write-0x4
5424   52ca14:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5428   52ca18:	f0 49 09 07          	lock or %rax,(%r15)
542c   52ca1c:	e9 c2 f4 ff ff       	jmp    52bee3 <___bpf_prog_run+0x48f3>
5431   52ca21:	48 89 d7             	mov    %rdx,%rdi
5434   52ca24:	be 08 00 00 00       	mov    $0x8,%esi
5439   52ca29:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
543d   52ca2d:	e8 00 00 00 00       	call   52ca32 <___bpf_prog_run+0x5442>	52ca2e: R_X86_64_PLT32	__kasan_check_write-0x4
5442   52ca32:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
5446   52ca36:	48 89 d0             	mov    %rdx,%rax
5449   52ca39:	48 c1 e8 03          	shr    $0x3,%rax
544d   52ca3d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5452   52ca42:	0f 85 96 05 00 00    	jne    52cfde <___bpf_prog_run+0x59ee>
5458   52ca48:	48 8b 02             	mov    (%rdx),%rax
545b   52ca4b:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
545f   52ca4f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
5463   52ca53:	48 21 c1             	and    %rax,%rcx
5466   52ca56:	f0 48 0f b1 0a       	lock cmpxchg %rcx,(%rdx)
546b   52ca5b:	75 ee                	jne    52ca4b <___bpf_prog_run+0x545b>
546d   52ca5d:	4c 89 f8             	mov    %r15,%rax
5470   52ca60:	4c 89 fa             	mov    %r15,%rdx
5473   52ca63:	48 c1 e8 03          	shr    $0x3,%rax
5477   52ca67:	83 e2 07             	and    $0x7,%edx
547a   52ca6a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
547f   52ca6f:	38 d0                	cmp    %dl,%al
5481   52ca71:	7f 0c                	jg     52ca7f <___bpf_prog_run+0x548f>
5483   52ca73:	84 c0                	test   %al,%al
5485   52ca75:	74 08                	je     52ca7f <___bpf_prog_run+0x548f>
5487   52ca77:	4c 89 ff             	mov    %r15,%rdi
548a   52ca7a:	e8 00 00 00 00       	call   52ca7f <___bpf_prog_run+0x548f>	52ca7b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
548f   52ca7f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
5493   52ca83:	c0 e8 04             	shr    $0x4,%al
5496   52ca86:	0f b6 c0             	movzbl %al,%eax
5499   52ca89:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
549d   52ca8d:	4c 89 f8             	mov    %r15,%rax
54a0   52ca90:	48 c1 e8 03          	shr    $0x3,%rax
54a4   52ca94:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
54a9   52ca99:	0f 84 5c ff ff ff    	je     52c9fb <___bpf_prog_run+0x540b>
54af   52ca9f:	4c 89 ff             	mov    %r15,%rdi
54b2   52caa2:	e8 00 00 00 00       	call   52caa7 <___bpf_prog_run+0x54b7>	52caa3: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
54b7   52caa7:	e9 4f ff ff ff       	jmp    52c9fb <___bpf_prog_run+0x540b>
54bc   52caac:	48 89 d7             	mov    %rdx,%rdi
54bf   52caaf:	be 08 00 00 00       	mov    $0x8,%esi
54c4   52cab4:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
54c8   52cab8:	e8 00 00 00 00       	call   52cabd <___bpf_prog_run+0x54cd>	52cab9: R_X86_64_PLT32	__kasan_check_write-0x4
54cd   52cabd:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
54d1   52cac1:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
54d5   52cac5:	48 87 0a             	xchg   %rcx,(%rdx)
54d8   52cac8:	4c 89 f8             	mov    %r15,%rax
54db   52cacb:	4c 89 fa             	mov    %r15,%rdx
54de   52cace:	48 c1 e8 03          	shr    $0x3,%rax
54e2   52cad2:	83 e2 07             	and    $0x7,%edx
54e5   52cad5:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
54ea   52cada:	38 d0                	cmp    %dl,%al
54ec   52cadc:	7f 14                	jg     52caf2 <___bpf_prog_run+0x5502>
54ee   52cade:	84 c0                	test   %al,%al
54f0   52cae0:	74 10                	je     52caf2 <___bpf_prog_run+0x5502>
54f2   52cae2:	4c 89 ff             	mov    %r15,%rdi
54f5   52cae5:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
54f9   52cae9:	e8 00 00 00 00       	call   52caee <___bpf_prog_run+0x54fe>	52caea: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
54fe   52caee:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5502   52caf2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
5506   52caf6:	c0 e8 04             	shr    $0x4,%al
5509   52caf9:	0f b6 c0             	movzbl %al,%eax
550c   52cafc:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
5510   52cb00:	4c 89 f8             	mov    %r15,%rax
5513   52cb03:	48 c1 e8 03          	shr    $0x3,%rax
5517   52cb07:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
551c   52cb0c:	0f 85 b7 04 00 00    	jne    52cfc9 <___bpf_prog_run+0x59d9>
5522   52cb12:	49 89 0f             	mov    %rcx,(%r15)
5525   52cb15:	e9 c9 f3 ff ff       	jmp    52bee3 <___bpf_prog_run+0x48f3>
552a   52cb1a:	48 89 d7             	mov    %rdx,%rdi
552d   52cb1d:	be 08 00 00 00       	mov    $0x8,%esi
5532   52cb22:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
5536   52cb26:	e8 00 00 00 00       	call   52cb2b <___bpf_prog_run+0x553b>	52cb27: R_X86_64_PLT32	__kasan_check_write-0x4
553b   52cb2b:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
553f   52cb2f:	48 89 d0             	mov    %rdx,%rax
5542   52cb32:	48 c1 e8 03          	shr    $0x3,%rax
5546   52cb36:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
554b   52cb3b:	0f 85 77 04 00 00    	jne    52cfb8 <___bpf_prog_run+0x59c8>
5551   52cb41:	48 8b 02             	mov    (%rdx),%rax
5554   52cb44:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5558   52cb48:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
555c   52cb4c:	48 31 c1             	xor    %rax,%rcx
555f   52cb4f:	f0 48 0f b1 0a       	lock cmpxchg %rcx,(%rdx)
5564   52cb54:	75 ee                	jne    52cb44 <___bpf_prog_run+0x5554>
5566   52cb56:	4c 89 f8             	mov    %r15,%rax
5569   52cb59:	4c 89 fa             	mov    %r15,%rdx
556c   52cb5c:	48 c1 e8 03          	shr    $0x3,%rax
5570   52cb60:	83 e2 07             	and    $0x7,%edx
5573   52cb63:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
5578   52cb68:	38 d0                	cmp    %dl,%al
557a   52cb6a:	7f 0c                	jg     52cb78 <___bpf_prog_run+0x5588>
557c   52cb6c:	84 c0                	test   %al,%al
557e   52cb6e:	74 08                	je     52cb78 <___bpf_prog_run+0x5588>
5580   52cb70:	4c 89 ff             	mov    %r15,%rdi
5583   52cb73:	e8 00 00 00 00       	call   52cb78 <___bpf_prog_run+0x5588>	52cb74: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5588   52cb78:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
558c   52cb7c:	c0 e8 04             	shr    $0x4,%al
558f   52cb7f:	0f b6 c0             	movzbl %al,%eax
5592   52cb82:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
5596   52cb86:	4c 89 f8             	mov    %r15,%rax
5599   52cb89:	48 c1 e8 03          	shr    $0x3,%rax
559d   52cb8d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
55a2   52cb92:	0f 84 63 fe ff ff    	je     52c9fb <___bpf_prog_run+0x540b>
55a8   52cb98:	4c 89 ff             	mov    %r15,%rdi
55ab   52cb9b:	e8 00 00 00 00       	call   52cba0 <___bpf_prog_run+0x55b0>	52cb9c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
55b0   52cba0:	e9 56 fe ff ff       	jmp    52c9fb <___bpf_prog_run+0x540b>
55b5   52cba5:	48 89 d7             	mov    %rdx,%rdi
55b8   52cba8:	be 08 00 00 00       	mov    $0x8,%esi
55bd   52cbad:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
55c1   52cbb1:	e8 00 00 00 00       	call   52cbb6 <___bpf_prog_run+0x55c6>	52cbb2: R_X86_64_PLT32	__kasan_check_write-0x4
55c6   52cbb6:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
55ca   52cbba:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
55ce   52cbbe:	f0 48 0f c1 0a       	lock xadd %rcx,(%rdx)
55d3   52cbc3:	4c 89 f8             	mov    %r15,%rax
55d6   52cbc6:	4c 89 fa             	mov    %r15,%rdx
55d9   52cbc9:	48 c1 e8 03          	shr    $0x3,%rax
55dd   52cbcd:	83 e2 07             	and    $0x7,%edx
55e0   52cbd0:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
55e5   52cbd5:	38 d0                	cmp    %dl,%al
55e7   52cbd7:	7f 14                	jg     52cbed <___bpf_prog_run+0x55fd>
55e9   52cbd9:	84 c0                	test   %al,%al
55eb   52cbdb:	74 10                	je     52cbed <___bpf_prog_run+0x55fd>
55ed   52cbdd:	4c 89 ff             	mov    %r15,%rdi
55f0   52cbe0:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
55f4   52cbe4:	e8 00 00 00 00       	call   52cbe9 <___bpf_prog_run+0x55f9>	52cbe5: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
55f9   52cbe9:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
55fd   52cbed:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
5601   52cbf1:	c0 e8 04             	shr    $0x4,%al
5604   52cbf4:	0f b6 c0             	movzbl %al,%eax
5607   52cbf7:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
560b   52cbfb:	4c 89 f8             	mov    %r15,%rax
560e   52cbfe:	48 c1 e8 03          	shr    $0x3,%rax
5612   52cc02:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5617   52cc07:	0f 84 05 ff ff ff    	je     52cb12 <___bpf_prog_run+0x5522>
561d   52cc0d:	4c 89 ff             	mov    %r15,%rdi
5620   52cc10:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5624   52cc14:	e8 00 00 00 00       	call   52cc19 <___bpf_prog_run+0x5629>	52cc15: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5629   52cc19:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
562d   52cc1d:	e9 f0 fe ff ff       	jmp    52cb12 <___bpf_prog_run+0x5522>
5632   52cc22:	be 08 00 00 00       	mov    $0x8,%esi
5637   52cc27:	4c 89 ff             	mov    %r15,%rdi
563a   52cc2a:	e8 00 00 00 00       	call   52cc2f <___bpf_prog_run+0x563f>	52cc2b: R_X86_64_PLT32	__kasan_check_write-0x4
563f   52cc2f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
5643   52cc33:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
5647   52cc37:	f0 49 0f b1 37       	lock cmpxchg %rsi,(%r15)
564c   52cc3c:	4c 89 f2             	mov    %r14,%rdx
564f   52cc3f:	48 c1 ea 03          	shr    $0x3,%rdx
5653   52cc43:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
5658   52cc48:	0f 85 5b 1e 00 00    	jne    52eaa9 <___bpf_prog_run+0x74b9>
565e   52cc4e:	49 89 06             	mov    %rax,(%r14)
5661   52cc51:	e9 8d f2 ff ff       	jmp    52bee3 <___bpf_prog_run+0x48f3>
5666   52cc56:	be 08 00 00 00       	mov    $0x8,%esi
566b   52cc5b:	4c 89 ff             	mov    %r15,%rdi
566e   52cc5e:	e8 00 00 00 00       	call   52cc63 <___bpf_prog_run+0x5673>	52cc5f: R_X86_64_PLT32	__kasan_check_write-0x4
5673   52cc63:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5677   52cc67:	f0 49 31 07          	lock xor %rax,(%r15)
567b   52cc6b:	e9 73 f2 ff ff       	jmp    52bee3 <___bpf_prog_run+0x48f3>
5680   52cc70:	be 08 00 00 00       	mov    $0x8,%esi
5685   52cc75:	4c 89 ff             	mov    %r15,%rdi
5688   52cc78:	e8 00 00 00 00       	call   52cc7d <___bpf_prog_run+0x568d>	52cc79: R_X86_64_PLT32	__kasan_check_write-0x4
568d   52cc7d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5691   52cc81:	f0 49 21 07          	lock and %rax,(%r15)
5695   52cc85:	e9 59 f2 ff ff       	jmp    52bee3 <___bpf_prog_run+0x48f3>
569a   52cc8a:	be 08 00 00 00       	mov    $0x8,%esi
569f   52cc8f:	4c 89 ff             	mov    %r15,%rdi
56a2   52cc92:	e8 00 00 00 00       	call   52cc97 <___bpf_prog_run+0x56a7>	52cc93: R_X86_64_PLT32	__kasan_check_write-0x4
56a7   52cc97:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
56ab   52cc9b:	f0 49 01 07          	lock add %rax,(%r15)
56af   52cc9f:	e9 3f f2 ff ff       	jmp    52bee3 <___bpf_prog_run+0x48f3>
56b4   52cca4:	44 88 7d c0          	mov    %r15b,-0x40(%rbp)
56b8   52cca8:	e8 00 00 00 00       	call   52ccad <___bpf_prog_run+0x56bd>	52cca9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
56bd   52ccad:	49 63 d7             	movslq %r15d,%rdx
56c0   52ccb0:	0f b6 45 c0          	movzbl -0x40(%rbp),%eax
56c4   52ccb4:	ff 24 d5 00 00 00 00 	jmp    *0x0(,%rdx,8)	52ccb7: R_X86_64_32S	.rodata..c_jump_table
56cb   52ccbb:	48 89 df             	mov    %rbx,%rdi
56ce   52ccbe:	e8 00 00 00 00       	call   52ccc3 <___bpf_prog_run+0x56d3>	52ccbf: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
56d3   52ccc3:	e9 80 a9 ff ff       	jmp    527648 <___bpf_prog_run+0x58>
56d8   52ccc8:	e8 00 00 00 00       	call   52cccd <___bpf_prog_run+0x56dd>	52ccc9: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
56dd   52cccd:	e9 30 f8 ff ff       	jmp    52c502 <___bpf_prog_run+0x4f12>
56e2   52ccd2:	e8 00 00 00 00       	call   52ccd7 <___bpf_prog_run+0x56e7>	52ccd3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
56e7   52ccd7:	e9 14 f7 ff ff       	jmp    52c3f0 <___bpf_prog_run+0x4e00>
56ec   52ccdc:	e8 00 00 00 00       	call   52cce1 <___bpf_prog_run+0x56f1>	52ccdd: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
56f1   52cce1:	e9 77 f7 ff ff       	jmp    52c45d <___bpf_prog_run+0x4e6d>
56f6   52cce6:	48 89 d7             	mov    %rdx,%rdi
56f9   52cce9:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
56fd   52cced:	e8 00 00 00 00       	call   52ccf2 <___bpf_prog_run+0x5702>	52ccee: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5702   52ccf2:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5706   52ccf6:	e9 0c f3 ff ff       	jmp    52c007 <___bpf_prog_run+0x4a17>
570b   52ccfb:	48 89 c7             	mov    %rax,%rdi
570e   52ccfe:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5712   52cd02:	e8 00 00 00 00       	call   52cd07 <___bpf_prog_run+0x5717>	52cd03: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5717   52cd07:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
571b   52cd0b:	e9 19 f5 ff ff       	jmp    52c229 <___bpf_prog_run+0x4c39>
5720   52cd10:	e8 00 00 00 00       	call   52cd15 <___bpf_prog_run+0x5725>	52cd11: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5725   52cd15:	e9 bf f9 ff ff       	jmp    52c6d9 <___bpf_prog_run+0x50e9>
572a   52cd1a:	48 89 c7             	mov    %rax,%rdi
572d   52cd1d:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
5731   52cd21:	e8 00 00 00 00       	call   52cd26 <___bpf_prog_run+0x5736>	52cd22: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5736   52cd26:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
573a   52cd2a:	e9 7e f9 ff ff       	jmp    52c6ad <___bpf_prog_run+0x50bd>
573f   52cd2f:	48 89 c7             	mov    %rax,%rdi
5742   52cd32:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5746   52cd36:	e8 00 00 00 00       	call   52cd3b <___bpf_prog_run+0x574b>	52cd37: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
574b   52cd3b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
574f   52cd3f:	e9 45 f9 ff ff       	jmp    52c689 <___bpf_prog_run+0x5099>
5754   52cd44:	4c 89 ff             	mov    %r15,%rdi
5757   52cd47:	e8 00 00 00 00       	call   52cd4c <___bpf_prog_run+0x575c>	52cd48: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
575c   52cd4c:	e9 18 f9 ff ff       	jmp    52c669 <___bpf_prog_run+0x5079>
5761   52cd51:	e8 00 00 00 00       	call   52cd56 <___bpf_prog_run+0x5766>	52cd52: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5766   52cd56:	e9 1d ef ff ff       	jmp    52bc78 <___bpf_prog_run+0x4688>
576b   52cd5b:	e8 00 00 00 00       	call   52cd60 <___bpf_prog_run+0x5770>	52cd5c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5770   52cd60:	e9 b7 f0 ff ff       	jmp    52be1c <___bpf_prog_run+0x482c>
5775   52cd65:	e8 00 00 00 00       	call   52cd6a <___bpf_prog_run+0x577a>	52cd66: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
577a   52cd6a:	e9 d4 f2 ff ff       	jmp    52c043 <___bpf_prog_run+0x4a53>
577f   52cd6f:	4c 89 ff             	mov    %r15,%rdi
5782   52cd72:	e8 00 00 00 00       	call   52cd77 <___bpf_prog_run+0x5787>	52cd73: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5787   52cd77:	e9 71 a9 ff ff       	jmp    5276ed <___bpf_prog_run+0xfd>
578c   52cd7c:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5790   52cd80:	e8 00 00 00 00       	call   52cd85 <___bpf_prog_run+0x5795>	52cd81: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5795   52cd85:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5799   52cd89:	e9 7a df ff ff       	jmp    52ad08 <___bpf_prog_run+0x3718>
579e   52cd8e:	4c 89 ff             	mov    %r15,%rdi
57a1   52cd91:	e8 00 00 00 00       	call   52cd96 <___bpf_prog_run+0x57a6>	52cd92: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
57a6   52cd96:	e9 ad ae ff ff       	jmp    527c48 <___bpf_prog_run+0x658>
57ab   52cd9b:	4c 89 ff             	mov    %r15,%rdi
57ae   52cd9e:	e8 00 00 00 00       	call   52cda3 <___bpf_prog_run+0x57b3>	52cd9f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
57b3   52cda3:	e9 7d ae ff ff       	jmp    527c25 <___bpf_prog_run+0x635>
57b8   52cda8:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
57bc   52cdac:	e8 00 00 00 00       	call   52cdb1 <___bpf_prog_run+0x57c1>	52cdad: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
57c1   52cdb1:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
57c5   52cdb5:	e9 30 ae ff ff       	jmp    527bea <___bpf_prog_run+0x5fa>
57ca   52cdba:	e8 00 00 00 00       	call   52cdbf <___bpf_prog_run+0x57cf>	52cdbb: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
57cf   52cdbf:	e9 d7 ac ff ff       	jmp    527a9b <___bpf_prog_run+0x4ab>
57d4   52cdc4:	4c 89 ff             	mov    %r15,%rdi
57d7   52cdc7:	e8 00 00 00 00       	call   52cdcc <___bpf_prog_run+0x57dc>	52cdc8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
57dc   52cdcc:	e9 83 ad ff ff       	jmp    527b54 <___bpf_prog_run+0x564>
57e1   52cdd1:	e8 00 00 00 00       	call   52cdd6 <___bpf_prog_run+0x57e6>	52cdd2: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
57e6   52cdd6:	e9 a3 f3 ff ff       	jmp    52c17e <___bpf_prog_run+0x4b8e>
57eb   52cddb:	4c 89 ff             	mov    %r15,%rdi
57ee   52cdde:	e8 00 00 00 00       	call   52cde3 <___bpf_prog_run+0x57f3>	52cddf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
57f3   52cde3:	e9 7b f2 ff ff       	jmp    52c063 <___bpf_prog_run+0x4a73>
57f8   52cde8:	e8 00 00 00 00       	call   52cded <___bpf_prog_run+0x57fd>	52cde9: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
57fd   52cded:	e9 9b f1 ff ff       	jmp    52bf8d <___bpf_prog_run+0x499d>
5802   52cdf2:	48 89 c7             	mov    %rax,%rdi
5805   52cdf5:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
5809   52cdf9:	e8 00 00 00 00       	call   52cdfe <___bpf_prog_run+0x580e>	52cdfa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
580e   52cdfe:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
5812   52ce02:	e9 5a f1 ff ff       	jmp    52bf61 <___bpf_prog_run+0x4971>
5817   52ce07:	48 89 c7             	mov    %rax,%rdi
581a   52ce0a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
581e   52ce0e:	e8 00 00 00 00       	call   52ce13 <___bpf_prog_run+0x5823>	52ce0f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5823   52ce13:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5827   52ce17:	e9 21 f1 ff ff       	jmp    52bf3d <___bpf_prog_run+0x494d>
582c   52ce1c:	4c 89 f7             	mov    %r14,%rdi
582f   52ce1f:	e8 00 00 00 00       	call   52ce24 <___bpf_prog_run+0x5834>	52ce20: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5834   52ce24:	e9 b7 f0 ff ff       	jmp    52bee0 <___bpf_prog_run+0x48f0>
5839   52ce29:	e8 00 00 00 00       	call   52ce2e <___bpf_prog_run+0x583e>	52ce2a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
583e   52ce2e:	e9 6e f0 ff ff       	jmp    52bea1 <___bpf_prog_run+0x48b1>
5843   52ce33:	4c 89 ff             	mov    %r15,%rdi
5846   52ce36:	e8 00 00 00 00       	call   52ce3b <___bpf_prog_run+0x584b>	52ce37: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
584b   52ce3b:	e9 39 f0 ff ff       	jmp    52be79 <___bpf_prog_run+0x4889>
5850   52ce40:	4c 89 f7             	mov    %r14,%rdi
5853   52ce43:	e8 00 00 00 00       	call   52ce48 <___bpf_prog_run+0x5858>	52ce44: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5858   52ce48:	e9 08 f0 ff ff       	jmp    52be55 <___bpf_prog_run+0x4865>
585d   52ce4d:	4c 89 ff             	mov    %r15,%rdi
5860   52ce50:	e8 00 00 00 00       	call   52ce55 <___bpf_prog_run+0x5865>	52ce51: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5865   52ce55:	e9 e2 ef ff ff       	jmp    52be3c <___bpf_prog_run+0x484c>
586a   52ce5a:	e8 00 00 00 00       	call   52ce5f <___bpf_prog_run+0x586f>	52ce5b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
586f   52ce5f:	e9 cf f6 ff ff       	jmp    52c533 <___bpf_prog_run+0x4f43>
5874   52ce64:	e8 00 00 00 00       	call   52ce69 <___bpf_prog_run+0x5879>	52ce65: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5879   52ce69:	e9 17 f7 ff ff       	jmp    52c585 <___bpf_prog_run+0x4f95>
587e   52ce6e:	e8 00 00 00 00       	call   52ce73 <___bpf_prog_run+0x5883>	52ce6f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5883   52ce73:	e9 5a f7 ff ff       	jmp    52c5d2 <___bpf_prog_run+0x4fe2>
5888   52ce78:	e8 00 00 00 00       	call   52ce7d <___bpf_prog_run+0x588d>	52ce79: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
588d   52ce7d:	e9 15 f5 ff ff       	jmp    52c397 <___bpf_prog_run+0x4da7>
5892   52ce82:	e8 00 00 00 00       	call   52ce87 <___bpf_prog_run+0x5897>	52ce83: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5897   52ce87:	e9 05 f6 ff ff       	jmp    52c491 <___bpf_prog_run+0x4ea1>
589c   52ce8c:	e8 00 00 00 00       	call   52ce91 <___bpf_prog_run+0x58a1>	52ce8d: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
58a1   52ce91:	e9 2f f6 ff ff       	jmp    52c4c5 <___bpf_prog_run+0x4ed5>
58a6   52ce96:	4c 89 ff             	mov    %r15,%rdi
58a9   52ce99:	e8 00 00 00 00       	call   52ce9e <___bpf_prog_run+0x58ae>	52ce9a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
58ae   52ce9e:	e9 6b f2 ff ff       	jmp    52c10e <___bpf_prog_run+0x4b1e>
58b3   52cea3:	e8 00 00 00 00       	call   52cea8 <___bpf_prog_run+0x58b8>	52cea4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
58b8   52cea8:	e9 92 ee ff ff       	jmp    52bd3f <___bpf_prog_run+0x474f>
58bd   52cead:	48 89 c7             	mov    %rax,%rdi
58c0   52ceb0:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
58c4   52ceb4:	e8 00 00 00 00       	call   52ceb9 <___bpf_prog_run+0x58c9>	52ceb5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
58c9   52ceb9:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
58cd   52cebd:	e9 6f a8 ff ff       	jmp    527731 <___bpf_prog_run+0x141>
58d2   52cec2:	48 89 c7             	mov    %rax,%rdi
58d5   52cec5:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
58d9   52cec9:	e8 00 00 00 00       	call   52cece <___bpf_prog_run+0x58de>	52ceca: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
58de   52cece:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
58e2   52ced2:	e9 36 a8 ff ff       	jmp    52770d <___bpf_prog_run+0x11d>
58e7   52ced7:	48 89 c7             	mov    %rax,%rdi
58ea   52ceda:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
58ee   52cede:	e8 00 00 00 00       	call   52cee3 <___bpf_prog_run+0x58f3>	52cedf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
58f3   52cee3:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
58f7   52cee7:	e9 66 f2 ff ff       	jmp    52c152 <___bpf_prog_run+0x4b62>
58fc   52ceec:	48 89 c7             	mov    %rax,%rdi
58ff   52ceef:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5903   52cef3:	e8 00 00 00 00       	call   52cef8 <___bpf_prog_run+0x5908>	52cef4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5908   52cef8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
590c   52cefc:	e9 2d f2 ff ff       	jmp    52c12e <___bpf_prog_run+0x4b3e>
5911   52cf01:	e8 00 00 00 00       	call   52cf06 <___bpf_prog_run+0x5916>	52cf02: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5916   52cf06:	e9 a4 f1 ff ff       	jmp    52c0af <___bpf_prog_run+0x4abf>
591b   52cf0b:	4c 89 ff             	mov    %r15,%rdi
591e   52cf0e:	e8 00 00 00 00       	call   52cf13 <___bpf_prog_run+0x5923>	52cf0f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5923   52cf13:	e9 6f f1 ff ff       	jmp    52c087 <___bpf_prog_run+0x4a97>
5928   52cf18:	4c 89 ff             	mov    %r15,%rdi
592b   52cf1b:	e8 00 00 00 00       	call   52cf20 <___bpf_prog_run+0x5930>	52cf1c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5930   52cf20:	e9 f8 ef ff ff       	jmp    52bf1d <___bpf_prog_run+0x492d>
5935   52cf25:	e8 00 00 00 00       	call   52cf2a <___bpf_prog_run+0x593a>	52cf26: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
593a   52cf2a:	e9 2e a8 ff ff       	jmp    52775d <___bpf_prog_run+0x16d>
593f   52cf2f:	4c 89 ff             	mov    %r15,%rdi
5942   52cf32:	e8 00 00 00 00       	call   52cf37 <___bpf_prog_run+0x5947>	52cf33: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5947   52cf37:	e9 80 ed ff ff       	jmp    52bcbc <___bpf_prog_run+0x46cc>
594c   52cf3c:	4c 89 ff             	mov    %r15,%rdi
594f   52cf3f:	e8 00 00 00 00       	call   52cf44 <___bpf_prog_run+0x5954>	52cf40: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5954   52cf44:	e9 4f ed ff ff       	jmp    52bc98 <___bpf_prog_run+0x46a8>
5959   52cf49:	e8 00 00 00 00       	call   52cf4e <___bpf_prog_run+0x595e>	52cf4a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
595e   52cf4e:	e9 58 ee ff ff       	jmp    52bdab <___bpf_prog_run+0x47bb>
5963   52cf53:	4c 89 ff             	mov    %r15,%rdi
5966   52cf56:	e8 00 00 00 00       	call   52cf5b <___bpf_prog_run+0x596b>	52cf57: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
596b   52cf5b:	e9 23 ee ff ff       	jmp    52bd83 <___bpf_prog_run+0x4793>
5970   52cf60:	4c 89 ff             	mov    %r15,%rdi
5973   52cf63:	e8 00 00 00 00       	call   52cf68 <___bpf_prog_run+0x5978>	52cf64: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5978   52cf68:	e9 f2 ed ff ff       	jmp    52bd5f <___bpf_prog_run+0x476f>
597d   52cf6d:	e8 00 00 00 00       	call   52cf72 <___bpf_prog_run+0x5982>	52cf6e: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5982   52cf72:	e9 6d ed ff ff       	jmp    52bce4 <___bpf_prog_run+0x46f4>
5987   52cf77:	e8 00 00 00 00       	call   52cf7c <___bpf_prog_run+0x598c>	52cf78: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
598c   52cf7c:	e9 7d f8 ff ff       	jmp    52c7fe <___bpf_prog_run+0x520e>
5991   52cf81:	48 89 c7             	mov    %rax,%rdi
5994   52cf84:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
5998   52cf88:	e8 00 00 00 00       	call   52cf8d <___bpf_prog_run+0x599d>	52cf89: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
599d   52cf8d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
59a1   52cf91:	e9 3c f8 ff ff       	jmp    52c7d2 <___bpf_prog_run+0x51e2>
59a6   52cf96:	48 89 c7             	mov    %rax,%rdi
59a9   52cf99:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
59ad   52cf9d:	e8 00 00 00 00       	call   52cfa2 <___bpf_prog_run+0x59b2>	52cf9e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
59b2   52cfa2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
59b6   52cfa6:	e9 03 f8 ff ff       	jmp    52c7ae <___bpf_prog_run+0x51be>
59bb   52cfab:	4c 89 ff             	mov    %r15,%rdi
59be   52cfae:	e8 00 00 00 00       	call   52cfb3 <___bpf_prog_run+0x59c3>	52cfaf: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
59c3   52cfb3:	e9 d6 f7 ff ff       	jmp    52c78e <___bpf_prog_run+0x519e>
59c8   52cfb8:	48 89 d7             	mov    %rdx,%rdi
59cb   52cfbb:	e8 00 00 00 00       	call   52cfc0 <___bpf_prog_run+0x59d0>	52cfbc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
59d0   52cfc0:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
59d4   52cfc4:	e9 78 fb ff ff       	jmp    52cb41 <___bpf_prog_run+0x5551>
59d9   52cfc9:	4c 89 ff             	mov    %r15,%rdi
59dc   52cfcc:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
59e0   52cfd0:	e8 00 00 00 00       	call   52cfd5 <___bpf_prog_run+0x59e5>	52cfd1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
59e5   52cfd5:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
59e9   52cfd9:	e9 34 fb ff ff       	jmp    52cb12 <___bpf_prog_run+0x5522>
59ee   52cfde:	48 89 d7             	mov    %rdx,%rdi
59f1   52cfe1:	e8 00 00 00 00       	call   52cfe6 <___bpf_prog_run+0x59f6>	52cfe2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
59f6   52cfe6:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
59fa   52cfea:	e9 59 fa ff ff       	jmp    52ca48 <___bpf_prog_run+0x5458>
59ff   52cfef:	4c 89 ff             	mov    %r15,%rdi
5a02   52cff2:	e8 00 00 00 00       	call   52cff7 <___bpf_prog_run+0x5a07>	52cff3: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5a07   52cff7:	e9 ff f9 ff ff       	jmp    52c9fb <___bpf_prog_run+0x540b>
5a0c   52cffc:	48 89 d7             	mov    %rdx,%rdi
5a0f   52cfff:	e8 00 00 00 00       	call   52d004 <___bpf_prog_run+0x5a14>	52d000: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5a14   52d004:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
5a18   52d008:	e9 97 f9 ff ff       	jmp    52c9a4 <___bpf_prog_run+0x53b4>
5a1d   52d00d:	e8 00 00 00 00       	call   52d012 <___bpf_prog_run+0x5a22>	52d00e: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5a22   52d012:	e9 3b f9 ff ff       	jmp    52c952 <___bpf_prog_run+0x5362>
5a27   52d017:	4c 89 ff             	mov    %r15,%rdi
5a2a   52d01a:	e8 00 00 00 00       	call   52d01f <___bpf_prog_run+0x5a2f>	52d01b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5a2f   52d01f:	e9 06 f9 ff ff       	jmp    52c92a <___bpf_prog_run+0x533a>
5a34   52d024:	4c 89 ff             	mov    %r15,%rdi
5a37   52d027:	e8 00 00 00 00       	call   52d02c <___bpf_prog_run+0x5a3c>	52d028: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5a3c   52d02c:	e9 d5 f8 ff ff       	jmp    52c906 <___bpf_prog_run+0x5316>
5a41   52d031:	e8 00 00 00 00       	call   52d036 <___bpf_prog_run+0x5a46>	52d032: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5a46   52d036:	e9 ab f8 ff ff       	jmp    52c8e6 <___bpf_prog_run+0x52f6>
5a4b   52d03b:	e8 00 00 00 00       	call   52d040 <___bpf_prog_run+0x5a50>	52d03c: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5a50   52d040:	e9 ca e0 ff ff       	jmp    52b10f <___bpf_prog_run+0x3b1f>
5a55   52d045:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5a59   52d049:	e8 00 00 00 00       	call   52d04e <___bpf_prog_run+0x5a5e>	52d04a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5a5e   52d04e:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5a62   52d052:	e9 d4 aa ff ff       	jmp    527b2b <___bpf_prog_run+0x53b>
5a67   52d057:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5a6b   52d05b:	89 45 c0             	mov    %eax,-0x40(%rbp)
5a6e   52d05e:	e8 00 00 00 00       	call   52d063 <___bpf_prog_run+0x5a73>	52d05f: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5a73   52d063:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5a77   52d067:	48 63 45 c0          	movslq -0x40(%rbp),%rax
5a7b   52d06b:	e9 ed a8 ff ff       	jmp    52795d <___bpf_prog_run+0x36d>
5a80   52d070:	89 45 c0             	mov    %eax,-0x40(%rbp)
5a83   52d073:	e8 00 00 00 00       	call   52d078 <___bpf_prog_run+0x5a88>	52d074: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5a88   52d078:	48 63 45 c0          	movslq -0x40(%rbp),%rax
5a8c   52d07c:	e9 97 a8 ff ff       	jmp    527918 <___bpf_prog_run+0x328>
5a91   52d081:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5a95   52d085:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
5a99   52d089:	e8 00 00 00 00       	call   52d08e <___bpf_prog_run+0x5a9e>	52d08a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5a9e   52d08e:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5aa2   52d092:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5aa6   52d096:	e9 5b a9 ff ff       	jmp    5279f6 <___bpf_prog_run+0x406>
5aab   52d09b:	e8 00 00 00 00       	call   52d0a0 <___bpf_prog_run+0x5ab0>	52d09c: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5ab0   52d0a0:	e9 1d cb ff ff       	jmp    529bc2 <___bpf_prog_run+0x25d2>
5ab5   52d0a5:	e8 00 00 00 00       	call   52d0aa <___bpf_prog_run+0x5aba>	52d0a6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5aba   52d0aa:	e9 e1 ca ff ff       	jmp    529b90 <___bpf_prog_run+0x25a0>
5abf   52d0af:	e8 00 00 00 00       	call   52d0b4 <___bpf_prog_run+0x5ac4>	52d0b0: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5ac4   52d0b4:	e9 d4 c0 ff ff       	jmp    52918d <___bpf_prog_run+0x1b9d>
5ac9   52d0b9:	e8 00 00 00 00       	call   52d0be <___bpf_prog_run+0x5ace>	52d0ba: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5ace   52d0be:	e9 9b c0 ff ff       	jmp    52915e <___bpf_prog_run+0x1b6e>
5ad3   52d0c3:	e8 00 00 00 00       	call   52d0c8 <___bpf_prog_run+0x5ad8>	52d0c4: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5ad8   52d0c8:	e9 be c5 ff ff       	jmp    52968b <___bpf_prog_run+0x209b>
5add   52d0cd:	e8 00 00 00 00       	call   52d0d2 <___bpf_prog_run+0x5ae2>	52d0ce: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5ae2   52d0d2:	e9 94 bb ff ff       	jmp    528c6b <___bpf_prog_run+0x167b>
5ae7   52d0d7:	e8 00 00 00 00       	call   52d0dc <___bpf_prog_run+0x5aec>	52d0d8: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5aec   52d0dc:	e9 41 c8 ff ff       	jmp    529922 <___bpf_prog_run+0x2332>
5af1   52d0e1:	e8 00 00 00 00       	call   52d0e6 <___bpf_prog_run+0x5af6>	52d0e2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5af6   52d0e6:	e9 05 c8 ff ff       	jmp    5298f0 <___bpf_prog_run+0x2300>
5afb   52d0eb:	e8 00 00 00 00       	call   52d0f0 <___bpf_prog_run+0x5b00>	52d0ec: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b00   52d0f0:	e9 04 be ff ff       	jmp    528ef9 <___bpf_prog_run+0x1909>
5b05   52d0f5:	e8 00 00 00 00       	call   52d0fa <___bpf_prog_run+0x5b0a>	52d0f6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b0a   52d0fa:	e9 cb bd ff ff       	jmp    528eca <___bpf_prog_run+0x18da>
5b0f   52d0ff:	e8 00 00 00 00       	call   52d104 <___bpf_prog_run+0x5b14>	52d100: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b14   52d104:	e9 06 c3 ff ff       	jmp    52940f <___bpf_prog_run+0x1e1f>
5b19   52d109:	e8 00 00 00 00       	call   52d10e <___bpf_prog_run+0x5b1e>	52d10a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b1e   52d10e:	e9 dc b8 ff ff       	jmp    5289ef <___bpf_prog_run+0x13ff>
5b23   52d113:	e8 00 00 00 00       	call   52d118 <___bpf_prog_run+0x5b28>	52d114: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b28   52d118:	e9 55 c9 ff ff       	jmp    529a72 <___bpf_prog_run+0x2482>
5b2d   52d11d:	e8 00 00 00 00       	call   52d122 <___bpf_prog_run+0x5b32>	52d11e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b32   52d122:	e9 19 c9 ff ff       	jmp    529a40 <___bpf_prog_run+0x2450>
5b37   52d127:	e8 00 00 00 00       	call   52d12c <___bpf_prog_run+0x5b3c>	52d128: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b3c   52d12c:	e9 12 bf ff ff       	jmp    529043 <___bpf_prog_run+0x1a53>
5b41   52d131:	e8 00 00 00 00       	call   52d136 <___bpf_prog_run+0x5b46>	52d132: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b46   52d136:	e9 d9 be ff ff       	jmp    529014 <___bpf_prog_run+0x1a24>
5b4b   52d13b:	e8 00 00 00 00       	call   52d140 <___bpf_prog_run+0x5b50>	52d13c: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b50   52d140:	e9 08 c4 ff ff       	jmp    52954d <___bpf_prog_run+0x1f5d>
5b55   52d145:	e8 00 00 00 00       	call   52d14a <___bpf_prog_run+0x5b5a>	52d146: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b5a   52d14a:	e9 de b9 ff ff       	jmp    528b2d <___bpf_prog_run+0x153d>
5b5f   52d14f:	e8 00 00 00 00       	call   52d154 <___bpf_prog_run+0x5b64>	52d150: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b64   52d154:	e9 79 c6 ff ff       	jmp    5297d2 <___bpf_prog_run+0x21e2>
5b69   52d159:	e8 00 00 00 00       	call   52d15e <___bpf_prog_run+0x5b6e>	52d15a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b6e   52d15e:	e9 3d c6 ff ff       	jmp    5297a0 <___bpf_prog_run+0x21b0>
5b73   52d163:	e8 00 00 00 00       	call   52d168 <___bpf_prog_run+0x5b78>	52d164: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b78   52d168:	e9 42 bc ff ff       	jmp    528daf <___bpf_prog_run+0x17bf>
5b7d   52d16d:	e8 00 00 00 00       	call   52d172 <___bpf_prog_run+0x5b82>	52d16e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b82   52d172:	e9 09 bc ff ff       	jmp    528d80 <___bpf_prog_run+0x1790>
5b87   52d177:	e8 00 00 00 00       	call   52d17c <___bpf_prog_run+0x5b8c>	52d178: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b8c   52d17c:	e9 50 c1 ff ff       	jmp    5292d1 <___bpf_prog_run+0x1ce1>
5b91   52d181:	e8 00 00 00 00       	call   52d186 <___bpf_prog_run+0x5b96>	52d182: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b96   52d186:	e9 26 b7 ff ff       	jmp    5288b1 <___bpf_prog_run+0x12c1>
5b9b   52d18b:	e8 00 00 00 00       	call   52d190 <___bpf_prog_run+0x5ba0>	52d18c: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5ba0   52d190:	e9 85 c9 ff ff       	jmp    529b1a <___bpf_prog_run+0x252a>
5ba5   52d195:	e8 00 00 00 00       	call   52d19a <___bpf_prog_run+0x5baa>	52d196: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5baa   52d19a:	e9 49 c9 ff ff       	jmp    529ae8 <___bpf_prog_run+0x24f8>
5baf   52d19f:	e8 00 00 00 00       	call   52d1a4 <___bpf_prog_run+0x5bb4>	52d1a0: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5bb4   52d1a4:	e9 3f bf ff ff       	jmp    5290e8 <___bpf_prog_run+0x1af8>
5bb9   52d1a9:	e8 00 00 00 00       	call   52d1ae <___bpf_prog_run+0x5bbe>	52d1aa: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5bbe   52d1ae:	e9 06 bf ff ff       	jmp    5290b9 <___bpf_prog_run+0x1ac9>
5bc3   52d1b3:	e8 00 00 00 00       	call   52d1b8 <___bpf_prog_run+0x5bc8>	52d1b4: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5bc8   52d1b8:	e9 2f c4 ff ff       	jmp    5295ec <___bpf_prog_run+0x1ffc>
5bcd   52d1bd:	e8 00 00 00 00       	call   52d1c2 <___bpf_prog_run+0x5bd2>	52d1be: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5bd2   52d1c2:	e9 05 ba ff ff       	jmp    528bcc <___bpf_prog_run+0x15dc>
5bd7   52d1c7:	e8 00 00 00 00       	call   52d1cc <___bpf_prog_run+0x5bdc>	52d1c8: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5bdc   52d1cc:	e9 a9 c6 ff ff       	jmp    52987a <___bpf_prog_run+0x228a>
5be1   52d1d1:	e8 00 00 00 00       	call   52d1d6 <___bpf_prog_run+0x5be6>	52d1d2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5be6   52d1d6:	e9 6d c6 ff ff       	jmp    529848 <___bpf_prog_run+0x2258>
5beb   52d1db:	e8 00 00 00 00       	call   52d1e0 <___bpf_prog_run+0x5bf0>	52d1dc: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5bf0   52d1e0:	e9 6f bc ff ff       	jmp    528e54 <___bpf_prog_run+0x1864>
5bf5   52d1e5:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5bf9   52d1e9:	e8 00 00 00 00       	call   52d1ee <___bpf_prog_run+0x5bfe>	52d1ea: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5bfe   52d1ee:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5c02   52d1f2:	e9 a9 db ff ff       	jmp    52ada0 <___bpf_prog_run+0x37b0>
5c07   52d1f7:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5c0b   52d1fb:	e8 00 00 00 00       	call   52d200 <___bpf_prog_run+0x5c10>	52d1fc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c10   52d200:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5c14   52d204:	e9 50 e4 ff ff       	jmp    52b659 <___bpf_prog_run+0x4069>
5c19   52d209:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5c1d   52d20d:	e8 00 00 00 00       	call   52d212 <___bpf_prog_run+0x5c22>	52d20e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c22   52d212:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5c26   52d216:	e9 60 d1 ff ff       	jmp    52a37b <___bpf_prog_run+0x2d8b>
5c2b   52d21b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5c2f   52d21f:	e8 00 00 00 00       	call   52d224 <___bpf_prog_run+0x5c34>	52d220: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c34   52d224:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5c38   52d228:	e9 75 cd ff ff       	jmp    529fa2 <___bpf_prog_run+0x29b2>
5c3d   52d22d:	4c 89 cf             	mov    %r9,%rdi
5c40   52d230:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
5c44   52d234:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
5c48   52d238:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
5c4c   52d23c:	e8 00 00 00 00       	call   52d241 <___bpf_prog_run+0x5c51>	52d23d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c51   52d241:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
5c55   52d245:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
5c59   52d249:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
5c5d   52d24d:	e9 27 cf ff ff       	jmp    52a179 <___bpf_prog_run+0x2b89>
5c62   52d252:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5c66   52d256:	e8 00 00 00 00       	call   52d25b <___bpf_prog_run+0x5c6b>	52d257: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c6b   52d25b:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5c6f   52d25f:	e9 13 dd ff ff       	jmp    52af77 <___bpf_prog_run+0x3987>
5c74   52d264:	4c 89 cf             	mov    %r9,%rdi
5c77   52d267:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
5c7b   52d26b:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
5c7f   52d26f:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
5c83   52d273:	e8 00 00 00 00       	call   52d278 <___bpf_prog_run+0x5c88>	52d274: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c88   52d278:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
5c8c   52d27c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
5c90   52d280:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
5c94   52d284:	e9 f6 ca ff ff       	jmp    529d7f <___bpf_prog_run+0x278f>
5c99   52d289:	4c 89 cf             	mov    %r9,%rdi
5c9c   52d28c:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
5ca0   52d290:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
5ca4   52d294:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
5ca8   52d298:	e8 00 00 00 00       	call   52d29d <___bpf_prog_run+0x5cad>	52d299: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5cad   52d29d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
5cb1   52d2a1:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
5cb5   52d2a5:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
5cb9   52d2a9:	e9 67 e8 ff ff       	jmp    52bb15 <___bpf_prog_run+0x4525>
5cbe   52d2ae:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5cc2   52d2b2:	e8 00 00 00 00       	call   52d2b7 <___bpf_prog_run+0x5cc7>	52d2b3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5cc7   52d2b7:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5ccb   52d2bb:	e9 63 e2 ff ff       	jmp    52b523 <___bpf_prog_run+0x3f33>
5cd0   52d2c0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5cd4   52d2c4:	e8 00 00 00 00       	call   52d2c9 <___bpf_prog_run+0x5cd9>	52d2c5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5cd9   52d2c9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5cdd   52d2cd:	e9 e7 cf ff ff       	jmp    52a2b9 <___bpf_prog_run+0x2cc9>
5ce2   52d2d2:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5ce6   52d2d6:	e8 00 00 00 00       	call   52d2db <___bpf_prog_run+0x5ceb>	52d2d7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5ceb   52d2db:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5cef   52d2df:	e9 c3 dd ff ff       	jmp    52b0a7 <___bpf_prog_run+0x3ab7>
5cf4   52d2e4:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5cf8   52d2e8:	e8 00 00 00 00       	call   52d2ed <___bpf_prog_run+0x5cfd>	52d2e9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5cfd   52d2ed:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5d01   52d2f1:	e9 92 cb ff ff       	jmp    529e88 <___bpf_prog_run+0x2898>
5d06   52d2f6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5d0a   52d2fa:	e8 00 00 00 00       	call   52d2ff <___bpf_prog_run+0x5d0f>	52d2fb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d0f   52d2ff:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5d13   52d303:	e9 28 e0 ff ff       	jmp    52b330 <___bpf_prog_run+0x3d40>
5d18   52d308:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5d1c   52d30c:	e8 00 00 00 00       	call   52d311 <___bpf_prog_run+0x5d21>	52d30d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d21   52d311:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5d25   52d315:	e9 75 cd ff ff       	jmp    52a08f <___bpf_prog_run+0x2a9f>
5d2a   52d31a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5d2e   52d31e:	e8 00 00 00 00       	call   52d323 <___bpf_prog_run+0x5d33>	52d31f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d33   52d323:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5d37   52d327:	e9 39 d1 ff ff       	jmp    52a465 <___bpf_prog_run+0x2e75>
5d3c   52d32c:	e8 00 00 00 00       	call   52d331 <___bpf_prog_run+0x5d41>	52d32d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d41   52d331:	e9 02 c9 ff ff       	jmp    529c38 <___bpf_prog_run+0x2648>
5d46   52d336:	e8 00 00 00 00       	call   52d33b <___bpf_prog_run+0x5d4b>	52d337: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d4b   52d33b:	e9 77 e2 ff ff       	jmp    52b5b7 <___bpf_prog_run+0x3fc7>
5d50   52d340:	e8 00 00 00 00       	call   52d345 <___bpf_prog_run+0x5d55>	52d341: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5d55   52d345:	e9 8b d0 ff ff       	jmp    52a3d5 <___bpf_prog_run+0x2de5>
5d5a   52d34a:	e8 00 00 00 00       	call   52d34f <___bpf_prog_run+0x5d5f>	52d34b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d5f   52d34f:	e9 5d e4 ff ff       	jmp    52b7b1 <___bpf_prog_run+0x41c1>
5d64   52d354:	e8 00 00 00 00       	call   52d359 <___bpf_prog_run+0x5d69>	52d355: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5d69   52d359:	e9 b4 d4 ff ff       	jmp    52a812 <___bpf_prog_run+0x3222>
5d6e   52d35e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5d72   52d362:	e8 00 00 00 00       	call   52d367 <___bpf_prog_run+0x5d77>	52d363: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5d77   52d367:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5d7b   52d36b:	e9 2d df ff ff       	jmp    52b29d <___bpf_prog_run+0x3cad>
5d80   52d370:	e8 00 00 00 00       	call   52d375 <___bpf_prog_run+0x5d85>	52d371: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d85   52d375:	e9 fa de ff ff       	jmp    52b274 <___bpf_prog_run+0x3c84>
5d8a   52d37a:	4c 89 cf             	mov    %r9,%rdi
5d8d   52d37d:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
5d91   52d381:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
5d95   52d385:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
5d99   52d389:	e8 00 00 00 00       	call   52d38e <___bpf_prog_run+0x5d9e>	52d38a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d9e   52d38e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
5da2   52d392:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
5da6   52d396:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
5daa   52d39a:	e9 f0 e0 ff ff       	jmp    52b48f <___bpf_prog_run+0x3e9f>
5daf   52d39f:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5db3   52d3a3:	e8 00 00 00 00       	call   52d3a8 <___bpf_prog_run+0x5db8>	52d3a4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5db8   52d3a8:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5dbc   52d3ac:	e9 fe d1 ff ff       	jmp    52a5af <___bpf_prog_run+0x2fbf>
5dc1   52d3b1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5dc5   52d3b5:	e8 00 00 00 00       	call   52d3ba <___bpf_prog_run+0x5dca>	52d3b6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5dca   52d3ba:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5dce   52d3be:	e9 48 dc ff ff       	jmp    52b00b <___bpf_prog_run+0x3a1b>
5dd3   52d3c3:	e8 00 00 00 00       	call   52d3c8 <___bpf_prog_run+0x5dd8>	52d3c4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5dd8   52d3c8:	e9 58 ba ff ff       	jmp    528e25 <___bpf_prog_run+0x1835>
5ddd   52d3cd:	e8 00 00 00 00       	call   52d3d2 <___bpf_prog_run+0x5de2>	52d3ce: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5de2   52d3d2:	e9 99 bf ff ff       	jmp    529370 <___bpf_prog_run+0x1d80>
5de7   52d3d7:	e8 00 00 00 00       	call   52d3dc <___bpf_prog_run+0x5dec>	52d3d8: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5dec   52d3dc:	e9 6f b5 ff ff       	jmp    528950 <___bpf_prog_run+0x1360>
5df1   52d3e1:	e8 00 00 00 00       	call   52d3e6 <___bpf_prog_run+0x5df6>	52d3e2: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5df6   52d3e6:	e9 df c5 ff ff       	jmp    5299ca <___bpf_prog_run+0x23da>
5dfb   52d3eb:	e8 00 00 00 00       	call   52d3f0 <___bpf_prog_run+0x5e00>	52d3ec: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e00   52d3f0:	e9 a3 c5 ff ff       	jmp    529998 <___bpf_prog_run+0x23a8>
5e05   52d3f5:	e8 00 00 00 00       	call   52d3fa <___bpf_prog_run+0x5e0a>	52d3f6: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e0a   52d3fa:	e9 9f bb ff ff       	jmp    528f9e <___bpf_prog_run+0x19ae>
5e0f   52d3ff:	e8 00 00 00 00       	call   52d404 <___bpf_prog_run+0x5e14>	52d400: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e14   52d404:	e9 66 bb ff ff       	jmp    528f6f <___bpf_prog_run+0x197f>
5e19   52d409:	e8 00 00 00 00       	call   52d40e <___bpf_prog_run+0x5e1e>	52d40a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e1e   52d40e:	e9 9b c0 ff ff       	jmp    5294ae <___bpf_prog_run+0x1ebe>
5e23   52d413:	e8 00 00 00 00       	call   52d418 <___bpf_prog_run+0x5e28>	52d414: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e28   52d418:	e9 71 b6 ff ff       	jmp    528a8e <___bpf_prog_run+0x149e>
5e2d   52d41d:	e8 00 00 00 00       	call   52d422 <___bpf_prog_run+0x5e32>	52d41e: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e32   52d422:	e9 03 c3 ff ff       	jmp    52972a <___bpf_prog_run+0x213a>
5e37   52d427:	e8 00 00 00 00       	call   52d42c <___bpf_prog_run+0x5e3c>	52d428: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e3c   52d42c:	e9 d9 b8 ff ff       	jmp    528d0a <___bpf_prog_run+0x171a>
5e41   52d431:	e8 00 00 00 00       	call   52d436 <___bpf_prog_run+0x5e46>	52d432: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e46   52d436:	e9 c8 bd ff ff       	jmp    529203 <___bpf_prog_run+0x1c13>
5e4b   52d43b:	e8 00 00 00 00       	call   52d440 <___bpf_prog_run+0x5e50>	52d43c: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e50   52d440:	e9 cd b3 ff ff       	jmp    528812 <___bpf_prog_run+0x1222>
5e55   52d445:	e8 00 00 00 00       	call   52d44a <___bpf_prog_run+0x5e5a>	52d446: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e5a   52d44a:	e9 91 b3 ff ff       	jmp    5287e0 <___bpf_prog_run+0x11f0>
5e5f   52d44f:	e8 00 00 00 00       	call   52d454 <___bpf_prog_run+0x5e64>	52d450: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e64   52d454:	e9 11 b3 ff ff       	jmp    52876a <___bpf_prog_run+0x117a>
5e69   52d459:	e8 00 00 00 00       	call   52d45e <___bpf_prog_run+0x5e6e>	52d45a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e6e   52d45e:	e9 d5 b2 ff ff       	jmp    528738 <___bpf_prog_run+0x1148>
5e73   52d463:	4c 89 ff             	mov    %r15,%rdi
5e76   52d466:	e8 00 00 00 00       	call   52d46b <___bpf_prog_run+0x5e7b>	52d467: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5e7b   52d46b:	e9 8c ad ff ff       	jmp    5281fc <___bpf_prog_run+0xc0c>
5e80   52d470:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5e84   52d474:	e8 00 00 00 00       	call   52d479 <___bpf_prog_run+0x5e89>	52d475: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e89   52d479:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5e8d   52d47d:	e9 54 ad ff ff       	jmp    5281d6 <___bpf_prog_run+0xbe6>
5e92   52d482:	4c 89 ff             	mov    %r15,%rdi
5e95   52d485:	89 55 c0             	mov    %edx,-0x40(%rbp)
5e98   52d488:	e8 00 00 00 00       	call   52d48d <___bpf_prog_run+0x5e9d>	52d489: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
5e9d   52d48d:	8b 55 c0             	mov    -0x40(%rbp),%edx
5ea0   52d490:	e9 cc b0 ff ff       	jmp    528561 <___bpf_prog_run+0xf71>
5ea5   52d495:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5ea9   52d499:	89 55 c0             	mov    %edx,-0x40(%rbp)
5eac   52d49c:	e8 00 00 00 00       	call   52d4a1 <___bpf_prog_run+0x5eb1>	52d49d: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5eb1   52d4a1:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5eb5   52d4a5:	8b 55 c0             	mov    -0x40(%rbp),%edx
5eb8   52d4a8:	e9 8e b0 ff ff       	jmp    52853b <___bpf_prog_run+0xf4b>
5ebd   52d4ad:	89 55 c0             	mov    %edx,-0x40(%rbp)
5ec0   52d4b0:	e8 00 00 00 00       	call   52d4b5 <___bpf_prog_run+0x5ec5>	52d4b1: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5ec5   52d4b5:	8b 55 c0             	mov    -0x40(%rbp),%edx
5ec8   52d4b8:	e9 39 b0 ff ff       	jmp    5284f6 <___bpf_prog_run+0xf06>
5ecd   52d4bd:	4c 89 ff             	mov    %r15,%rdi
5ed0   52d4c0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
5ed4   52d4c4:	e8 00 00 00 00       	call   52d4c9 <___bpf_prog_run+0x5ed9>	52d4c5: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
5ed9   52d4c9:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5edd   52d4cd:	e9 89 aa ff ff       	jmp    527f5b <___bpf_prog_run+0x96b>
5ee2   52d4d2:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5ee6   52d4d6:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
5eea   52d4da:	e8 00 00 00 00       	call   52d4df <___bpf_prog_run+0x5eef>	52d4db: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5eef   52d4df:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5ef3   52d4e3:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5ef7   52d4e7:	e9 46 aa ff ff       	jmp    527f32 <___bpf_prog_run+0x942>
5efc   52d4ec:	4c 89 ff             	mov    %r15,%rdi
5eff   52d4ef:	89 55 c0             	mov    %edx,-0x40(%rbp)
5f02   52d4f2:	e8 00 00 00 00       	call   52d4f7 <___bpf_prog_run+0x5f07>	52d4f3: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
5f07   52d4f7:	8b 55 c0             	mov    -0x40(%rbp),%edx
5f0a   52d4fa:	e9 c5 b1 ff ff       	jmp    5286c4 <___bpf_prog_run+0x10d4>
5f0f   52d4ff:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5f13   52d503:	89 55 c0             	mov    %edx,-0x40(%rbp)
5f16   52d506:	e8 00 00 00 00       	call   52d50b <___bpf_prog_run+0x5f1b>	52d507: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f1b   52d50b:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5f1f   52d50f:	8b 55 c0             	mov    -0x40(%rbp),%edx
5f22   52d512:	e9 84 b1 ff ff       	jmp    52869b <___bpf_prog_run+0x10ab>
5f27   52d517:	89 55 c0             	mov    %edx,-0x40(%rbp)
5f2a   52d51a:	e8 00 00 00 00       	call   52d51f <___bpf_prog_run+0x5f2f>	52d51b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5f2f   52d51f:	8b 55 c0             	mov    -0x40(%rbp),%edx
5f32   52d522:	e9 2f b1 ff ff       	jmp    528656 <___bpf_prog_run+0x1066>
5f37   52d527:	4c 89 ff             	mov    %r15,%rdi
5f3a   52d52a:	e8 00 00 00 00       	call   52d52f <___bpf_prog_run+0x5f3f>	52d52b: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f3f   52d52f:	e9 66 ab ff ff       	jmp    52809a <___bpf_prog_run+0xaaa>
5f44   52d534:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5f48   52d538:	e8 00 00 00 00       	call   52d53d <___bpf_prog_run+0x5f4d>	52d539: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f4d   52d53d:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5f51   52d541:	e9 2b ab ff ff       	jmp    528071 <___bpf_prog_run+0xa81>
5f56   52d546:	4c 89 ff             	mov    %r15,%rdi
5f59   52d549:	e8 00 00 00 00       	call   52d54e <___bpf_prog_run+0x5f5e>	52d54a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f5e   52d54e:	e9 43 ae ff ff       	jmp    528396 <___bpf_prog_run+0xda6>
5f63   52d553:	4c 89 ff             	mov    %r15,%rdi
5f66   52d556:	e8 00 00 00 00       	call   52d55b <___bpf_prog_run+0x5f6b>	52d557: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5f6b   52d55b:	e9 13 ae ff ff       	jmp    528373 <___bpf_prog_run+0xd83>
5f70   52d560:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5f74   52d564:	e8 00 00 00 00       	call   52d569 <___bpf_prog_run+0x5f79>	52d565: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f79   52d569:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5f7d   52d56d:	e9 c6 ad ff ff       	jmp    528338 <___bpf_prog_run+0xd48>
5f82   52d572:	4c 89 ff             	mov    %r15,%rdi
5f85   52d575:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
5f89   52d579:	e8 00 00 00 00       	call   52d57e <___bpf_prog_run+0x5f8e>	52d57a: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
5f8e   52d57e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5f92   52d582:	e9 59 a8 ff ff       	jmp    527de0 <___bpf_prog_run+0x7f0>
5f97   52d587:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5f9b   52d58b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
5f9f   52d58f:	e8 00 00 00 00       	call   52d594 <___bpf_prog_run+0x5fa4>	52d590: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5fa4   52d594:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5fa8   52d598:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5fac   52d59c:	e9 16 a8 ff ff       	jmp    527db7 <___bpf_prog_run+0x7c7>
5fb1   52d5a1:	e8 00 00 00 00       	call   52d5a6 <___bpf_prog_run+0x5fb6>	52d5a2: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5fb6   52d5a6:	e9 52 b0 ff ff       	jmp    5285fd <___bpf_prog_run+0x100d>
5fbb   52d5ab:	e8 00 00 00 00       	call   52d5b0 <___bpf_prog_run+0x5fc0>	52d5ac: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5fc0   52d5b0:	e9 43 aa ff ff       	jmp    527ff8 <___bpf_prog_run+0xa08>
5fc5   52d5b5:	e8 00 00 00 00       	call   52d5ba <___bpf_prog_run+0x5fca>	52d5b6: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5fca   52d5ba:	e9 00 ad ff ff       	jmp    5282bf <___bpf_prog_run+0xccf>
5fcf   52d5bf:	e8 00 00 00 00       	call   52d5c4 <___bpf_prog_run+0x5fd4>	52d5c0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5fd4   52d5c4:	e9 c7 ac ff ff       	jmp    528290 <___bpf_prog_run+0xca0>
5fd9   52d5c9:	4c 89 ff             	mov    %r15,%rdi
5fdc   52d5cc:	89 55 c0             	mov    %edx,-0x40(%rbp)
5fdf   52d5cf:	e8 00 00 00 00       	call   52d5d4 <___bpf_prog_run+0x5fe4>	52d5d0: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
5fe4   52d5d4:	8b 55 c0             	mov    -0x40(%rbp),%edx
5fe7   52d5d7:	e9 45 a7 ff ff       	jmp    527d21 <___bpf_prog_run+0x731>
5fec   52d5dc:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5ff0   52d5e0:	89 55 c0             	mov    %edx,-0x40(%rbp)
5ff3   52d5e3:	e8 00 00 00 00       	call   52d5e8 <___bpf_prog_run+0x5ff8>	52d5e4: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5ff8   52d5e8:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5ffc   52d5ec:	8b 55 c0             	mov    -0x40(%rbp),%edx
5fff   52d5ef:	e9 04 a7 ff ff       	jmp    527cf8 <___bpf_prog_run+0x708>
6004   52d5f4:	89 55 c0             	mov    %edx,-0x40(%rbp)
6007   52d5f7:	e8 00 00 00 00       	call   52d5fc <___bpf_prog_run+0x600c>	52d5f8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
600c   52d5fc:	8b 55 c0             	mov    -0x40(%rbp),%edx
600f   52d5ff:	e9 af a6 ff ff       	jmp    527cb3 <___bpf_prog_run+0x6c3>
6014   52d604:	4c 89 ff             	mov    %r15,%rdi
6017   52d607:	e8 00 00 00 00       	call   52d60c <___bpf_prog_run+0x601c>	52d608: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
601c   52d60c:	e9 79 ae ff ff       	jmp    52848a <___bpf_prog_run+0xe9a>
6021   52d611:	4c 89 ff             	mov    %r15,%rdi
6024   52d614:	e8 00 00 00 00       	call   52d619 <___bpf_prog_run+0x6029>	52d615: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6029   52d619:	e9 4b ae ff ff       	jmp    528469 <___bpf_prog_run+0xe79>
602e   52d61e:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6032   52d622:	e8 00 00 00 00       	call   52d627 <___bpf_prog_run+0x6037>	52d623: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6037   52d627:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
603b   52d62b:	e9 fe ad ff ff       	jmp    52842e <___bpf_prog_run+0xe3e>
6040   52d630:	e8 00 00 00 00       	call   52d635 <___bpf_prog_run+0x6045>	52d631: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6045   52d635:	e9 23 ab ff ff       	jmp    52815d <___bpf_prog_run+0xb6d>
604a   52d63a:	e8 00 00 00 00       	call   52d63f <___bpf_prog_run+0x604f>	52d63b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
604f   52d63f:	e9 ea aa ff ff       	jmp    52812e <___bpf_prog_run+0xb3e>
6054   52d644:	4c 89 ff             	mov    %r15,%rdi
6057   52d647:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
605b   52d64b:	e8 00 00 00 00       	call   52d650 <___bpf_prog_run+0x6060>	52d64c: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
6060   52d650:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6064   52d654:	e9 43 a8 ff ff       	jmp    527e9c <___bpf_prog_run+0x8ac>
6069   52d659:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
606d   52d65d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6071   52d661:	e8 00 00 00 00       	call   52d666 <___bpf_prog_run+0x6076>	52d662: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6076   52d666:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
607a   52d66a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
607e   52d66e:	e9 03 a8 ff ff       	jmp    527e76 <___bpf_prog_run+0x886>
6083   52d673:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6087   52d677:	e8 00 00 00 00       	call   52d67c <___bpf_prog_run+0x608c>	52d678: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
608c   52d67c:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6090   52d680:	e9 02 a2 ff ff       	jmp    527887 <___bpf_prog_run+0x297>
6095   52d685:	4c 89 cf             	mov    %r9,%rdi
6098   52d688:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
609c   52d68c:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
60a0   52d690:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
60a4   52d694:	e8 00 00 00 00       	call   52d699 <___bpf_prog_run+0x60a9>	52d695: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
60a9   52d699:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
60ad   52d69d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
60b1   52d6a1:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
60b5   52d6a5:	e9 20 d4 ff ff       	jmp    52aaca <___bpf_prog_run+0x34da>
60ba   52d6aa:	e8 00 00 00 00       	call   52d6af <___bpf_prog_run+0x60bf>	52d6ab: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
60bf   52d6af:	e9 27 ce ff ff       	jmp    52a4db <___bpf_prog_run+0x2eeb>
60c4   52d6b4:	4c 89 cf             	mov    %r9,%rdi
60c7   52d6b7:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
60cb   52d6bb:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
60cf   52d6bf:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
60d3   52d6c3:	e8 00 00 00 00       	call   52d6c8 <___bpf_prog_run+0x60d8>	52d6c4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
60d8   52d6c8:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
60dc   52d6cc:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
60e0   52d6d0:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
60e4   52d6d4:	e9 5d d3 ff ff       	jmp    52aa36 <___bpf_prog_run+0x3446>
60e9   52d6d9:	e8 00 00 00 00       	call   52d6de <___bpf_prog_run+0x60ee>	52d6da: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
60ee   52d6de:	e9 36 e5 ff ff       	jmp    52bc19 <___bpf_prog_run+0x4629>
60f3   52d6e3:	e8 00 00 00 00       	call   52d6e8 <___bpf_prog_run+0x60f8>	52d6e4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
60f8   52d6e8:	e9 76 e4 ff ff       	jmp    52bb63 <___bpf_prog_run+0x4573>
60fd   52d6ed:	4c 89 c7             	mov    %r8,%rdi
6100   52d6f0:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6104   52d6f4:	e8 00 00 00 00       	call   52d6f9 <___bpf_prog_run+0x6109>	52d6f5: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6109   52d6f9:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
610d   52d6fd:	e9 ce e3 ff ff       	jmp    52bad0 <___bpf_prog_run+0x44e0>
6112   52d702:	e8 00 00 00 00       	call   52d707 <___bpf_prog_run+0x6117>	52d703: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6117   52d707:	e9 93 e3 ff ff       	jmp    52ba9f <___bpf_prog_run+0x44af>
611c   52d70c:	e8 00 00 00 00       	call   52d711 <___bpf_prog_run+0x6121>	52d70d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6121   52d711:	e9 1a e3 ff ff       	jmp    52ba30 <___bpf_prog_run+0x4440>
6126   52d716:	e8 00 00 00 00       	call   52d71b <___bpf_prog_run+0x612b>	52d717: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
612b   52d71b:	e9 9f e2 ff ff       	jmp    52b9bf <___bpf_prog_run+0x43cf>
6130   52d720:	e8 00 00 00 00       	call   52d725 <___bpf_prog_run+0x6135>	52d721: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6135   52d725:	e9 55 e2 ff ff       	jmp    52b97f <___bpf_prog_run+0x438f>
613a   52d72a:	e8 00 00 00 00       	call   52d72f <___bpf_prog_run+0x613f>	52d72b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
613f   52d72f:	e9 d7 e1 ff ff       	jmp    52b90b <___bpf_prog_run+0x431b>
6144   52d734:	e8 00 00 00 00       	call   52d739 <___bpf_prog_run+0x6149>	52d735: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6149   52d739:	e9 1c e1 ff ff       	jmp    52b85a <___bpf_prog_run+0x426a>
614e   52d73e:	e8 00 00 00 00       	call   52d743 <___bpf_prog_run+0x6153>	52d73f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6153   52d743:	e9 a1 e0 ff ff       	jmp    52b7e9 <___bpf_prog_run+0x41f9>
6158   52d748:	e8 00 00 00 00       	call   52d74d <___bpf_prog_run+0x615d>	52d749: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
615d   52d74d:	e9 1a e0 ff ff       	jmp    52b76c <___bpf_prog_run+0x417c>
6162   52d752:	e8 00 00 00 00       	call   52d757 <___bpf_prog_run+0x6167>	52d753: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6167   52d757:	e9 9f df ff ff       	jmp    52b6fb <___bpf_prog_run+0x410b>
616c   52d75c:	e8 00 00 00 00       	call   52d761 <___bpf_prog_run+0x6171>	52d75d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6171   52d761:	e9 28 df ff ff       	jmp    52b68e <___bpf_prog_run+0x409e>
6176   52d766:	e8 00 00 00 00       	call   52d76b <___bpf_prog_run+0x617b>	52d767: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
617b   52d76b:	e9 a4 de ff ff       	jmp    52b614 <___bpf_prog_run+0x4024>
6180   52d770:	e8 00 00 00 00       	call   52d775 <___bpf_prog_run+0x6185>	52d771: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6185   52d775:	e9 de dd ff ff       	jmp    52b558 <___bpf_prog_run+0x3f68>
618a   52d77a:	e8 00 00 00 00       	call   52d77f <___bpf_prog_run+0x618f>	52d77b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
618f   52d77f:	e9 5a dd ff ff       	jmp    52b4de <___bpf_prog_run+0x3eee>
6194   52d784:	4c 89 c7             	mov    %r8,%rdi
6197   52d787:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
619b   52d78b:	e8 00 00 00 00       	call   52d790 <___bpf_prog_run+0x61a0>	52d78c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61a0   52d790:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
61a4   52d794:	e9 b1 dc ff ff       	jmp    52b44a <___bpf_prog_run+0x3e5a>
61a9   52d799:	e8 00 00 00 00       	call   52d79e <___bpf_prog_run+0x61ae>	52d79a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61ae   52d79e:	e9 36 dc ff ff       	jmp    52b3d9 <___bpf_prog_run+0x3de9>
61b3   52d7a3:	e8 00 00 00 00       	call   52d7a8 <___bpf_prog_run+0x61b8>	52d7a4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61b8   52d7a8:	e9 b8 db ff ff       	jmp    52b365 <___bpf_prog_run+0x3d75>
61bd   52d7ad:	e8 00 00 00 00       	call   52d7b2 <___bpf_prog_run+0x61c2>	52d7ae: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61c2   52d7b2:	e9 34 db ff ff       	jmp    52b2eb <___bpf_prog_run+0x3cfb>
61c7   52d7b7:	e8 00 00 00 00       	call   52d7bc <___bpf_prog_run+0x61cc>	52d7b8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
61cc   52d7bc:	e9 8a da ff ff       	jmp    52b24b <___bpf_prog_run+0x3c5b>
61d1   52d7c1:	e8 00 00 00 00       	call   52d7c6 <___bpf_prog_run+0x61d6>	52d7c2: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61d6   52d7c6:	e9 0b da ff ff       	jmp    52b1d6 <___bpf_prog_run+0x3be6>
61db   52d7cb:	e8 00 00 00 00       	call   52d7d0 <___bpf_prog_run+0x61e0>	52d7cc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
61e0   52d7d0:	e9 0a d9 ff ff       	jmp    52b0df <___bpf_prog_run+0x3aef>
61e5   52d7d5:	e8 00 00 00 00       	call   52d7da <___bpf_prog_run+0x61ea>	52d7d6: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61ea   52d7da:	e9 83 d8 ff ff       	jmp    52b062 <___bpf_prog_run+0x3a72>
61ef   52d7df:	e8 00 00 00 00       	call   52d7e4 <___bpf_prog_run+0x61f4>	52d7e0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61f4   52d7e4:	e9 c3 d7 ff ff       	jmp    52afac <___bpf_prog_run+0x39bc>
61f9   52d7e9:	e8 00 00 00 00       	call   52d7ee <___bpf_prog_run+0x61fe>	52d7ea: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61fe   52d7ee:	e9 3f d7 ff ff       	jmp    52af32 <___bpf_prog_run+0x3942>
6203   52d7f3:	e8 00 00 00 00       	call   52d7f8 <___bpf_prog_run+0x6208>	52d7f4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6208   52d7f8:	e9 96 d6 ff ff       	jmp    52ae93 <___bpf_prog_run+0x38a3>
620d   52d7fd:	e8 00 00 00 00       	call   52d802 <___bpf_prog_run+0x6212>	52d7fe: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6212   52d802:	e9 1a d6 ff ff       	jmp    52ae21 <___bpf_prog_run+0x3831>
6217   52d807:	e8 00 00 00 00       	call   52d80c <___bpf_prog_run+0x621c>	52d808: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
621c   52d80c:	e9 c5 d5 ff ff       	jmp    52add6 <___bpf_prog_run+0x37e6>
6221   52d811:	e8 00 00 00 00       	call   52d816 <___bpf_prog_run+0x6226>	52d812: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6226   52d816:	e9 40 d5 ff ff       	jmp    52ad5b <___bpf_prog_run+0x376b>
622b   52d81b:	e8 00 00 00 00       	call   52d820 <___bpf_prog_run+0x6230>	52d81c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6230   52d820:	e9 bd d4 ff ff       	jmp    52ace2 <___bpf_prog_run+0x36f2>
6235   52d825:	e8 00 00 00 00       	call   52d82a <___bpf_prog_run+0x623a>	52d826: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
623a   52d82a:	e9 3e d4 ff ff       	jmp    52ac6d <___bpf_prog_run+0x367d>
623f   52d82f:	e8 00 00 00 00       	call   52d834 <___bpf_prog_run+0x6244>	52d830: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6244   52d834:	e9 c3 d3 ff ff       	jmp    52abfc <___bpf_prog_run+0x360c>
6249   52d839:	e8 00 00 00 00       	call   52d83e <___bpf_prog_run+0x624e>	52d83a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
624e   52d83e:	e9 47 d3 ff ff       	jmp    52ab8a <___bpf_prog_run+0x359a>
6253   52d843:	e8 00 00 00 00       	call   52d848 <___bpf_prog_run+0x6258>	52d844: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6258   52d848:	e9 cc d2 ff ff       	jmp    52ab19 <___bpf_prog_run+0x3529>
625d   52d84d:	4c 89 c7             	mov    %r8,%rdi
6260   52d850:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6264   52d854:	e8 00 00 00 00       	call   52d859 <___bpf_prog_run+0x6269>	52d855: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6269   52d859:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
626d   52d85d:	e9 23 d2 ff ff       	jmp    52aa85 <___bpf_prog_run+0x3495>
6272   52d862:	4c 89 c7             	mov    %r8,%rdi
6275   52d865:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6279   52d869:	e8 00 00 00 00       	call   52d86e <___bpf_prog_run+0x627e>	52d86a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
627e   52d86e:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6282   52d872:	e9 7a d1 ff ff       	jmp    52a9f1 <___bpf_prog_run+0x3401>
6287   52d877:	e8 00 00 00 00       	call   52d87c <___bpf_prog_run+0x628c>	52d878: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
628c   52d87c:	e9 ff d0 ff ff       	jmp    52a980 <___bpf_prog_run+0x3390>
6291   52d881:	e8 00 00 00 00       	call   52d886 <___bpf_prog_run+0x6296>	52d882: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6296   52d886:	e9 7f d0 ff ff       	jmp    52a90a <___bpf_prog_run+0x331a>
629b   52d88b:	e8 00 00 00 00       	call   52d890 <___bpf_prog_run+0x62a0>	52d88c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
62a0   52d890:	e9 c8 cf ff ff       	jmp    52a85d <___bpf_prog_run+0x326d>
62a5   52d895:	e8 00 00 00 00       	call   52d89a <___bpf_prog_run+0x62aa>	52d896: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
62aa   52d89a:	e9 4d cf ff ff       	jmp    52a7ec <___bpf_prog_run+0x31fc>
62af   52d89f:	e8 00 00 00 00       	call   52d8a4 <___bpf_prog_run+0x62b4>	52d8a0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
62b4   52d8a4:	e9 cd ce ff ff       	jmp    52a776 <___bpf_prog_run+0x3186>
62b9   52d8a9:	e8 00 00 00 00       	call   52d8ae <___bpf_prog_run+0x62be>	52d8aa: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
62be   52d8ae:	e9 fb cd ff ff       	jmp    52a6ae <___bpf_prog_run+0x30be>
62c3   52d8b3:	e8 00 00 00 00       	call   52d8b8 <___bpf_prog_run+0x62c8>	52d8b4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
62c8   52d8b8:	e9 7c cd ff ff       	jmp    52a639 <___bpf_prog_run+0x3049>
62cd   52d8bd:	e8 00 00 00 00       	call   52d8c2 <___bpf_prog_run+0x62d2>	52d8be: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
62d2   52d8c2:	e9 c2 cc ff ff       	jmp    52a589 <___bpf_prog_run+0x2f99>
62d7   52d8c7:	e8 00 00 00 00       	call   52d8cc <___bpf_prog_run+0x62dc>	52d8c8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
62dc   52d8cc:	e9 3f cc ff ff       	jmp    52a510 <___bpf_prog_run+0x2f20>
62e1   52d8d1:	e8 00 00 00 00       	call   52d8d6 <___bpf_prog_run+0x62e6>	52d8d2: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
62e6   52d8d6:	e9 bb cb ff ff       	jmp    52a496 <___bpf_prog_run+0x2ea6>
62eb   52d8db:	e8 00 00 00 00       	call   52d8e0 <___bpf_prog_run+0x62f0>	52d8dc: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
62f0   52d8e0:	e9 3b cb ff ff       	jmp    52a420 <___bpf_prog_run+0x2e30>
62f5   52d8e5:	e8 00 00 00 00       	call   52d8ea <___bpf_prog_run+0x62fa>	52d8e6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
62fa   52d8ea:	e9 c0 ca ff ff       	jmp    52a3af <___bpf_prog_run+0x2dbf>
62ff   52d8ef:	e8 00 00 00 00       	call   52d8f4 <___bpf_prog_run+0x6304>	52d8f0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6304   52d8f4:	e9 3d ca ff ff       	jmp    52a336 <___bpf_prog_run+0x2d46>
6309   52d8f9:	e8 00 00 00 00       	call   52d8fe <___bpf_prog_run+0x630e>	52d8fa: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
630e   52d8fe:	e9 ea c9 ff ff       	jmp    52a2ed <___bpf_prog_run+0x2cfd>
6313   52d903:	e8 00 00 00 00       	call   52d908 <___bpf_prog_run+0x6318>	52d904: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6318   52d908:	e9 67 c9 ff ff       	jmp    52a274 <___bpf_prog_run+0x2c84>
631d   52d90d:	e8 00 00 00 00       	call   52d912 <___bpf_prog_run+0x6322>	52d90e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6322   52d912:	e9 b0 c8 ff ff       	jmp    52a1c7 <___bpf_prog_run+0x2bd7>
6327   52d917:	4c 89 c7             	mov    %r8,%rdi
632a   52d91a:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
632e   52d91e:	e8 00 00 00 00       	call   52d923 <___bpf_prog_run+0x6333>	52d91f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6333   52d923:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6337   52d927:	e9 08 c8 ff ff       	jmp    52a134 <___bpf_prog_run+0x2b44>
633c   52d92c:	e8 00 00 00 00       	call   52d931 <___bpf_prog_run+0x6341>	52d92d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6341   52d931:	e9 8a c7 ff ff       	jmp    52a0c0 <___bpf_prog_run+0x2ad0>
6346   52d936:	e8 00 00 00 00       	call   52d93b <___bpf_prog_run+0x634b>	52d937: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
634b   52d93b:	e9 0a c7 ff ff       	jmp    52a04a <___bpf_prog_run+0x2a5a>
6350   52d940:	e8 00 00 00 00       	call   52d945 <___bpf_prog_run+0x6355>	52d941: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6355   52d945:	e9 8a c6 ff ff       	jmp    529fd4 <___bpf_prog_run+0x29e4>
635a   52d94a:	e8 00 00 00 00       	call   52d94f <___bpf_prog_run+0x635f>	52d94b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
635f   52d94f:	e9 09 c6 ff ff       	jmp    529f5d <___bpf_prog_run+0x296d>
6364   52d954:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6368   52d958:	e8 00 00 00 00       	call   52d95d <___bpf_prog_run+0x636d>	52d959: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
636d   52d95d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6371   52d961:	e9 7f c5 ff ff       	jmp    529ee5 <___bpf_prog_run+0x28f5>
6376   52d966:	e8 00 00 00 00       	call   52d96b <___bpf_prog_run+0x637b>	52d967: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
637b   52d96b:	e9 d3 c4 ff ff       	jmp    529e43 <___bpf_prog_run+0x2853>
6380   52d970:	e8 00 00 00 00       	call   52d975 <___bpf_prog_run+0x6385>	52d971: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6385   52d975:	e9 53 c4 ff ff       	jmp    529dcd <___bpf_prog_run+0x27dd>
638a   52d97a:	4c 89 c7             	mov    %r8,%rdi
638d   52d97d:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6391   52d981:	e8 00 00 00 00       	call   52d986 <___bpf_prog_run+0x6396>	52d982: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6396   52d986:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
639a   52d98a:	e9 ab c3 ff ff       	jmp    529d3a <___bpf_prog_run+0x274a>
639f   52d98f:	e8 00 00 00 00       	call   52d994 <___bpf_prog_run+0x63a4>	52d990: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63a4   52d994:	e9 02 c3 ff ff       	jmp    529c9b <___bpf_prog_run+0x26ab>
63a9   52d999:	e8 00 00 00 00       	call   52d99e <___bpf_prog_run+0x63ae>	52d99a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63ae   52d99e:	e9 50 c2 ff ff       	jmp    529bf3 <___bpf_prog_run+0x2603>
63b3   52d9a3:	e8 00 00 00 00       	call   52d9a8 <___bpf_prog_run+0x63b8>	52d9a4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63b8   52d9a8:	e9 9e c1 ff ff       	jmp    529b4b <___bpf_prog_run+0x255b>
63bd   52d9ad:	e8 00 00 00 00       	call   52d9b2 <___bpf_prog_run+0x63c2>	52d9ae: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63c2   52d9b2:	e9 ec c0 ff ff       	jmp    529aa3 <___bpf_prog_run+0x24b3>
63c7   52d9b7:	e8 00 00 00 00       	call   52d9bc <___bpf_prog_run+0x63cc>	52d9b8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63cc   52d9bc:	e9 3a c0 ff ff       	jmp    5299fb <___bpf_prog_run+0x240b>
63d1   52d9c1:	e8 00 00 00 00       	call   52d9c6 <___bpf_prog_run+0x63d6>	52d9c2: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63d6   52d9c6:	e9 88 bf ff ff       	jmp    529953 <___bpf_prog_run+0x2363>
63db   52d9cb:	e8 00 00 00 00       	call   52d9d0 <___bpf_prog_run+0x63e0>	52d9cc: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63e0   52d9d0:	e9 d6 be ff ff       	jmp    5298ab <___bpf_prog_run+0x22bb>
63e5   52d9d5:	e8 00 00 00 00       	call   52d9da <___bpf_prog_run+0x63ea>	52d9d6: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63ea   52d9da:	e9 24 be ff ff       	jmp    529803 <___bpf_prog_run+0x2213>
63ef   52d9df:	e8 00 00 00 00       	call   52d9e4 <___bpf_prog_run+0x63f4>	52d9e0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63f4   52d9e4:	e9 72 bd ff ff       	jmp    52975b <___bpf_prog_run+0x216b>
63f9   52d9e9:	e8 00 00 00 00       	call   52d9ee <___bpf_prog_run+0x63fe>	52d9ea: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63fe   52d9ee:	e9 c9 bc ff ff       	jmp    5296bc <___bpf_prog_run+0x20cc>
6403   52d9f3:	e8 00 00 00 00       	call   52d9f8 <___bpf_prog_run+0x6408>	52d9f4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6408   52d9f8:	e9 20 bc ff ff       	jmp    52961d <___bpf_prog_run+0x202d>
640d   52d9fd:	e8 00 00 00 00       	call   52da02 <___bpf_prog_run+0x6412>	52d9fe: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6412   52da02:	e9 77 bb ff ff       	jmp    52957e <___bpf_prog_run+0x1f8e>
6417   52da07:	e8 00 00 00 00       	call   52da0c <___bpf_prog_run+0x641c>	52da08: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
641c   52da0c:	e9 ce ba ff ff       	jmp    5294df <___bpf_prog_run+0x1eef>
6421   52da11:	e8 00 00 00 00       	call   52da16 <___bpf_prog_run+0x6426>	52da12: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6426   52da16:	e9 25 ba ff ff       	jmp    529440 <___bpf_prog_run+0x1e50>
642b   52da1b:	e8 00 00 00 00       	call   52da20 <___bpf_prog_run+0x6430>	52da1c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6430   52da20:	e9 7c b9 ff ff       	jmp    5293a1 <___bpf_prog_run+0x1db1>
6435   52da25:	e8 00 00 00 00       	call   52da2a <___bpf_prog_run+0x643a>	52da26: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
643a   52da2a:	e9 d3 b8 ff ff       	jmp    529302 <___bpf_prog_run+0x1d12>
643f   52da2f:	e8 00 00 00 00       	call   52da34 <___bpf_prog_run+0x6444>	52da30: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6444   52da34:	e9 2a b8 ff ff       	jmp    529263 <___bpf_prog_run+0x1c73>
6449   52da39:	e8 00 00 00 00       	call   52da3e <___bpf_prog_run+0x644e>	52da3a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
644e   52da3e:	e9 7b b7 ff ff       	jmp    5291be <___bpf_prog_run+0x1bce>
6453   52da43:	e8 00 00 00 00       	call   52da48 <___bpf_prog_run+0x6458>	52da44: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6458   52da48:	e9 cc b6 ff ff       	jmp    529119 <___bpf_prog_run+0x1b29>
645d   52da4d:	e8 00 00 00 00       	call   52da52 <___bpf_prog_run+0x6462>	52da4e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6462   52da52:	e9 1d b6 ff ff       	jmp    529074 <___bpf_prog_run+0x1a84>
6467   52da57:	e8 00 00 00 00       	call   52da5c <___bpf_prog_run+0x646c>	52da58: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
646c   52da5c:	e9 6e b5 ff ff       	jmp    528fcf <___bpf_prog_run+0x19df>
6471   52da61:	e8 00 00 00 00       	call   52da66 <___bpf_prog_run+0x6476>	52da62: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6476   52da66:	e9 bf b4 ff ff       	jmp    528f2a <___bpf_prog_run+0x193a>
647b   52da6b:	e8 00 00 00 00       	call   52da70 <___bpf_prog_run+0x6480>	52da6c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6480   52da70:	e9 10 b4 ff ff       	jmp    528e85 <___bpf_prog_run+0x1895>
6485   52da75:	e8 00 00 00 00       	call   52da7a <___bpf_prog_run+0x648a>	52da76: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
648a   52da7a:	e9 61 b3 ff ff       	jmp    528de0 <___bpf_prog_run+0x17f0>
648f   52da7f:	e8 00 00 00 00       	call   52da84 <___bpf_prog_run+0x6494>	52da80: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6494   52da84:	e9 b2 b2 ff ff       	jmp    528d3b <___bpf_prog_run+0x174b>
6499   52da89:	e8 00 00 00 00       	call   52da8e <___bpf_prog_run+0x649e>	52da8a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
649e   52da8e:	e9 09 b2 ff ff       	jmp    528c9c <___bpf_prog_run+0x16ac>
64a3   52da93:	e8 00 00 00 00       	call   52da98 <___bpf_prog_run+0x64a8>	52da94: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64a8   52da98:	e9 60 b1 ff ff       	jmp    528bfd <___bpf_prog_run+0x160d>
64ad   52da9d:	e8 00 00 00 00       	call   52daa2 <___bpf_prog_run+0x64b2>	52da9e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64b2   52daa2:	e9 b7 b0 ff ff       	jmp    528b5e <___bpf_prog_run+0x156e>
64b7   52daa7:	e8 00 00 00 00       	call   52daac <___bpf_prog_run+0x64bc>	52daa8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64bc   52daac:	e9 0e b0 ff ff       	jmp    528abf <___bpf_prog_run+0x14cf>
64c1   52dab1:	e8 00 00 00 00       	call   52dab6 <___bpf_prog_run+0x64c6>	52dab2: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64c6   52dab6:	e9 65 af ff ff       	jmp    528a20 <___bpf_prog_run+0x1430>
64cb   52dabb:	e8 00 00 00 00       	call   52dac0 <___bpf_prog_run+0x64d0>	52dabc: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64d0   52dac0:	e9 bc ae ff ff       	jmp    528981 <___bpf_prog_run+0x1391>
64d5   52dac5:	e8 00 00 00 00       	call   52daca <___bpf_prog_run+0x64da>	52dac6: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64da   52daca:	e9 13 ae ff ff       	jmp    5288e2 <___bpf_prog_run+0x12f2>
64df   52dacf:	e8 00 00 00 00       	call   52dad4 <___bpf_prog_run+0x64e4>	52dad0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64e4   52dad4:	e9 6a ad ff ff       	jmp    528843 <___bpf_prog_run+0x1253>
64e9   52dad9:	e8 00 00 00 00       	call   52dade <___bpf_prog_run+0x64ee>	52dada: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64ee   52dade:	e9 b8 ac ff ff       	jmp    52879b <___bpf_prog_run+0x11ab>
64f3   52dae3:	e8 00 00 00 00       	call   52dae8 <___bpf_prog_run+0x64f8>	52dae4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64f8   52dae8:	e9 06 ac ff ff       	jmp    5286f3 <___bpf_prog_run+0x1103>
64fd   52daed:	e8 00 00 00 00       	call   52daf2 <___bpf_prog_run+0x6502>	52daee: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6502   52daf2:	e9 3a ab ff ff       	jmp    528631 <___bpf_prog_run+0x1041>
6507   52daf7:	e8 00 00 00 00       	call   52dafc <___bpf_prog_run+0x650c>	52daf8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
650c   52dafc:	e9 8e aa ff ff       	jmp    52858f <___bpf_prog_run+0xf9f>
6511   52db01:	e8 00 00 00 00       	call   52db06 <___bpf_prog_run+0x6516>	52db02: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6516   52db06:	e9 c6 a9 ff ff       	jmp    5284d1 <___bpf_prog_run+0xee1>
651b   52db0b:	4c 89 ff             	mov    %r15,%rdi
651e   52db0e:	e8 00 00 00 00       	call   52db13 <___bpf_prog_run+0x6523>	52db0f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6523   52db13:	e9 ce a8 ff ff       	jmp    5283e6 <___bpf_prog_run+0xdf6>
6528   52db18:	4c 89 ff             	mov    %r15,%rdi
652b   52db1b:	e8 00 00 00 00       	call   52db20 <___bpf_prog_run+0x6530>	52db1c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6530   52db20:	e9 cb a7 ff ff       	jmp    5282f0 <___bpf_prog_run+0xd00>
6535   52db25:	e8 00 00 00 00       	call   52db2a <___bpf_prog_run+0x653a>	52db26: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
653a   52db2a:	e9 1c a7 ff ff       	jmp    52824b <___bpf_prog_run+0xc5b>
653f   52db2f:	e8 00 00 00 00       	call   52db34 <___bpf_prog_run+0x6544>	52db30: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6544   52db34:	e9 55 a6 ff ff       	jmp    52818e <___bpf_prog_run+0xb9e>
6549   52db39:	e8 00 00 00 00       	call   52db3e <___bpf_prog_run+0x654e>	52db3a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
654e   52db3e:	e9 a6 a5 ff ff       	jmp    5280e9 <___bpf_prog_run+0xaf9>
6553   52db43:	e8 00 00 00 00       	call   52db48 <___bpf_prog_run+0x6558>	52db44: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6558   52db48:	e9 dc a4 ff ff       	jmp    528029 <___bpf_prog_run+0xa39>
655d   52db4d:	e8 00 00 00 00       	call   52db52 <___bpf_prog_run+0x6562>	52db4e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6562   52db52:	e9 33 a4 ff ff       	jmp    527f8a <___bpf_prog_run+0x99a>
6567   52db57:	e8 00 00 00 00       	call   52db5c <___bpf_prog_run+0x656c>	52db58: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
656c   52db5c:	e9 69 a3 ff ff       	jmp    527eca <___bpf_prog_run+0x8da>
6571   52db61:	e8 00 00 00 00       	call   52db66 <___bpf_prog_run+0x6576>	52db62: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6576   52db66:	e9 a3 a2 ff ff       	jmp    527e0e <___bpf_prog_run+0x81e>
657b   52db6b:	e8 00 00 00 00       	call   52db70 <___bpf_prog_run+0x6580>	52db6c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6580   52db70:	e9 da a1 ff ff       	jmp    527d4f <___bpf_prog_run+0x75f>
6585   52db75:	e8 00 00 00 00       	call   52db7a <___bpf_prog_run+0x658a>	52db76: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
658a   52db7a:	e9 0f a1 ff ff       	jmp    527c8e <___bpf_prog_run+0x69e>
658f   52db7f:	4c 89 ff             	mov    %r15,%rdi
6592   52db82:	e8 00 00 00 00       	call   52db87 <___bpf_prog_run+0x6597>	52db83: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6597   52db87:	e9 16 a0 ff ff       	jmp    527ba2 <___bpf_prog_run+0x5b2>
659c   52db8c:	e8 00 00 00 00       	call   52db91 <___bpf_prog_run+0x65a1>	52db8d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
65a1   52db91:	e9 4d 9f ff ff       	jmp    527ae3 <___bpf_prog_run+0x4f3>
65a6   52db96:	e8 00 00 00 00       	call   52db9b <___bpf_prog_run+0x65ab>	52db97: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
65ab   52db9b:	e9 b3 9e ff ff       	jmp    527a53 <___bpf_prog_run+0x463>
65b0   52dba0:	e8 00 00 00 00       	call   52dba5 <___bpf_prog_run+0x65b5>	52dba1: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
65b5   52dba5:	e9 fb 9d ff ff       	jmp    5279a5 <___bpf_prog_run+0x3b5>
65ba   52dbaa:	e8 00 00 00 00       	call   52dbaf <___bpf_prog_run+0x65bf>	52dbab: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
65bf   52dbaf:	e9 3e 9d ff ff       	jmp    5278f2 <___bpf_prog_run+0x302>
65c4   52dbb4:	e8 00 00 00 00       	call   52dbb9 <___bpf_prog_run+0x65c9>	52dbb5: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
65c9   52dbb9:	e9 4b c1 ff ff       	jmp    529d09 <___bpf_prog_run+0x2719>
65ce   52dbbe:	e8 00 00 00 00       	call   52dbc3 <___bpf_prog_run+0x65d3>	52dbbf: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
65d3   52dbc3:	e9 39 d3 ff ff       	jmp    52af01 <___bpf_prog_run+0x3911>
65d8   52dbc8:	4c 89 ff             	mov    %r15,%rdi
65db   52dbcb:	e8 00 00 00 00       	call   52dbd0 <___bpf_prog_run+0x65e0>	52dbcc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
65e0   52dbd0:	e9 7b e9 ff ff       	jmp    52c550 <___bpf_prog_run+0x4f60>
65e5   52dbd5:	4c 89 ff             	mov    %r15,%rdi
65e8   52dbd8:	e8 00 00 00 00       	call   52dbdd <___bpf_prog_run+0x65ed>	52dbd9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
65ed   52dbdd:	e9 0d ea ff ff       	jmp    52c5ef <___bpf_prog_run+0x4fff>
65f2   52dbe2:	48 89 c7             	mov    %rax,%rdi
65f5   52dbe5:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
65f9   52dbe9:	e8 00 00 00 00       	call   52dbee <___bpf_prog_run+0x65fe>	52dbea: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
65fe   52dbee:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6602   52dbf2:	e9 ef d9 ff ff       	jmp    52b5e6 <___bpf_prog_run+0x3ff6>
6607   52dbf7:	4c 89 ff             	mov    %r15,%rdi
660a   52dbfa:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
660e   52dbfe:	e8 00 00 00 00       	call   52dc03 <___bpf_prog_run+0x6613>	52dbff: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6613   52dc03:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6617   52dc07:	e9 50 cf ff ff       	jmp    52ab5c <___bpf_prog_run+0x356c>
661c   52dc0c:	4c 89 ff             	mov    %r15,%rdi
661f   52dc0f:	e8 00 00 00 00       	call   52dc14 <___bpf_prog_run+0x6624>	52dc10: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6624   52dc14:	e9 20 cf ff ff       	jmp    52ab39 <___bpf_prog_run+0x3549>
6629   52dc19:	4c 89 ff             	mov    %r15,%rdi
662c   52dc1c:	e8 00 00 00 00       	call   52dc21 <___bpf_prog_run+0x6631>	52dc1d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6631   52dc21:	e9 17 c8 ff ff       	jmp    52a43d <___bpf_prog_run+0x2e4d>
6636   52dc26:	4c 89 ff             	mov    %r15,%rdi
6639   52dc29:	e8 00 00 00 00       	call   52dc2e <___bpf_prog_run+0x663e>	52dc2a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
663e   52dc2e:	e9 dd bf ff ff       	jmp    529c10 <___bpf_prog_run+0x2620>
6643   52dc33:	48 89 c7             	mov    %rax,%rdi
6646   52dc36:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
664a   52dc3a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
664e   52dc3e:	e8 00 00 00 00       	call   52dc43 <___bpf_prog_run+0x6653>	52dc3f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6653   52dc43:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6657   52dc47:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
665b   52dc4b:	e9 4d cc ff ff       	jmp    52a89d <___bpf_prog_run+0x32ad>
6660   52dc50:	4c 89 ff             	mov    %r15,%rdi
6663   52dc53:	e8 00 00 00 00       	call   52dc58 <___bpf_prog_run+0x6668>	52dc54: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6668   52dc58:	e9 1d cc ff ff       	jmp    52a87a <___bpf_prog_run+0x328a>
666d   52dc5d:	48 89 c7             	mov    %rax,%rdi
6670   52dc60:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6674   52dc64:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6678   52dc68:	e8 00 00 00 00       	call   52dc6d <___bpf_prog_run+0x667d>	52dc69: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
667d   52dc6d:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6681   52dc71:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6685   52dc75:	e9 e7 d1 ff ff       	jmp    52ae61 <___bpf_prog_run+0x3871>
668a   52dc7a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
668e   52dc7e:	e8 00 00 00 00       	call   52dc83 <___bpf_prog_run+0x6693>	52dc7f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6693   52dc83:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6697   52dc87:	e9 30 c2 ff ff       	jmp    529ebc <___bpf_prog_run+0x28cc>
669c   52dc8c:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
66a0   52dc90:	e8 00 00 00 00       	call   52dc95 <___bpf_prog_run+0x66a5>	52dc91: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
66a5   52dc95:	e9 08 c2 ff ff       	jmp    529ea2 <___bpf_prog_run+0x28b2>
66aa   52dc9a:	4c 89 ff             	mov    %r15,%rdi
66ad   52dc9d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
66b1   52dca1:	e8 00 00 00 00       	call   52dca6 <___bpf_prog_run+0x66b6>	52dca2: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
66b6   52dca6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
66ba   52dcaa:	e9 ae 9f ff ff       	jmp    527c5d <___bpf_prog_run+0x66d>
66bf   52dcaf:	4c 89 ff             	mov    %r15,%rdi
66c2   52dcb2:	e8 00 00 00 00       	call   52dcb7 <___bpf_prog_run+0x66c7>	52dcb3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
66c7   52dcb7:	e9 37 d1 ff ff       	jmp    52adf3 <___bpf_prog_run+0x3803>
66cc   52dcbc:	e8 00 00 00 00       	call   52dcc1 <___bpf_prog_run+0x66d1>	52dcbd: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
66d1   52dcc1:	e9 6c b5 ff ff       	jmp    529232 <___bpf_prog_run+0x1c42>
66d6   52dcc6:	e8 00 00 00 00       	call   52dccb <___bpf_prog_run+0x66db>	52dcc7: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
66db   52dccb:	e9 9a bf ff ff       	jmp    529c6a <___bpf_prog_run+0x267a>
66e0   52dcd0:	4c 89 ff             	mov    %r15,%rdi
66e3   52dcd3:	e8 00 00 00 00       	call   52dcd8 <___bpf_prog_run+0x66e8>	52dcd4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
66e8   52dcd8:	e9 c5 e8 ff ff       	jmp    52c5a2 <___bpf_prog_run+0x4fb2>
66ed   52dcdd:	e8 00 00 00 00       	call   52dce2 <___bpf_prog_run+0x66f2>	52dcde: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
66f2   52dce2:	e9 58 9b ff ff       	jmp    52783f <___bpf_prog_run+0x24f>
66f7   52dce7:	4c 89 ff             	mov    %r15,%rdi
66fa   52dcea:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
66fe   52dcee:	e8 00 00 00 00       	call   52dcf3 <___bpf_prog_run+0x6703>	52dcef: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6703   52dcf3:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6707   52dcf7:	e9 11 c1 ff ff       	jmp    529e0d <___bpf_prog_run+0x281d>
670c   52dcfc:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6710   52dd00:	e8 00 00 00 00       	call   52dd05 <___bpf_prog_run+0x6715>	52dd01: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6715   52dd05:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6719   52dd09:	e9 d4 d2 ff ff       	jmp    52afe2 <___bpf_prog_run+0x39f2>
671e   52dd0e:	4c 89 ff             	mov    %r15,%rdi
6721   52dd11:	e8 00 00 00 00       	call   52dd16 <___bpf_prog_run+0x6726>	52dd12: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6726   52dd16:	e9 e2 b0 ff ff       	jmp    528dfd <___bpf_prog_run+0x180d>
672b   52dd1b:	4c 89 f7             	mov    %r14,%rdi
672e   52dd1e:	e8 00 00 00 00       	call   52dd23 <___bpf_prog_run+0x6733>	52dd1f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6733   52dd23:	e9 80 d4 ff ff       	jmp    52b1a8 <___bpf_prog_run+0x3bb8>
6738   52dd28:	4c 89 ff             	mov    %r15,%rdi
673b   52dd2b:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
673f   52dd2f:	e8 00 00 00 00       	call   52dd34 <___bpf_prog_run+0x6744>	52dd30: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6744   52dd34:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6748   52dd38:	e9 d1 cc ff ff       	jmp    52aa0e <___bpf_prog_run+0x341e>
674d   52dd3d:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6751   52dd41:	e8 00 00 00 00       	call   52dd46 <___bpf_prog_run+0x6756>	52dd42: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6756   52dd46:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
675a   52dd4a:	e9 9a c9 ff ff       	jmp    52a6e9 <___bpf_prog_run+0x30f9>
675f   52dd4f:	e8 00 00 00 00       	call   52dd54 <___bpf_prog_run+0x6764>	52dd50: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6764   52dd54:	e9 76 c9 ff ff       	jmp    52a6cf <___bpf_prog_run+0x30df>
6769   52dd59:	48 89 c7             	mov    %rax,%rdi
676c   52dd5c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6770   52dd60:	e8 00 00 00 00       	call   52dd65 <___bpf_prog_run+0x6775>	52dd61: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6775   52dd65:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6779   52dd69:	e9 7d de ff ff       	jmp    52bbeb <___bpf_prog_run+0x45fb>
677e   52dd6e:	48 89 c7             	mov    %rax,%rdi
6781   52dd71:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6785   52dd75:	e8 00 00 00 00       	call   52dd7a <___bpf_prog_run+0x678a>	52dd76: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
678a   52dd7a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
678e   52dd7e:	e9 3a de ff ff       	jmp    52bbbd <___bpf_prog_run+0x45cd>
6793   52dd83:	e8 00 00 00 00       	call   52dd88 <___bpf_prog_run+0x6798>	52dd84: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6798   52dd88:	e9 0c de ff ff       	jmp    52bb99 <___bpf_prog_run+0x45a9>
679d   52dd8d:	4c 89 ff             	mov    %r15,%rdi
67a0   52dd90:	e8 00 00 00 00       	call   52dd95 <___bpf_prog_run+0x67a5>	52dd91: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67a5   52dd95:	e9 e6 dd ff ff       	jmp    52bb80 <___bpf_prog_run+0x4590>
67aa   52dd9a:	4c 89 ff             	mov    %r15,%rdi
67ad   52dd9d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
67b1   52dda1:	e8 00 00 00 00       	call   52dda6 <___bpf_prog_run+0x67b6>	52dda2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67b6   52dda6:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
67ba   52ddaa:	e9 ef ad ff ff       	jmp    528b9e <___bpf_prog_run+0x15ae>
67bf   52ddaf:	4c 89 ff             	mov    %r15,%rdi
67c2   52ddb2:	e8 00 00 00 00       	call   52ddb7 <___bpf_prog_run+0x67c7>	52ddb3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67c7   52ddb7:	e9 bf ad ff ff       	jmp    528b7b <___bpf_prog_run+0x158b>
67cc   52ddbc:	4c 89 ff             	mov    %r15,%rdi
67cf   52ddbf:	e8 00 00 00 00       	call   52ddc4 <___bpf_prog_run+0x67d4>	52ddc0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67d4   52ddc4:	e9 c8 b2 ff ff       	jmp    529091 <___bpf_prog_run+0x1aa1>
67d9   52ddc9:	4c 89 ff             	mov    %r15,%rdi
67dc   52ddcc:	e8 00 00 00 00       	call   52ddd1 <___bpf_prog_run+0x67e1>	52ddcd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67e1   52ddd1:	e9 4a ba ff ff       	jmp    529820 <___bpf_prog_run+0x2230>
67e6   52ddd6:	4c 89 ff             	mov    %r15,%rdi
67e9   52ddd9:	e8 00 00 00 00       	call   52ddde <___bpf_prog_run+0x67ee>	52ddda: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67ee   52ddde:	e9 75 af ff ff       	jmp    528d58 <___bpf_prog_run+0x1768>
67f3   52dde3:	4c 89 ff             	mov    %r15,%rdi
67f6   52dde6:	e8 00 00 00 00       	call   52ddeb <___bpf_prog_run+0x67fb>	52dde7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67fb   52ddeb:	e9 d0 bc ff ff       	jmp    529ac0 <___bpf_prog_run+0x24d0>
6800   52ddf0:	4c 89 ff             	mov    %r15,%rdi
6803   52ddf3:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6807   52ddf7:	e8 00 00 00 00       	call   52ddfc <___bpf_prog_run+0x680c>	52ddf8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
680c   52ddfc:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6810   52de00:	e9 b9 b7 ff ff       	jmp    5295be <___bpf_prog_run+0x1fce>
6815   52de05:	4c 89 ff             	mov    %r15,%rdi
6818   52de08:	e8 00 00 00 00       	call   52de0d <___bpf_prog_run+0x681d>	52de09: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
681d   52de0d:	e9 89 b7 ff ff       	jmp    52959b <___bpf_prog_run+0x1fab>
6822   52de12:	4c 89 ff             	mov    %r15,%rdi
6825   52de15:	e8 00 00 00 00       	call   52de1a <___bpf_prog_run+0x682a>	52de16: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
682a   52de1a:	e9 59 cf ff ff       	jmp    52ad78 <___bpf_prog_run+0x3788>
682f   52de1f:	4c 89 ff             	mov    %r15,%rdi
6832   52de22:	e8 00 00 00 00       	call   52de27 <___bpf_prog_run+0x6837>	52de23: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6837   52de27:	e9 05 d8 ff ff       	jmp    52b631 <___bpf_prog_run+0x4041>
683c   52de2c:	48 89 c7             	mov    %rax,%rdi
683f   52de2f:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6843   52de33:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6847   52de37:	e8 00 00 00 00       	call   52de3c <___bpf_prog_run+0x684c>	52de38: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
684c   52de3c:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6850   52de40:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6854   52de44:	e9 b6 db ff ff       	jmp    52b9ff <___bpf_prog_run+0x440f>
6859   52de49:	4c 89 ff             	mov    %r15,%rdi
685c   52de4c:	e8 00 00 00 00       	call   52de51 <___bpf_prog_run+0x6861>	52de4d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6861   52de51:	e9 86 db ff ff       	jmp    52b9dc <___bpf_prog_run+0x43ec>
6866   52de56:	48 89 c7             	mov    %rax,%rdi
6869   52de59:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
686d   52de5d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6871   52de61:	e8 00 00 00 00       	call   52de66 <___bpf_prog_run+0x6876>	52de62: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6876   52de66:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
687a   52de6a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
687e   52de6e:	e9 a6 d5 ff ff       	jmp    52b419 <___bpf_prog_run+0x3e29>
6883   52de73:	4c 89 ff             	mov    %r15,%rdi
6886   52de76:	e8 00 00 00 00       	call   52de7b <___bpf_prog_run+0x688b>	52de77: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
688b   52de7b:	e9 76 d5 ff ff       	jmp    52b3f6 <___bpf_prog_run+0x3e06>
6890   52de80:	4c 89 ff             	mov    %r15,%rdi
6893   52de83:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6897   52de87:	e8 00 00 00 00       	call   52de8c <___bpf_prog_run+0x689c>	52de88: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
689c   52de8c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
68a0   52de90:	e9 04 c3 ff ff       	jmp    52a199 <___bpf_prog_run+0x2ba9>
68a5   52de95:	4c 89 ff             	mov    %r15,%rdi
68a8   52de98:	e8 00 00 00 00       	call   52de9d <___bpf_prog_run+0x68ad>	52de99: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
68ad   52de9d:	e9 b1 c4 ff ff       	jmp    52a353 <___bpf_prog_run+0x2d63>
68b2   52dea2:	4c 89 ff             	mov    %r15,%rdi
68b5   52dea5:	e8 00 00 00 00       	call   52deaa <___bpf_prog_run+0x68ba>	52dea6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
68ba   52deaa:	e9 cb c0 ff ff       	jmp    529f7a <___bpf_prog_run+0x298a>
68bf   52deaf:	48 89 c7             	mov    %rax,%rdi
68c2   52deb2:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
68c6   52deb6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
68ca   52deba:	e8 00 00 00 00       	call   52debf <___bpf_prog_run+0x68cf>	52debb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
68cf   52debf:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
68d3   52dec3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
68d7   52dec7:	e9 fe cc ff ff       	jmp    52abca <___bpf_prog_run+0x35da>
68dc   52decc:	4c 89 ff             	mov    %r15,%rdi
68df   52decf:	e8 00 00 00 00       	call   52ded4 <___bpf_prog_run+0x68e4>	52ded0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
68e4   52ded4:	e9 ce cc ff ff       	jmp    52aba7 <___bpf_prog_run+0x35b7>
68e9   52ded9:	48 89 c7             	mov    %rax,%rdi
68ec   52dedc:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
68f0   52dee0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
68f4   52dee4:	e8 00 00 00 00       	call   52dee9 <___bpf_prog_run+0x68f9>	52dee5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
68f9   52dee9:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
68fd   52deed:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6901   52def1:	e9 c0 c8 ff ff       	jmp    52a7b6 <___bpf_prog_run+0x31c6>
6906   52def6:	4c 89 ff             	mov    %r15,%rdi
6909   52def9:	e8 00 00 00 00       	call   52defe <___bpf_prog_run+0x690e>	52defa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
690e   52defe:	e9 90 c8 ff ff       	jmp    52a793 <___bpf_prog_run+0x31a3>
6913   52df03:	48 89 c7             	mov    %rax,%rdi
6916   52df06:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
691a   52df0a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
691e   52df0e:	e8 00 00 00 00       	call   52df13 <___bpf_prog_run+0x6923>	52df0f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6923   52df13:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6927   52df17:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
692b   52df1b:	e9 f6 d2 ff ff       	jmp    52b216 <___bpf_prog_run+0x3c26>
6930   52df20:	4c 89 ff             	mov    %r15,%rdi
6933   52df23:	e8 00 00 00 00       	call   52df28 <___bpf_prog_run+0x6938>	52df24: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6938   52df28:	e9 c6 d2 ff ff       	jmp    52b1f3 <___bpf_prog_run+0x3c03>
693d   52df2d:	4c 89 ff             	mov    %r15,%rdi
6940   52df30:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6944   52df34:	e8 00 00 00 00       	call   52df39 <___bpf_prog_run+0x6949>	52df35: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6949   52df39:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
694d   52df3d:	e9 91 cf ff ff       	jmp    52aed3 <___bpf_prog_run+0x38e3>
6952   52df42:	4c 89 ff             	mov    %r15,%rdi
6955   52df45:	e8 00 00 00 00       	call   52df4a <___bpf_prog_run+0x695a>	52df46: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
695a   52df4a:	e9 61 cf ff ff       	jmp    52aeb0 <___bpf_prog_run+0x38c0>
695f   52df4f:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
6963   52df53:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
6967   52df57:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
696b   52df5b:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
696f   52df5f:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
6973   52df63:	e8 00 00 00 00       	call   52df68 <___bpf_prog_run+0x6978>	52df64: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6978   52df68:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
697c   52df6c:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
6980   52df70:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
6984   52df74:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
6988   52df78:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
698c   52df7c:	e9 0b d2 ff ff       	jmp    52b18c <___bpf_prog_run+0x3b9c>
6991   52df81:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
6995   52df85:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
6999   52df89:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
699d   52df8d:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
69a1   52df91:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
69a5   52df95:	e8 00 00 00 00       	call   52df9a <___bpf_prog_run+0x69aa>	52df96: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
69aa   52df9a:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
69ae   52df9e:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
69b2   52dfa2:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
69b6   52dfa6:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
69ba   52dfaa:	e9 c3 d1 ff ff       	jmp    52b172 <___bpf_prog_run+0x3b82>
69bf   52dfaf:	48 89 d7             	mov    %rdx,%rdi
69c2   52dfb2:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
69c6   52dfb6:	e8 00 00 00 00       	call   52dfbb <___bpf_prog_run+0x69cb>	52dfb7: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
69cb   52dfbb:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
69cf   52dfbf:	e9 f9 d2 ff ff       	jmp    52b2bd <___bpf_prog_run+0x3ccd>
69d4   52dfc4:	4c 89 ff             	mov    %r15,%rdi
69d7   52dfc7:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
69db   52dfcb:	e8 00 00 00 00       	call   52dfd0 <___bpf_prog_run+0x69e0>	52dfcc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
69e0   52dfd0:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
69e4   52dfd4:	e9 3e c0 ff ff       	jmp    52a017 <___bpf_prog_run+0x2a27>
69e9   52dfd9:	4c 89 ff             	mov    %r15,%rdi
69ec   52dfdc:	e8 00 00 00 00       	call   52dfe1 <___bpf_prog_run+0x69f1>	52dfdd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
69f1   52dfe1:	e9 0e c0 ff ff       	jmp    529ff4 <___bpf_prog_run+0x2a04>
69f6   52dfe6:	4c 89 ff             	mov    %r15,%rdi
69f9   52dfe9:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
69fd   52dfed:	e8 00 00 00 00       	call   52dff2 <___bpf_prog_run+0x6a02>	52dfee: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6a02   52dff2:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6a06   52dff6:	e9 e2 d8 ff ff       	jmp    52b8dd <___bpf_prog_run+0x42ed>
6a0b   52dffb:	4c 89 ff             	mov    %r15,%rdi
6a0e   52dffe:	e8 00 00 00 00       	call   52e003 <___bpf_prog_run+0x6a13>	52dfff: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6a13   52e003:	e9 6b 9a ff ff       	jmp    527a73 <___bpf_prog_run+0x483>
6a18   52e008:	48 89 c7             	mov    %rax,%rdi
6a1b   52e00b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6a1f   52e00f:	e8 00 00 00 00       	call   52e014 <___bpf_prog_run+0x6a24>	52e010: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6a24   52e014:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6a28   52e018:	e9 57 9b ff ff       	jmp    527b74 <___bpf_prog_run+0x584>
6a2d   52e01d:	4c 89 ff             	mov    %r15,%rdi
6a30   52e020:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6a34   52e024:	e8 00 00 00 00       	call   52e029 <___bpf_prog_run+0x6a39>	52e025: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6a39   52e029:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6a3d   52e02d:	e9 f3 cc ff ff       	jmp    52ad25 <___bpf_prog_run+0x3735>
6a42   52e032:	48 89 c7             	mov    %rax,%rdi
6a45   52e035:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6a49   52e039:	e8 00 00 00 00       	call   52e03e <___bpf_prog_run+0x6a4e>	52e03a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6a4e   52e03e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6a52   52e042:	e9 7b 9b ff ff       	jmp    527bc2 <___bpf_prog_run+0x5d2>
6a57   52e047:	4c 89 f7             	mov    %r14,%rdi
6a5a   52e04a:	e8 00 00 00 00       	call   52e04f <___bpf_prog_run+0x6a5f>	52e04b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6a5f   52e04f:	e9 f4 c6 ff ff       	jmp    52a748 <___bpf_prog_run+0x3158>
6a64   52e054:	48 89 75 a8          	mov    %rsi,-0x58(%rbp)
6a68   52e058:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
6a6c   52e05c:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
6a70   52e060:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6a74   52e064:	e8 00 00 00 00       	call   52e069 <___bpf_prog_run+0x6a79>	52e065: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6a79   52e069:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
6a7d   52e06d:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
6a81   52e071:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
6a85   52e075:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6a89   52e079:	e9 ae c6 ff ff       	jmp    52a72c <___bpf_prog_run+0x313c>
6a8e   52e07e:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
6a92   52e082:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
6a96   52e086:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
6a9a   52e08a:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6a9e   52e08e:	e8 00 00 00 00       	call   52e093 <___bpf_prog_run+0x6aa3>	52e08f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6aa3   52e093:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
6aa7   52e097:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
6aab   52e09b:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6aaf   52e09f:	e9 6e c6 ff ff       	jmp    52a712 <___bpf_prog_run+0x3122>
6ab4   52e0a4:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
6ab8   52e0a8:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6abc   52e0ac:	e8 00 00 00 00       	call   52e0b1 <___bpf_prog_run+0x6ac1>	52e0ad: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ac1   52e0b1:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
6ac5   52e0b5:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6ac9   52e0b9:	e9 45 c6 ff ff       	jmp    52a703 <___bpf_prog_run+0x3113>
6ace   52e0be:	4c 89 ff             	mov    %r15,%rdi
6ad1   52e0c1:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6ad5   52e0c5:	e8 00 00 00 00       	call   52e0ca <___bpf_prog_run+0x6ada>	52e0c6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ada   52e0ca:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6ade   52e0ce:	e9 08 bc ff ff       	jmp    529cdb <___bpf_prog_run+0x26eb>
6ae3   52e0d3:	4c 89 ff             	mov    %r15,%rdi
6ae6   52e0d6:	e8 00 00 00 00       	call   52e0db <___bpf_prog_run+0x6aeb>	52e0d7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6aeb   52e0db:	e9 c0 c8 ff ff       	jmp    52a9a0 <___bpf_prog_run+0x33b0>
6af0   52e0e0:	4c 89 ff             	mov    %r15,%rdi
6af3   52e0e3:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6af7   52e0e7:	e8 00 00 00 00       	call   52e0ec <___bpf_prog_run+0x6afc>	52e0e8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6afc   52e0ec:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6b00   52e0f0:	e9 0b c0 ff ff       	jmp    52a100 <___bpf_prog_run+0x2b10>
6b05   52e0f5:	4c 89 ff             	mov    %r15,%rdi
6b08   52e0f8:	e8 00 00 00 00       	call   52e0fd <___bpf_prog_run+0x6b0d>	52e0f9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b0d   52e0fd:	e9 db bf ff ff       	jmp    52a0dd <___bpf_prog_run+0x2aed>
6b12   52e102:	4c 89 ff             	mov    %r15,%rdi
6b15   52e105:	e8 00 00 00 00       	call   52e10a <___bpf_prog_run+0x6b1a>	52e106: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b1a   52e10a:	e9 66 d4 ff ff       	jmp    52b575 <___bpf_prog_run+0x3f85>
6b1f   52e10f:	48 89 c7             	mov    %rax,%rdi
6b22   52e112:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6b26   52e116:	e8 00 00 00 00       	call   52e11b <___bpf_prog_run+0x6b2b>	52e117: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6b2b   52e11b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6b2f   52e11f:	e9 ce c2 ff ff       	jmp    52a3f2 <___bpf_prog_run+0x2e02>
6b34   52e124:	4c 89 ff             	mov    %r15,%rdi
6b37   52e127:	e8 00 00 00 00       	call   52e12c <___bpf_prog_run+0x6b3c>	52e128: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b3c   52e12c:	e9 87 bb ff ff       	jmp    529cb8 <___bpf_prog_run+0x26c8>
6b41   52e131:	4c 89 ff             	mov    %r15,%rdi
6b44   52e134:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6b48   52e138:	e8 00 00 00 00       	call   52e13d <___bpf_prog_run+0x6b4d>	52e139: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b4d   52e13d:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6b51   52e141:	e9 7d c8 ff ff       	jmp    52a9c3 <___bpf_prog_run+0x33d3>
6b56   52e146:	e8 00 00 00 00       	call   52e14b <___bpf_prog_run+0x6b5b>	52e147: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6b5b   52e14b:	e9 3e d4 ff ff       	jmp    52b58e <___bpf_prog_run+0x3f9e>
6b60   52e150:	4c 89 ff             	mov    %r15,%rdi
6b63   52e153:	e8 00 00 00 00       	call   52e158 <___bpf_prog_run+0x6b68>	52e154: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b68   52e158:	e9 90 bc ff ff       	jmp    529ded <___bpf_prog_run+0x27fd>
6b6d   52e15d:	4c 89 ff             	mov    %r15,%rdi
6b70   52e160:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6b74   52e164:	e8 00 00 00 00       	call   52e169 <___bpf_prog_run+0x6b79>	52e165: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b79   52e169:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6b7d   52e16d:	e9 33 d2 ff ff       	jmp    52b3a5 <___bpf_prog_run+0x3db5>
6b82   52e172:	4c 89 ff             	mov    %r15,%rdi
6b85   52e175:	e8 00 00 00 00       	call   52e17a <___bpf_prog_run+0x6b8a>	52e176: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b8a   52e17a:	e9 03 d2 ff ff       	jmp    52b382 <___bpf_prog_run+0x3d92>
6b8f   52e17f:	4c 89 ff             	mov    %r15,%rdi
6b92   52e182:	e8 00 00 00 00       	call   52e187 <___bpf_prog_run+0x6b97>	52e183: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b97   52e187:	e9 27 c3 ff ff       	jmp    52a4b3 <___bpf_prog_run+0x2ec3>
6b9c   52e18c:	4c 89 ff             	mov    %r15,%rdi
6b9f   52e18f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6ba3   52e193:	e8 00 00 00 00       	call   52e198 <___bpf_prog_run+0x6ba8>	52e194: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6ba8   52e198:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6bac   52e19c:	e9 b6 c8 ff ff       	jmp    52aa57 <___bpf_prog_run+0x3467>
6bb1   52e1a1:	4c 89 ff             	mov    %r15,%rdi
6bb4   52e1a4:	e8 00 00 00 00       	call   52e1a9 <___bpf_prog_run+0x6bb9>	52e1a5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6bb9   52e1a9:	e9 90 cc ff ff       	jmp    52ae3e <___bpf_prog_run+0x384e>
6bbe   52e1ae:	4c 89 ff             	mov    %r15,%rdi
6bc1   52e1b1:	e8 00 00 00 00       	call   52e1b6 <___bpf_prog_run+0x6bc6>	52e1b2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6bc6   52e1b6:	e9 4d d1 ff ff       	jmp    52b308 <___bpf_prog_run+0x3d18>
6bcb   52e1bb:	4c 89 ff             	mov    %r15,%rdi
6bce   52e1be:	e8 00 00 00 00       	call   52e1c3 <___bpf_prog_run+0x6bd3>	52e1bf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6bd3   52e1c3:	e9 9f be ff ff       	jmp    52a067 <___bpf_prog_run+0x2a77>
6bd8   52e1c8:	48 89 c7             	mov    %rax,%rdi
6bdb   52e1cb:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6bdf   52e1cf:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6be3   52e1d3:	e8 00 00 00 00       	call   52e1d8 <___bpf_prog_run+0x6be8>	52e1d4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6be8   52e1d8:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6bec   52e1dc:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6bf0   52e1e0:	e9 56 d5 ff ff       	jmp    52b73b <___bpf_prog_run+0x414b>
6bf5   52e1e5:	4c 89 ff             	mov    %r15,%rdi
6bf8   52e1e8:	e8 00 00 00 00       	call   52e1ed <___bpf_prog_run+0x6bfd>	52e1e9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6bfd   52e1ed:	e9 26 d5 ff ff       	jmp    52b718 <___bpf_prog_run+0x4128>
6c02   52e1f2:	88 45 c0             	mov    %al,-0x40(%rbp)
6c05   52e1f5:	e8 00 00 00 00       	call   52e1fa <___bpf_prog_run+0x6c0a>	52e1f6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6c0a   52e1fa:	0f b6 45 c0          	movzbl -0x40(%rbp),%eax
6c0e   52e1fe:	e9 98 94 ff ff       	jmp    52769b <___bpf_prog_run+0xab>
6c13   52e203:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6c17   52e207:	e8 00 00 00 00       	call   52e20c <___bpf_prog_run+0x6c1c>	52e208: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c1c   52e20c:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6c20   52e210:	e9 09 bd ff ff       	jmp    529f1e <___bpf_prog_run+0x292e>
6c25   52e215:	4c 89 ff             	mov    %r15,%rdi
6c28   52e218:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6c2c   52e21c:	e8 00 00 00 00       	call   52e221 <___bpf_prog_run+0x6c31>	52e21d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c31   52e221:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6c35   52e225:	e9 b2 aa ff ff       	jmp    528cdc <___bpf_prog_run+0x16ec>
6c3a   52e22a:	4c 89 ff             	mov    %r15,%rdi
6c3d   52e22d:	e8 00 00 00 00       	call   52e232 <___bpf_prog_run+0x6c42>	52e22e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c42   52e232:	e9 82 aa ff ff       	jmp    528cb9 <___bpf_prog_run+0x16c9>
6c47   52e237:	4c 89 ff             	mov    %r15,%rdi
6c4a   52e23a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6c4e   52e23e:	e8 00 00 00 00       	call   52e243 <___bpf_prog_run+0x6c53>	52e23f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c53   52e243:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6c57   52e247:	e9 14 a8 ff ff       	jmp    528a60 <___bpf_prog_run+0x1470>
6c5c   52e24c:	4c 89 ff             	mov    %r15,%rdi
6c5f   52e24f:	e8 00 00 00 00       	call   52e254 <___bpf_prog_run+0x6c64>	52e250: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c64   52e254:	e9 e4 a7 ff ff       	jmp    528a3d <___bpf_prog_run+0x144d>
6c69   52e259:	4c 89 ff             	mov    %r15,%rdi
6c6c   52e25c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6c70   52e260:	e8 00 00 00 00       	call   52e265 <___bpf_prog_run+0x6c75>	52e261: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c75   52e265:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6c79   52e269:	e9 8e b4 ff ff       	jmp    5296fc <___bpf_prog_run+0x210c>
6c7e   52e26e:	4c 89 ff             	mov    %r15,%rdi
6c81   52e271:	e8 00 00 00 00       	call   52e276 <___bpf_prog_run+0x6c86>	52e272: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c86   52e276:	e9 5e b4 ff ff       	jmp    5296d9 <___bpf_prog_run+0x20e9>
6c8b   52e27b:	4c 89 ff             	mov    %r15,%rdi
6c8e   52e27e:	e8 00 00 00 00       	call   52e283 <___bpf_prog_run+0x6c93>	52e27f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c93   52e283:	e9 e8 b6 ff ff       	jmp    529970 <___bpf_prog_run+0x2380>
6c98   52e288:	4c 89 ff             	mov    %r15,%rdi
6c9b   52e28b:	e8 00 00 00 00       	call   52e290 <___bpf_prog_run+0x6ca0>	52e28c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ca0   52e290:	e9 b2 ac ff ff       	jmp    528f47 <___bpf_prog_run+0x1957>
6ca5   52e295:	4c 89 ff             	mov    %r15,%rdi
6ca8   52e298:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6cac   52e29c:	e8 00 00 00 00       	call   52e2a1 <___bpf_prog_run+0x6cb1>	52e29d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6cb1   52e2a1:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6cb5   52e2a5:	e9 d6 b1 ff ff       	jmp    529480 <___bpf_prog_run+0x1e90>
6cba   52e2aa:	4c 89 ff             	mov    %r15,%rdi
6cbd   52e2ad:	e8 00 00 00 00       	call   52e2b2 <___bpf_prog_run+0x6cc2>	52e2ae: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6cc2   52e2b2:	e9 a6 b1 ff ff       	jmp    52945d <___bpf_prog_run+0x1e6d>
6cc7   52e2b7:	4c 89 ff             	mov    %r15,%rdi
6cca   52e2ba:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6cce   52e2be:	e8 00 00 00 00       	call   52e2c3 <___bpf_prog_run+0x6cd3>	52e2bf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6cd3   52e2c3:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6cd7   52e2c7:	e9 76 b0 ff ff       	jmp    529342 <___bpf_prog_run+0x1d52>
6cdc   52e2cc:	4c 89 ff             	mov    %r15,%rdi
6cdf   52e2cf:	e8 00 00 00 00       	call   52e2d4 <___bpf_prog_run+0x6ce4>	52e2d0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ce4   52e2d4:	e9 46 b0 ff ff       	jmp    52931f <___bpf_prog_run+0x1d2f>
6ce9   52e2d9:	4c 89 ff             	mov    %r15,%rdi
6cec   52e2dc:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6cf0   52e2e0:	e8 00 00 00 00       	call   52e2e5 <___bpf_prog_run+0x6cf5>	52e2e1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6cf5   52e2e5:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6cf9   52e2e9:	e9 34 a6 ff ff       	jmp    528922 <___bpf_prog_run+0x1332>
6cfe   52e2ee:	4c 89 ff             	mov    %r15,%rdi
6d01   52e2f1:	e8 00 00 00 00       	call   52e2f6 <___bpf_prog_run+0x6d06>	52e2f2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d06   52e2f6:	e9 04 a6 ff ff       	jmp    5288ff <___bpf_prog_run+0x130f>
6d0b   52e2fb:	48 89 c7             	mov    %rax,%rdi
6d0e   52e2fe:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6d12   52e302:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6d16   52e306:	e8 00 00 00 00       	call   52e30b <___bpf_prog_run+0x6d1b>	52e307: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d1b   52e30b:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6d1f   52e30f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6d23   52e313:	e9 11 d5 ff ff       	jmp    52b829 <___bpf_prog_run+0x4239>
6d28   52e318:	4c 89 ff             	mov    %r15,%rdi
6d2b   52e31b:	e8 00 00 00 00       	call   52e320 <___bpf_prog_run+0x6d30>	52e31c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d30   52e320:	e9 e1 d4 ff ff       	jmp    52b806 <___bpf_prog_run+0x4216>
6d35   52e325:	4c 89 ff             	mov    %r15,%rdi
6d38   52e328:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6d3c   52e32c:	e8 00 00 00 00       	call   52e331 <___bpf_prog_run+0x6d41>	52e32d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6d41   52e331:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6d45   52e335:	e9 65 ba ff ff       	jmp    529d9f <___bpf_prog_run+0x27af>
6d4a   52e33a:	4c 89 ff             	mov    %r15,%rdi
6d4d   52e33d:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6d51   52e341:	e8 00 00 00 00       	call   52e346 <___bpf_prog_run+0x6d56>	52e342: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d56   52e346:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6d5a   52e34a:	e9 02 be ff ff       	jmp    52a151 <___bpf_prog_run+0x2b61>
6d5f   52e34f:	4c 89 ff             	mov    %r15,%rdi
6d62   52e352:	e8 00 00 00 00       	call   52e357 <___bpf_prog_run+0x6d67>	52e353: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d67   52e357:	e9 f3 cb ff ff       	jmp    52af4f <___bpf_prog_run+0x395f>
6d6c   52e35c:	4c 89 ff             	mov    %r15,%rdi
6d6f   52e35f:	89 4d c0             	mov    %ecx,-0x40(%rbp)
6d72   52e362:	e8 00 00 00 00       	call   52e367 <___bpf_prog_run+0x6d77>	52e363: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d77   52e367:	8b 4d c0             	mov    -0x40(%rbp),%ecx
6d7a   52e36a:	e9 e4 c1 ff ff       	jmp    52a553 <___bpf_prog_run+0x2f63>
6d7f   52e36f:	4c 89 ff             	mov    %r15,%rdi
6d82   52e372:	e8 00 00 00 00       	call   52e377 <___bpf_prog_run+0x6d87>	52e373: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d87   52e377:	e9 b4 c1 ff ff       	jmp    52a530 <___bpf_prog_run+0x2f40>
6d8c   52e37c:	4c 89 ff             	mov    %r15,%rdi
6d8f   52e37f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6d93   52e383:	e8 00 00 00 00       	call   52e388 <___bpf_prog_run+0x6d98>	52e384: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6d98   52e388:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6d9c   52e38c:	e9 a3 cc ff ff       	jmp    52b034 <___bpf_prog_run+0x3a44>
6da1   52e391:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6da5   52e395:	e8 00 00 00 00       	call   52e39a <___bpf_prog_run+0x6daa>	52e396: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6daa   52e39a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6dae   52e39e:	e9 47 c2 ff ff       	jmp    52a5ea <___bpf_prog_run+0x2ffa>
6db3   52e3a3:	4c 89 ff             	mov    %r15,%rdi
6db6   52e3a6:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6dba   52e3aa:	e8 00 00 00 00       	call   52e3af <___bpf_prog_run+0x6dbf>	52e3ab: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6dbf   52e3af:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6dc3   52e3b3:	e9 14 c2 ff ff       	jmp    52a5cc <___bpf_prog_run+0x2fdc>
6dc8   52e3b8:	4c 89 ff             	mov    %r15,%rdi
6dcb   52e3bb:	e8 00 00 00 00       	call   52e3c0 <___bpf_prog_run+0x6dd0>	52e3bc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6dd0   52e3c0:	e9 04 cc ff ff       	jmp    52afc9 <___bpf_prog_run+0x39d9>
6dd5   52e3c5:	4c 89 ff             	mov    %r15,%rdi
6dd8   52e3c8:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6ddc   52e3cc:	e8 00 00 00 00       	call   52e3d1 <___bpf_prog_run+0x6de1>	52e3cd: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6de1   52e3d1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6de5   52e3d5:	e9 c6 a0 ff ff       	jmp    5284a0 <___bpf_prog_run+0xeb0>
6dea   52e3da:	4c 89 ff             	mov    %r15,%rdi
6ded   52e3dd:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6df1   52e3e1:	e8 00 00 00 00       	call   52e3e6 <___bpf_prog_run+0x6df6>	52e3e2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6df6   52e3e6:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6dfa   52e3ea:	e9 68 b9 ff ff       	jmp    529d57 <___bpf_prog_run+0x2767>
6dff   52e3ef:	4c 89 ff             	mov    %r15,%rdi
6e02   52e3f2:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6e06   52e3f6:	e8 00 00 00 00       	call   52e3fb <___bpf_prog_run+0x6e0b>	52e3f7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6e0b   52e3fb:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6e0f   52e3ff:	e9 e9 d6 ff ff       	jmp    52baed <___bpf_prog_run+0x44fd>
6e14   52e404:	4c 89 ff             	mov    %r15,%rdi
6e17   52e407:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6e1b   52e40b:	e8 00 00 00 00       	call   52e410 <___bpf_prog_run+0x6e20>	52e40c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6e20   52e410:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6e24   52e414:	e9 1c d7 ff ff       	jmp    52bb35 <___bpf_prog_run+0x4545>
6e29   52e419:	4c 89 ff             	mov    %r15,%rdi
6e2c   52e41c:	e8 00 00 00 00       	call   52e421 <___bpf_prog_run+0x6e31>	52e41d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6e31   52e421:	e9 59 cc ff ff       	jmp    52b07f <___bpf_prog_run+0x3a8f>
6e36   52e426:	4c 89 ff             	mov    %r15,%rdi
6e39   52e429:	e8 00 00 00 00       	call   52e42e <___bpf_prog_run+0x6e3e>	52e42a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6e3e   52e42e:	e9 2d ba ff ff       	jmp    529e60 <___bpf_prog_run+0x2870>
6e43   52e433:	4c 89 ff             	mov    %r15,%rdi
6e46   52e436:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6e4a   52e43a:	e8 00 00 00 00       	call   52e43f <___bpf_prog_run+0x6e4f>	52e43b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6e4f   52e43f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6e53   52e443:	e9 26 d6 ff ff       	jmp    52ba6e <___bpf_prog_run+0x447e>
6e58   52e448:	48 89 d7             	mov    %rdx,%rdi
6e5b   52e44b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6e5f   52e44f:	e8 00 00 00 00       	call   52e454 <___bpf_prog_run+0x6e64>	52e450: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6e64   52e454:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6e68   52e458:	e9 fc d5 ff ff       	jmp    52ba59 <___bpf_prog_run+0x4469>
6e6d   52e45d:	48 89 c7             	mov    %rax,%rdi
6e70   52e460:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6e74   52e464:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6e78   52e468:	e8 00 00 00 00       	call   52e46d <___bpf_prog_run+0x6e7d>	52e469: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6e7d   52e46d:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6e81   52e471:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6e85   52e475:	e9 33 c8 ff ff       	jmp    52acad <___bpf_prog_run+0x36bd>
6e8a   52e47a:	4c 89 ff             	mov    %r15,%rdi
6e8d   52e47d:	e8 00 00 00 00       	call   52e482 <___bpf_prog_run+0x6e92>	52e47e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6e92   52e482:	e9 03 c8 ff ff       	jmp    52ac8a <___bpf_prog_run+0x369a>
6e97   52e487:	48 89 c7             	mov    %rax,%rdi
6e9a   52e48a:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6e9e   52e48e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6ea2   52e492:	e8 00 00 00 00       	call   52e497 <___bpf_prog_run+0x6ea7>	52e493: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ea7   52e497:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6eab   52e49b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6eaf   52e49f:	e9 d5 c1 ff ff       	jmp    52a679 <___bpf_prog_run+0x3089>
6eb4   52e4a4:	4c 89 ff             	mov    %r15,%rdi
6eb7   52e4a7:	e8 00 00 00 00       	call   52e4ac <___bpf_prog_run+0x6ebc>	52e4a8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ebc   52e4ac:	e9 a5 c1 ff ff       	jmp    52a656 <___bpf_prog_run+0x3066>
6ec1   52e4b1:	4c 89 ff             	mov    %r15,%rdi
6ec4   52e4b4:	e8 00 00 00 00       	call   52e4b9 <___bpf_prog_run+0x6ec9>	52e4b5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ec9   52e4b9:	e9 3d d0 ff ff       	jmp    52b4fb <___bpf_prog_run+0x3f0b>
6ece   52e4be:	4c 89 ff             	mov    %r15,%rdi
6ed1   52e4c1:	e8 00 00 00 00       	call   52e4c6 <___bpf_prog_run+0x6ed6>	52e4c2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ed6   52e4c6:	e9 c6 bd ff ff       	jmp    52a291 <___bpf_prog_run+0x2ca1>
6edb   52e4cb:	48 89 c7             	mov    %rax,%rdi
6ede   52e4ce:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6ee2   52e4d2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6ee6   52e4d6:	e8 00 00 00 00       	call   52e4db <___bpf_prog_run+0x6eeb>	52e4d7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6eeb   52e4db:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6eef   52e4df:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6ef3   52e4e3:	e9 63 d4 ff ff       	jmp    52b94b <___bpf_prog_run+0x435b>
6ef8   52e4e8:	4c 89 ff             	mov    %r15,%rdi
6efb   52e4eb:	e8 00 00 00 00       	call   52e4f0 <___bpf_prog_run+0x6f00>	52e4ec: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f00   52e4f0:	e9 33 d4 ff ff       	jmp    52b928 <___bpf_prog_run+0x4338>
6f05   52e4f5:	4c 89 ff             	mov    %r15,%rdi
6f08   52e4f8:	e8 00 00 00 00       	call   52e4fd <___bpf_prog_run+0x6f0d>	52e4f9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f0d   52e4fd:	e9 87 d2 ff ff       	jmp    52b789 <___bpf_prog_run+0x4199>
6f12   52e502:	48 89 c7             	mov    %rax,%rdi
6f15   52e505:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6f19   52e509:	e8 00 00 00 00       	call   52e50e <___bpf_prog_run+0x6f1e>	52e50a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6f1e   52e50e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6f22   52e512:	e9 18 c3 ff ff       	jmp    52a82f <___bpf_prog_run+0x323f>
6f27   52e517:	4c 89 ff             	mov    %r15,%rdi
6f2a   52e51a:	e8 00 00 00 00       	call   52e51f <___bpf_prog_run+0x6f2f>	52e51b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f2f   52e51f:	e9 f8 c6 ff ff       	jmp    52ac1c <___bpf_prog_run+0x362c>
6f34   52e524:	4c 89 ff             	mov    %r15,%rdi
6f37   52e527:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6f3b   52e52b:	e8 00 00 00 00       	call   52e530 <___bpf_prog_run+0x6f40>	52e52c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6f40   52e530:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6f44   52e534:	e9 77 cf ff ff       	jmp    52b4b0 <___bpf_prog_run+0x3ec0>
6f49   52e539:	4c 89 ff             	mov    %r15,%rdi
6f4c   52e53c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6f50   52e540:	e8 00 00 00 00       	call   52e545 <___bpf_prog_run+0x6f55>	52e541: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f55   52e545:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6f59   52e549:	e9 66 d3 ff ff       	jmp    52b8b4 <___bpf_prog_run+0x42c4>
6f5e   52e54e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6f62   52e552:	e8 00 00 00 00       	call   52e557 <___bpf_prog_run+0x6f67>	52e553: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6f67   52e557:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6f6b   52e55b:	e9 30 d3 ff ff       	jmp    52b890 <___bpf_prog_run+0x42a0>
6f70   52e560:	4c 89 ff             	mov    %r15,%rdi
6f73   52e563:	e8 00 00 00 00       	call   52e568 <___bpf_prog_run+0x6f78>	52e564: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f78   52e568:	e9 0a d3 ff ff       	jmp    52b877 <___bpf_prog_run+0x4287>
6f7d   52e56d:	4c 89 ff             	mov    %r15,%rdi
6f80   52e570:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6f84   52e574:	e8 00 00 00 00       	call   52e579 <___bpf_prog_run+0x6f89>	52e575: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f89   52e579:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6f8d   52e57d:	e9 bd c6 ff ff       	jmp    52ac3f <___bpf_prog_run+0x364f>
6f92   52e582:	4c 89 ff             	mov    %r15,%rdi
6f95   52e585:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6f99   52e589:	e8 00 00 00 00       	call   52e58e <___bpf_prog_run+0x6f9e>	52e58a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f9e   52e58e:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6fa2   52e592:	e9 d0 ce ff ff       	jmp    52b467 <___bpf_prog_run+0x3e77>
6fa7   52e597:	4c 89 ff             	mov    %r15,%rdi
6faa   52e59a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6fae   52e59e:	e8 00 00 00 00       	call   52e5a3 <___bpf_prog_run+0x6fb3>	52e59f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6fb3   52e5a3:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6fb7   52e5a7:	e9 9a bc ff ff       	jmp    52a246 <___bpf_prog_run+0x2c56>
6fbc   52e5ac:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6fc0   52e5b0:	e8 00 00 00 00       	call   52e5b5 <___bpf_prog_run+0x6fc5>	52e5b1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6fc5   52e5b5:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6fc9   52e5b9:	e9 67 bc ff ff       	jmp    52a225 <___bpf_prog_run+0x2c35>
6fce   52e5be:	4c 89 ff             	mov    %r15,%rdi
6fd1   52e5c1:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6fd5   52e5c5:	e8 00 00 00 00       	call   52e5ca <___bpf_prog_run+0x6fda>	52e5c6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6fda   52e5ca:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6fde   52e5ce:	e9 34 bc ff ff       	jmp    52a207 <___bpf_prog_run+0x2c17>
6fe3   52e5d3:	4c 89 ff             	mov    %r15,%rdi
6fe6   52e5d6:	e8 00 00 00 00       	call   52e5db <___bpf_prog_run+0x6feb>	52e5d7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6feb   52e5db:	e9 07 bc ff ff       	jmp    52a1e7 <___bpf_prog_run+0x2bf7>
6ff0   52e5e0:	4c 89 ff             	mov    %r15,%rdi
6ff3   52e5e3:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6ff7   52e5e7:	e8 00 00 00 00       	call   52e5ec <___bpf_prog_run+0x6ffc>	52e5e8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6ffc   52e5ec:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
7000   52e5f0:	e9 d8 d0 ff ff       	jmp    52b6cd <___bpf_prog_run+0x40dd>
7005   52e5f5:	48 89 d7             	mov    %rdx,%rdi
7008   52e5f8:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
700c   52e5fc:	e8 00 00 00 00       	call   52e601 <___bpf_prog_run+0x7011>	52e5fd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7011   52e601:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
7015   52e605:	e9 a4 d0 ff ff       	jmp    52b6ae <___bpf_prog_run+0x40be>
701a   52e60a:	4c 89 ff             	mov    %r15,%rdi
701d   52e60d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7021   52e611:	e8 00 00 00 00       	call   52e616 <___bpf_prog_run+0x7026>	52e612: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
7026   52e616:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
702a   52e61a:	e9 ec bf ff ff       	jmp    52a60b <___bpf_prog_run+0x301b>
702f   52e61f:	4c 89 ff             	mov    %r15,%rdi
7032   52e622:	89 4d c0             	mov    %ecx,-0x40(%rbp)
7035   52e625:	e8 00 00 00 00       	call   52e62a <___bpf_prog_run+0x703a>	52e626: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
703a   52e62a:	8b 4d c0             	mov    -0x40(%rbp),%ecx
703d   52e62d:	e9 1b c3 ff ff       	jmp    52a94d <___bpf_prog_run+0x335d>
7042   52e632:	4c 89 ff             	mov    %r15,%rdi
7045   52e635:	e8 00 00 00 00       	call   52e63a <___bpf_prog_run+0x704a>	52e636: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
704a   52e63a:	e9 eb c2 ff ff       	jmp    52a92a <___bpf_prog_run+0x333a>
704f   52e63f:	4c 89 ff             	mov    %r15,%rdi
7052   52e642:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7056   52e646:	e8 00 00 00 00       	call   52e64b <___bpf_prog_run+0x705b>	52e647: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
705b   52e64b:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
705f   52e64f:	e9 e9 a5 ff ff       	jmp    528c3d <___bpf_prog_run+0x164d>
7064   52e654:	4c 89 ff             	mov    %r15,%rdi
7067   52e657:	e8 00 00 00 00       	call   52e65c <___bpf_prog_run+0x706c>	52e658: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
706c   52e65c:	e9 b9 a5 ff ff       	jmp    528c1a <___bpf_prog_run+0x162a>
7071   52e661:	4c 89 ff             	mov    %r15,%rdi
7074   52e664:	e8 00 00 00 00       	call   52e669 <___bpf_prog_run+0x7079>	52e665: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7079   52e669:	e9 c8 aa ff ff       	jmp    529136 <___bpf_prog_run+0x1b46>
707e   52e66e:	4c 89 ff             	mov    %r15,%rdi
7081   52e671:	e8 00 00 00 00       	call   52e676 <___bpf_prog_run+0x7086>	52e672: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7086   52e676:	e9 4d b2 ff ff       	jmp    5298c8 <___bpf_prog_run+0x22d8>
708b   52e67b:	4c 89 ff             	mov    %r15,%rdi
708e   52e67e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7092   52e682:	e8 00 00 00 00       	call   52e687 <___bpf_prog_run+0x7097>	52e683: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7097   52e687:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
709b   52e68b:	e9 3e 93 ff ff       	jmp    5279ce <___bpf_prog_run+0x3de>
70a0   52e690:	4c 89 ff             	mov    %r15,%rdi
70a3   52e693:	e8 00 00 00 00       	call   52e698 <___bpf_prog_run+0x70a8>	52e694: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
70a8   52e698:	e9 cb b4 ff ff       	jmp    529b68 <___bpf_prog_run+0x2578>
70ad   52e69d:	48 89 c7             	mov    %rax,%rdi
70b0   52e6a0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
70b4   52e6a4:	e8 00 00 00 00       	call   52e6a9 <___bpf_prog_run+0x70b9>	52e6a5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
70b9   52e6a9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
70bd   52e6ad:	e9 ab af ff ff       	jmp    52965d <___bpf_prog_run+0x206d>
70c2   52e6b2:	4c 89 ff             	mov    %r15,%rdi
70c5   52e6b5:	e8 00 00 00 00       	call   52e6ba <___bpf_prog_run+0x70ca>	52e6b6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
70ca   52e6ba:	e9 7b af ff ff       	jmp    52963a <___bpf_prog_run+0x204a>
70cf   52e6bf:	4c 89 ff             	mov    %r15,%rdi
70d2   52e6c2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
70d6   52e6c6:	e8 00 00 00 00       	call   52e6cb <___bpf_prog_run+0x70db>	52e6c7: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
70db   52e6cb:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
70df   52e6cf:	e9 a3 92 ff ff       	jmp    527977 <___bpf_prog_run+0x387>
70e4   52e6d4:	4c 89 ff             	mov    %r15,%rdi
70e7   52e6d7:	89 45 c0             	mov    %eax,-0x40(%rbp)
70ea   52e6da:	e8 00 00 00 00       	call   52e6df <___bpf_prog_run+0x70ef>	52e6db: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
70ef   52e6df:	48 63 45 c0          	movslq -0x40(%rbp),%rax
70f3   52e6e3:	e9 4d 92 ff ff       	jmp    527935 <___bpf_prog_run+0x345>
70f8   52e6e8:	4c 89 ff             	mov    %r15,%rdi
70fb   52e6eb:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
70ff   52e6ef:	e8 00 00 00 00       	call   52e6f4 <___bpf_prog_run+0x7104>	52e6f0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
7104   52e6f4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
7108   52e6f8:	e9 28 93 ff ff       	jmp    527a25 <___bpf_prog_run+0x435>
710d   52e6fd:	48 89 d7             	mov    %rdx,%rdi
7110   52e700:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7114   52e704:	e8 00 00 00 00       	call   52e709 <___bpf_prog_run+0x7119>	52e705: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7119   52e709:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
711d   52e70d:	e9 fe 92 ff ff       	jmp    527a10 <___bpf_prog_run+0x420>
7122   52e712:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
7126   52e716:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
712a   52e71a:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
712e   52e71e:	e8 00 00 00 00       	call   52e723 <___bpf_prog_run+0x7133>	52e71f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7133   52e723:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
7137   52e727:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
713b   52e72b:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
713f   52e72f:	e9 2f ca ff ff       	jmp    52b163 <___bpf_prog_run+0x3b73>
7144   52e734:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
7148   52e738:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
714c   52e73c:	e8 00 00 00 00       	call   52e741 <___bpf_prog_run+0x7151>	52e73d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7151   52e741:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
7155   52e745:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
7159   52e749:	e9 fb c9 ff ff       	jmp    52b149 <___bpf_prog_run+0x3b59>
715e   52e74e:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
7162   52e752:	e8 00 00 00 00       	call   52e757 <___bpf_prog_run+0x7167>	52e753: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7167   52e757:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
716b   52e75b:	e9 cf c9 ff ff       	jmp    52b12f <___bpf_prog_run+0x3b3f>
7170   52e760:	4c 89 ff             	mov    %r15,%rdi
7173   52e763:	e8 00 00 00 00       	call   52e768 <___bpf_prog_run+0x7178>	52e764: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7178   52e768:	e9 96 93 ff ff       	jmp    527b03 <___bpf_prog_run+0x513>
717d   52e76d:	4c 89 ff             	mov    %r15,%rdi
7180   52e770:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7184   52e774:	e8 00 00 00 00       	call   52e779 <___bpf_prog_run+0x7189>	52e775: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7189   52e779:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
718d   52e77d:	e9 7d a3 ff ff       	jmp    528aff <___bpf_prog_run+0x150f>
7192   52e782:	4c 89 ff             	mov    %r15,%rdi
7195   52e785:	e8 00 00 00 00       	call   52e78a <___bpf_prog_run+0x719a>	52e786: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
719a   52e78a:	e9 4d a3 ff ff       	jmp    528adc <___bpf_prog_run+0x14ec>
719f   52e78f:	4c 89 ff             	mov    %r15,%rdi
71a2   52e792:	e8 00 00 00 00       	call   52e797 <___bpf_prog_run+0x71a7>	52e793: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71a7   52e797:	e9 50 a8 ff ff       	jmp    528fec <___bpf_prog_run+0x19fc>
71ac   52e79c:	4c 89 ff             	mov    %r15,%rdi
71af   52e79f:	e8 00 00 00 00       	call   52e7a4 <___bpf_prog_run+0x71b4>	52e7a0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71b4   52e7a4:	e9 cf af ff ff       	jmp    529778 <___bpf_prog_run+0x2188>
71b9   52e7a9:	4c 89 ff             	mov    %r15,%rdi
71bc   52e7ac:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
71c0   52e7b0:	e8 00 00 00 00       	call   52e7b5 <___bpf_prog_run+0x71c5>	52e7b1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71c5   52e7b5:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
71c9   52e7b9:	e9 e5 aa ff ff       	jmp    5292a3 <___bpf_prog_run+0x1cb3>
71ce   52e7be:	4c 89 ff             	mov    %r15,%rdi
71d1   52e7c1:	e8 00 00 00 00       	call   52e7c6 <___bpf_prog_run+0x71d6>	52e7c2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71d6   52e7c6:	e9 b5 aa ff ff       	jmp    529280 <___bpf_prog_run+0x1c90>
71db   52e7cb:	4c 89 ff             	mov    %r15,%rdi
71de   52e7ce:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
71e2   52e7d2:	e8 00 00 00 00       	call   52e7d7 <___bpf_prog_run+0x71e7>	52e7d3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71e7   52e7d7:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
71eb   52e7db:	e9 a3 a0 ff ff       	jmp    528883 <___bpf_prog_run+0x1293>
71f0   52e7e0:	4c 89 ff             	mov    %r15,%rdi
71f3   52e7e3:	e8 00 00 00 00       	call   52e7e8 <___bpf_prog_run+0x71f8>	52e7e4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71f8   52e7e8:	e9 73 a0 ff ff       	jmp    528860 <___bpf_prog_run+0x1270>
71fd   52e7ed:	4c 89 ff             	mov    %r15,%rdi
7200   52e7f0:	e8 00 00 00 00       	call   52e7f5 <___bpf_prog_run+0x7205>	52e7f1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7205   52e7f5:	e9 a8 a6 ff ff       	jmp    528ea2 <___bpf_prog_run+0x18b2>
720a   52e7fa:	4c 89 ff             	mov    %r15,%rdi
720d   52e7fd:	e8 00 00 00 00       	call   52e802 <___bpf_prog_run+0x7212>	52e7fe: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7212   52e802:	e9 11 b2 ff ff       	jmp    529a18 <___bpf_prog_run+0x2428>
7217   52e807:	4c 89 ff             	mov    %r15,%rdi
721a   52e80a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
721e   52e80e:	e8 00 00 00 00       	call   52e813 <___bpf_prog_run+0x7223>	52e80f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7223   52e813:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
7227   52e817:	e9 03 ad ff ff       	jmp    52951f <___bpf_prog_run+0x1f2f>
722c   52e81c:	4c 89 ff             	mov    %r15,%rdi
722f   52e81f:	e8 00 00 00 00       	call   52e824 <___bpf_prog_run+0x7234>	52e820: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7234   52e824:	e9 d3 ac ff ff       	jmp    5294fc <___bpf_prog_run+0x1f0c>
7239   52e829:	4c 89 ff             	mov    %r15,%rdi
723c   52e82c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7240   52e830:	e8 00 00 00 00       	call   52e835 <___bpf_prog_run+0x7245>	52e831: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7245   52e835:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
7249   52e839:	e9 a3 ab ff ff       	jmp    5293e1 <___bpf_prog_run+0x1df1>
724e   52e83e:	4c 89 ff             	mov    %r15,%rdi
7251   52e841:	e8 00 00 00 00       	call   52e846 <___bpf_prog_run+0x7256>	52e842: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7256   52e846:	e9 73 ab ff ff       	jmp    5293be <___bpf_prog_run+0x1dce>
725b   52e84b:	4c 89 ff             	mov    %r15,%rdi
725e   52e84e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7262   52e852:	e8 00 00 00 00       	call   52e857 <___bpf_prog_run+0x7267>	52e853: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7267   52e857:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
726b   52e85b:	e9 61 a1 ff ff       	jmp    5289c1 <___bpf_prog_run+0x13d1>
7270   52e860:	4c 89 ff             	mov    %r15,%rdi
7273   52e863:	e8 00 00 00 00       	call   52e868 <___bpf_prog_run+0x7278>	52e864: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7278   52e868:	e9 31 a1 ff ff       	jmp    52899e <___bpf_prog_run+0x13ae>
727d   52e86d:	48 89 c7             	mov    %rax,%rdi
7280   52e870:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
7284   52e874:	e8 00 00 00 00       	call   52e879 <___bpf_prog_run+0x7289>	52e875: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7289   52e879:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
728d   52e87d:	e9 8e 9a ff ff       	jmp    528310 <___bpf_prog_run+0xd20>
7292   52e882:	4c 89 ff             	mov    %r15,%rdi
7295   52e885:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7299   52e889:	e8 00 00 00 00       	call   52e88e <___bpf_prog_run+0x729e>	52e88a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
729e   52e88e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
72a2   52e892:	e9 f8 94 ff ff       	jmp    527d8f <___bpf_prog_run+0x79f>
72a7   52e897:	4c 89 ff             	mov    %r15,%rdi
72aa   52e89a:	e8 00 00 00 00       	call   52e89f <___bpf_prog_run+0x72af>	52e89b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
72af   52e89f:	e9 cb 94 ff ff       	jmp    527d6f <___bpf_prog_run+0x77f>
72b4   52e8a4:	4c 89 ff             	mov    %r15,%rdi
72b7   52e8a7:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
72bb   52e8ab:	e8 00 00 00 00       	call   52e8b0 <___bpf_prog_run+0x72c0>	52e8ac: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
72c0   52e8b0:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
72c4   52e8b4:	e9 16 9d ff ff       	jmp    5285cf <___bpf_prog_run+0xfdf>
72c9   52e8b9:	4c 89 ff             	mov    %r15,%rdi
72cc   52e8bc:	e8 00 00 00 00       	call   52e8c1 <___bpf_prog_run+0x72d1>	52e8bd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
72d1   52e8c1:	e9 83 97 ff ff       	jmp    528049 <___bpf_prog_run+0xa59>
72d6   52e8c6:	4c 89 ff             	mov    %r15,%rdi
72d9   52e8c9:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
72dd   52e8cd:	e8 00 00 00 00       	call   52e8d2 <___bpf_prog_run+0x72e2>	52e8ce: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
72e2   52e8d2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
72e6   52e8d6:	e9 d1 9a ff ff       	jmp    5283ac <___bpf_prog_run+0xdbc>
72eb   52e8db:	4c 89 ff             	mov    %r15,%rdi
72ee   52e8de:	89 55 c0             	mov    %edx,-0x40(%rbp)
72f1   52e8e1:	e8 00 00 00 00       	call   52e8e6 <___bpf_prog_run+0x72f6>	52e8e2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
72f6   52e8e6:	8b 55 c0             	mov    -0x40(%rbp),%edx
72f9   52e8e9:	e9 85 9d ff ff       	jmp    528673 <___bpf_prog_run+0x1083>
72fe   52e8ee:	48 89 c7             	mov    %rax,%rdi
7301   52e8f1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
7305   52e8f5:	e8 00 00 00 00       	call   52e8fa <___bpf_prog_run+0x730a>	52e8f6: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
730a   52e8fa:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
730e   52e8fe:	e9 b8 97 ff ff       	jmp    5280bb <___bpf_prog_run+0xacb>
7313   52e903:	4c 89 ff             	mov    %r15,%rdi
7316   52e906:	e8 00 00 00 00       	call   52e90b <___bpf_prog_run+0x731b>	52e907: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
731b   52e90b:	e9 00 9e ff ff       	jmp    528710 <___bpf_prog_run+0x1120>
7320   52e910:	48 89 c7             	mov    %rax,%rdi
7323   52e913:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
7327   52e917:	e8 00 00 00 00       	call   52e91c <___bpf_prog_run+0x732c>	52e918: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
732c   52e91c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
7330   52e920:	e9 f8 98 ff ff       	jmp    52821d <___bpf_prog_run+0xc2d>
7335   52e925:	4c 89 ff             	mov    %r15,%rdi
7338   52e928:	e8 00 00 00 00       	call   52e92d <___bpf_prog_run+0x733d>	52e929: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
733d   52e92d:	e9 a9 a8 ff ff       	jmp    5291db <___bpf_prog_run+0x1beb>
7342   52e932:	4c 89 ff             	mov    %r15,%rdi
7345   52e935:	e8 00 00 00 00       	call   52e93a <___bpf_prog_run+0x734a>	52e936: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
734a   52e93a:	e9 79 9e ff ff       	jmp    5287b8 <___bpf_prog_run+0x11c8>
734f   52e93f:	4c 89 ff             	mov    %r15,%rdi
7352   52e942:	e8 00 00 00 00       	call   52e947 <___bpf_prog_run+0x7357>	52e943: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7357   52e947:	e9 62 98 ff ff       	jmp    5281ae <___bpf_prog_run+0xbbe>
735c   52e94c:	4c 89 ff             	mov    %r15,%rdi
735f   52e94f:	89 55 c0             	mov    %edx,-0x40(%rbp)
7362   52e952:	e8 00 00 00 00       	call   52e957 <___bpf_prog_run+0x7367>	52e953: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7367   52e957:	8b 55 c0             	mov    -0x40(%rbp),%edx
736a   52e95a:	e9 b4 9b ff ff       	jmp    528513 <___bpf_prog_run+0xf23>
736f   52e95f:	4c 89 ff             	mov    %r15,%rdi
7372   52e962:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7376   52e966:	e8 00 00 00 00       	call   52e96b <___bpf_prog_run+0x737b>	52e967: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
737b   52e96b:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
737f   52e96f:	e9 96 95 ff ff       	jmp    527f0a <___bpf_prog_run+0x91a>
7384   52e974:	4c 89 ff             	mov    %r15,%rdi
7387   52e977:	e8 00 00 00 00       	call   52e97c <___bpf_prog_run+0x738c>	52e978: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
738c   52e97c:	e9 69 95 ff ff       	jmp    527eea <___bpf_prog_run+0x8fa>
7391   52e981:	4c 89 ff             	mov    %r15,%rdi
7394   52e984:	e8 00 00 00 00       	call   52e989 <___bpf_prog_run+0x7399>	52e985: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7399   52e989:	e9 d1 8e ff ff       	jmp    52785f <___bpf_prog_run+0x26f>
739e   52e98e:	4c 89 ff             	mov    %r15,%rdi
73a1   52e991:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
73a5   52e995:	e8 00 00 00 00       	call   52e99a <___bpf_prog_run+0x73aa>	52e996: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
73aa   52e99a:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
73ae   52e99e:	e9 ff c0 ff ff       	jmp    52aaa2 <___bpf_prog_run+0x34b2>
73b3   52e9a3:	4c 89 ff             	mov    %r15,%rdi
73b6   52e9a6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
73ba   52e9aa:	e8 00 00 00 00       	call   52e9af <___bpf_prog_run+0x73bf>	52e9ab: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
73bf   52e9af:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
73c3   52e9b3:	e9 33 c1 ff ff       	jmp    52aaeb <___bpf_prog_run+0x34fb>
73c8   52e9b8:	4c 89 ff             	mov    %r15,%rdi
73cb   52e9bb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
73cf   52e9bf:	e8 00 00 00 00       	call   52e9c4 <___bpf_prog_run+0x73d4>	52e9c0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
73d4   52e9c4:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
73d8   52e9c8:	e9 81 94 ff ff       	jmp    527e4e <___bpf_prog_run+0x85e>
73dd   52e9cd:	4c 89 ff             	mov    %r15,%rdi
73e0   52e9d0:	e8 00 00 00 00       	call   52e9d5 <___bpf_prog_run+0x73e5>	52e9d1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
73e5   52e9d5:	e9 54 94 ff ff       	jmp    527e2e <___bpf_prog_run+0x83e>
73ea   52e9da:	48 89 c7             	mov    %rax,%rdi
73ed   52e9dd:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
73f1   52e9e1:	e8 00 00 00 00       	call   52e9e6 <___bpf_prog_run+0x73f6>	52e9e2: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
73f6   52e9e6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
73fa   52e9ea:	e9 d2 8e ff ff       	jmp    5278c1 <___bpf_prog_run+0x2d1>
73ff   52e9ef:	4c 89 ff             	mov    %r15,%rdi
7402   52e9f2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
7406   52e9f6:	e8 00 00 00 00       	call   52e9fb <___bpf_prog_run+0x740b>	52e9f7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
740b   52e9fb:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
740f   52e9ff:	e9 a8 8e ff ff       	jmp    5278ac <___bpf_prog_run+0x2bc>
7414   52ea04:	4c 89 ff             	mov    %r15,%rdi
7417   52ea07:	e8 00 00 00 00       	call   52ea0c <___bpf_prog_run+0x741c>	52ea08: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
741c   52ea0c:	e9 96 95 ff ff       	jmp    527fa7 <___bpf_prog_run+0x9b7>
7421   52ea11:	4c 89 ff             	mov    %r15,%rdi
7424   52ea14:	e8 00 00 00 00       	call   52ea19 <___bpf_prog_run+0x7429>	52ea15: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7429   52ea19:	e9 4a 98 ff ff       	jmp    528268 <___bpf_prog_run+0xc78>
742e   52ea1e:	4c 89 ff             	mov    %r15,%rdi
7431   52ea21:	e8 00 00 00 00       	call   52ea26 <___bpf_prog_run+0x7436>	52ea22: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7436   52ea26:	e9 81 9b ff ff       	jmp    5285ac <___bpf_prog_run+0xfbc>
743b   52ea2b:	4c 89 ff             	mov    %r15,%rdi
743e   52ea2e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7442   52ea32:	e8 00 00 00 00       	call   52ea37 <___bpf_prog_run+0x7447>	52ea33: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7447   52ea37:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
744b   52ea3b:	e9 8a 95 ff ff       	jmp    527fca <___bpf_prog_run+0x9da>
7450   52ea40:	48 89 c7             	mov    %rax,%rdi
7453   52ea43:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
7457   52ea47:	e8 00 00 00 00       	call   52ea4c <___bpf_prog_run+0x745c>	52ea48: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
745c   52ea4c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
7460   52ea50:	e9 b1 99 ff ff       	jmp    528406 <___bpf_prog_run+0xe16>
7465   52ea55:	4c 89 ff             	mov    %r15,%rdi
7468   52ea58:	e8 00 00 00 00       	call   52ea5d <___bpf_prog_run+0x746d>	52ea59: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
746d   52ea5d:	e9 a4 96 ff ff       	jmp    528106 <___bpf_prog_run+0xb16>
7472   52ea62:	4c 89 ff             	mov    %r15,%rdi
7475   52ea65:	89 55 c0             	mov    %edx,-0x40(%rbp)
7478   52ea68:	e8 00 00 00 00       	call   52ea6d <___bpf_prog_run+0x747d>	52ea69: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
747d   52ea6d:	8b 55 c0             	mov    -0x40(%rbp),%edx
7480   52ea70:	e9 5b 92 ff ff       	jmp    527cd0 <___bpf_prog_run+0x6e0>
7485   52ea75:	4c 89 ff             	mov    %r15,%rdi
7488   52ea78:	e8 00 00 00 00       	call   52ea7d <___bpf_prog_run+0x748d>	52ea79: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
748d   52ea7d:	e9 8b d9 ff ff       	jmp    52c40d <___bpf_prog_run+0x4e1d>
7492   52ea82:	4c 89 ff             	mov    %r15,%rdi
7495   52ea85:	e8 00 00 00 00       	call   52ea8a <___bpf_prog_run+0x749a>	52ea86: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
749a   52ea8a:	e9 25 d9 ff ff       	jmp    52c3b4 <___bpf_prog_run+0x4dc4>
749f   52ea8f:	4c 89 ff             	mov    %r15,%rdi
74a2   52ea92:	e8 00 00 00 00       	call   52ea97 <___bpf_prog_run+0x74a7>	52ea93: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
74a7   52ea97:	e9 9a d1 ff ff       	jmp    52bc36 <___bpf_prog_run+0x4646>
74ac   52ea9c:	4c 89 f7             	mov    %r14,%rdi
74af   52ea9f:	e8 00 00 00 00       	call   52eaa4 <___bpf_prog_run+0x74b4>	52eaa0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
74b4   52eaa4:	e9 1f be ff ff       	jmp    52a8c8 <___bpf_prog_run+0x32d8>
74b9   52eaa9:	4c 89 f7             	mov    %r14,%rdi
74bc   52eaac:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
74c0   52eab0:	e8 00 00 00 00       	call   52eab5 <___bpf_prog_run+0x74c5>	52eab1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
74c5   52eab5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
74c9   52eab9:	e9 90 e1 ff ff       	jmp    52cc4e <___bpf_prog_run+0x565e>
74ce   52eabe:	66 90                	xchg   %ax,%ax
0000 00000000000076d0 <___bpf_prog_run.cold>:
0000     76d0:	48 63 d1             	movslq %ecx,%rdx
0003     76d3:	48 89 c6             	mov    %rax,%rsi
0006     76d6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	76d9: R_X86_64_32S	.data+0x550ca0
000d     76dd:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
0011     76e1:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
0015     76e5:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
0019     76e9:	e8 00 00 00 00       	call   76ee <___bpf_prog_run.cold+0x1e>	76ea: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
001e     76ee:	4c 8b 4d b8          	mov    -0x48(%rbp),%r9
0022     76f2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0026     76f6:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
002a     76fa:	4c 89 ca             	mov    %r9,%rdx
002d     76fd:	48 c1 ea 03          	shr    $0x3,%rdx
0031     7701:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
0036     7706:	4c 89 ca             	mov    %r9,%rdx
0039     7709:	83 e2 07             	and    $0x7,%edx
003c     770c:	83 c2 03             	add    $0x3,%edx
003f     770f:	38 ca                	cmp    %cl,%dl
0041     7711:	7c 08                	jl     771b <___bpf_prog_run.cold+0x4b>
0043     7713:	84 c9                	test   %cl,%cl
0045     7715:	0f 85 a5 00 00 00    	jne    77c0 <___bpf_prog_run.cold+0xf0>
004b     771b:	4c 89 c2             	mov    %r8,%rdx
004e     771e:	4c 89 c6             	mov    %r8,%rsi
0051     7721:	8b 4b 04             	mov    0x4(%rbx),%ecx
0054     7724:	48 c1 ea 03          	shr    $0x3,%rdx
0058     7728:	83 e6 07             	and    $0x7,%esi
005b     772b:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
0060     7730:	40 38 f2             	cmp    %sil,%dl
0063     7733:	7f 08                	jg     773d <___bpf_prog_run.cold+0x6d>
0065     7735:	84 d2                	test   %dl,%dl
0067     7737:	0f 85 a0 00 00 00    	jne    77dd <___bpf_prog_run.cold+0x10d>
006d     773d:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
0071     7741:	83 e2 0f             	and    $0xf,%edx
0074     7744:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
0078     7748:	e9 00 00 00 00       	jmp    774d <___bpf_prog_run.cold+0x7d>	7749: R_X86_64_PC32	.text+0x52aa3e
007d     774d:	89 ca                	mov    %ecx,%edx
007f     774f:	89 c6                	mov    %eax,%esi
0081     7751:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7754: R_X86_64_32S	.data+0x550be0
0088     7758:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
008c     775c:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
0090     7760:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
0094     7764:	e8 00 00 00 00       	call   7769 <___bpf_prog_run.cold+0x99>	7765: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
0099     7769:	4c 8b 4d b8          	mov    -0x48(%rbp),%r9
009d     776d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
00a1     7771:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
00a5     7775:	4c 89 ca             	mov    %r9,%rdx
00a8     7778:	48 c1 ea 03          	shr    $0x3,%rdx
00ac     777c:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
00b1     7781:	4c 89 ca             	mov    %r9,%rdx
00b4     7784:	83 e2 07             	and    $0x7,%edx
00b7     7787:	83 c2 03             	add    $0x3,%edx
00ba     778a:	38 ca                	cmp    %cl,%dl
00bc     778c:	7c 04                	jl     7792 <___bpf_prog_run.cold+0xc2>
00be     778e:	84 c9                	test   %cl,%cl
00c0     7790:	75 66                	jne    77f8 <___bpf_prog_run.cold+0x128>
00c2     7792:	4c 89 c2             	mov    %r8,%rdx
00c5     7795:	4c 89 c6             	mov    %r8,%rsi
00c8     7798:	8b 4b 04             	mov    0x4(%rbx),%ecx
00cb     779b:	48 c1 ea 03          	shr    $0x3,%rdx
00cf     779f:	83 e6 07             	and    $0x7,%esi
00d2     77a2:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
00d7     77a7:	40 38 f2             	cmp    %sil,%dl
00da     77aa:	7f 04                	jg     77b0 <___bpf_prog_run.cold+0xe0>
00dc     77ac:	84 d2                	test   %dl,%dl
00de     77ae:	75 5e                	jne    780e <___bpf_prog_run.cold+0x13e>
00e0     77b0:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
00e4     77b4:	83 e2 0f             	and    $0xf,%edx
00e7     77b7:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
00eb     77bb:	e9 00 00 00 00       	jmp    77c0 <___bpf_prog_run.cold+0xf0>	77bc: R_X86_64_PC32	.text+0x529d87
00f0     77c0:	4c 89 cf             	mov    %r9,%rdi
00f3     77c3:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
00f7     77c7:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
00fb     77cb:	e8 00 00 00 00       	call   77d0 <___bpf_prog_run.cold+0x100>	77cc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0100     77d0:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
0104     77d4:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
0108     77d8:	e9 3e ff ff ff       	jmp    771b <___bpf_prog_run.cold+0x4b>
010d     77dd:	4c 89 c7             	mov    %r8,%rdi
0110     77e0:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
0114     77e4:	89 4d c0             	mov    %ecx,-0x40(%rbp)
0117     77e7:	e8 00 00 00 00       	call   77ec <___bpf_prog_run.cold+0x11c>	77e8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
011c     77ec:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
0120     77f0:	8b 4d c0             	mov    -0x40(%rbp),%ecx
0123     77f3:	e9 45 ff ff ff       	jmp    773d <___bpf_prog_run.cold+0x6d>
0128     77f8:	4c 89 cf             	mov    %r9,%rdi
012b     77fb:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
012f     77ff:	e8 00 00 00 00       	call   7804 <___bpf_prog_run.cold+0x134>	7800: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0134     7804:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
0138     7808:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
013c     780c:	eb 84                	jmp    7792 <___bpf_prog_run.cold+0xc2>
013e     780e:	4c 89 c7             	mov    %r8,%rdi
0141     7811:	89 4d b8             	mov    %ecx,-0x48(%rbp)
0144     7814:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
0148     7818:	e8 00 00 00 00       	call   781d <___bpf_prog_run.cold+0x14d>	7819: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
014d     781d:	8b 4d b8             	mov    -0x48(%rbp),%ecx
0150     7820:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0154     7824:	eb 8a                	jmp    77b0 <___bpf_prog_run.cold+0xe0>
0156     7826:	48 63 d1             	movslq %ecx,%rdx
0159     7829:	48 89 c6             	mov    %rax,%rsi
015c     782c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	782f: R_X86_64_32S	.data+0x550c20
0163     7833:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
0167     7837:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
016b     783b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
016f     783f:	e8 00 00 00 00       	call   7844 <___bpf_prog_run.cold+0x174>	7840: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
0174     7844:	4c 8b 4d b8          	mov    -0x48(%rbp),%r9
0178     7848:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
017c     784c:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
0180     7850:	4c 89 ca             	mov    %r9,%rdx
0183     7853:	48 c1 ea 03          	shr    $0x3,%rdx
0187     7857:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
018c     785c:	4c 89 ca             	mov    %r9,%rdx
018f     785f:	83 e2 07             	and    $0x7,%edx
0192     7862:	83 c2 03             	add    $0x3,%edx
0195     7865:	38 ca                	cmp    %cl,%dl
0197     7867:	7c 08                	jl     7871 <___bpf_prog_run.cold+0x1a1>
0199     7869:	84 c9                	test   %cl,%cl
019b     786b:	0f 85 af 00 00 00    	jne    7920 <___bpf_prog_run.cold+0x250>
01a1     7871:	4c 89 c2             	mov    %r8,%rdx
01a4     7874:	4c 89 c6             	mov    %r8,%rsi
01a7     7877:	8b 4b 04             	mov    0x4(%rbx),%ecx
01aa     787a:	48 c1 ea 03          	shr    $0x3,%rdx
01ae     787e:	83 e6 07             	and    $0x7,%esi
01b1     7881:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
01b6     7886:	40 38 f2             	cmp    %sil,%dl
01b9     7889:	7f 08                	jg     7893 <___bpf_prog_run.cold+0x1c3>
01bb     788b:	84 d2                	test   %dl,%dl
01bd     788d:	0f 85 a6 00 00 00    	jne    7939 <___bpf_prog_run.cold+0x269>
01c3     7893:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
01c7     7897:	83 e2 0f             	and    $0xf,%edx
01ca     789a:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
01ce     789e:	e9 00 00 00 00       	jmp    78a3 <___bpf_prog_run.cold+0x1d3>	789f: R_X86_64_PC32	.text+0x52aad2
01d3     78a3:	48 63 d1             	movslq %ecx,%rdx
01d6     78a6:	48 63 f0             	movslq %eax,%rsi
01d9     78a9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	78ac: R_X86_64_32S	.data+0x550ba0
01e0     78b0:	4c 89 4d b0          	mov    %r9,-0x50(%rbp)
01e4     78b4:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
01e8     78b8:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
01ec     78bc:	e8 00 00 00 00       	call   78c1 <___bpf_prog_run.cold+0x1f1>	78bd: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
01f1     78c1:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
01f5     78c5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
01f9     78c9:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
01fd     78cd:	4c 89 ca             	mov    %r9,%rdx
0200     78d0:	48 c1 ea 03          	shr    $0x3,%rdx
0204     78d4:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
0209     78d9:	4c 89 ca             	mov    %r9,%rdx
020c     78dc:	83 e2 07             	and    $0x7,%edx
020f     78df:	83 c2 03             	add    $0x3,%edx
0212     78e2:	38 ca                	cmp    %cl,%dl
0214     78e4:	7c 08                	jl     78ee <___bpf_prog_run.cold+0x21e>
0216     78e6:	84 c9                	test   %cl,%cl
0218     78e8:	0f 85 96 01 00 00    	jne    7a84 <___bpf_prog_run.cold+0x3b4>
021e     78ee:	4c 89 c2             	mov    %r8,%rdx
0221     78f1:	4c 89 c6             	mov    %r8,%rsi
0224     78f4:	8b 4b 04             	mov    0x4(%rbx),%ecx
0227     78f7:	48 c1 ea 03          	shr    $0x3,%rdx
022b     78fb:	83 e6 07             	and    $0x7,%esi
022e     78fe:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
0233     7903:	40 38 f2             	cmp    %sil,%dl
0236     7906:	7f 08                	jg     7910 <___bpf_prog_run.cold+0x240>
0238     7908:	84 d2                	test   %dl,%dl
023a     790a:	0f 85 91 01 00 00    	jne    7aa1 <___bpf_prog_run.cold+0x3d1>
0240     7910:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
0244     7914:	83 e2 0f             	and    $0xf,%edx
0247     7917:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
024b     791b:	e9 00 00 00 00       	jmp    7920 <___bpf_prog_run.cold+0x250>	791c: R_X86_64_PC32	.text+0x52bb1d
0250     7920:	4c 89 cf             	mov    %r9,%rdi
0253     7923:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
0257     7927:	e8 00 00 00 00       	call   792c <___bpf_prog_run.cold+0x25c>	7928: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
025c     792c:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
0260     7930:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0264     7934:	e9 38 ff ff ff       	jmp    7871 <___bpf_prog_run.cold+0x1a1>
0269     7939:	4c 89 c7             	mov    %r8,%rdi
026c     793c:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
0270     7940:	89 4d c0             	mov    %ecx,-0x40(%rbp)
0273     7943:	e8 00 00 00 00       	call   7948 <___bpf_prog_run.cold+0x278>	7944: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0278     7948:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
027c     794c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
027f     794f:	e9 3f ff ff ff       	jmp    7893 <___bpf_prog_run.cold+0x1c3>
0284     7954:	48 63 d1             	movslq %ecx,%rdx
0287     7957:	48 89 c6             	mov    %rax,%rsi
028a     795a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	795d: R_X86_64_32S	.data+0x550b60
0291     7961:	4c 89 4d b0          	mov    %r9,-0x50(%rbp)
0295     7965:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
0299     7969:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
029d     796d:	e8 00 00 00 00       	call   7972 <___bpf_prog_run.cold+0x2a2>	796e: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
02a2     7972:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
02a6     7976:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
02aa     797a:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
02ae     797e:	4c 89 ca             	mov    %r9,%rdx
02b1     7981:	48 c1 ea 03          	shr    $0x3,%rdx
02b5     7985:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
02ba     798a:	4c 89 ca             	mov    %r9,%rdx
02bd     798d:	83 e2 07             	and    $0x7,%edx
02c0     7990:	83 c2 03             	add    $0x3,%edx
02c3     7993:	38 ca                	cmp    %cl,%dl
02c5     7995:	7c 08                	jl     799f <___bpf_prog_run.cold+0x2cf>
02c7     7997:	84 c9                	test   %cl,%cl
02c9     7999:	0f 85 ad 00 00 00    	jne    7a4c <___bpf_prog_run.cold+0x37c>
02cf     799f:	4c 89 c2             	mov    %r8,%rdx
02d2     79a2:	4c 89 c6             	mov    %r8,%rsi
02d5     79a5:	8b 4b 04             	mov    0x4(%rbx),%ecx
02d8     79a8:	48 c1 ea 03          	shr    $0x3,%rdx
02dc     79ac:	83 e6 07             	and    $0x7,%esi
02df     79af:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
02e4     79b4:	40 38 f2             	cmp    %sil,%dl
02e7     79b7:	7f 08                	jg     79c1 <___bpf_prog_run.cold+0x2f1>
02e9     79b9:	84 d2                	test   %dl,%dl
02eb     79bb:	0f 85 a8 00 00 00    	jne    7a69 <___bpf_prog_run.cold+0x399>
02f1     79c1:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
02f5     79c5:	83 e2 0f             	and    $0xf,%edx
02f8     79c8:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
02fc     79cc:	e9 00 00 00 00       	jmp    79d1 <___bpf_prog_run.cold+0x301>	79cd: R_X86_64_PC32	.text+0x52b497
0301     79d1:	89 ca                	mov    %ecx,%edx
0303     79d3:	89 c6                	mov    %eax,%esi
0305     79d5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	79d8: R_X86_64_32S	.data+0x550c60
030c     79dc:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
0310     79e0:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
0314     79e4:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
0318     79e8:	e8 00 00 00 00       	call   79ed <___bpf_prog_run.cold+0x31d>	79e9: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
031d     79ed:	4c 8b 4d b8          	mov    -0x48(%rbp),%r9
0321     79f1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0325     79f5:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
0329     79f9:	4c 89 ca             	mov    %r9,%rdx
032c     79fc:	48 c1 ea 03          	shr    $0x3,%rdx
0330     7a00:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
0335     7a05:	4c 89 ca             	mov    %r9,%rdx
0338     7a08:	83 e2 07             	and    $0x7,%edx
033b     7a0b:	83 c2 03             	add    $0x3,%edx
033e     7a0e:	38 ca                	cmp    %cl,%dl
0340     7a10:	7c 08                	jl     7a1a <___bpf_prog_run.cold+0x34a>
0342     7a12:	84 c9                	test   %cl,%cl
0344     7a14:	0f 85 a2 00 00 00    	jne    7abc <___bpf_prog_run.cold+0x3ec>
034a     7a1a:	4c 89 c2             	mov    %r8,%rdx
034d     7a1d:	4c 89 c6             	mov    %r8,%rsi
0350     7a20:	8b 4b 04             	mov    0x4(%rbx),%ecx
0353     7a23:	48 c1 ea 03          	shr    $0x3,%rdx
0357     7a27:	83 e6 07             	and    $0x7,%esi
035a     7a2a:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
035f     7a2f:	40 38 f2             	cmp    %sil,%dl
0362     7a32:	7f 08                	jg     7a3c <___bpf_prog_run.cold+0x36c>
0364     7a34:	84 d2                	test   %dl,%dl
0366     7a36:	0f 85 99 00 00 00    	jne    7ad5 <___bpf_prog_run.cold+0x405>
036c     7a3c:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
0370     7a40:	83 e2 0f             	and    $0xf,%edx
0373     7a43:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
0377     7a47:	e9 00 00 00 00       	jmp    7a4c <___bpf_prog_run.cold+0x37c>	7a48: R_X86_64_PC32	.text+0x52a181
037c     7a4c:	4c 89 cf             	mov    %r9,%rdi
037f     7a4f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
0383     7a53:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
0387     7a57:	e8 00 00 00 00       	call   7a5c <___bpf_prog_run.cold+0x38c>	7a58: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
038c     7a5c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
0390     7a60:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
0394     7a64:	e9 36 ff ff ff       	jmp    799f <___bpf_prog_run.cold+0x2cf>
0399     7a69:	4c 89 c7             	mov    %r8,%rdi
039c     7a6c:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
03a0     7a70:	89 4d c0             	mov    %ecx,-0x40(%rbp)
03a3     7a73:	e8 00 00 00 00       	call   7a78 <___bpf_prog_run.cold+0x3a8>	7a74: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
03a8     7a78:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
03ac     7a7c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
03af     7a7f:	e9 3d ff ff ff       	jmp    79c1 <___bpf_prog_run.cold+0x2f1>
03b4     7a84:	4c 89 cf             	mov    %r9,%rdi
03b7     7a87:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
03bb     7a8b:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
03bf     7a8f:	e8 00 00 00 00       	call   7a94 <___bpf_prog_run.cold+0x3c4>	7a90: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
03c4     7a94:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
03c8     7a98:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
03cc     7a9c:	e9 4d fe ff ff       	jmp    78ee <___bpf_prog_run.cold+0x21e>
03d1     7aa1:	4c 89 c7             	mov    %r8,%rdi
03d4     7aa4:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
03d8     7aa8:	89 4d c0             	mov    %ecx,-0x40(%rbp)
03db     7aab:	e8 00 00 00 00       	call   7ab0 <___bpf_prog_run.cold+0x3e0>	7aac: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
03e0     7ab0:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
03e4     7ab4:	8b 4d c0             	mov    -0x40(%rbp),%ecx
03e7     7ab7:	e9 54 fe ff ff       	jmp    7910 <___bpf_prog_run.cold+0x240>
03ec     7abc:	4c 89 cf             	mov    %r9,%rdi
03ef     7abf:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
03f3     7ac3:	e8 00 00 00 00       	call   7ac8 <___bpf_prog_run.cold+0x3f8>	7ac4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
03f8     7ac8:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
03fc     7acc:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0400     7ad0:	e9 45 ff ff ff       	jmp    7a1a <___bpf_prog_run.cold+0x34a>
0405     7ad5:	4c 89 c7             	mov    %r8,%rdi
0408     7ad8:	89 4d b8             	mov    %ecx,-0x48(%rbp)
040b     7adb:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
040f     7adf:	e8 00 00 00 00       	call   7ae4 <___bpf_prog_run.cold+0x414>	7ae0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0414     7ae4:	8b 4d b8             	mov    -0x48(%rbp),%ecx
0417     7ae7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
041b     7aeb:	e9 4c ff ff ff       	jmp    7a3c <___bpf_prog_run.cold+0x36c>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
