Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506A827453
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 16:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727023324; cv=none; b=AnDkVIpBCvoWNsq110Gzc926R2OFvVaSduaEdHj7fA2In08JZQxpKFjaJJAMoPHFpiJarlo9f82p5pY45G8Bp7k9uWdEbCmkNfLrC+ho6j1FjFltBm+0pW+zfRZ9/R43koT/gzvyczd96CV5wNyFIf/m6pxnMpBFCkBxGHn3MDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727023324; c=relaxed/simple;
	bh=VeQ+PlQhPH/LIcXSNc7w9XuNW13ugDncXNVsQnsQeqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eyN/DFtrFCc2EhswGvnTWBEJVVA8c99tBsaUAAEODtx/ojoVzQlL+9GHA/zQYtpHyMMFoin8xqAWDlnaCaiG7xDpU1Xk7iLybEbwmuIjWkRjTBK8AcOHYaXJor5Ye6qr4B2z7S5WnuyvVcH0fyhRlzixl+Qo74DRFLe9xYjgf2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbBZgZTt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbBZgZTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727023322; x=1758559322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VeQ+PlQhPH/LIcXSNc7w9XuNW13ugDncXNVsQnsQeqA=;
  b=GbBZgZTtbUVnATJfBTRORozr85pzdBlLGF/kEGs5ax+eCZeTQCIU5zrR
   rz9j7OUfgPLMt3VKODEI+MrB07h5RkxNX+SJk7gT7WRYqpCCezdRgNQ7U
   AqUslxihyfr0OV7pYaY2qvMIcN6M0XwBykfVPuUyQdPiEaWGiqbJ6WVh8
   1xcGB3LO2Xs717+rRhaZuiacB9b9dgh9k6qwF5MsZv+RW4eV17UEaai+5
   DX0coRC8CFH0w1qU7PmG1WpxORIYosyb6wYavvK4ym6c8+X/TlZiwcysm
   IYzXSUGlMaRUbbjD2qaDIv15hd8Hizs79TJmD9HN0qBo5mlBc4wMNq9Ja
   A==;
X-CSE-ConnectionGUID: lfZoJes/SYi8xneqreOctA==
X-CSE-MsgGUID: ktPYo0PTSqSCWnr3vdqMhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="43488921"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="43488921"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 09:42:01 -0700
X-CSE-ConnectionGUID: MBIAtl3QRLKuJkyhBlX67Q==
X-CSE-MsgGUID: qGjH8zzbQECzK7/GhlXysw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="71662466"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Sep 2024 09:42:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssPen-000GUy-38;
	Sun, 22 Sep 2024 16:41:57 +0000
Date: Mon, 23 Sep 2024 00:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 11406/30000] drivers/clk/clk.o:
 warning: objtool: clk_unvote_vdd_level()+0x17e: unreachable instruction
Message-ID: <202409230007.HQJKm8Af-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   1b3964c5e070d088ca4c9591cbadd91a22e438ea
commit: 3179a1a38d96f565a2229b9244285c6abf62b10a [11406/30000] ANDROID: GKI: clk: Add support for voltage voting
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240923/202409230007.HQJKm8Af-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230007.HQJKm8Af-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230007.HQJKm8Af-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk.c:624:24: warning: variable 'ignore' set but not used [-Wunused-but-set-variable]
     624 |         int level, rc = 0, i, ignore;
         |                               ^
   drivers/clk/clk.c:3145:5: warning: no previous prototype for function 'clk_set_flags' [-Wmissing-prototypes]
    3145 | int clk_set_flags(struct clk *clk, unsigned long flags)
         |     ^
   drivers/clk/clk.c:3145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3145 | int clk_set_flags(struct clk *clk, unsigned long flags)
         | ^
         | static 
   drivers/clk/clk.c:3157:6: warning: no previous prototype for function 'clk_debug_print_hw' [-Wmissing-prototypes]
    3157 | void clk_debug_print_hw(struct clk_core *clk, struct seq_file *f)
         |      ^
   drivers/clk/clk.c:3157:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3157 | void clk_debug_print_hw(struct clk_core *clk, struct seq_file *f)
         | ^
         | static 
   3 warnings generated.
   drivers/clk/clk.c:4257: warning: Function parameter or member 'dev' not described in 'devm_clk_unregister'
   drivers/clk/clk.c:4455: warning: Function parameter or member 'get_hw' not described in 'of_clk_provider'
>> drivers/clk/clk.o: warning: objtool: clk_unvote_vdd_level()+0x17e: unreachable instruction


objdump-func vmlinux.o clk_unvote_vdd_level:
0000 0000000000f281fc <clk_unvote_vdd_level>:
0000   f281fc:	e8 00 00 00 00       	call   f28201 <clk_unvote_vdd_level+0x5>	f281fd: R_X86_64_PLT32	__fentry__-0x4
0005   f28201:	55                   	push   %rbp
0006   f28202:	48 89 e5             	mov    %rsp,%rbp
0009   f28205:	41 57                	push   %r15
000b   f28207:	41 56                	push   %r14
000d   f28209:	41 55                	push   %r13
000f   f2820b:	41 54                	push   %r12
0011   f2820d:	53                   	push   %rbx
0012   f2820e:	48 8d 64 24 e0       	lea    -0x20(%rsp),%rsp
0017   f28213:	41 89 f7             	mov    %esi,%r15d
001a   f28216:	49 89 fe             	mov    %rdi,%r14
001d   f28219:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0027   f28223:	e8 00 00 00 00       	call   f28228 <clk_unvote_vdd_level+0x2c>	f28224: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
002c   f28228:	49 8d 5e 30          	lea    0x30(%r14),%rbx
0030   f2822c:	48 89 d8             	mov    %rbx,%rax
0033   f2822f:	48 c1 e8 03          	shr    $0x3,%rax
0037   f28233:	42 8a 04 28          	mov    (%rax,%r13,1),%al
003b   f28237:	84 c0                	test   %al,%al
003d   f28239:	0f 85 43 01 00 00    	jne    f28382 <clk_unvote_vdd_level+0x186>
0043   f2823f:	44 39 3b             	cmp    %r15d,(%rbx)
0046   f28242:	0f 8e c9 00 00 00    	jle    f28311 <clk_unvote_vdd_level+0x115>
004c   f28248:	49 8d 7e 40          	lea    0x40(%r14),%rdi
0050   f2824c:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
0054   f28250:	e8 00 00 00 00       	call   f28255 <clk_unvote_vdd_level+0x59>	f28251: R_X86_64_PLT32	mutex_lock-0x4
0059   f28255:	49 8d 5e 28          	lea    0x28(%r14),%rbx
005d   f28259:	48 89 d8             	mov    %rbx,%rax
0060   f2825c:	48 c1 e8 03          	shr    $0x3,%rax
0064   f28260:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0069   f28265:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
006d   f28269:	74 08                	je     f28273 <clk_unvote_vdd_level+0x77>
006f   f2826b:	48 89 df             	mov    %rbx,%rdi
0072   f2826e:	e8 00 00 00 00       	call   f28273 <clk_unvote_vdd_level+0x77>	f2826f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0077   f28273:	4d 63 e7             	movslq %r15d,%r12
007a   f28276:	44 89 7d d4          	mov    %r15d,-0x2c(%rbp)
007e   f2827a:	4c 8b 3b             	mov    (%rbx),%r15
0081   f2827d:	48 89 5d c0          	mov    %rbx,-0x40(%rbp)
0085   f28281:	49 c1 e4 02          	shl    $0x2,%r12
0089   f28285:	4d 01 e7             	add    %r12,%r15
008c   f28288:	4c 89 fb             	mov    %r15,%rbx
008f   f2828b:	48 c1 eb 03          	shr    $0x3,%rbx
0093   f2828f:	42 8a 04 2b          	mov    (%rbx,%r13,1),%al
0097   f28293:	84 c0                	test   %al,%al
0099   f28295:	0f 85 04 01 00 00    	jne    f2839f <clk_unvote_vdd_level+0x1a3>
009f   f2829b:	45 8b 2f             	mov    (%r15),%r13d
00a2   f2829e:	45 85 ed             	test   %r13d,%r13d
00a5   f282a1:	0f 84 9b 00 00 00    	je     f28342 <clk_unvote_vdd_level+0x146>
00ab   f282a7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00b5   f282b1:	41 ff cd             	dec    %r13d
00b8   f282b4:	8a 04 03             	mov    (%rbx,%rax,1),%al
00bb   f282b7:	84 c0                	test   %al,%al
00bd   f282b9:	0f 85 fe 00 00 00    	jne    f283bd <clk_unvote_vdd_level+0x1c1>
00c3   f282bf:	4c 89 f7             	mov    %r14,%rdi
00c6   f282c2:	45 89 2f             	mov    %r13d,(%r15)
00c9   f282c5:	e8 82 f8 ff ff       	call   f27b4c <clk_update_vdd>
00ce   f282ca:	85 c0                	test   %eax,%eax
00d0   f282cc:	74 50                	je     f2831e <clk_unvote_vdd_level+0x122>
00d2   f282ce:	41 89 c6             	mov    %eax,%r14d
00d5   f282d1:	e8 00 00 00 00       	call   f282d6 <clk_unvote_vdd_level+0xda>	f282d2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00da   f282d6:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
00e4   f282e0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
00e8   f282e4:	4c 8b 7d c0          	mov    -0x40(%rbp),%r15
00ec   f282e8:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
00f0   f282ec:	74 08                	je     f282f6 <clk_unvote_vdd_level+0xfa>
00f2   f282ee:	4c 89 ff             	mov    %r15,%rdi
00f5   f282f1:	e8 00 00 00 00       	call   f282f6 <clk_unvote_vdd_level+0xfa>	f282f2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00fa   f282f6:	4d 03 27             	add    (%r15),%r12
00fd   f282f9:	4c 89 e0             	mov    %r12,%rax
0100   f282fc:	48 c1 e8 03          	shr    $0x3,%rax
0104   f28300:	8a 04 18             	mov    (%rax,%rbx,1),%al
0107   f28303:	84 c0                	test   %al,%al
0109   f28305:	0f 85 d0 00 00 00    	jne    f283db <clk_unvote_vdd_level+0x1df>
010f   f2830b:	41 ff 04 24          	incl   (%r12)
0113   f2830f:	eb 15                	jmp    f28326 <clk_unvote_vdd_level+0x12a>
0115   f28311:	e8 00 00 00 00       	call   f28316 <clk_unvote_vdd_level+0x11a>	f28312: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
011a   f28316:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
0120   f2831c:	eb 11                	jmp    f2832f <clk_unvote_vdd_level+0x133>
0122   f2831e:	e8 00 00 00 00       	call   f28323 <clk_unvote_vdd_level+0x127>	f2831f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0127   f28323:	45 31 f6             	xor    %r14d,%r14d
012a   f28326:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
012e   f2832a:	e8 00 00 00 00       	call   f2832f <clk_unvote_vdd_level+0x133>	f2832b: R_X86_64_PLT32	mutex_unlock-0x4
0133   f2832f:	44 89 f0             	mov    %r14d,%eax
0136   f28332:	48 8d 64 24 20       	lea    0x20(%rsp),%rsp
013b   f28337:	5b                   	pop    %rbx
013c   f28338:	41 5c                	pop    %r12
013e   f2833a:	41 5d                	pop    %r13
0140   f2833c:	41 5e                	pop    %r14
0142   f2833e:	41 5f                	pop    %r15
0144   f28340:	5d                   	pop    %rbp
0145   f28341:	c3                   	ret
0146   f28342:	e8 00 00 00 00       	call   f28347 <clk_unvote_vdd_level+0x14b>	f28343: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
014b   f28347:	4c 89 f0             	mov    %r14,%rax
014e   f2834a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0158   f28354:	48 c1 e8 03          	shr    $0x3,%rax
015c   f28358:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0160   f2835c:	74 08                	je     f28366 <clk_unvote_vdd_level+0x16a>
0162   f2835e:	4c 89 f7             	mov    %r14,%rdi
0165   f28361:	e8 00 00 00 00       	call   f28366 <clk_unvote_vdd_level+0x16a>	f28362: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
016a   f28366:	49 8b 36             	mov    (%r14),%rsi
016d   f28369:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	f2836c: R_X86_64_32S	.rodata+0x5d4440
0174   f28370:	8b 55 d4             	mov    -0x2c(%rbp),%edx
0177   f28373:	e8 00 00 00 00       	call   f28378 <clk_unvote_vdd_level+0x17c>	f28374: R_X86_64_PLT32	__warn_printk-0x4
017c   f28378:	0f 0b                	ud2
017e   f2837a:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
0184   f28380:	eb a4                	jmp    f28326 <clk_unvote_vdd_level+0x12a>
0186   f28382:	89 d9                	mov    %ebx,%ecx
0188   f28384:	80 e1 07             	and    $0x7,%cl
018b   f28387:	80 c1 03             	add    $0x3,%cl
018e   f2838a:	38 c1                	cmp    %al,%cl
0190   f2838c:	0f 8c ad fe ff ff    	jl     f2823f <clk_unvote_vdd_level+0x43>
0196   f28392:	48 89 df             	mov    %rbx,%rdi
0199   f28395:	e8 00 00 00 00       	call   f2839a <clk_unvote_vdd_level+0x19e>	f28396: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
019e   f2839a:	e9 a0 fe ff ff       	jmp    f2823f <clk_unvote_vdd_level+0x43>
01a3   f2839f:	44 89 f9             	mov    %r15d,%ecx
01a6   f283a2:	80 e1 07             	and    $0x7,%cl
01a9   f283a5:	80 c1 03             	add    $0x3,%cl
01ac   f283a8:	38 c1                	cmp    %al,%cl
01ae   f283aa:	0f 8c eb fe ff ff    	jl     f2829b <clk_unvote_vdd_level+0x9f>
01b4   f283b0:	4c 89 ff             	mov    %r15,%rdi
01b7   f283b3:	e8 00 00 00 00       	call   f283b8 <clk_unvote_vdd_level+0x1bc>	f283b4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
01bc   f283b8:	e9 de fe ff ff       	jmp    f2829b <clk_unvote_vdd_level+0x9f>
01c1   f283bd:	44 89 f9             	mov    %r15d,%ecx
01c4   f283c0:	80 e1 07             	and    $0x7,%cl
01c7   f283c3:	80 c1 03             	add    $0x3,%cl
01ca   f283c6:	38 c1                	cmp    %al,%cl
01cc   f283c8:	0f 8c f1 fe ff ff    	jl     f282bf <clk_unvote_vdd_level+0xc3>
01d2   f283ce:	4c 89 ff             	mov    %r15,%rdi
01d5   f283d1:	e8 00 00 00 00       	call   f283d6 <clk_unvote_vdd_level+0x1da>	f283d2: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
01da   f283d6:	e9 e4 fe ff ff       	jmp    f282bf <clk_unvote_vdd_level+0xc3>
01df   f283db:	44 89 e1             	mov    %r12d,%ecx
01e2   f283de:	80 e1 07             	and    $0x7,%cl
01e5   f283e1:	80 c1 03             	add    $0x3,%cl
01e8   f283e4:	38 c1                	cmp    %al,%cl
01ea   f283e6:	0f 8c 1f ff ff ff    	jl     f2830b <clk_unvote_vdd_level+0x10f>
01f0   f283ec:	4c 89 e7             	mov    %r12,%rdi
01f3   f283ef:	e8 00 00 00 00       	call   f283f4 <clk_unvote_vdd_level+0x1f8>	f283f0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
01f8   f283f4:	e9 12 ff ff ff       	jmp    f2830b <clk_unvote_vdd_level+0x10f>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
