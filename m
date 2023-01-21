Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05181BD37
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674318638; x=1705854638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rWAMTThcuffYPDKFRW0AC5prqCl7DSHarlAaaUh4rao=;
  b=bKPQt0wGIdBYheSXMWpawtyj5yNg+zjUVhMx41mtCalX9/j4OSzT15Vq
   VbWX3bC4FFn3/dQ74LBZHEtuO4GmbEiRqxBMxqbMkVxdnVm/fbSgq+mlj
   QMtuBX091zlRatf5i5DJYhrycmH5jsuLxwtnaJfxrtUEPo9b6fTB85WB7
   mapDa2/JxgAbTTtug1tug2jZVpBcLUCIWOXGLPDNd8v9F6mGQR37GbugS
   GBNjtCyP92QMDeR3U5CA9N1aOe61C2qMk7kqHL9UdLpMddb7TteTDlo3G
   R6oBLBBrjqqcUxb1bGPgMDSWGP9E9I/xWwkNACxWNtjrnFp1UATA37W4k
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="412031830"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="412031830"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 08:30:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="834765683"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="834765683"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Jan 2023 08:30:34 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJGlF-0004G4-0l;
	Sat, 21 Jan 2023 16:30:33 +0000
Date: Sun, 22 Jan 2023 00:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 4/5] vmlinux.o: warning: objtool:
 local_clock+0x4: call to sched_clock_stable() leaves .noinstr.text section
Message-ID: <202301220051.FmIfZC2O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   2f4db18052727418ff37088ea7b08d5380aa91ad
commit: 01eee81c7fec26ca0a3ea93f3793d0772266fa8b [4/5] sched/clock: Make local_clock() noinstr
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230122/202301220051.FmIfZC2O-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=01eee81c7fec26ca0a3ea93f3793d0772266fa8b
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core
        git checkout 01eee81c7fec26ca0a3ea93f3793d0772266fa8b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __asan_memset+0x39: call to __memset() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memmove+0x4f: call to __memmove() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memcpy+0x4f: call to __memcpy() with UACCESS enabled
   vmlinux.o: warning: objtool: native_sched_clock+0x53: call to mul_u64_u32_shr() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmware_sched_clock+0x21: call to mul_u64_u32_shr() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read+0xca: call to arch_atomic64_read.constprop.0() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: local_clock+0x4: call to sched_clock_stable() leaves .noinstr.text section


objdump-func vmlinux.o local_clock:
0000 0000000000002f97 <local_clock>:
0000     2f97:	f3 0f 1e fa          	endbr64
0004     2f9b:	e8 00 00 00 00       	call   2fa0 <local_clock+0x9>	2f9c: R_X86_64_PLT32	sched_clock_stable-0x4
0009     2fa0:	85 c0                	test   %eax,%eax
000b     2fa2:	74 11                	je     2fb5 <local_clock+0x1e>
000d     2fa4:	e8 00 00 00 00       	call   2fa9 <local_clock+0x12>	2fa5: R_X86_64_PLT32	sched_clock-0x4
0012     2fa9:	48 03 05 00 00 00 00 	add    0x0(%rip),%rax        # 2fb0 <local_clock+0x19>	2fac: R_X86_64_PC32	__sched_clock_offset-0x4
0019     2fb0:	49 89 c0             	mov    %rax,%r8
001c     2fb3:	eb 7d                	jmp    3032 <local_clock+0x9b>
001e     2fb5:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 2fbb <local_clock+0x24>	2fb7: R_X86_64_PC32	pcpu_hot+0x4
0024     2fbb:	e8 00 00 00 00       	call   2fc0 <local_clock+0x29>	2fbc: R_X86_64_PLT32	sched_clock-0x4
0029     2fc0:	ba 00 00 00 00       	mov    $0x0,%edx
002e     2fc5:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2fcc <local_clock+0x35>	2fc8: R_X86_64_PC32	.data+0x105a2c
0035     2fcc:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 2fd3 <local_clock+0x3c>	2fcf: R_X86_64_PC32	.data..read_mostly+0x270c
003c     2fd3:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 2fda <local_clock+0x43>	2fd6: R_X86_64_PC32	.data+0x105a24
0043     2fda:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 2fe1 <local_clock+0x4a>	2fdd: R_X86_64_PC32	.data+0x105a1c
004a     2fe1:	48 0f 48 c2          	cmovs  %rdx,%rax
004e     2fe5:	48 89 ce             	mov    %rcx,%rsi
0051     2fe8:	4c 8d 04 38          	lea    (%rax,%rdi,1),%r8
0055     2fec:	e8 00 00 00 00       	call   2ff1 <local_clock+0x5a>	2fed: R_X86_64_PC32	.text+0x1e922b
005a     2ff1:	48 8d b7 80 96 98 00 	lea    0x989680(%rdi),%rsi
0061     2ff8:	48 89 cf             	mov    %rcx,%rdi
0064     2ffb:	49 89 c2             	mov    %rax,%r10
0067     2ffe:	e8 00 00 00 00       	call   3003 <local_clock+0x6c>	2fff: R_X86_64_PC32	.text+0x1e922b
006c     3003:	4c 89 d6             	mov    %r10,%rsi
006f     3006:	4c 89 c7             	mov    %r8,%rdi
0072     3009:	49 89 c1             	mov    %rax,%r9
0075     300c:	e8 00 00 00 00       	call   3011 <local_clock+0x7a>	300d: R_X86_64_PC32	.text+0x1e922b
007a     3011:	4c 89 ce             	mov    %r9,%rsi
007d     3014:	48 89 c7             	mov    %rax,%rdi
0080     3017:	e8 00 00 00 00       	call   301c <local_clock+0x85>	3018: R_X86_64_PC32	.text+0x1e9220
0085     301c:	49 89 c0             	mov    %rax,%r8
0088     301f:	48 89 c8             	mov    %rcx,%rax
008b     3022:	4c 0f b1 05 00 00 00 00 	cmpxchg %r8,0x0(%rip)        # 302a <local_clock+0x93>	3026: R_X86_64_PC32	.data+0x105a2c
0093     302a:	75 8f                	jne    2fbb <local_clock+0x24>
0095     302c:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 3032 <local_clock+0x9b>	302e: R_X86_64_PC32	pcpu_hot+0x4
009b     3032:	4c 89 c0             	mov    %r8,%rax
009e     3035:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
