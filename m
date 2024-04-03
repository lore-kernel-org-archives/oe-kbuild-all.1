Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ADA22606
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 03:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712115099; cv=none; b=t8j9gQvlf5U6CRvDJBv5GaQ4Ee6+tQ/Q2J93EoYHWstglRu4arpPXDJr4/VOkc0Zh7HE4cBAMGRxiSmOM8g5F0IixbldlVdvtoAU6imDOlc5H+ZgXgalvg4v4Ml/fFyAIcSfVZezgykOBcvJzBgpYjNnJbaL+eOY9N2QHvOjWwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712115099; c=relaxed/simple;
	bh=wz67tE98kp6UmrsILjld1CcoiDrrFVY8UAsiFrwsr10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KybPg8ryQemiV6LGRP4mOSxmeLhLFafQABSdfd2cXfRB/qC7+qytLwXs3SI112sr7D3KqnH8lyxVBPK0o6yTA292uRIuFS5J6cXgw5MMUJ58aOTh9Ycy3JUlpd+sO/0wIbJwXmvV+aNLLRIMFSJg9+/E83bBxULOfQvIHz9GEUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5POzj4i; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5POzj4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712115097; x=1743651097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wz67tE98kp6UmrsILjld1CcoiDrrFVY8UAsiFrwsr10=;
  b=n5POzj4izqmnA7LzlLU1ri3EKQF8nV7opfyW42qPi7jj3DRM6pLkk9Rt
   6FlDV374jOl9uHAceZloBjPOw75q9Xe/iBJ67PqEdWgKDhvnIw96t1/8Z
   IpTX5WfXJi6p4auhQ2jQ/L4KnhDhfaQIMyk2n8nqb4RMxRN8FdGEOHiF0
   7YM8O3DokqrCvPgvR26Y9QT5k2xkJ+Q5FG2iteMOh36cTWJPzGwgOnz8R
   WTWvKzv1ZFx/v/g/9seUscCkmVKdMDv1OQXWIL9bpPj8GOLPq2jOUU//l
   iVMAWh7jOefmkgHJggtI2vfk1HOxKCXvBcDu75U34pNm23Qn7htB4du6d
   Q==;
X-CSE-ConnectionGUID: hhCxEgYiSumaEdxAincX+w==
X-CSE-MsgGUID: +3aBGwRWTlOoJ3Gqrgo0Gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29800169"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="29800169"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 20:31:37 -0700
X-CSE-ConnectionGUID: J+jGe6vWTh+Uosl5CpqoHQ==
X-CSE-MsgGUID: N2PSBnWYSZisBHfu6L3ZXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="49511546"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Apr 2024 20:31:35 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrrLY-0001od-12;
	Wed, 03 Apr 2024 03:31:32 +0000
Date: Wed, 3 Apr 2024 11:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4 24/51] drivers/block/null_blk/main.c:774:9:
 error: implicit declaration of function 'put_tag'; did you mean 'put_page'?
Message-ID: <202404031157.3IgSh144-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20240403 (https://download.01.org/0day-ci/archive/20240403/202404031157.3IgSh144-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031157.3IgSh144-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031157.3IgSh144-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/block/null_blk/main.c: In function 'free_cmd':
>> drivers/block/null_blk/main.c:774:9: error: implicit declaration of function 'put_tag'; did you mean 'put_page'? [-Werror=implicit-function-declaration]
     774 |         put_tag(cmd->nq, cmd->tag);
         |         ^~~~~~~
         |         put_page
>> drivers/block/null_blk/main.c:774:29: error: 'struct nullb_cmd' has no member named 'tag'
     774 |         put_tag(cmd->nq, cmd->tag);
         |                             ^~
   drivers/block/null_blk/main.c: In function '__alloc_cmd':
>> drivers/block/null_blk/main.c:781:52: error: 'struct nullb_queue' has no member named 'tag_map'
     781 |         unsigned int tag = find_and_set_bit_lock(nq->tag_map, nq->queue_depth);
         |                                                    ^~
>> drivers/block/null_blk/main.c:781:65: error: 'struct nullb_queue' has no member named 'queue_depth'
     781 |         unsigned int tag = find_and_set_bit_lock(nq->tag_map, nq->queue_depth);
         |                                                                 ^~
   drivers/block/null_blk/main.c:784:22: error: 'struct nullb_queue' has no member named 'queue_depth'
     784 |         if (tag >= nq->queue_depth)
         |                      ^~
>> drivers/block/null_blk/main.c:787:18: error: 'struct nullb_queue' has no member named 'cmds'
     787 |         cmd = &nq->cmds[tag];
         |                  ^~
   drivers/block/null_blk/main.c:788:12: error: 'struct nullb_cmd' has no member named 'tag'
     788 |         cmd->tag = tag;
         |            ^~
   drivers/block/null_blk/main.c: In function 'alloc_cmd':
>> drivers/block/null_blk/main.c:811:28: error: 'struct nullb_cmd' has no member named 'bio'
     811 |                         cmd->bio = bio;
         |                            ^~
>> drivers/block/null_blk/main.c:814:36: error: 'struct nullb_queue' has no member named 'wait'
     814 |                 prepare_to_wait(&nq->wait, &wait, TASK_UNINTERRUPTIBLE);
         |                                    ^~
   drivers/block/null_blk/main.c:816:32: error: 'struct nullb_queue' has no member named 'wait'
     816 |                 finish_wait(&nq->wait, &wait);
         |                                ^~
   drivers/block/null_blk/main.c: In function 'end_cmd':
>> drivers/block/null_blk/main.c:826:41: error: 'struct nullb_cmd' has no member named 'rq'; did you mean 'nq'?
     826 |                 blk_mq_end_request(cmd->rq, cmd->error);
         |                                         ^~
         |                                         nq
   drivers/block/null_blk/main.c:829:20: error: 'struct nullb_cmd' has no member named 'bio'
     829 |                 cmd->bio->bi_status = cmd->error;
         |                    ^~
   drivers/block/null_blk/main.c:830:30: error: 'struct nullb_cmd' has no member named 'bio'
     830 |                 bio_endio(cmd->bio);
         |                              ^~
   drivers/block/null_blk/main.c: At top level:
>> drivers/block/null_blk/main.c:820:13: warning: 'end_cmd' defined but not used [-Wunused-function]
     820 | static void end_cmd(struct nullb_cmd *cmd)
         |             ^~~~~~~
>> drivers/block/null_blk/main.c:799:26: warning: 'alloc_cmd' defined but not used [-Wunused-function]
     799 | static struct nullb_cmd *alloc_cmd(struct nullb_queue *nq, struct bio *bio)
         |                          ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +774 drivers/block/null_blk/main.c

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
 > 799	static struct nullb_cmd *alloc_cmd(struct nullb_queue *nq, struct bio *bio)
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
 > 820	static void end_cmd(struct nullb_cmd *cmd)
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
