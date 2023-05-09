Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDF717F8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 04:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683606123; x=1715142123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pnm3LK651PSwOdFwnCbJdpSlbaeklwaM0HUg1G3mAmU=;
  b=VnB2G8hMYsdfXCWDUXNx848uroHAlLDUiKRN47QfVxEJjoMN3HV+nULG
   1EbwbONx/WTFVPLzkwI/NPUzMbKcW4ailM830EgSTTI+IR4QM9fCdk7+4
   FPN/h8wME7Sb5eTrhpDxe+jtO2vMPDT1A5u7CokAtIm2G00OIWf/e4fkW
   NwULcq5Skr5YtS4NznmEDNN+1x1/TdJ5PRDbr4tMvpWOB77rAQS+/kpIs
   Jw7Pn99jhTie7UbnEtFTgy+z8ii835s94ge3o2u8aUiO+oUZSRdntqVAD
   RKvbj00R5h6w3Gtv7Uy2fgu3cA+D7L6D2FmUeCTyPRLrby7hdK0L7LXRg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="436124668"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="436124668"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 21:22:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028666234"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="1028666234"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 May 2023 21:22:02 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwErM-0001gU-0s;
	Tue, 09 May 2023 04:21:56 +0000
Date: Tue, 9 May 2023 12:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/clock 8/9] vmlinux.o: warning: objtool:
 local_clock_noinstr+0x56: call to ftrace_likely_update() leaves
 .noinstr.text section
Message-ID: <202305091259.ljn2EVsT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/clock
head:   6c433ce701d4bb3d07a4102cbb8bf00c217be05d
commit: 4ff68e88fd2272a5a1b1e62b017fa964b03242af [8/9] sched/clock: Provide local_clock_noinstr()
config: x86_64-randconfig-a016-20230508 (https://download.01.org/0day-ci/archive/20230509/202305091259.ljn2EVsT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=4ff68e88fd2272a5a1b1e62b017fa964b03242af
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/clock
        git checkout 4ff68e88fd2272a5a1b1e62b017fa964b03242af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091259.ljn2EVsT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: tdx_safe_halt+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x59: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x57: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poll_idle+0x1c: call to local_clock() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x21: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x25: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x75: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xad: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x80: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0xd: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x4d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x7a: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: local_clock_noinstr+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x49: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x2c: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o local_clock_noinstr:
0000 0000000000004040 <local_clock_noinstr>:
0000     4040:	f3 0f 1e fa          	endbr64
0004     4044:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 404a <local_clock_noinstr+0xa>	4046: R_X86_64_PC32	.bss+0x1d21c
000a     404a:	41 54                	push   %r12
000c     404c:	53                   	push   %rbx
000d     404d:	85 c0                	test   %eax,%eax
000f     404f:	7e 16                	jle    4067 <local_clock_noinstr+0x27>
0011     4051:	e8 00 00 00 00       	call   4056 <local_clock_noinstr+0x16>	4052: R_X86_64_PLT32	sched_clock_noinstr-0x4
0016     4056:	48 03 05 00 00 00 00 	add    0x0(%rip),%rax        # 405d <local_clock_noinstr+0x1d>	4059: R_X86_64_PC32	__sched_clock_offset-0x4
001d     405d:	49 89 c4             	mov    %rax,%r12
0020     4060:	4c 89 e0             	mov    %r12,%rax
0023     4063:	5b                   	pop    %rbx
0024     4064:	41 5c                	pop    %r12
0026     4066:	c3                   	ret
0027     4067:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 406d <local_clock_noinstr+0x2d>	4069: R_X86_64_PC32	.bss+0x1d25c
002d     406d:	85 c0                	test   %eax,%eax
002f     406f:	0f 8e ca 00 00 00    	jle    413f <local_clock_noinstr+0xff>
0035     4075:	e8 00 00 00 00       	call   407a <local_clock_noinstr+0x3a>	4076: R_X86_64_PLT32	sched_clock_noinstr-0x4
003a     407a:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 4081 <local_clock_noinstr+0x41>	407d: R_X86_64_PC32	sched_clock_data-0x4
0041     4081:	31 c9                	xor    %ecx,%ecx
0043     4083:	31 d2                	xor    %edx,%edx
0045     4085:	49 89 c4             	mov    %rax,%r12
0048     4088:	48 c1 e8 3f          	shr    $0x3f,%rax
004c     408c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	408f: R_X86_64_32S	_ftrace_annotated_branch+0x2f160
0053     4093:	48 89 c6             	mov    %rax,%rsi
0056     4096:	e8 00 00 00 00       	call   409b <local_clock_noinstr+0x5b>	4097: R_X86_64_PLT32	ftrace_likely_update-0x4
005b     409b:	31 c0                	xor    %eax,%eax
005d     409d:	4d 85 e4             	test   %r12,%r12
0060     40a0:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 40a7 <local_clock_noinstr+0x67>	40a3: R_X86_64_PC32	.data..read_mostly+0x27b4
0067     40a7:	49 0f 49 c4          	cmovns %r12,%rax
006b     40ab:	48 03 15 00 00 00 00 	add    0x0(%rip),%rdx        # 40b2 <local_clock_noinstr+0x72>	40ae: R_X86_64_PC32	sched_clock_data+0x4
0072     40b2:	48 89 d7             	mov    %rdx,%rdi
0075     40b5:	48 89 d6             	mov    %rdx,%rsi
0078     40b8:	48 89 c1             	mov    %rax,%rcx
007b     40bb:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 40c2 <local_clock_noinstr+0x82>	40be: R_X86_64_PC32	sched_clock_data+0xc
0082     40c2:	4c 8d 24 11          	lea    (%rcx,%rdx,1),%r12
0086     40c6:	48 29 c7             	sub    %rax,%rdi
0089     40c9:	48 85 ff             	test   %rdi,%rdi
008c     40cc:	7f 09                	jg     40d7 <local_clock_noinstr+0x97>
008e     40ce:	4c 89 e1             	mov    %r12,%rcx
0091     40d1:	48 89 c6             	mov    %rax,%rsi
0094     40d4:	48 29 c1             	sub    %rax,%rcx
0097     40d7:	48 81 c2 80 96 98 00 	add    $0x989680,%rdx
009e     40de:	48 89 c7             	mov    %rax,%rdi
00a1     40e1:	48 29 d7             	sub    %rdx,%rdi
00a4     40e4:	48 85 ff             	test   %rdi,%rdi
00a7     40e7:	48 0f 4f d0          	cmovg  %rax,%rdx
00ab     40eb:	48 85 c9             	test   %rcx,%rcx
00ae     40ee:	4c 0f 4e e6          	cmovle %rsi,%r12
00b2     40f2:	49 39 d4             	cmp    %rdx,%r12
00b5     40f5:	4c 0f 49 e2          	cmovns %rdx,%r12
00b9     40f9:	4c 0f b1 25 00 00 00 00 	cmpxchg %r12,0x0(%rip)        # 4101 <local_clock_noinstr+0xc1>	40fd: R_X86_64_PC32	sched_clock_data+0xc
00c1     4101:	40 0f 95 c6          	setne  %sil
00c5     4105:	0f 94 c3             	sete   %bl
00c8     4108:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	410b: R_X86_64_32S	_ftrace_annotated_branch+0x2f130
00cf     410f:	31 c9                	xor    %ecx,%ecx
00d1     4111:	31 d2                	xor    %edx,%edx
00d3     4113:	40 0f b6 f6          	movzbl %sil,%esi
00d7     4117:	e8 00 00 00 00       	call   411c <local_clock_noinstr+0xdc>	4118: R_X86_64_PLT32	ftrace_likely_update-0x4
00dc     411c:	31 c9                	xor    %ecx,%ecx
00de     411e:	0f b6 f3             	movzbl %bl,%esi
00e1     4121:	ba 01 00 00 00       	mov    $0x1,%edx
00e6     4126:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4129: R_X86_64_32S	_ftrace_annotated_branch+0x2f100
00ed     412d:	e8 00 00 00 00       	call   4132 <local_clock_noinstr+0xf2>	412e: R_X86_64_PLT32	ftrace_likely_update-0x4
00f2     4132:	84 db                	test   %bl,%bl
00f4     4134:	0f 85 26 ff ff ff    	jne    4060 <local_clock_noinstr+0x20>
00fa     413a:	e9 36 ff ff ff       	jmp    4075 <local_clock_noinstr+0x35>
00ff     413f:	5b                   	pop    %rbx
0100     4140:	41 5c                	pop    %r12
0102     4142:	e9 00 00 00 00       	jmp    4147 <local_clock_noinstr+0x107>	4143: R_X86_64_PLT32	sched_clock_noinstr-0x4
0107     4147:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0111     4151:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
011b     415b:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0125     4165:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
012f     416f:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0139     4179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
