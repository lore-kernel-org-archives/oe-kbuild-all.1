Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A60232366
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739876373; cv=none; b=SIOwmKvM5pduB6MpM4h1CFcavfvDLYxlSWWU++8OPgxvt7WgHjDchUDv+1H22IUCbRfohPOhf1GpL0jatSGfUlIo4ayrm8aEFQ2tlaKUY0VU1RkWLcAHPvETwCih1SHs1l3KvtAo8vumMfbD8Ru2zUCxyKCY/U04hNZDz/j1LdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739876373; c=relaxed/simple;
	bh=hTbifrAaEb0wjOgFkQH4tG8xTaNZEFP56cgpP3ojZb8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DSQEor0xEzUC1cvULopBd5jOywludfP+ePVUlJri/k3GitnVYz184nOQBRtmf6G0U486iZz7qlVE8uC1qoKTOurhGeG+WoHsC4BNwfAenRqamAR2VdJyp8Is8YvodZQP+hTwHqnSaPiZpmPcjrt8DwQ9hNCsiixP0FXQkwNci+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdW398LY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdW398LY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739876372; x=1771412372;
  h=date:from:cc:subject:message-id:mime-version;
  bh=hTbifrAaEb0wjOgFkQH4tG8xTaNZEFP56cgpP3ojZb8=;
  b=fdW398LYkRuYsnZQF3ZEvWXIIUMdrvVDaCeqGWFkzKaQgztpz3k246uQ
   ywCrXDaYR6/N7ypTjH15iTf92LbJN75Wpx9g3Mjnz4qUZu7nMVMaZAjbj
   oglDHmWzaY/Ag1wsfIkYEgBWJAAGqMQoNlwkolZUWfkVPvEuWJF7sAlph
   L0MeVbIjXEXXFjRB2hWw00PiHJIQ0y+VnrOLnhE296+uCTQc/fCNUphmj
   v3azG3EzqF77xdAKwOi6VF2LpmyzXEdjAjW9sT2NPSyBxOhXpdaRSbSmS
   MB2y3SJbVtz3NVPuSMR7YF7nMhR8uEeYvkQvBafS53InM12sgu3FCZomm
   w==;
X-CSE-ConnectionGUID: Hy4grbNYQ66vEoacSCXqlQ==
X-CSE-MsgGUID: 10ZCQDhXQLq4D7CTcszQ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65921603"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="65921603"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 02:59:31 -0800
X-CSE-ConnectionGUID: kidlawJCSAqSLqN795g6QA==
X-CSE-MsgGUID: OvJyeq7CQjekc+Fgmll43Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119575739"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Feb 2025 02:59:30 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkLIs-0000R1-0f
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Feb 2025 10:58:34 +0000
Date: Tue, 18 Feb 2025 18:55:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] kernel/fork.c:1806: Error: unrecognized opcode
 `csrs sstatus,a2', extension `zicsr' required
Message-ID: <202502181809.bevKxMfQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: b3e5838252665ee4cfa76b82bdf1198dca81e5be [1/1] clone: add CLONE_PIDFD
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20250218/202502181809.bevKxMfQ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181809.bevKxMfQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181809.bevKxMfQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/fork.c:150:13: warning: no previous prototype for 'arch_release_task_struct' [-Wmissing-prototypes]
     150 | void __weak arch_release_task_struct(struct task_struct *tsk)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:736:20: warning: no previous prototype for 'arch_task_cache_init' [-Wmissing-prototypes]
     736 | void __init __weak arch_task_cache_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:822:12: warning: no previous prototype for 'arch_dup_task_struct' [-Wmissing-prototypes]
     822 | int __weak arch_dup_task_struct(struct task_struct *dst,
         |            ^~~~~~~~~~~~~~~~~~~~
   kernel/fork.c: Assembler messages:
>> kernel/fork.c:1806: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
>> kernel/fork.c:1806: Error: unrecognized opcode `csrc sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   kernel/fork.c:2030: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   kernel/fork.c:2030: Error: unrecognized opcode `csrc sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   kernel/fork.c:1288: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   kernel/fork.c:1288: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   kernel/fork.c:2342: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   kernel/fork.c:2342: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required


vim +1806 kernel/fork.c

  1718	
  1719	/*
  1720	 * This creates a new process as a copy of the old one,
  1721	 * but does not actually start it yet.
  1722	 *
  1723	 * It copies the registers, and all the appropriate
  1724	 * parts of the process environment (as per the clone
  1725	 * flags). The actual kick-off is left to the caller.
  1726	 */
  1727	static __latent_entropy struct task_struct *copy_process(
  1728						unsigned long clone_flags,
  1729						unsigned long stack_start,
  1730						unsigned long stack_size,
  1731						int __user *parent_tidptr,
  1732						int __user *child_tidptr,
  1733						struct pid *pid,
  1734						int trace,
  1735						unsigned long tls,
  1736						int node)
  1737	{
  1738		int pidfd = -1, retval;
  1739		struct task_struct *p;
  1740		struct multiprocess_signals delayed;
  1741	
  1742		/*
  1743		 * Don't allow sharing the root directory with processes in a different
  1744		 * namespace
  1745		 */
  1746		if ((clone_flags & (CLONE_NEWNS|CLONE_FS)) == (CLONE_NEWNS|CLONE_FS))
  1747			return ERR_PTR(-EINVAL);
  1748	
  1749		if ((clone_flags & (CLONE_NEWUSER|CLONE_FS)) == (CLONE_NEWUSER|CLONE_FS))
  1750			return ERR_PTR(-EINVAL);
  1751	
  1752		/*
  1753		 * Thread groups must share signals as well, and detached threads
  1754		 * can only be started up within the thread group.
  1755		 */
  1756		if ((clone_flags & CLONE_THREAD) && !(clone_flags & CLONE_SIGHAND))
  1757			return ERR_PTR(-EINVAL);
  1758	
  1759		/*
  1760		 * Shared signal handlers imply shared VM. By way of the above,
  1761		 * thread groups also imply shared VM. Blocking this case allows
  1762		 * for various simplifications in other code.
  1763		 */
  1764		if ((clone_flags & CLONE_SIGHAND) && !(clone_flags & CLONE_VM))
  1765			return ERR_PTR(-EINVAL);
  1766	
  1767		/*
  1768		 * Siblings of global init remain as zombies on exit since they are
  1769		 * not reaped by their parent (swapper). To solve this and to avoid
  1770		 * multi-rooted process trees, prevent global and container-inits
  1771		 * from creating siblings.
  1772		 */
  1773		if ((clone_flags & CLONE_PARENT) &&
  1774					current->signal->flags & SIGNAL_UNKILLABLE)
  1775			return ERR_PTR(-EINVAL);
  1776	
  1777		/*
  1778		 * If the new process will be in a different pid or user namespace
  1779		 * do not allow it to share a thread group with the forking task.
  1780		 */
  1781		if (clone_flags & CLONE_THREAD) {
  1782			if ((clone_flags & (CLONE_NEWUSER | CLONE_NEWPID)) ||
  1783			    (task_active_pid_ns(current) !=
  1784					current->nsproxy->pid_ns_for_children))
  1785				return ERR_PTR(-EINVAL);
  1786		}
  1787	
  1788		if (clone_flags & CLONE_PIDFD) {
  1789			int reserved;
  1790	
  1791			/*
  1792			 * - CLONE_PARENT_SETTID is useless for pidfds and also
  1793			 *   parent_tidptr is used to return pidfds.
  1794			 * - CLONE_DETACHED is blocked so that we can potentially
  1795			 *   reuse it later for CLONE_PIDFD.
  1796			 * - CLONE_THREAD is blocked until someone really needs it.
  1797			 */
  1798			if (clone_flags &
  1799			    (CLONE_DETACHED | CLONE_PARENT_SETTID | CLONE_THREAD))
  1800				return ERR_PTR(-EINVAL);
  1801	
  1802			/*
  1803			 * Verify that parent_tidptr is sane so we can potentially
  1804			 * reuse it later.
  1805			 */
> 1806			if (get_user(reserved, parent_tidptr))
  1807				return ERR_PTR(-EFAULT);
  1808	
  1809			if (reserved != 0)
  1810				return ERR_PTR(-EINVAL);
  1811		}
  1812	
  1813		/*
  1814		 * Force any signals received before this point to be delivered
  1815		 * before the fork happens.  Collect up signals sent to multiple
  1816		 * processes that happen during the fork and delay them so that
  1817		 * they appear to happen after the fork.
  1818		 */
  1819		sigemptyset(&delayed.signal);
  1820		INIT_HLIST_NODE(&delayed.node);
  1821	
  1822		spin_lock_irq(&current->sighand->siglock);
  1823		if (!(clone_flags & CLONE_THREAD))
  1824			hlist_add_head(&delayed.node, &current->signal->multiprocess);
  1825		recalc_sigpending();
  1826		spin_unlock_irq(&current->sighand->siglock);
  1827		retval = -ERESTARTNOINTR;
  1828		if (signal_pending(current))
  1829			goto fork_out;
  1830	
  1831		retval = -ENOMEM;
  1832		p = dup_task_struct(current, node);
  1833		if (!p)
  1834			goto fork_out;
  1835	
  1836		/*
  1837		 * This _must_ happen before we call free_task(), i.e. before we jump
  1838		 * to any of the bad_fork_* labels. This is to avoid freeing
  1839		 * p->set_child_tid which is (ab)used as a kthread's data pointer for
  1840		 * kernel threads (PF_KTHREAD).
  1841		 */
  1842		p->set_child_tid = (clone_flags & CLONE_CHILD_SETTID) ? child_tidptr : NULL;
  1843		/*
  1844		 * Clear TID on mm_release()?
  1845		 */
  1846		p->clear_child_tid = (clone_flags & CLONE_CHILD_CLEARTID) ? child_tidptr : NULL;
  1847	
  1848		ftrace_graph_init_task(p);
  1849	
  1850		rt_mutex_init_task(p);
  1851	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
