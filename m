Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F676647
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681461274; x=1712997274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hv77nyjtD7mUd9lCv9AwM1N9q9e6utZvAOqrGRR3kPs=;
  b=gPvs2yAHvrCWvO9t+Dsbf0f0rbdCVUdOowzS0SmxHUK60gntWRvM4Wel
   Xif6Og3qOBAw1d67rjOYQyr8yHRBgG/tmXq9itpsQiUNy8dKljahaKsVI
   5kQ6YyRbzdUx1R5NvYPv3zPo1cH6qaiz426iuUWyOOQ69cetVzTGVFxvh
   Gjp1vzJw7qKEv1MEgHn0F6oS9A/nkiGRBO95Xt0ftyMObHVTEhaBQFTID
   zi+gWHRMMtfPP/+a+t8Ho1cq05cPRDwIVeYQItKxdDsxHJCSM6+MJ8WcH
   RsVtjlEtG3MnmBL5+kKNzdOTHj+QPYjAe2YwqT1pQ3JZhbL5QGYsyDiJu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="430710130"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="430710130"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 01:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="683269853"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="683269853"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Apr 2023 01:34:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnEsw-000ZMd-0a;
	Fri, 14 Apr 2023 08:34:22 +0000
Date: Fri, 14 Apr 2023 16:33:22 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:retain-zoned-write-order 7/13]
 drivers/s390/block/scm_blk.c:246:9: error: too few arguments to function
 'blk_mq_run_hw_queues'
Message-ID: <202304141657.NMSUopwu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux retain-zoned-write-order
head:   8cae04cb2e2d0cc34383777ec2d884dd8333d63d
commit: 9ad6fbbfdfd8abca53a4491e32dc2876210675b9 [7/13] block: Remove blk_mq_kick_requeue_list() and blk_mq_delay_kick_requeue_list()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230414/202304141657.NMSUopwu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/9ad6fbbfdfd8abca53a4491e32dc2876210675b9
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche retain-zoned-write-order
        git checkout 9ad6fbbfdfd8abca53a4491e32dc2876210675b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/s390/block/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141657.NMSUopwu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/s390/block/scm_blk.c: In function 'scm_request_requeue':
>> drivers/s390/block/scm_blk.c:246:9: error: too few arguments to function 'blk_mq_run_hw_queues'
     246 |         blk_mq_run_hw_queues(bdev->rq);
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/s390/block/scm_blk.c:17:
   include/linux/blk-mq.h:888:6: note: declared here
     888 | void blk_mq_run_hw_queues(struct request_queue *q, bool async);
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/blk_mq_run_hw_queues +246 drivers/s390/block/scm_blk.c

   235	
   236	static void scm_request_requeue(struct scm_request *scmrq)
   237	{
   238		struct scm_blk_dev *bdev = scmrq->bdev;
   239		int i;
   240	
   241		for (i = 0; i < nr_requests_per_io && scmrq->request[i]; i++)
   242			blk_mq_requeue_request(scmrq->request[i], false);
   243	
   244		atomic_dec(&bdev->queued_reqs);
   245		scm_request_done(scmrq);
 > 246		blk_mq_run_hw_queues(bdev->rq);
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
