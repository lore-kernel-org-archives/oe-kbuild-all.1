Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44C836E467
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 05:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789190207; cv=none; b=P1YZt4XTCxC6gxisa+joldThP56t18+l7hPnku0+k135H5R5nNETFMnQY5yfcTkMgeQ2kWpO6HomrUxIgbR7zIiESgwAi+m6inJX8/VolfEUm+uVVghcwF2UF81J7IkTAWQye6S+A+0Ub0E1xOGf/dsUXFyxwvctvtu8TV0qbwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789190207; c=relaxed/simple;
	bh=EApWaXCvZ7S0M+W7D/8lI/ZdFCsMsmsPUtDkewIiAVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SkddFO0wItEUVW0YU2CfUngLwa0wc7nGNJghDePZcJC5NO7YqW1FOtkF8IPXYAMJzzALn4DokQyzMIUhyKF44uoCIEd7SDvLVjvmE3+w9hqS9ysvO2WGitktwCU2QPCZhEV6KsF+8v5yDN5l/CmwcubII+ysmBpAuLkbdd5uRbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUfeRiJh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUfeRiJh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789190205; x=1820726205;
  h=date:from:to:cc:subject:message-id;
  bh=EApWaXCvZ7S0M+W7D/8lI/ZdFCsMsmsPUtDkewIiAVs=;
  b=NUfeRiJhoKmYqaCVMoB591FCIamog11VqSLaJI61+oANE3C5cUeUB8Sf
   IowdMzxyJRXk728AjxPObYncqN8+P3j1YohNt43rzrPoi5piAm/DeJ4oG
   ytJ67CQnV0dO2tLnAYAQaDs3zMSNLOA8ecx3dSxcdsPXND8DREpJDAUIb
   x+cg6xdINRpgaYxbBwW+qLNkIPJmELhdFdzYyzbz6tC3wWkR64M2io9k+
   LC69z0s5ZnHVoH0SmSUGhjxgAdATwyoYYkhLiD9enet8RBRgjfayffMb4
   EefvnyBHO7KPwTedW9wFUFlSSOxuosGSt8POzuBbp7mYOhmjTVaAEc8d3
   Q==;
X-CSE-ConnectionGUID: eU0y6cAUThatMwP/d2U0Yw==
X-CSE-MsgGUID: IEE0MbJnRnm+cl5ZYhEuEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100307813"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="100307813"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 22:16:45 -0700
X-CSE-ConnectionGUID: QnuR7GNyT9KDmkp0mizu/w==
X-CSE-MsgGUID: V4kAi/U3TuSFbmN+H6CmpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="277366567"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Sep 2026 22:16:44 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5G6U-000000002gd-03lD;
	Sat, 12 Sep 2026 05:16:42 +0000
Date: Sat, 12 Sep 2026 13:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [clangbuiltlinux:question_mark_operator 2/5]
 kernel/cgroup/cpuset.c:3768:49: error: expected expression before ';' token
Message-ID: <202609121317.tA4kHiVL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/ClangBuiltLinux/linux question_mark_operator
head:   532a7ac2d57bb5674f5feffb4ba378f8a32f3bcf
commit: b073116da78daa4548a491eba6508141a9b350dc [2/5] cgroup/cpuset: use guard(mutex) and try operator ('?') in cpuset_can_fork
config: parisc-generic-64bit_defconfig (https://download.01.org/0day-ci/archive/20260912/202609121317.tA4kHiVL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121317.tA4kHiVL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121317.tA4kHiVL-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/cpuset.c: In function 'cpuset_can_fork':
>> kernel/cgroup/cpuset.c:3768:49: error: expected expression before ';' token
    3768 |         cpuset_can_attach_check(cs, NULL, NULL)?;
         |                                                 ^
   kernel/cgroup/cpuset.c:3769:31: error: expected expression before ';' token
    3769 |         task_can_attach(task)?;
         |                               ^
   kernel/cgroup/cpuset.c:3770:42: error: expected expression before ';' token
    3770 |         security_task_setscheduler(task)?;
         |                                          ^


vim +3768 kernel/cgroup/cpuset.c

  3747	
  3748	/*
  3749	 * In case the child is cloned into a cpuset different from its parent,
  3750	 * additional checks are done to see if the move is allowed.
  3751	 */
  3752	static int cpuset_can_fork(struct task_struct *task, struct css_set *cset)
  3753	{
  3754		struct cpuset *cs = css_cs(cset->subsys[cpuset_cgrp_id]);
  3755		bool same_cs;
  3756	
  3757		rcu_read_lock();
  3758		same_cs = (cs == task_cs(current));
  3759		rcu_read_unlock();
  3760	
  3761		if (same_cs)
  3762			return 0;
  3763	
  3764		lockdep_assert_held(&cgroup_mutex);
  3765		guard(mutex)(&cpuset_mutex);
  3766	
  3767		/* Check to see if task is allowed in the cpuset */
> 3768		cpuset_can_attach_check(cs, NULL, NULL)?;
  3769		task_can_attach(task)?;
  3770		security_task_setscheduler(task)?;
  3771	
  3772		attach_ctx.in_progress++;
  3773		return 0;
  3774	}
  3775	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
