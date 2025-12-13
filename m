Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAD32E8B8B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 18:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765649354; cv=none; b=PpAyY4W9KMDi8NRdou9ITc24uhX2vB9LQM0UYmzqGDE555Pcl47D0FR4ngKbR+cbOLOvrLEUCXy23N7cUjS4lIMlfLuN5Jj8xWHPkuFsMfhrBlbD5Ir4F0LzS2hz0YTUbWYdKruGZ2+RD24ks474e57JWyDXu2/f/YAP3aCS4BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765649354; c=relaxed/simple;
	bh=+HsHKgbGghA9HUoTCSPHyFmsEZx4PoK94Jvt/RWjPH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T/Gy9QFpphcHT7R4j40QJXaKMMI4G/Ocyn045WRLdnDOEVZDtHFpCiFLwFgCmO9pS2FJMHxltHsHDlRwKPOcQnv6MonEAPEcmXB61nVgWIRh9/dGt21APWJ9sv+/iR+CwnPpaN7MHo7espriahvSnOeWTYYCWdK7YYkhIV1GmBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1sI5HM5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1sI5HM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765649353; x=1797185353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+HsHKgbGghA9HUoTCSPHyFmsEZx4PoK94Jvt/RWjPH4=;
  b=a1sI5HM5PBAPbWCoObUUGgn88oU8RpdJ+/Sdjm4w4fs3BP8DmxGx4fIV
   gnWIzZtfY8+DcFYx9ufI+TA0j6LspLY8V+iq31YIQix+12yV4FsjcHaFg
   ZQMK/q3ufYIZDeOehR6twv/4ua2L/r5hhi5wreYCaglpUxln3W9jzl7J8
   Euo9y12woUOCfuvxFH6X7ExH+pBBL0AZ9CK8J28W0cnPoX8ALS5c/hWxJ
   0xtz5KXS+OnxutGr6LFiNFdUgoJpsf57oPCGh0SN+48q0PBV3hNQE2I7T
   rXL5TKr5guBTcDJic/iY1YVzVZPy1j23VSI90f7Uc/3vLlthEji+uRNLs
   w==;
X-CSE-ConnectionGUID: Nr7ayKp1QdaZzLMywVZOlg==
X-CSE-MsgGUID: ujt2lujZQOOVJcCBJLr8SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67775000"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67775000"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 10:09:11 -0800
X-CSE-ConnectionGUID: hKdcJDcMQTKCvWaEVnwSRg==
X-CSE-MsgGUID: UP+BQt+HRymJef2nZfOxgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197344295"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 10:09:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUU3H-00000000825-1u6q;
	Sat, 13 Dec 2025 18:09:07 +0000
Date: Sun, 14 Dec 2025 02:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: security/landlock/task.c:112:26: sparse: sparse: Initializer entry
 defined twice
Message-ID: <202512140157.ty6KKiij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 33e65b0d3add6bdc731e9298995cbbc979349f51 landlock: Add AUDIT_LANDLOCK_ACCESS and log ptrace denials
date:   9 months ago
config: arm64-randconfig-r112-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140157.ty6KKiij-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140157.ty6KKiij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140157.ty6KKiij-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/landlock/task.c:112:26: sparse: sparse: Initializer entry defined twice
   security/landlock/task.c:113:34: sparse:   also defined here
   security/landlock/task.c:158:18: sparse: sparse: Initializer entry defined twice
   security/landlock/task.c:159:26: sparse:   also defined here

vim +112 security/landlock/task.c

    71	
    72	/**
    73	 * hook_ptrace_access_check - Determines whether the current process may access
    74	 *			      another
    75	 *
    76	 * @child: Process to be accessed.
    77	 * @mode: Mode of attachment.
    78	 *
    79	 * If the current task has Landlock rules, then the child must have at least
    80	 * the same rules.  Else denied.
    81	 *
    82	 * Determines whether a process may access another, returning 0 if permission
    83	 * granted, -errno if denied.
    84	 */
    85	static int hook_ptrace_access_check(struct task_struct *const child,
    86					    const unsigned int mode)
    87	{
    88		const struct landlock_cred_security *parent_subject;
    89		const struct landlock_ruleset *child_dom;
    90		int err;
    91	
    92		/* Quick return for non-landlocked tasks. */
    93		parent_subject = landlock_cred(current_cred());
    94		if (!parent_subject)
    95			return 0;
    96	
    97		scoped_guard(rcu)
    98		{
    99			child_dom = landlock_get_task_domain(child);
   100			err = domain_ptrace(parent_subject->domain, child_dom);
   101		}
   102	
   103		if (!err)
   104			return 0;
   105	
   106		/*
   107		 * For the ptrace_access_check case, we log the current/parent domain
   108		 * and the child task.
   109		 */
   110		if (!(mode & PTRACE_MODE_NOAUDIT))
   111			landlock_log_denial(parent_subject, &(struct landlock_request) {
 > 112				.type = LANDLOCK_REQUEST_PTRACE,
   113				.audit = {
   114					.type = LSM_AUDIT_DATA_TASK,
   115					.u.tsk = child,
   116				},
   117				.layer_plus_one = parent_subject->domain->num_layers,
   118			});
   119	
   120		return err;
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
