Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44EFBE5E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 02:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765591587; cv=none; b=VJI+aySm3EphzVb5ifhjZP9pcWorODJY/X8XmInwJGsegF3YOZgWIkGx5a6qjxRoW7pNGo/bPpOvYA9wN6MS67Cb6WGx0lDlASfsbHvmaCQnvYBoULn25Q2BNLljzCO78XEoVOqWr1okHPyNMmrZ5JyjDdrokv3mN08pjb9FhZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765591587; c=relaxed/simple;
	bh=qpXdgyrJG/MkRAUtU2Z1pZDnvfTqArrn6NbLOWD/2Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ObIKTUlyXM52ZQJXKRn9skB59lkyuPWXaQEiSiRyQAe3OAo8CVDuKgC0ELfoRqMxM05vVKWbxWIKZUlV8zAC8tYkmMtwxBpmsrCg9XkafwoI0W91KIbTi5B2suo5JaWPmgG19KOM89+NEcgcKzGWsC2C6yjIPQOYTohzk0SK2y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzbVopun; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzbVopun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765591585; x=1797127585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qpXdgyrJG/MkRAUtU2Z1pZDnvfTqArrn6NbLOWD/2Qo=;
  b=kzbVopunLswtxhTtAHSiaqN1fPr4A8PcGL7rbiko+QjCiyc1NFdX01wS
   n8zaj8A4MasJzKDNbC20EPcSqekymDXKEmKGKf321smAup66oRjfDtKpN
   oEnuUGsJKspkBNuyhb5yJguJ0lvFvICwpDvPMpgy2kpWuZPKxLhyM6rek
   czZpocY87YiaTXukT1Kqi8GxcXIU6gcn7N2sytau00MKWRLcUovW/ySug
   KHqbtkOPZJGBO8gL8IAvCVTgXlBBY/srrp0E55ZK3wMaJvhqkLxEt1ER0
   +erHiBFQt01DF4PhMl0a7YFV4BGPb+TpOwkz36S7Q5SjnDSDFZ25EUcmP
   g==;
X-CSE-ConnectionGUID: GNASqRmASd2m94l61r1rCg==
X-CSE-MsgGUID: 40rx4MxKROm6oiwnmDaupA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85002888"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85002888"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 18:06:24 -0800
X-CSE-ConnectionGUID: UZ302h/jSeepvJ1AP5Ic5Q==
X-CSE-MsgGUID: vXP47E6MRX2IDUD2sCM4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="227890778"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2025 18:06:24 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUF1Z-000000001v6-1DuS;
	Sat, 13 Dec 2025 02:06:21 +0000
Date: Sat, 13 Dec 2025 03:05:47 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] kernel/sched/isolation.c:323:6:
 warning: no previous prototype for 'update_wilds_cpumask'
Message-ID: <202512130317.z91zLuhV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: 5814c67f4b329028e1062bc374604613b20c624c [50/50] anolis: sched/isolation: dynamical CPU isolation support
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512130317.z91zLuhV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130317.z91zLuhV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130317.z91zLuhV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:105:
>> kernel/sched/isolation.c:323:6: warning: no previous prototype for 'update_wilds_cpumask' [-Wmissing-prototypes]
     323 | void update_wilds_cpumask(cpumask_var_t new_allowed, cpumask_var_t old_allowed)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/update_wilds_cpumask +323 kernel/sched/isolation.c

   322	
 > 323	void update_wilds_cpumask(cpumask_var_t new_allowed, cpumask_var_t old_allowed)
   324	{
   325		struct css_task_iter it;
   326		struct task_struct *task;
   327		struct task_group *tg = &root_task_group;
   328	
   329		css_task_iter_start(&tg->css, 0, &it);
   330		while ((task = css_task_iter_next(&it))) {
   331			if (task->flags & PF_KTHREAD)
   332				continue;
   333	
   334			if (!cpumask_equal(task->cpus_ptr, old_allowed))
   335				continue;
   336	
   337			set_cpus_allowed_ptr(task, new_allowed);
   338		}
   339		css_task_iter_end(&it);
   340	}
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
