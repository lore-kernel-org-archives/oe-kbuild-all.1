Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E708C4F8BB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 06:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726899574; cv=none; b=dbZ4DrwgiWRJifUHEwfO0uJ//wHtwuqLCjNRJjUqF+6vsrD3+Z7CYtu/Pv5JkzTP0bqf/Un+G8WOL4M76OfLkRPso6U/EpycDEoOfglrcztLJCcuyfMTZuggDJxw8doPEkBWgEfo3I2yTJOICoLY/zEU5OEoTNeN9XzgLyvmgc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726899574; c=relaxed/simple;
	bh=RHScrisoBYbze18eIK0shUJnbJhowC9QBVfIf//87WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCezX2k/4TP8e0cTzvCH41L5dLHc94Gnm+XmyzrMW/rhVYdwoa0r996NM0bPVoJB6lX4mKZ9YsVVd93vArmLCsKtQ6s0+xnEkjJm4xF7lX0U1cBNxDj99ohqnupH9rSa7GKlQj6ZvcoZ2H+XDhj4lMJKLBaWnFZR0lU/R12jVx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHYa8x9v; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHYa8x9v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726899572; x=1758435572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RHScrisoBYbze18eIK0shUJnbJhowC9QBVfIf//87WM=;
  b=PHYa8x9vHILMWJf7Z1VOfP8gpN5xThvpdEqfMPPyyzBgbYKRAv1Tl7fp
   sQspFTWFdRMEPPavXFfyY9p5+TuAs+WfxBqggP9AtD3wvE1ZuQTakZYYI
   3dqptYCTrE0EzE3zokwMnzFbAihfbgK7CoGJoXkj34jJANygBkVznRqLX
   jEHuEq48aadrQ2pfs66PB5/jVRNPTT2kQ2lF2He9UABN0IPSoGqlMov9l
   WHLIWzUVjj9q+wG+buzSFvpjMGYjzjQNDhwjgsmtFqCiIa4L4H81061JQ
   J9FUw7GIcnyIDcynWuDorEoIMJc0EE1/f8xOMXkwSH4mataYntzM81eIT
   w==;
X-CSE-ConnectionGUID: qa2sJAk3TiqYZc+Ci61NLw==
X-CSE-MsgGUID: Boll0FW8R0O1lufEZTqjpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="37285745"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="37285745"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 23:19:31 -0700
X-CSE-ConnectionGUID: rmK3rCrCRUCVMSOVPW2qrQ==
X-CSE-MsgGUID: oMMGbkVOSZey/iHXzHbFxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="70816093"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Sep 2024 23:19:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srtSp-000FAZ-38;
	Sat, 21 Sep 2024 06:19:27 +0000
Date: Sat, 21 Sep 2024 14:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] cpu/bugs: cgroup: Add a cgroup knob to bypass
 CPU mitigations
Message-ID: <202409211416.LSaNCLbs-lkp@intel.com>
References: <20240919-selective-mitigation-v1-2-1846cf41895e@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919-selective-mitigation-v1-2-1846cf41895e@linux.intel.com>

Hi Pawan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 98f7e32f20d28ec452afb208f9cffc08448a2652]

url:    https://github.com/intel-lab-lkp/linux/commits/Pawan-Gupta/x86-entry_64-Add-a-separate-unmitigated-entry-exit-path/20240920-055414
base:   98f7e32f20d28ec452afb208f9cffc08448a2652
patch link:    https://lore.kernel.org/r/20240919-selective-mitigation-v1-2-1846cf41895e%40linux.intel.com
patch subject: [PATCH RFC 2/2] cpu/bugs: cgroup: Add a cgroup knob to bypass CPU mitigations
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20240921/202409211416.LSaNCLbs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211416.LSaNCLbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211416.LSaNCLbs-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/bugs.c: In function 'cpu_mitigation_skip':
>> arch/x86/kernel/cpu/bugs.c:137:29: error: implicit declaration of function 'task_dfl_cgroup'; did you mean 'task_get_cgroup1'? [-Werror=implicit-function-declaration]
     137 |                 prev_skip = task_dfl_cgroup(prev)->cpu_skip_mitigation;
         |                             ^~~~~~~~~~~~~~~
         |                             task_get_cgroup1
>> arch/x86/kernel/cpu/bugs.c:137:50: error: invalid type argument of '->' (have 'int')
     137 |                 prev_skip = task_dfl_cgroup(prev)->cpu_skip_mitigation;
         |                                                  ^~
   arch/x86/kernel/cpu/bugs.c:139:50: error: invalid type argument of '->' (have 'int')
     139 |                 next_skip = task_dfl_cgroup(next)->cpu_skip_mitigation;
         |                                                  ^~
   arch/x86/kernel/cpu/bugs.c:147:50: error: 'entry_SYSCALL_64_unmitigated' undeclared (first use in this function)
     147 |                 wrmsrl(MSR_LSTAR, (unsigned long)entry_SYSCALL_64_unmitigated);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/bugs.c:147:50: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/cpu/bugs.c:149:50: error: 'entry_SYSCALL_64_mitigated' undeclared (first use in this function); did you mean 'entry_SYSCALL_compat'?
     149 |                 wrmsrl(MSR_LSTAR, (unsigned long)entry_SYSCALL_64_mitigated);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  entry_SYSCALL_compat
   cc1: some warnings being treated as errors


vim +137 arch/x86/kernel/cpu/bugs.c

   130	
   131	inline void cpu_mitigation_skip(struct task_struct *prev,
   132					struct task_struct *next)
   133	{
   134		bool prev_skip = false, next_skip = false;
   135	
   136		if (prev->mm)
 > 137			prev_skip = task_dfl_cgroup(prev)->cpu_skip_mitigation;
   138		if (next->mm)
   139			next_skip = task_dfl_cgroup(next)->cpu_skip_mitigation;
   140	
   141		if (!prev_skip && !next_skip)
   142			return;
   143		if (prev_skip == next_skip)
   144			return;
   145	
   146		if (next_skip)
   147			wrmsrl(MSR_LSTAR, (unsigned long)entry_SYSCALL_64_unmitigated);
   148		else
   149			wrmsrl(MSR_LSTAR, (unsigned long)entry_SYSCALL_64_mitigated);
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
