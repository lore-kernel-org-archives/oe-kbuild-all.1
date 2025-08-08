Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED18C0B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 00:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754614393; cv=none; b=hILOi2Dv9FKlgr47gRbHqxfsvE8xU2AO/JS9/5eo3NaPoDxJ1GCkspxbDZSGK7X08tW0FTE1ML4J7/4jx0V4pBLrfmG88A1oGeUmPAYutlezFQMAWH8G92xYDc5+vkNvekinSd9wsRPMWBLD/xs1zkMt2J/3qOXBFk6hI65sPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754614393; c=relaxed/simple;
	bh=NJbvu+4iEOiaNcOK0j5ZEVrPcLHLG9ocpcvx1N5Vh+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6BeCwyRJQMZTWvXhbGhEM5UPzGeCwKEdlUXMIDLPEdQbYVTGRtokK1Sejjr/5lyl4ibQPQ1xHsz8fh1BsEsaG0vcs1tu0s8tOoci3RyJfB7gDqXEeaUH5y5XSq8eYaRFfNIXW4YqxbcuqHWBJRSIDVj4obfG+hS5d1G4M2XjkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdNpirrM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdNpirrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754614391; x=1786150391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NJbvu+4iEOiaNcOK0j5ZEVrPcLHLG9ocpcvx1N5Vh+g=;
  b=JdNpirrMqXJb3sIbeEl65CTfCuwJj7gHDO5uqwr0t/1eBUWt57VeeKZ8
   PJlmHiikR2YKEKs72d9+/DTo/qfocsJDsfclhtdTK+V+KAUuaeHlRbUYT
   A5HeHPAiR/D7icB+oqtuv/v+6iSq/86jaN59nuIXW06r9mBS5PZ/1+hhm
   VA5f3x491MR+knJRi0AqBUkZ/5Ss4PG4uLn6lLFv9XANrZgrjG1+STwMj
   ejpnImm0Hdfp2+sh+OoJX4AyIxJsIdgCRpWdCOSNTsDIp6HVTPMub6iEr
   SqykbiMcDtlGfyRNFOajod68rCmpngpAmns9U6AxSFqJDVO7Cs9LFGSgS
   A==;
X-CSE-ConnectionGUID: prGWlPOMRNeY19mDLGZWLA==
X-CSE-MsgGUID: r0yKHIIlQIW3ezl45PpsZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56927678"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56927678"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 17:53:11 -0700
X-CSE-ConnectionGUID: X7XJrP4HS1SrCuc0qQejnQ==
X-CSE-MsgGUID: jsEPqGHVQTaStt8aBdz3Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164424392"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 07 Aug 2025 17:53:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukBLz-0003P4-1J;
	Fri, 08 Aug 2025 00:53:04 +0000
Date: Fri, 8 Aug 2025 08:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 6/9] freezer: Set default freeze priority for
 zombie tasks
Message-ID: <202508080845.gESj6omH-lkp@intel.com>
References: <20250807121418.139765-7-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807121418.139765-7-zhangzihuan@kylinos.cn>

Hi Zihuan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all linus/master v6.16 next-20250807]
[cannot apply to tip/sched/core kees/for-next/execve]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zihuan-Zhang/freezer-Introduce-freeze_priority-field-in-task_struct/20250807-201611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250807121418.139765-7-zhangzihuan%40kylinos.cn
patch subject: [RFC PATCH v1 6/9] freezer: Set default freeze priority for zombie tasks
config: arm-randconfig-002-20250808 (https://download.01.org/0day-ci/archive/20250808/202508080845.gESj6omH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080845.gESj6omH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080845.gESj6omH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:45:
   include/linux/freezer.h: In function 'freeze_set_default_priority':
   include/linux/freezer.h:95:55: warning: no return statement in function returning non-void [-Wreturn-type]
      95 | static inline bool freeze_set_default_priority(struct task_struct *p, unsigned int prio) {}
         |                                                       ^~~~~~~~~~~
   kernel/sched/core.c: In function 'do_task_dead':
>> kernel/sched/core.c:6984:39: error: 'FREEZE_PRIORITY_NEVER' undeclared (first use in this function)
    6984 |  freeze_set_default_priority(current, FREEZE_PRIORITY_NEVER);
         |                                       ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6984:39: note: each undeclared identifier is reported only once for each function it appears in


vim +/FREEZE_PRIORITY_NEVER +6984 kernel/sched/core.c

  6974	
  6975	void __noreturn do_task_dead(void)
  6976	{
  6977		/* Causes final put_task_struct in finish_task_switch(): */
  6978		set_special_state(TASK_DEAD);
  6979	
  6980		/* Tell freezer to ignore us: */
  6981		current->flags |= PF_NOFREEZE;
  6982	
  6983		__schedule(SM_NONE);
> 6984		freeze_set_default_priority(current, FREEZE_PRIORITY_NEVER);
  6985		BUG();
  6986	
  6987		/* Avoid "noreturn function does return" - but don't continue if BUG() is a NOP: */
  6988		for (;;)
  6989			cpu_relax();
  6990	}
  6991	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
