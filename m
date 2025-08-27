Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7191448D5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 10:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288879; cv=none; b=dbCOP65NE9TtuHXb7Ac02EvzWybmkstYQwz3CKdc2oGjtgg3yeD0/8L3ZYQ6g5Zwm4yJuvNsz/hDdfeSduj0eNvYNzHPGJkkbBU8Wvz6UUTl3f1/ViIIvp2MTr+NGxp2bMnN8zBRHdOrfJ2gQti1F2l91hyKrvFvqKouKAgC8Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288879; c=relaxed/simple;
	bh=0wxydR/kNRrPsaTEMpLj2Bala945FwDEdWbQPjwYdXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OC0FrprUk70YNvkJPg57Wc7TSzGRcD6r2dzVPswWczjmWZu1zLir8xn93tR+hszhOu8Dtqjf2tW8punAkQv1D1Wy68nP9Llm1PL3aat5JnfbDn4fPpaFRcpL+MxEK4xejgOhybwWMQ0q9nVuxalBA6EzQ12cEqX1RQZ/87TO7lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0obpsPr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0obpsPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756288877; x=1787824877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0wxydR/kNRrPsaTEMpLj2Bala945FwDEdWbQPjwYdXs=;
  b=e0obpsPror62M3Gy1Ga+VlzjK3wBsCsM9pepHLC8wC+g3kuVfMZB1eMh
   tIYUSANO0ShULpkE1nMHd+aWAZiKGAiwevN0YWdXeLjUGVhfY+Lh/QYOw
   0WcmwvyNI7yH7f2HlMHFuX0S+0dCrhye51zXxz0uwlNppMGguEdZKYPlH
   b+TmjDeTkaj3I91d8lqv0uUrXRJivrK85LTZL0Y3+5HGPk+E2kk9D2owt
   UXMmSa9b6DTxfxBeI5SJYAYug26N+S0M4qB8zKChlZPgMynPOVAQMRkV0
   Q2u4DtCv3bdqWfwCHlwoPFJT1ktvLV79LpRzBVRU4RIwSuBDgG8MOG/QS
   w==;
X-CSE-ConnectionGUID: aRMGRtegSlyrpZjkRwobXg==
X-CSE-MsgGUID: AHeVgCw2QvylaC4TVS9bKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57556574"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57556574"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 03:01:14 -0700
X-CSE-ConnectionGUID: BeaCmm8ZTnGQ8Z3xlfp81g==
X-CSE-MsgGUID: oYyAXoQaTEm+32CYF6a4IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169405524"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Aug 2025 03:01:11 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urCxn-000SqR-2S;
	Wed, 27 Aug 2025 10:01:07 +0000
Date: Wed, 27 Aug 2025 18:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:unwind/perf-test 1/15] kernel/unwind/deferred.c:254
 unwind_deferred_request() warn: unsigned 'bit' is never less than zero.
Message-ID: <202508271700.1rZuC7DF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace unwind/perf-test
head:   40a604f11b56c3e57f09148ebaff21b5013ae806
commit: d156a225efe2f34a0d3d671a1d563f9397d8453e [1/15] unwind_user/x86: Enable frame pointer unwinding on x86
config: x86_64-randconfig-161-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271700.1rZuC7DF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271700.1rZuC7DF-lkp@intel.com/

smatch warnings:
kernel/unwind/deferred.c:254 unwind_deferred_request() warn: unsigned 'bit' is never less than zero.

vim +/bit +254 kernel/unwind/deferred.c

b3b9cb11aa034c Steven Rostedt 2025-07-29  205  
2dffa355f6c279 Josh Poimboeuf 2025-07-29  206  /**
2dffa355f6c279 Josh Poimboeuf 2025-07-29  207   * unwind_deferred_request - Request a user stacktrace on task kernel exit
2dffa355f6c279 Josh Poimboeuf 2025-07-29  208   * @work: Unwind descriptor requesting the trace
2dffa355f6c279 Josh Poimboeuf 2025-07-29  209   * @cookie: The cookie of the first request made for this task
2dffa355f6c279 Josh Poimboeuf 2025-07-29  210   *
2dffa355f6c279 Josh Poimboeuf 2025-07-29  211   * Schedule a user space unwind to be done in task work before exiting the
2dffa355f6c279 Josh Poimboeuf 2025-07-29  212   * kernel.
2dffa355f6c279 Josh Poimboeuf 2025-07-29  213   *
2dffa355f6c279 Josh Poimboeuf 2025-07-29  214   * The returned @cookie output is the generated cookie of the very first
2dffa355f6c279 Josh Poimboeuf 2025-07-29  215   * request for a user space stacktrace for this task since it entered the
2dffa355f6c279 Josh Poimboeuf 2025-07-29  216   * kernel. It can be from a request by any caller of this infrastructure.
2dffa355f6c279 Josh Poimboeuf 2025-07-29  217   * Its value will also be passed to the callback function.  It can be
2dffa355f6c279 Josh Poimboeuf 2025-07-29  218   * used to stitch kernel and user stack traces together in post-processing.
2dffa355f6c279 Josh Poimboeuf 2025-07-29  219   *
2dffa355f6c279 Josh Poimboeuf 2025-07-29  220   * It's valid to call this function multiple times for the same @work within
2dffa355f6c279 Josh Poimboeuf 2025-07-29  221   * the same task entry context.  Each call will return the same cookie
2dffa355f6c279 Josh Poimboeuf 2025-07-29  222   * while the task hasn't left the kernel. If the callback is not pending
2dffa355f6c279 Josh Poimboeuf 2025-07-29  223   * because it has already been previously called for the same entry context,
2dffa355f6c279 Josh Poimboeuf 2025-07-29  224   * it will be called again with the same stack trace and cookie.
2dffa355f6c279 Josh Poimboeuf 2025-07-29  225   *
be3d526a5b3410 Steven Rostedt 2025-07-29  226   * Return: 0 if the callback successfully was queued.
be3d526a5b3410 Steven Rostedt 2025-07-29  227   *         1 if the callback is pending or was already executed.
2dffa355f6c279 Josh Poimboeuf 2025-07-29  228   *         Negative if there's an error.
2dffa355f6c279 Josh Poimboeuf 2025-07-29  229   *         @cookie holds the cookie of the first request by any user
2dffa355f6c279 Josh Poimboeuf 2025-07-29  230   */
2dffa355f6c279 Josh Poimboeuf 2025-07-29  231  int unwind_deferred_request(struct unwind_work *work, u64 *cookie)
2dffa355f6c279 Josh Poimboeuf 2025-07-29  232  {
2dffa355f6c279 Josh Poimboeuf 2025-07-29  233  	struct unwind_task_info *info = &current->unwind_info;
be3d526a5b3410 Steven Rostedt 2025-07-29  234  	unsigned long old, bits;
357eda2d745054 Steven Rostedt 2025-07-29  235  	unsigned long bit;
2dffa355f6c279 Josh Poimboeuf 2025-07-29  236  	int ret;
2dffa355f6c279 Josh Poimboeuf 2025-07-29  237  
2dffa355f6c279 Josh Poimboeuf 2025-07-29  238  	*cookie = 0;
2dffa355f6c279 Josh Poimboeuf 2025-07-29  239  
2dffa355f6c279 Josh Poimboeuf 2025-07-29  240  	if ((current->flags & (PF_KTHREAD | PF_EXITING)) ||
2dffa355f6c279 Josh Poimboeuf 2025-07-29  241  	    !user_mode(task_pt_regs(current)))
2dffa355f6c279 Josh Poimboeuf 2025-07-29  242  		return -EINVAL;
2dffa355f6c279 Josh Poimboeuf 2025-07-29  243  
055c7060e7ca71 Steven Rostedt 2025-07-29  244  	/*
055c7060e7ca71 Steven Rostedt 2025-07-29  245  	 * NMI requires having safe cmpxchg operations.
055c7060e7ca71 Steven Rostedt 2025-07-29  246  	 * Trigger a warning to make it obvious that an architecture
055c7060e7ca71 Steven Rostedt 2025-07-29  247  	 * is using this in NMI when it should not be.
055c7060e7ca71 Steven Rostedt 2025-07-29  248  	 */
055c7060e7ca71 Steven Rostedt 2025-07-29  249  	if (WARN_ON_ONCE(!CAN_USE_IN_NMI && in_nmi()))
055c7060e7ca71 Steven Rostedt 2025-07-29  250  		return -EINVAL;
055c7060e7ca71 Steven Rostedt 2025-07-29  251  
357eda2d745054 Steven Rostedt 2025-07-29  252  	/* Do not allow cancelled works to request again */
357eda2d745054 Steven Rostedt 2025-07-29  253  	bit = READ_ONCE(work->bit);
357eda2d745054 Steven Rostedt 2025-07-29 @254  	if (WARN_ON_ONCE(bit < 0))
357eda2d745054 Steven Rostedt 2025-07-29  255  		return -EINVAL;
357eda2d745054 Steven Rostedt 2025-07-29  256  
357eda2d745054 Steven Rostedt 2025-07-29  257  	/* Only need the mask now */
357eda2d745054 Steven Rostedt 2025-07-29  258  	bit = BIT(bit);
357eda2d745054 Steven Rostedt 2025-07-29  259  
2dffa355f6c279 Josh Poimboeuf 2025-07-29  260  	guard(irqsave)();
2dffa355f6c279 Josh Poimboeuf 2025-07-29  261  
2dffa355f6c279 Josh Poimboeuf 2025-07-29  262  	*cookie = get_cookie(info);
2dffa355f6c279 Josh Poimboeuf 2025-07-29  263  
be3d526a5b3410 Steven Rostedt 2025-07-29  264  	old = READ_ONCE(info->unwind_mask);
055c7060e7ca71 Steven Rostedt 2025-07-29  265  
be3d526a5b3410 Steven Rostedt 2025-07-29  266  	/* Is this already queued or executed */
be3d526a5b3410 Steven Rostedt 2025-07-29  267  	if (old & bit)
2dffa355f6c279 Josh Poimboeuf 2025-07-29  268  		return 1;
2dffa355f6c279 Josh Poimboeuf 2025-07-29  269  
be3d526a5b3410 Steven Rostedt 2025-07-29  270  	/*
be3d526a5b3410 Steven Rostedt 2025-07-29  271  	 * This work's bit hasn't been set yet. Now set it with the PENDING
be3d526a5b3410 Steven Rostedt 2025-07-29  272  	 * bit and fetch the current value of unwind_mask. If ether the
be3d526a5b3410 Steven Rostedt 2025-07-29  273  	 * work's bit or PENDING was already set, then this is already queued
be3d526a5b3410 Steven Rostedt 2025-07-29  274  	 * to have a callback.
be3d526a5b3410 Steven Rostedt 2025-07-29  275  	 */
be3d526a5b3410 Steven Rostedt 2025-07-29  276  	bits = UNWIND_PENDING | bit;
be3d526a5b3410 Steven Rostedt 2025-07-29  277  	old = atomic_long_fetch_or(bits, (atomic_long_t *)&info->unwind_mask);
be3d526a5b3410 Steven Rostedt 2025-07-29  278  	if (old & bits) {
be3d526a5b3410 Steven Rostedt 2025-07-29  279  		/*
be3d526a5b3410 Steven Rostedt 2025-07-29  280  		 * If the work's bit was set, whatever set it had better
be3d526a5b3410 Steven Rostedt 2025-07-29  281  		 * have also set pending and queued a callback.
be3d526a5b3410 Steven Rostedt 2025-07-29  282  		 */
be3d526a5b3410 Steven Rostedt 2025-07-29  283  		WARN_ON_ONCE(!(old & UNWIND_PENDING));
be3d526a5b3410 Steven Rostedt 2025-07-29  284  		return old & bit;
be3d526a5b3410 Steven Rostedt 2025-07-29  285  	}
be3d526a5b3410 Steven Rostedt 2025-07-29  286  
2dffa355f6c279 Josh Poimboeuf 2025-07-29  287  	/* The work has been claimed, now schedule it. */
2dffa355f6c279 Josh Poimboeuf 2025-07-29  288  	ret = task_work_add(current, &info->work, TWA_RESUME);
2dffa355f6c279 Josh Poimboeuf 2025-07-29  289  
be3d526a5b3410 Steven Rostedt 2025-07-29  290  	if (WARN_ON_ONCE(ret))
be3d526a5b3410 Steven Rostedt 2025-07-29  291  		WRITE_ONCE(info->unwind_mask, 0);
be3d526a5b3410 Steven Rostedt 2025-07-29  292  
be3d526a5b3410 Steven Rostedt 2025-07-29  293  	return ret;
2dffa355f6c279 Josh Poimboeuf 2025-07-29  294  }
2dffa355f6c279 Josh Poimboeuf 2025-07-29  295  

:::::: The code at line 254 was first introduced by commit
:::::: 357eda2d745054eb737397368bc9b0f84814b0a5 unwind deferred: Use SRCU unwind_deferred_task_work()

:::::: TO: Steven Rostedt <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
