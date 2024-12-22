Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CCC13D26B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734855047; cv=none; b=jkR9ITbuBtZHxIsxZugI77bYBC1W3RqhDhRrvzLNeMnhhGjcXgK6VHtZEHSs124+fsfTjL+Wnqdj+emoYPAQqfMn2VQA0SiDwO0yKYlexciYf0ftUmDR3pmBpfQAt17xE7c6ACeEU7stEWJns2Uex4uBZDp+cxzY0/LwTkHf1ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734855047; c=relaxed/simple;
	bh=Hpak9Pdpmpg6ngUCki4A97lwV2of5etw2kuK3GjEQSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QlI9Yq5+QjzIfeU7dZFNV2S1VFGOo+xyLWWOSadvE0cEVMlHhbsiR5G3ppJO5aDAsDreq3XljHKuJd174RnhHih06iB2SpJRzLSdVStV+lelLfULwT0IK5tX7oSBcyyZL0hQU70zvOkmc4v7n+0K9mGS33s23DOwmQiQ7ETUx1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJU6fQrM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJU6fQrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734855043; x=1766391043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hpak9Pdpmpg6ngUCki4A97lwV2of5etw2kuK3GjEQSs=;
  b=lJU6fQrMY4v0gz2yeDX07lY5ZPaKoMIuEpqIy1ua3CaXBDFiB3qG1gSh
   99nwhxO5p9OuXcd4T6M7TsbesUDvEdOir+Dm1D45gaQEQ1aoFecRIMwW+
   KImzdCZcTpe2pHWLP/NWKc/IM55frpn+PTn9qzzByDfV4Tt+JGyxfuYem
   qx3kAQxG4AG4EPyk6caN05Q/Bq9YVRbLbVJEoefWO417WWodPyR3i0FO2
   BK6zUtZhNhHeQGRvBYU1q0HdcG42NfOCIf7Bub8G0Zh+hP+/mVrofvEZG
   40KP6uJ+gZH6ZbANMeTEvuEX9f8aMyBQrrhzd4GonDMtc84+nEVDB24x/
   g==;
X-CSE-ConnectionGUID: qDLjUrMBQUOSIUOmSIrhLw==
X-CSE-MsgGUID: WRd6k1MAToKdPn18N74gbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46355208"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="46355208"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 00:10:40 -0800
X-CSE-ConnectionGUID: QyUwoBTlT7uZPXpeBpPR5g==
X-CSE-MsgGUID: co3uyD0jQky5fmqFJ52/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98689893"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2024 00:10:38 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPH2q-0002nl-2m;
	Sun, 22 Dec 2024 08:10:36 +0000
Date: Sun, 22 Dec 2024 16:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 12/26] kernel/sys.c:2814:25: error: implicit
 declaration of function 'sframe_add_section'; did you mean
 'sframe_remove_section'?
Message-ID: <202412221638.DClqriXU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   3c5688da4922c1ff09b4973c69e7324950c7ef60
commit: e660bb57e4f94f01da72031da438d20fa25ee32c [12/26] sframe
config: i386-buildonly-randconfig-001-20241222 (https://download.01.org/0day-ci/archive/20241222/202412221638.DClqriXU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221638.DClqriXU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221638.DClqriXU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sys.c:67:
   include/linux/sframe.h:31:92: error: unknown type name 'unsinged'; did you mean 'unsigned'?
      31 | static inline int sframe_add_section(unsigned long sframe_start, unsigned long sframe_end, unsinged long text_start, unsigned long text_end) { return -EINVAL; }
         |                                                                                            ^~~~~~~~
         |                                                                                            unsigned
   kernel/sys.c: In function '__do_sys_prctl':
>> kernel/sys.c:2814:25: error: implicit declaration of function 'sframe_add_section'; did you mean 'sframe_remove_section'? [-Werror=implicit-function-declaration]
    2814 |                 error = sframe_add_section(arg2, arg3, arg4, arg5);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         sframe_remove_section
   cc1: some warnings being treated as errors
--
   In file included from fs/binfmt_elf.c:50:
   include/linux/sframe.h:31:92: error: unknown type name 'unsinged'; did you mean 'unsigned'?
      31 | static inline int sframe_add_section(unsigned long sframe_start, unsigned long sframe_end, unsinged long text_start, unsigned long text_end) { return -EINVAL; }
         |                                                                                            ^~~~~~~~
         |                                                                                            unsigned
   fs/binfmt_elf.c: In function 'elf_add_sframe':
>> fs/binfmt_elf.c:644:9: error: implicit declaration of function 'sframe_add_section'; did you mean 'sframe_remove_section'? [-Werror=implicit-function-declaration]
     644 |         sframe_add_section(sframe_start, sframe_end, text_start, text_end);
         |         ^~~~~~~~~~~~~~~~~~
         |         sframe_remove_section
   cc1: some warnings being treated as errors


vim +2814 kernel/sys.c

  2467	
  2468	SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
  2469			unsigned long, arg4, unsigned long, arg5)
  2470	{
  2471		struct task_struct *me = current;
  2472		unsigned char comm[sizeof(me->comm)];
  2473		long error;
  2474	
  2475		error = security_task_prctl(option, arg2, arg3, arg4, arg5);
  2476		if (error != -ENOSYS)
  2477			return error;
  2478	
  2479		error = 0;
  2480		switch (option) {
  2481		case PR_SET_PDEATHSIG:
  2482			if (!valid_signal(arg2)) {
  2483				error = -EINVAL;
  2484				break;
  2485			}
  2486			me->pdeath_signal = arg2;
  2487			break;
  2488		case PR_GET_PDEATHSIG:
  2489			error = put_user(me->pdeath_signal, (int __user *)arg2);
  2490			break;
  2491		case PR_GET_DUMPABLE:
  2492			error = get_dumpable(me->mm);
  2493			break;
  2494		case PR_SET_DUMPABLE:
  2495			if (arg2 != SUID_DUMP_DISABLE && arg2 != SUID_DUMP_USER) {
  2496				error = -EINVAL;
  2497				break;
  2498			}
  2499			set_dumpable(me->mm, arg2);
  2500			break;
  2501	
  2502		case PR_SET_UNALIGN:
  2503			error = SET_UNALIGN_CTL(me, arg2);
  2504			break;
  2505		case PR_GET_UNALIGN:
  2506			error = GET_UNALIGN_CTL(me, arg2);
  2507			break;
  2508		case PR_SET_FPEMU:
  2509			error = SET_FPEMU_CTL(me, arg2);
  2510			break;
  2511		case PR_GET_FPEMU:
  2512			error = GET_FPEMU_CTL(me, arg2);
  2513			break;
  2514		case PR_SET_FPEXC:
  2515			error = SET_FPEXC_CTL(me, arg2);
  2516			break;
  2517		case PR_GET_FPEXC:
  2518			error = GET_FPEXC_CTL(me, arg2);
  2519			break;
  2520		case PR_GET_TIMING:
  2521			error = PR_TIMING_STATISTICAL;
  2522			break;
  2523		case PR_SET_TIMING:
  2524			if (arg2 != PR_TIMING_STATISTICAL)
  2525				error = -EINVAL;
  2526			break;
  2527		case PR_SET_NAME:
  2528			comm[sizeof(me->comm) - 1] = 0;
  2529			if (strncpy_from_user(comm, (char __user *)arg2,
  2530					      sizeof(me->comm) - 1) < 0)
  2531				return -EFAULT;
  2532			set_task_comm(me, comm);
  2533			proc_comm_connector(me);
  2534			break;
  2535		case PR_GET_NAME:
  2536			get_task_comm(comm, me);
  2537			if (copy_to_user((char __user *)arg2, comm, sizeof(comm)))
  2538				return -EFAULT;
  2539			break;
  2540		case PR_GET_ENDIAN:
  2541			error = GET_ENDIAN(me, arg2);
  2542			break;
  2543		case PR_SET_ENDIAN:
  2544			error = SET_ENDIAN(me, arg2);
  2545			break;
  2546		case PR_GET_SECCOMP:
  2547			error = prctl_get_seccomp();
  2548			break;
  2549		case PR_SET_SECCOMP:
  2550			error = prctl_set_seccomp(arg2, (char __user *)arg3);
  2551			break;
  2552		case PR_GET_TSC:
  2553			error = GET_TSC_CTL(arg2);
  2554			break;
  2555		case PR_SET_TSC:
  2556			error = SET_TSC_CTL(arg2);
  2557			break;
  2558		case PR_TASK_PERF_EVENTS_DISABLE:
  2559			error = perf_event_task_disable();
  2560			break;
  2561		case PR_TASK_PERF_EVENTS_ENABLE:
  2562			error = perf_event_task_enable();
  2563			break;
  2564		case PR_GET_TIMERSLACK:
  2565			if (current->timer_slack_ns > ULONG_MAX)
  2566				error = ULONG_MAX;
  2567			else
  2568				error = current->timer_slack_ns;
  2569			break;
  2570		case PR_SET_TIMERSLACK:
  2571			if (rt_or_dl_task_policy(current))
  2572				break;
  2573			if (arg2 <= 0)
  2574				current->timer_slack_ns =
  2575						current->default_timer_slack_ns;
  2576			else
  2577				current->timer_slack_ns = arg2;
  2578			break;
  2579		case PR_MCE_KILL:
  2580			if (arg4 | arg5)
  2581				return -EINVAL;
  2582			switch (arg2) {
  2583			case PR_MCE_KILL_CLEAR:
  2584				if (arg3 != 0)
  2585					return -EINVAL;
  2586				current->flags &= ~PF_MCE_PROCESS;
  2587				break;
  2588			case PR_MCE_KILL_SET:
  2589				current->flags |= PF_MCE_PROCESS;
  2590				if (arg3 == PR_MCE_KILL_EARLY)
  2591					current->flags |= PF_MCE_EARLY;
  2592				else if (arg3 == PR_MCE_KILL_LATE)
  2593					current->flags &= ~PF_MCE_EARLY;
  2594				else if (arg3 == PR_MCE_KILL_DEFAULT)
  2595					current->flags &=
  2596							~(PF_MCE_EARLY|PF_MCE_PROCESS);
  2597				else
  2598					return -EINVAL;
  2599				break;
  2600			default:
  2601				return -EINVAL;
  2602			}
  2603			break;
  2604		case PR_MCE_KILL_GET:
  2605			if (arg2 | arg3 | arg4 | arg5)
  2606				return -EINVAL;
  2607			if (current->flags & PF_MCE_PROCESS)
  2608				error = (current->flags & PF_MCE_EARLY) ?
  2609					PR_MCE_KILL_EARLY : PR_MCE_KILL_LATE;
  2610			else
  2611				error = PR_MCE_KILL_DEFAULT;
  2612			break;
  2613		case PR_SET_MM:
  2614			error = prctl_set_mm(arg2, arg3, arg4, arg5);
  2615			break;
  2616		case PR_GET_TID_ADDRESS:
  2617			error = prctl_get_tid_address(me, (int __user * __user *)arg2);
  2618			break;
  2619		case PR_SET_CHILD_SUBREAPER:
  2620			me->signal->is_child_subreaper = !!arg2;
  2621			if (!arg2)
  2622				break;
  2623	
  2624			walk_process_tree(me, propagate_has_child_subreaper, NULL);
  2625			break;
  2626		case PR_GET_CHILD_SUBREAPER:
  2627			error = put_user(me->signal->is_child_subreaper,
  2628					 (int __user *)arg2);
  2629			break;
  2630		case PR_SET_NO_NEW_PRIVS:
  2631			if (arg2 != 1 || arg3 || arg4 || arg5)
  2632				return -EINVAL;
  2633	
  2634			task_set_no_new_privs(current);
  2635			break;
  2636		case PR_GET_NO_NEW_PRIVS:
  2637			if (arg2 || arg3 || arg4 || arg5)
  2638				return -EINVAL;
  2639			return task_no_new_privs(current) ? 1 : 0;
  2640		case PR_GET_THP_DISABLE:
  2641			if (arg2 || arg3 || arg4 || arg5)
  2642				return -EINVAL;
  2643			error = !!test_bit(MMF_DISABLE_THP, &me->mm->flags);
  2644			break;
  2645		case PR_SET_THP_DISABLE:
  2646			if (arg3 || arg4 || arg5)
  2647				return -EINVAL;
  2648			if (mmap_write_lock_killable(me->mm))
  2649				return -EINTR;
  2650			if (arg2)
  2651				set_bit(MMF_DISABLE_THP, &me->mm->flags);
  2652			else
  2653				clear_bit(MMF_DISABLE_THP, &me->mm->flags);
  2654			mmap_write_unlock(me->mm);
  2655			break;
  2656		case PR_MPX_ENABLE_MANAGEMENT:
  2657		case PR_MPX_DISABLE_MANAGEMENT:
  2658			/* No longer implemented: */
  2659			return -EINVAL;
  2660		case PR_SET_FP_MODE:
  2661			error = SET_FP_MODE(me, arg2);
  2662			break;
  2663		case PR_GET_FP_MODE:
  2664			error = GET_FP_MODE(me);
  2665			break;
  2666		case PR_SVE_SET_VL:
  2667			error = SVE_SET_VL(arg2);
  2668			break;
  2669		case PR_SVE_GET_VL:
  2670			error = SVE_GET_VL();
  2671			break;
  2672		case PR_SME_SET_VL:
  2673			error = SME_SET_VL(arg2);
  2674			break;
  2675		case PR_SME_GET_VL:
  2676			error = SME_GET_VL();
  2677			break;
  2678		case PR_GET_SPECULATION_CTRL:
  2679			if (arg3 || arg4 || arg5)
  2680				return -EINVAL;
  2681			error = arch_prctl_spec_ctrl_get(me, arg2);
  2682			break;
  2683		case PR_SET_SPECULATION_CTRL:
  2684			if (arg4 || arg5)
  2685				return -EINVAL;
  2686			error = arch_prctl_spec_ctrl_set(me, arg2, arg3);
  2687			break;
  2688		case PR_PAC_RESET_KEYS:
  2689			if (arg3 || arg4 || arg5)
  2690				return -EINVAL;
  2691			error = PAC_RESET_KEYS(me, arg2);
  2692			break;
  2693		case PR_PAC_SET_ENABLED_KEYS:
  2694			if (arg4 || arg5)
  2695				return -EINVAL;
  2696			error = PAC_SET_ENABLED_KEYS(me, arg2, arg3);
  2697			break;
  2698		case PR_PAC_GET_ENABLED_KEYS:
  2699			if (arg2 || arg3 || arg4 || arg5)
  2700				return -EINVAL;
  2701			error = PAC_GET_ENABLED_KEYS(me);
  2702			break;
  2703		case PR_SET_TAGGED_ADDR_CTRL:
  2704			if (arg3 || arg4 || arg5)
  2705				return -EINVAL;
  2706			error = SET_TAGGED_ADDR_CTRL(arg2);
  2707			break;
  2708		case PR_GET_TAGGED_ADDR_CTRL:
  2709			if (arg2 || arg3 || arg4 || arg5)
  2710				return -EINVAL;
  2711			error = GET_TAGGED_ADDR_CTRL();
  2712			break;
  2713		case PR_SET_IO_FLUSHER:
  2714			if (!capable(CAP_SYS_RESOURCE))
  2715				return -EPERM;
  2716	
  2717			if (arg3 || arg4 || arg5)
  2718				return -EINVAL;
  2719	
  2720			if (arg2 == 1)
  2721				current->flags |= PR_IO_FLUSHER;
  2722			else if (!arg2)
  2723				current->flags &= ~PR_IO_FLUSHER;
  2724			else
  2725				return -EINVAL;
  2726			break;
  2727		case PR_GET_IO_FLUSHER:
  2728			if (!capable(CAP_SYS_RESOURCE))
  2729				return -EPERM;
  2730	
  2731			if (arg2 || arg3 || arg4 || arg5)
  2732				return -EINVAL;
  2733	
  2734			error = (current->flags & PR_IO_FLUSHER) == PR_IO_FLUSHER;
  2735			break;
  2736		case PR_SET_SYSCALL_USER_DISPATCH:
  2737			error = set_syscall_user_dispatch(arg2, arg3, arg4,
  2738							  (char __user *) arg5);
  2739			break;
  2740	#ifdef CONFIG_SCHED_CORE
  2741		case PR_SCHED_CORE:
  2742			error = sched_core_share_pid(arg2, arg3, arg4, arg5);
  2743			break;
  2744	#endif
  2745		case PR_SET_MDWE:
  2746			error = prctl_set_mdwe(arg2, arg3, arg4, arg5);
  2747			break;
  2748		case PR_GET_MDWE:
  2749			error = prctl_get_mdwe(arg2, arg3, arg4, arg5);
  2750			break;
  2751		case PR_PPC_GET_DEXCR:
  2752			if (arg3 || arg4 || arg5)
  2753				return -EINVAL;
  2754			error = PPC_GET_DEXCR_ASPECT(me, arg2);
  2755			break;
  2756		case PR_PPC_SET_DEXCR:
  2757			if (arg4 || arg5)
  2758				return -EINVAL;
  2759			error = PPC_SET_DEXCR_ASPECT(me, arg2, arg3);
  2760			break;
  2761		case PR_SET_VMA:
  2762			error = prctl_set_vma(arg2, arg3, arg4, arg5);
  2763			break;
  2764		case PR_GET_AUXV:
  2765			if (arg4 || arg5)
  2766				return -EINVAL;
  2767			error = prctl_get_auxv((void __user *)arg2, arg3);
  2768			break;
  2769	#ifdef CONFIG_KSM
  2770		case PR_SET_MEMORY_MERGE:
  2771			if (arg3 || arg4 || arg5)
  2772				return -EINVAL;
  2773			if (mmap_write_lock_killable(me->mm))
  2774				return -EINTR;
  2775	
  2776			if (arg2)
  2777				error = ksm_enable_merge_any(me->mm);
  2778			else
  2779				error = ksm_disable_merge_any(me->mm);
  2780			mmap_write_unlock(me->mm);
  2781			break;
  2782		case PR_GET_MEMORY_MERGE:
  2783			if (arg2 || arg3 || arg4 || arg5)
  2784				return -EINVAL;
  2785	
  2786			error = !!test_bit(MMF_VM_MERGE_ANY, &me->mm->flags);
  2787			break;
  2788	#endif
  2789		case PR_RISCV_V_SET_CONTROL:
  2790			error = RISCV_V_SET_CONTROL(arg2);
  2791			break;
  2792		case PR_RISCV_V_GET_CONTROL:
  2793			error = RISCV_V_GET_CONTROL();
  2794			break;
  2795		case PR_RISCV_SET_ICACHE_FLUSH_CTX:
  2796			error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
  2797			break;
  2798		case PR_GET_SHADOW_STACK_STATUS:
  2799			if (arg3 || arg4 || arg5)
  2800				return -EINVAL;
  2801			error = arch_get_shadow_stack_status(me, (unsigned long __user *) arg2);
  2802			break;
  2803		case PR_SET_SHADOW_STACK_STATUS:
  2804			if (arg3 || arg4 || arg5)
  2805				return -EINVAL;
  2806			error = arch_set_shadow_stack_status(me, arg2);
  2807			break;
  2808		case PR_LOCK_SHADOW_STACK_STATUS:
  2809			if (arg3 || arg4 || arg5)
  2810				return -EINVAL;
  2811			error = arch_lock_shadow_stack_status(me, arg2);
  2812			break;
  2813		case PR_ADD_SFRAME:
> 2814			error = sframe_add_section(arg2, arg3, arg4, arg5);
  2815			break;
  2816		case PR_REMOVE_SFRAME:
  2817			if (arg3 || arg4 || arg5)
  2818				return -EINVAL;
  2819			error = sframe_remove_section(arg2);
  2820			break;
  2821		default:
  2822			error = -EINVAL;
  2823			break;
  2824		}
  2825		return error;
  2826	}
  2827	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
