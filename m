Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C7224E8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 04:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712117642; cv=none; b=gv67srH4GAce2nlFyr5v7nK8y9WZ0eZYlDTvTmEtgYSXQ4H5X1TxPIYBnwChEknqjSNsyZIh4jqpFyvu5qqIcs31qPJuHas5cHtMZ5SmcmamoSLlF1lJ/3kV2IbBCSi4bOkwwJzzMA8DLxWGTP5nzE8wamA0xHyfyD/pVHfM84s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712117642; c=relaxed/simple;
	bh=nQNpS4c0arGmUXHQP/uUc/r26R2wELpixUX6Ky63Hps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cD1WtMaV+QRusqqakxxhOL+NRDObkWM1BCb0NVjqjo7SxylKsky0m2n5kQNEpVhS+mnZGVC4FLBARDvRJ8L3pBBw14jJzhPSixBhyIh7BLgq9hXktkmTC8IHxYCOfqbkUlTEXawjjf/w2Qcn2is55ueB6WdyTEimBur2VNDp/mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IslqtKOl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IslqtKOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712117639; x=1743653639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nQNpS4c0arGmUXHQP/uUc/r26R2wELpixUX6Ky63Hps=;
  b=IslqtKOlZhpXYuAJva4JYy38Ryl5/5NquwHtYgcwQlVP4h2SnmtFGIRP
   8Ga+TKVam+3geo+nruG16z0v911cik3gBHNVeeUJs9CRd6IRsDe/ITuTR
   fMFImOOjQB8eCZME1ooVx1WuLwlddE7VYSGmVyzLA9W1sgRKDCMLdXYii
   VxtXHyGdau8v0J+7cO/vmpAEOB/DBALQStqFmAEk/bAjKejip6epOuh5U
   erOQQ9OI3NuboKv+nvFV5lkBepNRPSopRZBHft7DRD3/FBG/SOs+XTpK8
   HEj5Q6s6Eg0KQZUvZEElSuRwo8Rf173f2lwhFuZlP+mFIRboVQOiSjW1Z
   w==;
X-CSE-ConnectionGUID: L8UgfVrWTcG3aFO9kOdL8g==
X-CSE-MsgGUID: kBnq53WRT2qF7MSIGqB6vw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="24824378"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="24824378"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 21:13:58 -0700
X-CSE-ConnectionGUID: CA/oxrErSZ2vod5e+YlVGg==
X-CSE-MsgGUID: SEBjH1bxRcW+aO6gjXeMyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="22996393"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Apr 2024 21:13:57 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrs0S-0001q9-1A;
	Wed, 03 Apr 2024 04:13:49 +0000
Date: Wed, 3 Apr 2024 12:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4 24/51] drivers/block/null_blk/main.c:774:2:
 error: call to undeclared function 'put_tag'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202404031218.azlOLmgI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and-v4
head:   db33a7d65f9e64f900f68e46da4f113fbe6a7faa
commit: a779e0e8dc6e9dc79210cb9a82a03d656f1e67d2 [24/51] block: null_blk: replace get_tag() with a generic find_and_set_bit_lock()
config: i386-buildonly-randconfig-002-20240403 (https://download.01.org/0day-ci/archive/20240403/202404031218.azlOLmgI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031218.azlOLmgI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031218.azlOLmgI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/null_blk/main.c:774:2: error: call to undeclared function 'put_tag'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     774 |         put_tag(cmd->nq, cmd->tag);
         |         ^
   drivers/block/null_blk/main.c:774:2: note: did you mean 'put_page'?
   include/linux/mm.h:1568:20: note: 'put_page' declared here
    1568 | static inline void put_page(struct page *page)
         |                    ^
>> drivers/block/null_blk/main.c:774:24: error: no member named 'tag' in 'struct nullb_cmd'
     774 |         put_tag(cmd->nq, cmd->tag);
         |                          ~~~  ^
>> drivers/block/null_blk/main.c:781:47: error: no member named 'tag_map' in 'struct nullb_queue'
     781 |         unsigned int tag = find_and_set_bit_lock(nq->tag_map, nq->queue_depth);
         |                                                  ~~  ^
>> drivers/block/null_blk/main.c:781:60: error: no member named 'queue_depth' in 'struct nullb_queue'
     781 |         unsigned int tag = find_and_set_bit_lock(nq->tag_map, nq->queue_depth);
         |                                                               ~~  ^
   drivers/block/null_blk/main.c:784:17: error: no member named 'queue_depth' in 'struct nullb_queue'
     784 |         if (tag >= nq->queue_depth)
         |                    ~~  ^
>> drivers/block/null_blk/main.c:787:13: error: no member named 'cmds' in 'struct nullb_queue'
     787 |         cmd = &nq->cmds[tag];
         |                ~~  ^
   drivers/block/null_blk/main.c:788:7: error: no member named 'tag' in 'struct nullb_cmd'
     788 |         cmd->tag = tag;
         |         ~~~  ^
>> drivers/block/null_blk/main.c:811:9: error: no member named 'bio' in 'struct nullb_cmd'
     811 |                         cmd->bio = bio;
         |                         ~~~  ^
>> drivers/block/null_blk/main.c:814:24: error: no member named 'wait' in 'struct nullb_queue'
     814 |                 prepare_to_wait(&nq->wait, &wait, TASK_UNINTERRUPTIBLE);
         |                                  ~~  ^
   drivers/block/null_blk/main.c:816:20: error: no member named 'wait' in 'struct nullb_queue'
     816 |                 finish_wait(&nq->wait, &wait);
         |                              ~~  ^
>> drivers/block/null_blk/main.c:826:27: error: no member named 'rq' in 'struct nullb_cmd'
     826 |                 blk_mq_end_request(cmd->rq, cmd->error);
         |                                    ~~~  ^
   drivers/block/null_blk/main.c:829:8: error: no member named 'bio' in 'struct nullb_cmd'
     829 |                 cmd->bio->bi_status = cmd->error;
         |                 ~~~  ^
   drivers/block/null_blk/main.c:830:18: error: no member named 'bio' in 'struct nullb_cmd'
     830 |                 bio_endio(cmd->bio);
         |                           ~~~  ^
   13 errors generated.


vim +/put_tag +774 drivers/block/null_blk/main.c

   771	
   772	static void free_cmd(struct nullb_cmd *cmd)
   773	{
 > 774		put_tag(cmd->nq, cmd->tag);
   775	}
   776	
   777	static enum hrtimer_restart null_cmd_timer_expired(struct hrtimer *timer);
   778	
   779	static struct nullb_cmd *__alloc_cmd(struct nullb_queue *nq)
   780	{
 > 781		unsigned int tag = find_and_set_bit_lock(nq->tag_map, nq->queue_depth);
   782		struct nullb_cmd *cmd;
   783	
   784		if (tag >= nq->queue_depth)
   785			return NULL;
   786	
 > 787		cmd = &nq->cmds[tag];
   788		cmd->tag = tag;
   789		cmd->error = BLK_STS_OK;
   790		cmd->nq = nq;
   791		if (nq->dev->irqmode == NULL_IRQ_TIMER) {
   792			hrtimer_init(&cmd->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
   793			cmd->timer.function = null_cmd_timer_expired;
   794		}
   795	
   796		return cmd;
   797	}
   798	
   799	static struct nullb_cmd *alloc_cmd(struct nullb_queue *nq, struct bio *bio)
   800	{
   801		struct nullb_cmd *cmd;
   802		DEFINE_WAIT(wait);
   803	
   804		do {
   805			/*
   806			 * This avoids multiple return statements, multiple calls to
   807			 * __alloc_cmd() and a fast path call to prepare_to_wait().
   808			 */
   809			cmd = __alloc_cmd(nq);
   810			if (cmd) {
 > 811				cmd->bio = bio;
   812				return cmd;
   813			}
 > 814			prepare_to_wait(&nq->wait, &wait, TASK_UNINTERRUPTIBLE);
   815			io_schedule();
   816			finish_wait(&nq->wait, &wait);
   817		} while (1);
   818	}
   819	
   820	static void end_cmd(struct nullb_cmd *cmd)
   821	{
   822		int queue_mode = cmd->nq->dev->queue_mode;
   823	
   824		switch (queue_mode)  {
   825		case NULL_Q_MQ:
 > 826			blk_mq_end_request(cmd->rq, cmd->error);
   827			return;
   828		case NULL_Q_BIO:
   829			cmd->bio->bi_status = cmd->error;
   830			bio_endio(cmd->bio);
   831			break;
   832		}
   833	
   834		free_cmd(cmd);
   835	}
   836	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
