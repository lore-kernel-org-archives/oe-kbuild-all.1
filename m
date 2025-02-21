Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8138E35979
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 07:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740121971; cv=none; b=QeINvL1JFO3mBymNuVRtdTUDnPKG9hFL76CWjD1gcGsw+Jxqfmg5anrSpRf2ja6qM/99pu0JdwO6Dz31DTNUu3O8x56V4tDeoxbxCwdfZWDKCVW6tP3sTRqJnz/Y2tOZvYVuFPtujiSeac2AvkbMXlWVvf21vDPrpBJm+QPW/3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740121971; c=relaxed/simple;
	bh=UN2iUnEbOyTbv+z/IQOcExyrMUiIvg5qUKrPtGkR+ns=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X+9sK6zG8IogszCydF0pneMIDt2IrmbbpcqGlA+e5ME+gsrc4Y6JG9oT07zG3Avxy5FeiGC5lgfs3Akfg3ywYniY6TL2HfBUDtnsiy6D/niGgnvd+bZWz/Bqi4AG8pUfXtWK07VCDqSRZR+zkhznAzM2QIiwm855HNeHK/+FsO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6W+pBYe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6W+pBYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740121970; x=1771657970;
  h=date:from:cc:subject:message-id:mime-version;
  bh=UN2iUnEbOyTbv+z/IQOcExyrMUiIvg5qUKrPtGkR+ns=;
  b=X6W+pBYeeGEcUWMYfD1Wk35dfW+apVwoRsxFBr++uwsGje/nhbjC4uU+
   oKUAlJrRhB0kkxroi4oka5PgkUNfnbkop9v0dHmIAWuMXXKGWBLI413N4
   o+8B00NqtbpktU1/MtmpzJIbZmPN2NVGs99KeNU2DjTUc5mW1l9Bv98MZ
   PI36a0qP8SWQqraOY0nn7v9IH1CFCV6Z6A4T31MV7UUPd/T+CSSvUQ2Gg
   R/lYBPmD+5rgUkoGfEc7WsszRR+DsSByDxsAQ9+aT4MvaLZHpABHj7nKD
   Lqtfnr29iycXFTRkyrdSVFlfHmwbplF+XN3qv+NMs5pn9uLOMFi1Nbma0
   g==;
X-CSE-ConnectionGUID: MBd3S8TsQuK6pbxgfscFgw==
X-CSE-MsgGUID: Dd9gHdWsQe66cBvhR5jdXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41137776"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41137776"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 23:12:46 -0800
X-CSE-ConnectionGUID: AuehNcmaQ+e+diYZYJ2MpA==
X-CSE-MsgGUID: o2zQe28aS6it1432TssbTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115009230"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Feb 2025 23:12:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlNDH-0005Dr-0d
	for oe-kbuild-all@lists.linux.dev;
	Fri, 21 Feb 2025 07:12:43 +0000
Date: Fri, 21 Feb 2025 15:12:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1]
 drivers/net/ethernet/hisilicon/hns/hns_ethtool.c:309:7: warning: this
 statement may fall through
Message-ID: <202502211515.UVZCsumx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 67cd9a997f1bfb5dedf407ad540232912bd04b10 [1/1] net: hns: Use phy_driver to setup Phy loopback
config: xtensa-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250221/202502211515.UVZCsumx-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211515.UVZCsumx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211515.UVZCsumx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from include/linux/skbuff.h:17,
                    from include/linux/if_ether.h:23,
                    from include/linux/etherdevice.h:25,
                    from drivers/net/ethernet/hisilicon/hns/hns_ethtool.c:10:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:179:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/dma-mapping.h:308:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:308:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   drivers/net/ethernet/hisilicon/hns/hns_ethtool.c: In function '__lb_setup':
>> drivers/net/ethernet/hisilicon/hns/hns_ethtool.c:309:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
      ret = hns_nic_config_phy_loopback(phy_dev, 0x0);
      ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns/hns_ethtool.c:310:2: note: here
     case MAC_LOOP_NONE:
     ^~~~
   In file included from include/linux/string.h:18:0,
                    from include/linux/bitmap.h:8,
                    from include/linux/cpumask.h:11,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:4,
                    from include/linux/kmemcheck.h:4,
                    from include/linux/skbuff.h:18,
                    from include/linux/if_ether.h:23,
                    from include/linux/etherdevice.h:25,
                    from drivers/net/ethernet/hisilicon/hns/hns_ethtool.c:10:
   drivers/net/ethernet/hisilicon/hns/hns_ethtool.c: In function 'hns_nic_get_drvinfo':
   arch/xtensa/include/asm/string.h:56:42: warning: array subscript is above array bounds [-Warray-bounds]
      : "0" (__dest), "1" (__src), "r" (__src+__n)
                                        ~~~~~^~~~
   arch/xtensa/include/asm/string.h:56:42: warning: array subscript is above array bounds [-Warray-bounds]
      : "0" (__dest), "1" (__src), "r" (__src+__n)
                                        ~~~~~^~~~
   arch/xtensa/include/asm/string.h:56:42: warning: array subscript is above array bounds [-Warray-bounds]
      : "0" (__dest), "1" (__src), "r" (__src+__n)
                                        ~~~~~^~~~


vim +309 drivers/net/ethernet/hisilicon/hns/hns_ethtool.c

   284	
   285	static int __lb_setup(struct net_device *ndev,
   286			      enum hnae_loop loop)
   287	{
   288		int ret = 0;
   289		struct hns_nic_priv *priv = netdev_priv(ndev);
   290		struct phy_device *phy_dev = ndev->phydev;
   291		struct hnae_handle *h = priv->ae_handle;
   292	
   293		switch (loop) {
   294		case MAC_INTERNALLOOP_PHY:
   295			ret = hns_nic_config_phy_loopback(phy_dev, 0x1);
   296			if (!ret)
   297				ret = h->dev->ops->set_loopback(h, loop, 0x1);
   298			break;
   299		case MAC_INTERNALLOOP_MAC:
   300			if ((h->dev->ops->set_loopback) &&
   301			    (priv->ae_handle->phy_if != PHY_INTERFACE_MODE_XGMII))
   302				ret = h->dev->ops->set_loopback(h, loop, 0x1);
   303			break;
   304		case MAC_INTERNALLOOP_SERDES:
   305			if (h->dev->ops->set_loopback)
   306				ret = h->dev->ops->set_loopback(h, loop, 0x1);
   307			break;
   308		case MAC_LOOP_PHY_NONE:
 > 309			ret = hns_nic_config_phy_loopback(phy_dev, 0x0);
   310		case MAC_LOOP_NONE:
   311			if (!ret && h->dev->ops->set_loopback) {
   312				if (priv->ae_handle->phy_if != PHY_INTERFACE_MODE_XGMII)
   313					ret = h->dev->ops->set_loopback(h,
   314						MAC_INTERNALLOOP_MAC, 0x0);
   315	
   316				if (!ret)
   317					ret = h->dev->ops->set_loopback(h,
   318						MAC_INTERNALLOOP_SERDES, 0x0);
   319			}
   320			break;
   321		default:
   322			ret = -EINVAL;
   323			break;
   324		}
   325	
   326		if (!ret) {
   327			if (loop == MAC_LOOP_NONE)
   328				h->dev->ops->set_promisc_mode(
   329					h, ndev->flags & IFF_PROMISC);
   330			else
   331				h->dev->ops->set_promisc_mode(h, 1);
   332		}
   333		return ret;
   334	}
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
