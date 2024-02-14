Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B4A18037
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 10:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707907671; cv=none; b=mPzwN23I5MUEX12yXXqKgfYaLDAifWK+fxc0D9ODFPMfANcFuShXVYyBT/qR1+aj8HHoDpfVTwl2RpDgCLwXA8iHIDVlbHL1zQ2z7bNOM9LD/kqofw09HOCfKJKiqlv8wrXaKUoLOPCjvL56lMOWqAIIj8jZq4GZk4fPztfJpb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707907671; c=relaxed/simple;
	bh=JMa7Zk7FMc4ZUi31kwU6/F3iN3kcP3J3lWytkXPovFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5xBc44BhXeScJxtbohVy9cxTTPtGwpRfSnOs1e/d5lEVPmR2m++xPm4jrP4SzB+pc3ttr9CzJxtaxWAIpHy4jr64nZaMkvlfDE1xr1GT7mbE+aY7ZQ9Fr8Pw/hCLVsaEVbYlX4rJ2XXmdCxQoVGKzlmyvgrO1ra/8Btx8iUEhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0VcMA09; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0VcMA09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707907670; x=1739443670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JMa7Zk7FMc4ZUi31kwU6/F3iN3kcP3J3lWytkXPovFM=;
  b=S0VcMA091EfTxXcdnjhxIzjlE45IGut3GiSzD2mg72xuFQ6j6OLMavR+
   NOhkKNSRZkh6lQXsX5I58veLXQQ99SuvwKjmEwAZXexcpSv9gzUDCXtY5
   Tu/dMIl+ASJeqfsQKvHcuN+8aHZ9vBziQYTp+LT/jlB7ThS9nl8KgXJzE
   YLG9KTnhoxsw+7eQhygps8X6m48jfWv47WIvlXve7yVRm4S+YjvdBXSQl
   u5Ns4SuRGHs9W5cBBLH8Yzi/18G4Ikj+zyTlWC0E4OcBv759DYFY85wkL
   gi+BKU6zmOR0+ZCJss4nnjmeub7GvnpHYMtIUTj3QJnzr8JHXDmboYfHO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1853931"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1853931"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 02:47:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3132230"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Feb 2024 02:47:48 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raCnp-0008gS-2T;
	Wed, 14 Feb 2024 10:47:45 +0000
Date: Wed, 14 Feb 2024 18:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 16/38] kernel/sched/fair_eevdf.c:11601:6:
 warning: no previous prototype for 'task_vruntime_update'
Message-ID: <202402141802.ttXArXB1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   efd81cb7bd74278826232f0556137a71fb757350
commit: e865e3abb45cea830f107c69a227ed07b28c0b43 [16/38] CHROMIUM: sched/eevdf: Adding fair_eevdf.c
config: i386-randconfig-014-20240214 (https://download.01.org/0day-ci/archive/20240214/202402141802.ttXArXB1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141802.ttXArXB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141802.ttXArXB1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair_eevdf.c: In function 'update_curr_se':
   kernel/sched/fair_eevdf.c:845:42: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     845 |                 struct sched_statistics *stats;
         |                                          ^~~~~
   kernel/sched/fair_eevdf.c: In function 'update_stats_wait_start':
   kernel/sched/fair_eevdf.c:912:34: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     912 |         struct sched_statistics *stats;
         |                                  ^~~~~
   kernel/sched/fair_eevdf.c: In function 'update_stats_wait_end':
   kernel/sched/fair_eevdf.c:932:34: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     932 |         struct sched_statistics *stats;
         |                                  ^~~~~
   kernel/sched/fair_eevdf.c: In function 'update_stats_enqueue_sleeper':
   kernel/sched/fair_eevdf.c:976:34: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     976 |         struct sched_statistics *stats;
         |                                  ^~~~~
   kernel/sched/fair_eevdf.c: In function 'set_next_entity':
   kernel/sched/fair_eevdf.c:4732:42: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    4732 |                 struct sched_statistics *stats;
         |                                          ^~~~~
   kernel/sched/fair_eevdf.c: At top level:
>> kernel/sched/fair_eevdf.c:11601:6: warning: no previous prototype for 'task_vruntime_update' [-Wmissing-prototypes]
   11601 | void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/task_vruntime_update +11601 kernel/sched/fair_eevdf.c

 11600	
 11601	void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
 11602	{
 11603		struct sched_entity *se = &p->se;
 11604	
 11605		if (p->sched_class != &fair_sched_class)
 11606			return;
 11607	
 11608		se_fi_update(se, rq->core->core_forceidle_seq, in_fi);
 11609	}
 11610	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
