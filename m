Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01242244668
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 19:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759173007; cv=none; b=V8gfvR4/JlQK9nvFANqxuBNVxIBeG7OvzK9h+9WNPTw6MW6HaDVrfhseexX+5n7hAhUCJ6lAXU5uhffU8m84d3OKReFkbzjzc0iR3K4MVX5ezRiAB9B3JoJJCLp3k569ta6qE0/0NTt3RU2N0uvu/nNugeWW7XcMwY/dNz1wMVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759173007; c=relaxed/simple;
	bh=VxDpt6R02dWrE9736ChbUhHYYlxNh0XBgWoI6c1QeGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vA1VMxCB59vWoKQptXRFtfyesutLi8Q51c2wdQWylNPwL4374UGu+jW4QRURyRPEiI+EbCzQqVz5+QJ3nXTduPowSdt706KtXuo6yQfBhqlioUUhn6juqywc7DSFgr0nIS9/ksdBMh7MdmAlIINI7IlKqAoDc2o0aZTJwaowPaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0I1G2Wd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0I1G2Wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759173006; x=1790709006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VxDpt6R02dWrE9736ChbUhHYYlxNh0XBgWoI6c1QeGk=;
  b=X0I1G2WdlUNZsBVHDQEn6JpoOASmSEDNmtTBAM23jq/N1LcRUUtwbKl/
   5PTcD/IcPUyroffboTxSotUevBftkisW3NMCCpTFaFK98m+Zx9ClCdmK5
   yM6PnYB240YziVFB9kmoKXhzTeczMTzIkYtFXt9MF0FO0mANhWMUchtOg
   WYH0x6evmQ1GBBtj22VWra8KTs1YNq41jrMuM4jI+5DFtpIkFrogMyw0R
   VVd2twh1DV4Ju/Zw/9XF69KCNpkOMjHpdxWESJ6Kq3q0BItiVqorlcXjp
   SXjQ1udPdbLUVgKfjaENaon9WAMnJB5mArua5Georf98YLaERq6h2Sqcs
   Q==;
X-CSE-ConnectionGUID: usC9jbGyTXKogumu2QGTNw==
X-CSE-MsgGUID: gJSob2QDQGGJASi4J2VbbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="84037741"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; 
   d="scan'208";a="84037741"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 12:10:05 -0700
X-CSE-ConnectionGUID: lANGT6p0SZaa4UpEAs8b8Q==
X-CSE-MsgGUID: lUzUbzXdRpCIlWsDVzjocg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; 
   d="scan'208";a="177573712"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Sep 2025 12:10:04 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3JG5-0000ap-1f;
	Mon, 29 Sep 2025 19:10:01 +0000
Date: Tue, 30 Sep 2025 03:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3106/3106] block/bfq-cgroup.c:692: warning:
 Function parameter or member 'bfqg' not described in
 '__bfq_bic_change_cgroup'
Message-ID: <202509300304.1rqotWxk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c435f375ea557e19177ca7f997087e6c0d6e80cc
commit: b8fcf506e7428600d59004a436f0ce98a21874d7 [3106/3106] bfq: Get rid of __bio_blkcg() usage
config: arm64-randconfig-003-20250806 (https://download.01.org/0day-ci/archive/20250930/202509300304.1rqotWxk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509300304.1rqotWxk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509300304.1rqotWxk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bfq-cgroup.c:692: warning: Function parameter or member 'bfqg' not described in '__bfq_bic_change_cgroup'
>> block/bfq-cgroup.c:692: warning: Excess function parameter 'blkcg' description in '__bfq_bic_change_cgroup'
   block/bfq-cgroup.c:841: warning: Function parameter or member 'ioprio_class' not described in 'bfq_reparent_leaf_entity'
   block/bfq-cgroup.c:871: warning: Function parameter or member 'ioprio_class' not described in 'bfq_reparent_active_queues'


vim +692 block/bfq-cgroup.c

ea25da48086d3b Paolo Valente 2017-04-19  678  
ea25da48086d3b Paolo Valente 2017-04-19  679  /**
ea25da48086d3b Paolo Valente 2017-04-19  680   * __bfq_bic_change_cgroup - move @bic to @cgroup.
ea25da48086d3b Paolo Valente 2017-04-19  681   * @bfqd: the queue descriptor.
ea25da48086d3b Paolo Valente 2017-04-19  682   * @bic: the bic to move.
ea25da48086d3b Paolo Valente 2017-04-19  683   * @blkcg: the blk-cgroup to move to.
ea25da48086d3b Paolo Valente 2017-04-19  684   *
8f9bebc33dd718 Paolo Valente 2017-06-05  685   * Move bic to blkcg, assuming that bfqd->lock is held; which makes
8f9bebc33dd718 Paolo Valente 2017-06-05  686   * sure that the reference to cgroup is valid across the call (see
8f9bebc33dd718 Paolo Valente 2017-06-05  687   * comments in bfq_bic_update_cgroup on this issue)
ea25da48086d3b Paolo Valente 2017-04-19  688   */
b8fcf506e74286 Jan Kara      2022-11-21  689  static void *__bfq_bic_change_cgroup(struct bfq_data *bfqd,
ea25da48086d3b Paolo Valente 2017-04-19  690  				     struct bfq_io_cq *bic,
b8fcf506e74286 Jan Kara      2022-11-21  691  				     struct bfq_group *bfqg)
ea25da48086d3b Paolo Valente 2017-04-19 @692  {
ea25da48086d3b Paolo Valente 2017-04-19  693  	struct bfq_queue *async_bfqq = bic_to_bfqq(bic, 0);
ea25da48086d3b Paolo Valente 2017-04-19  694  	struct bfq_queue *sync_bfqq = bic_to_bfqq(bic, 1);
ea25da48086d3b Paolo Valente 2017-04-19  695  	struct bfq_entity *entity;
ea25da48086d3b Paolo Valente 2017-04-19  696  
ea25da48086d3b Paolo Valente 2017-04-19  697  	if (async_bfqq) {
ea25da48086d3b Paolo Valente 2017-04-19  698  		entity = &async_bfqq->entity;
ea25da48086d3b Paolo Valente 2017-04-19  699  
ea25da48086d3b Paolo Valente 2017-04-19  700  		if (entity->sched_data != &bfqg->sched_data) {
ea25da48086d3b Paolo Valente 2017-04-19  701  			bic_set_bfqq(bic, NULL, 0);
c8997736650060 Paolo Valente 2020-03-21  702  			bfq_release_process_ref(bfqd, async_bfqq);
ea25da48086d3b Paolo Valente 2017-04-19  703  		}
ea25da48086d3b Paolo Valente 2017-04-19  704  	}
ea25da48086d3b Paolo Valente 2017-04-19  705  
ea25da48086d3b Paolo Valente 2017-04-19  706  	if (sync_bfqq) {
0154382317ee69 Jan Kara      2022-09-29  707  		if (!sync_bfqq->new_bfqq && !bfq_bfqq_coop(sync_bfqq)) {
0154382317ee69 Jan Kara      2022-09-29  708  			/* We are the only user of this bfqq, just move it */
0154382317ee69 Jan Kara      2022-09-29  709  			if (sync_bfqq->entity.sched_data != &bfqg->sched_data)
ea25da48086d3b Paolo Valente 2017-04-19  710  				bfq_bfqq_move(bfqd, sync_bfqq, bfqg);
0154382317ee69 Jan Kara      2022-09-29  711  		} else {
0154382317ee69 Jan Kara      2022-09-29  712  			struct bfq_queue *bfqq;
0154382317ee69 Jan Kara      2022-09-29  713  
0154382317ee69 Jan Kara      2022-09-29  714  			/*
0154382317ee69 Jan Kara      2022-09-29  715  			 * The queue was merged to a different queue. Check
0154382317ee69 Jan Kara      2022-09-29  716  			 * that the merge chain still belongs to the same
0154382317ee69 Jan Kara      2022-09-29  717  			 * cgroup.
0154382317ee69 Jan Kara      2022-09-29  718  			 */
0154382317ee69 Jan Kara      2022-09-29  719  			for (bfqq = sync_bfqq; bfqq; bfqq = bfqq->new_bfqq)
0154382317ee69 Jan Kara      2022-09-29  720  				if (bfqq->entity.sched_data !=
0154382317ee69 Jan Kara      2022-09-29  721  				    &bfqg->sched_data)
0154382317ee69 Jan Kara      2022-09-29  722  					break;
0154382317ee69 Jan Kara      2022-09-29  723  			if (bfqq) {
0154382317ee69 Jan Kara      2022-09-29  724  				/*
0154382317ee69 Jan Kara      2022-09-29  725  				 * Some queue changed cgroup so the merge is
0154382317ee69 Jan Kara      2022-09-29  726  				 * not valid anymore. We cannot easily just
0154382317ee69 Jan Kara      2022-09-29  727  				 * cancel the merge (by clearing new_bfqq) as
0154382317ee69 Jan Kara      2022-09-29  728  				 * there may be other processes using this
0154382317ee69 Jan Kara      2022-09-29  729  				 * queue and holding refs to all queues below
0154382317ee69 Jan Kara      2022-09-29  730  				 * sync_bfqq->new_bfqq. Similarly if the merge
0154382317ee69 Jan Kara      2022-09-29  731  				 * already happened, we need to detach from
0154382317ee69 Jan Kara      2022-09-29  732  				 * bfqq now so that we cannot merge bio to a
0154382317ee69 Jan Kara      2022-09-29  733  				 * request from the old cgroup.
0154382317ee69 Jan Kara      2022-09-29  734  				 */
0154382317ee69 Jan Kara      2022-09-29  735  				bfq_put_cooperator(sync_bfqq);
0154382317ee69 Jan Kara      2022-09-29  736  				bfq_release_process_ref(bfqd, sync_bfqq);
0154382317ee69 Jan Kara      2022-09-29  737  				bic_set_bfqq(bic, NULL, 1);
0154382317ee69 Jan Kara      2022-09-29  738  			}
0154382317ee69 Jan Kara      2022-09-29  739  		}
ea25da48086d3b Paolo Valente 2017-04-19  740  	}
ea25da48086d3b Paolo Valente 2017-04-19  741  
ea25da48086d3b Paolo Valente 2017-04-19  742  	return bfqg;
ea25da48086d3b Paolo Valente 2017-04-19  743  }
ea25da48086d3b Paolo Valente 2017-04-19  744  

:::::: The code at line 692 was first introduced by commit
:::::: ea25da48086d3bbebf3a2eeff387ea00ed96f5c4 block, bfq: split bfq-iosched.c into multiple source files

:::::: TO: Paolo Valente <paolo.valente@linaro.org>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
