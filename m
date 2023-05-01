Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB282F48
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 23:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682983460; x=1714519460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8s2ZjHCkGeOoiplyKPE3ObbtKb9zA+t1345btYDeo8I=;
  b=UjKgoD9L40p9h2jY9fEiVYLShqZK0UglFqGFpoC0FOLtBsLNTqIAtRi+
   f9ZzgJ/QSSJ5kKCTzG9EkraQFWvaibxK7dnqUn+zSaoGHAWIjYL5q0+0a
   1KJF6FjttZkA4o13TGpI/6tT1ADNAjz0B1K/Pw3q00G2TT7BidBSYSc6g
   NztXozSkro9NasuK5mO1FCX8p4Ja4NqPUEBD17swSUewv2E4DNLGFVZ0m
   0jx+VHCzvmrNgPnjwWF2SuFebMVcu0/ttc/kfQWzBzV3WwFtfSxQDQaLd
   RBnxa8YndASeE2FdLswNr8ZT81upolYUlU1AR5PAyk7O9MTjbiav3PQpm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="347072513"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="347072513"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 16:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="760859004"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="760859004"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 May 2023 16:24:17 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptcsS-0000hE-1B;
	Mon, 01 May 2023 23:24:16 +0000
Date: Tue, 2 May 2023 07:23:43 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-rolling-lts 859/2595] vmlinux.o: warning: objtool:
 early_init_dt_scan_memory+0x18c: unreachable instruction
Message-ID: <202305020713.UEAuTXeN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-lts
head:   772b2aaa4bf2ca50577dfd18dad5a35fe97e2408
commit: 982f8ef8ec7e9a4cdb110d020c6be12ae9a6fbce [859/2595] context_tracking: Fix noinstr vs KASAN
config: x86_64-randconfig-r034-20230501 (https://download.01.org/0day-ci/archive/20230502/202305020713.UEAuTXeN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=982f8ef8ec7e9a4cdb110d020c6be12ae9a6fbce
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-rolling-lts
        git checkout 982f8ef8ec7e9a4cdb110d020c6be12ae9a6fbce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020713.UEAuTXeN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: early_init_dt_scan_memory+0x18c: unreachable instruction


objdump-func vmlinux.o early_init_dt_scan_memory:
0000 00000000000a660a <early_init_dt_scan_memory>:
0000    a660a:	f3 0f 1e fa          	endbr64
0004    a660e:	41 57                	push   %r15
0006    a6610:	31 f6                	xor    %esi,%esi
0008    a6612:	41 56                	push   %r14
000a    a6614:	45 31 f6             	xor    %r14d,%r14d
000d    a6617:	41 55                	push   %r13
000f    a6619:	41 54                	push   %r12
0011    a661b:	55                   	push   %rbp
0012    a661c:	53                   	push   %rbx
0013    a661d:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
0017    a6621:	48 c7 44 24 20 b3 8a b5 41 	movq   $0x41b58ab3,0x20(%rsp)
0020    a662a:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
0025    a662f:	48 c7 44 24 28 00 00 00 00 	movq   $0x0,0x28(%rsp)	a6634: R_X86_64_32S	.rodata.str1.1+0x224064
002e    a6638:	48 c1 e8 03          	shr    $0x3,%rax
0032    a663c:	48 89 04 24          	mov    %rax,(%rsp)
0036    a6640:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
003b    a6645:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	a664a: R_X86_64_32S	.init.text+0xa660a
0044    a664e:	48 c1 e0 2a          	shl    $0x2a,%rax
0048    a6652:	48 03 04 24          	add    (%rsp),%rax
004c    a6656:	c7 00 f1 f1 f1 f1    	movl   $0xf1f1f1f1,(%rax)
0052    a665c:	c7 40 04 f1 f1 04 f2 	movl   $0xf204f1f1,0x4(%rax)
0059    a6663:	c7 40 08 00 f3 f3 f3 	movl   $0xf3f3f300,0x8(%rax)
0060    a666a:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # a6671 <early_init_dt_scan_memory+0x67>	a666d: R_X86_64_PC32	initial_boot_params-0x4
0067    a6671:	48 89 df             	mov    %rbx,%rdi
006a    a6674:	e8 00 00 00 00       	call   a6679 <early_init_dt_scan_memory+0x6f>	a6675: R_X86_64_PLT32	fdt_first_subnode-0x4
006f    a6679:	89 c5                	mov    %eax,%ebp
0071    a667b:	85 ed                	test   %ebp,%ebp
0073    a667d:	0f 88 53 01 00 00    	js     a67d6 <early_init_dt_scan_memory+0x1cc>
0079    a6683:	4c 63 e5             	movslq %ebp,%r12
007c    a6686:	31 d2                	xor    %edx,%edx
007e    a6688:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	a668b: R_X86_64_32S	.rodata+0xb2cc60
0085    a668f:	4c 89 e7             	mov    %r12,%rdi
0088    a6692:	e8 00 00 00 00       	call   a6697 <early_init_dt_scan_memory+0x8d>	a6693: R_X86_64_PLT32	of_get_flat_dt_prop-0x4
008d    a6697:	48 89 c7             	mov    %rax,%rdi
0090    a669a:	48 85 c0             	test   %rax,%rax
0093    a669d:	0f 84 22 01 00 00    	je     a67c5 <early_init_dt_scan_memory+0x1bb>
0099    a66a3:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	a66a6: R_X86_64_32S	.rodata+0xb2cca0
00a0    a66aa:	e8 00 00 00 00       	call   a66af <early_init_dt_scan_memory+0xa5>	a66ab: R_X86_64_PLT32	strcmp-0x4
00a5    a66af:	85 c0                	test   %eax,%eax
00a7    a66b1:	0f 85 0e 01 00 00    	jne    a67c5 <early_init_dt_scan_memory+0x1bb>
00ad    a66b7:	4c 89 e6             	mov    %r12,%rsi
00b0    a66ba:	48 89 df             	mov    %rbx,%rdi
00b3    a66bd:	e8 00 00 00 00       	call   a66c2 <early_init_dt_scan_memory+0xb8>	a66be: R_X86_64_PC32	.text.unlikely+0x3c992
00b8    a66c2:	84 c0                	test   %al,%al
00ba    a66c4:	0f 84 fb 00 00 00    	je     a67c5 <early_init_dt_scan_memory+0x1bb>
00c0    a66ca:	48 8d 54 24 50       	lea    0x50(%rsp),%rdx
00c5    a66cf:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	a66d2: R_X86_64_32S	.rodata+0xb2cce0
00cc    a66d6:	4c 89 e7             	mov    %r12,%rdi
00cf    a66d9:	e8 00 00 00 00       	call   a66de <early_init_dt_scan_memory+0xd4>	a66da: R_X86_64_PLT32	of_get_flat_dt_prop-0x4
00d4    a66de:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
00d9    a66e3:	48 85 c0             	test   %rax,%rax
00dc    a66e6:	75 19                	jne    a6701 <early_init_dt_scan_memory+0xf7>
00de    a66e8:	48 8d 54 24 50       	lea    0x50(%rsp),%rdx
00e3    a66ed:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	a66f0: R_X86_64_32S	.rodata+0xb2c4a0
00ea    a66f4:	4c 89 e7             	mov    %r12,%rdi
00ed    a66f7:	e8 00 00 00 00       	call   a66fc <early_init_dt_scan_memory+0xf2>	a66f8: R_X86_64_PLT32	of_get_flat_dt_prop-0x4
00f2    a66fc:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
00f7    a6701:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
00fc    a6706:	48 85 d2             	test   %rdx,%rdx
00ff    a6709:	0f 84 b6 00 00 00    	je     a67c5 <early_init_dt_scan_memory+0x1bb>
0105    a670f:	48 63 44 24 50       	movslq 0x50(%rsp),%rax
010a    a6714:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	a6717: R_X86_64_32S	.rodata+0xb2cd20
0111    a671b:	4c 89 e7             	mov    %r12,%rdi
0114    a671e:	48 83 e0 fc          	and    $0xfffffffffffffffc,%rax
0118    a6722:	48 01 d0             	add    %rdx,%rax
011b    a6725:	31 d2                	xor    %edx,%edx
011d    a6727:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
0122    a672c:	e8 00 00 00 00       	call   a6731 <early_init_dt_scan_memory+0x127>	a672d: R_X86_64_PLT32	of_get_flat_dt_prop-0x4
0127    a6731:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
012c    a6736:	4c 8d 7c 24 60       	lea    0x60(%rsp),%r15
0131    a673b:	8b 3d 00 00 00 00    	mov    0x0(%rip),%edi        # a6741 <early_init_dt_scan_memory+0x137>	a673d: R_X86_64_PC32	dt_root_addr_cells-0x4
0137    a6741:	44 8b 05 00 00 00 00 	mov    0x0(%rip),%r8d        # a6748 <early_init_dt_scan_memory+0x13e>	a6744: R_X86_64_PC32	dt_root_size_cells-0x4
013e    a6748:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
0143    a674d:	48 2b 54 24 60       	sub    0x60(%rsp),%rdx
0148    a6752:	42 8d 04 07          	lea    (%rdi,%r8,1),%eax
014c    a6756:	48 c1 fa 02          	sar    $0x2,%rdx
0150    a675a:	48 98                	cltq
0152    a675c:	48 39 c2             	cmp    %rax,%rdx
0155    a675f:	7c 64                	jl     a67c5 <early_init_dt_scan_memory+0x1bb>
0157    a6761:	4c 89 fe             	mov    %r15,%rsi
015a    a6764:	44 89 44 24 1c       	mov    %r8d,0x1c(%rsp)
015f    a6769:	e8 00 00 00 00       	call   a676e <early_init_dt_scan_memory+0x164>	a676a: R_X86_64_PLT32	dt_mem_next_cell-0x4
0164    a676e:	8b 7c 24 1c          	mov    0x1c(%rsp),%edi
0168    a6772:	4c 89 fe             	mov    %r15,%rsi
016b    a6775:	49 89 c4             	mov    %rax,%r12
016e    a6778:	e8 00 00 00 00       	call   a677d <early_init_dt_scan_memory+0x173>	a6779: R_X86_64_PLT32	dt_mem_next_cell-0x4
0173    a677d:	49 89 c5             	mov    %rax,%r13
0176    a6780:	48 85 c0             	test   %rax,%rax
0179    a6783:	74 b6                	je     a673b <early_init_dt_scan_memory+0x131>
017b    a6785:	48 89 c6             	mov    %rax,%rsi
017e    a6788:	4c 89 e7             	mov    %r12,%rdi
0181    a678b:	41 be 01 00 00 00    	mov    $0x1,%r14d
0187    a6791:	e8 00 00 00 00       	call   a6796 <early_init_dt_scan_memory+0x18c>	a6792: R_X86_64_PLT32	early_init_dt_add_memory_arch-0x4
018c    a6796:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
0192    a679c:	74 9d                	je     a673b <early_init_dt_scan_memory+0x131>
0194    a679e:	4c 89 ee             	mov    %r13,%rsi
0197    a67a1:	4c 89 e7             	mov    %r12,%rdi
019a    a67a4:	e8 00 00 00 00       	call   a67a9 <early_init_dt_scan_memory+0x19f>	a67a5: R_X86_64_PLT32	memblock_mark_hotplug-0x4
019f    a67a9:	85 c0                	test   %eax,%eax
01a1    a67ab:	74 8e                	je     a673b <early_init_dt_scan_memory+0x131>
01a3    a67ad:	4b 8d 14 2c          	lea    (%r12,%r13,1),%rdx
01a7    a67b1:	4c 89 e6             	mov    %r12,%rsi
01aa    a67b4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	a67b7: R_X86_64_32S	.rodata+0xb2cd60
01b1    a67bb:	e8 00 00 00 00       	call   a67c0 <early_init_dt_scan_memory+0x1b6>	a67bc: R_X86_64_PLT32	_printk-0x4
01b6    a67c0:	e9 76 ff ff ff       	jmp    a673b <early_init_dt_scan_memory+0x131>
01bb    a67c5:	89 ee                	mov    %ebp,%esi
01bd    a67c7:	48 89 df             	mov    %rbx,%rdi
01c0    a67ca:	e8 00 00 00 00       	call   a67cf <early_init_dt_scan_memory+0x1c5>	a67cb: R_X86_64_PLT32	fdt_next_subnode-0x4
01c5    a67cf:	89 c5                	mov    %eax,%ebp
01c7    a67d1:	e9 a5 fe ff ff       	jmp    a667b <early_init_dt_scan_memory+0x71>
01cc    a67d6:	48 8b 14 24          	mov    (%rsp),%rdx
01d0    a67da:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
01d5    a67df:	b9 03 00 00 00       	mov    $0x3,%ecx
01da    a67e4:	48 c1 e0 2a          	shl    $0x2a,%rax
01de    a67e8:	48 01 c2             	add    %rax,%rdx
01e1    a67eb:	31 c0                	xor    %eax,%eax
01e3    a67ed:	48 89 d7             	mov    %rdx,%rdi
01e6    a67f0:	f3 ab                	rep stos %eax,%es:(%rdi)
01e8    a67f2:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
01ec    a67f6:	44 89 f0             	mov    %r14d,%eax
01ef    a67f9:	5b                   	pop    %rbx
01f0    a67fa:	5d                   	pop    %rbp
01f1    a67fb:	41 5c                	pop    %r12
01f3    a67fd:	41 5d                	pop    %r13
01f5    a67ff:	41 5e                	pop    %r14
01f7    a6801:	41 5f                	pop    %r15
01f9    a6803:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
