Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D80F23C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 06:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684219925; x=1715755925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=07cYLAB7gUQIBwnYpOGyFSOHtBSCP47hoz6qf5Xgo6A=;
  b=Nq4n3Tpu0cFv3X+bhtPlZVNxBzz7WvqvepP4ONITN06DiqayklRkoCIY
   xkZhbHC4rGVz4k2ar7AnG0q3cZ06ApOZqxdFMz9W165C4/xC7wNHHgfpv
   Tm6A94oRhoh7Mb0a07o1ou8Z7IrmVdO4e1gYcXK8/2qffXwtHeMSdSOJl
   /TxY1y0UjzEqn2eGH33+mTMGrGo1fN2VgwbLRlX2pdqBlhE0NJBeUJAiX
   gPOsRq6T6v3Hb2GeuI0TOXMCY5KI5/tialdNwfxqfwo22/yQ6OtDMBAAk
   gmc4qdcddTQ+m5R5qnzyaeRasu8rA0OOuMmmE7VtISvUd5Lp6c+aVmn0q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331760315"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="331760315"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 23:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="947725329"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="947725329"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 May 2023 23:51:59 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pyoXO-00077e-2r;
	Tue, 16 May 2023 06:51:58 +0000
Date: Tue, 16 May 2023 14:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:retain-zoned-write-order 6/18]
 block/bfq-iosched.c:7721:41: warning: 'bfq_queue_debugfs_attrs' defined but
 not used
Message-ID: <202305161453.cfrYjaZF-lkp@intel.com>
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
config: x86_64-randconfig-a011-20230515 (https://download.01.org/0day-ci/archive/20230516/202305161453.cfrYjaZF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/bvanassche/linux/commit/5ea8c1a1b20acc1cbbcf22f4872d87ef8e35fbd5
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche retain-zoned-write-order
        git checkout 5ea8c1a1b20acc1cbbcf22f4872d87ef8e35fbd5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305161453.cfrYjaZF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/bfq-iosched.c:7663:17: error: 'blk_mq_debugfs_rq_show' undeclared here (not in a function); did you mean 'blk_mq_debugfs_register'?
    7663 |         .show = blk_mq_debugfs_rq_show,
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 blk_mq_debugfs_register
   block/bfq-iosched.c: In function 'bfq_queued_list_show':
   block/bfq-iosched.c:7712:41: error: implicit declaration of function '__blk_mq_debugfs_rq_show'; did you mean 'blk_mq_debugfs_register'? [-Werror=implicit-function-declaration]
    7712 |                                         __blk_mq_debugfs_rq_show(m, rq);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                         blk_mq_debugfs_register
   block/bfq-iosched.c: At top level:
   block/bfq-iosched.c:7721:41: error: array type has incomplete element type 'struct blk_mq_debugfs_attr'
    7721 | static const struct blk_mq_debugfs_attr bfq_queue_debugfs_attrs[] = {
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-iosched.c:7757:10: error: 'struct elevator_type' has no member named 'queue_debugfs_attrs'
    7757 |         .queue_debugfs_attrs =  bfq_queue_debugfs_attrs,
         |          ^~~~~~~~~~~~~~~~~~~
>> block/bfq-iosched.c:7721:41: warning: 'bfq_queue_debugfs_attrs' defined but not used [-Wunused-variable]
    7721 | static const struct blk_mq_debugfs_attr bfq_queue_debugfs_attrs[] = {
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/bfq_queue_debugfs_attrs +7721 block/bfq-iosched.c

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
  7757		.queue_debugfs_attrs =	bfq_queue_debugfs_attrs,
  7758		.elevator_name =	"bfq",
  7759		.elevator_owner =	THIS_MODULE,
  7760	};
  7761	MODULE_ALIAS("bfq-iosched");
  7762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
