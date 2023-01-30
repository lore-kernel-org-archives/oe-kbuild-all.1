Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86AD8803
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 23:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675122650; x=1706658650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RcvnRY3haTPP01HQ5lXwHnd+Oa1hs2lboeYovxKUeOc=;
  b=gcY3HGtNqPRHji3LWdayMqJSHiSniF972IIWzVguVakBzIJPbWPHH8Ts
   xCoMmU71PO3eH41cGxexb0BkzsCMdGQn/s0JsABhrK4OvACa1jIMu74BZ
   s16uNTWb6Wrx1t6h9c5azWBK9GgwLESea2dyfKUrbh+SHZ7ZqM0/fV1d7
   /2gQfwUCJQfwS2KMh5d9MJH1/Ws4opbK7621lYjeuKAzaW90SulEvofBX
   rYFuPZJPdiR8miiUE9xwxplZZnvMs6LC7TRfXK4ebHzNMIhgY1T4vQZmY
   3D6Fc3GrrOQbu2mdvEwjvz3+OTD6THPz3ZevBRhUYUhCBhrKhV9AgTTUH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="329817123"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="329817123"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 15:50:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="993063077"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="993063077"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2023 15:50:24 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMdup-0003yw-2S;
	Mon, 30 Jan 2023 23:50:23 +0000
Date: Tue, 31 Jan 2023 07:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core-staging 10/10] vmlinux.o: warning: objtool:
 poll_idle+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202301310759.LeuWSyg0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core-staging
head:   464fa8e861277b168333fb5de5d8a4cf609c84c7
commit: 464fa8e861277b168333fb5de5d8a4cf609c84c7 [10/10] cpuidle: Fix poll_idle() noinstr annotation
config: x86_64-randconfig-a002-20230130 (https://download.01.org/0day-ci/archive/20230131/202301310759.LeuWSyg0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=464fa8e861277b168333fb5de5d8a4cf609c84c7
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core-staging
        git checkout 464fa8e861277b168333fb5de5d8a4cf609c84c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x25: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x21: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x71: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xaa: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x79: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x15: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x66: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x76: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x55: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x28: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x26: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0xef: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x6b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x42: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: poll_idle+0x4f: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o poll_idle:
0000 0000000000000bc0 <poll_idle>:
0000  bc0:	41 57                	push   %r15
0002  bc2:	41 56                	push   %r14
0004  bc4:	49 89 f6             	mov    %rsi,%r14
0007  bc7:	41 55                	push   %r13
0009  bc9:	49 89 fd             	mov    %rdi,%r13
000c  bcc:	41 54                	push   %r12
000e  bce:	55                   	push   %rbp
000f  bcf:	53                   	push   %rbx
0010  bd0:	48 83 ec 08          	sub    $0x8,%rsp
0014  bd4:	89 54 24 04          	mov    %edx,0x4(%rsp)
0018  bd8:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	bd9: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
001d  bdd:	e8 00 00 00 00       	call   be2 <poll_idle+0x22>	bde: R_X86_64_PLT32	local_clock-0x4
0022  be2:	41 80 65 00 fb       	andb   $0xfb,0x0(%r13)
0027  be7:	49 89 c4             	mov    %rax,%r12
002a  bea:	fb                   	sti
002b  beb:	48 8b 2c 25 00 00 00 00 	mov    0x0,%rbp	bef: R_X86_64_32S	pcpu_hot
0033  bf3:	80 4d 02 20          	orb    $0x20,0x2(%rbp)
0037  bf7:	48 8b 5d 00          	mov    0x0(%rbp),%rbx
003b  bfb:	31 c9                	xor    %ecx,%ecx
003d  bfd:	31 d2                	xor    %edx,%edx
003f  bff:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	c02: R_X86_64_32S	_ftrace_annotated_branch+0xd7100
0046  c06:	48 c1 eb 03          	shr    $0x3,%rbx
004a  c0a:	83 e3 01             	and    $0x1,%ebx
004d  c0d:	89 de                	mov    %ebx,%esi
004f  c0f:	e8 00 00 00 00       	call   c14 <poll_idle+0x54>	c10: R_X86_64_PLT32	ftrace_likely_update-0x4
0054  c14:	48 85 db             	test   %rbx,%rbx
0057  c17:	75 6a                	jne    c83 <poll_idle+0xc3>
0059  c19:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	c1a: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
005e  c1e:	4c 89 f7             	mov    %r14,%rdi
0061  c21:	4c 89 ee             	mov    %r13,%rsi
0064  c24:	e8 00 00 00 00       	call   c29 <poll_idle+0x69>	c25: R_X86_64_PLT32	cpuidle_poll_time-0x4
0069  c29:	49 89 c6             	mov    %rax,%r14
006c  c2c:	bb c9 00 00 00       	mov    $0xc9,%ebx
0071  c31:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	c32: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0076  c36:	48 8b 45 00          	mov    0x0(%rbp),%rax
007a  c3a:	31 c9                	xor    %ecx,%ecx
007c  c3c:	31 d2                	xor    %edx,%edx
007e  c3e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	c41: R_X86_64_32S	_ftrace_annotated_branch+0xd7130
0085  c45:	48 c1 e8 03          	shr    $0x3,%rax
0089  c49:	83 e0 01             	and    $0x1,%eax
008c  c4c:	49 89 c7             	mov    %rax,%r15
008f  c4f:	89 c6                	mov    %eax,%esi
0091  c51:	e8 00 00 00 00       	call   c56 <poll_idle+0x96>	c52: R_X86_64_PLT32	ftrace_likely_update-0x4
0096  c56:	4d 85 ff             	test   %r15,%r15
0099  c59:	75 28                	jne    c83 <poll_idle+0xc3>
009b  c5b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	c5c: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00a0  c60:	f3 90                	pause
00a2  c62:	83 eb 01             	sub    $0x1,%ebx
00a5  c65:	75 ca                	jne    c31 <poll_idle+0x71>
00a7  c67:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	c68: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00ac  c6c:	e8 00 00 00 00       	call   c71 <poll_idle+0xb1>	c6d: R_X86_64_PLT32	local_clock-0x4
00b1  c71:	4c 29 e0             	sub    %r12,%rax
00b4  c74:	4c 39 f0             	cmp    %r14,%rax
00b7  c77:	76 b3                	jbe    c2c <poll_idle+0x6c>
00b9  c79:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	c7a: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00be  c7e:	41 80 4d 00 04       	orb    $0x4,0x0(%r13)
00c3  c83:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	c84: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00c8  c88:	fa                   	cli
00c9  c89:	48 8b 04 25 00 00 00 00 	mov    0x0,%rax	c8d: R_X86_64_32S	pcpu_hot
00d1  c91:	80 60 02 df          	andb   $0xdf,0x2(%rax)
00d5  c95:	48 8b 00             	mov    (%rax),%rax
00d8  c98:	a8 08                	test   $0x8,%al
00da  c9a:	74 0f                	je     cab <poll_idle+0xeb>
00dc  c9c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	c9d: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00e1  ca1:	81 25 00 00 00 00 ff ff ff 7f 	andl   $0x7fffffff,0x0(%rip)        # cab <poll_idle+0xeb>	ca3: R_X86_64_PC32	pcpu_hot
00eb  cab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	cac: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00f0  cb0:	8b 44 24 04          	mov    0x4(%rsp),%eax
00f4  cb4:	48 83 c4 08          	add    $0x8,%rsp
00f8  cb8:	5b                   	pop    %rbx
00f9  cb9:	5d                   	pop    %rbp
00fa  cba:	41 5c                	pop    %r12
00fc  cbc:	41 5d                	pop    %r13
00fe  cbe:	41 5e                	pop    %r14
0100  cc0:	41 5f                	pop    %r15
0102  cc2:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
