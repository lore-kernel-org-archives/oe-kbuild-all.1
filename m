Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA851C6A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 05:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712987490; cv=none; b=KlfVqhqFUfjMuZYWcfas0vTgHF14FLg0gQUXtOnOCsijGCLwRb029NI+mt1MfO+4Wnt+OwCY3WYE5z34LpJEA3RmT5CUb1q4mFjRxkXLxSkhSKj7VByYr899JDZHb6g/eDKEzikxIJT2UxFevBxFCjtgcLR21JVQvOPlg/HDt/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712987490; c=relaxed/simple;
	bh=VdPJ7IYQGjcvKGeKUY/gqNiC1C+h0TtyzIjc2LYpcrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pAtiLeFZZZuE55VZx0XTfzQCnLD3O+cag7tnOj0uLuTNgSzsgEqYzOjdKgnzKtTFr0UnWTI8GMzu+7F5qSdc5X2KhHQb0KYXPeZey8AYzz12iA6d2/gBTC5/LzBLC7/CQBJwRi0Nq8BakQ6GvB3M9AfhYvYk+GVMbO/SWrG7Kyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxIDdvyR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxIDdvyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712987489; x=1744523489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VdPJ7IYQGjcvKGeKUY/gqNiC1C+h0TtyzIjc2LYpcrk=;
  b=YxIDdvyRoN3vvu8TD4Uet8cmrraKhnUP7GymycxHN/N6vOMT9p1lhBsc
   x173iBVlXteNwdLvxbJM6ezXEzptpUEZxaPuEghFafJB77N+1ANUqLL9q
   zHCXJNtQo5FeMA2CTroE2JbzgkeMZdw4hyajXKtdbYRszs/VkUpyqoyrB
   LYWJPfpVpVbQzhchgWDSJ+Ei9xZjPkf3Xq+4tS2Ywl2qyNiKn5qjptp4D
   kvgnAYewlnjq824jTeMBjSL11NRJWPdiD49a7kyPL/E3XccPbFp0Uwm24
   2g5PId8gVsxJ9RJBkIwK9jqDUZ7PqQF/UdNRKm1UjQBf4JCMhRkJN/rFP
   A==;
X-CSE-ConnectionGUID: wIs07feuRWmNDxRWKTev1g==
X-CSE-MsgGUID: XnWy3RIvQqSyjV9hJsAl2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="12230988"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="12230988"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 22:51:28 -0700
X-CSE-ConnectionGUID: 67Z88tV7QKy/yBmIuQAKrA==
X-CSE-MsgGUID: 8W2Tjg4/S8yBI6c/FyYkZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="44689018"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Apr 2024 22:51:26 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvWIO-0001tE-1L;
	Sat, 13 Apr 2024 05:51:24 +0000
Date: Sat, 13 Apr 2024 13:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4.1 24/42] drivers/block/null_blk/main.c:774:9:
 error: implicit declaration of function 'put_tag'; did you mean 'put_page'?
Message-ID: <202404131337.PTQQEijy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and-v4.1
head:   5204e77ce1de66ec15b3e47e3867b1a52922deb2
commit: a879cc36a6d1a8b9a7084b24110b0046ed110626 [24/42] block: null_blk: replace get_tag() with a generic find_and_set_bit_lock()
config: x86_64-rhel-8.3-ltp (https://download.01.org/0day-ci/archive/20240413/202404131337.PTQQEijy-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404131337.PTQQEijy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131337.PTQQEijy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/block/null_blk/main.c:8:
   include/linux/find-atomic.h: In function '__find_and_set_bit':
   include/linux/find-atomic.h:306:35: warning: passing argument 1 of 'find_first_zero_bit' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     306 |         bit = find_first_zero_bit(addr, nbits);
         |                                   ^~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:13,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/block/null_blk/main.c:6:
   include/linux/find.h:358:56: note: expected 'const long unsigned int *' but argument is of type 'volatile long unsigned int *'
     358 | unsigned long find_first_zero_bit(const unsigned long *addr, unsigned long size)
         |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~
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
   drivers/block/null_blk/main.c:820:13: warning: 'end_cmd' defined but not used [-Wunused-function]
     820 | static void end_cmd(struct nullb_cmd *cmd)
         |             ^~~~~~~
   drivers/block/null_blk/main.c:799:26: warning: 'alloc_cmd' defined but not used [-Wunused-function]
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
