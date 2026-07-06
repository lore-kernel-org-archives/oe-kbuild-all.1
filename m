Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA96541F7CC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339464; cv=none; b=YIy8yJ5KSRT6GYU4gsAgqD/3/7sch0e0vK+KHVSyHAnvGtWvNemBpPtd3N5BOd7TlOZNLOsn4+eszSRPp7KS++5QbDpkGvHhPIlZegA7qG0OihAaOo0nSDHZ6AFA93J7GGbQWZSrTZh+TI12I5hVSd4O18rF/5scwPe7rsOyc7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339464; c=relaxed/simple;
	bh=0wM7W9zIeH6eDN708fcsRcnLU8C5Uw41/KImXbuXg3M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QSYDbiwZsu4biMb9UuuUR6R3rtcVi88ukPm5X61MKyRWipREHxkB4i3q794m02UBn/km4491S293q872in/pb6mXOYTjTP1WQNNSzHVPEtCYt2PskWwi52Wu11Vy57yRdcgb6QVswvgRTXQ/GWyRW7hkWIx6AdWsQ7cOsPDxQ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DI4MCAXq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DI4MCAXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783339462; x=1814875462;
  h=date:from:to:cc:subject:message-id;
  bh=0wM7W9zIeH6eDN708fcsRcnLU8C5Uw41/KImXbuXg3M=;
  b=DI4MCAXq8LIWcHjDnL2QM7xVaXDWV354Wsj+2qdbrz1PRWL5XBB3OoFC
   TSZJxR83Nuh6tOvexDk3FzZR3csdeui82H/gLkcGCZjEPUJuNDHwLDPUO
   0noXbkYAXcwsdDz9Pc6LoHM9u7YW/Mo7vSI2AA1U3hg+M5y7rENwYJiQw
   wPovAbaC+7sN+lm05U6802x39s99Yp5DuRq8bYpMCH1woLz6F8q9F7J4d
   vsprMd/xSdyzonKGXEFZYQqlmLWPnVByB7mLoUDbEqN7cjYoM64lIcwcm
   kFb6ROj6Zf6UVxVtMpRgdf+QRDuZjideS71kri45nj+bvAjZF48YPBHpq
   g==;
X-CSE-ConnectionGUID: ybZ3NHK1QgCZ6CpsH/hPYw==
X-CSE-MsgGUID: krPTgHmuTlG9SKbqSJmw8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="87651407"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="87651407"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 05:04:22 -0700
X-CSE-ConnectionGUID: zebSwcdhS1iVmqCirGlfnA==
X-CSE-MsgGUID: B7ML4JQxS9SJP3W9pxliwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="278049748"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jul 2026 05:04:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgi3D-00000000EL9-2DxX;
	Mon, 06 Jul 2026 12:04:02 +0000
Date: Mon, 06 Jul 2026 20:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-dango 209/215]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:3921:15: error: 'struct
 net_device' has no member named 'dsa_ptr'
Message-ID: <202607061956.Ea8Y83oP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daniel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-dango
head:   d19514df7d0958e914bdb3435ea4d64d2fc5766a
commit: 25c1b2b1a82b82e699dcddcfde88553d64f92abd [209/215] net: ethernet: mtk_eth_soc: add per-conduit DSA user-port queue map
config: sparc64-randconfig-r052-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061956.Ea8Y83oP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061956.Ea8Y83oP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061956.Ea8Y83oP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_update_dsa_queue_map':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3921:15: error: 'struct net_device' has no member named 'dsa_ptr'
    3921 |   ds = conduit->dsa_ptr->ds;
         |               ^~


vim +3921 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  3888	
  3889	
  3890	/*
  3891	 * Recompute the per-conduit DSA user-port queue map.  Each conduit's mac
  3892	 * gets a queue base (queues 0..MTK_MAX_DEVS-1 are reserved for non-DSA
  3893	 * egress via GDM{1,2,3}), followed by a contiguous rank for every user
  3894	 * port of the DSA switch attached to that conduit.  dsa_port_rank[]
  3895	 * translates dp->index (which may be non-contiguous and may collide
  3896	 * across switches) into that rank.
  3897	 *
  3898	 * Call this on DSA topology changes.  Idempotent.
  3899	 */
  3900	static void mtk_update_dsa_queue_map(struct mtk_eth *eth)
  3901	{
  3902		struct net_device *conduit;
  3903		struct dsa_switch *ds;
  3904		struct mtk_mac *mac;
  3905		struct dsa_port *dp;
  3906		u8 base = MTK_MAX_DEVS;
  3907		u8 rank;
  3908		int i;
  3909	
  3910		for (i = 0; i < MTK_MAX_DEVS; i++) {
  3911			conduit = eth->netdev[i];
  3912			if (!conduit)
  3913				continue;
  3914	
  3915			mac = netdev_priv(conduit);
  3916			mac->dsa_queue_base = base;
  3917	
  3918			if (!netdev_uses_dsa(conduit))
  3919				continue;
  3920	
> 3921			ds = conduit->dsa_ptr->ds;
  3922			rank = 0;
  3923			dsa_switch_for_each_user_port(dp, ds) {
  3924				if (dp->index < MTK_DSA_USER_PORT_MAX)
  3925					mac->dsa_port_rank[dp->index] = rank;
  3926				rank++;
  3927			}
  3928			base += rank;
  3929		}
  3930	}
  3931	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
