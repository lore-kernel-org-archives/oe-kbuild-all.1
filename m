Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D57D657
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 05:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685253358; x=1716789358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8t5s6B23GmXqUrVWzPR2aZbfo1vTs32ag87sfqrigus=;
  b=ljsog4ed6PRQULfEfvymJ+vl/ShTN2N4kX8t2L5zUG+ZTb1smJJvwOCd
   vio30V7xQb0kvR+QGtrWzoH05xqX7DuQcFv1DM4aTsKFzO97DoD88LN/n
   bUWEWAp7e4Do+NvLtmAc9PjeUNumcLtcnZRJOlvUsCfu6Ko37jvQX7J6o
   Ufdvtsw/ki9U406gb5CkKu9fjQddkNgsxEhTV3x7pvDyN92D8ltKoiPhH
   nm7MWgPF9ASvXmNca28Zd3ABF1+b3wKn98gNJQJZ2Yj76yHUiBMOtXlq2
   lw7kx+Pj9FsmZOxNLA/pmQe+lYme6juIwdEXnJc043wnDB+jvZuIkKBEL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="354500534"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="354500534"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 22:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="708850132"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="708850132"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 May 2023 22:55:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q39Nj-000KSC-0M;
	Sun, 28 May 2023 05:55:55 +0000
Date: Sun, 28 May 2023 13:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4813/4815] vmlinux.o: warning: objtool:
 synchronize_rcu_expedited_wait+0x9cc: preempt_schedule_thunk() is missing a
 __noreturn annotation
Message-ID: <202305281326.T4vmi46O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a3d37b4d885129561e1cef361216f00472f7d2e
commit: f9787ed1c4697db949699f83ed5ab885147ef900 [4813/4815] Merge branch 'bitmap-for-next' of https://github.com/norov/linux.git
config: x86_64-randconfig-x085-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281326.T4vmi46O-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f9787ed1c4697db949699f83ed5ab885147ef900
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f9787ed1c4697db949699f83ed5ab885147ef900
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281326.T4vmi46O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_arch_prctl_common+0xf4: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: raise_mce+0x380: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: unwind_next_frame+0x11e4: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: process_one_work+0x9eb: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __kthread_parkme+0x14a: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __sched_setscheduler+0xf54: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rt_mutex_setprio+0x6e5: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __down_read_trylock+0x269: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __up_write+0x405: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __up_read+0x536: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __percpu_rwsem_trylock+0x3e: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __sync_rcu_exp_select_node_cpus+0x3cf: preempt_schedule_thunk() is missing a __noreturn annotation
>> vmlinux.o: warning: objtool: synchronize_rcu_expedited_wait+0x9cc: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __symbol_get+0xd9: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: lookup_module_symbol_name+0x118: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: lookup_module_symbol_attrs+0x142: preempt_schedule_thunk() is missing a __noreturn annotation
>> vmlinux.o: warning: objtool: clocksource_verify_percpu+0x225: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: show_kprobe_addr+0x134: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __trace_event_discard_commit+0x47: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __ftrace_trace_stack+0x1da: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: ftrace_trace_userstack+0x246: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __trace_array_puts+0x2e2: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __trace_bputs+0x19c: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __trace_array_vprintk+0x1d5: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: tracing_mark_raw_write+0x2bd: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: tracing_mark_write+0x4b2: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: trace_buffered_event_enable+0x198: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: trace_buffer_unlock_commit_regs+0xab: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: trace_buffer_unlock_commit_nostack+0x9c: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: trace_function+0x1a9: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: trace_last_func_repeats+0x27a: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: trace_vbprintk+0x225: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: user_event_ftrace+0x303: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rethook_flush_task+0xb3: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: irq_work_queue+0x35f: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: bpf_bprintf_prepare+0x1e1: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: htab_lock_bucket+0x118: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: bp_constraints_lock+0x107: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: folio_deactivate+0x15a: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rmqueue_pcplist.constprop.0+0x7f: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: free_unref_page+0x170: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: free_unref_page_list+0x30c: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __kmem_cache_alloc_bulk+0xf8: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: iput+0x287: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: wb_workfn+0x3f5: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __break_lease+0x889: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __i2c_transfer+0x346: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __i2c_smbus_xfer+0x3a8: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: edac_raw_mc_handle_error+0xc16: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: iptunnel_xmit+0x6df: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: native_sched_clock+0xd0: preempt_schedule_notrace_thunk() is missing a __noreturn annotation


objdump-func vmlinux.o synchronize_rcu_expedited_wait:
0000 000000000027816f <synchronize_rcu_expedited_wait>:
0000   27816f:	e8 00 00 00 00       	call   278174 <synchronize_rcu_expedited_wait+0x5>	278170: R_X86_64_PLT32	__fentry__-0x4
0005   278174:	41 57                	push   %r15
0007   278176:	41 56                	push   %r14
0009   278178:	41 55                	push   %r13
000b   27817a:	41 54                	push   %r12
000d   27817c:	55                   	push   %rbp
000e   27817d:	53                   	push   %rbx
000f   27817e:	bb ff ff 37 00       	mov    $0x37ffff,%ebx
0014   278183:	48 c1 e3 2a          	shl    $0x2a,%rbx
0018   278187:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
001f   27818e:	48 c7 44 24 30 b3 8a b5 41 	movq   $0x41b58ab3,0x30(%rsp)
0028   278197:	48 8d 44 24 30       	lea    0x30(%rsp),%rax
002d   27819c:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	2781a1: R_X86_64_32S	.rodata.str1.1+0x2c106
0036   2781a5:	48 c1 e8 03          	shr    $0x3,%rax
003a   2781a9:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
003f   2781ae:	48 01 d8             	add    %rbx,%rax
0042   2781b1:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)	2781b6: R_X86_64_32S	.text+0x27816f
004b   2781ba:	c7 00 f1 f1 f1 f1    	movl   $0xf1f1f1f1,(%rax)
0051   2781c0:	c7 40 04 00 00 00 f3 	movl   $0xf3000000,0x4(%rax)
0058   2781c7:	c7 40 08 f3 f3 f3 f3 	movl   $0xf3f3f3f3,0x8(%rax)
005f   2781ce:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0068   2781d7:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
0070   2781df:	31 c0                	xor    %eax,%eax
0072   2781e1:	e8 00 00 00 00       	call   2781e6 <synchronize_rcu_expedited_wait+0x77>	2781e2: R_X86_64_PLT32	rcu_exp_jiffies_till_stall_check-0x4
0077   2781e6:	48 63 e8             	movslq %eax,%rbp
007a   2781e9:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	2781ec: R_X86_64_32S	jiffies
0081   2781f0:	48 c1 e8 03          	shr    $0x3,%rax
0085   2781f4:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0089   2781f8:	74 0c                	je     278206 <synchronize_rcu_expedited_wait+0x97>
008b   2781fa:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2781fd: R_X86_64_32S	jiffies
0092   278201:	e8 00 00 00 00       	call   278206 <synchronize_rcu_expedited_wait+0x97>	278202: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0097   278206:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 27820d <synchronize_rcu_expedited_wait+0x9e>	278209: R_X86_64_PC32	jiffies-0x4
009e   27820d:	bb ff ff 37 00       	mov    $0x37ffff,%ebx
00a3   278212:	48 c1 e3 2a          	shl    $0x2a,%rbx
00a7   278216:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
00ac   27821b:	4c 8d 6c 24 58       	lea    0x58(%rsp),%r13
00b1   278220:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278223: R_X86_64_32S	.data+0x6861e0
00b8   278227:	49 89 ec             	mov    %rbp,%r12
00bb   27822a:	e8 80 21 ff ff       	call   26a3af <sync_rcu_exp_done_unlocked>
00c0   27822f:	48 85 ed             	test   %rbp,%rbp
00c3   278232:	41 89 c0             	mov    %eax,%r8d
00c6   278235:	0f 94 c0             	sete   %al
00c9   278238:	45 84 c0             	test   %r8b,%r8b
00cc   27823b:	74 0e                	je     27824b <synchronize_rcu_expedited_wait+0xdc>
00ce   27823d:	84 c0                	test   %al,%al
00d0   27823f:	41 bc 01 00 00 00    	mov    $0x1,%r12d
00d6   278245:	4c 0f 44 e5          	cmove  %rbp,%r12
00da   278249:	eb 6e                	jmp    2782b9 <synchronize_rcu_expedited_wait+0x14a>
00dc   27824b:	84 c0                	test   %al,%al
00de   27824d:	75 6a                	jne    2782b9 <synchronize_rcu_expedited_wait+0x14a>
00e0   27824f:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
00e5   278254:	4c 8d 74 24 50       	lea    0x50(%rsp),%r14
00ea   278259:	4c 89 6c 24 60       	mov    %r13,0x60(%rsp)
00ef   27825e:	ba 02 00 00 00       	mov    $0x2,%edx
00f4   278263:	4c 89 f6             	mov    %r14,%rsi
00f7   278266:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278269: R_X86_64_32S	.data+0x686a58
00fe   27826d:	e8 00 00 00 00       	call   278272 <synchronize_rcu_expedited_wait+0x103>	27826e: R_X86_64_PLT32	prepare_to_swait_event-0x4
0103   278272:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278275: R_X86_64_32S	.data+0x6861e0
010a   278279:	e8 31 21 ff ff       	call   26a3af <sync_rcu_exp_done_unlocked>
010f   27827e:	4d 85 e4             	test   %r12,%r12
0112   278281:	41 89 c0             	mov    %eax,%r8d
0115   278284:	0f 94 c0             	sete   %al
0118   278287:	45 84 c0             	test   %r8b,%r8b
011b   27828a:	74 0d                	je     278299 <synchronize_rcu_expedited_wait+0x12a>
011d   27828c:	84 c0                	test   %al,%al
011f   27828e:	b8 01 00 00 00       	mov    $0x1,%eax
0124   278293:	4c 0f 45 e0          	cmovne %rax,%r12
0128   278297:	eb 11                	jmp    2782aa <synchronize_rcu_expedited_wait+0x13b>
012a   278299:	84 c0                	test   %al,%al
012c   27829b:	75 0d                	jne    2782aa <synchronize_rcu_expedited_wait+0x13b>
012e   27829d:	4c 89 e7             	mov    %r12,%rdi
0131   2782a0:	e8 00 00 00 00       	call   2782a5 <synchronize_rcu_expedited_wait+0x136>	2782a1: R_X86_64_PLT32	schedule_timeout-0x4
0136   2782a5:	49 89 c4             	mov    %rax,%r12
0139   2782a8:	eb b4                	jmp    27825e <synchronize_rcu_expedited_wait+0xef>
013b   2782aa:	4c 89 f6             	mov    %r14,%rsi
013e   2782ad:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2782b0: R_X86_64_32S	.data+0x686a58
0145   2782b4:	e8 00 00 00 00       	call   2782b9 <synchronize_rcu_expedited_wait+0x14a>	2782b5: R_X86_64_PLT32	finish_swait-0x4
014a   2782b9:	45 85 e4             	test   %r12d,%r12d
014d   2782bc:	0f 8f 42 0a 00 00    	jg     278d04 <synchronize_rcu_expedited_wait+0xb95>
0153   2782c2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2782c5: R_X86_64_32S	.data+0x6861e0
015a   2782c9:	e8 e1 20 ff ff       	call   26a3af <sync_rcu_exp_done_unlocked>
015f   2782ce:	84 c0                	test   %al,%al
0161   2782d0:	0f 85 2e 0a 00 00    	jne    278d04 <synchronize_rcu_expedited_wait+0xb95>
0167   2782d6:	45 85 e4             	test   %r12d,%r12d
016a   2782d9:	74 02                	je     2782dd <synchronize_rcu_expedited_wait+0x16e>
016c   2782db:	0f 0b                	ud2
016e   2782dd:	e8 d2 27 ff ff       	call   26aab4 <rcu_stall_is_suppressed>
0173   2782e2:	84 c0                	test   %al,%al
0175   2782e4:	0f 85 36 ff ff ff    	jne    278220 <synchronize_rcu_expedited_wait+0xb1>
017b   2782ea:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 2782f1 <synchronize_rcu_expedited_wait+0x182>	2782ed: R_X86_64_PC32	__tracepoint_str+0xb4
0182   2782f1:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 2782f8 <synchronize_rcu_expedited_wait+0x189>	2782f4: R_X86_64_PC32	.data+0x686b04
0189   2782f8:	e8 0a 2a ff ff       	call   26ad07 <trace_rcu_stall_warning>
018e   2782fd:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 278304 <synchronize_rcu_expedited_wait+0x195>	278300: R_X86_64_PC32	.data+0x686b04
0195   278304:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278307: R_X86_64_32S	.rodata+0x99120
019c   27830b:	e8 00 00 00 00       	call   278310 <synchronize_rcu_expedited_wait+0x1a1>	27830c: R_X86_64_PLT32	_printk-0x4
01a1   278310:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 278316 <synchronize_rcu_expedited_wait+0x1a7>	278312: R_X86_64_PC32	rcu_num_lvls-0x4
01a7   278316:	8d 68 ff             	lea    -0x1(%rax),%ebp
01aa   278319:	48 63 ed             	movslq %ebp,%rbp
01ad   27831c:	48 83 fd 01          	cmp    $0x1,%rbp
01b1   278320:	76 0f                	jbe    278331 <synchronize_rcu_expedited_wait+0x1c2>
01b3   278322:	48 89 ee             	mov    %rbp,%rsi
01b6   278325:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278328: R_X86_64_32S	.data+0x684aa0
01bd   27832c:	e8 00 00 00 00       	call   278331 <synchronize_rcu_expedited_wait+0x1c2>	27832d: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
01c2   278331:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi	278335: R_X86_64_32S	.data+0x686710
01ca   278339:	48 89 f8             	mov    %rdi,%rax
01cd   27833c:	48 c1 e8 03          	shr    $0x3,%rax
01d1   278340:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
01d5   278344:	74 05                	je     27834b <synchronize_rcu_expedited_wait+0x1dc>
01d7   278346:	e8 00 00 00 00       	call   27834b <synchronize_rcu_expedited_wait+0x1dc>	278347: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01dc   27834b:	48 8b 2c ed 00 00 00 00 	mov    0x0(,%rbp,8),%rbp	27834f: R_X86_64_32S	.data+0x686710
01e4   278353:	45 31 ed             	xor    %r13d,%r13d
01e7   278356:	4c 63 25 00 00 00 00 	movslq 0x0(%rip),%r12        # 27835d <synchronize_rcu_expedited_wait+0x1ee>	278359: R_X86_64_PC32	rcu_num_nodes-0x4
01ee   27835d:	49 83 fc 01          	cmp    $0x1,%r12
01f2   278361:	76 0f                	jbe    278372 <synchronize_rcu_expedited_wait+0x203>
01f4   278363:	4c 89 e6             	mov    %r12,%rsi
01f7   278366:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278369: R_X86_64_32S	.data+0x684960
01fe   27836d:	e8 00 00 00 00       	call   278372 <synchronize_rcu_expedited_wait+0x203>	27836e: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0203   278372:	4d 69 e4 30 05 00 00 	imul   $0x530,%r12,%r12
020a   278379:	49 81 c4 00 00 00 00 	add    $0x0,%r12	27837c: R_X86_64_32S	.data+0x6861e0
0211   278380:	4c 39 e5             	cmp    %r12,%rbp
0214   278383:	0f 83 e7 03 00 00    	jae    278770 <synchronize_rcu_expedited_wait+0x601>
021a   278389:	48 89 ef             	mov    %rbp,%rdi
021d   27838c:	e8 00 00 00 00       	call   278391 <synchronize_rcu_expedited_wait+0x222>	27838d: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
0222   278391:	48 8d bd e0 00 00 00 	lea    0xe0(%rbp),%rdi
0229   278398:	48 89 04 24          	mov    %rax,(%rsp)
022d   27839c:	48 89 f8             	mov    %rdi,%rax
0230   27839f:	48 c1 e8 03          	shr    $0x3,%rax
0234   2783a3:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0238   2783a7:	74 05                	je     2783ae <synchronize_rcu_expedited_wait+0x23f>
023a   2783a9:	e8 00 00 00 00       	call   2783ae <synchronize_rcu_expedited_wait+0x23f>	2783aa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
023f   2783ae:	4c 8b a5 e0 00 00 00 	mov    0xe0(%rbp),%r12
0246   2783b5:	4d 85 e4             	test   %r12,%r12
0249   2783b8:	75 5e                	jne    278418 <synchronize_rcu_expedited_wait+0x2a9>
024b   2783ba:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	2783bd: R_X86_64_32S	debug_locks
0252   2783c1:	48 89 c2             	mov    %rax,%rdx
0255   2783c4:	83 e0 07             	and    $0x7,%eax
0258   2783c7:	48 c1 ea 03          	shr    $0x3,%rdx
025c   2783cb:	83 c0 03             	add    $0x3,%eax
025f   2783ce:	8a 14 1a             	mov    (%rdx,%rbx,1),%dl
0262   2783d1:	38 d0                	cmp    %dl,%al
0264   2783d3:	7c 10                	jl     2783e5 <synchronize_rcu_expedited_wait+0x276>
0266   2783d5:	84 d2                	test   %dl,%dl
0268   2783d7:	74 0c                	je     2783e5 <synchronize_rcu_expedited_wait+0x276>
026a   2783d9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2783dc: R_X86_64_32S	debug_locks
0271   2783e0:	e8 00 00 00 00       	call   2783e5 <synchronize_rcu_expedited_wait+0x276>	2783e1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0276   2783e5:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 2783ec <synchronize_rcu_expedited_wait+0x27d>	2783e7: R_X86_64_PC32	debug_locks-0x5
027d   2783ec:	74 16                	je     278404 <synchronize_rcu_expedited_wait+0x295>
027f   2783ee:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 2783f4 <synchronize_rcu_expedited_wait+0x285>	2783f0: R_X86_64_PC32	lockdep_recursion-0x4
0285   2783f4:	85 c0                	test   %eax,%eax
0287   2783f6:	75 0c                	jne    278404 <synchronize_rcu_expedited_wait+0x295>
0289   2783f8:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 2783fe <synchronize_rcu_expedited_wait+0x28f>	2783fa: R_X86_64_PC32	hardirqs_enabled-0x4
028f   2783fe:	85 c0                	test   %eax,%eax
0291   278400:	74 02                	je     278404 <synchronize_rcu_expedited_wait+0x295>
0293   278402:	0f 0b                	ud2
0295   278404:	48 8b 34 24          	mov    (%rsp),%rsi
0299   278408:	48 89 ef             	mov    %rbp,%rdi
029c   27840b:	45 31 e4             	xor    %r12d,%r12d
029f   27840e:	e8 00 00 00 00       	call   278413 <synchronize_rcu_expedited_wait+0x2a4>	27840f: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
02a4   278413:	e9 01 01 00 00       	jmp    278519 <synchronize_rcu_expedited_wait+0x3aa>
02a9   278418:	49 8d 7c 24 08       	lea    0x8(%r12),%rdi
02ae   27841d:	48 89 f8             	mov    %rdi,%rax
02b1   278420:	48 c1 e8 03          	shr    $0x3,%rax
02b5   278424:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
02b9   278428:	74 05                	je     27842f <synchronize_rcu_expedited_wait+0x2c0>
02bb   27842a:	e8 00 00 00 00       	call   27842f <synchronize_rcu_expedited_wait+0x2c0>	27842b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02c0   27842f:	4d 8b 64 24 08       	mov    0x8(%r12),%r12
02c5   278434:	4c 89 e0             	mov    %r12,%rax
02c8   278437:	48 c1 e8 03          	shr    $0x3,%rax
02cc   27843b:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
02d0   27843f:	74 08                	je     278449 <synchronize_rcu_expedited_wait+0x2da>
02d2   278441:	4c 89 e7             	mov    %r12,%rdi
02d5   278444:	e8 00 00 00 00       	call   278449 <synchronize_rcu_expedited_wait+0x2da>	278445: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02da   278449:	49 8b 14 24          	mov    (%r12),%rdx
02de   27844d:	45 31 e4             	xor    %r12d,%r12d
02e1   278450:	4c 8d b2 88 fc ff ff 	lea    -0x378(%rdx),%r14
02e8   278457:	4d 8d be 78 03 00 00 	lea    0x378(%r14),%r15
02ef   27845e:	48 8d 85 c8 00 00 00 	lea    0xc8(%rbp),%rax
02f6   278465:	49 39 c7             	cmp    %rax,%r15
02f9   278468:	74 59                	je     2784c3 <synchronize_rcu_expedited_wait+0x354>
02fb   27846a:	49 8d be 90 04 00 00 	lea    0x490(%r14),%rdi
0302   278471:	48 89 f8             	mov    %rdi,%rax
0305   278474:	48 c1 e8 03          	shr    $0x3,%rax
0309   278478:	8a 04 18             	mov    (%rax,%rbx,1),%al
030c   27847b:	84 c0                	test   %al,%al
030e   27847d:	74 09                	je     278488 <synchronize_rcu_expedited_wait+0x319>
0310   27847f:	3c 03                	cmp    $0x3,%al
0312   278481:	7f 05                	jg     278488 <synchronize_rcu_expedited_wait+0x319>
0314   278483:	e8 00 00 00 00       	call   278488 <synchronize_rcu_expedited_wait+0x319>	278484: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0319   278488:	41 8b b6 90 04 00 00 	mov    0x490(%r14),%esi
0320   27848f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278492: R_X86_64_32S	.rodata+0x97800
0327   278496:	41 ff c4             	inc    %r12d
032a   278499:	e8 00 00 00 00       	call   27849e <synchronize_rcu_expedited_wait+0x32f>	27849a: R_X86_64_PLT32	_printk-0x4
032f   27849e:	4c 89 f8             	mov    %r15,%rax
0332   2784a1:	48 c1 e8 03          	shr    $0x3,%rax
0336   2784a5:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
033a   2784a9:	74 08                	je     2784b3 <synchronize_rcu_expedited_wait+0x344>
033c   2784ab:	4c 89 ff             	mov    %r15,%rdi
033f   2784ae:	e8 00 00 00 00       	call   2784b3 <synchronize_rcu_expedited_wait+0x344>	2784af: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0344   2784b3:	49 8b 96 78 03 00 00 	mov    0x378(%r14),%rdx
034b   2784ba:	4c 8d b2 88 fc ff ff 	lea    -0x378(%rdx),%r14
0352   2784c1:	eb 94                	jmp    278457 <synchronize_rcu_expedited_wait+0x2e8>
0354   2784c3:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	2784c6: R_X86_64_32S	debug_locks
035b   2784ca:	48 89 c2             	mov    %rax,%rdx
035e   2784cd:	83 e0 07             	and    $0x7,%eax
0361   2784d0:	48 c1 ea 03          	shr    $0x3,%rdx
0365   2784d4:	83 c0 03             	add    $0x3,%eax
0368   2784d7:	8a 14 1a             	mov    (%rdx,%rbx,1),%dl
036b   2784da:	38 d0                	cmp    %dl,%al
036d   2784dc:	7c 10                	jl     2784ee <synchronize_rcu_expedited_wait+0x37f>
036f   2784de:	84 d2                	test   %dl,%dl
0371   2784e0:	74 0c                	je     2784ee <synchronize_rcu_expedited_wait+0x37f>
0373   2784e2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2784e5: R_X86_64_32S	debug_locks
037a   2784e9:	e8 00 00 00 00       	call   2784ee <synchronize_rcu_expedited_wait+0x37f>	2784ea: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
037f   2784ee:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 2784f5 <synchronize_rcu_expedited_wait+0x386>	2784f0: R_X86_64_PC32	debug_locks-0x5
0386   2784f5:	74 16                	je     27850d <synchronize_rcu_expedited_wait+0x39e>
0388   2784f7:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 2784fd <synchronize_rcu_expedited_wait+0x38e>	2784f9: R_X86_64_PC32	lockdep_recursion-0x4
038e   2784fd:	85 c0                	test   %eax,%eax
0390   2784ff:	75 0c                	jne    27850d <synchronize_rcu_expedited_wait+0x39e>
0392   278501:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 278507 <synchronize_rcu_expedited_wait+0x398>	278503: R_X86_64_PC32	hardirqs_enabled-0x4
0398   278507:	85 c0                	test   %eax,%eax
039a   278509:	74 02                	je     27850d <synchronize_rcu_expedited_wait+0x39e>
039c   27850b:	0f 0b                	ud2
039e   27850d:	48 8b 34 24          	mov    (%rsp),%rsi
03a2   278511:	48 89 ef             	mov    %rbp,%rdi
03a5   278514:	e8 00 00 00 00       	call   278519 <synchronize_rcu_expedited_wait+0x3aa>	278515: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
03aa   278519:	48 8d bd b9 00 00 00 	lea    0xb9(%rbp),%rdi
03b1   278520:	45 01 e5             	add    %r12d,%r13d
03b4   278523:	48 89 f8             	mov    %rdi,%rax
03b7   278526:	48 89 fa             	mov    %rdi,%rdx
03ba   278529:	48 c1 e8 03          	shr    $0x3,%rax
03be   27852d:	83 e2 07             	and    $0x7,%edx
03c1   278530:	8a 04 18             	mov    (%rax,%rbx,1),%al
03c4   278533:	38 d0                	cmp    %dl,%al
03c6   278535:	7f 09                	jg     278540 <synchronize_rcu_expedited_wait+0x3d1>
03c8   278537:	84 c0                	test   %al,%al
03ca   278539:	74 05                	je     278540 <synchronize_rcu_expedited_wait+0x3d1>
03cc   27853b:	e8 00 00 00 00       	call   278540 <synchronize_rcu_expedited_wait+0x3d1>	27853c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
03d1   278540:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 278546 <synchronize_rcu_expedited_wait+0x3d7>	278542: R_X86_64_PC32	rcu_num_lvls-0x4
03d7   278546:	0f b6 95 b9 00 00 00 	movzbl 0xb9(%rbp),%edx
03de   27854d:	ff c8                	dec    %eax
03e0   27854f:	39 c2                	cmp    %eax,%edx
03e2   278551:	74 02                	je     278555 <synchronize_rcu_expedited_wait+0x3e6>
03e4   278553:	0f 0b                	ud2
03e6   278555:	4c 8d b5 b0 00 00 00 	lea    0xb0(%rbp),%r14
03ed   27855c:	4c 89 f0             	mov    %r14,%rax
03f0   27855f:	48 c1 e8 03          	shr    $0x3,%rax
03f4   278563:	8a 04 18             	mov    (%rax,%rbx,1),%al
03f7   278566:	84 c0                	test   %al,%al
03f9   278568:	74 0c                	je     278576 <synchronize_rcu_expedited_wait+0x407>
03fb   27856a:	3c 03                	cmp    $0x3,%al
03fd   27856c:	7f 08                	jg     278576 <synchronize_rcu_expedited_wait+0x407>
03ff   27856e:	4c 89 f7             	mov    %r14,%rdi
0402   278571:	e8 00 00 00 00       	call   278576 <synchronize_rcu_expedited_wait+0x407>	278572: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0407   278576:	83 bd b0 00 00 00 00 	cmpl   $0x0,0xb0(%rbp)
040e   27857d:	41 bc 01 00 00 00    	mov    $0x1,%r12d
0414   278583:	75 2b                	jne    2785b0 <synchronize_rcu_expedited_wait+0x441>
0416   278585:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	278588: R_X86_64_32S	__cpu_possible_mask
041d   27858c:	48 c1 e8 03          	shr    $0x3,%rax
0421   278590:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0425   278594:	74 0c                	je     2785a2 <synchronize_rcu_expedited_wait+0x433>
0427   278596:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278599: R_X86_64_32S	__cpu_possible_mask
042e   27859d:	e8 00 00 00 00       	call   2785a2 <synchronize_rcu_expedited_wait+0x433>	27859e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0433   2785a2:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 2785a9 <synchronize_rcu_expedited_wait+0x43a>	2785a5: R_X86_64_PC32	__cpu_possible_mask-0x4
043a   2785a9:	49 f7 d4             	not    %r12
043d   2785ac:	41 83 e4 01          	and    $0x1,%r12d
0441   2785b0:	4c 89 f0             	mov    %r14,%rax
0444   2785b3:	48 c1 e8 03          	shr    $0x3,%rax
0448   2785b7:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
044d   2785bc:	4c 8d bd b4 00 00 00 	lea    0xb4(%rbp),%r15
0454   2785c3:	4c 89 f8             	mov    %r15,%rax
0457   2785c6:	48 c1 e8 03          	shr    $0x3,%rax
045b   2785ca:	48 01 d8             	add    %rbx,%rax
045e   2785cd:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0463   2785d2:	4c 89 f8             	mov    %r15,%rax
0466   2785d5:	83 e0 07             	and    $0x7,%eax
0469   2785d8:	83 c0 03             	add    $0x3,%eax
046c   2785db:	88 44 24 24          	mov    %al,0x24(%rsp)
0470   2785df:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0475   2785e4:	8a 00                	mov    (%rax),%al
0477   2785e6:	38 44 24 24          	cmp    %al,0x24(%rsp)
047b   2785ea:	7c 0c                	jl     2785f8 <synchronize_rcu_expedited_wait+0x489>
047d   2785ec:	84 c0                	test   %al,%al
047f   2785ee:	74 08                	je     2785f8 <synchronize_rcu_expedited_wait+0x489>
0481   2785f0:	4c 89 ff             	mov    %r15,%rdi
0484   2785f3:	e8 00 00 00 00       	call   2785f8 <synchronize_rcu_expedited_wait+0x489>	2785f4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0489   2785f8:	44 39 a5 b4 00 00 00 	cmp    %r12d,0xb4(%rbp)
0490   2785ff:	0f 8c 5f 01 00 00    	jl     278764 <synchronize_rcu_expedited_wait+0x5f5>
0496   278605:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
049b   27860a:	8a 04 18             	mov    (%rax,%rbx,1),%al
049e   27860d:	84 c0                	test   %al,%al
04a0   27860f:	74 0c                	je     27861d <synchronize_rcu_expedited_wait+0x4ae>
04a2   278611:	3c 03                	cmp    $0x3,%al
04a4   278613:	7f 08                	jg     27861d <synchronize_rcu_expedited_wait+0x4ae>
04a6   278615:	4c 89 f7             	mov    %r14,%rdi
04a9   278618:	e8 00 00 00 00       	call   27861d <synchronize_rcu_expedited_wait+0x4ae>	278619: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
04ae   27861d:	44 89 e1             	mov    %r12d,%ecx
04b1   278620:	2b 8d b0 00 00 00    	sub    0xb0(%rbp),%ecx
04b7   278626:	83 f9 3f             	cmp    $0x3f,%ecx
04ba   278629:	76 1a                	jbe    278645 <synchronize_rcu_expedited_wait+0x4d6>
04bc   27862b:	48 63 d1             	movslq %ecx,%rdx
04bf   27862e:	be 01 00 00 00       	mov    $0x1,%esi
04c4   278633:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278636: R_X86_64_32S	.data+0x685820
04cb   27863a:	89 0c 24             	mov    %ecx,(%rsp)
04ce   27863d:	e8 00 00 00 00       	call   278642 <synchronize_rcu_expedited_wait+0x4d3>	27863e: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
04d3   278642:	8b 0c 24             	mov    (%rsp),%ecx
04d6   278645:	b8 01 00 00 00       	mov    $0x1,%eax
04db   27864a:	48 8d bd 80 00 00 00 	lea    0x80(%rbp),%rdi
04e2   278651:	48 d3 e0             	shl    %cl,%rax
04e5   278654:	48 89 04 24          	mov    %rax,(%rsp)
04e9   278658:	48 89 f8             	mov    %rdi,%rax
04ec   27865b:	48 c1 e8 03          	shr    $0x3,%rax
04f0   27865f:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
04f4   278663:	74 05                	je     27866a <synchronize_rcu_expedited_wait+0x4fb>
04f6   278665:	e8 00 00 00 00       	call   27866a <synchronize_rcu_expedited_wait+0x4fb>	278666: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04fb   27866a:	48 8b 85 80 00 00 00 	mov    0x80(%rbp),%rax
0502   278671:	48 85 04 24          	test   %rax,(%rsp)
0506   278675:	0f 84 de 00 00 00    	je     278759 <synchronize_rcu_expedited_wait+0x5ea>
050c   27867b:	31 c0                	xor    %eax,%eax
050e   27867d:	41 ff c5             	inc    %r13d
0511   278680:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 278687 <synchronize_rcu_expedited_wait+0x518>	278682: R_X86_64_PC32	.data+0x686b4c
0518   278687:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 27868e <synchronize_rcu_expedited_wait+0x51f>	27868a: R_X86_64_PC32	.data+0x686b5c
051f   27868e:	0f 95 c0             	setne  %al
0522   278691:	48 8d bd 90 00 00 00 	lea    0x90(%rbp),%rdi
0529   278698:	0f b6 80 00 00 00 00 	movzbl 0x0(%rax),%eax	27869b: R_X86_64_32S	.rodata+0x992c0
0530   27869f:	89 04 24             	mov    %eax,(%rsp)
0533   2786a2:	48 89 f8             	mov    %rdi,%rax
0536   2786a5:	48 c1 e8 03          	shr    $0x3,%rax
053a   2786a9:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
053e   2786ad:	74 05                	je     2786b4 <synchronize_rcu_expedited_wait+0x545>
0540   2786af:	e8 00 00 00 00       	call   2786b4 <synchronize_rcu_expedited_wait+0x545>	2786b0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0545   2786b4:	4c 89 f8             	mov    %r15,%rax
0548   2786b7:	48 23 85 90 00 00 00 	and    0x90(%rbp),%rax
054f   2786be:	48 8d bd 88 00 00 00 	lea    0x88(%rbp),%rdi
0556   2786c5:	0f 95 c0             	setne  %al
0559   2786c8:	0f b6 c0             	movzbl %al,%eax
055c   2786cb:	44 0f b6 80 00 00 00 00 	movzbl 0x0(%rax),%r8d	2786cf: R_X86_64_32S	.rodata+0x98860
0564   2786d3:	48 89 f8             	mov    %rdi,%rax
0567   2786d6:	48 c1 e8 03          	shr    $0x3,%rax
056b   2786da:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
056f   2786de:	74 0f                	je     2786ef <synchronize_rcu_expedited_wait+0x580>
0571   2786e0:	44 89 44 24 18       	mov    %r8d,0x18(%rsp)
0576   2786e5:	e8 00 00 00 00       	call   2786ea <synchronize_rcu_expedited_wait+0x57b>	2786e6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
057b   2786ea:	44 8b 44 24 18       	mov    0x18(%rsp),%r8d
0580   2786ef:	31 c0                	xor    %eax,%eax
0582   2786f1:	4c 23 bd 88 00 00 00 	and    0x88(%rbp),%r15
0589   2786f8:	45 89 e7             	mov    %r12d,%r15d
058c   2786fb:	0f 95 c0             	setne  %al
058f   2786fe:	41 83 f7 01          	xor    $0x1,%r15d
0593   278702:	4d 63 ff             	movslq %r15d,%r15
0596   278705:	0f b6 88 00 00 00 00 	movzbl 0x0(%rax),%ecx	278708: R_X86_64_32S	.rodata+0x988a0
059d   27870c:	49 83 ff 02          	cmp    $0x2,%r15
05a1   278710:	76 21                	jbe    278733 <synchronize_rcu_expedited_wait+0x5c4>
05a3   278712:	4c 89 fe             	mov    %r15,%rsi
05a6   278715:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278718: R_X86_64_32S	.data+0x6849a0
05ad   27871c:	89 4c 24 24          	mov    %ecx,0x24(%rsp)
05b1   278720:	44 89 44 24 18       	mov    %r8d,0x18(%rsp)
05b6   278725:	e8 00 00 00 00       	call   27872a <synchronize_rcu_expedited_wait+0x5bb>	278726: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
05bb   27872a:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
05bf   27872e:	44 8b 44 24 18       	mov    0x18(%rsp),%r8d
05c4   278733:	41 0f b6 97 00 00 00 00 	movzbl 0x0(%r15),%edx	278737: R_X86_64_32S	.rodata+0x988e0
05cc   27873b:	44 8b 0c 24          	mov    (%rsp),%r9d
05d0   27873f:	44 89 e6             	mov    %r12d,%esi
05d3   278742:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278745: R_X86_64_32S	.rodata+0x99180
05da   278749:	41 bc 01 00 00 00    	mov    $0x1,%r12d
05e0   27874f:	e8 00 00 00 00       	call   278754 <synchronize_rcu_expedited_wait+0x5e5>	278750: R_X86_64_PLT32	_printk-0x4
05e5   278754:	e9 63 fe ff ff       	jmp    2785bc <synchronize_rcu_expedited_wait+0x44d>
05ea   278759:	41 bc 01 00 00 00    	mov    $0x1,%r12d
05f0   27875f:	e9 7b fe ff ff       	jmp    2785df <synchronize_rcu_expedited_wait+0x470>
05f5   278764:	48 81 c5 30 05 00 00 	add    $0x530,%rbp
05fc   27876b:	e9 e6 fb ff ff       	jmp    278356 <synchronize_rcu_expedited_wait+0x1e7>
0601   278770:	31 c0                	xor    %eax,%eax
0603   278772:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 278779 <synchronize_rcu_expedited_wait+0x60a>	278775: R_X86_64_PC32	.data+0x68625c
060a   278779:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 278780 <synchronize_rcu_expedited_wait+0x611>	27877c: R_X86_64_PC32	.data+0x686a44
0611   278780:	48 83 3d 00 00 00 00 00 	cmpq   $0x0,0x0(%rip)        # 278788 <synchronize_rcu_expedited_wait+0x619>	278783: R_X86_64_PC32	.data+0x6862bb
0619   278788:	0f 95 c0             	setne  %al
061c   27878b:	44 0f b6 80 00 00 00 00 	movzbl 0x0(%rax),%r8d	27878f: R_X86_64_32S	.rodata+0x99300
0624   278793:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	278796: R_X86_64_32S	jiffies
062b   27879a:	48 c1 e8 03          	shr    $0x3,%rax
062f   27879e:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0633   2787a2:	74 14                	je     2787b8 <synchronize_rcu_expedited_wait+0x649>
0635   2787a4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2787a7: R_X86_64_32S	jiffies
063c   2787ab:	44 89 04 24          	mov    %r8d,(%rsp)
0640   2787af:	e8 00 00 00 00       	call   2787b4 <synchronize_rcu_expedited_wait+0x645>	2787b0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0645   2787b4:	44 8b 04 24          	mov    (%rsp),%r8d
0649   2787b8:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 2787bf <synchronize_rcu_expedited_wait+0x650>	2787bb: R_X86_64_PC32	jiffies-0x4
0650   2787bf:	4c 89 f1             	mov    %r14,%rcx
0653   2787c2:	4c 89 e2             	mov    %r12,%rdx
0656   2787c5:	48 2b 74 24 10       	sub    0x10(%rsp),%rsi
065b   2787ca:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2787cd: R_X86_64_32S	.rodata+0x991c0
0662   2787d1:	e8 00 00 00 00       	call   2787d6 <synchronize_rcu_expedited_wait+0x667>	2787d2: R_X86_64_PLT32	_printk-0x4
0667   2787d6:	45 85 ed             	test   %r13d,%r13d
066a   2787d9:	0f 84 5f 01 00 00    	je     27893e <synchronize_rcu_expedited_wait+0x7cf>
0670   2787df:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2787e2: R_X86_64_32S	.rodata+0x99220
0677   2787e6:	48 c7 c5 00 00 00 00 	mov    $0x0,%rbp	2787e9: R_X86_64_32S	.data+0x6861e0
067e   2787ed:	e8 00 00 00 00       	call   2787f2 <synchronize_rcu_expedited_wait+0x683>	2787ee: R_X86_64_PLT32	_printk-0x4
0683   2787f2:	4c 63 25 00 00 00 00 	movslq 0x0(%rip),%r12        # 2787f9 <synchronize_rcu_expedited_wait+0x68a>	2787f5: R_X86_64_PC32	rcu_num_nodes-0x4
068a   2787f9:	49 83 fc 01          	cmp    $0x1,%r12
068e   2787fd:	76 0f                	jbe    27880e <synchronize_rcu_expedited_wait+0x69f>
0690   2787ff:	4c 89 e6             	mov    %r12,%rsi
0693   278802:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278805: R_X86_64_32S	.data+0x6848a0
069a   278809:	e8 00 00 00 00       	call   27880e <synchronize_rcu_expedited_wait+0x69f>	27880a: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
069f   27880e:	4d 69 e4 30 05 00 00 	imul   $0x530,%r12,%r12
06a6   278815:	49 81 c4 00 00 00 00 	add    $0x0,%r12	278818: R_X86_64_32S	.data+0x6861e0
06ad   27881c:	4c 39 e5             	cmp    %r12,%rbp
06b0   27881f:	0f 83 0d 01 00 00    	jae    278932 <synchronize_rcu_expedited_wait+0x7c3>
06b6   278825:	48 81 fd 00 00 00 00 	cmp    $0x0,%rbp	278828: R_X86_64_32S	.data+0x6861e0
06bd   27882c:	0f 84 f4 00 00 00    	je     278926 <synchronize_rcu_expedited_wait+0x7b7>
06c3   278832:	48 89 ef             	mov    %rbp,%rdi
06c6   278835:	e8 75 1b ff ff       	call   26a3af <sync_rcu_exp_done_unlocked>
06cb   27883a:	84 c0                	test   %al,%al
06cd   27883c:	0f 85 e4 00 00 00    	jne    278926 <synchronize_rcu_expedited_wait+0x7b7>
06d3   278842:	48 8d bd e0 00 00 00 	lea    0xe0(%rbp),%rdi
06da   278849:	48 89 f8             	mov    %rdi,%rax
06dd   27884c:	48 c1 e8 03          	shr    $0x3,%rax
06e1   278850:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
06e5   278854:	74 05                	je     27885b <synchronize_rcu_expedited_wait+0x6ec>
06e7   278856:	e8 00 00 00 00       	call   27885b <synchronize_rcu_expedited_wait+0x6ec>	278857: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06ec   27885b:	31 c0                	xor    %eax,%eax
06ee   27885d:	48 83 bd e0 00 00 00 00 	cmpq   $0x0,0xe0(%rbp)
06f6   278865:	48 8d bd 80 00 00 00 	lea    0x80(%rbp),%rdi
06fd   27886c:	0f 95 c0             	setne  %al
0700   27886f:	44 0f b6 b0 00 00 00 00 	movzbl 0x0(%rax),%r14d	278873: R_X86_64_32S	.rodata+0x99300
0708   278877:	48 89 f8             	mov    %rdi,%rax
070b   27887a:	48 c1 e8 03          	shr    $0x3,%rax
070f   27887e:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0713   278882:	74 05                	je     278889 <synchronize_rcu_expedited_wait+0x71a>
0715   278884:	e8 00 00 00 00       	call   278889 <synchronize_rcu_expedited_wait+0x71a>	278885: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
071a   278889:	48 8d bd b4 00 00 00 	lea    0xb4(%rbp),%rdi
0721   278890:	4c 8b ad 80 00 00 00 	mov    0x80(%rbp),%r13
0728   278897:	48 89 f8             	mov    %rdi,%rax
072b   27889a:	48 c1 e8 03          	shr    $0x3,%rax
072f   27889e:	8a 14 18             	mov    (%rax,%rbx,1),%dl
0732   2788a1:	48 89 f8             	mov    %rdi,%rax
0735   2788a4:	83 e0 07             	and    $0x7,%eax
0738   2788a7:	83 c0 03             	add    $0x3,%eax
073b   2788aa:	38 d0                	cmp    %dl,%al
073d   2788ac:	7c 09                	jl     2788b7 <synchronize_rcu_expedited_wait+0x748>
073f   2788ae:	84 d2                	test   %dl,%dl
0741   2788b0:	74 05                	je     2788b7 <synchronize_rcu_expedited_wait+0x748>
0743   2788b2:	e8 00 00 00 00       	call   2788b7 <synchronize_rcu_expedited_wait+0x748>	2788b3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0748   2788b7:	48 8d bd b0 00 00 00 	lea    0xb0(%rbp),%rdi
074f   2788be:	44 8b a5 b4 00 00 00 	mov    0xb4(%rbp),%r12d
0756   2788c5:	48 89 f8             	mov    %rdi,%rax
0759   2788c8:	48 c1 e8 03          	shr    $0x3,%rax
075d   2788cc:	8a 04 18             	mov    (%rax,%rbx,1),%al
0760   2788cf:	84 c0                	test   %al,%al
0762   2788d1:	74 09                	je     2788dc <synchronize_rcu_expedited_wait+0x76d>
0764   2788d3:	3c 03                	cmp    $0x3,%al
0766   2788d5:	7f 05                	jg     2788dc <synchronize_rcu_expedited_wait+0x76d>
0768   2788d7:	e8 00 00 00 00       	call   2788dc <synchronize_rcu_expedited_wait+0x76d>	2788d8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
076d   2788dc:	48 8d bd b9 00 00 00 	lea    0xb9(%rbp),%rdi
0774   2788e3:	44 8b bd b0 00 00 00 	mov    0xb0(%rbp),%r15d
077b   2788ea:	48 89 f8             	mov    %rdi,%rax
077e   2788ed:	48 89 fa             	mov    %rdi,%rdx
0781   2788f0:	48 c1 e8 03          	shr    $0x3,%rax
0785   2788f4:	83 e2 07             	and    $0x7,%edx
0788   2788f7:	8a 04 18             	mov    (%rax,%rbx,1),%al
078b   2788fa:	38 d0                	cmp    %dl,%al
078d   2788fc:	7f 09                	jg     278907 <synchronize_rcu_expedited_wait+0x798>
078f   2788fe:	84 c0                	test   %al,%al
0791   278900:	74 05                	je     278907 <synchronize_rcu_expedited_wait+0x798>
0793   278902:	e8 00 00 00 00       	call   278907 <synchronize_rcu_expedited_wait+0x798>	278903: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0798   278907:	0f b6 b5 b9 00 00 00 	movzbl 0xb9(%rbp),%esi
079f   27890e:	45 89 f1             	mov    %r14d,%r9d
07a2   278911:	4d 89 e8             	mov    %r13,%r8
07a5   278914:	44 89 e1             	mov    %r12d,%ecx
07a8   278917:	44 89 fa             	mov    %r15d,%edx
07ab   27891a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	27891d: R_X86_64_32S	.rodata+0x99280
07b2   278921:	e8 00 00 00 00       	call   278926 <synchronize_rcu_expedited_wait+0x7b7>	278922: R_X86_64_PLT32	_printk-0x4
07b7   278926:	48 81 c5 30 05 00 00 	add    $0x530,%rbp
07be   27892d:	e9 c0 fe ff ff       	jmp    2787f2 <synchronize_rcu_expedited_wait+0x683>
07c3   278932:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278935: R_X86_64_32S	.rodata+0x975a0
07ca   278939:	e8 00 00 00 00       	call   27893e <synchronize_rcu_expedited_wait+0x7cf>	27893a: R_X86_64_PLT32	_printk-0x4
07cf   27893e:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 278944 <synchronize_rcu_expedited_wait+0x7d5>	278940: R_X86_64_PC32	rcu_num_lvls-0x4
07d5   278944:	8d 68 ff             	lea    -0x1(%rax),%ebp
07d8   278947:	48 63 ed             	movslq %ebp,%rbp
07db   27894a:	48 83 fd 01          	cmp    $0x1,%rbp
07df   27894e:	76 0f                	jbe    27895f <synchronize_rcu_expedited_wait+0x7f0>
07e1   278950:	48 89 ee             	mov    %rbp,%rsi
07e4   278953:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278956: R_X86_64_32S	.data+0x684860
07eb   27895a:	e8 00 00 00 00       	call   27895f <synchronize_rcu_expedited_wait+0x7f0>	27895b: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
07f0   27895f:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi	278963: R_X86_64_32S	.data+0x686710
07f8   278967:	48 89 f8             	mov    %rdi,%rax
07fb   27896a:	48 c1 e8 03          	shr    $0x3,%rax
07ff   27896e:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0803   278972:	74 05                	je     278979 <synchronize_rcu_expedited_wait+0x80a>
0805   278974:	e8 00 00 00 00       	call   278979 <synchronize_rcu_expedited_wait+0x80a>	278975: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
080a   278979:	48 8b 2c ed 00 00 00 00 	mov    0x0(,%rbp,8),%rbp	27897d: R_X86_64_32S	.data+0x686710
0812   278981:	4c 63 25 00 00 00 00 	movslq 0x0(%rip),%r12        # 278988 <synchronize_rcu_expedited_wait+0x819>	278984: R_X86_64_PC32	rcu_num_nodes-0x4
0819   278988:	49 83 fc 01          	cmp    $0x1,%r12
081d   27898c:	76 0f                	jbe    27899d <synchronize_rcu_expedited_wait+0x82e>
081f   27898e:	4c 89 e6             	mov    %r12,%rsi
0822   278991:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278994: R_X86_64_32S	.data+0x684820
0829   278998:	e8 00 00 00 00       	call   27899d <synchronize_rcu_expedited_wait+0x82e>	278999: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
082e   27899d:	4d 69 e4 30 05 00 00 	imul   $0x530,%r12,%r12
0835   2789a4:	49 81 c4 00 00 00 00 	add    $0x0,%r12	2789a7: R_X86_64_32S	.data+0x6861e0
083c   2789ab:	4c 39 e5             	cmp    %r12,%rbp
083f   2789ae:	0f 83 37 03 00 00    	jae    278ceb <synchronize_rcu_expedited_wait+0xb7c>
0845   2789b4:	48 8d bd b9 00 00 00 	lea    0xb9(%rbp),%rdi
084c   2789bb:	48 89 f8             	mov    %rdi,%rax
084f   2789be:	48 89 fa             	mov    %rdi,%rdx
0852   2789c1:	48 c1 e8 03          	shr    $0x3,%rax
0856   2789c5:	83 e2 07             	and    $0x7,%edx
0859   2789c8:	8a 04 18             	mov    (%rax,%rbx,1),%al
085c   2789cb:	38 d0                	cmp    %dl,%al
085e   2789cd:	7f 09                	jg     2789d8 <synchronize_rcu_expedited_wait+0x869>
0860   2789cf:	84 c0                	test   %al,%al
0862   2789d1:	74 05                	je     2789d8 <synchronize_rcu_expedited_wait+0x869>
0864   2789d3:	e8 00 00 00 00       	call   2789d8 <synchronize_rcu_expedited_wait+0x869>	2789d4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0869   2789d8:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 2789de <synchronize_rcu_expedited_wait+0x86f>	2789da: R_X86_64_PC32	rcu_num_lvls-0x4
086f   2789de:	0f b6 95 b9 00 00 00 	movzbl 0xb9(%rbp),%edx
0876   2789e5:	ff c8                	dec    %eax
0878   2789e7:	39 c2                	cmp    %eax,%edx
087a   2789e9:	74 02                	je     2789ed <synchronize_rcu_expedited_wait+0x87e>
087c   2789eb:	0f 0b                	ud2
087e   2789ed:	4c 8d ad b0 00 00 00 	lea    0xb0(%rbp),%r13
0885   2789f4:	4c 89 e8             	mov    %r13,%rax
0888   2789f7:	48 c1 e8 03          	shr    $0x3,%rax
088c   2789fb:	8a 04 18             	mov    (%rax,%rbx,1),%al
088f   2789fe:	84 c0                	test   %al,%al
0891   278a00:	74 0c                	je     278a0e <synchronize_rcu_expedited_wait+0x89f>
0893   278a02:	3c 03                	cmp    $0x3,%al
0895   278a04:	7f 08                	jg     278a0e <synchronize_rcu_expedited_wait+0x89f>
0897   278a06:	4c 89 ef             	mov    %r13,%rdi
089a   278a09:	e8 00 00 00 00       	call   278a0e <synchronize_rcu_expedited_wait+0x89f>	278a0a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
089f   278a0e:	83 bd b0 00 00 00 00 	cmpl   $0x0,0xb0(%rbp)
08a6   278a15:	41 bc 01 00 00 00    	mov    $0x1,%r12d
08ac   278a1b:	75 2b                	jne    278a48 <synchronize_rcu_expedited_wait+0x8d9>
08ae   278a1d:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	278a20: R_X86_64_32S	__cpu_possible_mask
08b5   278a24:	48 c1 e8 03          	shr    $0x3,%rax
08b9   278a28:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
08bd   278a2c:	74 0c                	je     278a3a <synchronize_rcu_expedited_wait+0x8cb>
08bf   278a2e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278a31: R_X86_64_32S	__cpu_possible_mask
08c6   278a35:	e8 00 00 00 00       	call   278a3a <synchronize_rcu_expedited_wait+0x8cb>	278a36: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
08cb   278a3a:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 278a41 <synchronize_rcu_expedited_wait+0x8d2>	278a3d: R_X86_64_PC32	__cpu_possible_mask-0x4
08d2   278a41:	49 f7 d4             	not    %r12
08d5   278a44:	41 83 e4 01          	and    $0x1,%r12d
08d9   278a48:	4d 89 ef             	mov    %r13,%r15
08dc   278a4b:	49 c1 ef 03          	shr    $0x3,%r15
08e0   278a4f:	4c 8d b5 b4 00 00 00 	lea    0xb4(%rbp),%r14
08e7   278a56:	4c 89 f0             	mov    %r14,%rax
08ea   278a59:	48 c1 e8 03          	shr    $0x3,%rax
08ee   278a5d:	48 01 d8             	add    %rbx,%rax
08f1   278a60:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
08f6   278a65:	4c 89 f0             	mov    %r14,%rax
08f9   278a68:	83 e0 07             	and    $0x7,%eax
08fc   278a6b:	83 c0 03             	add    $0x3,%eax
08ff   278a6e:	88 44 24 24          	mov    %al,0x24(%rsp)
0903   278a72:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0908   278a77:	8a 00                	mov    (%rax),%al
090a   278a79:	38 44 24 24          	cmp    %al,0x24(%rsp)
090e   278a7d:	7c 0c                	jl     278a8b <synchronize_rcu_expedited_wait+0x91c>
0910   278a7f:	84 c0                	test   %al,%al
0912   278a81:	74 08                	je     278a8b <synchronize_rcu_expedited_wait+0x91c>
0914   278a83:	4c 89 f7             	mov    %r14,%rdi
0917   278a86:	e8 00 00 00 00       	call   278a8b <synchronize_rcu_expedited_wait+0x91c>	278a87: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
091c   278a8b:	44 39 a5 b4 00 00 00 	cmp    %r12d,0xb4(%rbp)
0923   278a92:	0f 8c b3 00 00 00    	jl     278b4b <synchronize_rcu_expedited_wait+0x9dc>
0929   278a98:	41 8a 04 1f          	mov    (%r15,%rbx,1),%al
092d   278a9c:	84 c0                	test   %al,%al
092f   278a9e:	74 0c                	je     278aac <synchronize_rcu_expedited_wait+0x93d>
0931   278aa0:	3c 03                	cmp    $0x3,%al
0933   278aa2:	7f 08                	jg     278aac <synchronize_rcu_expedited_wait+0x93d>
0935   278aa4:	4c 89 ef             	mov    %r13,%rdi
0938   278aa7:	e8 00 00 00 00       	call   278aac <synchronize_rcu_expedited_wait+0x93d>	278aa8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
093d   278aac:	44 89 e1             	mov    %r12d,%ecx
0940   278aaf:	2b 8d b0 00 00 00    	sub    0xb0(%rbp),%ecx
0946   278ab5:	83 f9 3f             	cmp    $0x3f,%ecx
0949   278ab8:	76 1a                	jbe    278ad4 <synchronize_rcu_expedited_wait+0x965>
094b   278aba:	48 63 d1             	movslq %ecx,%rdx
094e   278abd:	be 01 00 00 00       	mov    $0x1,%esi
0953   278ac2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278ac5: R_X86_64_32S	.data+0x6857e0
095a   278ac9:	89 0c 24             	mov    %ecx,(%rsp)
095d   278acc:	e8 00 00 00 00       	call   278ad1 <synchronize_rcu_expedited_wait+0x962>	278acd: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
0962   278ad1:	8b 0c 24             	mov    (%rsp),%ecx
0965   278ad4:	b8 01 00 00 00       	mov    $0x1,%eax
096a   278ad9:	48 8d bd 80 00 00 00 	lea    0x80(%rbp),%rdi
0971   278ae0:	48 d3 e0             	shl    %cl,%rax
0974   278ae3:	48 89 04 24          	mov    %rax,(%rsp)
0978   278ae7:	48 89 f8             	mov    %rdi,%rax
097b   278aea:	48 c1 e8 03          	shr    $0x3,%rax
097f   278aee:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0983   278af2:	74 05                	je     278af9 <synchronize_rcu_expedited_wait+0x98a>
0985   278af4:	e8 00 00 00 00       	call   278af9 <synchronize_rcu_expedited_wait+0x98a>	278af5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
098a   278af9:	48 8b 85 80 00 00 00 	mov    0x80(%rbp),%rax
0991   278b00:	48 85 04 24          	test   %rax,(%rsp)
0995   278b04:	74 3a                	je     278b40 <synchronize_rcu_expedited_wait+0x9d1>
0997   278b06:	bf 01 00 00 00       	mov    $0x1,%edi
099c   278b0b:	e8 00 00 00 00       	call   278b10 <synchronize_rcu_expedited_wait+0x9a1>	278b0c: R_X86_64_PLT32	preempt_count_add-0x4
09a1   278b10:	44 89 e7             	mov    %r12d,%edi
09a4   278b13:	e8 00 00 00 00       	call   278b18 <synchronize_rcu_expedited_wait+0x9a9>	278b14: R_X86_64_PLT32	dump_cpu_task-0x4
09a9   278b18:	bf 01 00 00 00       	mov    $0x1,%edi
09ae   278b1d:	41 bc 01 00 00 00    	mov    $0x1,%r12d
09b4   278b23:	e8 00 00 00 00       	call   278b28 <synchronize_rcu_expedited_wait+0x9b9>	278b24: R_X86_64_PLT32	preempt_count_sub-0x4
09b9   278b28:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 278b2e <synchronize_rcu_expedited_wait+0x9bf>	278b2a: R_X86_64_PC32	pcpu_hot+0x4
09bf   278b2e:	85 c0                	test   %eax,%eax
09c1   278b30:	0f 85 19 ff ff ff    	jne    278a4f <synchronize_rcu_expedited_wait+0x8e0>
09c7   278b36:	e8 00 00 00 00       	call   278b3b <synchronize_rcu_expedited_wait+0x9cc>	278b37: R_X86_64_PLT32	preempt_schedule_thunk-0x4
09cc   278b3b:	e9 0f ff ff ff       	jmp    278a4f <synchronize_rcu_expedited_wait+0x8e0>
09d1   278b40:	41 bc 01 00 00 00    	mov    $0x1,%r12d
09d7   278b46:	e9 27 ff ff ff       	jmp    278a72 <synchronize_rcu_expedited_wait+0x903>
09dc   278b4b:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	278b4e: R_X86_64_32S	rcu_exp_stall_task_details
09e3   278b52:	48 89 c2             	mov    %rax,%rdx
09e6   278b55:	83 e0 07             	and    $0x7,%eax
09e9   278b58:	48 c1 ea 03          	shr    $0x3,%rdx
09ed   278b5c:	8a 14 1a             	mov    (%rdx,%rbx,1),%dl
09f0   278b5f:	38 c2                	cmp    %al,%dl
09f2   278b61:	7f 10                	jg     278b73 <synchronize_rcu_expedited_wait+0xa04>
09f4   278b63:	84 d2                	test   %dl,%dl
09f6   278b65:	74 0c                	je     278b73 <synchronize_rcu_expedited_wait+0xa04>
09f8   278b67:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278b6a: R_X86_64_32S	rcu_exp_stall_task_details
09ff   278b6e:	e8 00 00 00 00       	call   278b73 <synchronize_rcu_expedited_wait+0xa04>	278b6f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0a04   278b73:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 278b7a <synchronize_rcu_expedited_wait+0xa0b>	278b75: R_X86_64_PC32	rcu_exp_stall_task_details-0x5
0a0b   278b7a:	0f 84 5f 01 00 00    	je     278cdf <synchronize_rcu_expedited_wait+0xb70>
0a11   278b80:	48 89 ef             	mov    %rbp,%rdi
0a14   278b83:	e8 00 00 00 00       	call   278b88 <synchronize_rcu_expedited_wait+0xa19>	278b84: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
0a19   278b88:	48 8d bd e0 00 00 00 	lea    0xe0(%rbp),%rdi
0a20   278b8f:	49 89 c4             	mov    %rax,%r12
0a23   278b92:	48 89 f8             	mov    %rdi,%rax
0a26   278b95:	48 c1 e8 03          	shr    $0x3,%rax
0a2a   278b99:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0a2e   278b9d:	74 05                	je     278ba4 <synchronize_rcu_expedited_wait+0xa35>
0a30   278b9f:	e8 00 00 00 00       	call   278ba4 <synchronize_rcu_expedited_wait+0xa35>	278ba0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a35   278ba4:	48 8b 85 e0 00 00 00 	mov    0xe0(%rbp),%rax
0a3c   278bab:	48 85 c0             	test   %rax,%rax
0a3f   278bae:	75 5b                	jne    278c0b <synchronize_rcu_expedited_wait+0xa9c>
0a41   278bb0:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	278bb3: R_X86_64_32S	debug_locks
0a48   278bb7:	48 89 c2             	mov    %rax,%rdx
0a4b   278bba:	83 e0 07             	and    $0x7,%eax
0a4e   278bbd:	48 c1 ea 03          	shr    $0x3,%rdx
0a52   278bc1:	83 c0 03             	add    $0x3,%eax
0a55   278bc4:	8a 14 1a             	mov    (%rdx,%rbx,1),%dl
0a58   278bc7:	38 d0                	cmp    %dl,%al
0a5a   278bc9:	7c 10                	jl     278bdb <synchronize_rcu_expedited_wait+0xa6c>
0a5c   278bcb:	84 d2                	test   %dl,%dl
0a5e   278bcd:	74 0c                	je     278bdb <synchronize_rcu_expedited_wait+0xa6c>
0a60   278bcf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278bd2: R_X86_64_32S	debug_locks
0a67   278bd6:	e8 00 00 00 00       	call   278bdb <synchronize_rcu_expedited_wait+0xa6c>	278bd7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a6c   278bdb:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 278be2 <synchronize_rcu_expedited_wait+0xa73>	278bdd: R_X86_64_PC32	debug_locks-0x5
0a73   278be2:	0f 84 ec 00 00 00    	je     278cd4 <synchronize_rcu_expedited_wait+0xb65>
0a79   278be8:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 278bee <synchronize_rcu_expedited_wait+0xa7f>	278bea: R_X86_64_PC32	lockdep_recursion-0x4
0a7f   278bee:	85 c0                	test   %eax,%eax
0a81   278bf0:	0f 85 de 00 00 00    	jne    278cd4 <synchronize_rcu_expedited_wait+0xb65>
0a87   278bf6:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 278bfc <synchronize_rcu_expedited_wait+0xa8d>	278bf8: R_X86_64_PC32	hardirqs_enabled-0x4
0a8d   278bfc:	85 c0                	test   %eax,%eax
0a8f   278bfe:	0f 84 d0 00 00 00    	je     278cd4 <synchronize_rcu_expedited_wait+0xb65>
0a95   278c04:	0f 0b                	ud2
0a97   278c06:	e9 c9 00 00 00       	jmp    278cd4 <synchronize_rcu_expedited_wait+0xb65>
0a9c   278c0b:	4c 8b ad e0 00 00 00 	mov    0xe0(%rbp),%r13
0aa3   278c12:	49 8d 7d 08          	lea    0x8(%r13),%rdi
0aa7   278c16:	48 89 f8             	mov    %rdi,%rax
0aaa   278c19:	48 c1 e8 03          	shr    $0x3,%rax
0aae   278c1d:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0ab2   278c21:	74 05                	je     278c28 <synchronize_rcu_expedited_wait+0xab9>
0ab4   278c23:	e8 00 00 00 00       	call   278c28 <synchronize_rcu_expedited_wait+0xab9>	278c24: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ab9   278c28:	4d 8b 6d 08          	mov    0x8(%r13),%r13
0abd   278c2c:	4c 89 e8             	mov    %r13,%rax
0ac0   278c2f:	48 c1 e8 03          	shr    $0x3,%rax
0ac4   278c33:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0ac8   278c37:	74 08                	je     278c41 <synchronize_rcu_expedited_wait+0xad2>
0aca   278c39:	4c 89 ef             	mov    %r13,%rdi
0acd   278c3c:	e8 00 00 00 00       	call   278c41 <synchronize_rcu_expedited_wait+0xad2>	278c3d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ad2   278c41:	4d 8b 6d 00          	mov    0x0(%r13),%r13
0ad6   278c45:	49 81 ed 78 03 00 00 	sub    $0x378,%r13
0add   278c4c:	48 8d 85 c8 00 00 00 	lea    0xc8(%rbp),%rax
0ae4   278c53:	4d 8d b5 78 03 00 00 	lea    0x378(%r13),%r14
0aeb   278c5a:	49 39 c6             	cmp    %rax,%r14
0aee   278c5d:	74 2b                	je     278c8a <synchronize_rcu_expedited_wait+0xb1b>
0af0   278c5f:	e8 00 00 00 00       	call   278c64 <synchronize_rcu_expedited_wait+0xaf5>	278c60: R_X86_64_PLT32	touch_softlockup_watchdog-0x4
0af5   278c64:	4c 89 ef             	mov    %r13,%rdi
0af8   278c67:	e8 00 00 00 00       	call   278c6c <synchronize_rcu_expedited_wait+0xafd>	278c68: R_X86_64_PLT32	sched_show_task-0x4
0afd   278c6c:	4c 89 f0             	mov    %r14,%rax
0b00   278c6f:	48 c1 e8 03          	shr    $0x3,%rax
0b04   278c73:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0b08   278c77:	74 08                	je     278c81 <synchronize_rcu_expedited_wait+0xb12>
0b0a   278c79:	4c 89 f7             	mov    %r14,%rdi
0b0d   278c7c:	e8 00 00 00 00       	call   278c81 <synchronize_rcu_expedited_wait+0xb12>	278c7d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b12   278c81:	4d 8b ad 78 03 00 00 	mov    0x378(%r13),%r13
0b19   278c88:	eb bb                	jmp    278c45 <synchronize_rcu_expedited_wait+0xad6>
0b1b   278c8a:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	278c8d: R_X86_64_32S	debug_locks
0b22   278c91:	48 89 c2             	mov    %rax,%rdx
0b25   278c94:	83 e0 07             	and    $0x7,%eax
0b28   278c97:	48 c1 ea 03          	shr    $0x3,%rdx
0b2c   278c9b:	83 c0 03             	add    $0x3,%eax
0b2f   278c9e:	8a 14 1a             	mov    (%rdx,%rbx,1),%dl
0b32   278ca1:	38 d0                	cmp    %dl,%al
0b34   278ca3:	7c 10                	jl     278cb5 <synchronize_rcu_expedited_wait+0xb46>
0b36   278ca5:	84 d2                	test   %dl,%dl
0b38   278ca7:	74 0c                	je     278cb5 <synchronize_rcu_expedited_wait+0xb46>
0b3a   278ca9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	278cac: R_X86_64_32S	debug_locks
0b41   278cb0:	e8 00 00 00 00       	call   278cb5 <synchronize_rcu_expedited_wait+0xb46>	278cb1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b46   278cb5:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 278cbc <synchronize_rcu_expedited_wait+0xb4d>	278cb7: R_X86_64_PC32	debug_locks-0x5
0b4d   278cbc:	74 16                	je     278cd4 <synchronize_rcu_expedited_wait+0xb65>
0b4f   278cbe:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 278cc4 <synchronize_rcu_expedited_wait+0xb55>	278cc0: R_X86_64_PC32	lockdep_recursion-0x4
0b55   278cc4:	85 c0                	test   %eax,%eax
0b57   278cc6:	75 0c                	jne    278cd4 <synchronize_rcu_expedited_wait+0xb65>
0b59   278cc8:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 278cce <synchronize_rcu_expedited_wait+0xb5f>	278cca: R_X86_64_PC32	hardirqs_enabled-0x4
0b5f   278cce:	85 c0                	test   %eax,%eax
0b61   278cd0:	74 02                	je     278cd4 <synchronize_rcu_expedited_wait+0xb65>
0b63   278cd2:	0f 0b                	ud2
0b65   278cd4:	4c 89 e6             	mov    %r12,%rsi
0b68   278cd7:	48 89 ef             	mov    %rbp,%rdi
0b6b   278cda:	e8 00 00 00 00       	call   278cdf <synchronize_rcu_expedited_wait+0xb70>	278cdb: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
0b70   278cdf:	48 81 c5 30 05 00 00 	add    $0x530,%rbp
0b77   278ce6:	e9 96 fc ff ff       	jmp    278981 <synchronize_rcu_expedited_wait+0x812>
0b7c   278ceb:	e8 00 00 00 00       	call   278cf0 <synchronize_rcu_expedited_wait+0xb81>	278cec: R_X86_64_PLT32	rcu_exp_jiffies_till_stall_check-0x4
0b81   278cf0:	8d 68 01             	lea    0x1(%rax),%ebp
0b84   278cf3:	8d 6c 6d 00          	lea    0x0(%rbp,%rbp,2),%ebp
0b88   278cf7:	48 63 ed             	movslq %ebp,%rbp
0b8b   278cfa:	e8 7d 23 ff ff       	call   26b07c <panic_on_rcu_stall>
0b90   278cff:	e9 17 f5 ff ff       	jmp    27821b <synchronize_rcu_expedited_wait+0xac>
0b95   278d04:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0b9a   278d09:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
0b9f   278d0e:	b9 03 00 00 00       	mov    $0x3,%ecx
0ba4   278d13:	48 c1 e0 2a          	shl    $0x2a,%rax
0ba8   278d17:	48 01 c2             	add    %rax,%rdx
0bab   278d1a:	31 c0                	xor    %eax,%eax
0bad   278d1c:	48 89 d7             	mov    %rdx,%rdi
0bb0   278d1f:	f3 ab                	rep stos %eax,%es:(%rdi)
0bb2   278d21:	48 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%rax
0bba   278d29:	65 48 2b 04 25 28 00 00 00 	sub    %gs:0x28,%rax
0bc3   278d32:	74 05                	je     278d39 <synchronize_rcu_expedited_wait+0xbca>
0bc5   278d34:	e8 00 00 00 00       	call   278d39 <synchronize_rcu_expedited_wait+0xbca>	278d35: R_X86_64_PLT32	__stack_chk_fail-0x4
0bca   278d39:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
0bd1   278d40:	5b                   	pop    %rbx
0bd2   278d41:	5d                   	pop    %rbp
0bd3   278d42:	41 5c                	pop    %r12
0bd5   278d44:	41 5d                	pop    %r13
0bd7   278d46:	41 5e                	pop    %r14
0bd9   278d48:	41 5f                	pop    %r15
0bdb   278d4a:	31 c0                	xor    %eax,%eax
0bdd   278d4c:	31 d2                	xor    %edx,%edx
0bdf   278d4e:	31 c9                	xor    %ecx,%ecx
0be1   278d50:	31 f6                	xor    %esi,%esi
0be3   278d52:	31 ff                	xor    %edi,%edi
0be5   278d54:	45 31 c0             	xor    %r8d,%r8d
0be8   278d57:	45 31 c9             	xor    %r9d,%r9d
0beb   278d5a:	e9 00 00 00 00       	jmp    278d5f <rcu_exp_wait_wake>	278d5b: R_X86_64_PLT32	__x86_return_thunk-0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
