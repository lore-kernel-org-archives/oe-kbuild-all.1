Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10D150276
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Oct 2025 08:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759565396; cv=none; b=MwN6HzxPez8itcAssSAjaDmnpqWSzHaLIY1fh1ld/ElGkWpNHIjNC5iKk5Rgt7TTGOvnpjfUfEhp04hi39SUXuLdrBek8gHUnA5IQQWAWKK0YNhKYwxg7mK7sMFJGezR/0ZZTDjLOu2+220nlsNtJBIEI9E+aStzVzh2b8rutUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759565396; c=relaxed/simple;
	bh=MYXiREMPcXinmmSLK9zhPzanE7P/FRof3EfqCi1UyNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vBpsRpfi17npWUo1xWdJjZ11rmQzhOgjTXu+8vuovBO36x7VjIoJzxBue9KXta5M3GRE5br5jeZ6CGsMGIO5hAMluNfdM5VbOEcgowFAPD6o/wSu7/+MmMSrz9p0+l4yMe89WW2LPJtGXVFgi05BXnpVLI2YgyEp2oTK6vQ3sWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzAl7+79; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzAl7+79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759565394; x=1791101394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MYXiREMPcXinmmSLK9zhPzanE7P/FRof3EfqCi1UyNM=;
  b=VzAl7+79pH7jkbObjvY+yy59NtMm4ppsfoAJMM4Tt09nGvgvG/KnpfM3
   w26YR8X273fpPBblC/l3byTnS6Y8Lg3G0dImVEDR8IzdQuSgz4BsYgNDb
   DmIFqMo2Sg5apYBkxobqCNyLZC7rrwr8vr77G2KA8ZF4P27Giyx+XnVnj
   7doJ/coylWmNErWzrYUTZeS8jLUz0kkZqly57+ex/oP+yrnO/r49IBty5
   Je7OEaN8VZd7y6ty1dCSlNX3WHlJPxl42UwIxwazO8liy0XqiSl4Yj/50
   6hC835CqVFB6t2v5BxeEOmWg2WaB+3AyYU1bwx3lf/6sPBBKKrsLnMQWp
   g==;
X-CSE-ConnectionGUID: lqcUEodETj+XOErecfa8HQ==
X-CSE-MsgGUID: OVyxsPldTtG5lLhsM3CKYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61749213"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61749213"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2025 01:09:53 -0700
X-CSE-ConnectionGUID: VTuOpPkuRbCK9ZX52SWQHQ==
X-CSE-MsgGUID: HcxNP8mHSzKKlMbhqngXYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="183855353"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Oct 2025 01:09:51 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4xKu-00059d-1o;
	Sat, 04 Oct 2025 08:09:48 +0000
Date: Sat, 4 Oct 2025 16:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Tantilov <emil.s.tantilov@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Chittim Madhu <madhu.chittim@intel.com>
Subject: [tnguy-net-queue:dev-queue 7/17]
 drivers/net/ethernet/intel/idpf/idpf_ethtool.c:1713:10: warning: comparison
 of array 'np->state' not equal to a null pointer is always true
Message-ID: <202510041605.cSnfIA5l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Emil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
head:   e50b34f0f3fb86c9be2f9ad3b7ed483f18b46896
commit: 7c0e8a950dbd30ca46e999cf1d25f3e97a98f174 [7/17] idpf: convert vport state to bitmap
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251004/202510041605.cSnfIA5l-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510041605.cSnfIA5l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510041605.cSnfIA5l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/idpf/idpf_ethtool.c:1713:19: error: use of undeclared identifier '__IDPF_VPORT_UP'; did you mean 'IDPF_VPORT_UP'?
    1713 |         if (np->state != __IDPF_VPORT_UP)
         |                          ^~~~~~~~~~~~~~~
         |                          IDPF_VPORT_UP
   drivers/net/ethernet/intel/idpf/idpf.h:138:2: note: 'IDPF_VPORT_UP' declared here
     138 |         IDPF_VPORT_UP,
         |         ^
>> drivers/net/ethernet/intel/idpf/idpf_ethtool.c:1713:10: warning: comparison of array 'np->state' not equal to a null pointer is always true [-Wtautological-pointer-compare]
    1713 |         if (np->state != __IDPF_VPORT_UP)
         |             ~~~~^~~~~    ~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
   drivers/net/ethernet/intel/idpf/xdp.c:421:20: error: use of undeclared identifier '__IDPF_VPORT_UP'; did you mean 'IDPF_VPORT_UP'?
     421 |                 if (np->state == __IDPF_VPORT_UP)
         |                                  ^~~~~~~~~~~~~~~
         |                                  IDPF_VPORT_UP
   drivers/net/ethernet/intel/idpf/idpf.h:138:2: note: 'IDPF_VPORT_UP' declared here
     138 |         IDPF_VPORT_UP,
         |         ^
>> drivers/net/ethernet/intel/idpf/xdp.c:421:11: warning: comparison of array 'np->state' equal to a null pointer is always false [-Wtautological-pointer-compare]
     421 |                 if (np->state == __IDPF_VPORT_UP)
         |                     ~~~~^~~~~    ~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +1713 drivers/net/ethernet/intel/idpf/idpf_ethtool.c

1a49cf814fe1ed Milena Olech 2025-04-16  1687  
7a5a03869801e2 Milena Olech 2025-08-29  1688  /**
7a5a03869801e2 Milena Olech 2025-08-29  1689   * idpf_get_ts_stats - Collect HW tstamping statistics
7a5a03869801e2 Milena Olech 2025-08-29  1690   * @netdev: network interface device structure
7a5a03869801e2 Milena Olech 2025-08-29  1691   * @ts_stats: HW timestamping stats structure
7a5a03869801e2 Milena Olech 2025-08-29  1692   *
7a5a03869801e2 Milena Olech 2025-08-29  1693   * Collect HW timestamping statistics including successfully timestamped
7a5a03869801e2 Milena Olech 2025-08-29  1694   * packets, discarded due to illegal values, flushed during releasing PTP and
7a5a03869801e2 Milena Olech 2025-08-29  1695   * skipped due to lack of the free index.
7a5a03869801e2 Milena Olech 2025-08-29  1696   */
7a5a03869801e2 Milena Olech 2025-08-29  1697  static void idpf_get_ts_stats(struct net_device *netdev,
7a5a03869801e2 Milena Olech 2025-08-29  1698  			      struct ethtool_ts_stats *ts_stats)
7a5a03869801e2 Milena Olech 2025-08-29  1699  {
7a5a03869801e2 Milena Olech 2025-08-29  1700  	struct idpf_netdev_priv *np = netdev_priv(netdev);
7a5a03869801e2 Milena Olech 2025-08-29  1701  	struct idpf_vport *vport;
7a5a03869801e2 Milena Olech 2025-08-29  1702  	unsigned int start;
7a5a03869801e2 Milena Olech 2025-08-29  1703  
7a5a03869801e2 Milena Olech 2025-08-29  1704  	idpf_vport_ctrl_lock(netdev);
7a5a03869801e2 Milena Olech 2025-08-29  1705  	vport = idpf_netdev_to_vport(netdev);
7a5a03869801e2 Milena Olech 2025-08-29  1706  	do {
7a5a03869801e2 Milena Olech 2025-08-29  1707  		start = u64_stats_fetch_begin(&vport->tstamp_stats.stats_sync);
7a5a03869801e2 Milena Olech 2025-08-29  1708  		ts_stats->pkts = u64_stats_read(&vport->tstamp_stats.packets);
7a5a03869801e2 Milena Olech 2025-08-29  1709  		ts_stats->lost = u64_stats_read(&vport->tstamp_stats.flushed);
7a5a03869801e2 Milena Olech 2025-08-29  1710  		ts_stats->err = u64_stats_read(&vport->tstamp_stats.discarded);
7a5a03869801e2 Milena Olech 2025-08-29  1711  	} while (u64_stats_fetch_retry(&vport->tstamp_stats.stats_sync, start));
7a5a03869801e2 Milena Olech 2025-08-29  1712  
7a5a03869801e2 Milena Olech 2025-08-29 @1713  	if (np->state != __IDPF_VPORT_UP)
7a5a03869801e2 Milena Olech 2025-08-29  1714  		goto exit;
7a5a03869801e2 Milena Olech 2025-08-29  1715  
7a5a03869801e2 Milena Olech 2025-08-29  1716  	for (u16 i = 0; i < vport->num_txq_grp; i++) {
7a5a03869801e2 Milena Olech 2025-08-29  1717  		struct idpf_txq_group *txq_grp = &vport->txq_grps[i];
7a5a03869801e2 Milena Olech 2025-08-29  1718  
7a5a03869801e2 Milena Olech 2025-08-29  1719  		for (u16 j = 0; j < txq_grp->num_txq; j++) {
7a5a03869801e2 Milena Olech 2025-08-29  1720  			struct idpf_tx_queue *txq = txq_grp->txqs[j];
7a5a03869801e2 Milena Olech 2025-08-29  1721  			struct idpf_tx_queue_stats *stats;
7a5a03869801e2 Milena Olech 2025-08-29  1722  			u64 ts;
7a5a03869801e2 Milena Olech 2025-08-29  1723  
7a5a03869801e2 Milena Olech 2025-08-29  1724  			if (!txq)
7a5a03869801e2 Milena Olech 2025-08-29  1725  				continue;
7a5a03869801e2 Milena Olech 2025-08-29  1726  
7a5a03869801e2 Milena Olech 2025-08-29  1727  			stats = &txq->q_stats;
7a5a03869801e2 Milena Olech 2025-08-29  1728  			do {
7a5a03869801e2 Milena Olech 2025-08-29  1729  				start = u64_stats_fetch_begin(&txq->stats_sync);
7a5a03869801e2 Milena Olech 2025-08-29  1730  
7a5a03869801e2 Milena Olech 2025-08-29  1731  				ts = u64_stats_read(&stats->tstamp_skipped);
7a5a03869801e2 Milena Olech 2025-08-29  1732  			} while (u64_stats_fetch_retry(&txq->stats_sync,
7a5a03869801e2 Milena Olech 2025-08-29  1733  						       start));
7a5a03869801e2 Milena Olech 2025-08-29  1734  
7a5a03869801e2 Milena Olech 2025-08-29  1735  			ts_stats->lost += ts;
7a5a03869801e2 Milena Olech 2025-08-29  1736  		}
7a5a03869801e2 Milena Olech 2025-08-29  1737  	}
7a5a03869801e2 Milena Olech 2025-08-29  1738  
7a5a03869801e2 Milena Olech 2025-08-29  1739  exit:
7a5a03869801e2 Milena Olech 2025-08-29  1740  	idpf_vport_ctrl_unlock(netdev);
7a5a03869801e2 Milena Olech 2025-08-29  1741  }
7a5a03869801e2 Milena Olech 2025-08-29  1742  

:::::: The code at line 1713 was first introduced by commit
:::::: 7a5a03869801e2f1cabdc55b2e697fea20da5c68 idpf: add HW timestamping statistics

:::::: TO: Milena Olech <milena.olech@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
