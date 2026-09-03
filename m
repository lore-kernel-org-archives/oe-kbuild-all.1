Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CB03093A6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 01:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788400522; cv=none; b=gizor9uLHtmxBcCTM07cpWMJ00T240yVmz/X2P+cE/0xXNIbjZPcYE2TEPcFdrZVcbcYNv3Rc95G1UsMMlgYTeQ+8JhXWZL2LuaZpwfoPHDjpne947BIOm0IcvbnAYC6sc/uBYIMuYRZE4+wtT5gv2CHg+6zV9WYlLMMVNiiwN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788400522; c=relaxed/simple;
	bh=ke4/OGcnIWFEbYg0TBZ158Wsqz8dXoxDIKUjMw4NyAA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s5TBg00s3J3RrzeUZ7svNvYUSVxB+iRY3erCxYS7ENB9Iz/t9eH5d01Id5N/tAZvTGTst7c5WhFqzchKjWAHzXxi1z2DBZyzFxWWyNpx4aL0KqxOeyvzOXeMQm2fecF4EPYp15vjSyd3skojtFjIboKBQ3Ue/UNGKjL1j0vAZKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9mOYZ5E; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9mOYZ5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788400521; x=1819936521;
  h=date:from:to:cc:subject:message-id;
  bh=ke4/OGcnIWFEbYg0TBZ158Wsqz8dXoxDIKUjMw4NyAA=;
  b=U9mOYZ5EDXdtzf5tCGibA7F8Jdk1GarloX44IMaY3wYjL6xCTpVIupCc
   UAXCxBoYFmdp58uvG0ue654ltbHoPczhBQvGsYljDJjqmJ07aUCMXOnxk
   gibZQ8P2cDq5BgDV39JEHXhMjMye37sQZtFjvX10DJGmu10nZUvLEe3HA
   KNtyjz3JbRRjRXiVl1NHeTNLJuamCUWvRYA94z4rf/Ei4ldixiNaWSxKy
   7gN1YfwUK6uerXKWHtEHLpikQMoXVDF9tREFsHzypM5x3aOv1vHONsWZK
   Ei1tDG7i4xHPRdsq3vsm/Xr/sVnjB3OUpQl4DyFM1Rj0hyNf8jiSPEnZM
   A==;
X-CSE-ConnectionGUID: /GV50jeKTu6qndlqK/U36g==
X-CSE-MsgGUID: PcSizQZRR3mz97MWwFmjzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92689049"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92689049"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 18:55:20 -0700
X-CSE-ConnectionGUID: Xyf+hHWcQi6drSAdynrZrA==
X-CSE-MsgGUID: oVr+sPAnQKGBNPR9OINbIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="270122159"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Sep 2026 18:55:19 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1wfc-000000003bu-2Cg6;
	Thu, 03 Sep 2026 01:55:16 +0000
Date: Thu, 03 Sep 2026 09:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/task_h_load 27/27]
 kernel/sched/fair.c:8017:9: error: implicit declaration of function
 'for_each_sched_entity_bl'; did you mean 'for_each_sched_entity'?
Message-ID: <202609030926.qU7WplQC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/task_h_load
head:   4cbbcdc1a5585407e918e633887e57d978ddf0c6
commit: 4cbbcdc1a5585407e918e633887e57d978ddf0c6 [27/27] sched/fair: Rework/fix task_h_load()
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260903/202609030926.qU7WplQC-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030926.qU7WplQC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030926.qU7WplQC-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'update_curr_fair':
   kernel/sched/fair.c:461:36: error: implicit declaration of function 'cfs_of_of'; did you mean 'cfs_rq_of'? [-Wimplicit-function-declaration]
     461 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                    ^~~~~~~~~
   kernel/sched/fair.c:2085:9: note: in expansion of macro 'for_each_sched_entity'
    2085 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:461:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     461 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:2085:9: note: in expansion of macro 'for_each_sched_entity'
    2085 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'reweight_task_fair':
   kernel/sched/fair.c:461:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     461 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:4820:9: note: in expansion of macro 'for_each_sched_entity'
    4820 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_delayed':
   kernel/sched/fair.c:461:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     461 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:6452:9: note: in expansion of macro 'for_each_sched_entity'
    6452 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'clear_delayed':
   kernel/sched/fair.c:461:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     461 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:6471:9: note: in expansion of macro 'for_each_sched_entity'
    6471 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'enqueue_hierarchy':
   kernel/sched/fair.c:461:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     461 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:7994:9: note: in expansion of macro 'for_each_sched_entity'
    7994 |         for_each_sched_entity(se, cfs_rq) {
         |         ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:8017:9: error: implicit declaration of function 'for_each_sched_entity_bl'; did you mean 'for_each_sched_entity'? [-Wimplicit-function-declaration]
    8017 |         for_each_sched_entity_bl(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         for_each_sched_entity
>> kernel/sched/fair.c:8017:45: error: expected ';' before 'update_cfs_rq_h_load'
    8017 |         for_each_sched_entity_bl(se, cfs_rq)
         |                                             ^
         |                                             ;
    8018 |                 update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
         |                 ~~~~~~~~~~~~~~~~~~~~         
   kernel/sched/fair.c: In function 'dequeue_hierarchy':
   kernel/sched/fair.c:461:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     461 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:8134:9: note: in expansion of macro 'for_each_sched_entity'
    8134 |         for_each_sched_entity(se, cfs_rq) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8162:45: error: expected ';' before 'update_cfs_rq_h_load'
    8162 |         for_each_sched_entity_bl(se, cfs_rq)
         |                                             ^
         |                                             ;
    8163 |                 update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
         |                 ~~~~~~~~~~~~~~~~~~~~         
   kernel/sched/fair.c: In function 'task_tick_fair':
   kernel/sched/fair.c:461:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     461 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:15087:17: note: in expansion of macro 'for_each_sched_entity'
   15087 |                 for_each_sched_entity(se, cfs_rq) {
         |                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:15096:61: error: expected ';' before 'update_cfs_rq_h_load'
   15096 |                         for_each_sched_entity_bl(se, cfs_rq)
         |                                                             ^
         |                                                             ;
   15097 |                                 update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
         |                                 ~~~~~~~~~~~~~~~~~~~~         
   kernel/sched/fair.c: In function 'set_next_task_fair':
   kernel/sched/fair.c:461:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     461 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:15278:9: note: in expansion of macro 'for_each_sched_entity'
   15278 |         for_each_sched_entity(se, cfs_rq) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:15312:45: error: expected ';' before 'update_cfs_rq_h_load'
   15312 |         for_each_sched_entity_bl(se, cfs_rq)
         |                                             ^
         |                                             ;
   15313 |                 update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
         |                 ~~~~~~~~~~~~~~~~~~~~         


vim +8017 kernel/sched/fair.c

  7981	
  7982	static unsigned long enqueue_hierarchy(struct task_struct *p, int flags)
  7983	{
  7984		unsigned long weight = NICE_0_LOAD;
  7985		int task_new = !(flags & ENQUEUE_WAKEUP);
  7986		struct sched_entity *se = &p->se;
  7987		int h_nr_idle = task_has_idle_policy(p);
  7988		int h_nr_runnable = 1;
  7989		struct cfs_rq *cfs_rq;
  7990	
  7991		if (task_new && se->sched_delayed)
  7992			h_nr_runnable = 0;
  7993	
> 7994		for_each_sched_entity(se, cfs_rq) {
  7995			update_curr(cfs_rq);
  7996	
  7997			if (!se->on_rq) {
  7998				enqueue_entity(cfs_rq, se, flags);
  7999			} else {
  8000				update_load_avg(cfs_rq, se, UPDATE_TG);
  8001				se_update_runnable(se);
  8002				update_cfs_group(se);
  8003			}
  8004	
  8005			cfs_rq->h_nr_runnable += h_nr_runnable;
  8006			cfs_rq->h_nr_queued++;
  8007			cfs_rq->h_nr_idle += h_nr_idle;
  8008	
  8009			if (cfs_rq_is_idle(cfs_rq))
  8010				h_nr_idle = 1;
  8011	
  8012			weight = __calc_prop_weight(cfs_rq, se, weight);
  8013	
  8014			flags = ENQUEUE_WAKEUP;
  8015		}
  8016	
> 8017		for_each_sched_entity_bl(se, cfs_rq)
  8018			update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
  8019	
  8020		return weight;
  8021	}
  8022	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
