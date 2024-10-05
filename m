Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131345647F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 05:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728106320; cv=none; b=CBss8SqH2BmlPRVflOF0Sm1y5e7w9myBgdcxOoOCBBIoA7fbtpWu2Sr7c9Vp26ULiVde9U3eT0mpspIu5LdQV6qbSf25V6mrhfPc9tAhI+I/my9wTmBBwmh7JFf1FGAWP/olPQzl4NYiBoyK1Ifq4Ag26M0CL2n12m+4qXNbL7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728106320; c=relaxed/simple;
	bh=FG57I8KmW6zgazjfKjVDxMnuafp6FOVge/mBJa5mSMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qm1X/GB76OF/ZtNVwzCXResY7wR1LRzM7ttngf3H8wuUkJbuNddw5zUoYrqPDU+vMrHb1z3zWttaO6ocmc22Mpt0mFd1opaEsITvSN3bqK1FQfoINKNP4bkcVLHlwi6PdHS5ujAak+vkJW+1j4jdEUawqs28LlpYIFOMibYGw68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDwAjj++; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDwAjj++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728106318; x=1759642318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FG57I8KmW6zgazjfKjVDxMnuafp6FOVge/mBJa5mSMk=;
  b=fDwAjj++q0cXTFavUz68oRVTxRV5Xvl00mEbGPiF5HR8/IpQdv8XrqQ2
   p0imJMA6yO+XUVeOy6xxDnA++g4YPHCjX7dZedae4FEM6WLUJZ98QRIwc
   MrPzI3B+89/NAd2fKR6DvsPW9fHqLh13eVtAyxz8RpLMhN3c9WOqcKcGK
   vbhpiFbf0s8yEmZq6+XFNqvRAEszRJeUE7CX8NxetUQckM5TxPKC+gHaZ
   gU0vlETjj2tGaWK8ZQ+uhUSK9wC7gqpmeV19aLUmgNCofk8xULWvXod//
   qXsExbaX4ZLXvR8WeiZfbN6mOHBGAAg460pbe9AAZNtOthjclcNuzGbpZ
   w==;
X-CSE-ConnectionGUID: fJvOBa8zSd20OttXKHDoaA==
X-CSE-MsgGUID: g5/+uccmQdq6snl3AFWLjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27275062"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27275062"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 22:31:57 -0700
X-CSE-ConnectionGUID: S+cuj+jyTaeaYGLbI2wbZQ==
X-CSE-MsgGUID: 8Wh6xfwQSAebQznus+v73A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="79486527"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2024 22:31:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swxOU-0002bM-0f;
	Sat, 05 Oct 2024 05:31:54 +0000
Date: Sat, 5 Oct 2024 13:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg_trace_v4_5d 73/104]
 drivers/net/wireless/ath/wil6210/txrx.c:2238:17: sparse: sparse: Initializer
 entry defined twice
Message-ID: <202410051333.umaZI80c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyndbg_trace_v4_5d
head:   f80f5812bfbeed250f7095621935b1eaaa5d71d2
commit: 80f306c8021b48aee131939f2ed2b8ddd8642f10 [73/104] dyndbg: move flags field to a new structure
config: x86_64-randconfig-123-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051333.umaZI80c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051333.umaZI80c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051333.umaZI80c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/wil6210/txrx.c:2238:17: sparse: sparse: Initializer entry defined twice
   drivers/net/wireless/ath/wil6210/txrx.c:2238:17: sparse:   also defined here
   drivers/net/wireless/ath/wil6210/txrx.c:2242:17: sparse: sparse: Initializer entry defined twice
   drivers/net/wireless/ath/wil6210/txrx.c:2242:17: sparse:   also defined here
   drivers/net/wireless/ath/wil6210/txrx.c:2258:25: sparse: sparse: Initializer entry defined twice
   drivers/net/wireless/ath/wil6210/txrx.c:2258:25: sparse:   also defined here
   drivers/net/wireless/ath/wil6210/txrx.c:2278:25: sparse: sparse: Initializer entry defined twice
   drivers/net/wireless/ath/wil6210/txrx.c:2278:25: sparse:   also defined here
   drivers/net/wireless/ath/wil6210/txrx.c:2286:17: sparse: sparse: Initializer entry defined twice
   drivers/net/wireless/ath/wil6210/txrx.c:2286:17: sparse:   also defined here

vim +2238 drivers/net/wireless/ath/wil6210/txrx.c

5933a06dc96cad Vladimir Kondratiev 2015-02-01  2209  
e6636d649474fc Lee Jones           2020-08-27  2210  /* Check status of tx vrings and stop/wake net queues if needed
5bd6098252104f Lior David          2018-02-26  2211   * It will start/stop net queues of a specific VIF net_device.
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2212   *
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2213   * This function does one of two checks:
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2214   * In case check_stop is true, will check if net queues need to be stopped. If
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2215   * the conditions for stopping are met, netif_tx_stop_all_queues() is called.
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2216   * In case check_stop is false, will check if net queues need to be waked. If
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2217   * the conditions for waking are met, netif_tx_wake_all_queues() is called.
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2218   * vring is the vring which is currently being modified by either adding
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2219   * descriptors (tx) into it or removing descriptors (tx complete) from it. Can
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2220   * be null when irrelevant (e.g. connect/disconnect events).
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2221   *
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2222   * The implementation is to stop net queues if modified vring has low
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2223   * descriptor availability. Wake if all vrings are not in low descriptor
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2224   * availability and modified vring has high descriptor availability.
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2225   */
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2226  static inline void __wil_update_net_queues(struct wil6210_priv *wil,
5bd6098252104f Lior David          2018-02-26  2227  					   struct wil6210_vif *vif,
10590c6a07b6a8 Gidon Studinski     2018-06-29  2228  					   struct wil_ring *ring,
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2229  					   bool check_stop)
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2230  {
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2231  	int i;
df2b53884a5a45 Maya Erez           2018-08-23  2232  	int min_ring_id = wil_get_min_tx_ring_id(wil);
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2233  
5bd6098252104f Lior David          2018-02-26  2234  	if (unlikely(!vif))
5bd6098252104f Lior David          2018-02-26  2235  		return;
5bd6098252104f Lior David          2018-02-26  2236  
10590c6a07b6a8 Gidon Studinski     2018-06-29  2237  	if (ring)
5bd6098252104f Lior David          2018-02-26 @2238  		wil_dbg_txrx(wil, "vring %d, mid %d, check_stop=%d, stopped=%d",
10590c6a07b6a8 Gidon Studinski     2018-06-29  2239  			     (int)(ring - wil->ring_tx), vif->mid, check_stop,
5bd6098252104f Lior David          2018-02-26  2240  			     vif->net_queue_stopped);
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2241  	else
5bd6098252104f Lior David          2018-02-26  2242  		wil_dbg_txrx(wil, "check_stop=%d, mid=%d, stopped=%d",
5bd6098252104f Lior David          2018-02-26  2243  			     check_stop, vif->mid, vif->net_queue_stopped);
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2244  
0439a5e035f718 Dedy Lansky         2019-02-22  2245  	if (ring && drop_if_ring_full)
0439a5e035f718 Dedy Lansky         2019-02-22  2246  		/* no need to stop/wake net queues */
0439a5e035f718 Dedy Lansky         2019-02-22  2247  		return;
0439a5e035f718 Dedy Lansky         2019-02-22  2248  
5bd6098252104f Lior David          2018-02-26  2249  	if (check_stop == vif->net_queue_stopped)
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2250  		/* net queues already in desired state */
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2251  		return;
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2252  
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2253  	if (check_stop) {
10590c6a07b6a8 Gidon Studinski     2018-06-29  2254  		if (!ring || unlikely(wil_ring_avail_low(ring))) {
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2255  			/* not enough room in the vring */
5bd6098252104f Lior David          2018-02-26  2256  			netif_tx_stop_all_queues(vif_to_ndev(vif));
5bd6098252104f Lior David          2018-02-26  2257  			vif->net_queue_stopped = true;
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2258  			wil_dbg_txrx(wil, "netif_tx_stop called\n");
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2259  		}
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2260  		return;
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2261  	}
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2262  
fe9ee51e6a43a7 Maya Erez           2017-06-16  2263  	/* Do not wake the queues in suspend flow */
fe9ee51e6a43a7 Maya Erez           2017-06-16  2264  	if (test_bit(wil_status_suspending, wil->status) ||
fe9ee51e6a43a7 Maya Erez           2017-06-16  2265  	    test_bit(wil_status_suspended, wil->status))
fe9ee51e6a43a7 Maya Erez           2017-06-16  2266  		return;
fe9ee51e6a43a7 Maya Erez           2017-06-16  2267  
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2268  	/* check wake */
df2b53884a5a45 Maya Erez           2018-08-23  2269  	for (i = min_ring_id; i < WIL6210_MAX_TX_RINGS; i++) {
10590c6a07b6a8 Gidon Studinski     2018-06-29  2270  		struct wil_ring *cur_ring = &wil->ring_tx[i];
10590c6a07b6a8 Gidon Studinski     2018-06-29  2271  		struct wil_ring_tx_data  *txdata = &wil->ring_tx_data[i];
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2272  
10590c6a07b6a8 Gidon Studinski     2018-06-29  2273  		if (txdata->mid != vif->mid || !cur_ring->va ||
10590c6a07b6a8 Gidon Studinski     2018-06-29  2274  		    !txdata->enabled || cur_ring == ring)
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2275  			continue;
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2276  
10590c6a07b6a8 Gidon Studinski     2018-06-29  2277  		if (wil_ring_avail_low(cur_ring)) {
10590c6a07b6a8 Gidon Studinski     2018-06-29  2278  			wil_dbg_txrx(wil, "ring %d full, can't wake\n",
10590c6a07b6a8 Gidon Studinski     2018-06-29  2279  				     (int)(cur_ring - wil->ring_tx));
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2280  			return;
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2281  		}
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2282  	}
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2283  
10590c6a07b6a8 Gidon Studinski     2018-06-29  2284  	if (!ring || wil_ring_avail_high(ring)) {
10590c6a07b6a8 Gidon Studinski     2018-06-29  2285  		/* enough room in the ring */
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2286  		wil_dbg_txrx(wil, "calling netif_tx_wake\n");
5bd6098252104f Lior David          2018-02-26  2287  		netif_tx_wake_all_queues(vif_to_ndev(vif));
5bd6098252104f Lior David          2018-02-26  2288  		vif->net_queue_stopped = false;
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2289  	}
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2290  }
f9e3033ff7eb9a Dedy Lansky         2016-11-23  2291  

:::::: The code at line 2238 was first introduced by commit
:::::: 5bd6098252104f1007882805e9d7c36924ff6a81 wil6210: multiple VIFs support for connections and data path

:::::: TO: Lior David <liord@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
