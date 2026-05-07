Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20DD31CA4E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 06:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778133723; cv=none; b=T7BkiiX+noKOQhzLmrWrWsXf8WotCZybRMIthej5U0Ro2GdiYtQ/FxTadKwpDwq1BJOlDbpPv4edEgMtS3zouQldafl7RcR6dUhI3Pm0KDUZ/rBTwGuqkvg2KOioWZpZUA/YiZCFPQp/wwlgmD6AsuzE4zGvVAfzPVEkrV+ONA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778133723; c=relaxed/simple;
	bh=2cJ2JPQ4JOuaI/Wbqj/SJsMdj4BGFnFdNJ437biKxMM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bsweKFmHi9JGCLkaFJizsadSINhGIrDj7PinrV8hm/nDkxU6Om9no6Nn/NRbR8luuz7jXAp5USRhLlzMQTSEMQcpi7vD1FAFImlAphn4Xnl+aDBsIn5asz+OVwgcdFsNOxxIe1hJPjDrGJTtSpGGL1cXzlc03Rxnt7xw7Fwqrxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atMziTMV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atMziTMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778133721; x=1809669721;
  h=date:from:to:cc:subject:message-id;
  bh=2cJ2JPQ4JOuaI/Wbqj/SJsMdj4BGFnFdNJ437biKxMM=;
  b=atMziTMVZcNB0VDGXrd0t8RqIIf2L6HSto9it66inzBqjBPA49G6DonM
   vm9ApXbIJlVw2scJL7Rlwvg+akU2vpimFkDg6C9/Ul2Vk6xnM/IKSwfdK
   uR/cEu9wVJGqANJYVDyIsepc9hGRGTp6UdcvDehXG2naJDHwpYnUbYYF1
   +VHngMoAZkQqF1GMVYoZ+m76TWf9UyyBUrPBjr6/0xI5EqxeHN03ks7ge
   QUdVc5wrIVFskqwBaVejd6DSbwLGffnhTVPYxNShOGFihst3FWt/u9ftk
   Wdb/foJKECSCE9sert1ZgBBGrRb8EDrKk4Otvae0jTI+8RBgrDnLdfujZ
   w==;
X-CSE-ConnectionGUID: k4i3A0JdRIWVz35HupbOBg==
X-CSE-MsgGUID: M1RL/IxVQaydInSYG8DJfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82942371"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="82942371"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 23:02:01 -0700
X-CSE-ConnectionGUID: /VVJyPQiSmuf3ooL602PHA==
X-CSE-MsgGUID: wxliRKYZTp6qDtdnh/P85A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="240354984"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2026 23:01:59 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKro4-000000001bd-2MRH;
	Thu, 07 May 2026 06:01:56 +0000
Date: Thu, 07 May 2026 14:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1072/3796] fs/fuse/dev.c:2125:48: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202605071323.XbMBRsje-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   735d2f48cadaa9a87e7c7601667878de70c771c5
commit: 840eb4821246006cbafee4b40287c58c79e56eeb [1072/3796] fuse: set params in fuse_chan_set_initialized()
config: x86_64-randconfig-123-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071323.XbMBRsje-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071323.XbMBRsje-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071323.XbMBRsje-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/dev.c:2125:48: sparse: sparse: Using plain integer as NULL pointer

vim +2125 fs/fuse/dev.c

  2085	
  2086	/*
  2087	 * Abort all requests.
  2088	 *
  2089	 * Emergency exit in case of a malicious or accidental deadlock, or just a hung
  2090	 * filesystem.
  2091	 *
  2092	 * The same effect is usually achievable through killing the filesystem daemon
  2093	 * and all users of the filesystem.  The exception is the combination of an
  2094	 * asynchronous request and the tricky deadlock (see
  2095	 * Documentation/filesystems/fuse/fuse.rst).
  2096	 *
  2097	 * Aborting requests under I/O goes as follows: 1: Separate out unlocked
  2098	 * requests, they should be finished off immediately.  Locked requests will be
  2099	 * finished after unlock; see unlock_request(). 2: Finish off the unlocked
  2100	 * requests.  It is possible that some request will finish before we can.  This
  2101	 * is OK, the request will in that case be removed from the list before we touch
  2102	 * it.
  2103	 */
  2104	void fuse_chan_abort(struct fuse_chan *fch, bool abort_with_err)
  2105	{
  2106		struct fuse_iqueue *fiq = &fch->iq;
  2107	
  2108		fch->abort_with_err = abort_with_err;
  2109	
  2110		spin_lock(&fch->lock);
  2111		if (fch->connected) {
  2112			struct fuse_dev *fud;
  2113			struct fuse_req *req, *next;
  2114			LIST_HEAD(to_end);
  2115			unsigned int i;
  2116	
  2117			if (fch->timeout.req_timeout)
  2118				cancel_delayed_work(&fch->timeout.work);
  2119	
  2120			/* Background queuing checks fch->connected under bg_lock */
  2121			spin_lock(&fch->bg_lock);
  2122			fch->connected = 0;
  2123			spin_unlock(&fch->bg_lock);
  2124	
> 2125			fuse_chan_set_initialized(fch, 0);
  2126			list_for_each_entry(fud, &fch->devices, entry) {
  2127				struct fuse_pqueue *fpq = &fud->pq;
  2128	
  2129				spin_lock(&fpq->lock);
  2130				fpq->connected = 0;
  2131				list_for_each_entry_safe(req, next, &fpq->io, list) {
  2132					req->out.h.error = -ECONNABORTED;
  2133					spin_lock(&req->waitq.lock);
  2134					set_bit(FR_ABORTED, &req->flags);
  2135					if (!test_bit(FR_LOCKED, &req->flags)) {
  2136						set_bit(FR_PRIVATE, &req->flags);
  2137						__fuse_get_request(req);
  2138						list_move(&req->list, &to_end);
  2139					}
  2140					spin_unlock(&req->waitq.lock);
  2141				}
  2142				for (i = 0; i < FUSE_PQ_HASH_SIZE; i++)
  2143					list_splice_tail_init(&fpq->processing[i],
  2144							      &to_end);
  2145				spin_unlock(&fpq->lock);
  2146			}
  2147			spin_lock(&fch->bg_lock);
  2148			fch->blocked = 0;
  2149			fch->max_background = UINT_MAX;
  2150			flush_bg_queue(fch);
  2151			spin_unlock(&fch->bg_lock);
  2152	
  2153			spin_lock(&fiq->lock);
  2154			fiq->connected = 0;
  2155			list_for_each_entry(req, &fiq->pending, list)
  2156				clear_bit(FR_PENDING, &req->flags);
  2157			list_splice_tail_init(&fiq->pending, &to_end);
  2158			while (forget_pending(fiq))
  2159				kfree(fuse_dequeue_forget(fiq, 1, NULL));
  2160			wake_up_all(&fiq->waitq);
  2161			spin_unlock(&fiq->lock);
  2162			kill_fasync(&fiq->fasync, SIGIO, POLL_IN);
  2163			fuse_end_polls(fch->conn);
  2164			wake_up_all(&fch->blocked_waitq);
  2165			spin_unlock(&fch->lock);
  2166	
  2167			fuse_dev_end_requests(&to_end);
  2168	
  2169			/*
  2170			 * fch->lock must not be taken to avoid conflicts with io-uring
  2171			 * locks
  2172			 */
  2173			fuse_uring_abort(fch);
  2174		} else {
  2175			spin_unlock(&fch->lock);
  2176		}
  2177	}
  2178	EXPORT_SYMBOL_GPL(fuse_chan_abort);
  2179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
