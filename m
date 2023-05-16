Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E58E29B0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 04:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684213075; x=1715749075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8R0bajwQ2AIaMOSNDiwwtgVQhbkGtD8sskQnrH2Xes=;
  b=lduX0tFt/wTqk8f1DKYs8wHCSHTV9G02HmZnR3dHfvZT384WeDxq1Kk3
   eY8auVHvGTXscZIoNzF2Fnl9wmVpu0QoQx+WHYzFKrPri81V4p7505+la
   g7BKXAfYl0oWdg7r8MO/gNgI697tapulAqLN2FY1l1G/ftiDRex7Fn0Mc
   YhjLLnzs0fmJ4w0wMSJvacWpDfVPi/4k9P3HZ42hTlb6Emocp7tlfvDF9
   fwQgEr+FBv0kIhXLzvNEr+HTfCfMvBXxSSwI8cryNTB9mliKkGlKSw61/
   5gtUi8dCwMyUqsQzy4C8bVnB09sEo4ss1wJdKkCOZ5m2Bl6VRRllmrX8g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="350217114"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="350217114"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 21:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="695298830"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="695298830"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 May 2023 21:57:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pymkz-0006zP-0Y;
	Tue, 16 May 2023 04:57:53 +0000
Date: Tue, 16 May 2023 12:57:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:retain-zoned-write-order 6/18]
 block/bfq-iosched.c:7663:17: error: 'blk_mq_debugfs_rq_show' undeclared here
 (not in a function); did you mean 'blk_mq_debugfs_register'?
Message-ID: <202305161211.2uR1Rucq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux retain-zoned-write-order
head:   21c7b3f9031688e908ba662288da9349522e71f9
commit: 5ea8c1a1b20acc1cbbcf22f4872d87ef8e35fbd5 [6/18] block, bfq: Export more information to debugfs
config: riscv-randconfig-r042-20230515 (https://download.01.org/0day-ci/archive/20230516/202305161211.2uR1Rucq-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/5ea8c1a1b20acc1cbbcf22f4872d87ef8e35fbd5
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche retain-zoned-write-order
        git checkout 5ea8c1a1b20acc1cbbcf22f4872d87ef8e35fbd5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash block/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305161211.2uR1Rucq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/bfq-iosched.c:7663:17: error: 'blk_mq_debugfs_rq_show' undeclared here (not in a function); did you mean 'blk_mq_debugfs_register'?
    7663 |         .show = blk_mq_debugfs_rq_show,
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 blk_mq_debugfs_register
   block/bfq-iosched.c: In function 'bfq_queued_list_show':
>> block/bfq-iosched.c:7712:41: error: implicit declaration of function '__blk_mq_debugfs_rq_show'; did you mean 'blk_mq_debugfs_register'? [-Werror=implicit-function-declaration]
    7712 |                                         __blk_mq_debugfs_rq_show(m, rq);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                         blk_mq_debugfs_register
   block/bfq-iosched.c: At top level:
>> block/bfq-iosched.c:7721:41: error: array type has incomplete element type 'struct blk_mq_debugfs_attr'
    7721 | static const struct blk_mq_debugfs_attr bfq_queue_debugfs_attrs[] = {
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
>> block/bfq-iosched.c:7757:10: error: 'struct elevator_type' has no member named 'queue_debugfs_attrs'
    7757 |         .queue_debugfs_attrs =  bfq_queue_debugfs_attrs,
         |          ^~~~~~~~~~~~~~~~~~~
   block/bfq-iosched.c:7721:41: warning: 'bfq_queue_debugfs_attrs' defined but not used [-Wunused-variable]
    7721 | static const struct blk_mq_debugfs_attr bfq_queue_debugfs_attrs[] = {
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +7663 block/bfq-iosched.c

  7658	
  7659	static const struct seq_operations bfq_dispatch_list_ops = {
  7660		.start = bfq_dispatch_start,
  7661		.next = bfq_dispatch_next,
  7662		.stop = bfq_dispatch_stop,
> 7663		.show = blk_mq_debugfs_rq_show,
  7664	};
  7665	
  7666	static int bfq_tot_rq_in_driver_show(void *data, struct seq_file *m)
  7667	{
  7668		struct request_queue *q = data;
  7669		struct bfq_data *bfqd = q->elevator->elevator_data;
  7670	
  7671		seq_printf(m, "%u\n", READ_ONCE(bfqd->tot_rq_in_driver));
  7672		return 0;
  7673	}
  7674	
  7675	static int bfq_queued_show(void *data, struct seq_file *m)
  7676	{
  7677		struct request_queue *q = data;
  7678		struct bfq_data *bfqd = q->elevator->elevator_data;
  7679	
  7680		seq_printf(m, "%u\n", READ_ONCE(bfqd->queued));
  7681		return 0;
  7682	}
  7683	
  7684	static int bfq_queued_list_show(void *data, struct seq_file *m)
  7685	{
  7686		struct request_queue *q = data;
  7687		struct bfq_data *bfqd = q->elevator->elevator_data;
  7688		struct io_cq *icq;
  7689	
  7690		spin_lock_irq(&q->queue_lock);
  7691		list_for_each_entry(icq, &q->icq_list, q_node) {
  7692			struct bfq_io_cq *bic = icq_to_bic(icq);
  7693			unsigned int actuator, is_sync;
  7694	
  7695			seq_printf(m, "icq = %p; bic = %p\n", icq, bic);
  7696			for (actuator = 0; actuator < bfqd->num_actuators; actuator++) {
  7697				seq_printf(m, "actuator = %u\n", actuator);
  7698				for (is_sync = 0; is_sync < 2; is_sync++) {
  7699					struct bfq_queue *bfq =
  7700						bic_to_bfqq(bic, is_sync, actuator);
  7701					struct request *rq;
  7702	
  7703					if (!bfq)
  7704						continue;
  7705					seq_printf(
  7706						m,
  7707						"is_sync = %u; busy %u; dispatched %u; queued %u %u\n",
  7708						is_sync, bfq_bfqq_busy(bfq),
  7709						bfq->dispatched, bfq->queued[0],
  7710						bfq->queued[1]);
  7711					list_for_each_entry(rq, &bfq->fifo, queuelist)
> 7712						__blk_mq_debugfs_rq_show(m, rq);
  7713				}
  7714			}
  7715		}
  7716		spin_unlock_irq(&q->queue_lock);
  7717	
  7718		return 0;
  7719	}
  7720	
> 7721	static const struct blk_mq_debugfs_attr bfq_queue_debugfs_attrs[] = {
  7722		{ "busy_queues0", 0444, bfq_busy_queues0_show },
  7723		{ "busy_queues1", 0444, bfq_busy_queues1_show },
  7724		{ "busy_queues2", 0444, bfq_busy_queues2_show },
  7725		{ "dispatch_list", 0400, .seq_ops = &bfq_dispatch_list_ops },
  7726		{ "tot_rq_in_driver", 0444, bfq_tot_rq_in_driver_show },
  7727		{ "queued", 0444, bfq_queued_show },
  7728		{ "queued_list", 0400, bfq_queued_list_show },
  7729		{},
  7730	};
  7731	static struct elevator_type iosched_bfq_mq = {
  7732		.ops = {
  7733			.limit_depth		= bfq_limit_depth,
  7734			.prepare_request	= bfq_prepare_request,
  7735			.requeue_request        = bfq_finish_requeue_request,
  7736			.finish_request		= bfq_finish_request,
  7737			.exit_icq		= bfq_exit_icq,
  7738			.insert_requests	= bfq_insert_requests,
  7739			.dispatch_request	= bfq_dispatch_request,
  7740			.next_request		= elv_rb_latter_request,
  7741			.former_request		= elv_rb_former_request,
  7742			.allow_merge		= bfq_allow_bio_merge,
  7743			.bio_merge		= bfq_bio_merge,
  7744			.request_merge		= bfq_request_merge,
  7745			.requests_merged	= bfq_requests_merged,
  7746			.request_merged		= bfq_request_merged,
  7747			.has_work		= bfq_has_work,
  7748			.depth_updated		= bfq_depth_updated,
  7749			.init_hctx		= bfq_init_hctx,
  7750			.init_sched		= bfq_init_queue,
  7751			.exit_sched		= bfq_exit_queue,
  7752		},
  7753	
  7754		.icq_size =		sizeof(struct bfq_io_cq),
  7755		.icq_align =		__alignof__(struct bfq_io_cq),
  7756		.elevator_attrs =	bfq_attrs,
> 7757		.queue_debugfs_attrs =	bfq_queue_debugfs_attrs,
  7758		.elevator_name =	"bfq",
  7759		.elevator_owner =	THIS_MODULE,
  7760	};
  7761	MODULE_ALIAS("bfq-iosched");
  7762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
