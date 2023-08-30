Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320DDEA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 00:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693355747; x=1724891747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n6Kz9XaNuKkBzDFFyq6pCiPERxYK+nSmDcDPaqD19os=;
  b=HlEYMO7EaVFl+GEcEffqrXfJ/7UVjSAjtEdNZrtMfiVJRz1WrUCt4R8t
   wBELlq7A6ZqH3gol9F5O+iIKzo07pJcKUgVJ51At2Syc1lZmbAAg/T8Qk
   tyfCPbg5ED2Od84Dgbd2KULiM/cqcdQdNzXjBIC6r/sSxJOfeZDOG3Z9X
   ip36wF7T/bbQu4bJ3mYOJIeC8irOutENdeteUnkPHDIyQYHst6nud9I2j
   /hUIcW2/IS416vvzU6vTO0Ns3mZHJFBKbANkPwUnv8ElrW+gvV/LHavsc
   JJESdSyNxx+aZKrqeo7HVZ/JRUcS/xCv1sNEnltqc32RlVE7CQMmtILRB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441878475"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="441878475"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 17:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688702193"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="688702193"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 17:35:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb9BQ-0009El-1f;
	Wed, 30 Aug 2023 00:35:44 +0000
Date: Wed, 30 Aug 2023 08:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/3] block/blk-mq.h:281:19: error: no
 member named 'plug' in 'struct task_struct'
Message-ID: <202308300804.So6fb7Xh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   b5c1ca09d21fbaeee5b3a02ea3d5204203fc6958
commit: 3dc6e416a159a0bf3336e4c3469531fbbd128146 [2/3] ANDROID: force struct blk_mq_alloc_data to be defined in KMI
config: i386-buildonly-randconfig-002-20230830 (https://download.01.org/0day-ci/archive/20230830/202308300804.So6fb7Xh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300804.So6fb7Xh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300804.So6fb7Xh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:11:
   In file included from block/blk-mq.h:6:
>> block/blk-mq-tag.h:42:43: warning: declaration of 'struct blk_mq_alloc_data' will not be visible outside of this function [-Wvisibility]
   extern unsigned int blk_mq_get_tag(struct blk_mq_alloc_data *data);
                                             ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:11:
>> block/blk-mq.h:281:19: error: no member named 'plug' in 'struct task_struct'
                   return current->plug;
                          ~~~~~~~  ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
>> block/blk-mq-sched.h:27:55: warning: declaration of 'struct elevator_type' will not be visible outside of this function [-Wvisibility]
   int blk_mq_init_sched(struct request_queue *q, struct elevator_type *e);
                                                         ^
>> block/blk-mq-sched.h:47:12: error: incomplete definition of type 'struct elevator_queue'
           if (e && e->type->ops.allow_merge)
                    ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
   struct elevator_queue;
          ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:48:11: error: incomplete definition of type 'struct elevator_queue'
                   return e->type->ops.allow_merge(q, rq, bio);
                          ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
   struct elevator_queue;
          ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:57:12: error: incomplete definition of type 'struct elevator_queue'
           if (e && e->type->ops.completed_request)
                    ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
   struct elevator_queue;
          ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:58:4: error: incomplete definition of type 'struct elevator_queue'
                   e->type->ops.completed_request(rq, now);
                   ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
   struct elevator_queue;
          ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:66:44: error: incomplete definition of type 'struct elevator_queue'
           if ((rq->rq_flags & RQF_ELVPRIV) && e && e->type->ops.requeue_request)
                                                    ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
   struct elevator_queue;
          ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:67:4: error: incomplete definition of type 'struct elevator_queue'
                   e->type->ops.requeue_request(rq);
                   ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
   struct elevator_queue;
          ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:74:12: error: incomplete definition of type 'struct elevator_queue'
           if (e && e->type->ops.has_work)
                    ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
   struct elevator_queue;
          ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:75:11: error: incomplete definition of type 'struct elevator_queue'
                   return e->type->ops.has_work(hctx);
                          ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
   struct elevator_queue;
          ^
   In file included from block/vendor_hooks.c:6:
>> block/blk.h:206:17: warning: declaration of 'struct elevator_type' will not be visible outside of this function [-Wvisibility]
                                 struct elevator_type *new_e);
                                        ^
   3 warnings and 9 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +281 block/blk-mq.h

0da73d00ca111a Minwoo Im      2018-07-02  254  
b49773e7bcf316 Damien Le Moal 2019-07-11  255  /*
b49773e7bcf316 Damien Le Moal 2019-07-11  256   * blk_mq_plug() - Get caller context plug
b49773e7bcf316 Damien Le Moal 2019-07-11  257   * @q: request queue
b49773e7bcf316 Damien Le Moal 2019-07-11  258   * @bio : the bio being submitted by the caller context
b49773e7bcf316 Damien Le Moal 2019-07-11  259   *
b49773e7bcf316 Damien Le Moal 2019-07-11  260   * Plugging, by design, may delay the insertion of BIOs into the elevator in
b49773e7bcf316 Damien Le Moal 2019-07-11  261   * order to increase BIO merging opportunities. This however can cause BIO
b49773e7bcf316 Damien Le Moal 2019-07-11  262   * insertion order to change from the order in which submit_bio() is being
b49773e7bcf316 Damien Le Moal 2019-07-11  263   * executed in the case of multiple contexts concurrently issuing BIOs to a
b49773e7bcf316 Damien Le Moal 2019-07-11  264   * device, even if these context are synchronized to tightly control BIO issuing
b49773e7bcf316 Damien Le Moal 2019-07-11  265   * order. While this is not a problem with regular block devices, this ordering
b49773e7bcf316 Damien Le Moal 2019-07-11  266   * change can cause write BIO failures with zoned block devices as these
b49773e7bcf316 Damien Le Moal 2019-07-11  267   * require sequential write patterns to zones. Prevent this from happening by
b49773e7bcf316 Damien Le Moal 2019-07-11  268   * ignoring the plug state of a BIO issuing context if the target request queue
b49773e7bcf316 Damien Le Moal 2019-07-11  269   * is for a zoned block device and the BIO to plug is a write operation.
b49773e7bcf316 Damien Le Moal 2019-07-11  270   *
b49773e7bcf316 Damien Le Moal 2019-07-11  271   * Return current->plug if the bio can be plugged and NULL otherwise
b49773e7bcf316 Damien Le Moal 2019-07-11  272   */
b49773e7bcf316 Damien Le Moal 2019-07-11  273  static inline struct blk_plug *blk_mq_plug(struct request_queue *q,
b49773e7bcf316 Damien Le Moal 2019-07-11  274  					   struct bio *bio)
b49773e7bcf316 Damien Le Moal 2019-07-11  275  {
b49773e7bcf316 Damien Le Moal 2019-07-11  276  	/*
b49773e7bcf316 Damien Le Moal 2019-07-11  277  	 * For regular block devices or read operations, use the context plug
b49773e7bcf316 Damien Le Moal 2019-07-11  278  	 * which may be NULL if blk_start_plug() was not executed.
b49773e7bcf316 Damien Le Moal 2019-07-11  279  	 */
b49773e7bcf316 Damien Le Moal 2019-07-11  280  	if (!blk_queue_is_zoned(q) || !op_is_write(bio_op(bio)))
b49773e7bcf316 Damien Le Moal 2019-07-11 @281  		return current->plug;
b49773e7bcf316 Damien Le Moal 2019-07-11  282  
b49773e7bcf316 Damien Le Moal 2019-07-11  283  	/* Zoned block device write operation case: do not plug the BIO */
b49773e7bcf316 Damien Le Moal 2019-07-11  284  	return NULL;
b49773e7bcf316 Damien Le Moal 2019-07-11  285  }
b49773e7bcf316 Damien Le Moal 2019-07-11  286  

:::::: The code at line 281 was first introduced by commit
:::::: b49773e7bcf316f238f6709ad9e1999dcc3ed433 block: Disable write plugging for zoned block devices

:::::: TO: Damien Le Moal <damien.lemoal@wdc.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
