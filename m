Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52891E50B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741955614; cv=none; b=nUX6d8gh31JXLR0QUVBOPko/1ZXZD7IEz8UYLZv1eBRHvLQKeE65PQbufmhtBXI6Cqcqr4qiWDDzuDjXeXFSGpCNzWH1sx6q4jAxQ6MDdR5xXt+6YM3HZICQRP0rwNsx7iDZC4WzlZcTIXCrmuYDUJksj8WMdF26yJpyd56mT70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741955614; c=relaxed/simple;
	bh=Q22ddqC2UqxKYR0Nwax5W6zXqzyTZron5mLRYm7hhcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAiv7zJ6Db3VT7MlZJk5S7zLqcmU+mucaYH2ntiKxnAb3LRtwGWXSWBQWizhSI+biGraZu7s6llRXhtvSb60/wc/6w0Sf5WG7Te3RH+jTX7Uw10JwMaKEnAw6seWmS10yZcYNQ5HhjET+UDRWE66lefwQHhFnrLBio/cM2U75P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wbpkb0Xh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wbpkb0Xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741955613; x=1773491613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q22ddqC2UqxKYR0Nwax5W6zXqzyTZron5mLRYm7hhcg=;
  b=Wbpkb0Xh9Q6C4LgqRSYaBY0NBtKz5flGwvLbH4W8ZQMVCHTROTxFMGiu
   wUstL4kl3cJRxGtqi25Ylsj1JMu2ZrykPOWVtQaodrL8HBezdWNaTtVBr
   NMhSOWnN9g93NfdhloV1R7pcKSPB5MFMRodHFT4uFDN/jc1EvGr9GhNoZ
   F6UoQwltOGCd/il62YuVSiL5Tf4MsOJ0Ljz0I7bynpHnqBSgcaPsPh61r
   FFwR/mxGq2sLDs3fWlZywwgWZZYEur3Z+oMU3YBoJ7asP6le69RAfVsLw
   5mA9z9gFFzatoEI0NlxMffjjuAaRdflQDEfFHURyEkj5XIYqzgSmRLxJT
   Q==;
X-CSE-ConnectionGUID: 2oeTFTWBTeSyuMJ4wvTphg==
X-CSE-MsgGUID: 7ZUmk7odS1mFxyDB2q3QfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43141296"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43141296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 05:33:33 -0700
X-CSE-ConnectionGUID: V/Ep2fOSTfO/2yx4fUY/Ww==
X-CSE-MsgGUID: 9R88tuEkTWSxjhUX0iINGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121000454"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Mar 2025 05:33:31 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt4E5-000ARq-1n;
	Fri, 14 Mar 2025 12:33:23 +0000
Date: Fri, 14 Mar 2025 20:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8772/11207] security/landlock/task.c:110:26:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202503142034.1828OqiZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: fd5333371afb890498ba1ef2f0f92f0ba55b555b [8772/11207] landlock: Add AUDIT_LANDLOCK_ACCESS and log ptrace denials
config: i386-randconfig-063-20250314 (https://download.01.org/0day-ci/archive/20250314/202503142034.1828OqiZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503142034.1828OqiZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503142034.1828OqiZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/landlock/task.c:110:26: sparse: sparse: Initializer entry defined twice
   security/landlock/task.c:111:34: sparse:   also defined here
   security/landlock/task.c:156:18: sparse: sparse: Initializer entry defined twice
   security/landlock/task.c:157:26: sparse:   also defined here

vim +110 security/landlock/task.c

    69	
    70	/**
    71	 * hook_ptrace_access_check - Determines whether the current process may access
    72	 *			      another
    73	 *
    74	 * @child: Process to be accessed.
    75	 * @mode: Mode of attachment.
    76	 *
    77	 * If the current task has Landlock rules, then the child must have at least
    78	 * the same rules.  Else denied.
    79	 *
    80	 * Determines whether a process may access another, returning 0 if permission
    81	 * granted, -errno if denied.
    82	 */
    83	static int hook_ptrace_access_check(struct task_struct *const child,
    84					    const unsigned int mode)
    85	{
    86		const struct landlock_cred_security *parent_subject;
    87		const struct landlock_ruleset *child_dom;
    88		int err;
    89	
    90		/* Quick return for non-landlocked tasks. */
    91		parent_subject = landlock_cred(current_cred());
    92		if (!parent_subject)
    93			return 0;
    94	
    95		scoped_guard(rcu)
    96		{
    97			child_dom = landlock_get_task_domain(child);
    98			err = domain_ptrace(parent_subject->domain, child_dom);
    99		}
   100	
   101		if (!err)
   102			return 0;
   103	
   104		/*
   105		 * For the ptrace_access_check case, we log the current/parent domain
   106		 * and the child task.
   107		 */
   108		if (!(mode & PTRACE_MODE_NOAUDIT))
   109			landlock_log_denial(parent_subject, &(struct landlock_request) {
 > 110				.type = LANDLOCK_REQUEST_PTRACE,
   111				.audit = {
   112					.type = LSM_AUDIT_DATA_TASK,
   113					.u.tsk = child,
   114				},
   115				.layer_plus_one = parent_subject->domain->num_layers,
   116			});
   117	
   118		return err;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
