Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8E159176
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 22:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710367568; cv=none; b=OvMeSCDUO97fyNFCnYl9d8R6BFCxpTM2zqeYlXY/sa0l7/QwIV3P13LOAmeDcdX4N9oRQgfO2jJQo3cHL1MGuveCPWnSpe4U1As0XOFsAURsyduRXb8rphjilHlZsm9fvalwCyXmmNHDJT26sd0b0ca6nuJQ5Q4/9AHBlsyX8eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710367568; c=relaxed/simple;
	bh=ow+tr0DoMyOO63PKa6DkEZQcIu53Di3Z1jKBMlRfFJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OyWcKG9itHYF2eyPvvLmeRxMrwDCIxwOMjdDN96ADhLCyVlgzKKoirzufMzsxiIDJfTpZGe8YJAyL18tQ4ZI4l8n6cGyv/Y0eQgvAbAgYwoOC6FVFof/yQkL/iGrq7xaCBpUprUjgd0p7qd74QroGUYF8Ks2qeEKYWPhROLPNaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9uROwqB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9uROwqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710367567; x=1741903567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ow+tr0DoMyOO63PKa6DkEZQcIu53Di3Z1jKBMlRfFJw=;
  b=L9uROwqB6mwA0WHZBYAB9MCp01truTl8apmb+HliHLUtfsuxcmUUcxtc
   oUvE/vdeR+DoBpJrCtWYBb1P9WC39EAJ1W4UtTDwcq4EqGgoevtpd+cHJ
   wD+Y4KiToHwCmu5xcK++0GzlAZUUpOvyMUCrJ7LN5ckACbgzVdW6FWuoM
   YwE5cCJpkeRR+RdFjt+3n8uOGtDEgMLLptEJamj0V/cDYhjtAjUlypVEy
   c6Y/dkzGO+NW8ycYduiaXcFpYXq4zp1RPDPTkpHN7F1iuYTUso8o3Ovv2
   5QuyDrgtkLPfz5s2EXAgpHzzjf7tFOijx9qFBJfZnGvi/xeZgzquC2aAc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5018119"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5018119"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 15:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="16667177"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2024 15:06:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkWja-000CnX-2f;
	Wed, 13 Mar 2024 22:06:02 +0000
Date: Thu, 14 Mar 2024 06:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19926/21854] block/blk-core.c:158:18:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202403140612.D8NswI2V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b318937609077b966b3bd130583ee3aaaa4d015a
commit: f39ebff66fab7eee91421258aa7254ee0bbac778 [19926/21854] block: support to dispatch bio asynchronously
config: x86_64-randconfig-r121-20240313 (https://download.01.org/0day-ci/archive/20240314/202403140612.D8NswI2V-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140612.D8NswI2V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140612.D8NswI2V-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-core.c:158:18: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct bio_dispatch_async_ctl [noderef] __percpu ** @@
   block/blk-core.c:158:18: sparse:     expected void const [noderef] __percpu *__vpp_verify
   block/blk-core.c:158:18: sparse:     got struct bio_dispatch_async_ctl [noderef] __percpu **
>> block/blk-core.c:158:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct bio_dispatch_async_ctl *ctl @@     got struct bio_dispatch_async_ctl [noderef] __percpu * @@
   block/blk-core.c:158:17: sparse:     expected struct bio_dispatch_async_ctl *ctl
   block/blk-core.c:158:17: sparse:     got struct bio_dispatch_async_ctl [noderef] __percpu *
   block/blk-core.c:222:18: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct bio_dispatch_async_ctl [noderef] __percpu ** @@
   block/blk-core.c:222:18: sparse:     expected void const [noderef] __percpu *__vpp_verify
   block/blk-core.c:222:18: sparse:     got struct bio_dispatch_async_ctl [noderef] __percpu **
   block/blk-core.c:222:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct bio_dispatch_async_ctl *ctl @@     got struct bio_dispatch_async_ctl [noderef] __percpu * @@
   block/blk-core.c:222:17: sparse:     expected struct bio_dispatch_async_ctl *ctl
   block/blk-core.c:222:17: sparse:     got struct bio_dispatch_async_ctl [noderef] __percpu *
>> block/blk-core.c:259:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bio_dispatch_async_ctl [noderef] __percpu **static [toplevel] bio_dispatch_async_ctl @@     got struct bio_dispatch_async_ctl *[noderef] __percpu * @@
   block/blk-core.c:259:32: sparse:     expected struct bio_dispatch_async_ctl [noderef] __percpu **static [toplevel] bio_dispatch_async_ctl
   block/blk-core.c:259:32: sparse:     got struct bio_dispatch_async_ctl *[noderef] __percpu *
   block/blk-core.c:269:18: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct bio_dispatch_async_ctl [noderef] __percpu ** @@
   block/blk-core.c:269:18: sparse:     expected void const [noderef] __percpu *__vpp_verify
   block/blk-core.c:269:18: sparse:     got struct bio_dispatch_async_ctl [noderef] __percpu **
>> block/blk-core.c:269:59: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bio_dispatch_async_ctl [noderef] __percpu * @@     got struct bio_dispatch_async_ctl *ctl @@
   block/blk-core.c:269:59: sparse:     expected struct bio_dispatch_async_ctl [noderef] __percpu *
   block/blk-core.c:269:59: sparse:     got struct bio_dispatch_async_ctl *ctl
   block/blk-core.c: note: in included file:
   include/linux/backing-dev.h:511:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:511:19: sparse:    struct rcu_device [noderef] __rcu *
   include/linux/backing-dev.h:511:19: sparse:    struct rcu_device *

vim +158 block/blk-core.c

   152	
   153	static int bio_dispatch_work(void *data)
   154	{
   155		int loop_count = 0;
   156		int cpu = smp_processor_id();
   157		struct bio_dispatch_async_ctl *ctl =
 > 158			*per_cpu_ptr(bio_dispatch_async_ctl, cpu);
   159	
   160		for (;; loop_count++) {
   161			struct bio_list bio_list_on_stack;
   162			struct blk_plug plug;
   163			struct bio *bio;
   164			int count;
   165	
   166			bio_list_init(&bio_list_on_stack);
   167			count = collect_bio(ctl, &bio_list_on_stack);
   168	
   169			if (!count) {
   170				DEFINE_WAIT(wait);
   171	
   172				for (;;) {
   173					prepare_to_wait(&ctl->wait, &wait,
   174							TASK_INTERRUPTIBLE);
   175					count = collect_bio(ctl, &bio_list_on_stack);
   176					if (count)
   177						break;
   178					schedule();
   179					loop_count = 0;
   180				}
   181				finish_wait(&ctl->wait, &wait);
   182	
   183			}
   184	
   185			blk_start_plug(&plug);
   186			while ((bio = bio_list_pop(&bio_list_on_stack))) {
   187				struct request_queue *q = bio->bi_disk->queue;
   188	
   189				q->make_request_fn(q, bio);
   190			}
   191			blk_finish_plug(&plug);
   192	
   193			/* prevent soft lockup */
   194			if (loop_count >= BIO_DISPATCH_MAX_LOOP) {
   195				loop_count = 0;
   196				cond_resched();
   197			}
   198		}
   199	
   200		return 0;
   201	}
   202	
   203	static int get_dispatch_cpu(struct request_queue *q, int cpu)
   204	{
   205		int *last_dispatch_cpu = per_cpu_ptr(q->last_dispatch_cpu, cpu);
   206	
   207		cpu = cpumask_next(*last_dispatch_cpu, &q->dispatch_async_cpus);
   208		if (cpu >= nr_cpu_ids)
   209			cpu = cpumask_first(&q->dispatch_async_cpus);
   210	
   211		*last_dispatch_cpu = cpu;
   212	
   213		return cpu;
   214	}
   215	
   216	static void blk_queue_make_request_async(struct bio *bio)
   217	{
   218		struct request_queue *q = bio->bi_disk->queue;
   219		int cpu = smp_processor_id();
   220		int dispatch_cpu = get_dispatch_cpu(q, cpu);
   221		struct bio_dispatch_async_ctl *ctl =
 > 222			*per_cpu_ptr(bio_dispatch_async_ctl, dispatch_cpu);
   223	
   224		spin_lock_irq(bio_async_lock(ctl, cpu));
   225		bio_list_add(bio_async_list(ctl, cpu), bio);
   226		spin_unlock_irq(bio_async_lock(ctl, cpu));
   227	
   228		if (wq_has_sleeper(&ctl->wait))
   229			wake_up(&ctl->wait);
   230	}
   231	
   232	static blk_qc_t blk_queue_do_make_request(struct bio *bio)
   233	{
   234		struct request_queue *q = bio->bi_disk->queue;
   235		int cpu = smp_processor_id();
   236	
   237		/*
   238		 * Don't dispatch bio asynchronously in following cases:
   239		 *
   240		 * 1) QUEUE_FLAG_DISPATCH_ASYNC is not set;
   241		 * 2) current cpu is the target cpu;
   242		 * 3) bio is flagged no wait;
   243		 * 4) TODO: return value of submit_bio() will be used in io polling.
   244		 */
   245		if (!test_bit(QUEUE_FLAG_DISPATCH_ASYNC, &q->queue_flags) ||
   246		    cpumask_test_cpu(cpu, &q->dispatch_async_cpus) ||
   247		    bio->bi_opf & REQ_NOWAIT)
   248			return q->make_request_fn(q, bio);
   249	
   250		/* return value is not concerned */
   251		blk_queue_make_request_async(bio);
   252		return BLK_QC_T_NONE;
   253	}
   254	
   255	static void init_blk_queue_async_dispatch(void)
   256	{
   257		int cpu;
   258	
 > 259		bio_dispatch_async_ctl = alloc_percpu(struct bio_dispatch_async_ctl *);
   260		if (!bio_dispatch_async_ctl)
   261			panic("Failed to alloc bio_dispatch_async_ctl\n");
   262	
   263		for_each_possible_cpu(cpu) {
   264			int i;
   265			struct bio_dispatch_async_ctl *ctl =
   266				kmalloc(sizeof(struct bio_dispatch_async_ctl),
   267					GFP_KERNEL | __GFP_NOFAIL);
   268	
 > 269			*per_cpu_ptr(bio_dispatch_async_ctl, cpu) = ctl;
   270	
   271			ctl->thread =
   272				kthread_create_on_cpu(bio_dispatch_work, NULL, cpu,
   273						      "bio_dispatch_work_%u");
   274			if (IS_ERR_OR_NULL(ctl->thread))
   275				panic("Failed to create bio dispatch thread\n");
   276	
   277			ctl->list = kmalloc_array(nr_cpu_ids,
   278					sizeof(struct bio_list) << BIO_ASYNC_LIST_SHIFT,
   279					GFP_KERNEL | __GFP_NOFAIL);
   280			ctl->lock = kmalloc_array(nr_cpu_ids,
   281					sizeof(spinlock_t) << BIO_ASYNC_LOCK_SHIFT,
   282					GFP_KERNEL | __GFP_NOFAIL);
   283			for (i = 0; i < nr_cpu_ids; ++i) {
   284				bio_list_init(bio_async_list(ctl, i));
   285				spin_lock_init(bio_async_lock(ctl, i));
   286			}
   287	
   288			wake_up_process(ctl->thread);
   289			init_waitqueue_head(&ctl->wait);
   290		}
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
