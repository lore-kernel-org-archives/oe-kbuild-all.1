Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A062C33EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 00:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715388405; cv=none; b=dCYCW7Khdu8BBZ/y/VjJ2CcyamNpN1uvmOnbcb/VBWCPZUi1J9AH9N7rr/L8n7JdA95QRh9oYGQ2z9QmhTcECKNYRhznDzFvum70R4tdMJE/6PdJo3WJQR+nBi/19TGp5HlxAZhLamQ0ZCDrNfa1/LQJaM4zuAIlIINTSYadSis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715388405; c=relaxed/simple;
	bh=T7u8akBw8URDQlkhLmSDN54xoPaQZgGl9vygdIAZAMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E5wkCj4XWOHIzpgcyGX5vs2xQAa7Ddmy8qLICq41vMjc6Zn5pYq6YQtnNDplHxDKHwfkxRuBzqPSktdSQxNZUltOY1Z05mu6oB2szqYMQydZTEI7kIKqllNrv1DlTXlLHvvRH/rGE2GWGb4/VSAsMxJBGxIF14WPAxEtjfbxdfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvID/j+v; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvID/j+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715388403; x=1746924403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T7u8akBw8URDQlkhLmSDN54xoPaQZgGl9vygdIAZAMs=;
  b=LvID/j+vCqVANGEo6hPI83kRkGb7+vQch3Nb3i9YIWzhHUwc+IDKWa0g
   F9X8ySxcFzXCZpwYGOa+1MWvYF0f4Hey3zYfSYNF+H4P77/lu70vpSpyn
   GmtKO58AqapfK2nCQMLqS6SqcaAQeBuqgPVoHd9TyKeORuYMnn4WnO5S/
   WSs6mUDfCUYz8tGztHt4FGeiu9C4Y/fcA7PJOjG39tbN1aJ4w+JIfOysO
   oqpj2wzQOV+MkMDmdkbpDRQ5lrcHQg6WbvWZXZ0zj+uXJYnxt8CxltxeN
   JRsjmLz+atVWeaCccAL4HwmhSSLHYRgVUVNKHYUs2LAXabOYzu4qYD9UC
   g==;
X-CSE-ConnectionGUID: IZKR7B/iR+i9zVcHZgEvXg==
X-CSE-MsgGUID: ty0cZ7/tToa+l+0Puvnl5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11227621"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="11227621"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 17:46:41 -0700
X-CSE-ConnectionGUID: 6Rq7WQJrSgS5DVIlqg8IgQ==
X-CSE-MsgGUID: ohZs8lCpRNuLzbrUXEIWtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="34454536"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2024 17:46:39 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5asm-0006kH-1a;
	Sat, 11 May 2024 00:46:36 +0000
Date: Sat, 11 May 2024 08:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chandan Babu R <chandanbabu@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [linux-next:master 6152/12533] vmlinux.o: warning: objtool:
 __xfs_btree_check_lblock_hdr+0x4e: relocation to !ENDBR: .text+0x10f094f
Message-ID: <202405110829.gk7XpImq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   75fa778d74b786a1608d55d655d42b480a6fa8bd
commit: 4887e53163825189c70a0db4f13b42eae8798625 [6152/12533] xfs: compile out v4 support if disabled
config: x86_64-buildonly-randconfig-r006-20211105 (https://download.01.org/0day-ci/archive/20240511/202405110829.gk7XpImq-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110829.gk7XpImq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110829.gk7XpImq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ni_read_frame() falls through to next function ovl_copy_up_tmpfile.cold()
   vmlinux.o: warning: objtool: ovl_copy_up_tmpfile() falls through to next function MR_BuildRaidContext.cold()
   vmlinux.o: warning: objtool: do_syscall_64+0x75: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_spurious_fault+0x1d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_debug_user+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x9a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x1a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x84: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0xd: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x68: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x7b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock_noinstr+0x7f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x3f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x27: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x25: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter.constprop.0+0x21: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit.constprop.0+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x30: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x24: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x29: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __xfs_btree_check_lblock_hdr+0x4e: relocation to !ENDBR: .text+0x10f094f


objdump-func vmlinux.o __xfs_btree_check_lblock_hdr:
0000 00000000010f04f0 <__xfs_btree_check_lblock_hdr.part.0>:
0000  10f04f0:	48 83 ec 38          	sub    $0x38,%rsp
0004  10f04f4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
000e  10f04fe:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f0505 <__xfs_btree_check_lblock_hdr.part.0+0x15>	10f0501: R_X86_64_PC32	_ftrace_branch+0x326874
0015  10f0505:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
001a  10f050a:	48 89 f3             	mov    %rsi,%rbx
001d  10f050d:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
0022  10f0512:	48 89 fd             	mov    %rdi,%rbp
0025  10f0515:	48 8d 7b 18          	lea    0x18(%rbx),%rdi
0029  10f0519:	89 d6                	mov    %edx,%esi
002b  10f051b:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
0030  10f0520:	48 89 fa             	mov    %rdi,%rdx
0033  10f0523:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
0038  10f0528:	48 c1 ea 03          	shr    $0x3,%rdx
003c  10f052c:	4c 89 74 24 30       	mov    %r14,0x30(%rsp)
0041  10f0531:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0045  10f0535:	0f 85 cc 02 00 00    	jne    10f0807 <__xfs_btree_check_lblock_hdr.part.0+0x317>
004b  10f053b:	48 85 c9             	test   %rcx,%rcx
004e  10f053e:	4c 8b 6b 18          	mov    0x18(%rbx),%r13
0052  10f0542:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
0059  10f0549:	74 4b                	je     10f0596 <__xfs_btree_check_lblock_hdr.part.0+0xa6>
005b  10f054b:	48 8d b9 50 02 00 00 	lea    0x250(%rcx),%rdi
0062  10f0552:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
006c  10f055c:	48 89 fa             	mov    %rdi,%rdx
006f  10f055f:	48 c1 ea 03          	shr    $0x3,%rdx
0073  10f0563:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0077  10f0567:	0f 85 cb 02 00 00    	jne    10f0838 <__xfs_btree_check_lblock_hdr.part.0+0x348>
007d  10f056d:	4c 8b a1 50 02 00 00 	mov    0x250(%rcx),%r12
0084  10f0574:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
008e  10f057e:	4c 89 e2             	mov    %r12,%rdx
0091  10f0581:	48 c1 ea 03          	shr    $0x3,%rdx
0095  10f0585:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0099  10f0589:	0f 85 94 02 00 00    	jne    10f0823 <__xfs_btree_check_lblock_hdr.part.0+0x333>
009f  10f058f:	49 8b 04 24          	mov    (%r12),%rax
00a3  10f0593:	48 0f c8             	bswap  %rax
00a6  10f0596:	49 39 c5             	cmp    %rax,%r13
00a9  10f0599:	74 30                	je     10f05cb <__xfs_btree_check_lblock_hdr.part.0+0xdb>
00ab  10f059b:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f05a2 <__xfs_btree_check_lblock_hdr.part.0+0xb2>	10f059e: R_X86_64_PC32	_ftrace_branch+0x326854
00b2  10f05a2:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	10f05a5: R_X86_64_32S	.text+0x10f059b
00b9  10f05a9:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
00be  10f05ae:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
00c3  10f05b3:	4c 8b 64 24 20       	mov    0x20(%rsp),%r12
00c8  10f05b8:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
00cd  10f05bd:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
00d2  10f05c2:	48 83 c4 38          	add    $0x38,%rsp
00d6  10f05c6:	e9 00 00 00 00       	jmp    10f05cb <__xfs_btree_check_lblock_hdr.part.0+0xdb>	10f05c7: R_X86_64_PLT32	__x86_return_thunk-0x4
00db  10f05cb:	48 8d 7b 44          	lea    0x44(%rbx),%rdi
00df  10f05cf:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00e9  10f05d9:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f05e0 <__xfs_btree_check_lblock_hdr.part.0+0xf0>	10f05dc: R_X86_64_PC32	_ftrace_branch+0x32684c
00f0  10f05e0:	48 89 fa             	mov    %rdi,%rdx
00f3  10f05e3:	48 c1 ea 03          	shr    $0x3,%rdx
00f7  10f05e7:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
00fb  10f05eb:	48 89 f8             	mov    %rdi,%rax
00fe  10f05ee:	83 e0 07             	and    $0x7,%eax
0101  10f05f1:	83 c0 03             	add    $0x3,%eax
0104  10f05f4:	38 d0                	cmp    %dl,%al
0106  10f05f6:	7c 08                	jl     10f0600 <__xfs_btree_check_lblock_hdr.part.0+0x110>
0108  10f05f8:	84 d2                	test   %dl,%dl
010a  10f05fa:	0f 85 ce 01 00 00    	jne    10f07ce <__xfs_btree_check_lblock_hdr.part.0+0x2de>
0110  10f0600:	8b 43 44             	mov    0x44(%rbx),%eax
0113  10f0603:	85 c0                	test   %eax,%eax
0115  10f0605:	0f 85 03 01 00 00    	jne    10f070e <__xfs_btree_check_lblock_hdr.part.0+0x21e>
011b  10f060b:	48 89 da             	mov    %rbx,%rdx
011e  10f060e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0128  10f0618:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f061f <__xfs_btree_check_lblock_hdr.part.0+0x12f>	10f061b: R_X86_64_PC32	_ftrace_branch+0x326824
012f  10f061f:	48 c1 ea 03          	shr    $0x3,%rdx
0133  10f0623:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0137  10f0627:	84 c0                	test   %al,%al
0139  10f0629:	74 08                	je     10f0633 <__xfs_btree_check_lblock_hdr.part.0+0x143>
013b  10f062b:	3c 03                	cmp    $0x3,%al
013d  10f062d:	0f 8e bf 01 00 00    	jle    10f07f2 <__xfs_btree_check_lblock_hdr.part.0+0x302>
0143  10f0633:	48 8d 7d 10          	lea    0x10(%rbp),%rdi
0147  10f0637:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0151  10f0641:	44 8b 33             	mov    (%rbx),%r14d
0154  10f0644:	48 89 fa             	mov    %rdi,%rdx
0157  10f0647:	48 c1 ea 03          	shr    $0x3,%rdx
015b  10f064b:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
015f  10f064f:	0f 85 ff 01 00 00    	jne    10f0854 <__xfs_btree_check_lblock_hdr.part.0+0x364>
0165  10f0655:	4c 8b 65 10          	mov    0x10(%rbp),%r12
0169  10f0659:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0173  10f0663:	49 8d bc 24 b0 00 00 00 	lea    0xb0(%r12),%rdi
017b  10f066b:	48 89 fa             	mov    %rdi,%rdx
017e  10f066e:	48 c1 ea 03          	shr    $0x3,%rdx
0182  10f0672:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0186  10f0676:	0f 85 ea 01 00 00    	jne    10f0866 <__xfs_btree_check_lblock_hdr.part.0+0x376>
018c  10f067c:	4d 8b ac 24 b0 00 00 00 	mov    0xb0(%r12),%r13
0194  10f0684:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
019e  10f068e:	49 8d 7d 0c          	lea    0xc(%r13),%rdi
01a2  10f0692:	48 89 fa             	mov    %rdi,%rdx
01a5  10f0695:	48 c1 ea 03          	shr    $0x3,%rdx
01a9  10f0699:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
01ad  10f069d:	48 89 f8             	mov    %rdi,%rax
01b0  10f06a0:	83 e0 07             	and    $0x7,%eax
01b3  10f06a3:	83 c0 03             	add    $0x3,%eax
01b6  10f06a6:	38 d0                	cmp    %dl,%al
01b8  10f06a8:	7c 08                	jl     10f06b2 <__xfs_btree_check_lblock_hdr.part.0+0x1c2>
01ba  10f06aa:	84 d2                	test   %dl,%dl
01bc  10f06ac:	0f 85 2e 01 00 00    	jne    10f07e0 <__xfs_btree_check_lblock_hdr.part.0+0x2f0>
01c2  10f06b2:	45 3b 75 0c          	cmp    0xc(%r13),%r14d
01c6  10f06b6:	75 69                	jne    10f0721 <__xfs_btree_check_lblock_hdr.part.0+0x231>
01c8  10f06b8:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
01cc  10f06bc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01d6  10f06c6:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f06cd <__xfs_btree_check_lblock_hdr.part.0+0x1dd>	10f06c9: R_X86_64_PC32	_ftrace_branch+0x3267fc
01dd  10f06cd:	48 89 fa             	mov    %rdi,%rdx
01e0  10f06d0:	48 c1 ea 03          	shr    $0x3,%rdx
01e4  10f06d4:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
01e8  10f06d8:	48 89 f8             	mov    %rdi,%rax
01eb  10f06db:	83 e0 07             	and    $0x7,%eax
01ee  10f06de:	ff c0                	inc    %eax
01f0  10f06e0:	38 d0                	cmp    %dl,%al
01f2  10f06e2:	7c 08                	jl     10f06ec <__xfs_btree_check_lblock_hdr.part.0+0x1fc>
01f4  10f06e4:	84 d2                	test   %dl,%dl
01f6  10f06e6:	0f 85 8c 01 00 00    	jne    10f0878 <__xfs_btree_check_lblock_hdr.part.0+0x388>
01fc  10f06ec:	0f b7 43 04          	movzwl 0x4(%rbx),%eax
0200  10f06f0:	66 c1 c0 08          	rol    $0x8,%ax
0204  10f06f4:	0f b7 c0             	movzwl %ax,%eax
0207  10f06f7:	39 f0                	cmp    %esi,%eax
0209  10f06f9:	74 39                	je     10f0734 <__xfs_btree_check_lblock_hdr.part.0+0x244>
020b  10f06fb:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f0702 <__xfs_btree_check_lblock_hdr.part.0+0x212>	10f06fe: R_X86_64_PC32	_ftrace_branch+0x3267dc
0212  10f0702:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	10f0705: R_X86_64_32S	.text+0x10f06fb
0219  10f0709:	e9 9b fe ff ff       	jmp    10f05a9 <__xfs_btree_check_lblock_hdr.part.0+0xb9>
021e  10f070e:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f0715 <__xfs_btree_check_lblock_hdr.part.0+0x225>	10f0711: R_X86_64_PC32	_ftrace_branch+0x32682c
0225  10f0715:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	10f0718: R_X86_64_32S	.text+0x10f070e
022c  10f071c:	e9 88 fe ff ff       	jmp    10f05a9 <__xfs_btree_check_lblock_hdr.part.0+0xb9>
0231  10f0721:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f0728 <__xfs_btree_check_lblock_hdr.part.0+0x238>	10f0724: R_X86_64_PC32	_ftrace_branch+0x326804
0238  10f0728:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	10f072b: R_X86_64_32S	.text+0x10f0721
023f  10f072f:	e9 75 fe ff ff       	jmp    10f05a9 <__xfs_btree_check_lblock_hdr.part.0+0xb9>
0244  10f0734:	48 8d 7b 06          	lea    0x6(%rbx),%rdi
0248  10f0738:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0252  10f0742:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f0749 <__xfs_btree_check_lblock_hdr.part.0+0x259>	10f0745: R_X86_64_PC32	_ftrace_branch+0x3267d4
0259  10f0749:	48 89 fa             	mov    %rdi,%rdx
025c  10f074c:	48 c1 ea 03          	shr    $0x3,%rdx
0260  10f0750:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0264  10f0754:	48 89 f8             	mov    %rdi,%rax
0267  10f0757:	83 e0 07             	and    $0x7,%eax
026a  10f075a:	ff c0                	inc    %eax
026c  10f075c:	38 d0                	cmp    %dl,%al
026e  10f075e:	7c 11                	jl     10f0771 <__xfs_btree_check_lblock_hdr.part.0+0x281>
0270  10f0760:	84 d2                	test   %dl,%dl
0272  10f0762:	74 0d                	je     10f0771 <__xfs_btree_check_lblock_hdr.part.0+0x281>
0274  10f0764:	89 74 24 04          	mov    %esi,0x4(%rsp)
0278  10f0768:	e8 00 00 00 00       	call   10f076d <__xfs_btree_check_lblock_hdr.part.0+0x27d>	10f0769: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
027d  10f076d:	8b 74 24 04          	mov    0x4(%rsp),%esi
0281  10f0771:	0f b7 5b 06          	movzwl 0x6(%rbx),%ebx
0285  10f0775:	49 8d 7c 24 70       	lea    0x70(%r12),%rdi
028a  10f077a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0294  10f0784:	48 89 fa             	mov    %rdi,%rdx
0297  10f0787:	48 c1 ea 03          	shr    $0x3,%rdx
029b  10f078b:	66 c1 c3 08          	rol    $0x8,%bx
029f  10f078f:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
02a3  10f0793:	0f b7 db             	movzwl %bx,%ebx
02a6  10f0796:	0f 85 ee 00 00 00    	jne    10f088a <__xfs_btree_check_lblock_hdr.part.0+0x39a>
02ac  10f079c:	49 8b 44 24 70       	mov    0x70(%r12),%rax
02b1  10f07a1:	48 89 ef             	mov    %rbp,%rdi
02b4  10f07a4:	e8 00 00 00 00       	call   10f07a9 <__xfs_btree_check_lblock_hdr.part.0+0x2b9>	10f07a5: R_X86_64_PLT32	__x86_indirect_thunk_rax-0x4
02b9  10f07a9:	39 c3                	cmp    %eax,%ebx
02bb  10f07ab:	7e 13                	jle    10f07c0 <__xfs_btree_check_lblock_hdr.part.0+0x2d0>
02bd  10f07ad:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f07b4 <__xfs_btree_check_lblock_hdr.part.0+0x2c4>	10f07b0: R_X86_64_PC32	_ftrace_branch+0x3267b4
02c4  10f07b4:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	10f07b7: R_X86_64_32S	.text+0x10f07ad
02cb  10f07bb:	e9 e9 fd ff ff       	jmp    10f05a9 <__xfs_btree_check_lblock_hdr.part.0+0xb9>
02d0  10f07c0:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f07c7 <__xfs_btree_check_lblock_hdr.part.0+0x2d7>	10f07c3: R_X86_64_PC32	_ftrace_branch+0x3267ac
02d7  10f07c7:	31 c0                	xor    %eax,%eax
02d9  10f07c9:	e9 db fd ff ff       	jmp    10f05a9 <__xfs_btree_check_lblock_hdr.part.0+0xb9>
02de  10f07ce:	89 74 24 04          	mov    %esi,0x4(%rsp)
02e2  10f07d2:	e8 00 00 00 00       	call   10f07d7 <__xfs_btree_check_lblock_hdr.part.0+0x2e7>	10f07d3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
02e7  10f07d7:	8b 74 24 04          	mov    0x4(%rsp),%esi
02eb  10f07db:	e9 20 fe ff ff       	jmp    10f0600 <__xfs_btree_check_lblock_hdr.part.0+0x110>
02f0  10f07e0:	89 74 24 04          	mov    %esi,0x4(%rsp)
02f4  10f07e4:	e8 00 00 00 00       	call   10f07e9 <__xfs_btree_check_lblock_hdr.part.0+0x2f9>	10f07e5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
02f9  10f07e9:	8b 74 24 04          	mov    0x4(%rsp),%esi
02fd  10f07ed:	e9 c0 fe ff ff       	jmp    10f06b2 <__xfs_btree_check_lblock_hdr.part.0+0x1c2>
0302  10f07f2:	48 89 df             	mov    %rbx,%rdi
0305  10f07f5:	89 74 24 04          	mov    %esi,0x4(%rsp)
0309  10f07f9:	e8 00 00 00 00       	call   10f07fe <__xfs_btree_check_lblock_hdr.part.0+0x30e>	10f07fa: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
030e  10f07fe:	8b 74 24 04          	mov    0x4(%rsp),%esi
0312  10f0802:	e9 2c fe ff ff       	jmp    10f0633 <__xfs_btree_check_lblock_hdr.part.0+0x143>
0317  10f0807:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
031c  10f080c:	89 74 24 04          	mov    %esi,0x4(%rsp)
0320  10f0810:	e8 00 00 00 00       	call   10f0815 <__xfs_btree_check_lblock_hdr.part.0+0x325>	10f0811: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0325  10f0815:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
032a  10f081a:	8b 74 24 04          	mov    0x4(%rsp),%esi
032e  10f081e:	e9 18 fd ff ff       	jmp    10f053b <__xfs_btree_check_lblock_hdr.part.0+0x4b>
0333  10f0823:	4c 89 e7             	mov    %r12,%rdi
0336  10f0826:	89 74 24 04          	mov    %esi,0x4(%rsp)
033a  10f082a:	e8 00 00 00 00       	call   10f082f <__xfs_btree_check_lblock_hdr.part.0+0x33f>	10f082b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
033f  10f082f:	8b 74 24 04          	mov    0x4(%rsp),%esi
0343  10f0833:	e9 57 fd ff ff       	jmp    10f058f <__xfs_btree_check_lblock_hdr.part.0+0x9f>
0348  10f0838:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
034d  10f083d:	89 74 24 04          	mov    %esi,0x4(%rsp)
0351  10f0841:	e8 00 00 00 00       	call   10f0846 <__xfs_btree_check_lblock_hdr.part.0+0x356>	10f0842: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0356  10f0846:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
035b  10f084b:	8b 74 24 04          	mov    0x4(%rsp),%esi
035f  10f084f:	e9 19 fd ff ff       	jmp    10f056d <__xfs_btree_check_lblock_hdr.part.0+0x7d>
0364  10f0854:	89 74 24 04          	mov    %esi,0x4(%rsp)
0368  10f0858:	e8 00 00 00 00       	call   10f085d <__xfs_btree_check_lblock_hdr.part.0+0x36d>	10f0859: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
036d  10f085d:	8b 74 24 04          	mov    0x4(%rsp),%esi
0371  10f0861:	e9 ef fd ff ff       	jmp    10f0655 <__xfs_btree_check_lblock_hdr.part.0+0x165>
0376  10f0866:	89 74 24 04          	mov    %esi,0x4(%rsp)
037a  10f086a:	e8 00 00 00 00       	call   10f086f <__xfs_btree_check_lblock_hdr.part.0+0x37f>	10f086b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
037f  10f086f:	8b 74 24 04          	mov    0x4(%rsp),%esi
0383  10f0873:	e9 04 fe ff ff       	jmp    10f067c <__xfs_btree_check_lblock_hdr.part.0+0x18c>
0388  10f0878:	89 74 24 04          	mov    %esi,0x4(%rsp)
038c  10f087c:	e8 00 00 00 00       	call   10f0881 <__xfs_btree_check_lblock_hdr.part.0+0x391>	10f087d: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
0391  10f0881:	8b 74 24 04          	mov    0x4(%rsp),%esi
0395  10f0885:	e9 62 fe ff ff       	jmp    10f06ec <__xfs_btree_check_lblock_hdr.part.0+0x1fc>
039a  10f088a:	89 74 24 04          	mov    %esi,0x4(%rsp)
039e  10f088e:	e8 00 00 00 00       	call   10f0893 <__xfs_btree_check_lblock_hdr.part.0+0x3a3>	10f088f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03a3  10f0893:	8b 74 24 04          	mov    0x4(%rsp),%esi
03a7  10f0897:	e9 00 ff ff ff       	jmp    10f079c <__xfs_btree_check_lblock_hdr.part.0+0x2ac>
03ac  10f089c:	0f 1f 40 00          	nopl   0x0(%rax)
0000 00000000010f08b0 <__xfs_btree_check_lblock_hdr>:
0000  10f08b0:	48 83 ec 20          	sub    $0x20,%rsp
0004  10f08b4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
000e  10f08be:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
0013  10f08c3:	48 89 fb             	mov    %rdi,%rbx
0016  10f08c6:	48 83 c7 08          	add    $0x8,%rdi
001a  10f08ca:	49 89 f8             	mov    %rdi,%r8
001d  10f08cd:	49 c1 e8 03          	shr    $0x3,%r8
0021  10f08d1:	41 80 3c 00 00       	cmpb   $0x0,(%r8,%rax,1)
0026  10f08d6:	75 56                	jne    10f092e <__xfs_btree_check_lblock_hdr+0x7e>
0028  10f08d8:	48 8b 43 08          	mov    0x8(%rbx),%rax
002c  10f08dc:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f08e3 <__xfs_btree_check_lblock_hdr+0x33>	10f08df: R_X86_64_PC32	_ftrace_branch+0x3268a4
0033  10f08e3:	48 8d b8 f8 00 00 00 	lea    0xf8(%rax),%rdi
003a  10f08ea:	48 8b 80 f8 00 00 00 	mov    0xf8(%rax),%rax
0041  10f08f1:	48 39 46 28          	cmp    %rax,0x28(%rsi)
0045  10f08f5:	74 1c                	je     10f0913 <__xfs_btree_check_lblock_hdr+0x63>
0047  10f08f7:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f08fe <__xfs_btree_check_lblock_hdr+0x4e>	10f08fa: R_X86_64_PC32	_ftrace_branch+0x32687c
004e  10f08fe:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	10f0901: R_X86_64_32S	.text+0x10f094f
0055  10f0905:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
005a  10f090a:	48 83 c4 20          	add    $0x20,%rsp
005e  10f090e:	e9 00 00 00 00       	jmp    10f0913 <__xfs_btree_check_lblock_hdr+0x63>	10f090f: R_X86_64_PLT32	__x86_return_thunk-0x4
0063  10f0913:	48 8b 47 08          	mov    0x8(%rdi),%rax
0067  10f0917:	48 39 46 30          	cmp    %rax,0x30(%rsi)
006b  10f091b:	75 da                	jne    10f08f7 <__xfs_btree_check_lblock_hdr+0x47>
006d  10f091d:	48 89 df             	mov    %rbx,%rdi
0070  10f0920:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0075  10f0925:	48 83 c4 20          	add    $0x20,%rsp
0079  10f0929:	e9 c2 fb ff ff       	jmp    10f04f0 <__xfs_btree_check_lblock_hdr.part.0>
007e  10f092e:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
0083  10f0933:	89 54 24 0c          	mov    %edx,0xc(%rsp)
0087  10f0937:	48 89 34 24          	mov    %rsi,(%rsp)
008b  10f093b:	e8 00 00 00 00       	call   10f0940 <__xfs_btree_check_lblock_hdr+0x90>	10f093c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0090  10f0940:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
0095  10f0945:	8b 54 24 0c          	mov    0xc(%rsp),%edx
0099  10f0949:	48 8b 34 24          	mov    (%rsp),%rsi
009d  10f094d:	eb 89                	jmp    10f08d8 <__xfs_btree_check_lblock_hdr+0x28>
009f  10f094f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
