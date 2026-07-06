Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA739B960
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 07:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783323409; cv=none; b=KSIO0pGaZHxpO+pyTJM5+nwiAVoJ8rIDYS/TyHLwFuJWLNnRuqXg8QbxRkBhGm2NVRFGHASDYHc1/YLwNG+x28sBoXXHYphvMVxeDkPpEq28GWwJcB9DzNGE+sXh5WdrLv4u3i9+rJoJm73zkfQf9t9FOc2WN+oXuaMb+hTe3+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783323409; c=relaxed/simple;
	bh=O0D7MNW6Hxd87/blkfa2t9iIk6grCt12Lw9lS/7gg5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T5k04D/NNYptfFEnUQn589IkhuCD1i3LCbfIwQoFsTNMnQlGahBgVYksujKmzgQimOxPIYVjIO1u45BaJpWIEyV0xoQzkPssaPHnODQuc0oH0f6diuVztSMirPYRHllWWmuGh+iD+pWfuTAHHtBL2yn9ySvn9kamV1k9NjcEDV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ey1bxYTk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ey1bxYTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783323401; x=1814859401;
  h=date:from:to:cc:subject:message-id;
  bh=O0D7MNW6Hxd87/blkfa2t9iIk6grCt12Lw9lS/7gg5M=;
  b=ey1bxYTk00A3LMinXWqvg0vDpVdXvDlKDo6ZjdGxuzdYchwC/xLIzYq4
   8VFCMKC6Ds/5SOYHAsanoMlwcaLnbmdy0Sz8xGcX5fzJW2N5ADiTe0aFa
   1j1s50X89Qox6v3ZogpaMR6f1Bk4c/ph3K0NMLjTpPrVtuYJZonsMEXFt
   OEwT4NqSGz3vAGhw6qPIFEjsvJMb7YeHYeUOYD5qBo5JBJ7UHaZe2QQMW
   gXYZn/X6adbEEwlXPj4K8mwl6ktO5NGIBWgbAhnSXNj2lUUQlp3CVwH4A
   LVm5UGgQM9f08X1B7V7sxWyXIwHH7XzIXhWUFX6WpPb4QcvWa8k8MHR5G
   g==;
X-CSE-ConnectionGUID: nOA4mK0ES8W5hTph/VhcLQ==
X-CSE-MsgGUID: 4vPyFkZaT6CXGxTp+c2FwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="87862507"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="87862507"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 00:36:35 -0700
X-CSE-ConnectionGUID: U7kSlhLAS9WTt5Jds9N5JQ==
X-CSE-MsgGUID: khh3eqgOTB2Ep8S7lra7Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="255579828"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jul 2026 00:36:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgdsU-00000000EAn-35ku;
	Mon, 06 Jul 2026 07:36:30 +0000
Date: Mon, 06 Jul 2026 15:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Horman <horms@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: drivers/net/ethernet/marvell/octeontx2/af/cgx.c:1737:35:
 warning: '%u' directive writing between 1 and 10 bytes into a region of size
 between 4 and 6
Message-ID: <202607061500.eBEhGOd4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Simon,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cdeaa50eae8dad34885515f62559ee83e7e8dda
commit: 9312ee76490df61491fee19b5ce71f71b6de908c octeontx2-af: use unsigned int as iterator for unsigned values
date:   12 months ago
config: sparc64-randconfig-r052-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061500.eBEhGOd4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061500.eBEhGOd4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9312ee76490d ("octeontx2-af: use unsigned int as iterator for unsigned values")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061500.eBEhGOd4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/marvell/octeontx2/af/cgx.c: In function 'cgx_lmac_init':
>> drivers/net/ethernet/marvell/octeontx2/af/cgx.c:1737:35: warning: '%u' directive writing between 1 and 10 bytes into a region of size between 4 and 6 [-Wformat-overflow=]
    1737 |   sprintf(lmac->name, "cgx_fwi_%u_%u", cgx->cgx_id, i);
         |                                   ^~
   drivers/net/ethernet/marvell/octeontx2/af/cgx.c:1737:23: note: directive argument in the range [0, 4294967294]
    1737 |   sprintf(lmac->name, "cgx_fwi_%u_%u", cgx->cgx_id, i);
         |                       ^~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/af/cgx.c:1737:3: note: 'sprintf' output between 12 and 23 bytes into a destination of size 16
    1737 |   sprintf(lmac->name, "cgx_fwi_%u_%u", cgx->cgx_id, i);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
