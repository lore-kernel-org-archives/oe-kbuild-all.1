Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AEB289355
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747910258; cv=none; b=cx4P4tnwy/cylNuto5Pt/BIDEJn86NIh9qOOKoVHFcvivwd7aQuiSYhKJkltPIahITyvvJvurglwSHnsbmDqSyqnOEkyPIH9yfqXJslXkRSC4RgMJmNOZJXjdLAvypRlQbYm45xHxyhp1Keffk9HKWSpC+6mjyFSVhcKjMUIOPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747910258; c=relaxed/simple;
	bh=1RRQv5/HO2RgIJQjmVpEJfI4WqIP3VCFOTLfT5bVal4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WxtMCJ7awGi0QFmHHX1rTk672V4NfCGf9KmTyZ02pQ957cbVJAKJdn5/WV7e9A1iHIxtNCTbq+c9P3pY28cYTslXMutNvuW7HczGMwvWsagwger6uwWnRhJuzdqF3rIZqZOzfE9QCbQKB6rfKv8kyHfgba7H2YiYxWeV8WMqoxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeUs0aQ8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeUs0aQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747910255; x=1779446255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1RRQv5/HO2RgIJQjmVpEJfI4WqIP3VCFOTLfT5bVal4=;
  b=HeUs0aQ84whOBwkK/2+qxxTXE9RwCuaExUXLfPhVaKUX+2xY7KRc7h7G
   siZUtIP6NBqRGQ6KT8U+WZwGlVS1R8Wf1mFs244tK8PF+++oduKLpCCWU
   BJLjba/vGSbzlaSx63FBUuA0WiL4gb5ZVdGkwRs3qM62xvXYnFVokUpOC
   fg65se0+MvjyfHVVcEnsXj/9hKT+PGahyryu9OyRwtM4qKYQVFJJnH7G4
   gZgp4OUJwnXvzO7Q4ZI2oXA7N+53Rmupfjb68JOBx7qKOxQFwmKjfUls6
   1a0giTrDPeuGsE1LLfdBNuuXQRQ0zQQQduX9XKdbwf7lGzxx71RJ6Nasc
   A==;
X-CSE-ConnectionGUID: Xb/n8H3bRO2wYru9Xhg18w==
X-CSE-MsgGUID: kCX2fINWR7ehpl98AkFuIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61330988"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="61330988"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 03:37:34 -0700
X-CSE-ConnectionGUID: +qIPpp6rTg+3nBvdTPN4Iw==
X-CSE-MsgGUID: Vy4Dyr9sS3+jH9VL4Y75yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="141462392"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 May 2025 03:37:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI3Ip-000PEX-1F;
	Thu, 22 May 2025 10:37:31 +0000
Date: Thu, 22 May 2025 18:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dvyukov:dvyukov-user-dispatch-wraparound-v3 2/3]
 kernel/entry/syscall_user_dispatch.c:81:14: error:
 'PR_SYS_DISPATCH_EXCLUSIVE_ON' undeclared; did you mean
 'PR_SYS_DISPATCH_ON'?
Message-ID: <202505221834.6ojCDvGu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dvyukov/linux dvyukov-user-dispatch-wraparound-v3
head:   82f74ce29050721a9f9a078d893a3e88816f8b46
commit: c78bf818933b2d14915c7524e652cdedc68258fe [2/3] syscall_user_dispatch: Add PR_SYS_DISPATCH_INCLUSIVE_ON
config: i386-buildonly-randconfig-003-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221834.6ojCDvGu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221834.6ojCDvGu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221834.6ojCDvGu-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/entry/syscall_user_dispatch.c: In function 'task_set_syscall_user_dispatch':
>> kernel/entry/syscall_user_dispatch.c:81:14: error: 'PR_SYS_DISPATCH_EXCLUSIVE_ON' undeclared (first use in this function); did you mean 'PR_SYS_DISPATCH_ON'?
      81 |         case PR_SYS_DISPATCH_EXCLUSIVE_ON:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              PR_SYS_DISPATCH_ON
   kernel/entry/syscall_user_dispatch.c:81:14: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/entry/syscall_user_dispatch.c:91:14: error: 'PR_SYS_DISPATCH_INCLUSIVE_ON' undeclared (first use in this function); did you mean 'PR_SYS_DISPATCH_ON'?
      91 |         case PR_SYS_DISPATCH_INCLUSIVE_ON:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              PR_SYS_DISPATCH_ON


vim +81 kernel/entry/syscall_user_dispatch.c

    71	
    72	static int task_set_syscall_user_dispatch(struct task_struct *task, unsigned long mode,
    73						  unsigned long offset, unsigned long len,
    74						  char __user *selector)
    75	{
    76		switch (mode) {
    77		case PR_SYS_DISPATCH_OFF:
    78			if (offset || len || selector)
    79				return -EINVAL;
    80			break;
  > 81		case PR_SYS_DISPATCH_EXCLUSIVE_ON:
    82			/*
    83			 * Validate the direct dispatcher region just for basic
    84			 * sanity against overflow and a 0-sized dispatcher
    85			 * region.  If the user is able to submit a syscall from
    86			 * an address, that address is obviously valid.
    87			 */
    88			if (offset && offset + len <= offset)
    89				return -EINVAL;
    90			break;
  > 91		case PR_SYS_DISPATCH_INCLUSIVE_ON:
    92			if (len == 0 || offset + len <= offset)
    93				return -EINVAL;
    94			/*
    95			 * Invert the range, the check in syscall_user_dispatch()
    96			 * supports wrap-around.
    97			 */
    98			offset = offset + len;
    99			len = -len;
   100			break;
   101		default:
   102			return -EINVAL;
   103		}
   104	
   105		/*
   106		 * access_ok() will clear memory tags for tagged addresses
   107		 * if current has memory tagging enabled.
   108	
   109		 * To enable a tracer to set a tracees selector the
   110		 * selector address must be untagged for access_ok(),
   111		 * otherwise an untagged tracer will always fail to set a
   112		 * tagged tracees selector.
   113		 */
   114		if (mode != PR_SYS_DISPATCH_OFF && selector &&
   115			!access_ok(untagged_addr(selector), sizeof(*selector)))
   116			return -EFAULT;
   117	
   118		task->syscall_dispatch.selector = selector;
   119		task->syscall_dispatch.offset = offset;
   120		task->syscall_dispatch.len = len;
   121		task->syscall_dispatch.on_dispatch = false;
   122	
   123		if (mode == PR_SYS_DISPATCH_ON)
   124			set_task_syscall_work(task, SYSCALL_USER_DISPATCH);
   125		else
   126			clear_task_syscall_work(task, SYSCALL_USER_DISPATCH);
   127	
   128		return 0;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
