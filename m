Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABCC249EE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707071560; cv=none; b=N+9WVFX5v8a7aLnoroZAW4NVfF+KeOzmVpsIq7Cwv7DRzxBwTg69Q5Z4snJ5hbN4PRrllrjfOuk3H+BQSXVRxDpKwvSKHOCA1utVvlWAbyw7uDSijlpTsuuLQmyB1ssViTD0dvA+IkUlQiShcgoOlznXrPeQfZvBFWe892m/5Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707071560; c=relaxed/simple;
	bh=OdrYR/4lac8Otue6qn2pOeudBNBEFsdiy53g7QIz39w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lw/QHA9+picAQc7ZsZ1kor6Css4AYGftxBTLhMLm+mbP3WSl2wZyVSMpgkZdT9bBK50lsnQjiG2nq+MF0hE+dxtE4khbgtR4DjxR4kfZvYAHVIRUctWsuoNu0TlEQzXtYqUGC49BAEMouhg2q3JKrOnYvS5tIEzcYWqAASTTGus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LegMIa7c; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LegMIa7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707071558; x=1738607558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OdrYR/4lac8Otue6qn2pOeudBNBEFsdiy53g7QIz39w=;
  b=LegMIa7cuuqc0J3doLj2ucCywzs9ETEj+QRchP0pOf4U2UPG6OXxJ+yy
   d6S5RFGldV/fwb9mXv7bzoKpK8g7R9kQuuapH/AvHUCCZTCzv7VrrABlZ
   kVgGigb4I2iGWQHAP0N61lZMY+65IoMuWIyeWsmBTO29LJjxiCN7rFw/Q
   rLkjsAwMjlxWlwixpXC+jGnyBAju+nHyAQZMPZR2iWUCLu58WzXP93keW
   fn+z0Iw4viMUfN91nE41l0tga2aprBATKy3LCc8xffuiVNpIbcz3A4g7o
   nNyavj/USWQh0ALuGEnJokv17YrzDAUxd7UPVED1RFC0ywYsVM8jq9pwQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="657914"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="657914"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 10:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="37957387"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Feb 2024 10:32:37 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWhIA-0006ci-0X;
	Sun, 04 Feb 2024 18:32:34 +0000
Date: Mon, 5 Feb 2024 02:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-wq:wq-bh-v1 26/31] kernel/workqueue.c:1217:25: error: implicit
 declaration of function 'raise_softirq_irqoff'
Message-ID: <202402050253.WvWDIaIh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git wq-bh-v1
head:   3af70c858c44623c77be759d0809b7ae8ff09b26
commit: aec8a645378b508d17c2286276451d85d74bf1ec [26/31] workqueue: Implement BH workqueues to eventually replace tasklets
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240205/202402050253.WvWDIaIh-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402050253.WvWDIaIh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050253.WvWDIaIh-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/workqueue.c: In function 'kick_pool':
>> kernel/workqueue.c:1217:25: error: implicit declaration of function 'raise_softirq_irqoff' [-Werror=implicit-function-declaration]
    1217 |                         raise_softirq_irqoff(HI_SOFTIRQ);
         |                         ^~~~~~~~~~~~~~~~~~~~
>> kernel/workqueue.c:1217:46: error: 'HI_SOFTIRQ' undeclared (first use in this function)
    1217 |                         raise_softirq_irqoff(HI_SOFTIRQ);
         |                                              ^~~~~~~~~~
   kernel/workqueue.c:1217:46: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/workqueue.c:1219:46: error: 'TASKLET_SOFTIRQ' undeclared (first use in this function)
    1219 |                         raise_softirq_irqoff(TASKLET_SOFTIRQ);
         |                                              ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/raise_softirq_irqoff +1217 kernel/workqueue.c

  1197	
  1198	/**
  1199	 * kick_pool - wake up an idle worker if necessary
  1200	 * @pool: pool to kick
  1201	 *
  1202	 * @pool may have pending work items. Wake up worker if necessary. Returns
  1203	 * whether a worker was woken up.
  1204	 */
  1205	static bool kick_pool(struct worker_pool *pool)
  1206	{
  1207		struct worker *worker = first_idle_worker(pool);
  1208		struct task_struct *p;
  1209	
  1210		lockdep_assert_held(&pool->lock);
  1211	
  1212		if (!need_more_worker(pool) || !worker)
  1213			return false;
  1214	
  1215		if (pool->flags & POOL_BH) {
  1216			if (pool->attrs->nice == HIGHPRI_NICE_LEVEL)
> 1217				raise_softirq_irqoff(HI_SOFTIRQ);
  1218			else
> 1219				raise_softirq_irqoff(TASKLET_SOFTIRQ);
  1220			return true;
  1221		}
  1222	
  1223		p = worker->task;
  1224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
