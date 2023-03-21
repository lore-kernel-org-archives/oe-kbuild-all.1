Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC221FD2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 07:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679384847; x=1710920847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QzNo6nZIveA6+UK+HIprQKNsCg6ONLs9quKZl0bSY08=;
  b=GlHPOWb3gkKvcrU+lYcO/1SfiMRqY/t04giToDk+0EeFH7ZeYUzzt1/4
   mFPCE8xf9KiXsSV/yYpivkbbFoMslpLne9REEdyV4dnU1ne26VUcMDOa7
   DiBZetDhFxcFLl96OPtTwKj/yXGi01L7JhTZrpvbt2kScgD9hUlY9k42u
   +lNO1MQZUXJlW4G9N+4nzYFud1AEiBM8wdKppUJbSzmI89gHlgh1e13cG
   zOAwBH7BNd1WjWlRBdvrCUdH9f9HlvCTo3Vp/AjVkZLZHmj97DDrSH90O
   DNaY7SEcYil/ZN3Si7q4yOdngwpljSZaHAyVAcHTHb34Py89tP37vPkSa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="322716190"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="322716190"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 00:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="711703251"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="711703251"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Mar 2023 00:47:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peWiE-000BjY-2F;
	Tue, 21 Mar 2023 07:47:18 +0000
Date: Tue, 21 Mar 2023 15:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:block-for-next 5/5] block/blk-mq.c:1509:42: error:
 implicit declaration of function 'blk_rq_zone_no'; did you mean
 'blk_rq_to_qc'?
Message-ID: <202303211526.mJm1osvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux block-for-next
head:   bb173dffcdb19b0a62a7885d64f037d39b61d04c
commit: bb173dffcdb19b0a62a7885d64f037d39b61d04c [5/5] block: Preserve LBA order when requeuing
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230321/202303211526.mJm1osvG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/bvanassche/linux/commit/bb173dffcdb19b0a62a7885d64f037d39b61d04c
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche block-for-next
        git checkout bb173dffcdb19b0a62a7885d64f037d39b61d04c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211526.mJm1osvG-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/blk-mq.c: In function 'blk_mq_insert_rq':
>> block/blk-mq.c:1509:42: error: implicit declaration of function 'blk_rq_zone_no'; did you mean 'blk_rq_to_qc'? [-Werror=implicit-function-declaration]
    1509 |                 const unsigned int zno = blk_rq_zone_no(rq);
         |                                          ^~~~~~~~~~~~~~
         |                                          blk_rq_to_qc
   cc1: some warnings being treated as errors


vim +1509 block/blk-mq.c

  1497	
  1498	static void blk_mq_insert_rq(struct request *rq, struct list_head *list,
  1499				     bool at_head)
  1500	{
  1501		bool zone_in_list = false;
  1502		struct request *rq2;
  1503	
  1504		/*
  1505		 * For request queues associated with a zoned block device, check
  1506		 * whether another request for the same zone has already been queued.
  1507		 */
  1508		if (blk_queue_is_zoned(rq->q)) {
> 1509			const unsigned int zno = blk_rq_zone_no(rq);
  1510	
  1511			list_for_each_entry(rq2, list, queuelist) {
  1512				if (blk_rq_zone_no(rq2) == zno) {
  1513					zone_in_list = true;
  1514					if (blk_rq_pos(rq) < blk_rq_pos(rq2))
  1515						break;
  1516				}
  1517			}
  1518		}
  1519		if (!zone_in_list) {
  1520			if (at_head) {
  1521				rq->rq_flags |= RQF_SOFTBARRIER;
  1522				list_add(&rq->queuelist, list);
  1523			} else {
  1524				list_add_tail(&rq->queuelist, list);
  1525			}
  1526		} else {
  1527			/*
  1528			 * Insert the request in the list before another request for
  1529			 * the same zone and with a higher LBA. If there is no such
  1530			 * request, insert the request at the end of the list.
  1531			 */
  1532			list_add_tail(&rq->queuelist, &rq2->queuelist);
  1533		}
  1534	}
  1535	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
