Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB51FCCEC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733146347; cv=none; b=XcWcaQLHardExKZmhY4b6Mz1xVD7bS/GxrCGfF6Ty5+/UZNRMzYKsndw3p6RBid0V5fwE+MJarMXjXRHfQXFQ20vVawka84Zc+d3OngbxBeSBgMfqMN2ieKJc9km+lukNZzPD28Dw8W5eJB/1BzH7bYc9yLOsW2EsaxDOVolSKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733146347; c=relaxed/simple;
	bh=cOdaeX+FblNpVKCP2dPiorDvGzkrwfC3myVuKOCMji4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0xZeKw45ISiWy2r0+oDeL30YwRNruRaQ7x3t+iQSTRnQ/TLgnT3mmif3nW9V2jpFIoO7Oxuc3xuV3diVBQidP0UPexxG7AyV6FADV4I+UNSoPGc/wuJnXGYhIi3nC+EjLGJ3pJS1Mn4ewOEK5kC+AVrCvN0eNAlOek6b4VQdDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUCgnsLj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUCgnsLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733146345; x=1764682345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cOdaeX+FblNpVKCP2dPiorDvGzkrwfC3myVuKOCMji4=;
  b=OUCgnsLjXjgaWib4e7G7FImKnU7Ozcby9tD5Rd5/q5maagOeYW51551T
   rsCZANUTBVM8QFv98NhuZQLSZ5r0QlghrH96WjeYAlR3Eu1EEk8iMN5cO
   QpMHirxh5KpCRFla0fe2eO9MFlWqHqaYrVdz1dNoc+u/0j4GzdI1mNWsn
   Y/UAPNXbdONLcO50UdWEpMkKoluinDt7ukP7Pvu6lImhL720igTu6ZLYU
   OBhm+6cRn0rxB6qpmW4oUWJQjYebCGRIXgTM4/Dc/hDwpYOwQq09+JKrT
   PkFE3nC5cGuj0hyZgu0ggBxKdKNYB6vB1Q1rqjYPbmt3c9H5SoQvXIZK9
   Q==;
X-CSE-ConnectionGUID: P3YoqSp7Sj6yUouLuRtRJA==
X-CSE-MsgGUID: Sn5dLk/EQ+6FrQ+vXXM7RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33235558"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="33235558"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 05:32:24 -0800
X-CSE-ConnectionGUID: rxOBIHr7Qq6qIoEeFuZeEA==
X-CSE-MsgGUID: edpNhfUCT6K86tXRWPKgSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="130584298"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Dec 2024 05:32:23 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI6XE-0002S3-1p;
	Mon, 02 Dec 2024 13:32:20 +0000
Date: Mon, 2 Dec 2024 21:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2417/2417] kernel/sched/core.c:8279:46: error:
 'TG_STEAL_NO' undeclared; did you mean 'PGSTEAL_ANON'?
Message-ID: <202412022133.n8HK8mnc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a1fd264a5653d0f3d66669ec3b88a99b929f8717
commit: b7772972a0a76efac27078392f3f706914fe2af7 [2417/2417] sched/core: Add cpu.steal_task in cgroup v1 cpu subsystem
config: x86_64-randconfig-071-20241112 (https://download.01.org/0day-ci/archive/20241202/202412022133.n8HK8mnc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412022133.n8HK8mnc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412022133.n8HK8mnc-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c:2750:6: warning: no previous prototype for 'sched_set_stop_task' [-Wmissing-prototypes]
    2750 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'sched_init':
   kernel/sched/core.c:8279:17: error: 'root_task_group' undeclared (first use in this function); did you mean 'task_group'?
    8279 |                 root_task_group.steal_task = TG_STEAL_NO;
         |                 ^~~~~~~~~~~~~~~
         |                 task_group
   kernel/sched/core.c:8279:17: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/sched/core.c:8279:46: error: 'TG_STEAL_NO' undeclared (first use in this function); did you mean 'PGSTEAL_ANON'?
    8279 |                 root_task_group.steal_task = TG_STEAL_NO;
         |                                              ^~~~~~~~~~~
         |                                              PGSTEAL_ANON


vim +8279 kernel/sched/core.c

  8253	
  8254		wait_bit_init();
  8255	
  8256	#ifdef CONFIG_FAIR_GROUP_SCHED
  8257		ptr += 2 * nr_cpu_ids * sizeof(void **);
  8258	#endif
  8259	#ifdef CONFIG_RT_GROUP_SCHED
  8260		ptr += 2 * nr_cpu_ids * sizeof(void **);
  8261	#endif
  8262		if (ptr) {
  8263			ptr = (unsigned long)kzalloc(ptr, GFP_NOWAIT);
  8264	
  8265	#ifdef CONFIG_FAIR_GROUP_SCHED
  8266			root_task_group.se = (struct sched_entity **)ptr;
  8267			ptr += nr_cpu_ids * sizeof(void **);
  8268	
  8269			root_task_group.cfs_rq = (struct cfs_rq **)ptr;
  8270			ptr += nr_cpu_ids * sizeof(void **);
  8271	
  8272			root_task_group.shares = ROOT_TASK_GROUP_LOAD;
  8273			init_cfs_bandwidth(&root_task_group.cfs_bandwidth);
  8274	#endif /* CONFIG_FAIR_GROUP_SCHED */
  8275	#ifdef CONFIG_QOS_SCHED_SMT_EXPELLER
  8276			root_task_group.smt_expell = TG_SMT_EXPELL;
  8277	#endif
  8278	#ifdef CONFIG_SCHED_STEAL
> 8279			root_task_group.steal_task = TG_STEAL_NO;
  8280	#endif
  8281	#ifdef CONFIG_RT_GROUP_SCHED
  8282			root_task_group.rt_se = (struct sched_rt_entity **)ptr;
  8283			ptr += nr_cpu_ids * sizeof(void **);
  8284	
  8285			root_task_group.rt_rq = (struct rt_rq **)ptr;
  8286			ptr += nr_cpu_ids * sizeof(void **);
  8287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
