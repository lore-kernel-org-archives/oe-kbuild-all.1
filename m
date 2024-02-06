Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64201C2A6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 22:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707260246; cv=none; b=jfCX+YRKiHp1kkZY/NxJ9IufZuHibhBqP38oogqnSonyU8Buyutl7609d+x/RCbE8uonDXas423dv/1tva7NW0mGySPbkPO6anmT1iKTmlgRtKep88uqz35bqd+HXoruZJEgVIUeYJuyH6lhI/Fo1tYK9BJ+H+b09sPgTTgkDTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707260246; c=relaxed/simple;
	bh=MZO5kRebSf9AlX3D1ZzN1WT41UyCdoiwTGCYO7FmkqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAUETdQxrWXPyd7YDZdFKCPCyk3A/WexEjdZp+hFEg1v0rggEPpjnbzlOQ387dmHbAs0tOw4EzYSTE6Qn6BqHeT39Ys3Yuw5LzA2GknZ/kPxf5s/Aihj/8Hq3E85KciNbEtf9Z1Pe3wbtV1SUxZgMnkEjOkHy15nvkmwVUHuEqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKWEzNNl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKWEzNNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707260245; x=1738796245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZO5kRebSf9AlX3D1ZzN1WT41UyCdoiwTGCYO7FmkqY=;
  b=HKWEzNNlwhEaL8bXX5CGEWfKiQGQo6OFxEr2aABCMhMsNJa+gHpXbNeS
   g+lFKmoAhrqH0x/6rugVuSWA2yCMt/mu0dec4d/kiktf8ift/MfQgfpZ2
   x1vvqYffOh364KUskpL/hTP0b/OJLW+mSuPhgm4kjKUf4s5PkTAFqj0+M
   Zjy+G6M8xUG31BoY45zl3oCzC5S3Sm34g0Vz5hsdCAxnmlj5S8h9ICfly
   b9COVneAoj29OWbvjW3qUqQ27lipLeo8TSeuexHhpuPjeXw6OS71bMnVl
   Ie6Uwf8UKlnZtKFE7B2X6Al8agBQxjqR/PU/FU0LUxMk1e9kSyVn8eIYp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11596075"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="11596075"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 14:57:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="38569917"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2024 14:57:22 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXUNU-0001rc-0D;
	Tue, 06 Feb 2024 22:57:20 +0000
Date: Wed, 7 Feb 2024 06:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-misfit-update 1/1] kernel/sched/core.c:2008:3:
 error: implicit declaration of function 'update_misfit_status' is invalid in
 C99
Message-ID: <202402070632.dNdhYdvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-misfit-update
head:   795964ba3482de02426331d23c50241a1d20898b
commit: 795964ba3482de02426331d23c50241a1d20898b [1/1] sched/uclamp: update_misfit_task() when a uclamp value changes
config: powerpc-randconfig-r054-20240206 (https://download.01.org/0day-ci/archive/20240207/202402070632.dNdhYdvB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402070632.dNdhYdvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070632.dNdhYdvB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:2008:3: error: implicit declaration of function 'update_misfit_status' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   update_misfit_status(p, task_rq(p));
                   ^
   1 error generated.


vim +/update_misfit_status +2008 kernel/sched/core.c

  1961	
  1962	static void __setscheduler_uclamp(struct task_struct *p,
  1963					  const struct sched_attr *attr)
  1964	{
  1965		enum uclamp_id clamp_id;
  1966		bool uclamp_updated = false;
  1967	
  1968		for_each_clamp_id(clamp_id) {
  1969			struct uclamp_se *uc_se = &p->uclamp_req[clamp_id];
  1970			unsigned int value;
  1971	
  1972			if (!uclamp_reset(attr, clamp_id, uc_se))
  1973				continue;
  1974	
  1975			/*
  1976			 * RT by default have a 100% boost value that could be modified
  1977			 * at runtime.
  1978			 */
  1979			if (unlikely(rt_task(p) && clamp_id == UCLAMP_MIN))
  1980				value = sysctl_sched_uclamp_util_min_rt_default;
  1981			else
  1982				value = uclamp_none(clamp_id);
  1983	
  1984			uclamp_se_set(uc_se, value, false);
  1985			uclamp_updated = true;
  1986	
  1987		}
  1988	
  1989		if (likely(!(attr->sched_flags & SCHED_FLAG_UTIL_CLAMP)))
  1990			goto out;
  1991	
  1992		if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP_MIN &&
  1993		    attr->sched_util_min != -1) {
  1994			uclamp_updated = true;
  1995			uclamp_se_set(&p->uclamp_req[UCLAMP_MIN],
  1996				      attr->sched_util_min, true);
  1997		}
  1998	
  1999		if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP_MAX &&
  2000		    attr->sched_util_max != -1) {
  2001			uclamp_updated = true;
  2002			uclamp_se_set(&p->uclamp_req[UCLAMP_MAX],
  2003				      attr->sched_util_max, true);
  2004		}
  2005	
  2006	out:
  2007		if (uclamp_updated && task_on_rq_queued(p))
> 2008			update_misfit_status(p, task_rq(p));
  2009	}
  2010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
