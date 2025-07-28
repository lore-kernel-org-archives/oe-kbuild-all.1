Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C522274FCD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 19:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753730376; cv=none; b=kCBsvJHd5JPz91vFTnzoMfbuKdfD6FGm0X7WMH4PrVjo8gytfOrfxGHHTwqzNwuD+E2eZJV4q+JRlU8SJGuC2ZXVaXdN5VkWkDSi0ItEN06/yTWflalr20BJbFQYBRKxY231hAkHokISATvCqhvNOzGjSaOiK97XxDPjqJeuWJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753730376; c=relaxed/simple;
	bh=RY9uX40v8YjJeVWG2LhePYVbNBqYlHq9G50lbF5Aodw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mMG6/b/TLJos+6yqfh6IVJZnBTjvJ6C+iQDn1kDmqFqGL4J0nFZJIjSMryj8IXbMoMDmemM05L7H2tQ2egUOA8g0/66YVAAY+J2ZfLPNMd82DTqZlSa+vy76P9G5Zp3ja7Y1RLONjN4sfW29bcCA76dMHyvfFC4SwKEOLZ0ciWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ME/Xzsnd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ME/Xzsnd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753730373; x=1785266373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RY9uX40v8YjJeVWG2LhePYVbNBqYlHq9G50lbF5Aodw=;
  b=ME/XzsndveUG2h0zFHGZJWTzEe9w094cwbt6+abGI6Tx8mdp4zD9eW4l
   N300FfbUIdlmMTVTSsgUaO2bmFs7+Wo7ouUDZmsivnkgiMJinbThQoS4v
   b1zi5ATgZdmzKdeWH4Ll4xur2tO4kqOcNZ6+qjRrSifpUEkOqKe32PR7A
   aJNR5mP2I0eN1JbkojB5XIt/iJ9hfcdmUDiWBu8r8gvHNsUmDUoyQyLZB
   zeWdgGQjwmnM1r1dOvPjt1elg/tze3+gawdp4jx3lF7Hqw8lmbEugMnTN
   1JKnWpcQQlvKWhMOiYe5OIKqcWCFU3FaSZkmzyZxKQxidseoS6UwPz1So
   Q==;
X-CSE-ConnectionGUID: hQ6okL/ISpWHYvdfEZT31Q==
X-CSE-MsgGUID: AYGSqGlGRX6nT1okZWmi+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66555763"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66555763"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 12:19:32 -0700
X-CSE-ConnectionGUID: Pm3TzlZ2To+Hi66/Bzz6+w==
X-CSE-MsgGUID: NJMHWRr+RpGBY+aGx3/srA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162072886"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jul 2025 12:19:31 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugTNh-0000hd-0M;
	Mon, 28 Jul 2025 19:19:29 +0000
Date: Tue, 29 Jul 2025 03:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Horman <horms@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [tnguy-next-queue:40GbE 15/68]
 drivers/net/ethernet/marvell/octeontx2/af/cgx.c:1737:49: warning: '%u'
 directive writing between 1 and 10 bytes into a region of size between 4 and
 6
Message-ID: <202507290300.efFE06Rg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Simon,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git 40GbE
head:   fa582ca7e187a15e772e6a72fe035f649b387a60
commit: 9312ee76490df61491fee19b5ce71f71b6de908c [15/68] octeontx2-af: use unsigned int as iterator for unsigned values
config: arm64-randconfig-004-20250729 (https://download.01.org/0day-ci/archive/20250729/202507290300.efFE06Rg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507290300.efFE06Rg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507290300.efFE06Rg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/marvell/octeontx2/af/cgx.c: In function 'cgx_lmac_init':
>> drivers/net/ethernet/marvell/octeontx2/af/cgx.c:1737:49: warning: '%u' directive writing between 1 and 10 bytes into a region of size between 4 and 6 [-Wformat-overflow=]
    1737 |                 sprintf(lmac->name, "cgx_fwi_%u_%u", cgx->cgx_id, i);
         |                                                 ^~
   drivers/net/ethernet/marvell/octeontx2/af/cgx.c:1737:37: note: directive argument in the range [0, 4294967294]
    1737 |                 sprintf(lmac->name, "cgx_fwi_%u_%u", cgx->cgx_id, i);
         |                                     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/af/cgx.c:1737:17: note: 'sprintf' output between 12 and 23 bytes into a destination of size 16
    1737 |                 sprintf(lmac->name, "cgx_fwi_%u_%u", cgx->cgx_id, i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1737 drivers/net/ethernet/marvell/octeontx2/af/cgx.c

  1704	
  1705	static int cgx_lmac_init(struct cgx *cgx)
  1706	{
  1707		u8 max_dmac_filters;
  1708		struct lmac *lmac;
  1709		int err, filter;
  1710		unsigned int i;
  1711		u64 lmac_list;
  1712	
  1713		/* lmac_list specifies which lmacs are enabled
  1714		 * when bit n is set to 1, LMAC[n] is enabled
  1715		 */
  1716		if (cgx->mac_ops->non_contiguous_serdes_lane) {
  1717			if (is_dev_rpm2(cgx))
  1718				lmac_list =
  1719					cgx_read(cgx, 0, RPM2_CMRX_RX_LMACS) & 0xFFULL;
  1720			else
  1721				lmac_list =
  1722					cgx_read(cgx, 0, CGXX_CMRX_RX_LMACS) & 0xFULL;
  1723		}
  1724	
  1725		if (cgx->lmac_count > cgx->max_lmac_per_mac)
  1726			cgx->lmac_count = cgx->max_lmac_per_mac;
  1727	
  1728		for (i = 0; i < cgx->lmac_count; i++) {
  1729			lmac = kzalloc(sizeof(struct lmac), GFP_KERNEL);
  1730			if (!lmac)
  1731				return -ENOMEM;
  1732			lmac->name = kcalloc(1, sizeof("cgx_fwi_xxx_yyy"), GFP_KERNEL);
  1733			if (!lmac->name) {
  1734				err = -ENOMEM;
  1735				goto err_lmac_free;
  1736			}
> 1737			sprintf(lmac->name, "cgx_fwi_%u_%u", cgx->cgx_id, i);
  1738			if (cgx->mac_ops->non_contiguous_serdes_lane) {
  1739				lmac->lmac_id = __ffs64(lmac_list);
  1740				lmac_list   &= ~BIT_ULL(lmac->lmac_id);
  1741			} else {
  1742				lmac->lmac_id = i;
  1743			}
  1744	
  1745			lmac->cgx = cgx;
  1746			lmac->mac_to_index_bmap.max =
  1747					cgx->mac_ops->dmac_filter_count /
  1748					cgx->lmac_count;
  1749	
  1750			max_dmac_filters = lmac->mac_to_index_bmap.max;
  1751	
  1752			err = rvu_alloc_bitmap(&lmac->mac_to_index_bmap);
  1753			if (err)
  1754				goto err_name_free;
  1755	
  1756			/* Reserve first entry for default MAC address */
  1757			set_bit(0, lmac->mac_to_index_bmap.bmap);
  1758	
  1759			lmac->rx_fc_pfvf_bmap.max = 128;
  1760			err = rvu_alloc_bitmap(&lmac->rx_fc_pfvf_bmap);
  1761			if (err)
  1762				goto err_dmac_bmap_free;
  1763	
  1764			lmac->tx_fc_pfvf_bmap.max = 128;
  1765			err = rvu_alloc_bitmap(&lmac->tx_fc_pfvf_bmap);
  1766			if (err)
  1767				goto err_rx_fc_bmap_free;
  1768	
  1769			init_waitqueue_head(&lmac->wq_cmd_cmplt);
  1770			mutex_init(&lmac->cmd_lock);
  1771			spin_lock_init(&lmac->event_cb_lock);
  1772			err = cgx_configure_interrupt(cgx, lmac, lmac->lmac_id, false);
  1773			if (err)
  1774				goto err_bitmap_free;
  1775	
  1776			/* Add reference */
  1777			cgx->lmac_idmap[lmac->lmac_id] = lmac;
  1778			set_bit(lmac->lmac_id, &cgx->lmac_bmap);
  1779			cgx->mac_ops->mac_pause_frm_config(cgx, lmac->lmac_id, true);
  1780			lmac->lmac_type = cgx->mac_ops->get_lmac_type(cgx, lmac->lmac_id);
  1781	
  1782			/* Disable stale DMAC filters for sane state */
  1783			for (filter = 0; filter < max_dmac_filters; filter++)
  1784				cgx_lmac_addr_del(cgx->cgx_id, lmac->lmac_id, filter);
  1785	
  1786			/* As cgx_lmac_addr_del does not clear entry for index 0
  1787			 * so it needs to be done explicitly
  1788			 */
  1789			cgx_lmac_addr_reset(cgx->cgx_id, lmac->lmac_id);
  1790		}
  1791	
  1792		/* Start X2P reset on given MAC block */
  1793		cgx->mac_ops->mac_x2p_reset(cgx, true);
  1794		return cgx_lmac_verify_fwi_version(cgx);
  1795	
  1796	err_bitmap_free:
  1797		rvu_free_bitmap(&lmac->tx_fc_pfvf_bmap);
  1798	err_rx_fc_bmap_free:
  1799		rvu_free_bitmap(&lmac->rx_fc_pfvf_bmap);
  1800	err_dmac_bmap_free:
  1801		rvu_free_bitmap(&lmac->mac_to_index_bmap);
  1802	err_name_free:
  1803		kfree(lmac->name);
  1804	err_lmac_free:
  1805		kfree(lmac);
  1806		return err;
  1807	}
  1808	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
