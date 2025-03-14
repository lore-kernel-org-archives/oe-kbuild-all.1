Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A501C84BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 08:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942144; cv=none; b=tXGWQtRWJWKp0dkLjn9ugdI6o99dRxIwJ2BqnOApGrmWBY6H2ZAZ4P5z4Va3PqTCLf6kk2CcJVLLZBxu2SBUU0c3WXI8REEOkmZn+b4V97I2ZZNHAmLWc0Nf46q4jZB58W2HWIKzBD7U+huNRlAjgctFpmPvuW8JF+u+PAgy2bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942144; c=relaxed/simple;
	bh=/RkOl1ofNmh72IxfC8RKCGE9aTmdSMuFblH9AmdC8ss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OnlBKVkEKp52IHkMEw+ljpyx4W5rmQxR4sUU1zwI9rJJbIxLOKofFz266L+5rdLiSUQhpO8yzNbT4fyyRSCWULX19UQRDFOuAT9TtINyESOrrpNYlvdGfeJ+Hc1kXBvDZlE0tWG3p0WxlxqeyGDF9CumB6miqfUb0n6yYblZFAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DktL2nJi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DktL2nJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741942142; x=1773478142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/RkOl1ofNmh72IxfC8RKCGE9aTmdSMuFblH9AmdC8ss=;
  b=DktL2nJiPAT5qIkVYMlX8nuCxM3SZLPv45Tgm8wWIG1nWXx7+mcb9f81
   3CTVPYx0gs0iYttL9kRekvFxfSs5fNE4dMRo5N9YRCyOS4HlGbFjEzpsH
   XZ8AJeFDtnrpoiRWObrL9BQ+enYDfKLTJWugwTFF4ZjDIkbPVAyYmB5sw
   KzKuKv+74qRIvcfB10OQLkmYKkmRbzWTdsAJj6YIMxvO4Ge8THZ6Bj6FT
   NddFW6JTX5RvwJFGoHemeLpzpeYxshQtV40M2IBCA/k2CpbJ7lh4fJ0do
   It/b10cnGA1g1fJfinH3nTpgXeZl/hvNbtLAy8M9KjdJlzae0rhW6TME0
   Q==;
X-CSE-ConnectionGUID: QmXAy+MKSnmfDWO7hJRGrg==
X-CSE-MsgGUID: o3JPl2C+S9eYtE+l0aB8RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42255537"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="42255537"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 01:49:01 -0700
X-CSE-ConnectionGUID: xooHnKA5QmaNxQH0QcJ/tA==
X-CSE-MsgGUID: 8KZKcl4xRmGcY9xHiNU4Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="152056920"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 01:48:59 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt0iu-000AF2-2v;
	Fri, 14 Mar 2025 08:48:56 +0000
Date: Fri, 14 Mar 2025 16:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [tnguy-next-queue:dev-queue 87/88]
 drivers/net/ethernet/intel/igc/igc_ethtool.c:1791:undefined reference to
 `ethtool_mmsv_get_mm'
Message-ID: <202503141646.6yybVfAe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   7dca3a8a1f3c70a4ba8115e4ee5827e424629eaf
commit: 8f97e7c17be21b5b4feefd2f2e71d71761777ab8 [87/88] igc: add support to get MAC Merge data via ethtool
config: arm64-randconfig-001-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141646.6yybVfAe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141646.6yybVfAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141646.6yybVfAe-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_main.o: in function `igc_fpe_handle_mpacket':
   drivers/net/ethernet/intel/igc/igc_tsn.h:50:(.text+0x9690): undefined reference to `ethtool_mmsv_event_handle'
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_main.o: in function `igc_clean_tx_irq':
   drivers/net/ethernet/intel/igc/igc_main.c:3157:(.text+0xec44): undefined reference to `ethtool_mmsv_event_handle'
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_main.o: in function `igc_watchdog_task':
   drivers/net/ethernet/intel/igc/igc_main.c:5878:(.text+0x103a4): undefined reference to `ethtool_mmsv_link_state_handle'
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_main.c:5917:(.text+0x1058c): undefined reference to `ethtool_mmsv_link_state_handle'
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_main.o: in function `igc_down':
   drivers/net/ethernet/intel/igc/igc_main.c:5352:(.text+0x114e8): undefined reference to `ethtool_mmsv_stop'
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_ethtool.o: in function `igc_ethtool_set_mm':
   drivers/net/ethernet/intel/igc/igc_ethtool.c:1817:(.text+0x800): undefined reference to `ethtool_mmsv_set_mm'
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_ethtool.o: in function `igc_ethtool_get_mm':
>> drivers/net/ethernet/intel/igc/igc_ethtool.c:1791:(.text+0x8bc): undefined reference to `ethtool_mmsv_get_mm'
   aarch64-linux-ld: drivers/net/ethernet/intel/igc/igc_tsn.o: in function `igc_fpe_init':
   drivers/net/ethernet/intel/igc/igc_tsn.c:138:(.text+0x1238): undefined reference to `ethtool_mmsv_init'


vim +1791 drivers/net/ethernet/intel/igc/igc_ethtool.c

  1784	
  1785	static int igc_ethtool_get_mm(struct net_device *netdev,
  1786				      struct ethtool_mm_state *cmd)
  1787	{
  1788		struct igc_adapter *adapter = netdev_priv(netdev);
  1789		struct igc_fpe_t *fpe = &adapter->fpe;
  1790	
> 1791		ethtool_mmsv_get_mm(&fpe->mmsv, cmd);
  1792		cmd->tx_min_frag_size = fpe->tx_min_frag_size;
  1793		cmd->rx_min_frag_size = IGC_RX_MIN_FRAG_SIZE;
  1794	
  1795		return 0;
  1796	}
  1797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
