Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7781541202
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 23:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLnzw4WG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701818702; x=1733354702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oa+rzJJcL3HLQy0YxUS7vlZs83mIJihrF/UCDKkCgbA=;
  b=QLnzw4WG0waKAAJOxPqxS8PFZ20kja3Bpp0YnK0wWuvEE+CimJ8xgfzX
   w+/z+rpVHOUPuzA3QPO+BPLRQeBFADbTBH79/H44t9HvuQBfbhe1GqatK
   lGpxJLSpUHfTJGsupD9Rmdg9hI4TkcQYvmM8H2yzFHv/0rFwdC05CqEiQ
   fGSY8QI3J0uMYrdkuWpyCp1+19AhLi3vt7Z6O8buLswfQ38ypU8xhOGAq
   jSw+6Um4pOmlO2TWyv+AbsMOAtqlbEaOP1KYGtItQOrg1O5LqyPQBZXJa
   biokBK2iP4Y3h+JiAdEBlRWIfQwUrK18bP67ELZBxpk3hSbEa+E1zMVdS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="480173525"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="480173525"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 15:25:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="861916799"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="861916799"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2023 15:25:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAemg-0009rq-0e;
	Tue, 05 Dec 2023 23:24:58 +0000
Date: Wed, 6 Dec 2023 07:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/kvm 11/11] vmlinux.o: warning: objtool:
 fastop+0x12b: missing int3 after indirect jump
Message-ID: <202312060746.hC2HRjj7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   bd8e1c4c02ac085925674bddccb989e2d7d6cc2d
commit: bd8e1c4c02ac085925674bddccb989e2d7d6cc2d [11/11] x86/kvm/emulate: Avoid RET for fastops
config: x86_64-randconfig-071-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060746.hC2HRjj7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060746.hC2HRjj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060746.hC2HRjj7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: fastop+0x12b: missing int3 after indirect jump


objdump-func vmlinux.o fastop:
0000 000000000012c100 <fastop>:
0000   12c100:	55                   	push   %rbp
0001   12c101:	53                   	push   %rbx
0002   12c102:	48 89 fb             	mov    %rdi,%rbx
0005   12c105:	48 83 ec 18          	sub    $0x18,%rsp
0009   12c109:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0013   12c113:	48 83 c7 10          	add    $0x10,%rdi
0017   12c117:	48 89 fa             	mov    %rdi,%rdx
001a   12c11a:	48 c1 ea 03          	shr    $0x3,%rdx
001e   12c11e:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0022   12c122:	0f 85 0c 02 00 00    	jne    12c334 <fastop_return+0x107>
0028   12c128:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0032   12c132:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
0036   12c136:	81 e7 d5 08 00 00    	and    $0x8d5,%edi
003c   12c13c:	48 81 cf 00 02 00 00 	or     $0x200,%rdi
0043   12c143:	48 89 fd             	mov    %rdi,%rbp
0046   12c146:	48 8d bb 80 00 00 00 	lea    0x80(%rbx),%rdi
004d   12c14d:	48 89 fa             	mov    %rdi,%rdx
0050   12c150:	48 c1 ea 03          	shr    $0x3,%rdx
0054   12c154:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0058   12c158:	0f 85 c4 01 00 00    	jne    12c322 <fastop_return+0xf5>
005e   12c15e:	f6 83 80 00 00 00 01 	testb  $0x1,0x80(%rbx)
0065   12c165:	75 43                	jne    12c1aa <fastop+0xaa>
0067   12c167:	48 8d bb 14 01 00 00 	lea    0x114(%rbx),%rdi
006e   12c16e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0078   12c178:	48 89 fa             	mov    %rdi,%rdx
007b   12c17b:	48 c1 ea 03          	shr    $0x3,%rdx
007f   12c17f:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0083   12c183:	48 89 f8             	mov    %rdi,%rax
0086   12c186:	83 e0 07             	and    $0x7,%eax
0089   12c189:	83 c0 03             	add    $0x3,%eax
008c   12c18c:	38 d0                	cmp    %dl,%al
008e   12c18e:	7c 08                	jl     12c198 <fastop+0x98>
0090   12c190:	84 d2                	test   %dl,%dl
0092   12c192:	0f 85 78 01 00 00    	jne    12c310 <fastop_return+0xe3>
0098   12c198:	8b 83 14 01 00 00    	mov    0x114(%rbx),%eax
009e   12c19e:	f3 48 0f bc c0       	tzcnt  %rax,%rax
00a3   12c1a3:	48 c1 e0 04          	shl    $0x4,%rax
00a7   12c1a7:	48 01 c6             	add    %rax,%rsi
00aa   12c1aa:	48 8d bb 00 01 00 00 	lea    0x100(%rbx),%rdi
00b1   12c1b1:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00bb   12c1bb:	48 89 fa             	mov    %rdi,%rdx
00be   12c1be:	48 c1 ea 03          	shr    $0x3,%rdx
00c2   12c1c2:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
00c6   12c1c6:	0f 85 96 01 00 00    	jne    12c362 <fastop_return+0x135>
00cc   12c1cc:	48 8d bb 40 01 00 00 	lea    0x140(%rbx),%rdi
00d3   12c1d3:	48 8b 8b 00 01 00 00 	mov    0x100(%rbx),%rcx
00da   12c1da:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00e4   12c1e4:	48 89 fa             	mov    %rdi,%rdx
00e7   12c1e7:	48 c1 ea 03          	shr    $0x3,%rdx
00eb   12c1eb:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
00ef   12c1ef:	0f 85 51 01 00 00    	jne    12c346 <fastop_return+0x119>
00f5   12c1f5:	48 8d bb c0 00 00 00 	lea    0xc0(%rbx),%rdi
00fc   12c1fc:	48 8b 83 40 01 00 00 	mov    0x140(%rbx),%rax
0103   12c203:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
010d   12c20d:	49 89 f8             	mov    %rdi,%r8
0110   12c210:	49 c1 e8 03          	shr    $0x3,%r8
0114   12c214:	41 80 3c 10 00       	cmpb   $0x0,(%r8,%rdx,1)
0119   12c219:	0f 85 55 01 00 00    	jne    12c374 <fastop_return+0x147>
011f   12c21f:	48 8b 93 c0 00 00 00 	mov    0xc0(%rbx),%rdx
0126   12c226:	48 89 ef             	mov    %rbp,%rdi
0129   12c229:	57                   	push   %rdi
012a   12c22a:	9d                   	popf
012b   12c22b:	ff e6                	jmp    *%rsi
0000 000000000012c22d <fastop_return>:
0000   12c22d:	9c                   	pushf
0001   12c22e:	5f                   	pop    %rdi
0002   12c22f:	48 89 83 40 01 00 00 	mov    %rax,0x140(%rbx)
0009   12c236:	48 8b 43 10          	mov    0x10(%rbx),%rax
000d   12c23a:	81 e7 d5 08 00 00    	and    $0x8d5,%edi
0013   12c240:	48 89 93 c0 00 00 00 	mov    %rdx,0xc0(%rbx)
001a   12c247:	48 25 2a f7 ff ff    	and    $0xfffffffffffff72a,%rax
0020   12c24d:	48 09 f8             	or     %rdi,%rax
0023   12c250:	48 89 43 10          	mov    %rax,0x10(%rbx)
0027   12c254:	31 c0                	xor    %eax,%eax
0029   12c256:	48 85 f6             	test   %rsi,%rsi
002c   12c259:	74 13                	je     12c26e <fastop_return+0x41>
002e   12c25b:	48 83 c4 18          	add    $0x18,%rsp
0032   12c25f:	5b                   	pop    %rbx
0033   12c260:	5d                   	pop    %rbp
0034   12c261:	31 d2                	xor    %edx,%edx
0036   12c263:	31 c9                	xor    %ecx,%ecx
0038   12c265:	31 f6                	xor    %esi,%esi
003a   12c267:	31 ff                	xor    %edi,%edi
003c   12c269:	45 31 c0             	xor    %r8d,%r8d
003f   12c26c:	c3                   	ret
0040   12c26d:	cc                   	int3
0041   12c26e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
004b   12c278:	48 8d 7b 30          	lea    0x30(%rbx),%rdi
004f   12c27c:	48 89 fa             	mov    %rdi,%rdx
0052   12c27f:	48 c1 ea 03          	shr    $0x3,%rdx
0056   12c283:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
005a   12c287:	84 c0                	test   %al,%al
005c   12c289:	74 06                	je     12c291 <fastop_return+0x64>
005e   12c28b:	0f 8e 1d 01 00 00    	jle    12c3ae <fastop_return+0x181>
0064   12c291:	48 8d 7b 32          	lea    0x32(%rbx),%rdi
0068   12c295:	c6 43 30 00          	movb   $0x0,0x30(%rbx)
006c   12c299:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0076   12c2a3:	48 89 fa             	mov    %rdi,%rdx
0079   12c2a6:	48 c1 ea 03          	shr    $0x3,%rdx
007d   12c2aa:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0081   12c2ae:	48 89 f8             	mov    %rdi,%rax
0084   12c2b1:	83 e0 07             	and    $0x7,%eax
0087   12c2b4:	83 c0 01             	add    $0x1,%eax
008a   12c2b7:	38 d0                	cmp    %dl,%al
008c   12c2b9:	7c 08                	jl     12c2c3 <fastop_return+0x96>
008e   12c2bb:	84 d2                	test   %dl,%dl
0090   12c2bd:	0f 85 e1 00 00 00    	jne    12c3a4 <fastop_return+0x177>
0096   12c2c3:	48 8d 7b 31          	lea    0x31(%rbx),%rdi
009a   12c2c7:	31 c0                	xor    %eax,%eax
009c   12c2c9:	48 89 fa             	mov    %rdi,%rdx
009f   12c2cc:	66 89 43 32          	mov    %ax,0x32(%rbx)
00a3   12c2d0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00ad   12c2da:	48 c1 ea 03          	shr    $0x3,%rdx
00b1   12c2de:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
00b5   12c2e2:	48 89 fa             	mov    %rdi,%rdx
00b8   12c2e5:	83 e2 07             	and    $0x7,%edx
00bb   12c2e8:	38 d0                	cmp    %dl,%al
00bd   12c2ea:	7f 08                	jg     12c2f4 <fastop_return+0xc7>
00bf   12c2ec:	84 c0                	test   %al,%al
00c1   12c2ee:	0f 85 a6 00 00 00    	jne    12c39a <fastop_return+0x16d>
00c7   12c2f4:	c6 43 31 00          	movb   $0x0,0x31(%rbx)
00cb   12c2f8:	48 83 c4 18          	add    $0x18,%rsp
00cf   12c2fc:	b8 02 00 00 00       	mov    $0x2,%eax
00d4   12c301:	5b                   	pop    %rbx
00d5   12c302:	5d                   	pop    %rbp
00d6   12c303:	31 d2                	xor    %edx,%edx
00d8   12c305:	31 c9                	xor    %ecx,%ecx
00da   12c307:	31 f6                	xor    %esi,%esi
00dc   12c309:	31 ff                	xor    %edi,%edi
00de   12c30b:	45 31 c0             	xor    %r8d,%r8d
00e1   12c30e:	c3                   	ret
00e2   12c30f:	cc                   	int3
00e3   12c310:	48 89 34 24          	mov    %rsi,(%rsp)
00e7   12c314:	e8 00 00 00 00       	call   12c319 <fastop_return+0xec>	12c315: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
00ec   12c319:	48 8b 34 24          	mov    (%rsp),%rsi
00f0   12c31d:	e9 76 fe ff ff       	jmp    12c198 <fastop+0x98>
00f5   12c322:	48 89 34 24          	mov    %rsi,(%rsp)
00f9   12c326:	e8 00 00 00 00       	call   12c32b <fastop_return+0xfe>	12c327: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00fe   12c32b:	48 8b 34 24          	mov    (%rsp),%rsi
0102   12c32f:	e9 2a fe ff ff       	jmp    12c15e <fastop+0x5e>
0107   12c334:	48 89 34 24          	mov    %rsi,(%rsp)
010b   12c338:	e8 00 00 00 00       	call   12c33d <fastop_return+0x110>	12c339: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0110   12c33d:	48 8b 34 24          	mov    (%rsp),%rsi
0114   12c341:	e9 e2 fd ff ff       	jmp    12c128 <fastop+0x28>
0119   12c346:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
011e   12c34b:	48 89 0c 24          	mov    %rcx,(%rsp)
0122   12c34f:	e8 00 00 00 00       	call   12c354 <fastop_return+0x127>	12c350: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0127   12c354:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
012c   12c359:	48 8b 0c 24          	mov    (%rsp),%rcx
0130   12c35d:	e9 93 fe ff ff       	jmp    12c1f5 <fastop+0xf5>
0135   12c362:	48 89 34 24          	mov    %rsi,(%rsp)
0139   12c366:	e8 00 00 00 00       	call   12c36b <fastop_return+0x13e>	12c367: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
013e   12c36b:	48 8b 34 24          	mov    (%rsp),%rsi
0142   12c36f:	e9 58 fe ff ff       	jmp    12c1cc <fastop+0xcc>
0147   12c374:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
014c   12c379:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0151   12c37e:	48 89 0c 24          	mov    %rcx,(%rsp)
0155   12c382:	e8 00 00 00 00       	call   12c387 <fastop_return+0x15a>	12c383: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
015a   12c387:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
015f   12c38c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0164   12c391:	48 8b 0c 24          	mov    (%rsp),%rcx
0168   12c395:	e9 85 fe ff ff       	jmp    12c21f <fastop+0x11f>
016d   12c39a:	e8 00 00 00 00       	call   12c39f <fastop_return+0x172>	12c39b: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
0172   12c39f:	e9 50 ff ff ff       	jmp    12c2f4 <fastop_return+0xc7>
0177   12c3a4:	e8 00 00 00 00       	call   12c3a9 <fastop_return+0x17c>	12c3a5: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
017c   12c3a9:	e9 15 ff ff ff       	jmp    12c2c3 <fastop_return+0x96>
0181   12c3ae:	e8 00 00 00 00       	call   12c3b3 <fastop_return+0x186>	12c3af: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
0186   12c3b3:	e9 d9 fe ff ff       	jmp    12c291 <fastop_return+0x64>
018b   12c3b8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
