Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F0B1EE7D5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 19:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752780446; cv=none; b=DS+9oow8+WXPm8+qVwiNeNa85PnAD50YHKcQBBNyPEBb/FE9zGJJU3aHSQtawEGxoMuXAG30zhBHYuoFnzOsURXlOWhINE0nkTWQ61+f2xpT5C/GfPCGtc4liXF3wWctn4fVnt1SWkkYmqvMmSAE2dsgSKDv/stNV8R9wbAZVkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752780446; c=relaxed/simple;
	bh=JYDdFYyZNrLRbjEseHog0JSVWVn8+OCUYX25F6Vd+og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cnheMUao/sfLfw6c//LyohJzeZ/TmLmO8rUVz6oGuZlSc5WvOowTgsGmA5B7DjCEhHruQig0szn6XH+AlmdUUgjMqOBynkSwF/hRP5IePkBa/kB0BzCjMhULnRn7DwlqnP8e0tx0gkLhJggHsOl0dLobLVX2kxtfFCdDQn+g3vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QO8E5Scd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QO8E5Scd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752780445; x=1784316445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JYDdFYyZNrLRbjEseHog0JSVWVn8+OCUYX25F6Vd+og=;
  b=QO8E5ScdijkSVzmjSRECSAoR0G/N7cjxMK4N4nQML7D1w+R25OEiQRbN
   LkOF69kieanZlwQiMjTl7o7qCtsSMs3VzmJpQZi70TKANRHx+hFZVTheJ
   5DDYOtJRcmfxiY9wFLVVFb+oIzlJNYGvDr3Fa7DHbUGjVaX0u7PvIsq8N
   UP50dGwb3a3WJRqnBjGb0/D917rUWCKIOEgcKwmzPa7IsoTKX305AVw3e
   plY4TtliUdWq1xRW95sFatjzKuSf2hJXtATzBDQru8scV5Ta72/3jh/4y
   A8NOs+NZDCYrudRYawM3ADZe3ShNEOLO7TyXH4JHSWL1WkyvzjDM559+G
   g==;
X-CSE-ConnectionGUID: Hv2zFIOlTNCWtxqSP44TpQ==
X-CSE-MsgGUID: O4yjN00zQVOQ8W+9ctyF8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55157394"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55157394"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 12:27:24 -0700
X-CSE-ConnectionGUID: xpvYzWPBSKqN0zXCXe/mMQ==
X-CSE-MsgGUID: 9v72tZ7GTEGGqkHpicQ4GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="157954653"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jul 2025 12:27:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucUGG-000Dxn-1S;
	Thu, 17 Jul 2025 19:27:20 +0000
Date: Fri, 18 Jul 2025 03:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core-v2 28/29]
 net/netfilter/ipvs/ip_vs_est.c:268:17: error: 'struct netns_ipvs' has no
 member named 'est_cpulist_valid'
Message-ID: <202507180329.JOOeBGz2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core-v2
head:   57ab96f90be8847755ecda5bbeb0b543dcf20c31
commit: 7920bc02f66b60a497ceda531babe77b2aad9882 [28/29] ipvs: Fix estimator kthreads preferred affinity
config: i386-buildonly-randconfig-001-20250718 (https://download.01.org/0day-ci/archive/20250718/202507180329.JOOeBGz2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180329.JOOeBGz2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180329.JOOeBGz2-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/netfilter/ipvs/ip_vs_est.c: In function 'ip_vs_est_kthread_start':
>> net/netfilter/ipvs/ip_vs_est.c:268:17: error: 'struct netns_ipvs' has no member named 'est_cpulist_valid'
     268 |         if (ipvs->est_cpulist_valid)
         |                 ^~
>> net/netfilter/ipvs/ip_vs_est.c:269:56: error: 'struct netns_ipvs' has no member named 'sysctl_est_cpulist'
     269 |                 kthread_affine_preferred(kd->task, ipvs->sysctl_est_cpulist);
         |                                                        ^~


vim +268 net/netfilter/ipvs/ip_vs_est.c

   241	
   242	/* Start kthread task with current configuration */
   243	int ip_vs_est_kthread_start(struct netns_ipvs *ipvs,
   244				    struct ip_vs_est_kt_data *kd)
   245	{
   246		unsigned long now;
   247		int ret = 0;
   248		long gap;
   249	
   250		lockdep_assert_held(&ipvs->est_mutex);
   251	
   252		if (kd->task)
   253			goto out;
   254		now = jiffies;
   255		gap = kd->est_timer - now;
   256		/* Sync est_timer if task is starting later */
   257		if (abs(gap) > 4 * IPVS_EST_TICK)
   258			kd->est_timer = now;
   259		kd->task = kthread_create(ip_vs_estimation_kthread, kd, "ipvs-e:%d:%d",
   260					  ipvs->gen, kd->id);
   261		if (IS_ERR(kd->task)) {
   262			ret = PTR_ERR(kd->task);
   263			kd->task = NULL;
   264			goto out;
   265		}
   266	
   267		set_user_nice(kd->task, sysctl_est_nice(ipvs));
 > 268		if (ipvs->est_cpulist_valid)
 > 269			kthread_affine_preferred(kd->task, ipvs->sysctl_est_cpulist);
   270	
   271		pr_info("starting estimator thread %d...\n", kd->id);
   272		wake_up_process(kd->task);
   273	
   274	out:
   275		return ret;
   276	}
   277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
