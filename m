Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431120332
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 22:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+kXruUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698790858; x=1730326858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=osGCNnHSWoccgR6iWXJsiQk+I62shHuLwIhpqQAxvqQ=;
  b=D+kXruUmlsjUoWvyvOmVbepXB5vXJP0lUEWPRUbW7WmBlvePbxhLouZU
   t2b12/yupoeudK4hWJgOAO/mtLXZGwDfIGdZympg1AHHraW2oUu3g5/6l
   sAw8x3APpxYq6LzhjAl+J1mi/rxZ2K3elojH4F78kFvcWk9D60XhqkmHn
   cX0XjoQvPR6DkFHvPYWkzPP7aO1k4lIZlbxLKxy0Ey502SKPjtlQ4e8+E
   +R7fk8MffEQuncFCMdUErVYF8+FXUpuTdrtSRp4UIafGu6D5rhF/DK53+
   P53W8u+neK02/MCv5it8TFPUecNsFXPIGAGBS7evQOlTEcKZBSjwx2DBC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="454854289"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="454854289"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 15:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="831191463"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="831191463"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Oct 2023 15:20:56 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxx6U-0000Q7-04;
	Tue, 31 Oct 2023 22:20:54 +0000
Date: Wed, 1 Nov 2023 06:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/eventpoll.c:526:9: sparse: sparse: restricted __poll_t degrades
 to integer
Message-ID: <202311010654.LEo7oBW4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a6a09e97199d6600d31383055f9d43fbbcbe86f
commit: caf1aeaffc3b09649a56769e559333ae2c4f1802 eventpoll: add EPOLL_URING_WAKE poll wakeup flag
date:   11 months ago
config: x86_64-randconfig-r031-20230909 (https://download.01.org/0day-ci/archive/20231101/202311010654.LEo7oBW4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010654.LEo7oBW4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010654.LEo7oBW4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/eventpoll.c:526:9: sparse: sparse: restricted __poll_t degrades to integer
>> fs/eventpoll.c:526:9: sparse: sparse: cast to restricted __poll_t
>> fs/eventpoll.c:1213:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int pollflags @@     got restricted __poll_t @@
   fs/eventpoll.c:1213:53: sparse:     expected unsigned int pollflags
   fs/eventpoll.c:1213:53: sparse:     got restricted __poll_t

vim +526 fs/eventpoll.c

   493	
   494	static void ep_poll_safewake(struct eventpoll *ep, struct epitem *epi,
   495				     unsigned pollflags)
   496	{
   497		struct eventpoll *ep_src;
   498		unsigned long flags;
   499		u8 nests = 0;
   500	
   501		/*
   502		 * To set the subclass or nesting level for spin_lock_irqsave_nested()
   503		 * it might be natural to create a per-cpu nest count. However, since
   504		 * we can recurse on ep->poll_wait.lock, and a non-raw spinlock can
   505		 * schedule() in the -rt kernel, the per-cpu variable are no longer
   506		 * protected. Thus, we are introducing a per eventpoll nest field.
   507		 * If we are not being call from ep_poll_callback(), epi is NULL and
   508		 * we are at the first level of nesting, 0. Otherwise, we are being
   509		 * called from ep_poll_callback() and if a previous wakeup source is
   510		 * not an epoll file itself, we are at depth 1 since the wakeup source
   511		 * is depth 0. If the wakeup source is a previous epoll file in the
   512		 * wakeup chain then we use its nests value and record ours as
   513		 * nests + 1. The previous epoll file nests value is stable since its
   514		 * already holding its own poll_wait.lock.
   515		 */
   516		if (epi) {
   517			if ((is_file_epoll(epi->ffd.file))) {
   518				ep_src = epi->ffd.file->private_data;
   519				nests = ep_src->nests;
   520			} else {
   521				nests = 1;
   522			}
   523		}
   524		spin_lock_irqsave_nested(&ep->poll_wait.lock, flags, nests);
   525		ep->nests = nests + 1;
 > 526		wake_up_locked_poll(&ep->poll_wait, EPOLLIN | pollflags);
   527		ep->nests = 0;
   528		spin_unlock_irqrestore(&ep->poll_wait.lock, flags);
   529	}
   530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
