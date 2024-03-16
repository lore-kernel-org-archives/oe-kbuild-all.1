Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E663746E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 06:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710569622; cv=none; b=enovsgmUCwfCtotPcjDpx7RdAPlDG0a1jnLoeFew7W6sDbmtInap+NTv8wvIikLZGB7yv9nOXcDQ2oRC1eGkd/vCQAb6hs4TGVoJICnOGYWq7ETTZPtFUBQLKoki3bfjYQMs2tf5YR8eM9VrIIaopLr4b7o+sZvltQpLYTFVfKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710569622; c=relaxed/simple;
	bh=oAW0j0r63lQ7Gff5olofNacGfbjuG2F2CHI+sn7h6fc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kwd8MOpwUqTIB8lIdkxNHBt53JW8JOZbis47z1H19sv8LaG2XOp/14kdrD7Uy2sbse4AF3TvjzF2aMII/0kEEaZHLRvmU9ymZwF/Vepw548ZDKZeEwrs1HpQmbzkr3JHyo/cckOPfqpeR/XpBD6IOCB/4H8TndQzPfRYLdF7aAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRqPj13G; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRqPj13G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710569620; x=1742105620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oAW0j0r63lQ7Gff5olofNacGfbjuG2F2CHI+sn7h6fc=;
  b=jRqPj13GXjmHsyk+y8trVW7HligEOwVPVhC0kiHen9pULYaFa2/bowzx
   tP2Qqw3T2RHKGAbKICqsg+OKZxg3433yHTsFA5BrVIdrkgkMHA9beslT2
   unEvUoWU/Ly81B2b1i5QhDdPapcUAAp+snecdQr7O0fRKhpQ670W1ncZl
   KjHvPjsWQxufsqyyf0/jOvskZaA4J1PXPwWQimgAfz64HuqbEMF3aWCIY
   RMUbKD5NdLvGNDpd8Tqi36fU93Q/NxQIdVP3cW7w/37fCs2815ULs8xno
   v2z11tDu0DnNPKqFVpbL+cs7TQUDr/9yv7v8yasXV5r4jJDGj4El2tGDy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5581151"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5581151"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 23:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="17584859"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Mar 2024 23:13:36 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlNIT-000F7V-23;
	Sat, 16 Mar 2024 06:13:33 +0000
Date: Sat, 16 Mar 2024 14:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26595/27507]
 kernel/sched/batch.c:481:54: error: 'struct rq' has no member named
 'bt_tasks'
Message-ID: <202403161458.XogvK6hU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: a895ccfc667d1c453568f44e4a9679f22b305ff9 [26595/27507] rue/cpu: Add load balance support for SCHED_BT
config: x86_64-randconfig-r053-20240315 (https://download.01.org/0day-ci/archive/20240316/202403161458.XogvK6hU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161458.XogvK6hU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161458.XogvK6hU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/sched/batch.c:141:25: warning: no previous prototype for '__pick_first_bt_entity' [-Wmissing-prototypes]
     141 | struct sched_bt_entity *__pick_first_bt_entity(struct bt_rq *bt_rq)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:294:6: warning: no previous prototype for 'place_bt_entity' [-Wmissing-prototypes]
     294 | void place_bt_entity(struct bt_rq *bt_rq, struct sched_bt_entity *se,
         |      ^~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'enqueue_task_bt':
>> kernel/sched/batch.c:481:54: error: 'struct rq' has no member named 'bt_tasks'
     481 |         list_add(&se->group_node, &rq_of_bt_rq(bt_rq)->bt_tasks);
         |                                                      ^~
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:804:12: warning: no previous prototype for 'find_busiest_rq' [-Wmissing-prototypes]
     804 | struct rq *find_busiest_rq(struct rq *this_rq, struct cpumask *mask)
         |            ^~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'can_migrate_bt':
>> kernel/sched/batch.c:830:37: error: 'struct rq' has no member named 'cpu'
     830 |         if (!cpumask_test_cpu(dst_rq->cpu, p->cpus_ptr) ||
         |                                     ^~
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:836:5: warning: no previous prototype for 'load_balance_bt' [-Wmissing-prototypes]
     836 | int load_balance_bt(struct rq *this_rq, struct cpumask *mask)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'load_balance_bt':
   kernel/sched/batch.c:860:24: error: 'struct rq' has no member named 'bt_tasks'
     860 |         tasks = &src_rq->bt_tasks;
         |                        ^~
   kernel/sched/batch.c: In function 'rebalance_domains_bt':
>> kernel/sched/batch.c:914:9: error: implicit declaration of function 'for_each_domain'; did you mean 'for_each_class'? [-Werror=implicit-function-declaration]
     914 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
         |         for_each_class
>> kernel/sched/batch.c:914:33: error: expected ';' before '{' token
     914 |         for_each_domain(cpu, sd) {
         |                                 ^~
         |                                 ;
   kernel/sched/batch.c:908:23: warning: unused variable 'interval' [-Wunused-variable]
     908 |         unsigned long interval;
         |                       ^~~~~~~~
   kernel/sched/batch.c:907:25: warning: unused variable 'mask' [-Wunused-variable]
     907 |         struct cpumask *mask;
         |                         ^~~~
   kernel/sched/batch.c: At top level:
>> kernel/sched/batch.c:933:6: warning: no previous prototype for 'trigger_load_balance_bt' [-Wmissing-prototypes]
     933 | void trigger_load_balance_bt(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'trigger_load_balance_bt':
   kernel/sched/batch.c:936:23: warning: variable 'bt_rq' set but not used [-Wunused-but-set-variable]
     936 |         struct bt_rq *bt_rq;
         |                       ^~~~~
   kernel/sched/batch.c: In function 'idle_balance_bt':
   kernel/sched/batch.c:959:38: error: expected ';' before '{' token
     959 |         for_each_domain(this_cpu, sd) {
         |                                      ^~
         |                                      ;
   kernel/sched/batch.c: At top level:
>> kernel/sched/batch.c:926:30: warning: 'run_rebalance_domains_bt' defined but not used [-Wunused-function]
     926 | static __latent_entropy void run_rebalance_domains_bt(struct softirq_action *h)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/batch.c:891:22: warning: 'get_sd_balance_interval_bt' defined but not used [-Wunused-function]
     891 | static unsigned long get_sd_balance_interval_bt(struct cpumask *mask)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:742:12: warning: 'balance_bt' defined but not used [-Wunused-function]
     742 | static int balance_bt(struct rq *rq, struct task_struct *prev,
         |            ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +481 kernel/sched/batch.c

   466	
   467	static void enqueue_task_bt(struct rq *rq, struct task_struct *p, int flags)
   468	{
   469		struct bt_rq *bt_rq;
   470		struct sched_bt_entity *se = &p->bt;
   471	
   472		if (se->on_rq)
   473			return;
   474	
   475		bt_rq = bt_rq_of(se);
   476		enqueue_bt_entity(bt_rq, se, flags);
   477		bt_rq->h_nr_running++;
   478	
   479		rq->bt_nr_running++;
   480		add_nr_running(rq, 1);
 > 481		list_add(&se->group_node, &rq_of_bt_rq(bt_rq)->bt_tasks);
   482	}
   483	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
