Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B1D15ACA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 19:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694461537; x=1725997537;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Liyr3ZKIigFmga+OKzUBTFRgLlSjukhAqrNVWEWjvOE=;
  b=aMY0y/YUXpbYpvq3X342nkOXSJiZctAXVW6nXARfu1qa+T9ZBxh236FW
   M5jAyrUwc+0vZdZhFbby3/iNcNjOdW9TerPP0FJoD0/Bb+/oSMTtLeODS
   Qu+dBzd+02QDLuXQBv3KV1qc3cjoBQI3aXTQvX50rigcMT8O3xaSz0P1c
   OPLh+1VYKeIkBn2MAYrBEWKyWrddgMu7033nnJM8Bwz3MuIYbp8QwIahI
   vsPs4s9ALPGNC9AJsSibaHGrKnLSHAJs6pb8ZOphxZ7XM5T5to3cx7u4d
   3zKHVOQkt7GypCt6qT72apDcD2ZhlUcWGtNUyGTrHdAfCIhgG8OVFu96o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="363220636"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="363220636"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 12:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833623157"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="833623157"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Sep 2023 12:45:35 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfmqj-0006fO-0K;
	Mon, 11 Sep 2023 19:45:33 +0000
Date: Tue, 12 Sep 2023 03:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 11/12]
 drivers/gpu/drm/scheduler/sched_main.c:1113:60: error: expected ',' or ';'
 before 'sched'
Message-ID: <202309120332.R0vBL3D6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   557fb1e21399de5f674beb93fa6793adce124cc2
commit: 4328f6314232c50e76707948f84cef1005cca47f [11/12] kthread: Provide a mechanism to control kthread sched_attr
config: i386-randconfig-051-20230911 (https://download.01.org/0day-ci/archive/20230912/202309120332.R0vBL3D6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120332.R0vBL3D6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120332.R0vBL3D6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kthread.h:6,
                    from drivers/gpu/drm/scheduler/sched_main.c:51:
   drivers/gpu/drm/scheduler/sched_main.c: In function 'drm_sched_init':
>> drivers/gpu/drm/scheduler/sched_main.c:1113:60: error: expected ',' or ';' before 'sched'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                                                            ^~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:18:9: note: in expansion of macro '__kthread_param'
      18 |         __kthread_param(name, unsigned long, sched_policy);             \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/scheduler/sched_main.c:1113:25: note: in expansion of macro 'kthread_run'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                         ^~~~~~~~~~~
>> drivers/gpu/drm/scheduler/sched_main.c:1113:60: error: expected ',' or ';' before 'sched'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                                                            ^~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:19:9: note: in expansion of macro '__kthread_param'
      19 |         __kthread_param(name, long, sched_nice);                        \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/scheduler/sched_main.c:1113:25: note: in expansion of macro 'kthread_run'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                         ^~~~~~~~~~~
>> drivers/gpu/drm/scheduler/sched_main.c:1113:60: error: expected ',' or ';' before 'sched'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                                                            ^~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:20:9: note: in expansion of macro '__kthread_param'
      20 |         __kthread_param(name, unsigned long, sched_priority);           \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/scheduler/sched_main.c:1113:25: note: in expansion of macro 'kthread_run'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                         ^~~~~~~~~~~
>> drivers/gpu/drm/scheduler/sched_main.c:1113:60: error: expected ',' or ';' before 'sched'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                                                            ^~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:21:9: note: in expansion of macro '__kthread_param'
      21 |         __kthread_param(name, unsigned long long, sched_runtime);       \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/scheduler/sched_main.c:1113:25: note: in expansion of macro 'kthread_run'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                         ^~~~~~~~~~~
>> drivers/gpu/drm/scheduler/sched_main.c:1113:60: error: expected ',' or ';' before 'sched'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                                                            ^~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:22:9: note: in expansion of macro '__kthread_param'
      22 |         __kthread_param(name, unsigned long long, sched_deadline);      \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/scheduler/sched_main.c:1113:25: note: in expansion of macro 'kthread_run'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                         ^~~~~~~~~~~
>> drivers/gpu/drm/scheduler/sched_main.c:1113:60: error: expected ',' or ';' before 'sched'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                                                            ^~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:23:9: note: in expansion of macro '__kthread_param'
      23 |         __kthread_param(name, unsigned long long, sched_period);        \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/scheduler/sched_main.c:1113:25: note: in expansion of macro 'kthread_run'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                         ^~~~~~~~~~~
>> drivers/gpu/drm/scheduler/sched_main.c:1113:60: error: expected ',' or ';' before 'sched'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                                                            ^~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:24:9: note: in expansion of macro '__kthread_param'
      24 |         __kthread_param(name, unsigned long, sched_util_min);           \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/scheduler/sched_main.c:1113:25: note: in expansion of macro 'kthread_run'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                         ^~~~~~~~~~~
>> drivers/gpu/drm/scheduler/sched_main.c:1113:60: error: expected ',' or ';' before 'sched'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                                                            ^~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:25:9: note: in expansion of macro '__kthread_param'
      25 |         __kthread_param(name, unsigned long, sched_util_max);           \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/scheduler/sched_main.c:1113:25: note: in expansion of macro 'kthread_run'
    1113 |         sched->thread = kthread_run(drm_sched_main, sched, sched->name);
         |                         ^~~~~~~~~~~


vim +1113 drivers/gpu/drm/scheduler/sched_main.c

a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1068  
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1069  /**
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1070   * drm_sched_init - Init a gpu scheduler instance
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1071   *
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1072   * @sched: scheduler instance
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1073   * @ops: backend operations for this scheduler
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1074   * @hw_submission: number of hw submissions that can be in flight
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1075   * @hang_limit: number of times to allow a job to hang before dropping it
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1076   * @timeout: timeout value in jiffies for the scheduler
78efe21b6f8e6f drivers/gpu/drm/scheduler/sched_main.c        Boris Brezillon   2021-06-30  1077   * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
78efe21b6f8e6f drivers/gpu/drm/scheduler/sched_main.c        Boris Brezillon   2021-06-30  1078   *		used
f2f12eb9c32bc7 drivers/gpu/drm/scheduler/sched_main.c        Christian König   2021-02-02  1079   * @score: optional score atomic shared with other schedulers
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1080   * @name: name used for debugging
f8ad757e40c9c7 drivers/gpu/drm/scheduler/sched_main.c        Randy Dunlap      2022-04-04  1081   * @dev: target &struct device
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1082   *
4f839a243d3b0d drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-09-08  1083   * Return 0 on success, otherwise error code.
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1084   */
1b1f42d8fde4fe drivers/gpu/drm/scheduler/gpu_scheduler.c     Lucas Stach       2017-12-06  1085  int drm_sched_init(struct drm_gpu_scheduler *sched,
1b1f42d8fde4fe drivers/gpu/drm/scheduler/gpu_scheduler.c     Lucas Stach       2017-12-06  1086  		   const struct drm_sched_backend_ops *ops,
78efe21b6f8e6f drivers/gpu/drm/scheduler/sched_main.c        Boris Brezillon   2021-06-30  1087  		   unsigned hw_submission, unsigned hang_limit,
78efe21b6f8e6f drivers/gpu/drm/scheduler/sched_main.c        Boris Brezillon   2021-06-30  1088  		   long timeout, struct workqueue_struct *timeout_wq,
8ab62eda177bc3 drivers/gpu/drm/scheduler/sched_main.c        Jiawei Gu         2022-02-22  1089  		   atomic_t *score, const char *name, struct device *dev)
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1090  {
9afd07566b6c90 drivers/gpu/drm/scheduler/sched_main.c        Sharat Masetty    2018-11-29  1091  	int i, ret;
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1092  	sched->ops = ops;
4cef92670bc908 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Chunming Zhou     2015-08-05  1093  	sched->hw_submission_limit = hw_submission;
4f839a243d3b0d drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-09-08  1094  	sched->name = name;
2440ff2c915112 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Junwei Zhang      2015-10-10  1095  	sched->timeout = timeout;
78efe21b6f8e6f drivers/gpu/drm/scheduler/sched_main.c        Boris Brezillon   2021-06-30  1096  	sched->timeout_wq = timeout_wq ? : system_wq;
95aa9b1d9738fa drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Monk Liu          2017-10-17  1097  	sched->hang_limit = hang_limit;
f2f12eb9c32bc7 drivers/gpu/drm/scheduler/sched_main.c        Christian König   2021-02-02  1098  	sched->score = score ? score : &sched->_score;
8ab62eda177bc3 drivers/gpu/drm/scheduler/sched_main.c        Jiawei Gu         2022-02-22  1099  	sched->dev = dev;
e2d732fdb7a9e4 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2020-08-11  1100  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
8dc9fbbf274b7b drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-07-13  1101  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1102  
c2b6bd7e91aad8 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-25  1103  	init_waitqueue_head(&sched->wake_up_worker);
c2b6bd7e91aad8 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-25  1104  	init_waitqueue_head(&sched->job_scheduled);
6efa4b465cfdaa drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2020-12-03  1105  	INIT_LIST_HEAD(&sched->pending_list);
4835096b07420c drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Monk Liu          2016-03-04  1106  	spin_lock_init(&sched->job_list_lock);
c746ba222363d2 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-19  1107  	atomic_set(&sched->hw_rq_count, 0);
6a962430562176 drivers/gpu/drm/scheduler/sched_main.c        Nayan Deshmukh    2018-09-26  1108  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
f2f12eb9c32bc7 drivers/gpu/drm/scheduler/sched_main.c        Christian König   2021-02-02  1109  	atomic_set(&sched->_score, 0);
93f8b367382108 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Andres Rodriguez  2017-03-09  1110  	atomic64_set(&sched->job_id_count, 0);
4f839a243d3b0d drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-09-08  1111  
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1112  	/* Each scheduler will run on a seperate kernel thread */
1b1f42d8fde4fe drivers/gpu/drm/scheduler/gpu_scheduler.c     Lucas Stach       2017-12-06 @1113  	sched->thread = kthread_run(drm_sched_main, sched, sched->name);
f49565982194d6 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  1114  	if (IS_ERR(sched->thread)) {
9afd07566b6c90 drivers/gpu/drm/scheduler/sched_main.c        Sharat Masetty    2018-11-29  1115  		ret = PTR_ERR(sched->thread);
9afd07566b6c90 drivers/gpu/drm/scheduler/sched_main.c        Sharat Masetty    2018-11-29  1116  		sched->thread = NULL;
8ab62eda177bc3 drivers/gpu/drm/scheduler/sched_main.c        Jiawei Gu         2022-02-22  1117  		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
9afd07566b6c90 drivers/gpu/drm/scheduler/sched_main.c        Sharat Masetty    2018-11-29  1118  		return ret;
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1119  	}
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1120  
faf6e1a87e0742 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2018-10-18  1121  	sched->ready = true;
4f839a243d3b0d drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-09-08  1122  	return 0;
f49565982194d6 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  1123  }
1b1f42d8fde4fe drivers/gpu/drm/scheduler/gpu_scheduler.c     Lucas Stach       2017-12-06  1124  EXPORT_SYMBOL(drm_sched_init);
f49565982194d6 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  1125  

:::::: The code at line 1113 was first introduced by commit
:::::: 1b1f42d8fde4fef1ed7873bf5aa91755f8c3de35 drm: move amd_gpu_scheduler into common location

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
