Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1351B14F95
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 15:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692285271; x=1723821271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=21bC7sO7YoVU57vCQmoW7odybCoUFTKfS3P3he7rBD0=;
  b=dCylBk4cGyWc6ZP2AIVBsGzoKOKN39akOumTIDv7C9NP5s1+151qcKL/
   MfydCM06detUm7xiNHtAquyM314wCbfraXTrEZ06nDcpdpHuwR+cDVP/7
   QjFE9Yh6s6X2a0djBGHrAwll67GTsoKCeaXacvZcNRoonHAWnaFeGmGpi
   lKUXQ++iC/Byuipsih9FoVNnlhh/bNtHgvYi4hoGCi8dqIm9dIxk9iqcA
   JJfWLQx6gl2kgE8PFfdUzZyhFbNZR/2qzJk9Xsd9/WxpKtRwf9VQMWX0g
   OL2noLmDz6W3Llz/W64eYf+dKDiODpAZ4HkEMNYLRFR2lzHOH1a6PvLK8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="439215547"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="439215547"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 08:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="848913656"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="848913656"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2023 08:14:21 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWehY-0001Fz-0o;
	Thu, 17 Aug 2023 15:14:20 +0000
Date: Thu, 17 Aug 2023 23:13:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: [stable:linux-5.15.y 343/9999] block/bfq-cgroup.c:702: warning:
 Function parameter or member 'bfqg' not described in
 '__bfq_bic_change_cgroup'
Message-ID: <202308172359.O2tZTceG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: 86defc5424414f3beb598f02da162eb571fc0762 [343/9999] bfq: Get rid of __bio_blkcg() usage
config: x86_64-randconfig-x062-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172359.O2tZTceG-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172359.O2tZTceG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172359.O2tZTceG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bfq-cgroup.c:702: warning: Function parameter or member 'bfqg' not described in '__bfq_bic_change_cgroup'
>> block/bfq-cgroup.c:702: warning: Excess function parameter 'blkcg' description in '__bfq_bic_change_cgroup'
   block/bfq-cgroup.c:851: warning: Function parameter or member 'ioprio_class' not described in 'bfq_reparent_leaf_entity'
   block/bfq-cgroup.c:881: warning: Function parameter or member 'ioprio_class' not described in 'bfq_reparent_active_queues'


vim +702 block/bfq-cgroup.c

ea25da48086d3b Paolo Valente 2017-04-19  688  
ea25da48086d3b Paolo Valente 2017-04-19  689  /**
ea25da48086d3b Paolo Valente 2017-04-19  690   * __bfq_bic_change_cgroup - move @bic to @cgroup.
ea25da48086d3b Paolo Valente 2017-04-19  691   * @bfqd: the queue descriptor.
ea25da48086d3b Paolo Valente 2017-04-19  692   * @bic: the bic to move.
ea25da48086d3b Paolo Valente 2017-04-19  693   * @blkcg: the blk-cgroup to move to.
ea25da48086d3b Paolo Valente 2017-04-19  694   *
8f9bebc33dd718 Paolo Valente 2017-06-05  695   * Move bic to blkcg, assuming that bfqd->lock is held; which makes
8f9bebc33dd718 Paolo Valente 2017-06-05  696   * sure that the reference to cgroup is valid across the call (see
8f9bebc33dd718 Paolo Valente 2017-06-05  697   * comments in bfq_bic_update_cgroup on this issue)
ea25da48086d3b Paolo Valente 2017-04-19  698   */
86defc5424414f Jan Kara      2022-04-01  699  static void *__bfq_bic_change_cgroup(struct bfq_data *bfqd,
ea25da48086d3b Paolo Valente 2017-04-19  700  				     struct bfq_io_cq *bic,
86defc5424414f Jan Kara      2022-04-01  701  				     struct bfq_group *bfqg)
ea25da48086d3b Paolo Valente 2017-04-19 @702  {
ea25da48086d3b Paolo Valente 2017-04-19  703  	struct bfq_queue *async_bfqq = bic_to_bfqq(bic, 0);
ea25da48086d3b Paolo Valente 2017-04-19  704  	struct bfq_queue *sync_bfqq = bic_to_bfqq(bic, 1);
ea25da48086d3b Paolo Valente 2017-04-19  705  	struct bfq_entity *entity;
ea25da48086d3b Paolo Valente 2017-04-19  706  
ea25da48086d3b Paolo Valente 2017-04-19  707  	if (async_bfqq) {
ea25da48086d3b Paolo Valente 2017-04-19  708  		entity = &async_bfqq->entity;
ea25da48086d3b Paolo Valente 2017-04-19  709  
ea25da48086d3b Paolo Valente 2017-04-19  710  		if (entity->sched_data != &bfqg->sched_data) {
ea25da48086d3b Paolo Valente 2017-04-19  711  			bic_set_bfqq(bic, NULL, 0);
c8997736650060 Paolo Valente 2020-03-21  712  			bfq_release_process_ref(bfqd, async_bfqq);
ea25da48086d3b Paolo Valente 2017-04-19  713  		}
ea25da48086d3b Paolo Valente 2017-04-19  714  	}
ea25da48086d3b Paolo Valente 2017-04-19  715  
ea25da48086d3b Paolo Valente 2017-04-19  716  	if (sync_bfqq) {
81b7d0c717a487 Jan Kara      2022-04-01  717  		if (!sync_bfqq->new_bfqq && !bfq_bfqq_coop(sync_bfqq)) {
81b7d0c717a487 Jan Kara      2022-04-01  718  			/* We are the only user of this bfqq, just move it */
81b7d0c717a487 Jan Kara      2022-04-01  719  			if (sync_bfqq->entity.sched_data != &bfqg->sched_data)
ea25da48086d3b Paolo Valente 2017-04-19  720  				bfq_bfqq_move(bfqd, sync_bfqq, bfqg);
81b7d0c717a487 Jan Kara      2022-04-01  721  		} else {
81b7d0c717a487 Jan Kara      2022-04-01  722  			struct bfq_queue *bfqq;
81b7d0c717a487 Jan Kara      2022-04-01  723  
81b7d0c717a487 Jan Kara      2022-04-01  724  			/*
81b7d0c717a487 Jan Kara      2022-04-01  725  			 * The queue was merged to a different queue. Check
81b7d0c717a487 Jan Kara      2022-04-01  726  			 * that the merge chain still belongs to the same
81b7d0c717a487 Jan Kara      2022-04-01  727  			 * cgroup.
81b7d0c717a487 Jan Kara      2022-04-01  728  			 */
81b7d0c717a487 Jan Kara      2022-04-01  729  			for (bfqq = sync_bfqq; bfqq; bfqq = bfqq->new_bfqq)
81b7d0c717a487 Jan Kara      2022-04-01  730  				if (bfqq->entity.sched_data !=
81b7d0c717a487 Jan Kara      2022-04-01  731  				    &bfqg->sched_data)
81b7d0c717a487 Jan Kara      2022-04-01  732  					break;
81b7d0c717a487 Jan Kara      2022-04-01  733  			if (bfqq) {
81b7d0c717a487 Jan Kara      2022-04-01  734  				/*
81b7d0c717a487 Jan Kara      2022-04-01  735  				 * Some queue changed cgroup so the merge is
81b7d0c717a487 Jan Kara      2022-04-01  736  				 * not valid anymore. We cannot easily just
81b7d0c717a487 Jan Kara      2022-04-01  737  				 * cancel the merge (by clearing new_bfqq) as
81b7d0c717a487 Jan Kara      2022-04-01  738  				 * there may be other processes using this
81b7d0c717a487 Jan Kara      2022-04-01  739  				 * queue and holding refs to all queues below
81b7d0c717a487 Jan Kara      2022-04-01  740  				 * sync_bfqq->new_bfqq. Similarly if the merge
81b7d0c717a487 Jan Kara      2022-04-01  741  				 * already happened, we need to detach from
81b7d0c717a487 Jan Kara      2022-04-01  742  				 * bfqq now so that we cannot merge bio to a
81b7d0c717a487 Jan Kara      2022-04-01  743  				 * request from the old cgroup.
81b7d0c717a487 Jan Kara      2022-04-01  744  				 */
81b7d0c717a487 Jan Kara      2022-04-01  745  				bfq_put_cooperator(sync_bfqq);
81b7d0c717a487 Jan Kara      2022-04-01  746  				bfq_release_process_ref(bfqd, sync_bfqq);
81b7d0c717a487 Jan Kara      2022-04-01  747  				bic_set_bfqq(bic, NULL, 1);
81b7d0c717a487 Jan Kara      2022-04-01  748  			}
81b7d0c717a487 Jan Kara      2022-04-01  749  		}
ea25da48086d3b Paolo Valente 2017-04-19  750  	}
ea25da48086d3b Paolo Valente 2017-04-19  751  
ea25da48086d3b Paolo Valente 2017-04-19  752  	return bfqg;
ea25da48086d3b Paolo Valente 2017-04-19  753  }
ea25da48086d3b Paolo Valente 2017-04-19  754  

:::::: The code at line 702 was first introduced by commit
:::::: ea25da48086d3bbebf3a2eeff387ea00ed96f5c4 block, bfq: split bfq-iosched.c into multiple source files

:::::: TO: Paolo Valente <paolo.valente@linaro.org>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
