Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1014A07
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 00:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727743911; cv=none; b=tE59/1lftW+7ELYbAJ2cb8OYQCxZ4y8rRNhtvBjxOhySGcVA0SkOg4zTROLRKR/b+/XZ7xYqTPd7HNHUbuPmAs7+7L4OAzX9S3mXj3OgalUyogEXhEbWch7qExb31lvNkab2PwomG1x0z4m6wtCrTDjOh6KLzLFe0K3HNrGE6JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727743911; c=relaxed/simple;
	bh=3z1iSMUCmwPLw13FkO5csti1w+PjTt3U3gYH1Iv+1kY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XI1CPlYa+19WH7AYyNvIrW9cyjxZ4TxS9Fl43AREqAzssGs5usGtSEOsJAmLFN8woHPj/lJrEmiK/b8Q4KzMZMp9IKAI7w8fgpbhBJ5WibaJRNUqLa9p/cRn1PoK3OktRoH8B+c1eTW1MfFTomctL+o1sVB7CKQHHbzLiPiXwrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eujZtTMS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eujZtTMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727743909; x=1759279909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3z1iSMUCmwPLw13FkO5csti1w+PjTt3U3gYH1Iv+1kY=;
  b=eujZtTMSOm+AvTX5kUfCQpi1qk8ySmPwP/cPmYTpFXoP1pkxlOspYx16
   jFx+bmUdgjKw3nRPlJf1jrLxEiF8C5DQMoBwKcUgBdMK4XsMi1FGNKeR+
   Fo6nN7kZB8h8DjiNjHkvxnD/xcxBiLYsc9+SN53LmznGgQGsp6iiQtFKa
   rt11hhEJomxiPGyJqaCksQYaBn8Dlymj3dHrqbNyLcT0IwGkvrj8ZbXH/
   mOLfLqGhnWXIqj+Rre/L39Y2yWGC1UCnbsa6MW/BpamlD05hH2WflHXHM
   9OL5zApf2ZfJhdOhNYStVguglXTer/c5lAdh5VYhyC+5G9OLzweKdiFTE
   A==;
X-CSE-ConnectionGUID: ej5H9xDUSUK1VL5E/fK5Ag==
X-CSE-MsgGUID: 7x9PZ7vSQKiSbESJ5o581g==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="52271143"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="52271143"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 17:51:47 -0700
X-CSE-ConnectionGUID: +hXG5Ng8RlGUJtNmqrKS/g==
X-CSE-MsgGUID: PHrhXhJGR3WNJ1Kfoec6Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="73443716"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Sep 2024 17:51:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svR79-000Q69-1v;
	Tue, 01 Oct 2024 00:51:43 +0000
Date: Tue, 1 Oct 2024 08:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29994/30000] kernel/sched/core.c:9822:6:
 warning: no previous prototype for function 'sched_setsteal'
Message-ID: <202410010853.HQUsJtSO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   084a6771cfb3ef307b750af8b7c35a07a725fc4c
commit: b7772972a0a76efac27078392f3f706914fe2af7 [29994/30000] sched/core: Add cpu.steal_task in cgroup v1 cpu subsystem
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241001/202410010853.HQUsJtSO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410010853.HQUsJtSO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410010853.HQUsJtSO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:13:
   kernel/sched/sched.h:1863:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1863 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:2750:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
    2750 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^
   kernel/sched/core.c:2750:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2750 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         | ^
         | static 
   kernel/sched/core.c:4126:10: warning: cast from 'void (*)(struct callback_head *)' to 'void (*)(struct rq *)' converts to incompatible function type [-Wcast-function-type-strict]
    4126 |                 func = (void (*)(struct rq *))head->func;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:9598:5: warning: no previous prototype for function 'tg_set_dynamic_affinity_mode' [-Wmissing-prototypes]
    9598 | int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
         |     ^
   kernel/sched/core.c:9598:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    9598 | int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
         | ^
         | static 
   kernel/sched/core.c:9634:5: warning: no previous prototype for function 'tg_set_affinity_period' [-Wmissing-prototypes]
    9634 | int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
         |     ^
   kernel/sched/core.c:9634:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    9634 | int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
         | ^
         | static 
   kernel/sched/core.c:9648:5: warning: no previous prototype for function 'tg_get_affinity_period' [-Wmissing-prototypes]
    9648 | u64 tg_get_affinity_period(struct task_group *tg)
         |     ^
   kernel/sched/core.c:9648:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    9648 | u64 tg_get_affinity_period(struct task_group *tg)
         | ^
         | static 
>> kernel/sched/core.c:9822:6: warning: no previous prototype for function 'sched_setsteal' [-Wmissing-prototypes]
    9822 | void sched_setsteal(struct task_struct *tsk, s64 steal_task)
         |      ^
   kernel/sched/core.c:9822:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    9822 | void sched_setsteal(struct task_struct *tsk, s64 steal_task)
         | ^
         | static 
>> kernel/sched/core.c:9854:5: warning: no previous prototype for function 'tg_change_steal' [-Wmissing-prototypes]
    9854 | int tg_change_steal(struct task_group *tg, void *data)
         |     ^
   kernel/sched/core.c:9854:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    9854 | int tg_change_steal(struct task_group *tg, void *data)
         | ^
         | static 
   8 warnings generated.


vim +/sched_setsteal +9822 kernel/sched/core.c

  9821	
> 9822	void sched_setsteal(struct task_struct *tsk, s64 steal_task)
  9823	{
  9824		struct sched_entity *se = &tsk->se;
  9825		int queued, running, queue_flags =
  9826				DEQUEUE_SAVE | DEQUEUE_MOVE | DEQUEUE_NOCLOCK;
  9827		struct rq_flags rf;
  9828		struct rq *rq;
  9829	
  9830		if (se->steal_task == steal_task)
  9831			return;
  9832	
  9833		rq = task_rq_lock(tsk, &rf);
  9834	
  9835		running = task_current(rq, tsk);
  9836		queued = task_on_rq_queued(tsk);
  9837	
  9838		update_rq_clock(rq);
  9839		if (queued)
  9840			dequeue_task(rq, tsk, queue_flags);
  9841		if (running)
  9842			put_prev_task(rq, tsk);
  9843	
  9844		se->steal_task = steal_task;
  9845	
  9846		if (queued)
  9847			enqueue_task(rq, tsk, queue_flags);
  9848		if (running)
  9849			set_next_task(rq, tsk);
  9850	
  9851		task_rq_unlock(rq, tsk, &rf);
  9852	}
  9853	
> 9854	int tg_change_steal(struct task_group *tg, void *data)
  9855	{
  9856		struct css_task_iter it;
  9857		struct task_struct *tsk;
  9858		s64 steal_task = *(s64 *)data;
  9859		struct cgroup_subsys_state *css = &tg->css;
  9860	
  9861		tg->steal_task = steal_task;
  9862	
  9863		css_task_iter_start(css, 0, &it);
  9864		while ((tsk = css_task_iter_next(&it)))
  9865			sched_setsteal(tsk, steal_task);
  9866		css_task_iter_end(&it);
  9867	
  9868		return 0;
  9869	}
  9870	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
