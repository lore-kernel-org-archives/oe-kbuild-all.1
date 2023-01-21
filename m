Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC28460
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 22:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674338869; x=1705874869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZPzm/fMObezqsOqDuyUi6w/Kx7HZnLKocXLBSfr6TM=;
  b=KF3yqd0tGJEBt3E/LSRG8x7icVH8TmpvCY0Cxy9xns1q1U1JGhFa3fjn
   YG3WT09iRiT3bChxEN2piHen0hjB2eBgpTLl6vOH28qqRKC9IHpaAWTAE
   9oiF18M0ibvzugUeUdUTVKf8PuyztImi6e0lwG90yMxfVrPwBFwxZSbiZ
   FJSpMiJXFmmvskNw70SRLeyI4/umHopFvfvKETyn3MWA3f37giJ1FjD8N
   6H0r6+MKQNw/C5qQe963s9JlZ1F3soa3boRwlv8QXdFRIS2iDlGvEci5J
   kAIZqUl2BjNu52q652Xz8n3WTGDIteCCny4FYTKtn+i8Hvk6hvcZeOcFW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="324525340"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="324525340"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 14:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="638546907"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="638546907"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Jan 2023 14:07:47 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJM1a-0004Wo-2N;
	Sat, 21 Jan 2023 22:07:46 +0000
Date: Sun, 22 Jan 2023 06:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] block/blk-mq.h:303:31: error:
 'struct task_struct' has no member named 'plug'
Message-ID: <202301220538.B5Xp7u7K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0c8a58469bba51493c04fd3f0ab3ebbd3cd8dfa9
commit: 0c3d2d04cc77495aa4fa0ec3ddd2f44bc7f534a9 [1/1] ANDROID: make sure all types for hooks are defined in KMI
config: arm64-randconfig-r021-20230122 (https://download.01.org/0day-ci/archive/20230122/202301220538.B5Xp7u7K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15
        git checkout 0c3d2d04cc77495aa4fa0ec3ddd2f44bc7f534a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from block/blk-mq.h:6,
                    from block/blk.h:12,
                    from block/vendor_hooks.c:6:
>> block/blk-mq-tag.h:45:43: warning: 'struct blk_mq_alloc_data' declared inside parameter list will not be visible outside of this definition or declaration
      45 | extern unsigned int blk_mq_get_tag(struct blk_mq_alloc_data *data);
         |                                           ^~~~~~~~~~~~~~~~~
   block/blk-mq.h: In function 'blk_mq_plug':
>> block/blk-mq.h:303:31: error: 'struct task_struct' has no member named 'plug'
     303 |                 return current->plug;
         |                               ^~
   In file included from block/blk.h:13:
   block/blk-mq-sched.h: At top level:
>> block/blk-mq-sched.h:29:55: warning: 'struct elevator_type' declared inside parameter list will not be visible outside of this definition or declaration
      29 | int blk_mq_init_sched(struct request_queue *q, struct elevator_type *e);
         |                                                       ^~~~~~~~~~~~~
   block/blk-mq-sched.h: In function 'blk_mq_sched_allow_merge':
>> block/blk-mq-sched.h:49:19: error: invalid use of undefined type 'struct elevator_queue'
      49 |         if (e && e->type->ops.allow_merge)
         |                   ^~
   block/blk-mq-sched.h:50:25: error: invalid use of undefined type 'struct elevator_queue'
      50 |                 return e->type->ops.allow_merge(q, rq, bio);
         |                         ^~
   block/blk-mq-sched.h: In function 'blk_mq_sched_completed_request':
   block/blk-mq-sched.h:59:19: error: invalid use of undefined type 'struct elevator_queue'
      59 |         if (e && e->type->ops.completed_request)
         |                   ^~
   block/blk-mq-sched.h:60:18: error: invalid use of undefined type 'struct elevator_queue'
      60 |                 e->type->ops.completed_request(rq, now);
         |                  ^~
   block/blk-mq-sched.h: In function 'blk_mq_sched_requeue_request':
   block/blk-mq-sched.h:68:51: error: invalid use of undefined type 'struct elevator_queue'
      68 |         if ((rq->rq_flags & RQF_ELVPRIV) && e && e->type->ops.requeue_request)
         |                                                   ^~
   block/blk-mq-sched.h:69:18: error: invalid use of undefined type 'struct elevator_queue'
      69 |                 e->type->ops.requeue_request(rq);
         |                  ^~
   block/blk-mq-sched.h: In function 'blk_mq_sched_has_work':
   block/blk-mq-sched.h:76:19: error: invalid use of undefined type 'struct elevator_queue'
      76 |         if (e && e->type->ops.has_work)
         |                   ^~
   block/blk-mq-sched.h:77:25: error: invalid use of undefined type 'struct elevator_queue'
      77 |                 return e->type->ops.has_work(hctx);
         |                         ^~
   block/blk.h: At top level:
>> block/blk.h:201:38: warning: 'struct elevator_type' declared inside parameter list will not be visible outside of this definition or declaration
     201 |                               struct elevator_type *new_e);
         |                                      ^~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/block.h:36,
                    from block/vendor_hooks.c:14:
   include/trace/trace_events.h:27:23: warning: 'str__block__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]


vim +303 block/blk-mq.h

0da73d00ca111a Minwoo Im      2018-07-02  276  
b49773e7bcf316 Damien Le Moal 2019-07-11  277  /*
b49773e7bcf316 Damien Le Moal 2019-07-11  278   * blk_mq_plug() - Get caller context plug
b49773e7bcf316 Damien Le Moal 2019-07-11  279   * @q: request queue
b49773e7bcf316 Damien Le Moal 2019-07-11  280   * @bio : the bio being submitted by the caller context
b49773e7bcf316 Damien Le Moal 2019-07-11  281   *
b49773e7bcf316 Damien Le Moal 2019-07-11  282   * Plugging, by design, may delay the insertion of BIOs into the elevator in
b49773e7bcf316 Damien Le Moal 2019-07-11  283   * order to increase BIO merging opportunities. This however can cause BIO
b49773e7bcf316 Damien Le Moal 2019-07-11  284   * insertion order to change from the order in which submit_bio() is being
b49773e7bcf316 Damien Le Moal 2019-07-11  285   * executed in the case of multiple contexts concurrently issuing BIOs to a
b49773e7bcf316 Damien Le Moal 2019-07-11  286   * device, even if these context are synchronized to tightly control BIO issuing
b49773e7bcf316 Damien Le Moal 2019-07-11  287   * order. While this is not a problem with regular block devices, this ordering
b49773e7bcf316 Damien Le Moal 2019-07-11  288   * change can cause write BIO failures with zoned block devices as these
b49773e7bcf316 Damien Le Moal 2019-07-11  289   * require sequential write patterns to zones. Prevent this from happening by
b49773e7bcf316 Damien Le Moal 2019-07-11  290   * ignoring the plug state of a BIO issuing context if the target request queue
b49773e7bcf316 Damien Le Moal 2019-07-11  291   * is for a zoned block device and the BIO to plug is a write operation.
b49773e7bcf316 Damien Le Moal 2019-07-11  292   *
b49773e7bcf316 Damien Le Moal 2019-07-11  293   * Return current->plug if the bio can be plugged and NULL otherwise
b49773e7bcf316 Damien Le Moal 2019-07-11  294   */
b49773e7bcf316 Damien Le Moal 2019-07-11  295  static inline struct blk_plug *blk_mq_plug(struct request_queue *q,
b49773e7bcf316 Damien Le Moal 2019-07-11  296  					   struct bio *bio)
b49773e7bcf316 Damien Le Moal 2019-07-11  297  {
b49773e7bcf316 Damien Le Moal 2019-07-11  298  	/*
b49773e7bcf316 Damien Le Moal 2019-07-11  299  	 * For regular block devices or read operations, use the context plug
b49773e7bcf316 Damien Le Moal 2019-07-11  300  	 * which may be NULL if blk_start_plug() was not executed.
b49773e7bcf316 Damien Le Moal 2019-07-11  301  	 */
b49773e7bcf316 Damien Le Moal 2019-07-11  302  	if (!blk_queue_is_zoned(q) || !op_is_write(bio_op(bio)))
b49773e7bcf316 Damien Le Moal 2019-07-11 @303  		return current->plug;
b49773e7bcf316 Damien Le Moal 2019-07-11  304  
b49773e7bcf316 Damien Le Moal 2019-07-11  305  	/* Zoned block device write operation case: do not plug the BIO */
b49773e7bcf316 Damien Le Moal 2019-07-11  306  	return NULL;
b49773e7bcf316 Damien Le Moal 2019-07-11  307  }
b49773e7bcf316 Damien Le Moal 2019-07-11  308  

:::::: The code at line 303 was first introduced by commit
:::::: b49773e7bcf316f238f6709ad9e1999dcc3ed433 block: Disable write plugging for zoned block devices

:::::: TO: Damien Le Moal <damien.lemoal@wdc.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
