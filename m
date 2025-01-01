Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6115F10F1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 01:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735695823; cv=none; b=avlSw0eJ+CHOUG5IWHdKZYZA5MhPEkb33STGxbeZpmKVqKunzFfAoV0n0KebhgqF5JBOaum1FWpQiqZrE8o5SCqYmx1/K44+0xZlkHm6lXPqNJPx8Vj0CKc4XO9AKmn3YCH9c96XigmmgOn4E59n1dA71NQCrOQNAeDUQRbO16M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735695823; c=relaxed/simple;
	bh=rDyGLhO+b86ALcaou6zT6V0b1yhP/7P/ooysWhAdmkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BNHOrJYXIaYq4AuAmNx/54SglvpzjPoIWefmlLMYM/ypl6vpNQDW6lGJwYRtFm0xCuztzuucLbrVJzMX/bPUKwHyBcaHpZM5A9RbnzgQ5RbWpqXWUuZZFni0l5tJF1daWNspHt84Rg5j757yblCrQSd64H9JCu+jhKPvrWjneH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTv+k860; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTv+k860"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735695821; x=1767231821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rDyGLhO+b86ALcaou6zT6V0b1yhP/7P/ooysWhAdmkA=;
  b=eTv+k860EAq7XW8tR34eV5K2iYuE3L1NAnP2027HbEoL+Xopq4/UXeCu
   zroNOy7Va6M1O8rs5smUmEvm+NSMp1k5tr3QYZi8ehnhUMiFOYEa8V/6G
   Xm23/QtSuVlZAhWybNyAQv7qCv2HScWi78c8UGA8fSAhtJzaIyYdq7h/s
   z6Xs5qEmpy5tZNECbEt84rbH+42eeETR8wSpUMysTuLVm+iijEgUtDl/Z
   w2oTUYS5aI9dYVjM/TiCXA6hza5x3ff1ieljPgNviQkkN3N83IiSaTVra
   Jx8vHmmyHoe2if+Me17BaxeG9VLSpzVayQ6+SLX6kJRX8DyovjLCyPSKb
   Q==;
X-CSE-ConnectionGUID: 9sZq33NaTaeFiCkKuBk1tw==
X-CSE-MsgGUID: PP/Zcw+jQKu+4phqF8MKow==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35851008"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="35851008"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 17:43:41 -0800
X-CSE-ConnectionGUID: CjySpgI9SK2fxZKB4Aq04A==
X-CSE-MsgGUID: lEL5d9KCTo6IWnz8Emh5xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="101670752"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Dec 2024 17:43:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSnlp-0007ZC-1P;
	Wed, 01 Jan 2025 01:43:37 +0000
Date: Wed, 1 Jan 2025 09:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1682/1682] kernel/sched/fair.c:8325:23: error:
 implicit declaration of function 'sched_idle_cpu'; did you mean
 'sched_idle_rq'?
Message-ID: <202501010909.j7gDYmAD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1e531b8351b843cd4a160764c0f67e4c9805234d
commit: 926b9b0cd97e640ee680347cf449c3dc152dddd2 [1682/1682] sched: Throttle qos cfs_rq when current cpu is running online task
config: x86_64-randconfig-121-20250101 (https://download.01.org/0day-ci/archive/20250101/202501010909.j7gDYmAD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501010909.j7gDYmAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501010909.j7gDYmAD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from include/linux/cpumask.h:10,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'check_qos_cfs_rq':
>> kernel/sched/fair.c:8325:23: error: implicit declaration of function 'sched_idle_cpu'; did you mean 'sched_idle_rq'? [-Werror=implicit-function-declaration]
    8325 |                      !sched_idle_cpu(smp_processor_id()) &&
         |                       ^~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
>> kernel/sched/fair.c:8328:35: error: 'struct rq' has no member named 'online'
    8328 |                 if (!rq_of(cfs_rq)->online)
         |                                   ^~
   kernel/sched/fair.c: In function 'pick_next_task_fair':
>> kernel/sched/fair.c:8531:19: error: 'struct rq' has no member named 'idle_stamp'
    8531 |                 rq->idle_stamp = 0;
         |                   ^~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:8166:13: warning: 'start_qos_hrtimer' used but never defined
    8166 | static void start_qos_hrtimer(int cpu);
         |             ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +8325 kernel/sched/fair.c

  8321	
  8322	static bool check_qos_cfs_rq(struct cfs_rq *cfs_rq)
  8323	{
  8324		if (unlikely(cfs_rq && cfs_rq->tg->qos_level < 0 &&
> 8325			     !sched_idle_cpu(smp_processor_id()) &&
  8326			     cfs_rq->h_nr_running == cfs_rq->idle_h_nr_running)) {
  8327	
> 8328			if (!rq_of(cfs_rq)->online)
  8329				return false;
  8330	
  8331			throttle_qos_cfs_rq(cfs_rq);
  8332			return true;
  8333		}
  8334	
  8335		return false;
  8336	}
  8337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
