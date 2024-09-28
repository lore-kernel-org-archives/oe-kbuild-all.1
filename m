Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1C73D3B3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727519418; cv=none; b=tzyYRaQXNHFME30RtuaTDpZski+pFow3jdAYh1TZxz3SJnhuwYaeLqGYIj8ysOdaSUi5c/8CMvdfQyExhTDKC7S4v92aml8hU67uvmMFhqo5XRo9lwGS/rf2IEz9SzkSbppY80uvkEohnWL+o1dzQReHKRBFcpmP/Hpk9fYRfz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727519418; c=relaxed/simple;
	bh=s0+jUK2zBikt4RDwh2tNufpo/mD44RG4+x+beNgKhmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MF3S7huvRMmSlCD4OiiiLdx8bHfx5yb4U3sbave0k8oncmP1ocpb1mSgxDQO57Oj1ZxAQMji4lw1uA0xGQjMfGYXpLx2RtSmd0n/eDNIwZwQdnODYCF1WgcnuG8mr+qAD6n39Ik+XqKG1xOOFxLsRhD9IcDYIrjlrA7Bp26CfcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJnOZEAR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJnOZEAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727519416; x=1759055416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s0+jUK2zBikt4RDwh2tNufpo/mD44RG4+x+beNgKhmw=;
  b=kJnOZEARK+lQeBsvgDrubEaQa2BC+dcWPVF+0Zd1uQFP3Zlbs0I1pLZZ
   I3vFDsaN1wG36RKOM7ksqMZ367KqxWZ1NqAkiRhrOkqzVB008/rzFRksM
   Wrp/OxkCpFNAe3jUQxEHukkll1fKlhkuV7lBmscYnGVU7CdECJFEK97D8
   OMATFpVsHzugZtZ8XdIabxkkTTirQnCqglWLE5j7bPYYG28PZmjT0WX4h
   mryKL43GBQcYUx8vqdyVfAogjZH1rNz8R6oKrwdBKGpx5wZj/5LIEW0WC
   hFbWXwrhMG8OANEWKOwCBVZL/dRVC4Vu7DAI3ONisrVwOHXUO1DSyHMm+
   A==;
X-CSE-ConnectionGUID: zh4+JoP+Q92SP1MziZr61A==
X-CSE-MsgGUID: IObE9Xk9Tu+umtS/zzgQTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="44127410"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="44127410"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 03:30:13 -0700
X-CSE-ConnectionGUID: 08J4uqjfSXaI7YE5evMXlg==
X-CSE-MsgGUID: r8yVFH2fR1yGddRyR9wZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77312102"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2024 03:30:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suUiG-000N9z-3B;
	Sat, 28 Sep 2024 10:30:08 +0000
Date: Sat, 28 Sep 2024 18:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 9/10] vmlinux.o: warning: objtool:
 apply_alternatives+0x1cf: relocation to !ENDBR: BUG_func+0x4
Message-ID: <202409281811.zidogSwA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   4e155f6fbba48ed677042026d7732c6256ffa166
commit: 76743359658d730ecba565019069d870d30fe3b8 [9/10] x86/ibt: Implement IBT+
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240928/202409281811.zidogSwA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281811.zidogSwA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281811.zidogSwA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: apply_alternatives+0x1cf: relocation to !ENDBR: BUG_func+0x4
   vmlinux.o: warning: objtool: .export_symbol+0xc8: data relocation to !ENDBR: entry_ibpb+0x0
   vmlinux.o: warning: objtool: .export_symbol+0xe8: data relocation to !ENDBR: asm_load_gs_index+0x0
   vmlinux.o: warning: objtool: .export_symbol+0xf8: data relocation to !ENDBR: clear_bhb_loop+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x14148: data relocation to !ENDBR: rdmsr_safe_regs+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x14158: data relocation to !ENDBR: wrmsr_safe_regs+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x14168: data relocation to !ENDBR: __sw_hweight32+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x14178: data relocation to !ENDBR: __sw_hweight64+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x2fed0: data relocation to !ENDBR: clear_page_rep+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x2fee0: data relocation to !ENDBR: clear_page_orig+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x2fef0: data relocation to !ENDBR: clear_page_erms+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x2ff00: data relocation to !ENDBR: rep_stos_alternative+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x2ff20: data relocation to !ENDBR: copy_page+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x2ff30: data relocation to !ENDBR: rep_movs_alternative+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x2ff40: data relocation to !ENDBR: __copy_user_nocache+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30000: data relocation to !ENDBR: __get_user_1+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30010: data relocation to !ENDBR: __get_user_2+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30020: data relocation to !ENDBR: __get_user_4+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30030: data relocation to !ENDBR: __get_user_8+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30040: data relocation to !ENDBR: __get_user_nocheck_1+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30050: data relocation to !ENDBR: __get_user_nocheck_2+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30060: data relocation to !ENDBR: __get_user_nocheck_4+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30070: data relocation to !ENDBR: __get_user_nocheck_8+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x300a0: data relocation to !ENDBR: memmove+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x300b0: data relocation to !ENDBR: memmove+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x300c0: data relocation to !ENDBR: memset+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x300d0: data relocation to !ENDBR: memset+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x300e0: data relocation to !ENDBR: __put_user_1+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x300f0: data relocation to !ENDBR: __put_user_nocheck_1+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30100: data relocation to !ENDBR: __put_user_2+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30110: data relocation to !ENDBR: __put_user_nocheck_2+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30120: data relocation to !ENDBR: __put_user_4+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30130: data relocation to !ENDBR: __put_user_nocheck_4+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30140: data relocation to !ENDBR: __put_user_8+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30150: data relocation to !ENDBR: __put_user_nocheck_8+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30470: data relocation to !ENDBR: entry_untrain_ret+0x0


objdump-func vmlinux.o apply_alternatives:
0000 0000000000048210 <apply_alternatives>:
0000    48210:	f3 0f 1e fa          	endbr64
0004    48214:	e8 00 00 00 00       	call   48219 <apply_alternatives+0x9>	48215: R_X86_64_PLT32	__fentry__-0x4
0009    48219:	41 57                	push   %r15
000b    4821b:	49 89 f7             	mov    %rsi,%r15
000e    4821e:	41 56                	push   %r14
0010    48220:	41 55                	push   %r13
0012    48222:	41 54                	push   %r12
0014    48224:	55                   	push   %rbp
0015    48225:	48 89 fd             	mov    %rdi,%rbp
0018    48228:	53                   	push   %rbx
0019    48229:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
0020    48230:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0029    48239:	48 89 84 24 18 01 00 00 	mov    %rax,0x118(%rsp)
0031    48241:	31 c0                	xor    %eax,%eax
0033    48243:	4c 8d 64 24 1a       	lea    0x1a(%rsp),%r12
0038    48248:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
003d    4824d:	48 c7 44 24 1a 00 00 00 00 	movq   $0x0,0x1a(%rsp)
0046    48256:	48 c7 84 24 10 01 00 00 00 00 00 00 	movq   $0x0,0x110(%rsp)
0052    48262:	4c 89 e1             	mov    %r12,%rcx
0055    48265:	48 29 f9             	sub    %rdi,%rcx
0058    48268:	81 c1 fe 00 00 00    	add    $0xfe,%ecx
005e    4826e:	c1 e9 03             	shr    $0x3,%ecx
0061    48271:	f3 48 ab             	rep stos %rax,%es:(%rdi)
0064    48274:	f6 05 00 00 00 00 01 	testb  $0x1,0x0(%rip)        # 4827b <apply_alternatives+0x6b>	48276: R_X86_64_PC32	.bss+0x9a13
006b    4827b:	0f 85 72 03 00 00    	jne    485f3 <apply_alternatives+0x3e3>
0071    48281:	4c 39 fd             	cmp    %r15,%rbp
0074    48284:	0f 83 67 02 00 00    	jae    484f1 <apply_alternatives+0x2e1>
007a    4828a:	49 89 ed             	mov    %rbp,%r13
007d    4828d:	48 83 c5 0e          	add    $0xe,%rbp
0081    48291:	48 63 5d f2          	movslq -0xe(%rbp),%rbx
0085    48295:	0f b6 55 fe          	movzbl -0x2(%rbp),%edx
0089    48299:	48 8d 75 f2          	lea    -0xe(%rbp),%rsi
008d    4829d:	48 89 e8             	mov    %rbp,%rax
0090    482a0:	4c 39 fd             	cmp    %r15,%rbp
0093    482a3:	72 25                	jb     482ca <apply_alternatives+0xba>
0095    482a5:	e9 74 02 00 00       	jmp    4851e <apply_alternatives+0x30e>
009a    482aa:	0f b6 48 0c          	movzbl 0xc(%rax),%ecx
009e    482ae:	38 ca                	cmp    %cl,%dl
00a0    482b0:	0f 42 d1             	cmovb  %ecx,%edx
00a3    482b3:	48 83 c0 0e          	add    $0xe,%rax
00a7    482b7:	88 50 fe             	mov    %dl,-0x2(%rax)
00aa    482ba:	48 63 5d f2          	movslq -0xe(%rbp),%rbx
00ae    482be:	88 55 fe             	mov    %dl,-0x2(%rbp)
00b1    482c1:	4c 39 f8             	cmp    %r15,%rax
00b4    482c4:	0f 83 54 02 00 00    	jae    4851e <apply_alternatives+0x30e>
00ba    482ca:	48 63 08             	movslq (%rax),%rcx
00bd    482cd:	48 01 f3             	add    %rsi,%rbx
00c0    482d0:	48 01 c1             	add    %rax,%rcx
00c3    482d3:	48 39 cb             	cmp    %rcx,%rbx
00c6    482d6:	74 d2                	je     482aa <apply_alternatives+0x9a>
00c8    482d8:	80 fa ff             	cmp    $0xff,%dl
00cb    482db:	0f 84 49 02 00 00    	je     4852a <apply_alternatives+0x31a>
00d1    482e1:	41 0f b7 45 08       	movzwl 0x8(%r13),%eax
00d6    482e6:	66 3d ff 02          	cmp    $0x2ff,%ax
00da    482ea:	0f 87 f9 02 00 00    	ja     485e9 <apply_alternatives+0x3d9>
00e0    482f0:	48 63 4d f6          	movslq -0xa(%rbp),%rcx
00e4    482f4:	48 0f a3 05 00 00 00 00 	bt     %rax,0x0(%rip)        # 482fc <apply_alternatives+0xec>	482f8: R_X86_64_PC32	boot_cpu_data+0x2c
00ec    482fc:	41 0f b7 55 0a       	movzwl 0xa(%r13),%edx
00f1    48301:	40 0f 93 c6          	setae  %sil
00f5    48305:	40 0f b6 f6          	movzbl %sil,%esi
00f9    48309:	89 d0                	mov    %edx,%eax
00fb    4830b:	f7 d0                	not    %eax
00fd    4830d:	83 e0 01             	and    $0x1,%eax
0100    48310:	66 39 c6             	cmp    %ax,%si
0103    48313:	0f 84 87 02 00 00    	je     485a0 <apply_alternatives+0x390>
0109    48319:	4c 8d 74 0d f6       	lea    -0xa(%rbp,%rcx,1),%r14
010e    4831e:	f6 05 00 00 00 00 01 	testb  $0x1,0x0(%rip)        # 48325 <apply_alternatives+0x115>	48320: R_X86_64_PC32	.bss+0x9a13
0115    48325:	0f 85 35 02 00 00    	jne    48560 <apply_alternatives+0x350>
011b    4832b:	44 0f b6 45 ff       	movzbl -0x1(%rbp),%r8d
0120    48330:	4c 89 c0             	mov    %r8,%rax
0123    48333:	44 89 c1             	mov    %r8d,%ecx
0126    48336:	41 83 f8 08          	cmp    $0x8,%r8d
012a    4833a:	0f 83 ec 01 00 00    	jae    4852c <apply_alternatives+0x31c>
0130    48340:	41 f6 c0 04          	test   $0x4,%r8b
0134    48344:	0f 85 7d 03 00 00    	jne    486c7 <apply_alternatives+0x4b7>
013a    4834a:	85 c9                	test   %ecx,%ecx
013c    4834c:	74 11                	je     4835f <apply_alternatives+0x14f>
013e    4834e:	41 0f b6 36          	movzbl (%r14),%esi
0142    48352:	41 88 34 24          	mov    %sil,(%r12)
0146    48356:	f6 c1 02             	test   $0x2,%cl
0149    48359:	0f 85 7e 03 00 00    	jne    486dd <apply_alternatives+0x4cd>
014f    4835f:	83 e2 02             	and    $0x2,%edx
0152    48362:	0f b6 f8             	movzbl %al,%edi
0155    48365:	0f 84 00 01 00 00    	je     4846b <apply_alternatives+0x25b>
015b    4836b:	0f b6 55 fe          	movzbl -0x2(%rbp),%edx
015f    4836f:	3c 05                	cmp    $0x5,%al
0161    48371:	0f 85 9e 04 00 00    	jne    48815 <apply_alternatives+0x605>
0167    48377:	80 7c 24 1a e8       	cmpb   $0xe8,0x1a(%rsp)
016c    4837c:	0f 85 93 04 00 00    	jne    48815 <apply_alternatives+0x605>
0172    48382:	80 fa 06             	cmp    $0x6,%dl
0175    48385:	0f 85 7c 04 00 00    	jne    48807 <apply_alternatives+0x5f7>
017b    4838b:	80 3b ff             	cmpb   $0xff,(%rbx)
017e    4838e:	0f 85 73 04 00 00    	jne    48807 <apply_alternatives+0x5f7>
0184    48394:	80 7b 01 15          	cmpb   $0x15,0x1(%rbx)
0188    48398:	0f 85 69 04 00 00    	jne    48807 <apply_alternatives+0x5f7>
018e    4839e:	48 63 43 02          	movslq 0x2(%rbx),%rax
0192    483a2:	ba 04 00 00 00       	mov    $0x4,%edx
0197    483a7:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
019c    483ac:	c7 44 24 14 00 00 00 00 	movl   $0x0,0x14(%rsp)
01a4    483b4:	4c 8b 6c 03 06       	mov    0x6(%rbx,%rax,1),%r13
01a9    483b9:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	483bc: R_X86_64_32S	BUG_func
01b0    483c0:	48 89 c6             	mov    %rax,%rsi
01b3    483c3:	4d 85 ed             	test   %r13,%r13
01b6    483c6:	4c 0f 44 e8          	cmove  %rax,%r13
01ba    483ca:	e8 00 00 00 00       	call   483cf <apply_alternatives+0x1bf>	483cb: R_X86_64_PLT32	copy_from_kernel_nofault-0x4
01bf    483cf:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	483d2: R_X86_64_32S	BUG_func
01c6    483d6:	48 85 c0             	test   %rax,%rax
01c9    483d9:	75 2b                	jne    48406 <apply_alternatives+0x1f6>
01cb    483db:	8b 44 24 14          	mov    0x14(%rsp),%eax
01cf    483df:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	483e2: R_X86_64_32S	BUG_func+0x4
01d6    483e6:	3d 0f b9 48 00       	cmp    $0x48b90f,%eax
01db    483eb:	74 19                	je     48406 <apply_alternatives+0x1f6>
01dd    483ed:	25 ff ff ff fe       	and    $0xfeffffff,%eax
01e2    483f2:	ba 0c f0 e1 05       	mov    $0x5e1f00c,%edx
01e7    483f7:	f7 d2                	not    %edx
01e9    483f9:	39 d0                	cmp    %edx,%eax
01eb    483fb:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	483fe: R_X86_64_32S	BUG_func
01f2    48402:	48 0f 45 c8          	cmovne %rax,%rcx
01f6    48406:	ba 04 00 00 00       	mov    $0x4,%edx
01fb    4840b:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
0200    48410:	4c 89 ee             	mov    %r13,%rsi
0203    48413:	48 89 0c 24          	mov    %rcx,(%rsp)
0207    48417:	c7 44 24 14 00 00 00 00 	movl   $0x0,0x14(%rsp)
020f    4841f:	e8 00 00 00 00       	call   48424 <apply_alternatives+0x214>	48420: R_X86_64_PLT32	copy_from_kernel_nofault-0x4
0214    48424:	48 8b 0c 24          	mov    (%rsp),%rcx
0218    48428:	48 85 c0             	test   %rax,%rax
021b    4842b:	75 1f                	jne    4844c <apply_alternatives+0x23c>
021d    4842d:	8b 44 24 14          	mov    0x14(%rsp),%eax
0221    48431:	3d 0f b9 48 00       	cmp    $0x48b90f,%eax
0226    48436:	74 10                	je     48448 <apply_alternatives+0x238>
0228    48438:	25 ff ff ff fe       	and    $0xfeffffff,%eax
022d    4843d:	ba 0c f0 e1 05       	mov    $0x5e1f00c,%edx
0232    48442:	f7 d2                	not    %edx
0234    48444:	39 d0                	cmp    %edx,%eax
0236    48446:	75 04                	jne    4844c <apply_alternatives+0x23c>
0238    48448:	49 83 c5 04          	add    $0x4,%r13
023c    4844c:	4c 89 e8             	mov    %r13,%rax
023f    4844f:	31 ff                	xor    %edi,%edi
0241    48451:	44 0f b6 45 ff       	movzbl -0x1(%rbp),%r8d
0246    48456:	48 29 c8             	sub    %rcx,%rax
0249    48459:	01 44 24 1b          	add    %eax,0x1b(%rsp)
024d    4845d:	49 81 fd 00 00 00 00 	cmp    $0x0,%r13	48460: R_X86_64_32S	nop_func
0254    48464:	40 0f 95 c7          	setne  %dil
0258    48468:	8d 3c bf             	lea    (%rdi,%rdi,4),%edi
025b    4846b:	44 0f b6 6d fe       	movzbl -0x2(%rbp),%r13d
0260    48470:	44 89 e9             	mov    %r13d,%ecx
0263    48473:	41 39 fd             	cmp    %edi,%r13d
0266    48476:	0f 8e 6f 01 00 00    	jle    485eb <apply_alternatives+0x3db>
026c    4847c:	41 8d 55 ff          	lea    -0x1(%r13),%edx
0270    48480:	be 90 00 00 00       	mov    $0x90,%esi
0275    48485:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
027a    4848a:	29 fa                	sub    %edi,%edx
027c    4848c:	48 63 ff             	movslq %edi,%rdi
027f    4848f:	44 88 2c 24          	mov    %r13b,(%rsp)
0283    48493:	48 83 c2 01          	add    $0x1,%rdx
0287    48497:	4c 01 e7             	add    %r12,%rdi
028a    4849a:	e8 00 00 00 00       	call   4849f <apply_alternatives+0x28f>	4849b: R_X86_64_PLT32	memset-0x4
028f    4849f:	0f b6 0c 24          	movzbl (%rsp),%ecx
0293    484a3:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0298    484a8:	0f b6 d1             	movzbl %cl,%edx
029b    484ab:	48 89 de             	mov    %rbx,%rsi
029e    484ae:	4c 89 f1             	mov    %r14,%rcx
02a1    484b1:	4c 89 e7             	mov    %r12,%rdi
02a4    484b4:	48 89 14 24          	mov    %rdx,(%rsp)
02a8    484b8:	e8 53 e6 ff ff       	call   46b10 <__apply_relocation>
02ad    484bd:	48 8b 14 24          	mov    (%rsp),%rdx
02b1    484c1:	4c 89 e6             	mov    %r12,%rsi
02b4    484c4:	48 89 df             	mov    %rbx,%rdi
02b7    484c7:	e8 c4 ea ff ff       	call   46f90 <optimize_nops>
02bc    484cc:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 484d2 <apply_alternatives+0x2c2>	484ce: R_X86_64_PC32	.bss+0x9a14
02c2    484d2:	a8 01                	test   $0x1,%al
02c4    484d4:	0f 85 30 01 00 00    	jne    4860a <apply_alternatives+0x3fa>
02ca    484da:	49 63 d5             	movslq %r13d,%rdx
02cd    484dd:	4c 89 e6             	mov    %r12,%rsi
02d0    484e0:	48 89 df             	mov    %rbx,%rdi
02d3    484e3:	e8 00 00 00 00       	call   484e8 <apply_alternatives+0x2d8>	484e4: R_X86_64_PLT32	text_poke_early-0x4
02d8    484e8:	4c 39 fd             	cmp    %r15,%rbp
02db    484eb:	0f 82 99 fd ff ff    	jb     4828a <apply_alternatives+0x7a>
02e1    484f1:	48 8b 84 24 18 01 00 00 	mov    0x118(%rsp),%rax
02e9    484f9:	65 48 2b 04 25 28 00 00 00 	sub    %gs:0x28,%rax
02f2    48502:	0f 85 1b 03 00 00    	jne    48823 <apply_alternatives+0x613>
02f8    48508:	48 81 c4 20 01 00 00 	add    $0x120,%rsp
02ff    4850f:	5b                   	pop    %rbx
0300    48510:	5d                   	pop    %rbp
0301    48511:	41 5c                	pop    %r12
0303    48513:	41 5d                	pop    %r13
0305    48515:	41 5e                	pop    %r14
0307    48517:	41 5f                	pop    %r15
0309    48519:	e9 00 00 00 00       	jmp    4851e <apply_alternatives+0x30e>	4851a: R_X86_64_PLT32	__x86_return_thunk-0x4
030e    4851e:	48 01 f3             	add    %rsi,%rbx
0311    48521:	80 fa ff             	cmp    $0xff,%dl
0314    48524:	0f 85 b7 fd ff ff    	jne    482e1 <apply_alternatives+0xd1>
031a    4852a:	0f 0b                	ud2
031c    4852c:	49 8b 0e             	mov    (%r14),%rcx
031f    4852f:	48 8d 7c 24 22       	lea    0x22(%rsp),%rdi
0324    48534:	4c 89 f6             	mov    %r14,%rsi
0327    48537:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
032b    4853b:	49 89 0c 24          	mov    %rcx,(%r12)
032f    4853f:	4b 8b 4c 06 f8       	mov    -0x8(%r14,%r8,1),%rcx
0334    48544:	4b 89 4c 04 f8       	mov    %rcx,-0x8(%r12,%r8,1)
0339    48549:	4c 89 e1             	mov    %r12,%rcx
033c    4854c:	48 29 f9             	sub    %rdi,%rcx
033f    4854f:	48 29 ce             	sub    %rcx,%rsi
0342    48552:	44 01 c1             	add    %r8d,%ecx
0345    48555:	c1 e9 03             	shr    $0x3,%ecx
0348    48558:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
034b    4855b:	e9 ff fd ff ff       	jmp    4835f <apply_alternatives+0x14f>
0350    48560:	41 0f b7 45 08       	movzwl 0x8(%r13),%eax
0355    48565:	52                   	push   %rdx
0356    48566:	49 89 d8             	mov    %rbx,%r8
0359    48569:	48 89 d9             	mov    %rbx,%rcx
035c    4856c:	89 c7                	mov    %eax,%edi
035e    4856e:	66 c1 e8 05          	shr    $0x5,%ax
0362    48572:	0f b7 f0             	movzwl %ax,%esi
0365    48575:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
0369    48579:	83 e7 1f             	and    $0x1f,%edi
036c    4857c:	89 fa                	mov    %edi,%edx
036e    4857e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	48581: R_X86_64_32S	.rodata.str1.8+0x4998
0375    48585:	50                   	push   %rax
0376    48586:	41 56                	push   %r14
0378    48588:	44 0f b6 4d fe       	movzbl -0x2(%rbp),%r9d
037d    4858d:	e8 00 00 00 00       	call   48592 <apply_alternatives+0x382>	4858e: R_X86_64_PLT32	_printk-0x4
0382    48592:	41 0f b7 55 0a       	movzwl 0xa(%r13),%edx
0387    48597:	48 83 c4 18          	add    $0x18,%rsp
038b    4859b:	e9 8b fd ff ff       	jmp    4832b <apply_alternatives+0x11b>
0390    485a0:	0f b6 55 fe          	movzbl -0x2(%rbp),%edx
0394    485a4:	83 fa 08             	cmp    $0x8,%edx
0397    485a7:	0f 83 e5 00 00 00    	jae    48692 <apply_alternatives+0x482>
039d    485ad:	f6 c2 04             	test   $0x4,%dl
03a0    485b0:	0f 85 25 02 00 00    	jne    487db <apply_alternatives+0x5cb>
03a6    485b6:	85 d2                	test   %edx,%edx
03a8    485b8:	74 10                	je     485ca <apply_alternatives+0x3ba>
03aa    485ba:	0f b6 03             	movzbl (%rbx),%eax
03ad    485bd:	41 88 04 24          	mov    %al,(%r12)
03b1    485c1:	f6 c2 02             	test   $0x2,%dl
03b4    485c4:	0f 85 25 02 00 00    	jne    487ef <apply_alternatives+0x5df>
03ba    485ca:	4c 89 e6             	mov    %r12,%rsi
03bd    485cd:	48 89 df             	mov    %rbx,%rdi
03c0    485d0:	e8 bb e9 ff ff       	call   46f90 <optimize_nops>
03c5    485d5:	0f b6 55 fe          	movzbl -0x2(%rbp),%edx
03c9    485d9:	4c 89 e6             	mov    %r12,%rsi
03cc    485dc:	48 89 df             	mov    %rbx,%rdi
03cf    485df:	e8 00 00 00 00       	call   485e4 <apply_alternatives+0x3d4>	485e0: R_X86_64_PLT32	text_poke_early-0x4
03d4    485e4:	e9 98 fc ff ff       	jmp    48281 <apply_alternatives+0x71>
03d9    485e9:	0f 0b                	ud2
03db    485eb:	41 89 fd             	mov    %edi,%r13d
03de    485ee:	e9 b5 fe ff ff       	jmp    484a8 <apply_alternatives+0x298>
03e3    485f3:	48 89 f2             	mov    %rsi,%rdx
03e6    485f6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	485f9: R_X86_64_32S	.rodata.str1.8+0x4968
03ed    485fd:	48 89 ee             	mov    %rbp,%rsi
03f0    48600:	e8 00 00 00 00       	call   48605 <apply_alternatives+0x3f5>	48601: R_X86_64_PLT32	_printk-0x4
03f5    48605:	e9 77 fc ff ff       	jmp    48281 <apply_alternatives+0x71>
03fa    4860a:	80 7d fe 00          	cmpb   $0x0,-0x2(%rbp)
03fe    4860e:	0f 85 da 00 00 00    	jne    486ee <apply_alternatives+0x4de>
0404    48614:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
0408    48618:	0f 85 4c 01 00 00    	jne    4876a <apply_alternatives+0x55a>
040e    4861e:	a8 01                	test   $0x1,%al
0410    48620:	0f 84 b4 fe ff ff    	je     484da <apply_alternatives+0x2ca>
0416    48626:	45 85 ed             	test   %r13d,%r13d
0419    48629:	0f 84 ab fe ff ff    	je     484da <apply_alternatives+0x2ca>
041f    4862f:	48 89 de             	mov    %rbx,%rsi
0422    48632:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	48635: R_X86_64_32S	.rodata.str1.8+0x4af0
0429    48639:	e8 00 00 00 00       	call   4863e <apply_alternatives+0x42e>	4863a: R_X86_64_PLT32	_printk-0x4
042e    4863e:	44 89 e8             	mov    %r13d,%eax
0431    48641:	83 e8 01             	sub    $0x1,%eax
0434    48644:	89 44 24 08          	mov    %eax,0x8(%rsp)
0438    48648:	74 2d                	je     48677 <apply_alternatives+0x467>
043a    4864a:	41 8d 45 fe          	lea    -0x2(%r13),%eax
043e    4864e:	4d 89 e6             	mov    %r12,%r14
0441    48651:	48 8d 44 04 1b       	lea    0x1b(%rsp,%rax,1),%rax
0446    48656:	48 89 04 24          	mov    %rax,(%rsp)
044a    4865a:	41 0f b6 36          	movzbl (%r14),%esi
044e    4865e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	48661: R_X86_64_32S	.rodata.str1.1+0x39de
0455    48665:	49 83 c6 01          	add    $0x1,%r14
0459    48669:	e8 00 00 00 00       	call   4866e <apply_alternatives+0x45e>	4866a: R_X86_64_PLT32	_printk-0x4
045e    4866e:	48 8b 04 24          	mov    (%rsp),%rax
0462    48672:	49 39 c6             	cmp    %rax,%r14
0465    48675:	75 e3                	jne    4865a <apply_alternatives+0x44a>
0467    48677:	48 63 44 24 08       	movslq 0x8(%rsp),%rax
046c    4867c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4867f: R_X86_64_32S	.rodata.str1.1+0x39e8
0473    48683:	0f b6 74 04 1a       	movzbl 0x1a(%rsp,%rax,1),%esi
0478    48688:	e8 00 00 00 00       	call   4868d <apply_alternatives+0x47d>	48689: R_X86_64_PLT32	_printk-0x4
047d    4868d:	e9 48 fe ff ff       	jmp    484da <apply_alternatives+0x2ca>
0482    48692:	48 8b 03             	mov    (%rbx),%rax
0485    48695:	48 8d 7c 24 22       	lea    0x22(%rsp),%rdi
048a    4869a:	48 89 de             	mov    %rbx,%rsi
048d    4869d:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
0491    486a1:	49 89 04 24          	mov    %rax,(%r12)
0495    486a5:	48 8b 44 13 f8       	mov    -0x8(%rbx,%rdx,1),%rax
049a    486aa:	49 89 44 14 f8       	mov    %rax,-0x8(%r12,%rdx,1)
049f    486af:	4c 89 e0             	mov    %r12,%rax
04a2    486b2:	48 29 f8             	sub    %rdi,%rax
04a5    486b5:	48 29 c6             	sub    %rax,%rsi
04a8    486b8:	01 d0                	add    %edx,%eax
04aa    486ba:	c1 e8 03             	shr    $0x3,%eax
04ad    486bd:	89 c1                	mov    %eax,%ecx
04af    486bf:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
04b2    486c2:	e9 03 ff ff ff       	jmp    485ca <apply_alternatives+0x3ba>
04b7    486c7:	41 8b 36             	mov    (%r14),%esi
04ba    486ca:	41 89 34 24          	mov    %esi,(%r12)
04be    486ce:	41 8b 74 0e fc       	mov    -0x4(%r14,%rcx,1),%esi
04c3    486d3:	41 89 74 0c fc       	mov    %esi,-0x4(%r12,%rcx,1)
04c8    486d8:	e9 82 fc ff ff       	jmp    4835f <apply_alternatives+0x14f>
04cd    486dd:	41 0f b7 74 0e fe    	movzwl -0x2(%r14,%rcx,1),%esi
04d3    486e3:	66 41 89 74 0c fe    	mov    %si,-0x2(%r12,%rcx,1)
04d9    486e9:	e9 71 fc ff ff       	jmp    4835f <apply_alternatives+0x14f>
04de    486ee:	48 89 de             	mov    %rbx,%rsi
04e1    486f1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	486f4: R_X86_64_32S	.rodata.str1.8+0x4aa0
04e8    486f8:	e8 00 00 00 00       	call   486fd <apply_alternatives+0x4ed>	486f9: R_X86_64_PLT32	_printk-0x4
04ed    486fd:	0f b6 45 fe          	movzbl -0x2(%rbp),%eax
04f1    48701:	83 e8 01             	sub    $0x1,%eax
04f4    48704:	85 c0                	test   %eax,%eax
04f6    48706:	0f 8e f3 00 00 00    	jle    487ff <apply_alternatives+0x5ef>
04fc    4870c:	48 89 d9             	mov    %rbx,%rcx
04ff    4870f:	31 d2                	xor    %edx,%edx
0501    48711:	0f b6 31             	movzbl (%rcx),%esi
0504    48714:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	48717: R_X86_64_32S	.rodata.str1.1+0x39de
050b    4871b:	89 54 24 08          	mov    %edx,0x8(%rsp)
050f    4871f:	48 89 0c 24          	mov    %rcx,(%rsp)
0513    48723:	e8 00 00 00 00       	call   48728 <apply_alternatives+0x518>	48724: R_X86_64_PLT32	_printk-0x4
0518    48728:	0f b6 45 fe          	movzbl -0x2(%rbp),%eax
051c    4872c:	8b 54 24 08          	mov    0x8(%rsp),%edx
0520    48730:	48 8b 0c 24          	mov    (%rsp),%rcx
0524    48734:	83 c2 01             	add    $0x1,%edx
0527    48737:	83 e8 01             	sub    $0x1,%eax
052a    4873a:	48 83 c1 01          	add    $0x1,%rcx
052e    4873e:	39 d0                	cmp    %edx,%eax
0530    48740:	7f cf                	jg     48711 <apply_alternatives+0x501>
0532    48742:	48 63 c2             	movslq %edx,%rax
0535    48745:	48 01 d8             	add    %rbx,%rax
0538    48748:	0f b6 30             	movzbl (%rax),%esi
053b    4874b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4874e: R_X86_64_32S	.rodata.str1.1+0x39e8
0542    48752:	e8 00 00 00 00       	call   48757 <apply_alternatives+0x547>	48753: R_X86_64_PLT32	_printk-0x4
0547    48757:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 4875d <apply_alternatives+0x54d>	48759: R_X86_64_PC32	.bss+0x9a14
054d    4875d:	a8 01                	test   $0x1,%al
054f    4875f:	0f 85 af fe ff ff    	jne    48614 <apply_alternatives+0x404>
0555    48765:	e9 70 fd ff ff       	jmp    484da <apply_alternatives+0x2ca>
055a    4876a:	4c 89 f6             	mov    %r14,%rsi
055d    4876d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	48770: R_X86_64_32S	.rodata.str1.8+0x4ac8
0564    48774:	e8 00 00 00 00       	call   48779 <apply_alternatives+0x569>	48775: R_X86_64_PLT32	_printk-0x4
0569    48779:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
056d    4877d:	83 e8 01             	sub    $0x1,%eax
0570    48780:	85 c0                	test   %eax,%eax
0572    48782:	7e 3c                	jle    487c0 <apply_alternatives+0x5b0>
0574    48784:	4c 89 f1             	mov    %r14,%rcx
0577    48787:	31 d2                	xor    %edx,%edx
0579    48789:	0f b6 31             	movzbl (%rcx),%esi
057c    4878c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4878f: R_X86_64_32S	.rodata.str1.1+0x39de
0583    48793:	89 54 24 08          	mov    %edx,0x8(%rsp)
0587    48797:	48 89 0c 24          	mov    %rcx,(%rsp)
058b    4879b:	e8 00 00 00 00       	call   487a0 <apply_alternatives+0x590>	4879c: R_X86_64_PLT32	_printk-0x4
0590    487a0:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
0594    487a4:	8b 54 24 08          	mov    0x8(%rsp),%edx
0598    487a8:	48 8b 0c 24          	mov    (%rsp),%rcx
059c    487ac:	83 c2 01             	add    $0x1,%edx
059f    487af:	83 e8 01             	sub    $0x1,%eax
05a2    487b2:	48 83 c1 01          	add    $0x1,%rcx
05a6    487b6:	39 d0                	cmp    %edx,%eax
05a8    487b8:	7f cf                	jg     48789 <apply_alternatives+0x579>
05aa    487ba:	48 63 d2             	movslq %edx,%rdx
05ad    487bd:	49 01 d6             	add    %rdx,%r14
05b0    487c0:	41 0f b6 36          	movzbl (%r14),%esi
05b4    487c4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	487c7: R_X86_64_32S	.rodata.str1.1+0x39e8
05bb    487cb:	e8 00 00 00 00       	call   487d0 <apply_alternatives+0x5c0>	487cc: R_X86_64_PLT32	_printk-0x4
05c0    487d0:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 487d6 <apply_alternatives+0x5c6>	487d2: R_X86_64_PC32	.bss+0x9a14
05c6    487d6:	e9 43 fe ff ff       	jmp    4861e <apply_alternatives+0x40e>
05cb    487db:	8b 03                	mov    (%rbx),%eax
05cd    487dd:	41 89 04 24          	mov    %eax,(%r12)
05d1    487e1:	8b 44 13 fc          	mov    -0x4(%rbx,%rdx,1),%eax
05d5    487e5:	41 89 44 14 fc       	mov    %eax,-0x4(%r12,%rdx,1)
05da    487ea:	e9 db fd ff ff       	jmp    485ca <apply_alternatives+0x3ba>
05df    487ef:	0f b7 44 13 fe       	movzwl -0x2(%rbx,%rdx,1),%eax
05e4    487f4:	66 41 89 44 14 fe    	mov    %ax,-0x2(%r12,%rdx,1)
05ea    487fa:	e9 cb fd ff ff       	jmp    485ca <apply_alternatives+0x3ba>
05ef    487ff:	48 89 d8             	mov    %rbx,%rax
05f2    48802:	e9 41 ff ff ff       	jmp    48748 <apply_alternatives+0x538>
05f7    48807:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4880a: R_X86_64_32S	.rodata.str1.8+0x4a50
05fe    4880e:	e8 00 00 00 00       	call   48813 <apply_alternatives+0x603>	4880f: R_X86_64_PLT32	_printk-0x4
0603    48813:	0f 0b                	ud2
0605    48815:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	48818: R_X86_64_32S	.rodata.str1.8+0x49f8
060c    4881c:	e8 00 00 00 00       	call   48821 <apply_alternatives+0x611>	4881d: R_X86_64_PLT32	_printk-0x4
0611    48821:	0f 0b                	ud2
0613    48823:	e8 00 00 00 00       	call   48828 <apply_alternatives+0x618>	48824: R_X86_64_PLT32	__stack_chk_fail-0x4
0618    48828:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0623    48833:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
062e    4883e:	66 90                	xchg   %ax,%ax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
