Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC29059B6D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 22:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710800481; cv=none; b=M4OKaVjSsomjHM1aED76VoLCel5MjcbMwGWXOlu44JKR6vAILm6LXfdnzb5OYD6xhJDBRjjmUduL1UQIqJqSjI2tzUuHAgNcXSO/qzTvk7TZYew4NpTc1N4PfbQWY6sWwlA1cMha7IttChKL8vZaI5N9/vs+orNhUEn0pYQiSKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710800481; c=relaxed/simple;
	bh=ZbRbnrWjPEZ2agM4s7dVKdAZVJfzYsllQiIRV4xQTHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhdj8ShnfhwD41YCcTQtUjd9slfwuA55/elIKLNtdl9QobKd9UB6Ayl8/8URNR4oux7fgZ1SR7EiTsxaZoRJweMJKxtZknXJihTZ7T06CXCbVyLplBEbIU62Zjgq789d7B1oKmSRTMcbfs0h2Ra9o3Jxrk5rVpTyLkBnjGzES98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjFMpuwN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjFMpuwN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710800478; x=1742336478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZbRbnrWjPEZ2agM4s7dVKdAZVJfzYsllQiIRV4xQTHo=;
  b=jjFMpuwN06zxvP20VUogAUZ2mp6ENdlG8KXRqKyXDpiTq/xlIadoxj4O
   EeL/0pERr349vXPbunf788Vrg562v4EIF4CGVW+y0T9ztNXY48lS5rXHi
   zrmqcPb+MR74uwq7py1eSN+3Z9gyeOR5WxMrnLH8mzULi/8hNsaHc6mkn
   2iQOPqz65DjRisKmGy+eUxKU0fYrxi3L2C2+BbwOabje7/H6V3eZB0LO2
   UqNYS3QivenZt3aVIUTTneBUzhaMosSmBRrl/0qNqFJKMjmDFPOK/ruxW
   p3Idjrou9J/uU0iwGdLaEBjg84ogb6BWg+Nm6eRQjuW4D6dTaq+zTWKsx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5769068"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5769068"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 15:21:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="13689328"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Mar 2024 15:21:15 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmLM0-000HH9-32;
	Mon, 18 Mar 2024 22:21:12 +0000
Date: Tue, 19 Mar 2024 06:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:b-4.4-st50-rt48 55/395]
 drivers/net/ethernet/neterion/s2io.c:4024:6: warning: variable
 'do_spin_lock' set but not used
Message-ID: <202403190652.ETF0YUNi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st50-rt48
head:   9721fc7815f56adca91f657c671845e73f895763
commit: d9b51cb6d9d4451fbda017a2e5c510d2fc5509cc [55/395] drivers/net: fix livelock issues
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240319/202403190652.ETF0YUNi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403190652.ETF0YUNi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190652.ETF0YUNi-lkp@intel.com/

All warnings (new ones prefixed by >>):

                   ^
   drivers/net/ethernet/neterion/s2io.c:704:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:724:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:797:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < config->rx_ring_num; i++) {
                    ^
   drivers/net/ethernet/neterion/s2io.c: In function 'free_shared_mem':
   drivers/net/ethernet/neterion/s2io.c:903:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->tx_fifo_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:942:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:962:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < config->rx_ring_num; i++) {
                    ^
   drivers/net/ethernet/neterion/s2io.c:992:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < nic->config.tx_fifo_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c: In function 'init_tti':
   drivers/net/ethernet/neterion/s2io.c:1125:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->tx_fifo_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c: In function 'init_nic':
   drivers/net/ethernet/neterion/s2io.c:1286:23: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0, j = 0; i < config->tx_fifo_num; i++) {
                          ^
   drivers/net/ethernet/neterion/s2io.c:1292:9: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (i == (config->tx_fifo_num - 1)) {
            ^~
   drivers/net/ethernet/neterion/s2io.c:1348:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:1365:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:1620:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0 ; i < config->rx_ring_num ; i++)
                    ^
   drivers/net/ethernet/neterion/s2io.c:1626:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:1701:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c: In function 'free_tx_buffers':
   drivers/net/ethernet/neterion/s2io.c:2376:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->tx_fifo_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:2382:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (j = 0; j < tx_cfg->fifo_len; j++) {
                    ^
   drivers/net/ethernet/neterion/s2io.c: In function 'fill_rx_buffers':
   drivers/net/ethernet/neterion/s2io.c:2482:12: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
          (off == ring->rx_curr_get_info.offset) &&
               ^~
   drivers/net/ethernet/neterion/s2io.c:2490:43: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
       if (ring->rx_curr_put_info.block_index ==
                                              ^~
   drivers/net/ethernet/neterion/s2io.c: In function 'free_rx_buffers':
   drivers/net/ethernet/neterion/s2io.c:2730:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:2733:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (blk = 0; blk < rx_ring_sz[i]; blk++)
                        ^
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_poll_inta':
   drivers/net/ethernet/neterion/s2io.c:2810:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_netpoll':
   drivers/net/ethernet/neterion/s2io.c:2860:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->tx_fifo_num; i++)
                   ^
   drivers/net/ethernet/neterion/s2io.c:2864:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:2870:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c: In function 'rx_intr_handler':
   drivers/net/ethernet/neterion/s2io.c:2960:23: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (get_info.offset == rxd_count[ring_data->rxd_mode]) {
                          ^~
   drivers/net/ethernet/neterion/s2io.c:2977:39: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if ((indicate_max_pkts) && (pkt_cnt > indicate_max_pkts))
                                          ^
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_chk_xpak_counter':
   drivers/net/ethernet/neterion/s2io.c:3190:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < index; i++)
                   ^
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_enable_msi_x':
   drivers/net/ethernet/neterion/s2io.c:3779:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (j = 0; j < nic->config.rx_ring_num; j++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_xmit':
>> drivers/net/ethernet/neterion/s2io.c:4024:6: warning: variable 'do_spin_lock' set but not used [-Wunused-but-set-variable]
     int do_spin_lock = 1;
         ^~~~~~~~~~~~
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_msix_fifo_handle':
   drivers/net/ethernet/neterion/s2io.c:4301:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < config->tx_fifo_num; i++)
                    ^
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_isr':
   drivers/net/ethernet/neterion/s2io.c:4758:18: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
       for (i = 0; i < config->rx_ring_num; i++) {
                     ^
   drivers/net/ethernet/neterion/s2io.c:4773:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < config->tx_fifo_num; i++)
                    ^
   drivers/net/ethernet/neterion/s2io.c:4783:18: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
       for (i = 0; i < config->rx_ring_num; i++) {
                     ^
   drivers/net/ethernet/neterion/s2io.c: In function 'do_s2io_store_unicast_mc':
   drivers/net/ethernet/neterion/s2io.c:5105:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (mac_addr == FAILURE)
                   ^~
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_ethtool_gregs':
   drivers/net/ethernet/neterion/s2io.c:5414:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < regs->len; i += 8) {
                   ^
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_ethtool_gringparam':
   drivers/net/ethernet/neterion/s2io.c:5514:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < sp->config.rx_ring_num; i++)
                   ^
   drivers/net/ethernet/neterion/s2io.c:5519:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < sp->config.tx_fifo_num; i++)
                   ^
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_ethtool_seeprom':
   drivers/net/ethernet/neterion/s2io.c:5847:20: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (eeprom->magic != (sp->pdev->vendor | (sp->pdev->device << 16))) {
                       ^~
   drivers/net/ethernet/neterion/s2io.c: In function 'rxd_owner_bit_reset':
   drivers/net/ethernet/neterion/s2io.c:6928:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c: In function 'do_s2io_card_down':
   drivers/net/ethernet/neterion/s2io.c:7083:15: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
       for (; off < sp->config.rx_ring_num; off++)
                  ^
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_card_up':
   drivers/net/ethernet/neterion/s2io.c:7167:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:7186:18: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
       for (i = 0; i < sp->config.rx_ring_num; i++)
                     ^
   drivers/net/ethernet/neterion/s2io.c:7247:18: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
       for (i = 0; i < sp->config.rx_ring_num; i++)
                     ^
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_verify_parm':
   drivers/net/ethernet/neterion/s2io.c:7602:24: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
     if ((tx_steering_type < NO_STEERING) ||
                           ^
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_init_nic':
   drivers/net/ethernet/neterion/s2io.c:7836:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->tx_fifo_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:7848:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->tx_fifo_num; i++)
                   ^
   drivers/net/ethernet/neterion/s2io.c:7853:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->tx_fifo_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:7867:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < config->rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:7880:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < rx_ring_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:7979:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < config->rx_ring_num ; i++) {
                    ^
   drivers/net/ethernet/neterion/s2io.c:8055:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < sp->config.tx_fifo_num; i++) {
                   ^
   drivers/net/ethernet/neterion/s2io.c:8133:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < sp->config.tx_fifo_num; i++) {
                    ^
   drivers/net/ethernet/neterion/s2io.c: In function 's2io_card_up':
   drivers/net/ethernet/neterion/s2io.c:6987:19: warning: '-RX' directive output may be truncated writing 3 bytes into a region of size between 0 and 17 [-Wformat-truncation=]
          "%s:MSI-X-%d-RX",
                      ^~~
   drivers/net/ethernet/neterion/s2io.c:6985:6: note: 'snprintf' output between 12 and 37 bytes into a destination of size 25
         snprintf(sp->desc[i],
         ^~~~~~~~~~~~~~~~~~~~~
          sizeof(sp->desc[i]),
          ~~~~~~~~~~~~~~~~~~~~
          "%s:MSI-X-%d-RX",
          ~~~~~~~~~~~~~~~~~
          dev->name, i);
          ~~~~~~~~~~~~~
   drivers/net/ethernet/neterion/s2io.c:6998:19: warning: '-TX' directive output may be truncated writing 3 bytes into a region of size between 0 and 17 [-Wformat-truncation=]
          "%s:MSI-X-%d-TX",
                      ^~~
   drivers/net/ethernet/neterion/s2io.c:6996:6: note: 'snprintf' output between 12 and 37 bytes into a destination of size 25
         snprintf(sp->desc[i],


vim +/do_spin_lock +4024 drivers/net/ethernet/neterion/s2io.c

^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4000  
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4001  /**
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4002   *  s2io_xmit - Tx entry point of te driver
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4003   *  @skb : the socket buffer containing the Tx data.
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4004   *  @dev : device pointer.
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4005   *  Description :
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4006   *  This function is the Tx entry point of the driver. S2IO NIC supports
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4007   *  certain protocol assist features on Tx side, namely  CSO, S/G, LSO.
25985edcedea63 drivers/net/s2io.c                   Lucas De Marchi                 2011-03-30  4008   *  NOTE: when device can't queue the pkt,just the trans_start variable will
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4009   *  not be upadted.
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4010   *  Return value:
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4011   *  0 on success & 1 on failure.
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4012   */
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4013  
61357325f37788 drivers/net/s2io.c                   Stephen Hemminger               2009-08-31  4014  static netdev_tx_t s2io_xmit(struct sk_buff *skb, struct net_device *dev)
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4015  {
4cf1653aa90c63 drivers/net/s2io.c                   Wang Chen                       2008-11-12  4016  	struct s2io_nic *sp = netdev_priv(dev);
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4017  	u16 frg_cnt, frg_len, i, queue, queue_len, put_off, get_off;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4018  	register u64 val64;
1ee6dd770b2302 drivers/net/s2io.c                   Ralf Baechle                    2007-01-31  4019  	struct TxD *txdp;
1ee6dd770b2302 drivers/net/s2io.c                   Ralf Baechle                    2007-01-31  4020  	struct TxFIFO_element __iomem *tx_fifo;
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4021  	unsigned long flags = 0;
be3a6b02eb68a4 drivers/net/s2io.c                   Koushik                         2005-08-03  4022  	u16 vlan_tag = 0;
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4023  	struct fifo_info *fifo = NULL;
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20 @4024  	int do_spin_lock = 1;
75c30b1368faaa drivers/net/s2io.c                   Ananda Raju                     2006-07-24  4025  	int offload_type;
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4026  	int enable_per_list_interrupt = 0;
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4027  	struct config_param *config = &sp->config;
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4028  	struct mac_info *mac_control = &sp->mac_control;
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4029  	struct stat_block *stats = mac_control->stats_info;
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4030  	struct swStat *swstats = &stats->sw_stat;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4031  
20346722ec4742 drivers/net/s2io.c                   Koushik                         2005-08-03  4032  	DBG_PRINT(TX_DBG, "%s: In Neterion Tx routine\n", dev->name);
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  4033  
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  4034  	if (unlikely(skb->len <= 0)) {
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  4035  		DBG_PRINT(TX_DBG, "%s: Buffer has no data..\n", dev->name);
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  4036  		dev_kfree_skb_any(skb);
6ed106549d1747 drivers/net/s2io.c                   Patrick McHardy                 2009-06-23  4037  		return NETDEV_TX_OK;
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  4038  	}
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  4039  
92b84437a6cddf drivers/net/s2io.c                   Sivakumar Subramani             2007-09-06  4040  	if (!is_s2io_card_up(sp)) {
20346722ec4742 drivers/net/s2io.c                   Koushik                         2005-08-03  4041  		DBG_PRINT(TX_DBG, "%s: Card going down for reset\n",
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4042  			  dev->name);
e6d26bd00c0d68 drivers/net/ethernet/neterion/s2io.c Eric W. Biederman               2014-03-15  4043  		dev_kfree_skb_any(skb);
6ed106549d1747 drivers/net/s2io.c                   Patrick McHardy                 2009-06-23  4044  		return NETDEV_TX_OK;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4045  	}
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4046  
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4047  	queue = 0;
df8a39defad46b drivers/net/ethernet/neterion/s2io.c Jiri Pirko                      2015-01-13  4048  	if (skb_vlan_tag_present(skb))
df8a39defad46b drivers/net/ethernet/neterion/s2io.c Jiri Pirko                      2015-01-13  4049  		vlan_tag = skb_vlan_tag_get(skb);
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4050  	if (sp->config.tx_steering_type == TX_DEFAULT_STEERING) {
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4051  		if (skb->protocol == htons(ETH_P_IP)) {
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4052  			struct iphdr *ip;
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4053  			struct tcphdr *th;
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4054  			ip = ip_hdr(skb);
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4055  
56f8a75c17abb8 drivers/net/s2io.c                   Paul Gortmaker                  2011-06-21  4056  			if (!ip_is_fragment(ip)) {
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4057  				th = (struct tcphdr *)(((unsigned char *)ip) +
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4058  						       ip->ihl*4);
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4059  
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4060  				if (ip->protocol == IPPROTO_TCP) {
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4061  					queue_len = sp->total_tcp_fifos;
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4062  					queue = (ntohs(th->source) +
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4063  						 ntohs(th->dest)) &
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4064  						sp->fifo_selector[queue_len - 1];
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4065  					if (queue >= queue_len)
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4066  						queue = queue_len - 1;
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4067  				} else if (ip->protocol == IPPROTO_UDP) {
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4068  					queue_len = sp->total_udp_fifos;
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4069  					queue = (ntohs(th->source) +
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4070  						 ntohs(th->dest)) &
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4071  						sp->fifo_selector[queue_len - 1];
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4072  					if (queue >= queue_len)
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4073  						queue = queue_len - 1;
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4074  					queue += sp->udp_fifo_idx;
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4075  					if (skb->len > 1024)
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4076  						enable_per_list_interrupt = 1;
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4077  					do_spin_lock = 0;
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4078  				}
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4079  			}
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4080  		}
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4081  	} else if (sp->config.tx_steering_type == TX_PRIORITY_STEERING)
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4082  		/* get fifo number based on skb->priority value */
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4083  		queue = config->fifo_mapping
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4084  			[skb->priority & (MAX_TX_FIFOS - 1)];
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4085  	fifo = &mac_control->fifos[queue];
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4086  
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4087  	spin_lock_irqsave(&fifo->tx_lock, flags);
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4088  
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4089  	if (sp->config.multiq) {
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4090  		if (__netif_subqueue_stopped(dev, fifo->fifo_no)) {
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4091  			spin_unlock_irqrestore(&fifo->tx_lock, flags);
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4092  			return NETDEV_TX_BUSY;
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4093  		}
b19fa1fa918452 drivers/net/s2io.c                   David S. Miller                 2008-07-08  4094  	} else if (unlikely(fifo->queue_state == FIFO_QUEUE_STOP)) {
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4095  		if (netif_queue_stopped(dev)) {
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4096  			spin_unlock_irqrestore(&fifo->tx_lock, flags);
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4097  			return NETDEV_TX_BUSY;
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4098  		}
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4099  	}
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4100  
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4101  	put_off = (u16)fifo->tx_curr_put_info.offset;
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4102  	get_off = (u16)fifo->tx_curr_get_info.offset;
43d620c82985b1 drivers/net/s2io.c                   Joe Perches                     2011-06-16  4103  	txdp = fifo->list_info[put_off].list_virt_addr;
20346722ec4742 drivers/net/s2io.c                   Koushik                         2005-08-03  4104  
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4105  	queue_len = fifo->tx_curr_put_info.fifo_len + 1;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4106  	/* Avoid "put" pointer going beyond "get" pointer */
863c11a91e4507 drivers/net/s2io.c                   Ananda Raju                     2006-04-21  4107  	if (txdp->Host_Control ||
863c11a91e4507 drivers/net/s2io.c                   Ananda Raju                     2006-04-21  4108  	    ((put_off+1) == queue_len ? 0 : (put_off+1)) == get_off) {
776bd20fa25fd8 drivers/net/s2io.c                   ravinandan.arakali@neterion.com 2005-09-06  4109  		DBG_PRINT(TX_DBG, "Error in xmit, No free TXDs.\n");
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4110  		s2io_stop_tx_queue(sp, fifo->fifo_no);
e6d26bd00c0d68 drivers/net/ethernet/neterion/s2io.c Eric W. Biederman               2014-03-15  4111  		dev_kfree_skb_any(skb);
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4112  		spin_unlock_irqrestore(&fifo->tx_lock, flags);
6ed106549d1747 drivers/net/s2io.c                   Patrick McHardy                 2009-06-23  4113  		return NETDEV_TX_OK;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4114  	}
0b1f7ebe455ba4 drivers/net/s2io.c                   Koushik                         2005-08-03  4115  
75c30b1368faaa drivers/net/s2io.c                   Ananda Raju                     2006-07-24  4116  	offload_type = s2io_offload_type(skb);
75c30b1368faaa drivers/net/s2io.c                   Ananda Raju                     2006-07-24  4117  	if (offload_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6)) {
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4118  		txdp->Control_1 |= TXD_TCP_LSO_EN;
75c30b1368faaa drivers/net/s2io.c                   Ananda Raju                     2006-07-24  4119  		txdp->Control_1 |= TXD_TCP_LSO_MSS(s2io_tcp_mss(skb));
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4120  	}
84fa7933a33f80 drivers/net/s2io.c                   Patrick McHardy                 2006-08-29  4121  	if (skb->ip_summed == CHECKSUM_PARTIAL) {
d44570e4067aa8 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4122  		txdp->Control_2 |= (TXD_TX_CKO_IPV4_EN |
d44570e4067aa8 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4123  				    TXD_TX_CKO_TCP_EN |
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4124  				    TXD_TX_CKO_UDP_EN);
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4125  	}
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4126  	txdp->Control_1 |= TXD_GATHER_CODE_FIRST;
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4127  	txdp->Control_1 |= TXD_LIST_OWN_XENA;
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4128  	txdp->Control_2 |= TXD_INT_NUMBER(fifo->fifo_no);
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4129  	if (enable_per_list_interrupt)
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4130  		if (put_off & (queue_len >> 5))
6cfc482b4b1c51 drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4131  			txdp->Control_2 |= TXD_INT_TYPE_PER_LIST;
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4132  	if (vlan_tag) {
be3a6b02eb68a4 drivers/net/s2io.c                   Koushik                         2005-08-03  4133  		txdp->Control_2 |= TXD_VLAN_ENABLE;
be3a6b02eb68a4 drivers/net/s2io.c                   Koushik                         2005-08-03  4134  		txdp->Control_2 |= TXD_VLAN_TAG(vlan_tag);
be3a6b02eb68a4 drivers/net/s2io.c                   Koushik                         2005-08-03  4135  	}
be3a6b02eb68a4 drivers/net/s2io.c                   Koushik                         2005-08-03  4136  
e743d31312d009 drivers/net/s2io.c                   Eric Dumazet                    2010-04-14  4137  	frg_len = skb_headlen(skb);
75c30b1368faaa drivers/net/s2io.c                   Ananda Raju                     2006-07-24  4138  	if (offload_type == SKB_GSO_UDP) {
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4139  		int ufo_size;
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4140  
75c30b1368faaa drivers/net/s2io.c                   Ananda Raju                     2006-07-24  4141  		ufo_size = s2io_udp_mss(skb);
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4142  		ufo_size &= ~7;
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4143  		txdp->Control_1 |= TXD_UFO_EN;
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4144  		txdp->Control_1 |= TXD_UFO_MSS(ufo_size);
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4145  		txdp->Control_1 |= TXD_BUFFER0_SIZE(8);
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4146  #ifdef __BIG_ENDIAN
3459feb8fc0e2a drivers/net/s2io.c                   Al Viro                         2008-03-16  4147  		/* both variants do cpu_to_be64(be32_to_cpu(...)) */
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4148  		fifo->ufo_in_band_v[put_off] =
3459feb8fc0e2a drivers/net/s2io.c                   Al Viro                         2008-03-16  4149  			(__force u64)skb_shinfo(skb)->ip6_frag_id;
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4150  #else
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4151  		fifo->ufo_in_band_v[put_off] =
3459feb8fc0e2a drivers/net/s2io.c                   Al Viro                         2008-03-16  4152  			(__force u64)skb_shinfo(skb)->ip6_frag_id << 32;
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4153  #endif
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4154  		txdp->Host_Control = (unsigned long)fifo->ufo_in_band_v;
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4155  		txdp->Buffer_Pointer = pci_map_single(sp->pdev,
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4156  						      fifo->ufo_in_band_v,
d44570e4067aa8 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4157  						      sizeof(u64),
d44570e4067aa8 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4158  						      PCI_DMA_TODEVICE);
8d8bb39b9eba32 drivers/net/s2io.c                   FUJITA Tomonori                 2008-07-25  4159  		if (pci_dma_mapping_error(sp->pdev, txdp->Buffer_Pointer))
491abf2537a01b drivers/net/s2io.c                   Veena Parat                     2007-07-23  4160  			goto pci_map_failed;
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4161  		txdp++;
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4162  	}
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4163  
d44570e4067aa8 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4164  	txdp->Buffer_Pointer = pci_map_single(sp->pdev, skb->data,
d44570e4067aa8 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4165  					      frg_len, PCI_DMA_TODEVICE);
8d8bb39b9eba32 drivers/net/s2io.c                   FUJITA Tomonori                 2008-07-25  4166  	if (pci_dma_mapping_error(sp->pdev, txdp->Buffer_Pointer))
491abf2537a01b drivers/net/s2io.c                   Veena Parat                     2007-07-23  4167  		goto pci_map_failed;
491abf2537a01b drivers/net/s2io.c                   Veena Parat                     2007-07-23  4168  
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4169  	txdp->Host_Control = (unsigned long)skb;
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4170  	txdp->Control_1 |= TXD_BUFFER0_SIZE(frg_len);
75c30b1368faaa drivers/net/s2io.c                   Ananda Raju                     2006-07-24  4171  	if (offload_type == SKB_GSO_UDP)
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4172  		txdp->Control_1 |= TXD_UFO_EN;
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4173  
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4174  	frg_cnt = skb_shinfo(skb)->nr_frags;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4175  	/* For fragmented SKB. */
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4176  	for (i = 0; i < frg_cnt; i++) {
9e903e085262ff drivers/net/ethernet/neterion/s2io.c Eric Dumazet                    2011-10-18  4177  		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
0b1f7ebe455ba4 drivers/net/s2io.c                   Koushik                         2005-08-03  4178  		/* A '0' length fragment will be ignored */
9e903e085262ff drivers/net/ethernet/neterion/s2io.c Eric Dumazet                    2011-10-18  4179  		if (!skb_frag_size(frag))
0b1f7ebe455ba4 drivers/net/s2io.c                   Koushik                         2005-08-03  4180  			continue;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4181  		txdp++;
f0d06d82f7ab82 drivers/net/ethernet/neterion/s2io.c Ian Campbell                    2011-09-21  4182  		txdp->Buffer_Pointer = (u64)skb_frag_dma_map(&sp->pdev->dev,
f0d06d82f7ab82 drivers/net/ethernet/neterion/s2io.c Ian Campbell                    2011-09-21  4183  							     frag, 0,
9e903e085262ff drivers/net/ethernet/neterion/s2io.c Eric Dumazet                    2011-10-18  4184  							     skb_frag_size(frag),
5d6bcdfe38ce88 drivers/net/ethernet/neterion/s2io.c Ian Campbell                    2011-10-06  4185  							     DMA_TO_DEVICE);
9e903e085262ff drivers/net/ethernet/neterion/s2io.c Eric Dumazet                    2011-10-18  4186  		txdp->Control_1 = TXD_BUFFER0_SIZE(skb_frag_size(frag));
75c30b1368faaa drivers/net/s2io.c                   Ananda Raju                     2006-07-24  4187  		if (offload_type == SKB_GSO_UDP)
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4188  			txdp->Control_1 |= TXD_UFO_EN;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4189  	}
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4190  	txdp->Control_1 |= TXD_GATHER_CODE_LAST;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4191  
75c30b1368faaa drivers/net/s2io.c                   Ananda Raju                     2006-07-24  4192  	if (offload_type == SKB_GSO_UDP)
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4193  		frg_cnt++; /* as Txd0 was used for inband header */
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4194  
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4195  	tx_fifo = mac_control->tx_FIFO_start[queue];
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4196  	val64 = fifo->list_info[put_off].list_phy_addr;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4197  	writeq(val64, &tx_fifo->TxDL_Pointer);
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4198  
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4199  	val64 = (TX_FIFO_LAST_TXD_NUM(frg_cnt) | TX_FIFO_FIRST_LIST |
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4200  		 TX_FIFO_LAST_LIST);
75c30b1368faaa drivers/net/s2io.c                   Ananda Raju                     2006-07-24  4201  	if (offload_type)
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  4202  		val64 |= TX_FIFO_SPECIAL_FUNC;
75c30b1368faaa drivers/net/s2io.c                   Ananda Raju                     2006-07-24  4203  
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4204  	writeq(val64, &tx_fifo->List_Control);
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4205  
303bcb4b675d72 drivers/net/s2io.c                   Koushik                         2005-08-03  4206  	mmiowb();
303bcb4b675d72 drivers/net/s2io.c                   Koushik                         2005-08-03  4207  
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4208  	put_off++;
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4209  	if (put_off == fifo->tx_curr_put_info.fifo_len + 1)
863c11a91e4507 drivers/net/s2io.c                   Ananda Raju                     2006-04-21  4210  		put_off = 0;
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4211  	fifo->tx_curr_put_info.offset = put_off;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4212  
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4213  	/* Avoid "put" pointer going beyond "get" pointer */
863c11a91e4507 drivers/net/s2io.c                   Ananda Raju                     2006-04-21  4214  	if (((put_off+1) == queue_len ? 0 : (put_off+1)) == get_off) {
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4215  		swstats->fifo_full_cnt++;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4216  		DBG_PRINT(TX_DBG,
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4217  			  "No free TxDs for xmit, Put: 0x%x Get:0x%x\n",
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4218  			  put_off, get_off);
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4219  		s2io_stop_tx_queue(sp, fifo->fifo_no);
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4220  	}
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4221  	swstats->mem_allocated += skb->truesize;
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4222  	spin_unlock_irqrestore(&fifo->tx_lock, flags);
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4223  
f6f4bfa3561a2d drivers/net/s2io.c                   Sreenivasa Honnur               2008-03-25  4224  	if (sp->config.intr_type == MSI_X)
f6f4bfa3561a2d drivers/net/s2io.c                   Sreenivasa Honnur               2008-03-25  4225  		tx_intr_handler(fifo);
f6f4bfa3561a2d drivers/net/s2io.c                   Sreenivasa Honnur               2008-03-25  4226  
6ed106549d1747 drivers/net/s2io.c                   Patrick McHardy                 2009-06-23  4227  	return NETDEV_TX_OK;
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4228  
491abf2537a01b drivers/net/s2io.c                   Veena Parat                     2007-07-23  4229  pci_map_failed:
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4230  	swstats->pci_map_fail_cnt++;
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  4231  	s2io_stop_tx_queue(sp, fifo->fifo_no);
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  4232  	swstats->mem_freed += skb->truesize;
e6d26bd00c0d68 drivers/net/ethernet/neterion/s2io.c Eric W. Biederman               2014-03-15  4233  	dev_kfree_skb_any(skb);
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  4234  	spin_unlock_irqrestore(&fifo->tx_lock, flags);
6ed106549d1747 drivers/net/s2io.c                   Patrick McHardy                 2009-06-23  4235  	return NETDEV_TX_OK;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4236  }
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  4237  

:::::: The code at line 4024 was first introduced by commit
:::::: 6cfc482b4b1c512d81712eba41fa324b24e5e7b2 S2io: Multiqueue network device support - FIFO selection based on L4 ports

:::::: TO: Sreenivasa Honnur <Sreenivasa.Honnur@neterion.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
