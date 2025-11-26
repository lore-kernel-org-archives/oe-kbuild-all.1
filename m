Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414D72D781E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 23:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764198391; cv=none; b=PIgUdzF82U9ycOn8fi2xfApJGyKJiopF3uWchPH2zSuKDSDf+L463OVhoC47mX+YL29a9UDQYnsWfd5XHbnxkKnGnI3kACCejYt8mK10xAMgc92N4sH+H6OxWZRiekSklYf0htQt2MTRCotq7thcFsQQYDtRTTTSQRm6qIUcjSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764198391; c=relaxed/simple;
	bh=dq0Ndrs8kysQZaBE6dTw7DIdv4oHUa+9dNKo8MsfNpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=owwvU65gS/IVKgjjMeoSph7cfxINfPae9+1bXzj39n+bpaqDS5xReezL2wE+r9LPg9yckwO2YL+ordT2C/gVfb5AHdJJb/t8tb7zzW/D3W1wu2MZBLojerKUzUGSFUvmWJc4VNW06hOluJFjx6WhU/djif7Nl0zwuIAvueK0LMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLc25CF+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLc25CF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764198389; x=1795734389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dq0Ndrs8kysQZaBE6dTw7DIdv4oHUa+9dNKo8MsfNpQ=;
  b=dLc25CF+xKSWnlMoWpmmL42djAqUkmfE6w49jVtqA25DKAvzvUCkdkns
   vBK8gEvuM9oVBA/apV2nAI/VUipUrL8dpJsKxmdBOiiUwZbi8Whj0gnA4
   hMFNzW0ckSPYxIkLMPo157ZcmFEvFts8EBAdgHiT/ObzeKWo14EE0V+bo
   hdNoJUf5G7UKhuRJSm/YQ4IL2WcB0lLk+Ni5UBilzfUAyOMdgOageDNJN
   QDdFmanu3KEGC2o+pJrctuYbwYTLWf1zBj3rACK4BhY17GNtwa6YnEQxM
   i0Td/GdAYAtgf6sjes9s4UtMfIFX+FKq8AnJ8mBzo0DU9nrQaycQndWtY
   Q==;
X-CSE-ConnectionGUID: s/0mQ+tKRGWuGmyedRuFCg==
X-CSE-MsgGUID: FRCFewi1RoCZmBDrjcTGRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76933529"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76933529"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 15:06:27 -0800
X-CSE-ConnectionGUID: 4OSDOTnuR0uIxQRzaGhz5g==
X-CSE-MsgGUID: 6sGgnwY8QmO2hTWDfdp1yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="198023064"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2025 15:06:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOOae-000000003RK-0sYU;
	Wed, 26 Nov 2025 23:06:24 +0000
Date: Thu, 27 Nov 2025 07:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 7/7]
 drivers/gpu/drm/mediatek/mtk_crtc.c:2144: warning: Function parameter or
 member 'mtk_crtc' not described in 'mtk_crtc_create_crc_cmdq'
Message-ID: <202511270657.mUxVDdrW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   26c32ad936189dfa8219d755ef9f094ead880981
commit: 31d89b3b35a1b3278e9075c9c02bc52730c223b4 [7/7] CHROMIUM: mediatek/drm: Add DITHER CRC functionality and refactor OUTPROC
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251127/202511270657.mUxVDdrW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270657.mUxVDdrW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270657.mUxVDdrW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_crtc.c:2144: warning: Function parameter or member 'mtk_crtc' not described in 'mtk_crtc_create_crc_cmdq'
>> drivers/gpu/drm/mediatek/mtk_crtc.c:2144: warning: Excess function parameter 'data' description in 'mtk_crtc_create_crc_cmdq'


vim +2144 drivers/gpu/drm/mediatek/mtk_crtc.c

b7c8e781f020aa Sunny.Shen    2024-09-11  2119  
b7c8e781f020aa Sunny.Shen    2024-09-11  2120  /**
b7c8e781f020aa Sunny.Shen    2024-09-11  2121   * mtk_crtc_create_crc_cmdq - Create a CMDQ thread for syncing the CRCs
b7c8e781f020aa Sunny.Shen    2024-09-11  2122   * @crc: Pointer of the CRC to init
31d89b3b35a1b3 xiandong.wang 2025-11-24  2123   * @data: Pointer of the crtc data
b7c8e781f020aa Sunny.Shen    2024-09-11  2124   *
b7c8e781f020aa Sunny.Shen    2024-09-11  2125   * This function will create a looping thread on GCE (Global Command Engine) to
b7c8e781f020aa Sunny.Shen    2024-09-11  2126   * keep the CRC up to date by monitoring the assigned event (usually the frame
b7c8e781f020aa Sunny.Shen    2024-09-11  2127   * done event) of the CRC provider, and read the CRCs from the registers to a
b7c8e781f020aa Sunny.Shen    2024-09-11  2128   * shared memory for the workqueue to read. To start/stop the looping thread,
b7c8e781f020aa Sunny.Shen    2024-09-11  2129   * please call 'mtk_crtc_start_crc_cmdq()' and 'mtk_crtc_stop_crc_cmdq()'
b7c8e781f020aa Sunny.Shen    2024-09-11  2130   * defined below
b7c8e781f020aa Sunny.Shen    2024-09-11  2131   *
b7c8e781f020aa Sunny.Shen    2024-09-11  2132   * The reaseon why we don't update the CRCs with CPU is that the front porch of
b7c8e781f020aa Sunny.Shen    2024-09-11  2133   * 4k60 timing in CEA-861 is less than 60us, and register read/write speed is
b7c8e781f020aa Sunny.Shen    2024-09-11  2134   * relatively unreliable comparing to GCE due to the bus design.
b7c8e781f020aa Sunny.Shen    2024-09-11  2135   *
b7c8e781f020aa Sunny.Shen    2024-09-11  2136   * We must create a new thread instead of using the original one for plane
b7c8e781f020aa Sunny.Shen    2024-09-11  2137   * update is because:
b7c8e781f020aa Sunny.Shen    2024-09-11  2138   * 1. We cannot add another wait-for-event command at the end of cmdq packet, or
b7c8e781f020aa Sunny.Shen    2024-09-11  2139   *    the cmdq callback will delay for too long
b7c8e781f020aa Sunny.Shen    2024-09-11  2140   * 2. Will get the CRC of the previous frame if using the existed wait-for-event
b7c8e781f020aa Sunny.Shen    2024-09-11  2141   *    command which is at the beginning of the packet
b7c8e781f020aa Sunny.Shen    2024-09-11  2142   */
31d89b3b35a1b3 xiandong.wang 2025-11-24  2143  void mtk_crtc_create_crc_cmdq(struct mtk_crtc_crc *crc, struct mtk_crtc *mtk_crtc)
b7c8e781f020aa Sunny.Shen    2024-09-11 @2144  {
b7c8e781f020aa Sunny.Shen    2024-09-11  2145  	int i;
b7c8e781f020aa Sunny.Shen    2024-09-11  2146  	dma_addr_t crc_pa;
31d89b3b35a1b3 xiandong.wang 2025-11-24  2147  	struct device *dev = mtk_crtc->crc_provider->dev;
b7c8e781f020aa Sunny.Shen    2024-09-11  2148  
b7c8e781f020aa Sunny.Shen    2024-09-11  2149  	if (!crc->cnt) {
b7c8e781f020aa Sunny.Shen    2024-09-11  2150  		dev_warn(dev, "%s: not support\n", __func__);
b7c8e781f020aa Sunny.Shen    2024-09-11  2151  		return;
b7c8e781f020aa Sunny.Shen    2024-09-11  2152  	}
b7c8e781f020aa Sunny.Shen    2024-09-11  2153  
b7c8e781f020aa Sunny.Shen    2024-09-11  2154  	if (!crc->va) {
b7c8e781f020aa Sunny.Shen    2024-09-11  2155  		dev_warn(dev, "%s: no memory\n", __func__);
b7c8e781f020aa Sunny.Shen    2024-09-11  2156  		return;
b7c8e781f020aa Sunny.Shen    2024-09-11  2157  	}
b7c8e781f020aa Sunny.Shen    2024-09-11  2158  
b7c8e781f020aa Sunny.Shen    2024-09-11  2159  	crc->cmdq_client.client.dev = dev;
b7c8e781f020aa Sunny.Shen    2024-09-11  2160  	crc->cmdq_client.client.tx_block = false;
b7c8e781f020aa Sunny.Shen    2024-09-11  2161  	crc->cmdq_client.client.knows_txdone = true;
b7c8e781f020aa Sunny.Shen    2024-09-11  2162  	crc->cmdq_client.client.rx_callback = NULL;
b7c8e781f020aa Sunny.Shen    2024-09-11  2163  	crc->cmdq_client.chan = mbox_request_channel(&crc->cmdq_client.client, 0);
b7c8e781f020aa Sunny.Shen    2024-09-11  2164  	if (IS_ERR(crc->cmdq_client.chan)) {
b7c8e781f020aa Sunny.Shen    2024-09-11  2165  		dev_warn(dev, "%s: failed to create mailbox client\n", __func__);
b7c8e781f020aa Sunny.Shen    2024-09-11  2166  		crc->cmdq_client.chan = NULL;
b7c8e781f020aa Sunny.Shen    2024-09-11  2167  		goto cleanup;
b7c8e781f020aa Sunny.Shen    2024-09-11  2168  	}
b7c8e781f020aa Sunny.Shen    2024-09-11  2169  
b7c8e781f020aa Sunny.Shen    2024-09-11  2170  	if (cmdq_pkt_create(&crc->cmdq_client, &crc->cmdq_handle, PAGE_SIZE)) {
b7c8e781f020aa Sunny.Shen    2024-09-11  2171  		dev_warn(dev, "%s: failed to create cmdq packet\n", __func__);
b7c8e781f020aa Sunny.Shen    2024-09-11  2172  		goto cleanup;
b7c8e781f020aa Sunny.Shen    2024-09-11  2173  	}
b7c8e781f020aa Sunny.Shen    2024-09-11  2174  
b7c8e781f020aa Sunny.Shen    2024-09-11  2175  	/* map the entry to get a dma address for cmdq to store the crc */
b7c8e781f020aa Sunny.Shen    2024-09-11  2176  	crc->pa = dma_map_single(crc->cmdq_client.chan->mbox->dev,
b7c8e781f020aa Sunny.Shen    2024-09-11  2177  				 crc->va, crc->cnt * sizeof(*crc->va),
b7c8e781f020aa Sunny.Shen    2024-09-11  2178  				 DMA_FROM_DEVICE);
b7c8e781f020aa Sunny.Shen    2024-09-11  2179  
b7c8e781f020aa Sunny.Shen    2024-09-11  2180  	if (dma_mapping_error(crc->cmdq_client.chan->mbox->dev, crc->pa)) {
b7c8e781f020aa Sunny.Shen    2024-09-11  2181  		dev_err(dev, "%s: failed to map dma\n", __func__);
b7c8e781f020aa Sunny.Shen    2024-09-11  2182  		goto cleanup;
b7c8e781f020aa Sunny.Shen    2024-09-11  2183  	}
b7c8e781f020aa Sunny.Shen    2024-09-11  2184  
b7c8e781f020aa Sunny.Shen    2024-09-11  2185  	if (crc->cmdq_event)
b7c8e781f020aa Sunny.Shen    2024-09-11  2186  		cmdq_pkt_wfe(&crc->cmdq_handle, crc->cmdq_event, true);
b7c8e781f020aa Sunny.Shen    2024-09-11  2187  
b7c8e781f020aa Sunny.Shen    2024-09-11  2188  	for (i = 0; i < crc->cnt; i++) {
b7c8e781f020aa Sunny.Shen    2024-09-11  2189  		crc_pa = crc->pa + i * sizeof(*crc->va);
b7c8e781f020aa Sunny.Shen    2024-09-11  2190  
b7c8e781f020aa Sunny.Shen    2024-09-11  2191  		if (cmdq_addr_need_offset(crc->cmdq_client.chan, crc_pa))
b7c8e781f020aa Sunny.Shen    2024-09-11  2192  			crc_pa += cmdq_get_offset_pa(crc->cmdq_client.chan);
b7c8e781f020aa Sunny.Shen    2024-09-11  2193  
b7c8e781f020aa Sunny.Shen    2024-09-11  2194  		/* put crc to spr1 register */
b7c8e781f020aa Sunny.Shen    2024-09-11  2195  		cmdq_pkt_assign(&crc->cmdq_handle, CMDQ_THR_SPR_IDX0,
b7c8e781f020aa Sunny.Shen    2024-09-11  2196  				CMDQ_ADDR_HIGH(crc->cmdq_reg->pa_base));
b7c8e781f020aa Sunny.Shen    2024-09-11  2197  		cmdq_pkt_read_s(&crc->cmdq_handle, CMDQ_THR_SPR_IDX0,
b7c8e781f020aa Sunny.Shen    2024-09-11  2198  				CMDQ_ADDR_LOW(crc->cmdq_reg->offset + crc->ofs[i]),
b7c8e781f020aa Sunny.Shen    2024-09-11  2199  				CMDQ_THR_SPR_IDX1);
b7c8e781f020aa Sunny.Shen    2024-09-11  2200  
b7c8e781f020aa Sunny.Shen    2024-09-11  2201  		/* copy spr1 register to physical address of the crc */
b7c8e781f020aa Sunny.Shen    2024-09-11  2202  		cmdq_pkt_assign(&crc->cmdq_handle, CMDQ_THR_SPR_IDX2,
b7c8e781f020aa Sunny.Shen    2024-09-11  2203  				CMDQ_ADDR_HIGH(crc_pa));
b7c8e781f020aa Sunny.Shen    2024-09-11  2204  		cmdq_pkt_write_s(&crc->cmdq_handle, CMDQ_THR_SPR_IDX2,
b7c8e781f020aa Sunny.Shen    2024-09-11  2205  				 CMDQ_ADDR_LOW(crc_pa),
b7c8e781f020aa Sunny.Shen    2024-09-11  2206  				 CMDQ_THR_SPR_IDX1);
b7c8e781f020aa Sunny.Shen    2024-09-11  2207  	}
b7c8e781f020aa Sunny.Shen    2024-09-11  2208  
b7c8e781f020aa Sunny.Shen    2024-09-11  2209  	/* reset crc */
31d89b3b35a1b3 xiandong.wang 2025-11-24  2210  	mtk_crtc->crc_provider->funcs->crc_reset(dev, &crc->cmdq_handle);
b7c8e781f020aa Sunny.Shen    2024-09-11  2211  
b7c8e781f020aa Sunny.Shen    2024-09-11  2212  	/* jump to head of the cmdq packet */
b7c8e781f020aa Sunny.Shen    2024-09-11  2213  	cmdq_pkt_jump_abs(&crc->cmdq_handle, crc->cmdq_handle.pa_base,
b7c8e781f020aa Sunny.Shen    2024-09-11  2214  			  cmdq_get_shift_pa(crc->cmdq_client.chan));
b7c8e781f020aa Sunny.Shen    2024-09-11  2215  
b7c8e781f020aa Sunny.Shen    2024-09-11  2216  	return;
b7c8e781f020aa Sunny.Shen    2024-09-11  2217  
b7c8e781f020aa Sunny.Shen    2024-09-11  2218  cleanup:
b7c8e781f020aa Sunny.Shen    2024-09-11  2219  	mtk_crtc_destroy_crc_cmdq(crc);
b7c8e781f020aa Sunny.Shen    2024-09-11  2220  }
b7c8e781f020aa Sunny.Shen    2024-09-11  2221  

:::::: The code at line 2144 was first introduced by commit
:::::: b7c8e781f020aabd1461232257632f4c04ba97ca CHROMIUM: drm/mediatek: Add CRC support for MT8196

:::::: TO: Sunny.Shen <sunny.shen@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
