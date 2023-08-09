Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C861D2F1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 21:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691618088; x=1723154088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xhe4ec9jNoVphUmSm1wDN50L1/iQDhQ0DsoN2g4wR4M=;
  b=R5LVo1XeAKzeiYQbUtyTPgzrqOKbGBiq9UeSHkNx2wAcIiAZV3Lq9Nmp
   XuioRRQLryy2JX344cvH9VN7FDujyepKo6/EqObYK/zS8JeR5qgaOaGhZ
   Omx3KADC1/w82r57BXYxUsBW2j01hhInboWZiSZoh3oAe5+D/fwvVmD/4
   IPpV8j1wUlUQfhp6tTt97kbJVdKcxplXwXGPwRIgHr4m8JB/rRtyWWVD7
   Zb7ii6ftzYz+XHaODyoJUxx9pFCEmy6zEOjz+R8wXbxyIiGBFCBsxcPTI
   E++QljzP3PLVH0qVD3t/Vd4rAPEP+ZRPl42V3ifYoAV8RdVMU+aV2O3wa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356205752"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="356205752"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 14:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="978559382"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="978559382"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Aug 2023 14:54:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTr8f-0006R7-2V;
	Wed, 09 Aug 2023 21:54:45 +0000
Date: Thu, 10 Aug 2023 05:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lantianyu:test 5/29] vmlinux.o: warning: objtool:
 hv_switch_off_ist+0x15b: call to panic() leaves .noinstr.text section
Message-ID: <202308100543.KukHxif5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   1f50b51d0f25cf6e93d994fbc0ec9e2f1cb3b911
commit: 61b68be7a24461b37c1e8ae690758b584a7a0a27 [5/29] x86/sev: Add a #HV exception handler
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230810/202308100543.KukHxif5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100543.KukHxif5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100543.KukHxif5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: hv_switch_off_ist+0x15b: call to panic() leaves .noinstr.text section


objdump-func vmlinux.o hv_switch_off_ist:
0000 00000000000044c0 <hv_switch_off_ist>:
0000     44c0:	f3 0f 1e fa          	endbr64
0004     44c4:	55                   	push   %rbp
0005     44c5:	48 89 fd             	mov    %rdi,%rbp
0008     44c8:	53                   	push   %rbx
0009     44c9:	48 83 ec 28          	sub    $0x28,%rsp
000d     44cd:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0016     44d6:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
001b     44db:	48 b8 fe fe fe fe fe fe fe fe 	movabs $0xfefefefefefefefe,%rax
0025     44e5:	48 89 04 24          	mov    %rax,(%rsp)
0029     44e9:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
002e     44ee:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
0033     44f3:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0038     44f8:	48 8b 87 80 00 00 00 	mov    0x80(%rdi),%rax
003f     44ff:	c7 44 24 04 00 00 00 00 	movl   $0x0,0x4(%rsp)
0047     4507:	48 3d 00 00 00 00    	cmp    $0x0,%rax	4509: R_X86_64_32S	entry_SYSCALL_64
004d     450d:	72 50                	jb     455f <hv_switch_off_ist+0x9f>
004f     450f:	48 3d 00 00 00 00    	cmp    $0x0,%rax	4511: R_X86_64_32S	entry_SYSCALL_64_safe_stack
0055     4515:	73 48                	jae    455f <hv_switch_off_ist+0x9f>
0057     4517:	65 48 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%rbx        # 451f <hv_switch_off_ist+0x5f>	451b: R_X86_64_PC32	pcpu_hot+0x14
005f     451f:	48 83 e3 f8          	and    $0xfffffffffffffff8,%rbx
0063     4523:	b9 15 00 00 00       	mov    $0x15,%ecx
0068     4528:	48 89 ee             	mov    %rbp,%rsi
006b     452b:	48 8d 83 58 ff ff ff 	lea    -0xa8(%rbx),%rax
0072     4532:	48 89 c7             	mov    %rax,%rdi
0075     4535:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
0078     4538:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
007d     453d:	65 48 2b 14 25 28 00 00 00 	sub    %gs:0x28,%rdx
0086     4546:	0f 85 c3 00 00 00    	jne    460f <hv_switch_off_ist+0x14f>
008c     454c:	48 83 c4 28          	add    $0x28,%rsp
0090     4550:	5b                   	pop    %rbx
0091     4551:	5d                   	pop    %rbp
0092     4552:	31 d2                	xor    %edx,%edx
0094     4554:	31 c9                	xor    %ecx,%ecx
0096     4556:	31 f6                	xor    %esi,%esi
0098     4558:	31 ff                	xor    %edi,%edi
009a     455a:	e9 00 00 00 00       	jmp    455f <hv_switch_off_ist+0x9f>	455b: R_X86_64_PLT32	__x86_return_thunk-0x4
009f     455f:	48 3d 00 00 00 00    	cmp    $0x0,%rax	4561: R_X86_64_32S	entry_SYSRETQ_unsafe_stack
00a5     4565:	72 08                	jb     456f <hv_switch_off_ist+0xaf>
00a7     4567:	48 3d 00 00 00 00    	cmp    $0x0,%rax	4569: R_X86_64_32S	entry_SYSRETQ_end
00ad     456d:	72 a8                	jb     4517 <hv_switch_off_ist+0x57>
00af     456f:	48 3d 00 00 00 00    	cmp    $0x0,%rax	4571: R_X86_64_32S	entry_SYSCALL_compat
00b5     4575:	0f 83 83 00 00 00    	jae    45fe <hv_switch_off_ist+0x13e>
00bb     457b:	48 3d 00 00 00 00    	cmp    $0x0,%rax	457d: R_X86_64_32S	entry_SYSRETL_compat_unsafe_stack
00c1     4581:	72 08                	jb     458b <hv_switch_off_ist+0xcb>
00c3     4583:	48 3d 00 00 00 00    	cmp    $0x0,%rax	4585: R_X86_64_32S	entry_SYSRETL_compat_end
00c9     4589:	72 8c                	jb     4517 <hv_switch_off_ist+0x57>
00cb     458b:	48 8b 9d 98 00 00 00 	mov    0x98(%rbp),%rbx
00d2     4592:	48 89 e2             	mov    %rsp,%rdx
00d5     4595:	65 48 8b 34 25 00 00 00 00 	mov    %gs:0x0,%rsi	459a: R_X86_64_32S	pcpu_hot
00de     459e:	48 89 df             	mov    %rbx,%rdi
00e1     45a1:	e8 00 00 00 00       	call   45a6 <hv_switch_off_ist+0xe6>	45a2: R_X86_64_PLT32	get_stack_info_noinstr-0x4
00e6     45a6:	84 c0                	test   %al,%al
00e8     45a8:	74 0b                	je     45b5 <hv_switch_off_ist+0xf5>
00ea     45aa:	8b 34 24             	mov    (%rsp),%esi
00ed     45ad:	8d 46 f5             	lea    -0xb(%rsi),%eax
00f0     45b0:	83 f8 01             	cmp    $0x1,%eax
00f3     45b3:	76 5f                	jbe    4614 <hv_switch_off_ist+0x154>
00f5     45b5:	48 89 e2             	mov    %rsp,%rdx
00f8     45b8:	48 89 df             	mov    %rbx,%rdi
00fb     45bb:	65 48 8b 34 25 00 00 00 00 	mov    %gs:0x0,%rsi	45c0: R_X86_64_32S	pcpu_hot
0104     45c4:	e8 00 00 00 00       	call   45c9 <hv_switch_off_ist+0x109>	45c5: R_X86_64_PLT32	get_stack_info_noinstr-0x4
0109     45c9:	84 c0                	test   %al,%al
010b     45cb:	74 11                	je     45de <hv_switch_off_ist+0x11e>
010d     45cd:	8b 04 24             	mov    (%rsp),%eax
0110     45d0:	83 f8 04             	cmp    $0x4,%eax
0113     45d3:	74 09                	je     45de <hv_switch_off_ist+0x11e>
0115     45d5:	83 f8 0c             	cmp    $0xc,%eax
0118     45d8:	0f 86 41 ff ff ff    	jbe    451f <hv_switch_off_ist+0x5f>
011e     45de:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	45e1: R_X86_64_32S	.rodata.str1.1+0x8166
0125     45e5:	e8 00 00 00 00       	call   45ea <hv_switch_off_ist+0x12a>	45e6: R_X86_64_PLT32	__this_cpu_preempt_check-0x4
012a     45ea:	65 48 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%rbx        # 45f2 <hv_switch_off_ist+0x132>	45ee: R_X86_64_PC32	cea_exception_stacks-0x4
0132     45f2:	48 81 c3 00 80 01 00 	add    $0x18000,%rbx
0139     45f9:	e9 21 ff ff ff       	jmp    451f <hv_switch_off_ist+0x5f>
013e     45fe:	48 3d 00 00 00 00    	cmp    $0x0,%rax	4600: R_X86_64_32S	entry_SYSCALL_compat_safe_stack
0144     4604:	0f 82 0d ff ff ff    	jb     4517 <hv_switch_off_ist+0x57>
014a     460a:	e9 6c ff ff ff       	jmp    457b <hv_switch_off_ist+0xbb>
014f     460f:	e8 00 00 00 00       	call   4614 <hv_switch_off_ist+0x154>	4610: R_X86_64_PLT32	__stack_chk_fail-0x4
0154     4614:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4617: R_X86_64_32S	.rodata.str1.8+0xfa40
015b     461b:	e8 00 00 00 00       	call   4620 <hv_switch_off_ist+0x160>	461c: R_X86_64_PLT32	panic-0x4
0160     4620:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
016b     462b:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0176     4636:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
