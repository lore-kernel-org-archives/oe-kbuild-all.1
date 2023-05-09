Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205D814A80
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 18:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683657986; x=1715193986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yKvkjrZ48nnY3fzoHUiYbXZSdiEYwrGq8Drle5ptEaU=;
  b=gVY97Ctyj/8ju5712T2WDtPiQA7I1w2LDcDTekdVaQohEnrfvUWKtl0S
   +GbnlyPK1SHjj8iWZJ2/sIdu6HOJl4MEqGYMv+PyWxw3GG0kXLPT0g1nE
   b6hVzqTY0l9B7iaMCGyPiPJtpAr4m9hX20w2xzj99gkftUG04qoUja/ud
   qNuasgwwCXnfeealoqL/esrKqn/A9CYRwHab/GezEtzBUmRg1wVewK4lp
   FLgjSspf8Iq4r/ndSZEAaqgRr/zwvoLcfhdBEhAXzgaMCrzT0fwEolDmM
   Y7y4YtQTn8II6L2t0KZzQB0oUzHRCQ+ufR+xhfDa1W1QyuyhZNP+EgRHO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="347488321"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="347488321"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 11:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="701979019"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="701979019"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 May 2023 11:46:24 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwSLv-0002OG-1l;
	Tue, 09 May 2023 18:46:23 +0000
Date: Wed, 10 May 2023 02:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/clock 7/9] vmlinux.o: warning: objtool:
 read_hv_sched_clock_tsc+0x5a: call to mul_u64_u64_shr.constprop.0() leaves
 .noinstr.text section
Message-ID: <202305100243.qjhyq5Zv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/clock
head:   cff652516d21cc0acddc316c871ed5ae5dc64909
commit: 0ed33e636a5875dec149e2f7ddc64412bdabd8aa [7/9] x86/tsc: Provide sched_clock_noinstr()
config: x86_64-randconfig-a012-20230508 (https://download.01.org/0day-ci/archive/20230510/202305100243.qjhyq5Zv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=0ed33e636a5875dec149e2f7ddc64412bdabd8aa
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/clock
        git checkout 0ed33e636a5875dec149e2f7ddc64412bdabd8aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100243.qjhyq5Zv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: local_clock+0x6: call to sched_clock() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: read_hv_sched_clock_tsc+0x5a: call to mul_u64_u64_shr.constprop.0() leaves .noinstr.text section


objdump-func vmlinux.o read_hv_sched_clock_tsc:
0000 0000000000002e2e <read_hv_sched_clock_tsc>:
0000     2e2e:	f3 0f 1e fa          	endbr64
0004     2e32:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 2e39 <read_hv_sched_clock_tsc+0xb>	2e35: R_X86_64_PC32	.data+0x12eb7fc
000b     2e39:	8b 3e                	mov    (%rsi),%edi
000d     2e3b:	85 ff                	test   %edi,%edi
000f     2e3d:	75 1c                	jne    2e5b <read_hv_sched_clock_tsc+0x2d>
0011     2e3f:	48 83 c8 ff          	or     $0xffffffffffffffff,%rax
0015     2e43:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 2e4a <read_hv_sched_clock_tsc+0x1c>	2e46: R_X86_64_PC32	.data..ro_after_init+0x7a14
001c     2e4a:	48 6b c0 64          	imul   $0x64,%rax,%rax
0020     2e4e:	31 d2                	xor    %edx,%edx
0022     2e50:	31 c9                	xor    %ecx,%ecx
0024     2e52:	31 f6                	xor    %esi,%esi
0026     2e54:	31 ff                	xor    %edi,%edi
0028     2e56:	45 31 c0             	xor    %r8d,%r8d
002b     2e59:	c3                   	ret
002c     2e5a:	cc                   	int3
002d     2e5b:	53                   	push   %rbx
002e     2e5c:	4c 8b 46 08          	mov    0x8(%rsi),%r8
0032     2e60:	48 8b 5e 10          	mov    0x10(%rsi),%rbx
0036     2e64:	0f 31                	rdtsc
0038     2e66:	90                   	nop
0039     2e67:	90                   	nop
003a     2e68:	90                   	nop
003b     2e69:	8b 0e                	mov    (%rsi),%ecx
003d     2e6b:	39 cf                	cmp    %ecx,%edi
003f     2e6d:	74 0c                	je     2e7b <read_hv_sched_clock_tsc+0x4d>
0041     2e6f:	8b 3e                	mov    (%rsi),%edi
0043     2e71:	85 ff                	test   %edi,%edi
0045     2e73:	75 e7                	jne    2e5c <read_hv_sched_clock_tsc+0x2e>
0047     2e75:	48 83 c8 ff          	or     $0xffffffffffffffff,%rax
004b     2e79:	eb 15                	jmp    2e90 <read_hv_sched_clock_tsc+0x62>
004d     2e7b:	48 c1 e2 20          	shl    $0x20,%rdx
0051     2e7f:	4c 89 c6             	mov    %r8,%rsi
0054     2e82:	48 09 c2             	or     %rax,%rdx
0057     2e85:	48 89 d7             	mov    %rdx,%rdi
005a     2e88:	e8 00 00 00 00       	call   2e8d <read_hv_sched_clock_tsc+0x5f>	2e89: R_X86_64_PC32	.text+0x1fcb0cc
005f     2e8d:	48 01 d8             	add    %rbx,%rax
0062     2e90:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 2e97 <read_hv_sched_clock_tsc+0x69>	2e93: R_X86_64_PC32	.data..ro_after_init+0x7a14
0069     2e97:	5b                   	pop    %rbx
006a     2e98:	48 6b c0 64          	imul   $0x64,%rax,%rax
006e     2e9c:	31 d2                	xor    %edx,%edx
0070     2e9e:	31 c9                	xor    %ecx,%ecx
0072     2ea0:	31 f6                	xor    %esi,%esi
0074     2ea2:	31 ff                	xor    %edi,%edi
0076     2ea4:	45 31 c0             	xor    %r8d,%r8d
0079     2ea7:	c3                   	ret
007a     2ea8:	cc                   	int3
007b     2ea9:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0085     2eb3:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
008f     2ebd:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
