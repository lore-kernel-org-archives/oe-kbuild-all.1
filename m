Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71AB2F6909
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765457406; cv=none; b=rk9eQgi4WEPhZzFl+wz9X28oQHFod1pTlQz3xKxHT76BYbeZLvb+lc3rcBt1Sk9vz21+VeB4nUtmNY4nfz8Rnfar2D0PXuqyBhlxecbkkjMFwjzO6geFL8HGQ/SlpjbRpz1aQzZn1RY+fdmUnQvdBeD1pFSb3UWACs9dNVhSrL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765457406; c=relaxed/simple;
	bh=QRxuH9QFAHkpi7mj4O4paFi1vhwmYtJyg1STzlBijr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oBxfO8lUGRXOOJn6MY73/twk5gewFSedU2bJGzJi07hPYyVaCFlhbk9TZWBTWGIVlKLmgu5ziH5hl8/+n1pvNzMGtXrgnVK0lNS1+QXL50msia/gP/B6OedHJyVvLh/Sb+BmyW6Fk4D6t6n8RBglPLbg+6hkZBVLQY+BGHYEBGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Luu05v8A; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Luu05v8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765457405; x=1796993405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QRxuH9QFAHkpi7mj4O4paFi1vhwmYtJyg1STzlBijr0=;
  b=Luu05v8AUPvglJZZzW/7iSK0/iFdOWIJgmF3VwcF6dmOcwfzkFUX11uk
   xd3sCFNyAN6B+txa/R3UF16xdLdBvVzhD4dUY+N7umL3eJ89XIRQOQ272
   SaucIlqGqFOYnBUHamL04CQLRPw/1captCl24KRU8GIFNSFY0+rDU7cD/
   TpVE2gdfR84tC1BebrX4wjMWo3YYnANSMTI77ThBCBNdGo/+WPp15rL3k
   tU7gWnMODphPNw5bQ9KSUTMmsYLJNyQppz6tbmUzHuQYmnU8E33ooPc2A
   E/+xHeUr3gmdMGWBanNnJ4oK2w+G/xedQYeZkgRA4kVwpn5bFDIUvjgnf
   g==;
X-CSE-ConnectionGUID: BLLwYr0XSje0ClMAAfC4uw==
X-CSE-MsgGUID: HukwjbCXRImOSxgACSNFFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78141315"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="78141315"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 04:50:04 -0800
X-CSE-ConnectionGUID: uNpF2xNcRPC3Se/lclPiBQ==
X-CSE-MsgGUID: iUDr7Sc8TkODAWS72cC8EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="197066576"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Dec 2025 04:50:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTg7K-000000004f1-29ib;
	Thu, 11 Dec 2025 12:49:58 +0000
Date: Thu, 11 Dec 2025 20:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/unwind/deferred.c:257 unwind_deferred_request() warn:
 unsigned 'bit' is never less than zero.
Message-ID: <202512112012.OUpR3T44-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 49cf34c0815f93fb2ea3ab5cfbac1124bd9b45d0 unwind_user/x86: Enable frame pointer unwinding on x86
date:   6 weeks ago
config: x86_64-randconfig-161-20251211 (https://download.01.org/0day-ci/archive/20251211/202512112012.OUpR3T44-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112012.OUpR3T44-lkp@intel.com/

smatch warnings:
kernel/unwind/deferred.c:257 unwind_deferred_request() warn: unsigned 'bit' is never less than zero.

vim +/bit +257 kernel/unwind/deferred.c

b3b9cb11aa034cf Steven Rostedt 2025-07-29  204  
2dffa355f6c279e Josh Poimboeuf 2025-07-29  205  /**
2dffa355f6c279e Josh Poimboeuf 2025-07-29  206   * unwind_deferred_request - Request a user stacktrace on task kernel exit
2dffa355f6c279e Josh Poimboeuf 2025-07-29  207   * @work: Unwind descriptor requesting the trace
2dffa355f6c279e Josh Poimboeuf 2025-07-29  208   * @cookie: The cookie of the first request made for this task
2dffa355f6c279e Josh Poimboeuf 2025-07-29  209   *
2dffa355f6c279e Josh Poimboeuf 2025-07-29  210   * Schedule a user space unwind to be done in task work before exiting the
2dffa355f6c279e Josh Poimboeuf 2025-07-29  211   * kernel.
2dffa355f6c279e Josh Poimboeuf 2025-07-29  212   *
2dffa355f6c279e Josh Poimboeuf 2025-07-29  213   * The returned @cookie output is the generated cookie of the very first
2dffa355f6c279e Josh Poimboeuf 2025-07-29  214   * request for a user space stacktrace for this task since it entered the
2dffa355f6c279e Josh Poimboeuf 2025-07-29  215   * kernel. It can be from a request by any caller of this infrastructure.
2dffa355f6c279e Josh Poimboeuf 2025-07-29  216   * Its value will also be passed to the callback function.  It can be
2dffa355f6c279e Josh Poimboeuf 2025-07-29  217   * used to stitch kernel and user stack traces together in post-processing.
2dffa355f6c279e Josh Poimboeuf 2025-07-29  218   *
2dffa355f6c279e Josh Poimboeuf 2025-07-29  219   * It's valid to call this function multiple times for the same @work within
2dffa355f6c279e Josh Poimboeuf 2025-07-29  220   * the same task entry context.  Each call will return the same cookie
2dffa355f6c279e Josh Poimboeuf 2025-07-29  221   * while the task hasn't left the kernel. If the callback is not pending
2dffa355f6c279e Josh Poimboeuf 2025-07-29  222   * because it has already been previously called for the same entry context,
2dffa355f6c279e Josh Poimboeuf 2025-07-29  223   * it will be called again with the same stack trace and cookie.
2dffa355f6c279e Josh Poimboeuf 2025-07-29  224   *
be3d526a5b34109 Steven Rostedt 2025-07-29  225   * Return: 0 if the callback successfully was queued.
be3d526a5b34109 Steven Rostedt 2025-07-29  226   *         1 if the callback is pending or was already executed.
2dffa355f6c279e Josh Poimboeuf 2025-07-29  227   *         Negative if there's an error.
2dffa355f6c279e Josh Poimboeuf 2025-07-29  228   *         @cookie holds the cookie of the first request by any user
2dffa355f6c279e Josh Poimboeuf 2025-07-29  229   */
2dffa355f6c279e Josh Poimboeuf 2025-07-29  230  int unwind_deferred_request(struct unwind_work *work, u64 *cookie)
2dffa355f6c279e Josh Poimboeuf 2025-07-29  231  {
2dffa355f6c279e Josh Poimboeuf 2025-07-29  232  	struct unwind_task_info *info = &current->unwind_info;
a38a64712e740d6 Peter Zijlstra 2025-09-22  233  	int twa_mode = TWA_RESUME;
be3d526a5b34109 Steven Rostedt 2025-07-29  234  	unsigned long old, bits;
357eda2d745054e Steven Rostedt 2025-07-29  235  	unsigned long bit;
2dffa355f6c279e Josh Poimboeuf 2025-07-29  236  	int ret;
2dffa355f6c279e Josh Poimboeuf 2025-07-29  237  
2dffa355f6c279e Josh Poimboeuf 2025-07-29  238  	*cookie = 0;
2dffa355f6c279e Josh Poimboeuf 2025-07-29  239  
2dffa355f6c279e Josh Poimboeuf 2025-07-29  240  	if ((current->flags & (PF_KTHREAD | PF_EXITING)) ||
2dffa355f6c279e Josh Poimboeuf 2025-07-29  241  	    !user_mode(task_pt_regs(current)))
2dffa355f6c279e Josh Poimboeuf 2025-07-29  242  		return -EINVAL;
2dffa355f6c279e Josh Poimboeuf 2025-07-29  243  
055c7060e7ca71b Steven Rostedt 2025-07-29  244  	/*
055c7060e7ca71b Steven Rostedt 2025-07-29  245  	 * NMI requires having safe cmpxchg operations.
055c7060e7ca71b Steven Rostedt 2025-07-29  246  	 * Trigger a warning to make it obvious that an architecture
055c7060e7ca71b Steven Rostedt 2025-07-29  247  	 * is using this in NMI when it should not be.
055c7060e7ca71b Steven Rostedt 2025-07-29  248  	 */
a38a64712e740d6 Peter Zijlstra 2025-09-22  249  	if (in_nmi()) {
a38a64712e740d6 Peter Zijlstra 2025-09-22  250  		if (WARN_ON_ONCE(!CAN_USE_IN_NMI))
055c7060e7ca71b Steven Rostedt 2025-07-29  251  			return -EINVAL;
a38a64712e740d6 Peter Zijlstra 2025-09-22  252  		twa_mode = TWA_NMI_CURRENT;
a38a64712e740d6 Peter Zijlstra 2025-09-22  253  	}
055c7060e7ca71b Steven Rostedt 2025-07-29  254  
357eda2d745054e Steven Rostedt 2025-07-29  255  	/* Do not allow cancelled works to request again */
357eda2d745054e Steven Rostedt 2025-07-29  256  	bit = READ_ONCE(work->bit);
357eda2d745054e Steven Rostedt 2025-07-29 @257  	if (WARN_ON_ONCE(bit < 0))
357eda2d745054e Steven Rostedt 2025-07-29  258  		return -EINVAL;
357eda2d745054e Steven Rostedt 2025-07-29  259  
357eda2d745054e Steven Rostedt 2025-07-29  260  	/* Only need the mask now */
357eda2d745054e Steven Rostedt 2025-07-29  261  	bit = BIT(bit);
357eda2d745054e Steven Rostedt 2025-07-29  262  
2dffa355f6c279e Josh Poimboeuf 2025-07-29  263  	guard(irqsave)();
2dffa355f6c279e Josh Poimboeuf 2025-07-29  264  
2dffa355f6c279e Josh Poimboeuf 2025-07-29  265  	*cookie = get_cookie(info);
2dffa355f6c279e Josh Poimboeuf 2025-07-29  266  
639214f65b1db87 Peter Zijlstra 2025-09-22  267  	old = atomic_long_read(&info->unwind_mask);
055c7060e7ca71b Steven Rostedt 2025-07-29  268  
be3d526a5b34109 Steven Rostedt 2025-07-29  269  	/* Is this already queued or executed */
be3d526a5b34109 Steven Rostedt 2025-07-29  270  	if (old & bit)
2dffa355f6c279e Josh Poimboeuf 2025-07-29  271  		return 1;
2dffa355f6c279e Josh Poimboeuf 2025-07-29  272  
be3d526a5b34109 Steven Rostedt 2025-07-29  273  	/*
be3d526a5b34109 Steven Rostedt 2025-07-29  274  	 * This work's bit hasn't been set yet. Now set it with the PENDING
be3d526a5b34109 Steven Rostedt 2025-07-29  275  	 * bit and fetch the current value of unwind_mask. If ether the
be3d526a5b34109 Steven Rostedt 2025-07-29  276  	 * work's bit or PENDING was already set, then this is already queued
be3d526a5b34109 Steven Rostedt 2025-07-29  277  	 * to have a callback.
be3d526a5b34109 Steven Rostedt 2025-07-29  278  	 */
be3d526a5b34109 Steven Rostedt 2025-07-29  279  	bits = UNWIND_PENDING | bit;
639214f65b1db87 Peter Zijlstra 2025-09-22  280  	old = atomic_long_fetch_or(bits, &info->unwind_mask);
be3d526a5b34109 Steven Rostedt 2025-07-29  281  	if (old & bits) {
be3d526a5b34109 Steven Rostedt 2025-07-29  282  		/*
be3d526a5b34109 Steven Rostedt 2025-07-29  283  		 * If the work's bit was set, whatever set it had better
be3d526a5b34109 Steven Rostedt 2025-07-29  284  		 * have also set pending and queued a callback.
be3d526a5b34109 Steven Rostedt 2025-07-29  285  		 */
be3d526a5b34109 Steven Rostedt 2025-07-29  286  		WARN_ON_ONCE(!(old & UNWIND_PENDING));
be3d526a5b34109 Steven Rostedt 2025-07-29  287  		return old & bit;
be3d526a5b34109 Steven Rostedt 2025-07-29  288  	}
be3d526a5b34109 Steven Rostedt 2025-07-29  289  
2dffa355f6c279e Josh Poimboeuf 2025-07-29  290  	/* The work has been claimed, now schedule it. */
a38a64712e740d6 Peter Zijlstra 2025-09-22  291  	ret = task_work_add(current, &info->work, twa_mode);
2dffa355f6c279e Josh Poimboeuf 2025-07-29  292  
be3d526a5b34109 Steven Rostedt 2025-07-29  293  	if (WARN_ON_ONCE(ret))
639214f65b1db87 Peter Zijlstra 2025-09-22  294  		atomic_long_set(&info->unwind_mask, 0);
be3d526a5b34109 Steven Rostedt 2025-07-29  295  
be3d526a5b34109 Steven Rostedt 2025-07-29  296  	return ret;
2dffa355f6c279e Josh Poimboeuf 2025-07-29  297  }
2dffa355f6c279e Josh Poimboeuf 2025-07-29  298  

:::::: The code at line 257 was first introduced by commit
:::::: 357eda2d745054eb737397368bc9b0f84814b0a5 unwind deferred: Use SRCU unwind_deferred_task_work()

:::::: TO: Steven Rostedt <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
