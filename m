Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6254FF66
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 16:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Or/4YRf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702917608; x=1734453608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iaS5SyGjdH1EfP0iMTFJnTR1+tNrThNZ8fDep6gr7W0=;
  b=Or/4YRf6EuNGBMk1PAqyeRVLtpxi/vwY9SpCHKEJpO3kOLqVpvVJCEsq
   2SJ/cyzw6VYSfBtoq7WZp3iq9onnSh1fvATLfSWMQGqyc/lkILRKAKfg3
   3czHMeW3N9yY/iwj6H0rf+4uoCwKJH5CIBpH6tSQ3JRRdtVfpL4ajDj/e
   XyOS4B5iM5csCUczxePdEPbzfkcE/9RqKNnZ+xANg7xwXVg3bDgk9R4jg
   LY8jlUQJhxelzwSl7B1td6wHDSr179+dFBDhddETaSEHLEdorrR6s/sAF
   Q3KkO1M6BBbkjtR6ACTI36ohKHATSS8D3r9b3gIrUrz5qpKiB/piZl0/V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2354665"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="2354665"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 08:40:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="804579808"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="804579808"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Dec 2023 08:40:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFGex-0004K9-1l;
	Mon, 18 Dec 2023 16:40:03 +0000
Date: Tue, 19 Dec 2023 00:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:mq-deadline 4/4] block/mq-deadline_test.c:17:59:
 warning: initialization of 'int' from 'long unsigned int *' makes integer
 from pointer without a cast
Message-ID: <202312190007.NbX6MsJo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux mq-deadline
head:   f1201b17a2fec011e8cdd6be24a413a5693941b7
commit: f1201b17a2fec011e8cdd6be24a413a5693941b7 [4/4] block/mq-deadline: Prevent zoned write reordering due to I/O prioritization
config: i386-randconfig-006-20231218 (https://download.01.org/0day-ci/archive/20231219/202312190007.NbX6MsJo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190007.NbX6MsJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190007.NbX6MsJo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/mq-deadline.c: In function 'dd_zone_prio':
   block/mq-deadline.c:222:30: error: implicit declaration of function 'blk_rq_zone_no'; did you mean 'bdev_zone_no'? [-Werror=implicit-function-declaration]
     222 |                 while (rq && blk_rq_zone_no(rq) == zno) {
         |                              ^~~~~~~~~~~~~~
         |                              bdev_zone_no
   In file included from block/mq-deadline.c:1354:
   block/mq-deadline_test.c: In function 'test_zone_prio':
   block/mq-deadline_test.c:16:41: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
      16 |         static struct gendisk disk = { .conv_zones_bitmap = NULL,
         |                                         ^~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:251,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from block/mq-deadline.c:8:
>> include/linux/stddef.h:8:14: warning: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   block/mq-deadline_test.c:16:61: note: in expansion of macro 'NULL'
      16 |         static struct gendisk disk = { .conv_zones_bitmap = NULL,
         |                                                             ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'disk.major')
       8 | #define NULL ((void *)0)
         |              ^
   block/mq-deadline_test.c:16:61: note: in expansion of macro 'NULL'
      16 |         static struct gendisk disk = { .conv_zones_bitmap = NULL,
         |                                                             ^~~~
   block/mq-deadline_test.c:17:41: error: 'struct gendisk' has no member named 'seq_zones_wlock'
      17 |                                        .seq_zones_wlock = seq_zones_wlock,
         |                                         ^~~~~~~~~~~~~~~
>> block/mq-deadline_test.c:17:59: warning: initialization of 'int' from 'long unsigned int *' makes integer from pointer without a cast [-Wint-conversion]
      17 |                                        .seq_zones_wlock = seq_zones_wlock,
         |                                                           ^~~~~~~~~~~~~~~
   block/mq-deadline_test.c:17:59: note: (near initialization for 'disk.first_minor')
   block/mq-deadline_test.c:62:31: warning: variable 'dd' set but not used [-Wunused-but-set-variable]
      62 |         struct deadline_data *dd;
         |                               ^~
   cc1: some warnings being treated as errors


vim +17 block/mq-deadline_test.c

     7	
     8	/*
     9	 * Test that the write order is preserved if a higher I/O priority is assigned to higher LBAs.
    10	 * This test fails if dd_zone_prio() always returns DD_INVALID_PRIO.
    11	 */
    12	static void test_zone_prio(struct kunit *test)
    13	{
    14		static struct block_device bdev;
    15		static unsigned long seq_zones_wlock[1];
  > 16		static struct gendisk disk = { .conv_zones_bitmap = NULL,
  > 17					       .seq_zones_wlock = seq_zones_wlock,
    18					       .part0 = &bdev };
    19		static struct request_queue queue = {
    20			.disk = &disk,
    21			.limits = { .zoned = BLK_ZONED_HM, .chunk_sectors = 16 }
    22		};
    23		static struct blk_mq_hw_ctx hctx = { .queue = &queue };
    24		static struct bio bio1 = { .bi_bdev = &bdev,
    25					   .bi_opf = REQ_OP_WRITE,
    26					   .bi_ioprio = IOPRIO_CLASS_IDLE
    27							<< IOPRIO_CLASS_SHIFT };
    28		static struct request rq1 = { .q = &queue,
    29					      .cmd_flags = REQ_OP_WRITE,
    30					      .__sector = 1,
    31					      .__data_len = 1,
    32					      .bio = &bio1,
    33					      .mq_hctx = &hctx,
    34					      .ioprio = IOPRIO_CLASS_IDLE
    35							<< IOPRIO_CLASS_SHIFT };
    36		static struct bio bio2 = { .bi_bdev = &bdev,
    37					   .bi_opf = REQ_OP_WRITE,
    38					   .bi_ioprio = IOPRIO_CLASS_BE
    39							<< IOPRIO_CLASS_SHIFT };
    40		static struct request rq2 = { .q = &queue,
    41					      .cmd_flags = REQ_OP_WRITE,
    42					      .__sector = 3,
    43					      .__data_len = 1,
    44					      .bio = &bio2,
    45					      .mq_hctx = &hctx,
    46					      .ioprio = IOPRIO_CLASS_BE
    47							<< IOPRIO_CLASS_SHIFT };
    48		static struct bio bio3 = { .bi_bdev = &bdev,
    49					   .bi_opf = REQ_OP_WRITE,
    50					   .bi_ioprio = IOPRIO_CLASS_RT
    51							<< IOPRIO_CLASS_SHIFT };
    52		static struct request rq3 = { .q = &queue,
    53					      .cmd_flags = REQ_OP_WRITE,
    54					      .__sector = 5,
    55					      .__data_len = 1,
    56					      .bio = &bio3,
    57					      .mq_hctx = &hctx,
    58					      .ioprio = IOPRIO_CLASS_RT
    59							<< IOPRIO_CLASS_SHIFT };
    60		struct request *rq;
    61		static LIST_HEAD(rq_list);
    62		struct deadline_data *dd;
    63	
    64		bdev.bd_disk = &disk;
    65		bdev.bd_queue = &queue;
    66		disk.queue = &queue;
    67	
    68		KUNIT_EXPECT_TRUE(test, blk_rq_is_seq_zoned_write(&rq1));
    69		KUNIT_EXPECT_TRUE(test, blk_rq_is_seq_zoned_write(&rq2));
    70		KUNIT_EXPECT_TRUE(test, blk_rq_is_seq_zoned_write(&rq3));
    71	
    72		dd_init_sched(&queue, &mq_deadline);
    73		dd = queue.elevator->elevator_data;
    74		dd_prepare_request(&rq1);
    75		dd_prepare_request(&rq2);
    76		dd_prepare_request(&rq3);
    77		list_add_tail(&rq1.queuelist, &rq_list);
    78		list_add_tail(&rq2.queuelist, &rq_list);
    79		list_add_tail(&rq3.queuelist, &rq_list);
    80		dd_insert_requests(&hctx, &rq_list, false);
    81		rq = dd_dispatch_request(&hctx);
    82		KUNIT_EXPECT_PTR_EQ(test, rq, &rq1);
    83		dd_finish_request(rq);
    84		rq = dd_dispatch_request(&hctx);
    85		KUNIT_EXPECT_PTR_EQ(test, rq, &rq2);
    86		dd_finish_request(rq);
    87		rq = dd_dispatch_request(&hctx);
    88		KUNIT_EXPECT_PTR_EQ(test, rq, &rq3);
    89		dd_finish_request(rq);
    90		dd_exit_sched(queue.elevator);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
