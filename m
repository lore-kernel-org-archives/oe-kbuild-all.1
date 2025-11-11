Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280132594BD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 23:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762902697; cv=none; b=OF+g9aLwd8B4bui50xpWWEFqkEie13QIooqui6H9wz077YjK05Lcdp8v9g6QWh+JV9Ae7NkRCsVoX36bMW5kKOz+rugPDBKxbwymLf+wHk+EaAOiwJSj5X69EOqAsMGCFZQcOdV/kihH/SyiG/j6WAa15UqFOcCaDyOm+w88WrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762902697; c=relaxed/simple;
	bh=Pz+3KtgJc/6jwqm2oezFgOvMmA3LlOLXMI1/2mTYctY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NFakxTXqRdomuIlre8ci01S/0QGdOmC5Kh7CkGuyf6BR/fXQApUzdBE/GCajKyml3AwYcVsRkheLF1Ag8pKhbcP+YO3yJ5JBpnXUEHg83brMe5fuPLTwGPqTZuTVexorDeV64RyKO8GkPJ/qQVgVXBl4RoAfmxb2e3sJLUrX+1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/NTr7pZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/NTr7pZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762902695; x=1794438695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pz+3KtgJc/6jwqm2oezFgOvMmA3LlOLXMI1/2mTYctY=;
  b=O/NTr7pZdtuo/YjvlhQhXKeAGnOSs54t+9BVj5EVdBATE9Jo/TSYZB4Y
   0VjKDxrQBJbrgJSnWGTK19B2lGSCSbv6UmWKvrZ/bn4ZpWWdtLsvpRpEI
   NupvPdfiUkr8EG/Huj5Lcs+0asKFTk1GzewBPtM8OMkbQAIg2RaZg/LOm
   /MhUvAJnuzTF7Qc4L91HY95co5Hd7Yvq9JBOQbhn1NamKFHBaiagsjUjO
   qCiVyb0dZf5d4qEe7BnDHBlfc6GtWgCoXQH+67+08JxOQEtcACMmUmHjI
   85+4GaQQZCjjshXWu49AIAvDvyz+Wdjl00pJYKNob1D7uftjqtbGlnJ8f
   g==;
X-CSE-ConnectionGUID: Y2PBMaJ2Sd2It6MCsl2VyA==
X-CSE-MsgGUID: L3ANBr42SG+WCgrlGmuPIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68828101"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="68828101"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 15:11:34 -0800
X-CSE-ConnectionGUID: p+sZ8xLtRtKuSa5Ok+m/FA==
X-CSE-MsgGUID: EAYGB0ZvTDSRJHf0szjLbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="188367896"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Nov 2025 15:11:33 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIxWM-0003en-2c;
	Tue, 11 Nov 2025 23:11:30 +0000
Date: Wed, 12 Nov 2025 07:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] kernel/sched/fair.c:594:12:
 warning: 'task_is_idle' defined but not used
Message-ID: <202511120749.XDjZSDXW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6ca2bf518f7eb71ef5668b0e4468eb0fee530421
commit: d9bb2354cac8e185da5b0bf3d6ede6428e55b5b3 [11/11] anolis: sched: introduce finer-grained priorities within group identity using SCHED_IDLE
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251112/202511120749.XDjZSDXW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120749.XDjZSDXW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120749.XDjZSDXW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:2446:6: warning: no previous prototype for 'is_sys_aware_enabled' [-Wmissing-prototypes]
    2446 | bool is_sys_aware_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:2659:22: warning: no previous prototype for '__pick_first_entity' [-Wmissing-prototypes]
    2659 | struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
         |                      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'update_stats_wait_start':
   kernel/sched/fair.c:2960:42: warning: variable 'parent_wait_sum' set but not used [-Wunused-but-set-variable]
    2960 |         u64 wait_start, prev_wait_start, parent_wait_sum, delta;
         |                                          ^~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'update_stats_wait_end':
   kernel/sched/fair.c:2998:29: warning: variable 'wait_sibling_delta' set but not used [-Wunused-but-set-variable]
    2998 |         u64 wait_sum_delta, wait_sibling_delta;
         |                             ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:8244:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    8244 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b, struct cfs_bandwidth *parent) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:14933:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   14933 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:14935:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   14935 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:14940:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   14940 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:14942:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   14942 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:594:12: warning: 'task_is_idle' defined but not used [-Wunused-function]
     594 | static int task_is_idle(struct task_struct *p)
         |            ^~~~~~~~~~~~


vim +/task_is_idle +594 kernel/sched/fair.c

   593	
 > 594	static int task_is_idle(struct task_struct *p)
   595	{
   596		return 0;
   597	}
   598	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
