Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF63C26AFB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 04:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726892789; cv=none; b=ehPl/Ps/eTIqQY9baDY2KCjZ6H2cedllMeGaUCr7hmK7qoUfZsfnNPC22Em306IhbWHbmkMf425nTEJjrK/q1LzewcdtdHie81EZWLd0XCIs+Vd08ED3JbasELaL+JNO9DliQdp2oEXoqpchUWSQ3gFDIjnEI6T61VOVyuyDc3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726892789; c=relaxed/simple;
	bh=Fpv0Tk6kCABdiXz6WbUMjQMtB8CCKjmJTOWT1Hmn4ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lSRaGd/XPGO0s1fJjxkj5Ix4J/XZ5NmaDJsqcyALSipjRbiaoEo5NHEe2J09yb3sMGpkZ8CNv0ZKR8jnm73AGN+JjpUeMNax7YN9YtUzEBwX7x1y2eM8wF2C9q5GDzPh/GbTrgG+zTutF0PcMzacsNdKirqSbaO34Ug2xtLnB2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RP+Ox3Y8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RP+Ox3Y8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726892787; x=1758428787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fpv0Tk6kCABdiXz6WbUMjQMtB8CCKjmJTOWT1Hmn4ys=;
  b=RP+Ox3Y8Y2uAX0p4uCmCwnpG1izrT4B/+RyG99/TKnBWD/nuPmd12q57
   oxs9rPv7fN7hanBvxPDYJ1e+NEveqNUadCNGL6HG+uBEHy/DYNKpmLgSd
   PXSQl/0U41yh/iZCFZATRQo65aUIzLy5FWgXuqSOo8MAsQOClm8PzgDAu
   MihCGQQZsXLuE9jvSIjoUJ0EkocvIHgkQakLEwUXC0WO1tISdYASR9bFS
   WIzD2XvD5afHA6fiA5JbtAh2dz7yHbVZS0EHiRl2b8tsinrjHLEP74bvW
   HaupUuNfIQGuloF+e99JmdVPIak07fC/DGvRv6ax6Hn55Uf7t9uifmcpC
   A==;
X-CSE-ConnectionGUID: GwaRErcRT9q6ojsA7TUc2g==
X-CSE-MsgGUID: 0PTdWahxRf+RXP6u0XC+dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="36494597"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="36494597"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 21:26:26 -0700
X-CSE-ConnectionGUID: OLGFEPyjQ3m0bf5gc2/nFw==
X-CSE-MsgGUID: 0U2w01M5S8KNs8/Xz8zeQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="75063097"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Sep 2024 21:26:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srrhP-000F71-0A;
	Sat, 21 Sep 2024 04:26:23 +0000
Date: Sat, 21 Sep 2024 12:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 384/30000]
 drivers/firmware/arm_scmi/notify.o: warning: objtool:
 scmi_devm_notifier_match()+0x1ae: unreachable instruction
Message-ID: <202409211255.xHoxO7bo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cristian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   7b9f6a0ecd235bca2b4329476f817a6182ea8d8a
commit: 0c203b198e652674b4b8f7cd61e7d1261e941ac0 [384/30000] FROMLIST: firmware: arm_scmi: introduce new devres notification ops
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240921/202409211255.xHoxO7bo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211255.xHoxO7bo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211255.xHoxO7bo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/notify.o: warning: objtool: scmi_devm_notifier_match()+0x1ae: unreachable instruction


objdump-func vmlinux.o scmi_devm_notifier_match:
0000 00000000029b31f1 <scmi_devm_notifier_match>:
0000  29b31f1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	29b31f2: R_X86_64_NONE	__fentry__-0x4
0005  29b31f6:	55                   	push   %rbp
0006  29b31f7:	48 89 e5             	mov    %rsp,%rbp
0009  29b31fa:	41 57                	push   %r15
000b  29b31fc:	41 56                	push   %r14
000d  29b31fe:	41 55                	push   %r13
000f  29b3200:	41 54                	push   %r12
0011  29b3202:	53                   	push   %rbx
0012  29b3203:	48 89 d3             	mov    %rdx,%rbx
0015  29b3206:	49 89 f6             	mov    %rsi,%r14
0018  29b3209:	e8 00 00 00 00       	call   29b320e <scmi_devm_notifier_match+0x1d>	29b320a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
001d  29b320e:	4d 85 f6             	test   %r14,%r14
0020  29b3211:	0f 84 81 01 00 00    	je     29b3398 <scmi_devm_notifier_match+0x1a7>
0026  29b3217:	48 85 db             	test   %rbx,%rbx
0029  29b321a:	0f 84 78 01 00 00    	je     29b3398 <scmi_devm_notifier_match+0x1a7>
002f  29b3220:	4d 8d 7e 08          	lea    0x8(%r14),%r15
0033  29b3224:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
003d  29b322e:	4c 89 f8             	mov    %r15,%rax
0040  29b3231:	48 c1 e8 03          	shr    $0x3,%rax
0044  29b3235:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0048  29b3239:	84 c0                	test   %al,%al
004a  29b323b:	0f 85 66 01 00 00    	jne    29b33a7 <scmi_devm_notifier_match+0x1b6>
0050  29b3241:	4c 8d 63 08          	lea    0x8(%rbx),%r12
0054  29b3245:	45 8a 3f             	mov    (%r15),%r15b
0057  29b3248:	4c 89 e0             	mov    %r12,%rax
005a  29b324b:	48 c1 e8 03          	shr    $0x3,%rax
005e  29b324f:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0062  29b3253:	84 c0                	test   %al,%al
0064  29b3255:	0f 85 67 01 00 00    	jne    29b33c2 <scmi_devm_notifier_match+0x1d1>
006a  29b325b:	45 3a 3c 24          	cmp    (%r12),%r15b
006e  29b325f:	75 7b                	jne    29b32dc <scmi_devm_notifier_match+0xeb>
0070  29b3261:	4d 8d 7e 09          	lea    0x9(%r14),%r15
0074  29b3265:	4c 89 f8             	mov    %r15,%rax
0077  29b3268:	48 c1 e8 03          	shr    $0x3,%rax
007b  29b326c:	42 8a 04 28          	mov    (%rax,%r13,1),%al
007f  29b3270:	84 c0                	test   %al,%al
0081  29b3272:	0f 85 65 01 00 00    	jne    29b33dd <scmi_devm_notifier_match+0x1ec>
0087  29b3278:	4c 8d 63 09          	lea    0x9(%rbx),%r12
008b  29b327c:	45 8a 3f             	mov    (%r15),%r15b
008e  29b327f:	4c 89 e0             	mov    %r12,%rax
0091  29b3282:	48 c1 e8 03          	shr    $0x3,%rax
0095  29b3286:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0099  29b328a:	84 c0                	test   %al,%al
009b  29b328c:	0f 85 66 01 00 00    	jne    29b33f8 <scmi_devm_notifier_match+0x207>
00a1  29b3292:	45 3a 3c 24          	cmp    (%r12),%r15b
00a5  29b3296:	75 4b                	jne    29b32e3 <scmi_devm_notifier_match+0xf2>
00a7  29b3298:	4d 8d 7e 18          	lea    0x18(%r14),%r15
00ab  29b329c:	4c 89 f8             	mov    %r15,%rax
00ae  29b329f:	48 c1 e8 03          	shr    $0x3,%rax
00b2  29b32a3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
00b7  29b32a8:	74 08                	je     29b32b2 <scmi_devm_notifier_match+0xc1>
00b9  29b32aa:	4c 89 ff             	mov    %r15,%rdi
00bc  29b32ad:	e8 00 00 00 00       	call   29b32b2 <scmi_devm_notifier_match+0xc1>	29b32ae: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00c1  29b32b2:	4c 8d 63 18          	lea    0x18(%rbx),%r12
00c5  29b32b6:	4d 8b 3f             	mov    (%r15),%r15
00c8  29b32b9:	4c 89 e0             	mov    %r12,%rax
00cb  29b32bc:	48 c1 e8 03          	shr    $0x3,%rax
00cf  29b32c0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
00d4  29b32c5:	74 08                	je     29b32cf <scmi_devm_notifier_match+0xde>
00d6  29b32c7:	4c 89 e7             	mov    %r12,%rdi
00d9  29b32ca:	e8 00 00 00 00       	call   29b32cf <scmi_devm_notifier_match+0xde>	29b32cb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00de  29b32cf:	4d 3b 3c 24          	cmp    (%r12),%r15
00e2  29b32d3:	74 25                	je     29b32fa <scmi_devm_notifier_match+0x109>
00e4  29b32d5:	e8 00 00 00 00       	call   29b32da <scmi_devm_notifier_match+0xe9>	29b32d6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00e9  29b32da:	eb 0c                	jmp    29b32e8 <scmi_devm_notifier_match+0xf7>
00eb  29b32dc:	e8 00 00 00 00       	call   29b32e1 <scmi_devm_notifier_match+0xf0>	29b32dd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00f0  29b32e1:	eb 05                	jmp    29b32e8 <scmi_devm_notifier_match+0xf7>
00f2  29b32e3:	e8 00 00 00 00       	call   29b32e8 <scmi_devm_notifier_match+0xf7>	29b32e4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00f7  29b32e8:	45 31 ff             	xor    %r15d,%r15d
00fa  29b32eb:	41 0f b6 c7          	movzbl %r15b,%eax
00fe  29b32ef:	5b                   	pop    %rbx
00ff  29b32f0:	41 5c                	pop    %r12
0101  29b32f2:	41 5d                	pop    %r13
0103  29b32f4:	41 5e                	pop    %r14
0105  29b32f6:	41 5f                	pop    %r15
0107  29b32f8:	5d                   	pop    %rbp
0108  29b32f9:	c3                   	ret
0109  29b32fa:	4d 8d 7e 10          	lea    0x10(%r14),%r15
010d  29b32fe:	4c 89 f8             	mov    %r15,%rax
0110  29b3301:	48 c1 e8 03          	shr    $0x3,%rax
0114  29b3305:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0119  29b330a:	74 08                	je     29b3314 <scmi_devm_notifier_match+0x123>
011b  29b330c:	4c 89 ff             	mov    %r15,%rdi
011e  29b330f:	e8 00 00 00 00       	call   29b3314 <scmi_devm_notifier_match+0x123>	29b3310: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0123  29b3314:	4c 8d 63 10          	lea    0x10(%rbx),%r12
0127  29b3318:	4d 8b 3f             	mov    (%r15),%r15
012a  29b331b:	4c 89 e0             	mov    %r12,%rax
012d  29b331e:	48 c1 e8 03          	shr    $0x3,%rax
0131  29b3322:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0136  29b3327:	74 08                	je     29b3331 <scmi_devm_notifier_match+0x140>
0138  29b3329:	4c 89 e7             	mov    %r12,%rdi
013b  29b332c:	e8 00 00 00 00       	call   29b3331 <scmi_devm_notifier_match+0x140>	29b332d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0140  29b3331:	49 8b 04 24          	mov    (%r12),%rax
0144  29b3335:	4c 89 f9             	mov    %r15,%rcx
0147  29b3338:	48 09 c1             	or     %rax,%rcx
014a  29b333b:	4c 89 f9             	mov    %r15,%rcx
014d  29b333e:	41 0f 94 c7          	sete   %r15b
0151  29b3342:	48 85 c9             	test   %rcx,%rcx
0154  29b3345:	74 47                	je     29b338e <scmi_devm_notifier_match+0x19d>
0156  29b3347:	48 85 c0             	test   %rax,%rax
0159  29b334a:	74 42                	je     29b338e <scmi_devm_notifier_match+0x19d>
015b  29b334c:	e8 00 00 00 00       	call   29b3351 <scmi_devm_notifier_match+0x160>	29b334d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0160  29b3351:	49 83 c6 0c          	add    $0xc,%r14
0164  29b3355:	4c 89 f0             	mov    %r14,%rax
0167  29b3358:	48 c1 e8 03          	shr    $0x3,%rax
016b  29b335c:	42 8a 04 28          	mov    (%rax,%r13,1),%al
016f  29b3360:	84 c0                	test   %al,%al
0171  29b3362:	0f 85 ab 00 00 00    	jne    29b3413 <scmi_devm_notifier_match+0x222>
0177  29b3368:	48 83 c3 0c          	add    $0xc,%rbx
017b  29b336c:	45 8b 36             	mov    (%r14),%r14d
017e  29b336f:	48 89 d8             	mov    %rbx,%rax
0181  29b3372:	48 c1 e8 03          	shr    $0x3,%rax
0185  29b3376:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0189  29b337a:	84 c0                	test   %al,%al
018b  29b337c:	0f 85 af 00 00 00    	jne    29b3431 <scmi_devm_notifier_match+0x240>
0191  29b3382:	44 3b 33             	cmp    (%rbx),%r14d
0194  29b3385:	41 0f 94 c7          	sete   %r15b
0198  29b3389:	e9 5d ff ff ff       	jmp    29b32eb <scmi_devm_notifier_match+0xfa>
019d  29b338e:	e8 00 00 00 00       	call   29b3393 <scmi_devm_notifier_match+0x1a2>	29b338f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01a2  29b3393:	e9 53 ff ff ff       	jmp    29b32eb <scmi_devm_notifier_match+0xfa>
01a7  29b3398:	e8 00 00 00 00       	call   29b339d <scmi_devm_notifier_match+0x1ac>	29b3399: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01ac  29b339d:	0f 0b                	ud2
01ae  29b339f:	45 31 ff             	xor    %r15d,%r15d
01b1  29b33a2:	e9 44 ff ff ff       	jmp    29b32eb <scmi_devm_notifier_match+0xfa>
01b6  29b33a7:	44 89 f9             	mov    %r15d,%ecx
01b9  29b33aa:	80 e1 07             	and    $0x7,%cl
01bc  29b33ad:	38 c1                	cmp    %al,%cl
01be  29b33af:	0f 8c 8c fe ff ff    	jl     29b3241 <scmi_devm_notifier_match+0x50>
01c4  29b33b5:	4c 89 ff             	mov    %r15,%rdi
01c7  29b33b8:	e8 00 00 00 00       	call   29b33bd <scmi_devm_notifier_match+0x1cc>	29b33b9: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
01cc  29b33bd:	e9 7f fe ff ff       	jmp    29b3241 <scmi_devm_notifier_match+0x50>
01d1  29b33c2:	44 89 e1             	mov    %r12d,%ecx
01d4  29b33c5:	80 e1 07             	and    $0x7,%cl
01d7  29b33c8:	38 c1                	cmp    %al,%cl
01d9  29b33ca:	0f 8c 8b fe ff ff    	jl     29b325b <scmi_devm_notifier_match+0x6a>
01df  29b33d0:	4c 89 e7             	mov    %r12,%rdi
01e2  29b33d3:	e8 00 00 00 00       	call   29b33d8 <scmi_devm_notifier_match+0x1e7>	29b33d4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
01e7  29b33d8:	e9 7e fe ff ff       	jmp    29b325b <scmi_devm_notifier_match+0x6a>
01ec  29b33dd:	44 89 f9             	mov    %r15d,%ecx
01ef  29b33e0:	80 e1 07             	and    $0x7,%cl
01f2  29b33e3:	38 c1                	cmp    %al,%cl
01f4  29b33e5:	0f 8c 8d fe ff ff    	jl     29b3278 <scmi_devm_notifier_match+0x87>
01fa  29b33eb:	4c 89 ff             	mov    %r15,%rdi
01fd  29b33ee:	e8 00 00 00 00       	call   29b33f3 <scmi_devm_notifier_match+0x202>	29b33ef: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0202  29b33f3:	e9 80 fe ff ff       	jmp    29b3278 <scmi_devm_notifier_match+0x87>
0207  29b33f8:	44 89 e1             	mov    %r12d,%ecx
020a  29b33fb:	80 e1 07             	and    $0x7,%cl
020d  29b33fe:	38 c1                	cmp    %al,%cl
020f  29b3400:	0f 8c 8c fe ff ff    	jl     29b3292 <scmi_devm_notifier_match+0xa1>
0215  29b3406:	4c 89 e7             	mov    %r12,%rdi
0218  29b3409:	e8 00 00 00 00       	call   29b340e <scmi_devm_notifier_match+0x21d>	29b340a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
021d  29b340e:	e9 7f fe ff ff       	jmp    29b3292 <scmi_devm_notifier_match+0xa1>
0222  29b3413:	44 89 f1             	mov    %r14d,%ecx
0225  29b3416:	80 e1 07             	and    $0x7,%cl
0228  29b3419:	80 c1 03             	add    $0x3,%cl
022b  29b341c:	38 c1                	cmp    %al,%cl
022d  29b341e:	0f 8c 44 ff ff ff    	jl     29b3368 <scmi_devm_notifier_match+0x177>
0233  29b3424:	4c 89 f7             	mov    %r14,%rdi
0236  29b3427:	e8 00 00 00 00       	call   29b342c <scmi_devm_notifier_match+0x23b>	29b3428: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
023b  29b342c:	e9 37 ff ff ff       	jmp    29b3368 <scmi_devm_notifier_match+0x177>
0240  29b3431:	89 d9                	mov    %ebx,%ecx
0242  29b3433:	80 e1 07             	and    $0x7,%cl
0245  29b3436:	80 c1 03             	add    $0x3,%cl
0248  29b3439:	38 c1                	cmp    %al,%cl
024a  29b343b:	0f 8c 41 ff ff ff    	jl     29b3382 <scmi_devm_notifier_match+0x191>
0250  29b3441:	48 89 df             	mov    %rbx,%rdi
0253  29b3444:	e8 00 00 00 00       	call   29b3449 <scmi_devm_notifier_match+0x258>	29b3445: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0258  29b3449:	e9 34 ff ff ff       	jmp    29b3382 <scmi_devm_notifier_match+0x191>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
