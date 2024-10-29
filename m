Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E328201260
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 06:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730184471; cv=none; b=XC4o5cKNRDc0fFSeR9LdJoalmbvr0Kplj8O9p9txY8w2pJXIpWvHLP+hmnSMfA+piSSa5ThY7RebF+tISPNIYz3BnAOg8oOBJ9EBNc6hKFdTePrgU0c3CMd8CTaGV8c8c1LowlTXgcUN7uA/F7pE6aqdGTqC61z+CjXj0Hh398k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730184471; c=relaxed/simple;
	bh=TgkWS+7lN83UYaFBgoDe9ZXICGCgx/L/IeqO0Uf4emo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vhew2pWeqSAQ0t53piZF2Kv+skajAwtI/qFqvAkBRR6URPv71sGsFxXY2ArqxXna6JOzvcJEHCZOxl9a/duiuIF2itMF+JYxWRKyKcIJbiy3AVbgiFWu5XiLsLMMT6uiURDNfF2lxU+3SKmKbMuTIFtuhAHhYnX3xv1KJlI65Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmIY+9nC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmIY+9nC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730184470; x=1761720470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TgkWS+7lN83UYaFBgoDe9ZXICGCgx/L/IeqO0Uf4emo=;
  b=mmIY+9nCpn+PoXtARfv6CRcPmAo0BxEDT4GZ8Mn1CkXAdSnBL2ZONQve
   2PXJ8mQ62vK6gfV0S0mu+Sc4MqFoiaKrnTRGwG9AH9dOc3vD8VH2I4OrI
   TM4HUzwZ96fHlNgKgS+mE6T4bpbQk7MPdCSoVolvU6T/HyRJKsj2FLoXP
   ExTSIPMvlT++YpNrt518HQBukQVn0bLVVFfFsmDKkC8bHLwc5jzBDgZcD
   faDlWopfIA/Qi9lLw/10XYPc1jXc0a0zuMiN8f1Jb/1RQyi3pROBpphYw
   h5npe5gm12f98dYZerj4VjfQhwy+eXnvELBf0nmonXs4LZxOFzxSIVp+H
   Q==;
X-CSE-ConnectionGUID: O3hQSlQYSEmrAtrXDIWYhA==
X-CSE-MsgGUID: atFHy1YBQBO1H0PyWU+7kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33505605"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33505605"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 23:47:49 -0700
X-CSE-ConnectionGUID: +bPFI2IoQtCou4vn6FdsMA==
X-CSE-MsgGUID: gi82Ux3xTu6fw6MULl7g7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81763173"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Oct 2024 23:47:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5g10-000dLG-36;
	Tue, 29 Oct 2024 06:47:42 +0000
Date: Tue, 29 Oct 2024 14:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 43/98] kernel/taskstats.c:689:10: sparse: sparse:
 Initializer entry defined twice
Message-ID: <202410291435.jNWiJeSI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 4cbaa1e2bb00ef43d0b8b418d258bb00835d7cd8 [43/98] taskstats: expose taskstats to all netspace
config: x86_64-randconfig-123-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291435.jNWiJeSI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291435.jNWiJeSI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291435.jNWiJeSI-lkp@intel.com/

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
