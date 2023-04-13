Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ACB2F31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 21:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681420273; x=1712956273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jzlQhdOuXMuYSA8lDPk3V3yXfO1QbyrdhBPrhB8wEy0=;
  b=YiNZfsIWiCRVC5Uj9r+hNnbmPCgsHPd5GAUpPP4cdM98c6XCr+PmBIFT
   YMPGF6NNimvhti0YIxU84iSn3rXRevDMjNOaHI0DNBa7ASOr+xxNsppkr
   OWCEWbmsG4Qp1zkSp4bKXjDTwtyOLWDN4WzHIJ3vhbCNPuQQQRNl5A7cb
   rGqXBXcBEj6gNetnh9T/Pq6D0LFONJ964VKqtIpmriYwwfSvIaa9kQujB
   WrG+QfzcDA+XfeTz6+7Tn89w15+aX8lrLrTAYdaFj/u1mt2UWgxIUWRtb
   Nr0BO+9SyvPcHq7mU09Iep7Kvdi3JL+xp0AFbqoVhk7KnZOKtL6v579/R
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="372161891"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="372161891"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 14:11:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="758832621"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="758832621"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Apr 2023 14:11:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn4De-000YxF-2D;
	Thu, 13 Apr 2023 21:11:02 +0000
Date: Fri, 14 Apr 2023 05:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:retain-zoned-write-order 7/13]
 drivers/block/ublk_drv.c:1210:9: error: too few arguments to function
 'blk_mq_run_hw_queues'
Message-ID: <202304140542.PW2UCC5d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux retain-zoned-write-order
head:   aa091476612b6bd24c4dc89253c89035392e3bf8
commit: 65e6a2884b5812c630f5dcf3807e0853b9260a88 [7/13] block: Remove blk_mq_kick_requeue_list() and blk_mq_delay_kick_requeue_list()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230414/202304140542.PW2UCC5d-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/65e6a2884b5812c630f5dcf3807e0853b9260a88
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche retain-zoned-write-order
        git checkout 65e6a2884b5812c630f5dcf3807e0853b9260a88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140542.PW2UCC5d-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/ublk_drv.c: In function 'ublk_unquiesce_dev':
>> drivers/block/ublk_drv.c:1210:9: error: too few arguments to function 'blk_mq_run_hw_queues'
    1210 |         blk_mq_run_hw_queues(ub->ub_disk->queue);
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/block/ublk_drv.c:40:
   include/linux/blk-mq.h:888:6: note: declared here
     888 | void blk_mq_run_hw_queues(struct request_queue *q, bool async);
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c: In function 'ublk_ctrl_end_recovery':
   drivers/block/ublk_drv.c:2050:9: error: too few arguments to function 'blk_mq_run_hw_queues'
    2050 |         blk_mq_run_hw_queues(ub->ub_disk->queue);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/blk-mq.h:888:6: note: declared here
     888 | void blk_mq_run_hw_queues(struct request_queue *q, bool async);
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/blk_mq_run_hw_queues +1210 drivers/block/ublk_drv.c

  1191	
  1192	static void ublk_unquiesce_dev(struct ublk_device *ub)
  1193	{
  1194		int i;
  1195	
  1196		pr_devel("%s: unquiesce ub: dev_id %d state %s\n",
  1197				__func__, ub->dev_info.dev_id,
  1198				ub->dev_info.state == UBLK_S_DEV_LIVE ?
  1199				"LIVE" : "QUIESCED");
  1200		/* quiesce_work has run. We let requeued rqs be aborted
  1201		 * before running fallback_wq. "force_abort" must be seen
  1202		 * after request queue is unqiuesced. Then del_gendisk()
  1203		 * can move on.
  1204		 */
  1205		for (i = 0; i < ub->dev_info.nr_hw_queues; i++)
  1206			ublk_get_queue(ub, i)->force_abort = true;
  1207	
  1208		blk_mq_unquiesce_queue(ub->ub_disk->queue);
  1209		/* We may have requeued some rqs in ublk_quiesce_queue() */
> 1210		blk_mq_run_hw_queues(ub->ub_disk->queue);
  1211	}
  1212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
