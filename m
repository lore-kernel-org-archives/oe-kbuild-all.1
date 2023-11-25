Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94245443D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 06:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jY7MaCnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700893275; x=1732429275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a6SrTp5Vg7v/gQlv0cCJYMWURzgqKX9Z9l4NpMleOBc=;
  b=jY7MaCnGeUwhRWms6w6iJs/6VKO2pXp8RvEigBfBAuFZnOcDjjeiHMhw
   GnqBjP6SSBs7tcozDOomcIfpWWwVYl2YOMgLt420cpj8QWVSYeFVl/uKD
   WMtVkeurx4ZXy0o9KI+YiCLY6raeNfbwFfxG7ENV/FvceMHb0daziENTd
   KMHAqb4oej1QObhlqktSSGI/weCuqdGxETCY2ijpTt/krdEfVnR3h4eBs
   zq6h8Im+dIyVlw1aGrBXGPYekH+hZU7rAZPVr3iv6Gd010NNn+9Jp1e2a
   IIBP2kv7jf1/BVVJ7P1Tw/4A+3K5Z5kKhZIcWdrW+8g8jZmmCW52H5VWm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="382900930"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="382900930"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 22:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="717542735"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="717542735"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Nov 2023 22:21:10 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6m2N-0003hH-32;
	Sat, 25 Nov 2023 06:21:07 +0000
Date: Sat, 25 Nov 2023 14:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 8/10] vmlinux.o: warning: objtool:
 handle_bug+0x25: call to gen_endbr_poison() leaves .noinstr.text section
Message-ID: <202311251213.fGVzQVHo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   9ba52bc66d03d8fa986fb5a6d5a026702eb90747
commit: 013b1c93e2c40153c063773026e0da673641626f [8/10] Prepare for ENDBR poison to become UD1 by making #UD recognise it as a valid BUG address so we get a nice BUG splat when we trip on one.
config: x86_64-randconfig-016-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251213.fGVzQVHo-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251213.fGVzQVHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251213.fGVzQVHo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: handle_bug+0x25: call to gen_endbr_poison() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_ibrs+0x12: call to sched_smt_active() leaves .noinstr.text section


objdump-func vmlinux.o handle_bug:
0000 0000000000000540 <handle_bug>:
0000      540:	55                   	push   %rbp
0001      541:	53                   	push   %rbx
0002      542:	48 89 fb             	mov    %rdi,%rbx
0005      545:	48 8b bf 80 00 00 00 	mov    0x80(%rdi),%rdi
000c      54c:	48 b8 00 f0 ff ff ff 7f 00 00 	movabs $0x7ffffffff000,%rax
0016      556:	45 31 c0             	xor    %r8d,%r8d
0019      559:	48 39 c7             	cmp    %rax,%rdi
001c      55c:	72 15                	jb     573 <handle_bug+0x33>
001e      55e:	66 81 3f 0f 0b       	cmpw   $0xb0f,(%rdi)
0023      563:	74 14                	je     579 <handle_bug+0x39>
0025      565:	e8 00 00 00 00       	call   56a <handle_bug+0x2a>	566: R_X86_64_PC32	.text+0x70d7c
002a      56a:	bd 04 00 00 00       	mov    $0x4,%ebp
002f      56f:	39 07                	cmp    %eax,(%rdi)
0031      571:	74 0b                	je     57e <handle_bug+0x3e>
0033      573:	44 89 c0             	mov    %r8d,%eax
0036      576:	5b                   	pop    %rbx
0037      577:	5d                   	pop    %rbp
0038      578:	c3                   	ret
0039      579:	bd 02 00 00 00       	mov    $0x2,%ebp
003e      57e:	90                   	nop
003f      57f:	f6 83 91 00 00 00 02 	testb  $0x2,0x91(%rbx)
0046      586:	74 08                	je     590 <handle_bug+0x50>
0048      588:	fb                   	sti
0049      589:	48 8b bb 80 00 00 00 	mov    0x80(%rbx),%rdi
0050      590:	48 89 de             	mov    %rbx,%rsi
0053      593:	e8 00 00 00 00       	call   598 <handle_bug+0x58>	594: R_X86_64_PLT32	report_bug-0x4
0058      598:	83 f8 01             	cmp    $0x1,%eax
005b      59b:	74 1e                	je     5bb <handle_bug+0x7b>
005d      59d:	e8 00 00 00 00       	call   5a2 <handle_bug+0x62>	59e: R_X86_64_PC32	.text+0x7117c
0062      5a2:	45 31 c0             	xor    %r8d,%r8d
0065      5a5:	83 f8 01             	cmp    $0x1,%eax
0068      5a8:	74 11                	je     5bb <handle_bug+0x7b>
006a      5aa:	f6 83 91 00 00 00 02 	testb  $0x2,0x91(%rbx)
0071      5b1:	74 01                	je     5b4 <handle_bug+0x74>
0073      5b3:	fa                   	cli
0074      5b4:	90                   	nop
0075      5b5:	44 89 c0             	mov    %r8d,%eax
0078      5b8:	5b                   	pop    %rbx
0079      5b9:	5d                   	pop    %rbp
007a      5ba:	c3                   	ret
007b      5bb:	48 01 ab 80 00 00 00 	add    %rbp,0x80(%rbx)
0082      5c2:	41 b8 01 00 00 00    	mov    $0x1,%r8d
0088      5c8:	eb e0                	jmp    5aa <handle_bug+0x6a>
008a      5ca:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0095      5d5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
00a0      5e0:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
00ab      5eb:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
00b6      5f6:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
