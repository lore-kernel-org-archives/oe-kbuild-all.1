Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25FD10A16
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714813165; cv=none; b=TQ4HMp+ClRco6JN7pQlylzgCl4M2GOwFXZnl/4HtB86VUMGucWC2Isvk42PIDWQEf8mikUXekwdt97GNvpGqJBMk134xJwPswhqLg2tc/7i+usFzncKlDfLGHdj8/XsyKElspJ4L9DLdpPaf9k5Zau1HXGqqSbY465QtCl5U/ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714813165; c=relaxed/simple;
	bh=1hg68Ek3f4X+T2LC0S3OJA9TuecUtPLqu7zud8HKGwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3Z9kYvz/lUKEV0jTci6f4ZJDHSEbvfypo/N1Secvlu9ihFC90O/PmXz/3gnqvxVJsPMIg6YhxfM7z7rJ8+2yjNbYKIsFjvVVPHCUEZSEoEM6d3cerUQeN4uMu6bGCFc2q2mqnwT47RvxJvi6npONwZGRRT3ozdaN0iOpdN9PiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+nNCMpz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+nNCMpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714813164; x=1746349164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1hg68Ek3f4X+T2LC0S3OJA9TuecUtPLqu7zud8HKGwU=;
  b=R+nNCMpzuiPu2oitVrIoLXIVKorUmBPDp3jKbfHnwcO4yJWMQxRQaoZ/
   o5Kph1Vop+Hvtr6Jl4G2tbj6v98CbTdUZ3ZoAQ28UNdT84T2c1yopSbCa
   j3hCNtzxYGsyelL+3IceVo+Ru9YrV+QFTfY3I2Xwe7F4ycUi2pQrUC4QE
   iFAe+xuHIOZc7WulXik2L7oh3gEACs6VFmzgCDCnwYzRkypJ7CJtAG1Qr
   Hw32+PeQNvZ+LPNkQ2zsBMHZgYUEQuxNpvQvaj1kFKCbvMH8sUxwn0+MB
   9m9SE2Ld7ZqUhgE/cGU4gtg9WzMdVyjJJPMuP8oC12S5RShVYtlbyApAz
   w==;
X-CSE-ConnectionGUID: SxhbDAElQqydXFsJMVYpWA==
X-CSE-MsgGUID: QvyNPpddQXOK1x8yZy6exg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="11155811"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="11155811"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 01:59:23 -0700
X-CSE-ConnectionGUID: OCJ/60viSjWyrwPhStHskg==
X-CSE-MsgGUID: 4gxgnCfaRsmxxA1EsK4CtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="32283929"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 May 2024 01:59:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3BEl-000Cam-2k;
	Sat, 04 May 2024 08:59:19 +0000
Date: Sat, 4 May 2024 16:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 15/45]
 drivers/net/ethernet/mediatek/mtk_wed.c:649:29: error: invalid use of
 undefined type 'struct mtk_wed_bm_desc'
Message-ID: <202405041621.FgmxNVXC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   ba7101f72dd4f7ecfae7894a8aba538755b2b1d8
commit: 4a2c5d6cda741d39969d69a65d6816e05a0b830e [15/45] UPSTREAM: net: ethernet: mtk_wed: introduce hw_rro support for MT7988
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405041621.FgmxNVXC-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041621.FgmxNVXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041621.FgmxNVXC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_wed.c:88:37: error: invalid application of 'sizeof' to incomplete type 'struct mtk_wed_bm_desc'
      88 |         .tx_ring_desc_size = sizeof(struct mtk_wed_bm_desc),
         |                                     ^~~~~~
   drivers/net/ethernet/mediatek/mtk_wed.c: In function 'mtk_wed_hwrro_buffer_alloc':
   drivers/net/ethernet/mediatek/mtk_wed.c:618:61: error: invalid application of 'sizeof' to incomplete type 'struct mtk_wed_bm_desc'
     618 |                                   dev->wlan.rx_nbuf * sizeof(*desc),
         |                                                             ^
>> drivers/net/ethernet/mediatek/mtk_wed.c:649:29: error: invalid use of undefined type 'struct mtk_wed_bm_desc'
     649 |                         desc->buf0 = cpu_to_le32(buf_phys);
         |                             ^~
>> drivers/net/ethernet/mediatek/mtk_wed.c:651:29: error: increment of pointer to an incomplete type 'struct mtk_wed_bm_desc'
     651 |                         desc++;
         |                             ^~
   drivers/net/ethernet/mediatek/mtk_wed.c: In function 'mtk_wed_hwrro_free_buffer':
   drivers/net/ethernet/mediatek/mtk_wed.c:709:66: error: invalid application of 'sizeof' to incomplete type 'struct mtk_wed_bm_desc'
     709 |         dma_free_coherent(dev->hw->dev, dev->hw_rro.size * sizeof(*desc),
         |                                                                  ^


vim +649 drivers/net/ethernet/mediatek/mtk_wed.c

   598	
   599	static int
   600	mtk_wed_hwrro_buffer_alloc(struct mtk_wed_device *dev)
   601	{
   602		int n_pages = MTK_WED_RX_PG_BM_CNT / MTK_WED_RX_BUF_PER_PAGE;
   603		struct mtk_wed_buf *page_list;
   604		struct mtk_wed_bm_desc *desc;
   605		dma_addr_t desc_phys;
   606		int i, page_idx = 0;
   607	
   608		if (!dev->wlan.hw_rro)
   609			return 0;
   610	
   611		page_list = kcalloc(n_pages, sizeof(*page_list), GFP_KERNEL);
   612		if (!page_list)
   613			return -ENOMEM;
   614	
   615		dev->hw_rro.size = dev->wlan.rx_nbuf & ~(MTK_WED_BUF_PER_PAGE - 1);
   616		dev->hw_rro.pages = page_list;
   617		desc = dma_alloc_coherent(dev->hw->dev,
   618					  dev->wlan.rx_nbuf * sizeof(*desc),
   619					  &desc_phys, GFP_KERNEL);
   620		if (!desc)
   621			return -ENOMEM;
   622	
   623		dev->hw_rro.desc = desc;
   624		dev->hw_rro.desc_phys = desc_phys;
   625	
   626		for (i = 0; i < MTK_WED_RX_PG_BM_CNT; i += MTK_WED_RX_BUF_PER_PAGE) {
   627			dma_addr_t page_phys, buf_phys;
   628			struct page *page;
   629			int s;
   630	
   631			page = __dev_alloc_page(GFP_KERNEL);
   632			if (!page)
   633				return -ENOMEM;
   634	
   635			page_phys = dma_map_page(dev->hw->dev, page, 0, PAGE_SIZE,
   636						 DMA_BIDIRECTIONAL);
   637			if (dma_mapping_error(dev->hw->dev, page_phys)) {
   638				__free_page(page);
   639				return -ENOMEM;
   640			}
   641	
   642			page_list[page_idx].p = page;
   643			page_list[page_idx++].phy_addr = page_phys;
   644			dma_sync_single_for_cpu(dev->hw->dev, page_phys, PAGE_SIZE,
   645						DMA_BIDIRECTIONAL);
   646	
   647			buf_phys = page_phys;
   648			for (s = 0; s < MTK_WED_RX_BUF_PER_PAGE; s++) {
 > 649				desc->buf0 = cpu_to_le32(buf_phys);
   650				buf_phys += MTK_WED_PAGE_BUF_SIZE;
 > 651				desc++;
   652			}
   653	
   654			dma_sync_single_for_device(dev->hw->dev, page_phys, PAGE_SIZE,
   655						   DMA_BIDIRECTIONAL);
   656		}
   657	
   658		return 0;
   659	}
   660	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
