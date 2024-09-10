Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3EF19EEC8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 20:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726001954; cv=none; b=bStJtagwmMzwWfKTElSI4n7vf1SQwpr5l4+g+Gor1fngYppQeR/E4pgETMbOwhk6I8Ieiu/YNFK5ttmX7nhkrzp9HCpMN2jjnfkkKZwp8etgKOkaR5UzpngJsJJo337OP2U+XQDlk3bMJ6H8ecJpRT2N2xtTa5C0q9abWYvvkyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726001954; c=relaxed/simple;
	bh=oyxdr9pw6g28mHfU7Z2NRB49E0cFpTaAU4bEE186tVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hxGNaKx5RwTNrqTXlZUH9g4ok0lu9x1K0woTsNIufoZLyKhbCXcdhcvKpp6iMwSWXoznlvGkpoKuf3iAuVc/wKaNGkw6ClJQIe/I5O+x9Kh28606XRaR9JC6wBArdP2aahY5z/+9jGOcs2H2H8Mu3eZPEifpS9IDNNEc9WHtPWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SF8itkgF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SF8itkgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726001951; x=1757537951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oyxdr9pw6g28mHfU7Z2NRB49E0cFpTaAU4bEE186tVQ=;
  b=SF8itkgFmFfT5f8q7euQ+zlI+bx2jhV3H3LmEdwMNsJ8GgScwf6gyuMk
   utoWAxLJQl354fVs9hjmHTMJUlFqgziKiwD7ySD+0sqG+gt4lTcPVNPZc
   R270B7/WJMAsC3R5ppEHFmM7TD3LxKdrYVhAhPsEnoj54BYaYxXht9/Jx
   vG28HHaSnHRcSbdQF37F0AyXbxvaYsAvK43I9Or3eznTDJlAr7ieWNGPr
   QjOAoJwlRRTFMz69xm5sXdwQFvZYDUHyzTJGhN9bUwacpVHlp/k0zn1Tt
   GYltowgdNMFDOzrfcdalAP5IDL9ewJuIOdv6gsEWIlYK/NnNab0n6QLJz
   A==;
X-CSE-ConnectionGUID: kZliNd7vSbavXXYaZgIdJw==
X-CSE-MsgGUID: Jj5oqbssR8KsZ7pwaP95NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36154809"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="36154809"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 13:59:10 -0700
X-CSE-ConnectionGUID: UWhpTsTVSfiH60BRhyjnxQ==
X-CSE-MsgGUID: eror+nZQTRe8/fVHu9OQ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="67906028"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2024 13:59:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so7x5-0002ha-1b;
	Tue, 10 Sep 2024 20:59:07 +0000
Date: Wed, 11 Sep 2024 04:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 1/1] vmlinux.o: warning:
 objtool: exc_page_fault()+0x186: call to printk() leaves .noinstr.text
 section
Message-ID: <202409110402.tnYM6X5M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   eda496b71ba25af137e1c3a28a89c6c77eb30397
commit: e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf [1/1] ANDROID: Add kiwi_fault_logging kernel parameter
config: x86_64-buildonly-randconfig-003-20240911 (https://download.01.org/0day-ci/archive/20240911/202409110402.tnYM6X5M-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110402.tnYM6X5M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110402.tnYM6X5M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: mce_setup()+0x4c: call to cpuid_eax.constprop.0() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_read_aux()+0xc9: call to mca_msr_reg() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0xc5: call to mce_gather_info() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: exc_page_fault()+0x186: call to printk() leaves .noinstr.text section


objdump-func vmlinux.o exc_page_fault:
0000 0000000000002f40 <exc_page_fault>:
0000     2f40:	41 55                	push   %r13
0002     2f42:	41 54                	push   %r12
0004     2f44:	55                   	push   %rbp
0005     2f45:	48 89 f5             	mov    %rsi,%rbp
0008     2f48:	53                   	push   %rbx
0009     2f49:	48 89 fb             	mov    %rdi,%rbx
000c     2f4c:	41 0f 20 d5          	mov    %cr2,%r13
0010     2f50:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 2f57 <exc_page_fault+0x17>	2f52: R_X86_64_PC32	kiwi_fault_logging-0x5
0017     2f57:	0f 85 3a 01 00 00    	jne    3097 <exc_page_fault+0x157>
001d     2f5d:	65 48 8b 04 25 00 00 00 00 	mov    %gs:0x0,%rax	2f62: R_X86_64_32S	current_task
0026     2f66:	48 8b 80 48 04 00 00 	mov    0x448(%rax),%rax
002d     2f6d:	0f 18 88 08 01 00 00 	prefetcht0 0x108(%rax)
0034     2f74:	48 89 df             	mov    %rbx,%rdi
0037     2f77:	e8 00 00 00 00       	call   2f7c <exc_page_fault+0x3c>	2f78: R_X86_64_PLT32	irqentry_enter-0x4
003c     2f7c:	41 89 c4             	mov    %eax,%r12d
003f     2f7f:	90                   	nop
0040     2f80:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 2f86 <exc_page_fault+0x46>	2f82: R_X86_64_PC32	trace_pagefault_key-0x4
0046     2f86:	85 c0                	test   %eax,%eax
0048     2f88:	7f 2d                	jg     2fb7 <exc_page_fault+0x77>
004a     2f8a:	4c 89 ef             	mov    %r13,%rdi
004d     2f8d:	e8 00 00 00 00       	call   2f92 <exc_page_fault+0x52>	2f8e: R_X86_64_PLT32	fault_in_kernel_space-0x4
0052     2f92:	84 c0                	test   %al,%al
0054     2f94:	75 52                	jne    2fe8 <exc_page_fault+0xa8>
0056     2f96:	4c 89 ea             	mov    %r13,%rdx
0059     2f99:	48 89 ee             	mov    %rbp,%rsi
005c     2f9c:	48 89 df             	mov    %rbx,%rdi
005f     2f9f:	e8 00 00 00 00       	call   2fa4 <exc_page_fault+0x64>	2fa0: R_X86_64_PC32	.text+0x4935c
0064     2fa4:	fa                   	cli
0065     2fa5:	90                   	nop
0066     2fa6:	44 89 e6             	mov    %r12d,%esi
0069     2fa9:	48 89 df             	mov    %rbx,%rdi
006c     2fac:	5b                   	pop    %rbx
006d     2fad:	5d                   	pop    %rbp
006e     2fae:	41 5c                	pop    %r12
0070     2fb0:	41 5d                	pop    %r13
0072     2fb2:	e9 00 00 00 00       	jmp    2fb7 <exc_page_fault+0x77>	2fb3: R_X86_64_PLT32	irqentry_exit-0x4
0077     2fb7:	f6 83 88 00 00 00 03 	testb  $0x3,0x88(%rbx)
007e     2fbe:	74 47                	je     3007 <exc_page_fault+0xc7>
0080     2fc0:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 2fc6 <exc_page_fault+0x86>	2fc2: R_X86_64_PC32	__tracepoint_page_fault_user+0x4
0086     2fc6:	85 c0                	test   %eax,%eax
0088     2fc8:	0f 8f 81 00 00 00    	jg     304f <exc_page_fault+0x10f>
008e     2fce:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 2fd5 <exc_page_fault+0x95>	2fd1: R_X86_64_PC32	cpu_number-0x4
0095     2fd5:	89 c0                	mov    %eax,%eax
0097     2fd7:	48 0f a3 05 00 00 00 00 	bt     %rax,0x0(%rip)        # 2fdf <exc_page_fault+0x9f>	2fdb: R_X86_64_PC32	__cpu_online_mask-0x4
009f     2fdf:	73 a9                	jae    2f8a <exc_page_fault+0x4a>
00a1     2fe1:	e8 00 00 00 00       	call   2fe6 <exc_page_fault+0xa6>	2fe2: R_X86_64_PLT32	rcu_is_watching-0x4
00a6     2fe6:	eb a2                	jmp    2f8a <exc_page_fault+0x4a>
00a8     2fe8:	4c 89 ee             	mov    %r13,%rsi
00ab     2feb:	48 89 ef             	mov    %rbp,%rdi
00ae     2fee:	e8 00 00 00 00       	call   2ff3 <exc_page_fault+0xb3>	2fef: R_X86_64_PC32	.text+0x4978c
00b3     2ff3:	85 c0                	test   %eax,%eax
00b5     2ff5:	75 ae                	jne    2fa5 <exc_page_fault+0x65>
00b7     2ff7:	4c 89 ea             	mov    %r13,%rdx
00ba     2ffa:	48 89 ee             	mov    %rbp,%rsi
00bd     2ffd:	48 89 df             	mov    %rbx,%rdi
00c0     3000:	e8 00 00 00 00       	call   3005 <exc_page_fault+0xc5>	3001: R_X86_64_PC32	.text+0x4912c
00c5     3005:	eb 9e                	jmp    2fa5 <exc_page_fault+0x65>
00c7     3007:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 300d <exc_page_fault+0xcd>	3009: R_X86_64_PC32	__tracepoint_page_fault_kernel+0x4
00cd     300d:	85 c0                	test   %eax,%eax
00cf     300f:	7e bd                	jle    2fce <exc_page_fault+0x8e>
00d1     3011:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3018 <exc_page_fault+0xd8>	3014: R_X86_64_PC32	cpu_number-0x4
00d8     3018:	89 c0                	mov    %eax,%eax
00da     301a:	48 0f a3 05 00 00 00 00 	bt     %rax,0x0(%rip)        # 3022 <exc_page_fault+0xe2>	301e: R_X86_64_PC32	__cpu_online_mask-0x4
00e2     3022:	0f 83 62 ff ff ff    	jae    2f8a <exc_page_fault+0x4a>
00e8     3028:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 302f <exc_page_fault+0xef>	302b: R_X86_64_PC32	__preempt_count-0x4
00ef     302f:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 3036 <exc_page_fault+0xf6>	3032: R_X86_64_PC32	__tracepoint_page_fault_kernel+0x34
00f6     3036:	48 85 c0             	test   %rax,%rax
00f9     3039:	74 50                	je     308b <exc_page_fault+0x14b>
00fb     303b:	48 8b 78 08          	mov    0x8(%rax),%rdi
00ff     303f:	48 89 e9             	mov    %rbp,%rcx
0102     3042:	48 89 da             	mov    %rbx,%rdx
0105     3045:	4c 89 ee             	mov    %r13,%rsi
0108     3048:	e8 00 00 00 00       	call   304d <exc_page_fault+0x10d>	3049: R_X86_64_PLT32	__SCT__tp_func_page_fault_kernel-0x4
010d     304d:	eb 3c                	jmp    308b <exc_page_fault+0x14b>
010f     304f:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3056 <exc_page_fault+0x116>	3052: R_X86_64_PC32	cpu_number-0x4
0116     3056:	89 c0                	mov    %eax,%eax
0118     3058:	48 0f a3 05 00 00 00 00 	bt     %rax,0x0(%rip)        # 3060 <exc_page_fault+0x120>	305c: R_X86_64_PC32	__cpu_online_mask-0x4
0120     3060:	0f 83 24 ff ff ff    	jae    2f8a <exc_page_fault+0x4a>
0126     3066:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 306d <exc_page_fault+0x12d>	3069: R_X86_64_PC32	__preempt_count-0x4
012d     306d:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 3074 <exc_page_fault+0x134>	3070: R_X86_64_PC32	__tracepoint_page_fault_user+0x34
0134     3074:	48 85 c0             	test   %rax,%rax
0137     3077:	74 12                	je     308b <exc_page_fault+0x14b>
0139     3079:	48 8b 78 08          	mov    0x8(%rax),%rdi
013d     307d:	48 89 e9             	mov    %rbp,%rcx
0140     3080:	48 89 da             	mov    %rbx,%rdx
0143     3083:	4c 89 ee             	mov    %r13,%rsi
0146     3086:	e8 00 00 00 00       	call   308b <exc_page_fault+0x14b>	3087: R_X86_64_PLT32	__SCT__tp_func_page_fault_user-0x4
014b     308b:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 3092 <exc_page_fault+0x152>	308e: R_X86_64_PC32	__preempt_count-0x4
0152     3092:	e9 37 ff ff ff       	jmp    2fce <exc_page_fault+0x8e>
0157     3097:	65 48 8b 04 25 00 00 00 00 	mov    %gs:0x0,%rax	309c: R_X86_64_32S	current_task
0160     30a0:	8b 90 f8 04 00 00    	mov    0x4f8(%rax),%edx
0166     30a6:	55                   	push   %rbp
0167     30a7:	48 8d b0 a8 07 00 00 	lea    0x7a8(%rax),%rsi
016e     30ae:	4c 89 e9             	mov    %r13,%rcx
0171     30b1:	4c 8b 8f 98 00 00 00 	mov    0x98(%rdi),%r9
0178     30b8:	4c 8b 87 80 00 00 00 	mov    0x80(%rdi),%r8
017f     30bf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	30c2: R_X86_64_32S	.rodata.str1.8+0x9560
0186     30c6:	e8 00 00 00 00       	call   30cb <exc_page_fault+0x18b>	30c7: R_X86_64_PLT32	printk-0x4
018b     30cb:	58                   	pop    %rax
018c     30cc:	e9 8c fe ff ff       	jmp    2f5d <exc_page_fault+0x1d>
0191     30d1:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
019b     30db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
