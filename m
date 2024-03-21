Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFCB6FBF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 04:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710995927; cv=none; b=U82hLO1gToq8g6WV2wSaGlY66L3WIOCszLqGFj7lepcYoj6ATrgVnHZGRuxOex4vN0CZ0MU7Fz7rsGgCMjm531Uw1iej9+76XWacjgVP48Z7AgDX2kxuu9kW75Srgbba7YIGoH2OGjBX2ntI5SGk916TyhAAtn/KgJ2Z/0f3ahw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710995927; c=relaxed/simple;
	bh=DdgKS1HmncAg7slU4rtsdAhPSe86Pob+LRzoMOGEHak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b6nej+kBWX6HMnFQse7KV93cBTh/FDh+8eLlgDbfmKed2i1dNxWgzdn/BAlow33+B/f3FUmCRdwFc/ogpIZjaDVeOkP+vH7kQZdM1G/C+ANCGC8ml8VScBbQTyWNsRU+anehEqcDRJxOwNOmyEujXjhXswI9GNvh/t4RFpf6cTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bidiS6CM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bidiS6CM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710995925; x=1742531925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DdgKS1HmncAg7slU4rtsdAhPSe86Pob+LRzoMOGEHak=;
  b=bidiS6CMnyrLnrxAjFVeIrINwN/UL6l3RCmiGDgbNvokls6jUiPDEfL2
   cELZ4ssllWgVT8aXFOQR5anG948r5yDU8EtSCXLsJsBaHeQ54s0ceLHnO
   gDXqZLR7Jr3b6NY+GWrw3XfU1xM53Dbs8lhpTUq53iowBvkTTnXN8586o
   Mj2R//dzwmdXqAZuFDg9ePS52OfQuRc64OyVYBDZXQEE74t396J1x5m3W
   P/R1cSot0Uv+yb2AZ2VvrydkBQn6vAuYDFn+zksft+avHU8h3YfAuoKvv
   s/A+liJq4qYeMCAhyIOOR0823hIKw2nsKnOo2r/GUlTcxRtyxfLWvaOAH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="23414623"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="23414623"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 21:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="14282057"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Mar 2024 21:38:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnACF-000JAZ-0k;
	Thu, 21 Mar 2024 04:38:31 +0000
Date: Thu, 21 Mar 2024 12:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 43/98] kernel/taskstats.c:689:10: sparse: sparse:
 Initializer entry defined twice
Message-ID: <202403211211.MspCXqM9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   0e60964981e6e5a5f6588e411e38264820ad522f
commit: 4cbaa1e2bb00ef43d0b8b418d258bb00835d7cd8 [43/98] taskstats: expose taskstats to all netspace
config: x86_64-randconfig-122-20240321 (https://download.01.org/0day-ci/archive/20240321/202403211211.MspCXqM9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403211211.MspCXqM9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403211211.MspCXqM9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/taskstats.c:280:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/taskstats.c:280:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/taskstats.c:280:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/taskstats.c:292:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/taskstats.c:292:36: sparse:     expected struct spinlock [usertype] *lock
   kernel/taskstats.c:292:36: sparse:     got struct spinlock [noderef] __rcu *
   kernel/taskstats.c:585:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/taskstats.c:585:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/taskstats.c:585:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/taskstats.c:596:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/taskstats.c:596:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/taskstats.c:596:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/taskstats.c: note: in included file (through include/linux/taskstats_kern.h):
   include/linux/sched/signal.h:761:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:761:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:761:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/taskstats.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, include/linux/taskstats_kern.h):
   include/linux/rcupdate.h:778:9: sparse: sparse: context imbalance in 'fill_stats_for_tgid' - different lock contexts for basic block
>> kernel/taskstats.c:689:10: sparse: sparse: Initializer entry defined twice
   kernel/taskstats.c:693:10: sparse:   also defined here

vim +689 kernel/taskstats.c

   571	
   572	static struct taskstats *taskstats_tgid_alloc(struct task_struct *tsk)
   573	{
   574		struct signal_struct *sig = tsk->signal;
   575		struct taskstats *stats_new, *stats;
   576	
   577		/* Pairs with smp_store_release() below. */
   578		stats = smp_load_acquire(&sig->stats);
   579		if (stats || thread_group_empty(tsk))
   580			return stats;
   581	
   582		/* No problem if kmem_cache_zalloc() fails */
   583		stats_new = kmem_cache_zalloc(taskstats_cache, GFP_KERNEL);
   584	
   585		spin_lock_irq(&tsk->sighand->siglock);
   586		stats = sig->stats;
   587		if (!stats) {
   588			/*
   589			 * Pairs with smp_store_release() above and order the
   590			 * kmem_cache_zalloc().
   591			 */
   592			smp_store_release(&sig->stats, stats_new);
   593			stats = stats_new;
   594			stats_new = NULL;
   595		}
 > 596		spin_unlock_irq(&tsk->sighand->siglock);
   597	
   598		if (stats_new)
   599			kmem_cache_free(taskstats_cache, stats_new);
   600	
   601		return stats;
   602	}
   603	
   604	/* Send pid data out on exit */
   605	void taskstats_exit(struct task_struct *tsk, int group_dead)
   606	{
   607		int rc;
   608		struct listener_list *listeners;
   609		struct taskstats *stats;
   610		struct sk_buff *rep_skb;
   611		size_t size;
   612		int is_thread_group;
   613	
   614		if (!family_registered)
   615			return;
   616	
   617		/*
   618		 * Size includes space for nested attributes
   619		 */
   620		size = taskstats_packet_size();
   621	
   622		is_thread_group = !!taskstats_tgid_alloc(tsk);
   623		if (is_thread_group) {
   624			/* PID + STATS + TGID + STATS */
   625			size = 2 * size;
   626			/* fill the tsk->signal->stats structure */
   627			fill_tgid_exit(tsk);
   628		}
   629	
   630		listeners = raw_cpu_ptr(&listener_array);
   631		if (list_empty(&listeners->list))
   632			return;
   633	
   634		rc = prepare_reply(NULL, TASKSTATS_CMD_NEW, &rep_skb, size);
   635		if (rc < 0)
   636			return;
   637	
   638		stats = mk_reply(rep_skb, TASKSTATS_TYPE_PID,
   639				 task_pid_nr_ns(tsk, &init_pid_ns));
   640		if (!stats)
   641			goto err;
   642	
   643		fill_stats(&init_user_ns, &init_pid_ns, tsk, stats);
   644		if (group_dead)
   645			stats->ac_flag |= AGROUP;
   646	
   647		/*
   648		 * Doesn't matter if tsk is the leader or the last group member leaving
   649		 */
   650		if (!is_thread_group || !group_dead)
   651			goto send;
   652	
   653		stats = mk_reply(rep_skb, TASKSTATS_TYPE_TGID,
   654				 task_tgid_nr_ns(tsk, &init_pid_ns));
   655		if (!stats)
   656			goto err;
   657	
   658		memcpy(stats, tsk->signal->stats, sizeof(*stats));
   659	
   660	send:
   661		send_cpu_listeners(rep_skb, listeners);
   662		return;
   663	err:
   664		nlmsg_free(rep_skb);
   665	}
   666	
   667	static const struct genl_ops taskstats_ops[] = {
   668		{
   669			.cmd		= TASKSTATS_CMD_GET,
   670			.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
   671			.doit		= taskstats_user_cmd,
   672			.policy		= taskstats_cmd_get_policy,
   673			.maxattr	= ARRAY_SIZE(taskstats_cmd_get_policy) - 1,
   674			.flags		= GENL_ADMIN_PERM,
   675		},
   676		{
   677			.cmd		= CGROUPSTATS_CMD_GET,
   678			.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
   679			.doit		= cgroupstats_user_cmd,
   680			.policy		= cgroupstats_cmd_get_policy,
   681			.maxattr	= ARRAY_SIZE(cgroupstats_cmd_get_policy) - 1,
   682		},
   683	};
   684	
   685	static struct genl_family family __ro_after_init = {
   686		.name		= TASKSTATS_GENL_NAME,
   687		.version	= TASKSTATS_GENL_VERSION,
   688		.module		= THIS_MODULE,
 > 689		.netnsok	= true,
   690		.ops		= taskstats_ops,
   691		.n_ops		= ARRAY_SIZE(taskstats_ops),
   692		.resv_start_op	= CGROUPSTATS_CMD_GET + 1,
   693		.netnsok	= true,
   694	};
   695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
