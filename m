Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A624430BF69
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 03:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768619440; cv=none; b=lmn5NP70XfgN3fsob+0hvzHf/Xa9+ltsZqYvdbm6T2a2H9pvCuRtcD6iu8VeXe7gRRVyUo7youASz/ngilhXcd9RkS72fk+7VjmMvdLue7wIcbrp4fcJqh4hLJ6SneP03X5DZ/cYRxHea2BHGUhethHFgfKfW9Y4il5sCVHm07A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768619440; c=relaxed/simple;
	bh=5sse5o4WtkwN1wg8eFSJdeRFbyWz+LvbQrl8AxeFGX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d7kq4WLHXdA+EHo9jTVIRYUNdJW3XV9/zOIWjPngRtw5RkFnEvp0cPD31rn/1MZRvm+Kj+EnnhWeBGts7aqt+FzgMhqi5h6SneB7G9IlvyNZ/KPJR088hUyPXmQRErd5ukySZMEHHIQUwOWJPjuM3qnxP2S8tS2E2Ri5xHkwSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdWmQVZ9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdWmQVZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768619439; x=1800155439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5sse5o4WtkwN1wg8eFSJdeRFbyWz+LvbQrl8AxeFGX0=;
  b=LdWmQVZ9XXwOPHXh65fPI2rhye30S8WkaLS/JtB3YEhDy0y+h56BJUWj
   +4h3NrTGcrAvdUQF2PWBGadaRpvf+5KFIdg5YfAf4in8VUnUu5MziZaYP
   BzSjHvzg689u4W4JCK6fEz3nCjy3wP6GB8MG1caNZxKJ2plsC+Pg24jX6
   uVo+2peieEtMwBvtGm8ih/Pm28slVmu51UGnEHDro21FqsPoJu0OplUHw
   CgSRF9DXORdjzuz0dMuIKQqKsfioAbExSiwrK0pM+/3slsw1KSR71fyH7
   68UMXFvHCuCOsMOx56auMospDjzhvVjOcHRk99h89cLf+bxYtkX7CLOnf
   g==;
X-CSE-ConnectionGUID: RH9fspfgTCWWxY/K3SjYMA==
X-CSE-MsgGUID: hayrKxs/R+GRFHT2yaU22w==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69828275"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="69828275"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 19:10:37 -0800
X-CSE-ConnectionGUID: k5L3z6tETm2wBf8vxCsryA==
X-CSE-MsgGUID: ANM4SWd/SUOvbpf8AHqDgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="210405969"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jan 2026 19:10:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgwht-00000000LVQ-13aO;
	Sat, 17 Jan 2026 03:10:33 +0000
Date: Sat, 17 Jan 2026 11:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Micka=C3=ABl?= =?utf-8?Q?_Sala=C3=BCn"?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: security/landlock/task.c:112:26: sparse: sparse: Initializer
 entry defined twice
Message-ID: <202601171104.klZUd58G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   39d3389331abd712461f50249722f7ed9d815068
commit: 33e65b0d3add6bdc731e9298995cbbc979349f51 landlock: Add AUDIT_LANDLOCK_ACCESS and log ptrace denials
date:   10 months ago
config: arm-randconfig-r132-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171104.klZUd58G-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171104.klZUd58G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171104.klZUd58G-lkp@intel.com/

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
