Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22F3279DB6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 02:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500980; cv=none; b=FVc7Us0PKtKubkmW32M1eLwyOuqCPhxCl2R/ovhMuaBdgtCgkxP6TiimvhKqAcKsVVDWqtwh69wlzZ8hkgL8+ih14NX8E6N6h1Y0OejdADjFg6I5CpsdhD3uTiBflehzkgGz1XtC7oc5aVboQsfVwQHrudn7BUpGBfiH9D5MSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500980; c=relaxed/simple;
	bh=fyYoUxlKAZfol4VqE+n7WGQxdyf0E6jS7M5xNRpkRW8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H1WSukzL7MDJYe3MhVHE7bntBF9pEk7PN9nuSZ/uFeNwx1CkHt+Y2egPMVZnu3RJ1VxNvctSNHfIIM+JVEG+mkrB/p896XUto/rog9tN6FxuGNyDUC0zAtWFg/QULnibzqzxOA+/Abv0USVHgJzZi7h8pCtYIdBO/VA3czBKGho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJZdj4dX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJZdj4dX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786500978; x=1818036978;
  h=date:from:to:cc:subject:message-id;
  bh=fyYoUxlKAZfol4VqE+n7WGQxdyf0E6jS7M5xNRpkRW8=;
  b=VJZdj4dXAprTIpQ8GBObQ9ma46/ZCFE7znxjtFha1hCj/y/qbr/WfFnS
   Fe4PEApIFRCQ9Cm+uMA1DpSMNeXOtBDrLa1nXb7TJqwyNtRsZZPilVHGl
   nq8souhdkE+kj3K6C8SNthN4EHhuJDS56u/MWimr4RcsR+ud9VO6gnH17
   89bj8AD3whXFbewJ3RmVOTujmWdnILvh5Yas6/iMBZsNbt9p8KvcV+fWS
   ABy4Xzz9tTeK9KxCWMtguYRbcqpChxdvLe+drAAI3RuiBcnfrZ5xwjM7l
   fMAvaFWGyN56RtqIcx1bTjf1TdtsaGbLhdvI9Vz0iZ/IcD8S2tdi/IjR5
   g==;
X-CSE-ConnectionGUID: 6UQozaATTJmmlzI9Dz7HIQ==
X-CSE-MsgGUID: dKnSQKaiR9K+dYYWE/ZBTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87167886"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="87167886"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 19:16:16 -0700
X-CSE-ConnectionGUID: hQf32dB6SQiLBDV4sV0vig==
X-CSE-MsgGUID: Af4ABHfDTrWc3AEgpWAmBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="264090765"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Aug 2026 19:16:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtyVo-00000000Pf2-2NBp;
	Wed, 12 Aug 2026 02:16:12 +0000
Date: Wed, 12 Aug 2026 10:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>
Subject: [tj-wq:for-7.3 11/19] kernel/workqueue.c:5682:57: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202608120931.tvTzq1gD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Breno,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-7.3
head:   a5bde5d8fde8a8cb28e59a672d5ddc5b9c1e7656
commit: 79f23600bc7b13a35fd148131245c283d14604a8 [11/19] workqueue: factor out get_percpu_pool()
config: alpha-randconfig-r123-20260812 (https://download.01.org/0day-ci/archive/20260812/202608120931.tvTzq1gD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608120931.tvTzq1gD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608120931.tvTzq1gD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/workqueue.c:5676:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct pool_workqueue [noderef] __rcu *[noderef] __percpu *cpu_pwq @@     got struct pool_workqueue *[noderef] __percpu * @@
   kernel/workqueue.c:5676:21: sparse:     expected struct pool_workqueue [noderef] __rcu *[noderef] __percpu *cpu_pwq
   kernel/workqueue.c:5676:21: sparse:     got struct pool_workqueue *[noderef] __percpu *
>> kernel/workqueue.c:5682:57: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct pool_workqueue **pwq_p @@     got struct pool_workqueue [noderef] __rcu ** @@
   kernel/workqueue.c:5682:57: sparse:     expected struct pool_workqueue **pwq_p
   kernel/workqueue.c:5682:57: sparse:     got struct pool_workqueue [noderef] __rcu **
   kernel/workqueue.c:5719:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct pool_workqueue *pwq @@     got struct pool_workqueue [noderef] __rcu * @@
   kernel/workqueue.c:5719:54: sparse:     expected struct pool_workqueue *pwq
   kernel/workqueue.c:5719:54: sparse:     got struct pool_workqueue [noderef] __rcu *
   kernel/workqueue.c:6304:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct pool_workqueue *pwq @@     got struct pool_workqueue [noderef] __rcu * @@
   kernel/workqueue.c:6304:13: sparse:     expected struct pool_workqueue *pwq
   kernel/workqueue.c:6304:13: sparse:     got struct pool_workqueue [noderef] __rcu *

vim +5682 kernel/workqueue.c

  5668	
  5669	static int alloc_and_link_pwqs(struct workqueue_struct *wq)
  5670	{
  5671		bool highpri = wq->flags & WQ_HIGHPRI;
  5672		int cpu, ret;
  5673	
  5674		lockdep_assert_held(&wq_pool_mutex);
  5675	
  5676		wq->cpu_pwq = alloc_percpu(struct pool_workqueue *);
  5677		if (!wq->cpu_pwq)
  5678			goto enomem;
  5679	
  5680		if (!(wq->flags & WQ_UNBOUND)) {
  5681			for_each_possible_cpu(cpu) {
> 5682				struct pool_workqueue **pwq_p = per_cpu_ptr(wq->cpu_pwq, cpu);
  5683				struct worker_pool *pool = get_percpu_pool(wq, cpu);
  5684	
  5685				*pwq_p = kmem_cache_alloc_node(pwq_cache, GFP_KERNEL,
  5686							       pool->node);
  5687				if (!*pwq_p)
  5688					goto enomem;
  5689	
  5690				init_pwq(*pwq_p, wq, pool);
  5691	
  5692				mutex_lock(&wq->mutex);
  5693				link_pwq(*pwq_p);
  5694				mutex_unlock(&wq->mutex);
  5695			}
  5696			return 0;
  5697		}
  5698	
  5699		if (wq->flags & __WQ_ORDERED) {
  5700			struct pool_workqueue *dfl_pwq;
  5701	
  5702			ret = apply_workqueue_attrs_locked(wq, ordered_wq_attrs[highpri]);
  5703			/* there should only be single pwq for ordering guarantee */
  5704			dfl_pwq = rcu_access_pointer(wq->dfl_pwq);
  5705			WARN(!ret && (wq->pwqs.next != &dfl_pwq->pwqs_node ||
  5706				      wq->pwqs.prev != &dfl_pwq->pwqs_node),
  5707			     "ordering guarantee broken for workqueue %s\n", wq->name);
  5708		} else {
  5709			ret = apply_workqueue_attrs_locked(wq, unbound_std_wq_attrs[highpri]);
  5710		}
  5711	
  5712		if (ret)
  5713			goto enomem;
  5714		return 0;
  5715	
  5716	enomem:
  5717		if (wq->cpu_pwq) {
  5718			for_each_possible_cpu(cpu) {
  5719				struct pool_workqueue *pwq = *per_cpu_ptr(wq->cpu_pwq, cpu);
  5720	
  5721				if (pwq) {
  5722					/*
  5723					 * Unlink pwq from wq->pwqs since link_pwq()
  5724					 * may have already added it. wq->mutex is not
  5725					 * needed as the wq has not been published yet.
  5726					 */
  5727					if (!list_empty(&pwq->pwqs_node))
  5728						list_del_rcu(&pwq->pwqs_node);
  5729					kmem_cache_free(pwq_cache, pwq);
  5730				}
  5731			}
  5732			free_percpu(wq->cpu_pwq);
  5733			wq->cpu_pwq = NULL;
  5734		}
  5735		return -ENOMEM;
  5736	}
  5737	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
