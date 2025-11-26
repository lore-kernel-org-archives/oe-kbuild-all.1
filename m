Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642B625785D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 23:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764201574; cv=none; b=CPzCxQbKBFt28sl5f+6uWzLw10YG5XFRM8P65jRtdTT9KaoIzmLgQKa7KKp+/z1Izw9mkKfUKS2+UWD+z/Pod2DOEddu+tz/kKR/t46FuDvgeyqpRvlXwbdvHO1W8R4yLHD4GG2JjjKsQlEOu5KkMwL80htMQfN5csSe0iYOjH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764201574; c=relaxed/simple;
	bh=27iVwFxTwOuBTy7oV3cfjXSnyfz6z9TObP4ezD3qA10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=reicYL5O4DNfHwSaczT+ZrfNQcalMfF+84iOMxcaCNVWrrRSCVCcrPOJG40gGVR8WZs4aMG72bVjQmk3htYEckecxWpcT+iUimD4EodPDnbDL5jSVyHhbZ53K9Gg0n9YwtKcDf50ZXxHgEvJ/0xXSiasmy4VpU9U89z4p7PHSkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdahcpl1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdahcpl1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764201572; x=1795737572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=27iVwFxTwOuBTy7oV3cfjXSnyfz6z9TObP4ezD3qA10=;
  b=fdahcpl13khJdA/0ATm6CX2MrHZGwqT1opLNyKz6ocBAn+6I7GR6+PFc
   tUrNHyCduZWOABIGS6ru8AmFTr6TG8+gZjLUmNQl4kr7u2phZLMAuy7yM
   00e5WJBHr174rYe0dZYojsGXZto6N7XECBfgVIIoPEZrsvr1QMm2LAvWo
   X/dR4IcrYuOWVrVKm23dXN0yTHUHMaqbC2fqSH0uD6868F8kiTVR9fysX
   eGBF2nNcSzVVFhbyyOwK6rTYRHCFnPMMKw1GMakm4taLv0xSO85wBdMyI
   RNOG1Z8XeiqnM2oZ2PsU2bwxLgVxTZzuxmmOWrdZYXyyxxV8g5U1ArRUz
   A==;
X-CSE-ConnectionGUID: uXgcA7oVRceunIiLRc2j6g==
X-CSE-MsgGUID: O2ZGguA2TZabcv3oljDMBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70108634"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="70108634"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 15:59:32 -0800
X-CSE-ConnectionGUID: kHmvFCs0RNKWxXN8QzGhyg==
X-CSE-MsgGUID: Yl8xPGqJRPaDO9jwPNXY1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192894370"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2025 15:59:30 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOPPz-000000003Tx-14Gw;
	Wed, 26 Nov 2025 23:59:27 +0000
Date: Thu, 27 Nov 2025 07:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <dw@davidwei.uk>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit-iouring6 2/2] net/core/netdev_rx_queue.c:21:6:
 warning: no previous prototype for 'netdev_rx_queue_peer'
Message-ID: <202511270713.FCG5drU7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring6
head:   7bfb4fc5f460441d05b483647e4f4c59c4afaeb1
commit: 7bfb4fc5f460441d05b483647e4f4c59c4afaeb1 [2/2] net: Implement netdev_nl_bind_queue_doit
config: arc-randconfig-002-20251127 (https://download.01.org/0day-ci/archive/20251127/202511270713.FCG5drU7-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270713.FCG5drU7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270713.FCG5drU7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/netdev_rx_queue.c:21:6: warning: no previous prototype for 'netdev_rx_queue_peer' [-Wmissing-prototypes]
    void netdev_rx_queue_peer(struct net_device *src_dev,
         ^~~~~~~~~~~~~~~~~~~~
>> net/core/netdev_rx_queue.c:34:6: warning: no previous prototype for 'netdev_rx_queue_unpeer' [-Wmissing-prototypes]
    void netdev_rx_queue_unpeer(struct net_device *src_dev,
         ^~~~~~~~~~~~~~~~~~~~~~
   net/core/netdev_rx_queue.c: In function '__netif_get_rx_queue_peer':
   net/core/netdev_rx_queue.c:55:9: error: 'struct netdev_rx_queue' has no member named 'peer'
     if (rxq->peer) {
            ^~
   net/core/netdev_rx_queue.c:58:12: error: 'struct netdev_rx_queue' has no member named 'peer'
      rxq = rxq->peer;
               ^~
   net/core/netdev_rx_queue.c: At top level:
>> net/core/netdev_rx_queue.c:66:1: warning: no previous prototype for 'netif_get_rx_queue_peer_locked' [-Wmissing-prototypes]
    netif_get_rx_queue_peer_locked(struct net_device **dev, unsigned int *rxq_idx)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/netdev_rx_queue.c:81:6: warning: no previous prototype for 'netif_put_rx_queue_peer_locked' [-Wmissing-prototypes]
    void netif_put_rx_queue_peer_locked(struct net_device *orig_dev,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/netdev_rx_queue_peer +21 net/core/netdev_rx_queue.c

    20	
  > 21	void netdev_rx_queue_peer(struct net_device *src_dev,
    22				  struct netdev_rx_queue *src_rxq,
    23				  struct netdev_rx_queue *dst_rxq)
    24	{
    25		netdev_assert_locked(src_dev);
    26		netdev_assert_locked(dst_rxq->dev);
    27	
    28		netdev_hold(src_dev, &src_rxq->lease_tracker, GFP_KERNEL);
    29	
    30		WRITE_ONCE(src_rxq->lease, dst_rxq);
    31		WRITE_ONCE(dst_rxq->lease, src_rxq);
    32	}
    33	
  > 34	void netdev_rx_queue_unpeer(struct net_device *src_dev,
    35				    struct netdev_rx_queue *src_rxq,
    36				    struct netdev_rx_queue *dst_rxq)
    37	{
    38		WARN_ON_ONCE(READ_ONCE(dst_rxq->dev->reg_state) != NETREG_UNREGISTERING);
    39	
    40		netdev_assert_locked(dst_rxq->dev);
    41		netdev_assert_locked(src_dev);
    42	
    43		WRITE_ONCE(src_rxq->lease, NULL);
    44		WRITE_ONCE(dst_rxq->lease, NULL);
    45	
    46		netdev_put(src_dev, &src_rxq->lease_tracker);
    47	}
    48	
    49	static struct netdev_rx_queue *
    50	__netif_get_rx_queue_peer(struct net_device **dev, unsigned int *rxq_idx)
    51	{
    52		struct net_device *orig_dev = *dev;
    53		struct netdev_rx_queue *rxq = __netif_get_rx_queue(orig_dev, *rxq_idx);
    54	
  > 55		if (rxq->peer) {
    56			if (orig_dev->dev.parent)
    57				return NULL;
  > 58			rxq = rxq->peer;
    59			*rxq_idx = get_netdev_rx_queue_index(rxq);
    60			*dev = rxq->dev;
    61		}
    62		return rxq;
    63	}
    64	
    65	struct netdev_rx_queue *
  > 66	netif_get_rx_queue_peer_locked(struct net_device **dev, unsigned int *rxq_idx)
    67	{
    68		struct net_device *orig_dev = *dev;
    69		struct netdev_rx_queue *rxq;
    70	
    71		/* Locking order is always from the virtual to the physical device
    72		 * see netdev_nl_bind_queue_doit().
    73		 */
    74		netdev_ops_assert_locked(orig_dev);
    75		rxq = __netif_get_rx_queue_peer(dev, rxq_idx);
    76		if (rxq && orig_dev != *dev)
    77			netdev_lock(*dev);
    78		return rxq;
    79	}
    80	
  > 81	void netif_put_rx_queue_peer_locked(struct net_device *orig_dev,
    82					    struct net_device *dev)
    83	{
    84		if (orig_dev != dev)
    85			netdev_unlock(dev);
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
