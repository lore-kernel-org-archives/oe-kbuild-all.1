Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EDD3D556
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712840436; cv=none; b=c4RY1Jngcf7MBf7veTBUjYPG3Dm7R6+bUMDzN5KUyExzEEm+hLDDZmbX8huINDpD/BdIYRbb9OqVdBLP1uNq/cdqaXW3v0ZFCNuUA3zhsbfkYHcC4urJLEK4knk5JZeAdkQFGmhgxbGly6m3WxIDNpEu466wgKWtg80RMw85IOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712840436; c=relaxed/simple;
	bh=J37f6vskDB5eCP5kAxk0EHiR+wA7NJ3GGgbT33nsktA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LBKL331c5l5nc7pTLC31IySd6USb96cf1qAMcs18Bq4FKPtSFz0M3ZWm3P/Chb3X8Ik7Skrv+LgBBpAID+jT6Z4OXOuJ/uJ3fkda6vvx7ZDtQNi9p7yeJAhtnU1zm/dFTRPsYKG/pmR6LOebTgS0q7tCtcz8Kf3P6NPBku99ZtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFP3g7Tg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFP3g7Tg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712840434; x=1744376434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J37f6vskDB5eCP5kAxk0EHiR+wA7NJ3GGgbT33nsktA=;
  b=XFP3g7TgL5Yn/REfSAMYyTDFU7WM4J6N1ZhyOB/8yAfmfiKPC/Kt4psK
   VqW6vji8EB5nbXbh3DksnzO/7icGTMcHC0GXb4+ONmOggZiwsy0PgwhYV
   jwkW6F40lGcDJC6mbfZP1UEvpibSh3+jFpIvZz6u+DqKfmriH31d7zyPP
   vhHK9FFhxknaGAqmo4RuX1E/E3k7eRqyCm9AR0064kgFfLG6OJNKARPB0
   1nKmYDQwyxs4i3OxI8jXYwyl0Nia4HhZavOg5Er7DV+dtkc71BAkSQi97
   1M/j8GuUnK382rBpOwjyzXMXyV5034UmTvCFwxlvk/J89/D7wY2peLsgI
   Q==;
X-CSE-ConnectionGUID: +f5UGWoeTFe68KjMGdWyCA==
X-CSE-MsgGUID: hlaTe+zAQLmW+PqTmdmQLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12096885"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="12096885"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 06:00:33 -0700
X-CSE-ConnectionGUID: Jqt0O5ezTZimlWrWKyNUCg==
X-CSE-MsgGUID: cSu7TXiFTF6sAr+VOAC3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="52070198"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Apr 2024 06:00:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruu2W-0008dF-2a;
	Thu, 11 Apr 2024 13:00:28 +0000
Date: Thu, 11 Apr 2024 20:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 4787/4792]
 drivers/net/ethernet/bzwx/nce/comm/txrx.c:554:6: warning: no previous
 prototype for 'ne6x_alloc_rx_buffers'
Message-ID: <202404112056.agfp1tBw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   5a4887e84d1f38cdaa7d82d911ad735fb06009fe
commit: c783f7daed8739b9497e40656bc220d2d17c9c10 [4787/4792] drivers: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240411/202404112056.agfp1tBw-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112056.agfp1tBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112056.agfp1tBw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:554:6: warning: no previous prototype for 'ne6x_alloc_rx_buffers' [-Wmissing-prototypes]
     554 | bool ne6x_alloc_rx_buffers(struct ne6x_ring *rx_ring, u16 cleaned_count)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1117:6: warning: no previous prototype for 'ne6x_unmap_and_free_tx_resource' [-Wmissing-prototypes]
    1117 | void ne6x_unmap_and_free_tx_resource(struct ne6x_ring *ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1142:5: warning: no previous prototype for 'ne6x_fill_jumbo_sgl' [-Wmissing-prototypes]
    1142 | int ne6x_fill_jumbo_sgl(struct ne6x_ring *tx_ring, struct sk_buff *skb)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1242:6: warning: no previous prototype for 'ne6x_fill_tx_desc' [-Wmissing-prototypes]
    1242 | void ne6x_fill_tx_desc(struct ne6x_tx_desc *tx_desc, u8 vp, dma_addr_t tag_dma,
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1261:6: warning: no previous prototype for 'ne6x_fill_tx_priv_tag' [-Wmissing-prototypes]
    1261 | void ne6x_fill_tx_priv_tag(struct ne6x_ring *tx_ring, struct ne6x_tx_tag *tx_tag,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1276:6: warning: no previous prototype for 'ne6x_xmit_jumbo' [-Wmissing-prototypes]
    1276 | void ne6x_xmit_jumbo(struct ne6x_ring *tx_ring, struct ne6x_tx_buf *first,
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1366:6: warning: no previous prototype for 'ne6x_xmit_simple' [-Wmissing-prototypes]
    1366 | void ne6x_xmit_simple(struct ne6x_ring *tx_ring, struct ne6x_tx_buf *first,
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/comm/txrx.c: In function 'ne6x_xmit_simple':
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1380:16: warning: variable 'mss' set but not used [-Wunused-but-set-variable]
    1380 |         __le64 mss = 0;
         |                ^~~
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1371:40: warning: variable 'first_desc' set but not used [-Wunused-but-set-variable]
    1371 |         struct ne6x_tx_desc *tx_desc, *first_desc;
         |                                        ^~~~~~~~~~


vim +/ne6x_alloc_rx_buffers +554 drivers/net/ethernet/bzwx/nce/comm/txrx.c

   553	
 > 554	bool ne6x_alloc_rx_buffers(struct ne6x_ring *rx_ring, u16 cleaned_count)
   555	{
   556		u16 ntu = rx_ring->next_to_use;
   557		union ne6x_rx_desc *rx_desc;
   558		struct ne6x_rx_buf *bi;
   559	
   560		/* do nothing if no valid netdev defined */
   561		if (!rx_ring->netdev || !cleaned_count)
   562			return false;
   563	
   564		rx_desc = NE6X_RX_DESC(rx_ring, ntu);
   565		bi = &rx_ring->rx_buf[ntu];
   566	
   567		do {
   568			if (!ne6x_alloc_mapped_page(rx_ring, bi))
   569				goto no_buffers;
   570	
   571			/* sync the buffer for use by the device */
   572			dma_sync_single_range_for_device(rx_ring->dev, bi->dma, bi->page_offset,
   573							 rx_ring->rx_buf_len, DMA_FROM_DEVICE);
   574	
   575			/* Refresh the desc even if buffer_addrs didn't change
   576			 * because each write-back erases this info.
   577			 */
   578			rx_desc->wb.u.val = 0;
   579			rx_desc->w.buffer_mop_addr = cpu_to_le64(bi->dma + bi->page_offset);
   580			rx_desc->w.buffer_sop_addr = 0;
   581			rx_desc->w.mop_mem_len = rx_ring->rx_buf_len;
   582			rx_desc->wb.pkt_len = 0;
   583			rx_desc->w.vp = rx_ring->reg_idx;
   584	
   585			rx_desc++;
   586			bi++;
   587			ntu++;
   588			if (unlikely(ntu == rx_ring->count)) {
   589				rx_desc = NE6X_RX_DESC(rx_ring, 0);
   590				bi = rx_ring->rx_buf;
   591				ntu = 0;
   592			}
   593	
   594			/* clear the status bits for the next_to_use descriptor */
   595			rx_desc->wb.u.val = 0;
   596	
   597			cleaned_count--;
   598		} while (cleaned_count);
   599	
   600		if (rx_ring->next_to_use != ntu)
   601			ne6x_release_rx_desc(rx_ring, ntu);
   602	
   603		return false;
   604	
   605	no_buffers:
   606		if (rx_ring->next_to_use != ntu)
   607			ne6x_release_rx_desc(rx_ring, ntu);
   608	
   609		/* make sure to come back via polling to try again after
   610		 * allocation failure
   611		 */
   612		return true;
   613	}
   614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
