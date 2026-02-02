Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BB035D5FC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029810; cv=none; b=K18jEc5TM3jUxMhoFQGF/Wg2BqYCFajlEFlZ+7jDkY67PF4OiwsDJ7OsFif+Ded9yavj6OzKWQfFg9DYL+9PjhvEN6CSSHGUA0JhlkHPcZ4iehMAx72Cl7B36OXiKH2xMZjnaR3GFfyjm6IZSjZXJ9fX16Osx7dDbpcayo7iwPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029810; c=relaxed/simple;
	bh=pdE1HUYf3tk6jWewR07IlWSQVstRbu18Msyfhx8sW+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bTfHe5kkaoxs64GQyuQJyTmWcuJv44wboF+F1jDYnAorNLvk6ubdiqIrrmgGpFoVXeFDEvC3lpKnfWF4a4O4R66YUswg9CA655eEp8MJ68cttFZ5aCcx7Lyjitrg7lRjAorVubnOsCJKilWj7OoixYTAY5LdkrUTcw7AyLVOa7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQfEv6Y8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQfEv6Y8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770029807; x=1801565807;
  h=date:from:to:cc:subject:message-id;
  bh=pdE1HUYf3tk6jWewR07IlWSQVstRbu18Msyfhx8sW+4=;
  b=GQfEv6Y8M89huz64ut4LR9rGJmdj6CystWh/auwL94Z9gMH+I1U5HGI/
   gydc/dXJ0oTGZpwMBgQLGqtetUw5oZWxKoE3cHzyA3blfok+P/wqphqdb
   zHPzEyxTdao/wt10Ppy3h8V2gTX7sw6OHMN1chQi9W/VBl+fybFd/MySc
   seAMQ69Klbx3fR4DYgY70SVwX8NRWkAKtJBA8ez7OGa6nwe14Dh9sW7Bf
   dFvRSCIN9FCCLMyRUc1aEut+l4SKFW8HrEw23Ni1aFJxCo1sHy5b1RuGS
   Lu0LKTbQXNMiskMT2EGLPSpdE1OaK1Ydr2nH00stlrgjt1sQBQr0ENfFH
   w==;
X-CSE-ConnectionGUID: c9ZygP07RJG/mWyZMZERgw==
X-CSE-MsgGUID: 32k8Er5pQAO8/1BRQiIWDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="73783660"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="73783660"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 02:56:47 -0800
X-CSE-ConnectionGUID: h7UI81fDTlix680lJsOoXg==
X-CSE-MsgGUID: 8guu8PYBRYCy6zjrmDZ7Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="213959592"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Feb 2026 02:56:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmrbn-00000000fUO-3TTG;
	Mon, 02 Feb 2026 10:56:43 +0000
Date: Mon, 02 Feb 2026 18:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [linuxppc:next 7/26] include/linux/rseq_entry.h:141:3:
 error: invalid operand for instruction
Message-ID: <202602021825.otcItxGi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linuxppc/linux next
head:   1d72a02d65a733ad124bacc2db3fb90fa81a612b
commit: 861574d51bbd7a06dbf07f658a9a8def012c2f74 [7/26] powerpc/uaccess: Implement masked user access
config: powerpc-randconfig-r051-20260202 (https://download.01.org/0day-ci/archive/20260202/202602021825.otcItxGi-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602021825.otcItxGi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021825.otcItxGi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rseq.c:75:
>> include/linux/rseq_entry.h:141:3: error: invalid operand for instruction
                   unsafe_get_user(offset, &ucs->post_commit_offset, efault);
                   ^
   include/linux/uaccess.h:608:2: note: expanded from macro 'unsafe_get_user'
           arch_unsafe_get_user(x, ptr, local_label);      \
           ^
   arch/powerpc/include/asm/uaccess.h:518:2: note: expanded from macro 'arch_unsafe_get_user'
           __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
           ^
   arch/powerpc/include/asm/uaccess.h:284:2: note: expanded from macro '__get_user_size_goto'
           __get_user_size_allowed(x, ptr, size, __gus_retval);    \
           ^
   arch/powerpc/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_size_allowed'
           case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
                   ^
   arch/powerpc/include/asm/uaccess.h:258:4: note: expanded from macro '__get_user_asm2'
                   "       li %1+1,0\n"                    \
                    ^
   <inline asm>:7:5: note: instantiated into assembly here
           li 31+1,0
              ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +141 include/linux/rseq_entry.h

2fc0e4b4126caa Thomas Gleixner 2025-10-27   86  
abc850e7616c91 Thomas Gleixner 2025-10-27   87  /*
abc850e7616c91 Thomas Gleixner 2025-10-27   88   * Check whether there is a valid critical section and whether the
abc850e7616c91 Thomas Gleixner 2025-10-27   89   * instruction pointer in @regs is inside the critical section.
abc850e7616c91 Thomas Gleixner 2025-10-27   90   *
abc850e7616c91 Thomas Gleixner 2025-10-27   91   *  - If the critical section is invalid, terminate the task.
abc850e7616c91 Thomas Gleixner 2025-10-27   92   *
abc850e7616c91 Thomas Gleixner 2025-10-27   93   *  - If valid and the instruction pointer is inside, set it to the abort IP.
abc850e7616c91 Thomas Gleixner 2025-10-27   94   *
abc850e7616c91 Thomas Gleixner 2025-10-27   95   *  - If valid and the instruction pointer is outside, clear the critical
abc850e7616c91 Thomas Gleixner 2025-10-27   96   *    section address.
abc850e7616c91 Thomas Gleixner 2025-10-27   97   *
abc850e7616c91 Thomas Gleixner 2025-10-27   98   * Returns true, if the section was valid and either fixup or clear was
abc850e7616c91 Thomas Gleixner 2025-10-27   99   * done, false otherwise.
abc850e7616c91 Thomas Gleixner 2025-10-27  100   *
abc850e7616c91 Thomas Gleixner 2025-10-27  101   * In the failure case task::rseq_event::fatal is set when a invalid
abc850e7616c91 Thomas Gleixner 2025-10-27  102   * section was found. It's clear when the failure was an unresolved page
abc850e7616c91 Thomas Gleixner 2025-10-27  103   * fault.
abc850e7616c91 Thomas Gleixner 2025-10-27  104   *
abc850e7616c91 Thomas Gleixner 2025-10-27  105   * If inlined into the exit to user path with interrupts disabled, the
abc850e7616c91 Thomas Gleixner 2025-10-27  106   * caller has to protect against page faults with pagefault_disable().
abc850e7616c91 Thomas Gleixner 2025-10-27  107   *
abc850e7616c91 Thomas Gleixner 2025-10-27  108   * In preemptible task context this would be counterproductive as the page
abc850e7616c91 Thomas Gleixner 2025-10-27  109   * faults could not be fully resolved. As a consequence unresolved page
abc850e7616c91 Thomas Gleixner 2025-10-27  110   * faults in task context are fatal too.
abc850e7616c91 Thomas Gleixner 2025-10-27  111   */
abc850e7616c91 Thomas Gleixner 2025-10-27  112  
abc850e7616c91 Thomas Gleixner 2025-10-27  113  #ifdef RSEQ_BUILD_SLOW_PATH
abc850e7616c91 Thomas Gleixner 2025-10-27  114  /*
abc850e7616c91 Thomas Gleixner 2025-10-27  115   * The debug version is put out of line, but kept here so the code stays
abc850e7616c91 Thomas Gleixner 2025-10-27  116   * together.
abc850e7616c91 Thomas Gleixner 2025-10-27  117   *
abc850e7616c91 Thomas Gleixner 2025-10-27  118   * @csaddr has already been checked by the caller to be in user space
abc850e7616c91 Thomas Gleixner 2025-10-27  119   */
abc850e7616c91 Thomas Gleixner 2025-10-27  120  bool rseq_debug_update_user_cs(struct task_struct *t, struct pt_regs *regs,
abc850e7616c91 Thomas Gleixner 2025-10-27  121  			       unsigned long csaddr)
abc850e7616c91 Thomas Gleixner 2025-10-27  122  {
abc850e7616c91 Thomas Gleixner 2025-10-27  123  	struct rseq_cs __user *ucs = (struct rseq_cs __user *)(unsigned long)csaddr;
abc850e7616c91 Thomas Gleixner 2025-10-27  124  	u64 start_ip, abort_ip, offset, cs_end, head, tasksize = TASK_SIZE;
abc850e7616c91 Thomas Gleixner 2025-10-27  125  	unsigned long ip = instruction_pointer(regs);
abc850e7616c91 Thomas Gleixner 2025-10-27  126  	u64 __user *uc_head = (u64 __user *) ucs;
abc850e7616c91 Thomas Gleixner 2025-10-27  127  	u32 usig, __user *uc_sig;
abc850e7616c91 Thomas Gleixner 2025-10-27  128  
abc850e7616c91 Thomas Gleixner 2025-10-27  129  	scoped_user_rw_access(ucs, efault) {
abc850e7616c91 Thomas Gleixner 2025-10-27  130  		/*
abc850e7616c91 Thomas Gleixner 2025-10-27  131  		 * Evaluate the user pile and exit if one of the conditions
abc850e7616c91 Thomas Gleixner 2025-10-27  132  		 * is not fulfilled.
abc850e7616c91 Thomas Gleixner 2025-10-27  133  		 */
abc850e7616c91 Thomas Gleixner 2025-10-27  134  		unsafe_get_user(start_ip, &ucs->start_ip, efault);
abc850e7616c91 Thomas Gleixner 2025-10-27  135  		if (unlikely(start_ip >= tasksize))
abc850e7616c91 Thomas Gleixner 2025-10-27  136  			goto die;
abc850e7616c91 Thomas Gleixner 2025-10-27  137  		/* If outside, just clear the critical section. */
abc850e7616c91 Thomas Gleixner 2025-10-27  138  		if (ip < start_ip)
abc850e7616c91 Thomas Gleixner 2025-10-27  139  			goto clear;
abc850e7616c91 Thomas Gleixner 2025-10-27  140  
abc850e7616c91 Thomas Gleixner 2025-10-27 @141  		unsafe_get_user(offset, &ucs->post_commit_offset, efault);
abc850e7616c91 Thomas Gleixner 2025-10-27  142  		cs_end = start_ip + offset;
abc850e7616c91 Thomas Gleixner 2025-10-27  143  		/* Check for overflow and wraparound */
abc850e7616c91 Thomas Gleixner 2025-10-27  144  		if (unlikely(cs_end >= tasksize || cs_end < start_ip))
abc850e7616c91 Thomas Gleixner 2025-10-27  145  			goto die;
abc850e7616c91 Thomas Gleixner 2025-10-27  146  
abc850e7616c91 Thomas Gleixner 2025-10-27  147  		/* If not inside, clear it. */
abc850e7616c91 Thomas Gleixner 2025-10-27  148  		if (ip >= cs_end)
abc850e7616c91 Thomas Gleixner 2025-10-27  149  			goto clear;
abc850e7616c91 Thomas Gleixner 2025-10-27  150  
abc850e7616c91 Thomas Gleixner 2025-10-27  151  		unsafe_get_user(abort_ip, &ucs->abort_ip, efault);
abc850e7616c91 Thomas Gleixner 2025-10-27  152  		/* Ensure it's "valid" */
abc850e7616c91 Thomas Gleixner 2025-10-27  153  		if (unlikely(abort_ip >= tasksize || abort_ip < sizeof(*uc_sig)))
abc850e7616c91 Thomas Gleixner 2025-10-27  154  			goto die;
abc850e7616c91 Thomas Gleixner 2025-10-27  155  		/* Validate that the abort IP is not in the critical section */
abc850e7616c91 Thomas Gleixner 2025-10-27  156  		if (unlikely(abort_ip - start_ip < offset))
abc850e7616c91 Thomas Gleixner 2025-10-27  157  			goto die;
abc850e7616c91 Thomas Gleixner 2025-10-27  158  
abc850e7616c91 Thomas Gleixner 2025-10-27  159  		/*
abc850e7616c91 Thomas Gleixner 2025-10-27  160  		 * Check version and flags for 0. No point in emitting
abc850e7616c91 Thomas Gleixner 2025-10-27  161  		 * deprecated warnings before dying. That could be done in
abc850e7616c91 Thomas Gleixner 2025-10-27  162  		 * the slow path eventually, but *shrug*.
abc850e7616c91 Thomas Gleixner 2025-10-27  163  		 */
abc850e7616c91 Thomas Gleixner 2025-10-27  164  		unsafe_get_user(head, uc_head, efault);
abc850e7616c91 Thomas Gleixner 2025-10-27  165  		if (unlikely(head))
abc850e7616c91 Thomas Gleixner 2025-10-27  166  			goto die;
abc850e7616c91 Thomas Gleixner 2025-10-27  167  
abc850e7616c91 Thomas Gleixner 2025-10-27  168  		/* abort_ip - 4 is >= 0. See abort_ip check above */
abc850e7616c91 Thomas Gleixner 2025-10-27  169  		uc_sig = (u32 __user *)(unsigned long)(abort_ip - sizeof(*uc_sig));
abc850e7616c91 Thomas Gleixner 2025-10-27  170  		unsafe_get_user(usig, uc_sig, efault);
abc850e7616c91 Thomas Gleixner 2025-10-27  171  		if (unlikely(usig != t->rseq.sig))
abc850e7616c91 Thomas Gleixner 2025-10-27  172  			goto die;
abc850e7616c91 Thomas Gleixner 2025-10-27  173  
abc850e7616c91 Thomas Gleixner 2025-10-27  174  		/* rseq_event.user_irq is only valid if CONFIG_GENERIC_IRQ_ENTRY=y */
abc850e7616c91 Thomas Gleixner 2025-10-27  175  		if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
abc850e7616c91 Thomas Gleixner 2025-10-27  176  			/* If not in interrupt from user context, let it die */
abc850e7616c91 Thomas Gleixner 2025-10-27  177  			if (unlikely(!t->rseq.event.user_irq))
abc850e7616c91 Thomas Gleixner 2025-10-27  178  				goto die;
abc850e7616c91 Thomas Gleixner 2025-10-27  179  		}
abc850e7616c91 Thomas Gleixner 2025-10-27  180  		unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
abc850e7616c91 Thomas Gleixner 2025-10-27  181  		instruction_pointer_set(regs, (unsigned long)abort_ip);
abc850e7616c91 Thomas Gleixner 2025-10-27  182  		rseq_stat_inc(rseq_stats.fixup);
abc850e7616c91 Thomas Gleixner 2025-10-27  183  		break;
abc850e7616c91 Thomas Gleixner 2025-10-27  184  	clear:
abc850e7616c91 Thomas Gleixner 2025-10-27  185  		unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
abc850e7616c91 Thomas Gleixner 2025-10-27  186  		rseq_stat_inc(rseq_stats.clear);
abc850e7616c91 Thomas Gleixner 2025-10-27  187  		abort_ip = 0ULL;
abc850e7616c91 Thomas Gleixner 2025-10-27  188  	}
abc850e7616c91 Thomas Gleixner 2025-10-27  189  
abc850e7616c91 Thomas Gleixner 2025-10-27  190  	if (unlikely(abort_ip))
abc850e7616c91 Thomas Gleixner 2025-10-27  191  		rseq_trace_ip_fixup(ip, start_ip, offset, abort_ip);
abc850e7616c91 Thomas Gleixner 2025-10-27  192  	return true;
abc850e7616c91 Thomas Gleixner 2025-10-27  193  die:
abc850e7616c91 Thomas Gleixner 2025-10-27  194  	t->rseq.event.fatal = true;
abc850e7616c91 Thomas Gleixner 2025-10-27  195  efault:
abc850e7616c91 Thomas Gleixner 2025-10-27  196  	return false;
abc850e7616c91 Thomas Gleixner 2025-10-27  197  }
abc850e7616c91 Thomas Gleixner 2025-10-27  198  

:::::: The code at line 141 was first introduced by commit
:::::: abc850e7616c91ebaa3f5ba3617ab0a104d45039 rseq: Provide and use rseq_update_user_cs()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
