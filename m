Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5371CF90
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCYbBFf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703001243; x=1734537243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWRRYdKy5Mm9cjJAFNJ/Rxnii8S3SbNnQ/T9WALo93s=;
  b=WCYbBFf4zvs8ppCgWKTqGIbod1Bs2IpyboxrCrcfPXB0fDgEQgVliXhj
   CWcv0pMtXRhGjERbsy7oFVPQ9xGVICKr3oYAQ8jUFd1oAQe4PxXmYrMV5
   9oLzmD+UK5IQtBHl9zNtr+VFjvYrD/Md6Q4EfZUw/Yjes5wBoEGsG3+qs
   j+c1Fk02QOwcQmZxOL5Qd8aAdI7dE3vSuIdtD9UGpfk00k9adoq1EsNeI
   6e9nHNQd4ll7TmNPix8nSXepeNUbQd1pCMnOHPMwNjkdE2RK1lUqixr0R
   Nf0v7LSRp3nljRz0xBNkP46cLODkUerztsVuTC2VeS+ntnjecJDlmZNFr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="399510548"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="399510548"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 07:54:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="776021855"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="776021855"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 Dec 2023 07:54:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFcPv-0005aP-19;
	Tue, 19 Dec 2023 15:53:59 +0000
Date: Tue, 19 Dec 2023 23:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:mq-deadline 4/4] block/mq-deadline_test.c:87:31: error:
 initializer element is not computable at load time
Message-ID: <202312192307.1LD9sNEj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux mq-deadline
head:   f6b0783d68d20926e1e54a081cfd5d85a05e4cfd
commit: f6b0783d68d20926e1e54a081cfd5d85a05e4cfd [4/4] block/mq-deadline: Prevent zoned write reordering due to I/O prioritization
config: x86_64-randconfig-123-20231219 (https://download.01.org/0day-ci/archive/20231219/202312192307.1LD9sNEj-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312192307.1LD9sNEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312192307.1LD9sNEj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/mq-deadline.c:1343:0:
   block/mq-deadline_test.c: In function 'test_zone_prio':
   block/mq-deadline_test.c:86:34: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
     static struct gendisk disk = { .conv_zones_bitmap = NULL,
                                     ^~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5:0,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:251,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from block/mq-deadline.c:8:
   include/linux/stddef.h:8:14: warning: initialization makes integer from pointer without a cast [-Wint-conversion]
    #define NULL ((void *)0)
                 ^
   block/mq-deadline_test.c:86:54: note: in expansion of macro 'NULL'
     static struct gendisk disk = { .conv_zones_bitmap = NULL,
                                                         ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'disk.major')
    #define NULL ((void *)0)
                 ^
   block/mq-deadline_test.c:86:54: note: in expansion of macro 'NULL'
     static struct gendisk disk = { .conv_zones_bitmap = NULL,
                                                         ^~~~
   In file included from block/mq-deadline.c:1343:0:
   block/mq-deadline_test.c:87:13: error: 'struct gendisk' has no member named 'seq_zones_wlock'
               .seq_zones_wlock = seq_zones_wlock,
                ^~~~~~~~~~~~~~~
   block/mq-deadline_test.c:87:31: warning: initialization makes integer from pointer without a cast [-Wint-conversion]
               .seq_zones_wlock = seq_zones_wlock,
                                  ^~~~~~~~~~~~~~~
   block/mq-deadline_test.c:87:31: note: (near initialization for 'disk.first_minor')
>> block/mq-deadline_test.c:87:31: error: initializer element is not computable at load time
   block/mq-deadline_test.c:87:31: note: (near initialization for 'disk.first_minor')
   At top level:
   block/mq-deadline.c:118:17: warning: 'prio_to_ioprio_class' defined but not used [-Wunused-const-variable=]
    static const u8 prio_to_ioprio_class[] = {
                    ^~~~~~~~~~~~~~~~~~~~


vim +87 block/mq-deadline_test.c

    76	
    77	/*
    78	 * Test that the write order is preserved if a higher I/O priority is assigned
    79	 * to higher LBAs. This test fails if dd_zone_prio() always returns
    80	 * DD_INVALID_PRIO.
    81	 */
    82	static void test_zone_prio(struct kunit *test)
    83	{
    84		static struct block_device bdev;
    85		static unsigned long seq_zones_wlock[1];
    86		static struct gendisk disk = { .conv_zones_bitmap = NULL,
  > 87					       .seq_zones_wlock = seq_zones_wlock,
    88					       .part0 = &bdev };
    89		static struct request_queue queue = {
    90			.disk = &disk,
    91			.limits = { .zoned = BLK_ZONED_HM, .chunk_sectors = 16 }
    92		};
    93		static struct blk_mq_hw_ctx hctx = { .queue = &queue };
    94		static struct bio bio1 = { .bi_bdev = &bdev,
    95					   .bi_opf = REQ_OP_WRITE,
    96					   .bi_ioprio = IOPRIO_CLASS_IDLE
    97							<< IOPRIO_CLASS_SHIFT };
    98		static struct request rq1 = { .q = &queue,
    99					      .cmd_flags = REQ_OP_WRITE,
   100					      .__sector = 1,
   101					      .__data_len = 1,
   102					      .bio = &bio1,
   103					      .mq_hctx = &hctx,
   104					      .ioprio = IOPRIO_CLASS_IDLE
   105							<< IOPRIO_CLASS_SHIFT };
   106		static struct bio bio2 = { .bi_bdev = &bdev,
   107					   .bi_opf = REQ_OP_WRITE,
   108					   .bi_ioprio = IOPRIO_CLASS_BE
   109							<< IOPRIO_CLASS_SHIFT };
   110		static struct request rq2 = { .q = &queue,
   111					      .cmd_flags = REQ_OP_WRITE,
   112					      .__sector = 3,
   113					      .__data_len = 1,
   114					      .bio = &bio2,
   115					      .mq_hctx = &hctx,
   116					      .ioprio = IOPRIO_CLASS_BE
   117							<< IOPRIO_CLASS_SHIFT };
   118		static struct bio bio3 = { .bi_bdev = &bdev,
   119					   .bi_opf = REQ_OP_WRITE,
   120					   .bi_ioprio = IOPRIO_CLASS_RT
   121							<< IOPRIO_CLASS_SHIFT };
   122		static struct request rq3 = { .q = &queue,
   123					      .cmd_flags = REQ_OP_WRITE,
   124					      .__sector = 5,
   125					      .__data_len = 1,
   126					      .bio = &bio3,
   127					      .mq_hctx = &hctx,
   128					      .ioprio = IOPRIO_CLASS_RT
   129							<< IOPRIO_CLASS_SHIFT };
   130		struct request *rq;
   131		static LIST_HEAD(rq_list);
   132	
   133		bdev.bd_disk = &disk;
   134		bdev.bd_queue = &queue;
   135		disk.queue = &queue;
   136	
   137		KUNIT_EXPECT_TRUE(test, blk_rq_is_seq_zoned_write(&rq1));
   138		KUNIT_EXPECT_TRUE(test, blk_rq_is_seq_zoned_write(&rq2));
   139		KUNIT_EXPECT_TRUE(test, blk_rq_is_seq_zoned_write(&rq3));
   140	
   141		dd_init_sched(&queue, &mq_deadline);
   142		dd_prepare_request(&rq1);
   143		dd_prepare_request(&rq2);
   144		dd_prepare_request(&rq3);
   145		list_add_tail(&rq1.queuelist, &rq_list);
   146		list_add_tail(&rq2.queuelist, &rq_list);
   147		list_add_tail(&rq3.queuelist, &rq_list);
   148		dd_insert_requests(&hctx, &rq_list, false);
   149		rq = dd_dispatch_request(&hctx);
   150		KUNIT_EXPECT_PTR_EQ(test, rq, &rq1);
   151		dd_finish_request(rq);
   152		rq = dd_dispatch_request(&hctx);
   153		KUNIT_EXPECT_PTR_EQ(test, rq, &rq2);
   154		dd_finish_request(rq);
   155		rq = dd_dispatch_request(&hctx);
   156		KUNIT_EXPECT_PTR_EQ(test, rq, &rq3);
   157		dd_finish_request(rq);
   158		dd_exit_sched(queue.elevator);
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
