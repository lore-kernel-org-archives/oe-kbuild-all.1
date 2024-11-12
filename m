Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA45B21C186
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 23:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731453690; cv=none; b=Z/WTRXuTS4zOMxWYbQs1yas6hq3OMjzTAxbhUmcFQbs8p9T19eFW/7rgi9D6GR+klIfMPGomBTqSvfm9+S6tGIT2X0vRWFE5TpWH1vUYKbkUfMe35QKoIuDelleS61mXdrTDE0jqvzG12ZGS1iswsR4lMYTpHaO6Y1/q1XSWbqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731453690; c=relaxed/simple;
	bh=OsfV1v5b4kQK7h1TdhzGEojh6ybHe2cKUPjcqRJ1+Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HvNl6dxy+rcpNznTCGg2p6voxH27JX+DsGHcpMnbuoDoT2v1ARId12CCA1qo3rldGrPm2NFK2W9hKVxMlS8PgtJLJ7Le75WlKS/ukQj1fV9EJENtvEX+qPYIa6Hmx7A5x9BHuaTHCNq6ZPIZ3i5kPwu734NQ9DvRylRurzj1Hq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpFSw6WP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpFSw6WP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731453688; x=1762989688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OsfV1v5b4kQK7h1TdhzGEojh6ybHe2cKUPjcqRJ1+Gg=;
  b=ZpFSw6WPcKsTQXQwYTphd8zSTsoKmMgwnwThbnVwknHTBWxEl1561Hye
   H9nn88+xOUlX45/HdNWHb2aVlLoKqJoSJbJQoU6nBMSFnWpqGclCvcX+W
   TVcsH26vVhymkhLkxA/EXb16Lgh3ZohB5aVSJgDahehoe5JEuCqARPZ60
   MPBc1z+sWj+yTloSlYTQRS0ZXQT/t0lPIDPKhYX8mH+rdgm9tJP/h3A8t
   evcMRerUtxlOchIV8YPQE+DweFazv+GmCVBv8gKDzgigAsNd/SCxQUoSO
   F7wbD7/jBW9YpONPcTHLeOGAnHNAtLOoRFceijl4IasxljiulUV6j+Czt
   A==;
X-CSE-ConnectionGUID: MoFJq/IoSsyDztKaS61yuA==
X-CSE-MsgGUID: p6Y/BNQHRoK/EeWYA1F8MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31547952"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="31547952"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 15:21:27 -0800
X-CSE-ConnectionGUID: 8WMqwN2FQuSimsS7KR1dfQ==
X-CSE-MsgGUID: wPW58zbjS4eLQs4ibaHxJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="88068738"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2024 15:21:26 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB0CJ-0001p1-0k;
	Tue, 12 Nov 2024 23:21:23 +0000
Date: Wed, 13 Nov 2024 07:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vincent-guittot:sched/rework-eas 5/7] kernel/sched/fair.c:8966:76:
 error: expected statement before ']' token
Message-ID: <202411130722.E7paHNfY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git sched/rework-eas
head:   f56343c093b03ec6e87c249ce16f896e3a51d7ec
commit: 3feee940ffc89b0713ca4fe7d1a72923b8b13cf6 [5/7] sched/fair: Add push task callback for EAS
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20241113/202411130722.E7paHNfY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130722.E7paHNfY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130722.E7paHNfY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'check_misfit_cpu':
>> kernel/sched/fair.c:8966:76: error: expected statement before ']' token
    8966 | static inline void check_misfit_cpu(struct task_struct *p, struct rq *rq) {]
         |                                                                            ^
>> kernel/sched/fair.c:8967:20: error: invalid storage class for function 'dequeue_pushable_task'
    8967 | static inline void dequeue_pushable_task(struct cfs_rq *cfs_rq, struct sched_entity *se, bool queue) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:8968:20: error: invalid storage class for function 'enqueue_pushable_task'
    8968 | static inline void enqueue_pushable_task(struct cfs_rq *cfs_rq, struct sched_entity *se) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:8969:20: error: invalid storage class for function 'set_task_max_allowed_capacity'
    8969 | static inline void set_task_max_allowed_capacity(struct task_struct *p) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:8972:13: error: invalid storage class for function 'set_next_buddy'
    8972 | static void set_next_buddy(struct sched_entity *se)
         |             ^~~~~~~~~~~~~~
>> kernel/sched/fair.c:8986:13: error: invalid storage class for function 'check_preempt_wakeup_fair'
    8986 | static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int wake_flags)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:9070:28: error: invalid storage class for function 'pick_task_fair'
    9070 | static struct task_struct *pick_task_fair(struct rq *rq)
         |                            ^~~~~~~~~~~~~~
>> kernel/sched/fair.c:9097:13: error: invalid storage class for function '__set_next_task_fair'
    9097 | static void __set_next_task_fair(struct rq *rq, struct task_struct *p, bool first);
         |             ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:9098:13: error: invalid storage class for function 'set_next_task_fair'
    9098 | static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool first);
         |             ^~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:9187:28: error: invalid storage class for function '__pick_next_task_fair'
    9187 | static struct task_struct *__pick_next_task_fair(struct rq *rq, struct task_struct *prev)
         |                            ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:9192:13: error: invalid storage class for function 'fair_server_has_tasks'
    9192 | static bool fair_server_has_tasks(struct sched_dl_entity *dl_se)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:9197:28: error: invalid storage class for function 'fair_server_pick_task'
    9197 | static struct task_struct *fair_server_pick_task(struct sched_dl_entity *dl_se)
         |                            ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:9214:13: error: invalid storage class for function 'put_prev_task_fair'
    9214 | static void put_prev_task_fair(struct rq *rq, struct task_struct *prev, struct task_struct *next)
         |             ^~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:9228:13: error: invalid storage class for function 'yield_task_fair'
    9228 | static void yield_task_fair(struct rq *rq)
         |             ^~~~~~~~~~~~~~~
>> kernel/sched/fair.c:9257:13: error: invalid storage class for function 'yield_to_task_fair'
    9257 | static bool yield_to_task_fair(struct rq *rq, struct task_struct *p)
         |             ^~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:13270:20: error: invalid storage class for function 'task_tick_core'
   13270 | static inline void task_tick_core(struct rq *rq, struct task_struct *curr) {}
         |                    ^~~~~~~~~~~~~~
>> kernel/sched/fair.c:13281:13: error: invalid storage class for function 'task_tick_fair'
   13281 | static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
         |             ^~~~~~~~~~~~~~
>> kernel/sched/fair.c:13307:13: error: invalid storage class for function 'task_fork_fair'
   13307 | static void task_fork_fair(struct task_struct *p)
         |             ^~~~~~~~~~~~~~
>> kernel/sched/fair.c:13317:1: error: invalid storage class for function 'prio_changed_fair'
   13317 | prio_changed_fair(struct rq *rq, struct task_struct *p, int oldprio)
         | ^~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:13368:13: error: invalid storage class for function 'propagate_entity_cfs_rq'
   13368 | static void propagate_entity_cfs_rq(struct sched_entity *se) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13371:13: error: invalid storage class for function 'detach_entity_cfs_rq'
   13371 | static void detach_entity_cfs_rq(struct sched_entity *se)
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13393:13: error: invalid storage class for function 'attach_entity_cfs_rq'
   13393 | static void attach_entity_cfs_rq(struct sched_entity *se)
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13404:13: error: invalid storage class for function 'detach_task_cfs_rq'
   13404 | static void detach_task_cfs_rq(struct task_struct *p)
         |             ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13411:13: error: invalid storage class for function 'attach_task_cfs_rq'
   13411 | static void attach_task_cfs_rq(struct task_struct *p)
         |             ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13418:13: error: invalid storage class for function 'switched_from_fair'
   13418 | static void switched_from_fair(struct rq *rq, struct task_struct *p)
         |             ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13423:13: error: invalid storage class for function 'switched_to_fair'
   13423 | static void switched_to_fair(struct rq *rq, struct task_struct *p)
         |             ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13444:13: error: invalid storage class for function '__set_next_task_fair'
   13444 | static void __set_next_task_fair(struct rq *rq, struct task_struct *p, bool first)
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13475:13: error: invalid storage class for function 'set_next_task_fair'
   13475 | static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool first)
         |             ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13787:21: error: invalid storage class for function 'get_rr_interval_fair'
   13787 | static unsigned int get_rr_interval_fair(struct rq *rq, struct task_struct *task)
         |                     ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/fair.c:54:
   kernel/sched/fair.c:13805:20: error: section attribute cannot be specified for local variables
   13805 | DEFINE_SCHED_CLASS(fair) = {
         |                    ^~~~
   kernel/sched/sched.h:2495:26: note: in definition of macro 'DEFINE_SCHED_CLASS'
    2495 | const struct sched_class name##_sched_class \
         |                          ^~~~
   kernel/sched/fair.c:13918:1: error: expected declaration or statement at end of input
   13918 | }
         | ^
   kernel/sched/fair.c:13805:20: warning: unused variable 'fair_sched_class' [-Wunused-variable]
   13805 | DEFINE_SCHED_CLASS(fair) = {
         |                    ^~~~
   kernel/sched/sched.h:2495:26: note: in definition of macro 'DEFINE_SCHED_CLASS'
    2495 | const struct sched_class name##_sched_class \
         |                          ^~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:5467:13: warning: 'dequeue_pushable_task' used but never defined
    5467 | static void dequeue_pushable_task(struct cfs_rq *cfs_rq, struct sched_entity *se, bool queue);
         |             ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5641:13: warning: 'enqueue_pushable_task' used but never defined
    5641 | static void enqueue_pushable_task(struct cfs_rq *cfs_rq, struct sched_entity *se);
         |             ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7079:13: warning: 'set_next_buddy' used but never defined
    7079 | static void set_next_buddy(struct sched_entity *se);
         |             ^~~~~~~~~~~~~~
   kernel/sched/fair.c:13892:13: warning: 'init_sched_fair_class' defined but not used [-Wunused-function]
   13892 | __init void init_sched_fair_class(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13490:6: warning: 'init_cfs_rq' defined but not used [-Wunused-function]
   13490 | void init_cfs_rq(struct cfs_rq *cfs_rq)
         |      ^~~~~~~~~~~
   kernel/sched/fair.c:9202:6: warning: 'fair_server_init' defined but not used [-Wunused-function]
    9202 | void fair_server_init(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~


vim +8966 kernel/sched/fair.c

  8956	
  8957	static int
  8958	balance_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
  8959	{
  8960		if (sched_fair_runnable(rq))
  8961			return 1;
  8962	
  8963		return sched_balance_newidle(rq, rf) != 0;
  8964	}
  8965	#else
> 8966	static inline void check_misfit_cpu(struct task_struct *p, struct rq *rq) {]
> 8967	static inline void dequeue_pushable_task(struct cfs_rq *cfs_rq, struct sched_entity *se, bool queue) {}
> 8968	static inline void enqueue_pushable_task(struct cfs_rq *cfs_rq, struct sched_entity *se) {}
> 8969	static inline void set_task_max_allowed_capacity(struct task_struct *p) {}
  8970	#endif /* CONFIG_SMP */
  8971	
> 8972	static void set_next_buddy(struct sched_entity *se)
  8973	{
  8974		for_each_sched_entity(se) {
  8975			if (SCHED_WARN_ON(!se->on_rq))
  8976				return;
  8977			if (se_is_idle(se))
  8978				return;
  8979			cfs_rq_of(se)->next = se;
  8980		}
  8981	}
  8982	
  8983	/*
  8984	 * Preempt the current task with a newly woken task if needed:
  8985	 */
> 8986	static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int wake_flags)
  8987	{
  8988		struct task_struct *donor = rq->donor;
  8989		struct sched_entity *se = &donor->se, *pse = &p->se;
  8990		struct cfs_rq *cfs_rq = task_cfs_rq(donor);
  8991		int cse_is_idle, pse_is_idle;
  8992	
  8993		if (unlikely(se == pse))
  8994			return;
  8995	
  8996		/*
  8997		 * This is possible from callers such as attach_tasks(), in which we
  8998		 * unconditionally wakeup_preempt() after an enqueue (which may have
  8999		 * lead to a throttle).  This both saves work and prevents false
  9000		 * next-buddy nomination below.
  9001		 */
  9002		if (unlikely(throttled_hierarchy(cfs_rq_of(pse))))
  9003			return;
  9004	
  9005		if (sched_feat(NEXT_BUDDY) && !(wake_flags & WF_FORK)) {
  9006			set_next_buddy(pse);
  9007		}
  9008	
  9009		/*
  9010		 * We can come here with TIF_NEED_RESCHED already set from new task
  9011		 * wake up path.
  9012		 *
  9013		 * Note: this also catches the edge-case of curr being in a throttled
  9014		 * group (e.g. via set_curr_task), since update_curr() (in the
  9015		 * enqueue of curr) will have resulted in resched being set.  This
  9016		 * prevents us from potentially nominating it as a false LAST_BUDDY
  9017		 * below.
  9018		 */
  9019		if (test_tsk_need_resched(rq->curr))
  9020			return;
  9021	
  9022		if (!sched_feat(WAKEUP_PREEMPTION))
  9023			return;
  9024	
  9025		find_matching_se(&se, &pse);
  9026		WARN_ON_ONCE(!pse);
  9027	
  9028		cse_is_idle = se_is_idle(se);
  9029		pse_is_idle = se_is_idle(pse);
  9030	
  9031		/*
  9032		 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
  9033		 * in the inverse case).
  9034		 */
  9035		if (cse_is_idle && !pse_is_idle)
  9036			goto preempt;
  9037		if (cse_is_idle != pse_is_idle)
  9038			return;
  9039	
  9040		/*
  9041		 * BATCH and IDLE tasks do not preempt others.
  9042		 */
  9043		if (unlikely(!normal_policy(p->policy)))
  9044			return;
  9045	
  9046		cfs_rq = cfs_rq_of(se);
  9047		update_curr(cfs_rq);
  9048		/*
  9049		 * If @p has a shorter slice than current and @p is eligible, override
  9050		 * current's slice protection in order to allow preemption.
  9051		 *
  9052		 * Note that even if @p does not turn out to be the most eligible
  9053		 * task at this moment, current's slice protection will be lost.
  9054		 */
  9055		if (do_preempt_short(cfs_rq, pse, se) && se->vlag == se->deadline)
  9056			se->vlag = se->deadline + 1;
  9057	
  9058		/*
  9059		 * If @p has become the most eligible task, force preemption.
  9060		 */
  9061		if (pick_eevdf(cfs_rq) == pse)
  9062			goto preempt;
  9063	
  9064		return;
  9065	
  9066	preempt:
  9067		resched_curr_lazy(rq);
  9068	}
  9069	
> 9070	static struct task_struct *pick_task_fair(struct rq *rq)
  9071	{
  9072		struct sched_entity *se;
  9073		struct cfs_rq *cfs_rq;
  9074	
  9075	again:
  9076		cfs_rq = &rq->cfs;
  9077		if (!cfs_rq->nr_running)
  9078			return NULL;
  9079	
  9080		do {
  9081			/* Might not have done put_prev_entity() */
  9082			if (cfs_rq->curr && cfs_rq->curr->on_rq)
  9083				update_curr(cfs_rq);
  9084	
  9085			if (unlikely(check_cfs_rq_runtime(cfs_rq)))
  9086				goto again;
  9087	
  9088			se = pick_next_entity(rq, cfs_rq);
  9089			if (!se)
  9090				goto again;
  9091			cfs_rq = group_cfs_rq(se);
  9092		} while (cfs_rq);
  9093	
  9094		return task_of(se);
  9095	}
  9096	
> 9097	static void __set_next_task_fair(struct rq *rq, struct task_struct *p, bool first);
> 9098	static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool first);
  9099	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
