Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4D27E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693047042; x=1724583042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b3uimjeveIrlSjXot+ZUB1x+L3wdO/qMhRh0sSKjMMA=;
  b=A1w2652bwoK/3benwZs/U86DZJWtzinQWiO0QYo0/tHmCn7mi1oEHA1S
   H3ka6o4MWs4Iba/XHItGvtGEkY97FMmxVpQAP4YUMDvQNJwqxUliSiA9a
   rvvQUEXgD32ZNd/xf5lc41RjNa73Ld6SrSEBnBDSqFb814ciGKIFwtHZR
   qvwJ/ebgwRao0uU8/PszTU3Ul/IUTBoDngkiHNChBvfGDTlb+Sa1MjoGT
   qBfdSzBn8bUcBzecUfPJ8ufyQvCZPdFTK7Y4zlwTapaloUUpHBQJffaxp
   w0kejW6gx0H1P1KCfov4hfSj6WkB1s7FmhvxZeAqSuJ9X1tA73QMN8lFq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359858510"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="359858510"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 03:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="861322928"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="861322928"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Aug 2023 03:50:40 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZqsJ-0004cd-15;
	Sat, 26 Aug 2023 10:50:39 +0000
Date: Sat, 26 Aug 2023 18:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-6.1.y 4392/8877] vmlinux.o: warning: objtool:
 native_sched_clock+0x70: unreachable instruction
Message-ID: <202308261800.7546XPsi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   802aacbbffe2512dce9f8f33ad99d01cfec435de
commit: adfc7aaa0df91e567f8f01f6066f385328d32e86 [4392/8877] entry: Fix noinstr warning in __enter_from_user_mode()
config: x86_64-randconfig-011-20230824 (https://download.01.org/0day-ci/archive/20230826/202308261800.7546XPsi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261800.7546XPsi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261800.7546XPsi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: native_sched_clock+0x70: unreachable instruction


objdump-func vmlinux.o native_sched_clock:
0000 0000000000046362 <native_sched_clock>:
0000    46362:	f3 0f 1e fa          	endbr64
0004    46366:	53                   	push   %rbx
0005    46367:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 4636d <native_sched_clock+0xb>	46369: R_X86_64_PC32	.bss+0x513c
000b    4636d:	85 c0                	test   %eax,%eax
000d    4636f:	7e 63                	jle    463d4 <native_sched_clock+0x72>
000f    46371:	0f 31                	rdtsc
0011    46373:	48 89 d7             	mov    %rdx,%rdi
0014    46376:	48 c1 e7 20          	shl    $0x20,%rdi
0018    4637a:	48 09 c7             	or     %rax,%rdi
001b    4637d:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 46383 <native_sched_clock+0x21>	4637f: R_X86_64_PC32	__preempt_count-0x4
0021    46383:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx        # 46389 <native_sched_clock+0x27>	46385: R_X86_64_PC32	.data..shared_aligned+0x1c
0027    46389:	89 d0                	mov    %edx,%eax
0029    4638b:	83 e0 01             	and    $0x1,%eax
002c    4638e:	48 89 c1             	mov    %rax,%rcx
002f    46391:	48 c1 e1 04          	shl    $0x4,%rcx
0033    46395:	48 8b 99 00 00 00 00 	mov    0x0(%rcx),%rbx	46398: R_X86_64_32S	.data..shared_aligned+0x8
003a    4639c:	48 89 c1             	mov    %rax,%rcx
003d    4639f:	48 c1 e1 04          	shl    $0x4,%rcx
0041    463a3:	8b b1 00 00 00 00    	mov    0x0(%rcx),%esi	463a5: R_X86_64_32S	.data..shared_aligned
0047    463a9:	44 8b 81 00 00 00 00 	mov    0x0(%rcx),%r8d	463ac: R_X86_64_32S	.data..shared_aligned+0x4
004e    463b0:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 463b6 <native_sched_clock+0x54>	463b2: R_X86_64_PC32	.data..shared_aligned+0x1c
0054    463b6:	39 c2                	cmp    %eax,%edx
0056    463b8:	75 c9                	jne    46383 <native_sched_clock+0x21>
0058    463ba:	44 89 c2             	mov    %r8d,%edx
005b    463bd:	e8 40 ff ff ff       	call   46302 <mul_u64_u32_shr>
0060    463c2:	48 01 d8             	add    %rbx,%rax
0063    463c5:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 463cb <native_sched_clock+0x69>	463c7: R_X86_64_PC32	__preempt_count-0x4
0069    463cb:	75 45                	jne    46412 <native_sched_clock+0xb0>
006b    463cd:	e8 00 00 00 00       	call   463d2 <native_sched_clock+0x70>	463ce: R_X86_64_PLT32	preempt_schedule_notrace_thunk-0x4
0070    463d2:	eb 3e                	jmp    46412 <native_sched_clock+0xb0>
0072    463d4:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	463d7: R_X86_64_32S	jiffies_64
0079    463db:	ba ff ff 37 00       	mov    $0x37ffff,%edx
007e    463e0:	48 c1 e8 03          	shr    $0x3,%rax
0082    463e4:	48 c1 e2 2a          	shl    $0x2a,%rdx
0086    463e8:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
008a    463ec:	74 0c                	je     463fa <native_sched_clock+0x98>
008c    463ee:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	463f1: R_X86_64_32S	jiffies_64
0093    463f5:	e8 00 00 00 00       	call   463fa <native_sched_clock+0x98>	463f6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0098    463fa:	48 69 05 00 00 00 00 d5 dc 32 00 	imul   $0x32dcd5,0x0(%rip),%rax        # 46405 <native_sched_clock+0xa3>	463fd: R_X86_64_PC32	jiffies_64-0x8
00a3    46405:	48 ba d0 42 64 d9 70 23 cd ff 	movabs $0xffcd2370d96442d0,%rdx
00ad    4640f:	48 01 d0             	add    %rdx,%rax
00b0    46412:	5b                   	pop    %rbx
00b1    46413:	c3                   	ret
00b2    46414:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
