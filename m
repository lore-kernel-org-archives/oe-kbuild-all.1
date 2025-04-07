Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A4F22A4F4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016350; cv=none; b=pnc2F839ZtXxypjQbjYI2KcxyhXJE3awgUDhiuPogbdxrpqAxDo0CWdEuAFU4paR2XFuQf511WaTpK0I/Bi40mXpkEx0ObZk8hWOBsLyCjaMZa5Z/2+2tpyAtXEL4dHVurQh5EzzPmdJSsv0OTs3+vPT6kJmHpg/g/bkRYj7QNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016350; c=relaxed/simple;
	bh=s7qBlH0Xjdnp2vkCS+WyRFYzMKPjVIqIxE8KgR3iSVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kmDdVIIbOAeC/tk5RXQGPE8S8LbVw6xqyWaC8CI5ClE/PS8DFzhs1FF0CD4UwBdV8b4rwKo6QejMSFDzms87jGzY+8Elg7uM5TNcwxAZ/U/9T3j87tc7vMnbJKASUP8FVnyyTX1R2HKF3w5JZx2zDHceUo4KmG6HQiZLJ4P4Xdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTMvwDhF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTMvwDhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744016348; x=1775552348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s7qBlH0Xjdnp2vkCS+WyRFYzMKPjVIqIxE8KgR3iSVM=;
  b=eTMvwDhFweQGy/dS+wCNvP33e7X/RmVsOMzFoR23GLGrf2nYPj4zs3rE
   QTVrdp7DLSR6dy1FKqmGIRp03PCfvExoxK633zRDaatNUmte1b5lFmaDd
   eY3kLteAhad+BM7fLI25TMzzjClRHZEc4VnqUBHzr0cMa2YKWXND3KnmJ
   aBHIgqe8ljljf2eKnC5ZNmOSFqGELHshqnHz7Yp2ZChsgiL3oyZSnYq4q
   CLfUjmEB4dKR0tNTdFXIcjL+Allygp+ydlDqWxKgpbHf09Zm+nzwMGaO1
   NtXlsI9VgK78p5i0yD6OQP/XLowuMcIaLukV04tGBIK4fWlBszw/+O8b/
   w==;
X-CSE-ConnectionGUID: +Ng/hNLhQ0uaC7J+AzTPQg==
X-CSE-MsgGUID: 6lZNEKwUQsyB1imAvT46hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49183023"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="49183023"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:59:08 -0700
X-CSE-ConnectionGUID: WvpZqX/6SCSzWO6n9Zi/9g==
X-CSE-MsgGUID: x0+vYffnQTK4/yIKlNHXgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="133045481"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Apr 2025 01:59:06 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1iJs-0003BL-0M;
	Mon, 07 Apr 2025 08:59:04 +0000
Date: Mon, 7 Apr 2025 16:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:trylock 7/9] mm/page_alloc.c:7326: warning: Function
 parameter or struct member 'gfp_flags' not described in 'try_alloc_pages'
Message-ID: <202504071652.Vecx2fpu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   ece70dcfc0603028860bddbb76ba86dc26c26d25
commit: 62677fc403ce41a43345fbb6b646205c44a3e2ee [7/9] mm: Allow GFP_ACCOUNT and GFP_COMP to be used in try_alloc_pages().
config: arc-randconfig-002-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071652.Vecx2fpu-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071652.Vecx2fpu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504071652.Vecx2fpu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:7326: warning: Function parameter or struct member 'gfp_flags' not described in 'try_alloc_pages'


vim +7326 mm/page_alloc.c

97769a53f117e2 Alexei Starovoitov 2025-02-21  7310  
97769a53f117e2 Alexei Starovoitov 2025-02-21  7311  /**
97769a53f117e2 Alexei Starovoitov 2025-02-21  7312   * try_alloc_pages - opportunistic reentrant allocation from any context
97769a53f117e2 Alexei Starovoitov 2025-02-21  7313   * @nid: node to allocate from
97769a53f117e2 Alexei Starovoitov 2025-02-21  7314   * @order: allocation order size
97769a53f117e2 Alexei Starovoitov 2025-02-21  7315   *
97769a53f117e2 Alexei Starovoitov 2025-02-21  7316   * Allocates pages of a given order from the given node. This is safe to
97769a53f117e2 Alexei Starovoitov 2025-02-21  7317   * call from any context (from atomic, NMI, and also reentrant
97769a53f117e2 Alexei Starovoitov 2025-02-21  7318   * allocator -> tracepoint -> try_alloc_pages_noprof).
97769a53f117e2 Alexei Starovoitov 2025-02-21  7319   * Allocation is best effort and to be expected to fail easily so nobody should
97769a53f117e2 Alexei Starovoitov 2025-02-21  7320   * rely on the success. Failures are not reported via warn_alloc().
97769a53f117e2 Alexei Starovoitov 2025-02-21  7321   * See always fail conditions below.
97769a53f117e2 Alexei Starovoitov 2025-02-21  7322   *
97769a53f117e2 Alexei Starovoitov 2025-02-21  7323   * Return: allocated page or NULL on failure.
97769a53f117e2 Alexei Starovoitov 2025-02-21  7324   */
62677fc403ce41 Alexei Starovoitov 2025-04-06  7325  struct page *try_alloc_pages_noprof(gfp_t gfp_flags, int nid, unsigned int order)
97769a53f117e2 Alexei Starovoitov 2025-02-21 @7326  {
97769a53f117e2 Alexei Starovoitov 2025-02-21  7327  	/*
97769a53f117e2 Alexei Starovoitov 2025-02-21  7328  	 * Do not specify __GFP_DIRECT_RECLAIM, since direct claim is not allowed.
97769a53f117e2 Alexei Starovoitov 2025-02-21  7329  	 * Do not specify __GFP_KSWAPD_RECLAIM either, since wake up of kswapd
97769a53f117e2 Alexei Starovoitov 2025-02-21  7330  	 * is not safe in arbitrary context.
97769a53f117e2 Alexei Starovoitov 2025-02-21  7331  	 *
97769a53f117e2 Alexei Starovoitov 2025-02-21  7332  	 * These two are the conditions for gfpflags_allow_spinning() being true.
97769a53f117e2 Alexei Starovoitov 2025-02-21  7333  	 *
97769a53f117e2 Alexei Starovoitov 2025-02-21  7334  	 * Specify __GFP_NOWARN since failing try_alloc_pages() is not a reason
97769a53f117e2 Alexei Starovoitov 2025-02-21  7335  	 * to warn. Also warn would trigger printk() which is unsafe from
97769a53f117e2 Alexei Starovoitov 2025-02-21  7336  	 * various contexts. We cannot use printk_deferred_enter() to mitigate,
97769a53f117e2 Alexei Starovoitov 2025-02-21  7337  	 * since the running context is unknown.
97769a53f117e2 Alexei Starovoitov 2025-02-21  7338  	 *
97769a53f117e2 Alexei Starovoitov 2025-02-21  7339  	 * Specify __GFP_ZERO to make sure that call to kmsan_alloc_page() below
97769a53f117e2 Alexei Starovoitov 2025-02-21  7340  	 * is safe in any context. Also zeroing the page is mandatory for
97769a53f117e2 Alexei Starovoitov 2025-02-21  7341  	 * BPF use cases.
97769a53f117e2 Alexei Starovoitov 2025-02-21  7342  	 *
97769a53f117e2 Alexei Starovoitov 2025-02-21  7343  	 * Though __GFP_NOMEMALLOC is not checked in the code path below,
97769a53f117e2 Alexei Starovoitov 2025-02-21  7344  	 * specify it here to highlight that try_alloc_pages()
97769a53f117e2 Alexei Starovoitov 2025-02-21  7345  	 * doesn't want to deplete reserves.
97769a53f117e2 Alexei Starovoitov 2025-02-21  7346  	 */
e8d78dbd0199a4 Alexei Starovoitov 2025-02-21  7347  	gfp_t alloc_gfp = __GFP_NOWARN | __GFP_ZERO | __GFP_NOMEMALLOC
62677fc403ce41 Alexei Starovoitov 2025-04-06  7348  			| gfp_flags;
97769a53f117e2 Alexei Starovoitov 2025-02-21  7349  	unsigned int alloc_flags = ALLOC_TRYLOCK;
97769a53f117e2 Alexei Starovoitov 2025-02-21  7350  	struct alloc_context ac = { };
97769a53f117e2 Alexei Starovoitov 2025-02-21  7351  	struct page *page;
97769a53f117e2 Alexei Starovoitov 2025-02-21  7352  
62677fc403ce41 Alexei Starovoitov 2025-04-06  7353  	VM_WARN_ON_ONCE(gfp_flags & ~(__GFP_ACCOUNT | __GFP_COMP));
97769a53f117e2 Alexei Starovoitov 2025-02-21  7354  	/*
97769a53f117e2 Alexei Starovoitov 2025-02-21  7355  	 * In PREEMPT_RT spin_trylock() will call raw_spin_lock() which is
97769a53f117e2 Alexei Starovoitov 2025-02-21  7356  	 * unsafe in NMI. If spin_trylock() is called from hard IRQ the current
97769a53f117e2 Alexei Starovoitov 2025-02-21  7357  	 * task may be waiting for one rt_spin_lock, but rt_spin_trylock() will
97769a53f117e2 Alexei Starovoitov 2025-02-21  7358  	 * mark the task as the owner of another rt_spin_lock which will
97769a53f117e2 Alexei Starovoitov 2025-02-21  7359  	 * confuse PI logic, so return immediately if called form hard IRQ or
97769a53f117e2 Alexei Starovoitov 2025-02-21  7360  	 * NMI.
97769a53f117e2 Alexei Starovoitov 2025-02-21  7361  	 *
97769a53f117e2 Alexei Starovoitov 2025-02-21  7362  	 * Note, irqs_disabled() case is ok. This function can be called
97769a53f117e2 Alexei Starovoitov 2025-02-21  7363  	 * from raw_spin_lock_irqsave region.
97769a53f117e2 Alexei Starovoitov 2025-02-21  7364  	 */
97769a53f117e2 Alexei Starovoitov 2025-02-21  7365  	if (IS_ENABLED(CONFIG_PREEMPT_RT) && (in_nmi() || in_hardirq()))
97769a53f117e2 Alexei Starovoitov 2025-02-21  7366  		return NULL;
97769a53f117e2 Alexei Starovoitov 2025-02-21  7367  	if (!pcp_allowed_order(order))
97769a53f117e2 Alexei Starovoitov 2025-02-21  7368  		return NULL;
97769a53f117e2 Alexei Starovoitov 2025-02-21  7369  

:::::: The code at line 7326 was first introduced by commit
:::::: 97769a53f117e2f33864c587d85992ee35194ecf mm, bpf: Introduce try_alloc_pages() for opportunistic page allocation

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
