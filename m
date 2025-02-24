Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C67227E86
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428045; cv=none; b=GYrj1M6pnJwGq+E8aZqqDlwjUllpn7d+1AfWkAIztHiTrtlYdlU2YNExPMUXO5vkcn1oiqaaEyv4oJstdKacuUOcBRABtBfTdw1eocDPq1IXexd/z/+B5uEhp5pePu2oh8q47p7Ik6U6M9R4n9SyO60PtAqkDtZuXAZ8PTGe2eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428045; c=relaxed/simple;
	bh=8UknH8Kal6iWvJLnVuA6mpaq5VJvWf7UnUN7ojRqkxc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0MTiM6JgYIfWvgH0HjEjcqaky4XOQWjM5abcHl2Z2iku9MLjPhabddZiwGNzkNNu9JJRd0KNO/nY6k39mFye6tGjIF8+LrypeNsq89/TCmhN1Tc4cT6Nd94+op43Anqng5qPaQlIu5EG1TnBVbkPNJcKj83Kl8wJsk5olq0t7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSDdrP17; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSDdrP17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740428043; x=1771964043;
  h=date:from:cc:subject:message-id:mime-version;
  bh=8UknH8Kal6iWvJLnVuA6mpaq5VJvWf7UnUN7ojRqkxc=;
  b=kSDdrP17/54XkM/Kh7Ro9dTqofik8TUQoxK5BmPRqM44u5q/mocrXTTX
   /hhpV5K4BGLKpnQjYf7QWX59M0Eih+zU1ctQbtOaWAihKLjqJ4gdzX+FO
   Lgrjc6GIUhrRHgLDAJkTPpIR/wWpU4k8vY5ylP5bAsz2ZRUd5ZYgvnhjU
   fLcVBegchfMR61qLrYuo+8dGEyGh+1NVS7Ry2kksP66z8mWms1x0+mPJ5
   4l+GHS/6mlyfCtmPVOChruuct2ZH53UzOVQuL27wEE4mW436BZr9bXz5L
   gRwlWZnMtY6HUesUftFrefFWmyBmA9uqyLdyigBRNVBCkrw8RtFDX+O1Z
   A==;
X-CSE-ConnectionGUID: rG4rRyiLTgunSN+oHUgl7w==
X-CSE-MsgGUID: BJNSEkj0Tf2UOGE00nHKoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="28794426"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="28794426"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 12:14:03 -0800
X-CSE-ConnectionGUID: PGQKMWOeQFCN5LSh0GlnVw==
X-CSE-MsgGUID: kfuJ7wIXR/2eSbqvxVHNyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="139404239"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Feb 2025 12:14:01 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmepr-0009IZ-1k
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 20:13:53 +0000
Date: Tue, 25 Feb 2025 04:13:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/dma/xilinx/xilinx_dma.c:1102:49:
 warning: variable 'tail_desc' set but not used
Message-ID: <202502250446.PfrsARkV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi YueHaibing,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: c2be36ac2141b97f9a35ab560381317566bee357 [1/1] dmaengine: xilinx_dma: remove set but not used variable 'tail_segment'
config: arm-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250225/202502250446.PfrsARkV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250446.PfrsARkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250446.PfrsARkV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/xilinx/xilinx_dma.c: In function 'xilinx_vdma_start_transfer':
>> drivers/dma/xilinx/xilinx_dma.c:1102:49: warning: variable 'tail_desc' set but not used [-Wunused-but-set-variable]
    1102 |         struct xilinx_dma_tx_descriptor *desc, *tail_desc;
         |                                                 ^~~~~~~~~
   drivers/dma/xilinx/xilinx_dma.c: In function 'xilinx_vdma_dma_prep_interleaved':
   drivers/dma/xilinx/xilinx_dma.c:1649:34: warning: array subscript 0 is outside array bounds of 'struct data_chunk[0]' [-Warray-bounds=]
    1649 |         if (!xt->numf || !xt->sgl[0].size)
         |                           ~~~~~~~^~~
   In file included from include/linux/dma/xilinx_dma.h:16,
                    from drivers/dma/xilinx/xilinx_dma.c:36:
   include/linux/dmaengine.h:168:27: note: while referencing 'sgl'
     168 |         struct data_chunk sgl[0];
         |                           ^~~
   drivers/dma/xilinx/xilinx_dma.c:1672:28: warning: array subscript 0 is outside array bounds of 'struct data_chunk[0]' [-Warray-bounds=]
    1672 |         hw->hsize = xt->sgl[0].size;
         |                     ~~~~~~~^~~
   include/linux/dmaengine.h:168:27: note: while referencing 'sgl'
     168 |         struct data_chunk sgl[0];
         |                           ^~~
   drivers/dma/xilinx/xilinx_dma.c:1673:30: warning: array subscript 0 is outside array bounds of 'struct data_chunk[0]' [-Warray-bounds=]
    1673 |         hw->stride = (xt->sgl[0].icg + xt->sgl[0].size) <<
         |                       ~~~~~~~^~~
   include/linux/dmaengine.h:168:27: note: while referencing 'sgl'
     168 |         struct data_chunk sgl[0];
         |                           ^~~
   drivers/dma/xilinx/xilinx_dma.c: In function 'xilinx_dma_prep_interleaved':
   drivers/dma/xilinx/xilinx_dma.c:1993:34: warning: array subscript 0 is outside array bounds of 'struct data_chunk[0]' [-Warray-bounds=]
    1993 |         if (!xt->numf || !xt->sgl[0].size)
         |                           ~~~~~~~^~~
   include/linux/dmaengine.h:168:27: note: while referencing 'sgl'
     168 |         struct data_chunk sgl[0];
         |                           ^~~
   drivers/dma/xilinx/xilinx_dma.c:2024:37: warning: array subscript 0 is outside array bounds of 'struct data_chunk[0]' [-Warray-bounds=]
    2024 |         hw->vsize_stride |= (xt->sgl[0].icg + xt->sgl[0].size) &
         |                              ~~~~~~~^~~
   include/linux/dmaengine.h:168:27: note: while referencing 'sgl'
     168 |         struct data_chunk sgl[0];
         |                           ^~~
   drivers/dma/xilinx/xilinx_dma.c:2024:54: warning: array subscript 0 is outside array bounds of 'struct data_chunk[0]' [-Warray-bounds=]
    2024 |         hw->vsize_stride |= (xt->sgl[0].icg + xt->sgl[0].size) &
         |                                               ~~~~~~~^~~
   include/linux/dmaengine.h:168:27: note: while referencing 'sgl'
     168 |         struct data_chunk sgl[0];
         |                           ^~~
   drivers/dma/xilinx/xilinx_dma.c:2026:30: warning: array subscript 0 is outside array bounds of 'struct data_chunk[0]' [-Warray-bounds=]
    2026 |         hw->control = xt->sgl[0].size & XILINX_DMA_BD_HSIZE_MASK;
         |                       ~~~~~~~^~~
   include/linux/dmaengine.h:168:27: note: while referencing 'sgl'
     168 |         struct data_chunk sgl[0];
         |                           ^~~


vim +/tail_desc +1102 drivers/dma/xilinx/xilinx_dma.c

9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1094  
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1095  /**
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1096   * xilinx_vdma_start_transfer - Starts VDMA transfer
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1097   * @chan: Driver specific channel struct pointer
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1098   */
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  1099  static void xilinx_vdma_start_transfer(struct xilinx_dma_chan *chan)
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1100  {
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1101  	struct xilinx_vdma_config *config = &chan->config;
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07 @1102  	struct xilinx_dma_tx_descriptor *desc, *tail_desc;
fe0503e19310bd drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1103  	u32 reg, j;
b8349172b4001e drivers/dma/xilinx/xilinx_dma.c  Andrea Merello         2018-11-20  1104  	struct xilinx_vdma_tx_segment *segment, *last = NULL;
b8349172b4001e drivers/dma/xilinx/xilinx_dma.c  Andrea Merello         2018-11-20  1105  	int i = 0;
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1106  
26c5e36931b3fe drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-02-26  1107  	/* This function was invoked with lock held */
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1108  	if (chan->err)
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1109  		return;
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1110  
21e02a3e05cfd3 drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1111  	if (!chan->idle)
21e02a3e05cfd3 drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1112  		return;
21e02a3e05cfd3 drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1113  
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1114  	if (list_empty(&chan->pending_list))
26c5e36931b3fe drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-02-26  1115  		return;
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1116  
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1117  	desc = list_first_entry(&chan->pending_list,
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  1118  				struct xilinx_dma_tx_descriptor, node);
7096f36e5388be drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-02-26  1119  	tail_desc = list_last_entry(&chan->pending_list,
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  1120  				    struct xilinx_dma_tx_descriptor, node);
7096f36e5388be drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-02-26  1121  
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1122  	/* Configure the hardware using info in the config structure */
0894aa28aece68 drivers/dma/xilinx/xilinx_dma.c  Radhey Shyam Pandey    2018-06-13  1123  	if (chan->has_vflip) {
0894aa28aece68 drivers/dma/xilinx/xilinx_dma.c  Radhey Shyam Pandey    2018-06-13  1124  		reg = dma_read(chan, XILINX_VDMA_REG_ENABLE_VERTICAL_FLIP);
0894aa28aece68 drivers/dma/xilinx/xilinx_dma.c  Radhey Shyam Pandey    2018-06-13  1125  		reg &= ~XILINX_VDMA_ENABLE_VERTICAL_FLIP;
0894aa28aece68 drivers/dma/xilinx/xilinx_dma.c  Radhey Shyam Pandey    2018-06-13  1126  		reg |= config->vflip_en;
0894aa28aece68 drivers/dma/xilinx/xilinx_dma.c  Radhey Shyam Pandey    2018-06-13  1127  		dma_write(chan, XILINX_VDMA_REG_ENABLE_VERTICAL_FLIP,
0894aa28aece68 drivers/dma/xilinx/xilinx_dma.c  Radhey Shyam Pandey    2018-06-13  1128  			  reg);
0894aa28aece68 drivers/dma/xilinx/xilinx_dma.c  Radhey Shyam Pandey    2018-06-13  1129  	}
0894aa28aece68 drivers/dma/xilinx/xilinx_dma.c  Radhey Shyam Pandey    2018-06-13  1130  
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  1131  	reg = dma_ctrl_read(chan, XILINX_DMA_REG_DMACR);
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1132  
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1133  	if (config->frm_cnt_en)
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  1134  		reg |= XILINX_DMA_DMACR_FRAMECNT_EN;
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1135  	else
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  1136  		reg &= ~XILINX_DMA_DMACR_FRAMECNT_EN;
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1137  
b8349172b4001e drivers/dma/xilinx/xilinx_dma.c  Andrea Merello         2018-11-20  1138  	/* If not parking, enable circular mode */
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1139  	if (config->park)
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  1140  		reg &= ~XILINX_DMA_DMACR_CIRC_EN;
b8349172b4001e drivers/dma/xilinx/xilinx_dma.c  Andrea Merello         2018-11-20  1141  	else
b8349172b4001e drivers/dma/xilinx/xilinx_dma.c  Andrea Merello         2018-11-20  1142  		reg |= XILINX_DMA_DMACR_CIRC_EN;
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1143  
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  1144  	dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1145  
fe0503e19310bd drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1146  	j = chan->desc_submitcount;
fe0503e19310bd drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1147  	reg = dma_read(chan, XILINX_DMA_REG_PARK_PTR);
fe0503e19310bd drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1148  	if (chan->direction == DMA_MEM_TO_DEV) {
fe0503e19310bd drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1149  		reg &= ~XILINX_DMA_PARK_PTR_RD_REF_MASK;
fe0503e19310bd drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1150  		reg |= j << XILINX_DMA_PARK_PTR_RD_REF_SHIFT;
fe0503e19310bd drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1151  	} else {
fe0503e19310bd drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1152  		reg &= ~XILINX_DMA_PARK_PTR_WR_REF_MASK;
fe0503e19310bd drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1153  		reg |= j << XILINX_DMA_PARK_PTR_WR_REF_SHIFT;
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1154  	}
fe0503e19310bd drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1155  	dma_write(chan, XILINX_DMA_REG_PARK_PTR, reg);
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1156  
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1157  	/* Start the hardware */
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  1158  	xilinx_dma_start(chan);
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1159  
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1160  	if (chan->err)
26c5e36931b3fe drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-02-26  1161  		return;
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1162  
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1163  	/* Start the transfer */
a65cf5125b49f3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1164  	if (chan->desc_submitcount < chan->num_frms)
a65cf5125b49f3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1165  		i = chan->desc_submitcount;
a65cf5125b49f3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1166  
a65cf5125b49f3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1167  	list_for_each_entry(segment, &desc->segments, node) {
b72db4005fe4bf drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1168  		if (chan->ext_addr)
b72db4005fe4bf drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1169  			vdma_desc_write_64(chan,
b72db4005fe4bf drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1170  				   XILINX_VDMA_REG_START_ADDRESS_64(i++),
b72db4005fe4bf drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1171  				   segment->hw.buf_addr,
b72db4005fe4bf drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1172  				   segment->hw.buf_addr_msb);
b72db4005fe4bf drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1173  		else
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1174  			vdma_desc_write(chan,
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1175  					XILINX_VDMA_REG_START_ADDRESS(i++),
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1176  					segment->hw.buf_addr);
b72db4005fe4bf drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1177  
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1178  		last = segment;
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1179  	}
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1180  
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1181  	if (!last)
26c5e36931b3fe drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-02-26  1182  		return;
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1183  
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1184  	/* HW expects these parameters to be same for one transaction */
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  1185  	vdma_desc_write(chan, XILINX_DMA_REG_HSIZE, last->hw.hsize);
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  1186  	vdma_desc_write(chan, XILINX_DMA_REG_FRMDLY_STRIDE,
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1187  			last->hw.stride);
42c1a2ede4f6a3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-07  1188  	vdma_desc_write(chan, XILINX_DMA_REG_VSIZE, last->hw.vsize);
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1189  
a65cf5125b49f3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1190  	chan->desc_submitcount++;
a65cf5125b49f3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1191  	chan->desc_pendingcount--;
fe0503e19310bd drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1192  	list_del(&desc->node);
fe0503e19310bd drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1193  	list_add_tail(&desc->node, &chan->active_list);
a65cf5125b49f3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1194  	if (chan->desc_submitcount == chan->num_frms)
a65cf5125b49f3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1195  		chan->desc_submitcount = 0;
21e02a3e05cfd3 drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1196  
21e02a3e05cfd3 drivers/dma/xilinx/xilinx_dma.c  Kedareswara rao Appana 2017-12-07  1197  	chan->idle = false;
a65cf5125b49f3 drivers/dma/xilinx/xilinx_vdma.c Kedareswara rao Appana 2016-04-06  1198  }
9cd4360de6090a drivers/dma/xilinx/xilinx_vdma.c Srikanth Thokala       2014-04-23  1199  

:::::: The code at line 1102 was first introduced by commit
:::::: 42c1a2ede4f6a320d6843fc846f5466bff836a0c dmaengine: vdma: Rename xilinx_vdma_ prefix to xilinx_dma

:::::: TO: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
