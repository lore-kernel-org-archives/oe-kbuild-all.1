Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D0E60DE5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706531619; cv=none; b=BUfNshcCECUx+zeFoZsedaNgnhuzUVAxfH3SbOLP3/qmXhRxuJ9drJ9ngKUWaQOt4rpI4IzRW90rsN8lgifqVjdB8bX9fu+RjE86EBYkbtSRTqrSD584roIJMXX7qcxNFWaqQy7J+NjUTkkLl7ddHcppg5yJtlOYclEk1BiOalQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706531619; c=relaxed/simple;
	bh=gLX4suXjIdHxWQe5Yh+2FhVTTsOrp+HHX49CL1dTgos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cN4KZilK2kEpBaiiJ6r32WXIJ1Z6262WGmY643LrjRZe6HlCyhB4SLzFEFjJo1FW01yUC00RPXCr14fJ80LmGRuXAAC5L3noMD4wBlXwp1BvAuNPHMi7zrb+n4RPK/O18QqSXERSsQB6sCwGrVUIDIz0/FH9NLUZptywf4P4iQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Heu+NDEE; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Heu+NDEE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706531617; x=1738067617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gLX4suXjIdHxWQe5Yh+2FhVTTsOrp+HHX49CL1dTgos=;
  b=Heu+NDEEPQgifSp70zLxo1VDogJrdo64yaHuAvJxnp2fy/4SPgaebEac
   HWA6SlB1oa/GGaIuiybtL4t87wV89Hmi2mZ2ZQr9fKaOrGYMSCaB9LvT4
   8kWQlWFOfXLXRzHC4xWaHvuMcDgjIqr6JkBmLoWtdusUxFjTy6UZkzeJZ
   Ws8esCqOHCs/1FTm5cRoHpV7/EvlLo7U/4pXdB7C9HGYQX3HuEtKo1oIE
   n5IuK0LgDD4UGUMv7cM+MgZBX/L+Y7+kd51hyib04ZKKIXzpZF5ysPjPd
   9lHPVPcBZ5OLD6HtC8D+CCww2l109CaIZjcVNizz5LC/vrqxSY6DxmidM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="400083549"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="400083549"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 04:33:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3356765"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jan 2024 04:33:37 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUQpS-0004I7-1x;
	Mon, 29 Jan 2024 12:33:34 +0000
Date: Mon, 29 Jan 2024 20:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1537/26476]
 drivers/net/wireless/mediatek/mt76_new/dma.c:368:13: error: variable 'idx'
 set but not used
Message-ID: <202401292044.BX8bmHwy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: bdfab89b8dada94f63f56210817f1376c7fd5dca [1537/26476] mt76: update driver from openwrt to include mt7622 wifi
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20240129/202401292044.BX8bmHwy-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401292044.BX8bmHwy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401292044.BX8bmHwy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76_new/dma.c: In function 'mt76_dma_rx_fill':
>> drivers/net/wireless/mediatek/mt76_new/dma.c:368:13: error: variable 'idx' set but not used [-Werror=unused-but-set-variable]
     368 |         int idx;
         |             ^~~
   cc1: all warnings being treated as errors


vim +/idx +368 drivers/net/wireless/mediatek/mt76_new/dma.c

   359	
   360	static int
   361	mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_queue *q)
   362	{
   363		dma_addr_t addr;
   364		void *buf;
   365		int frames = 0;
   366		int len = SKB_WITH_OVERHEAD(q->buf_size);
   367		int offset = q->buf_offset;
 > 368		int idx;
   369	
   370		spin_lock_bh(&q->lock);
   371	
   372		while (q->queued < q->ndesc - 1) {
   373			struct mt76_queue_buf qbuf;
   374	
   375			buf = page_frag_alloc(&q->rx_page, q->buf_size, GFP_ATOMIC);
   376			if (!buf)
   377				break;
   378	
   379			addr = dma_map_single(dev->dev, buf, len, DMA_FROM_DEVICE);
   380			if (unlikely(dma_mapping_error(dev->dev, addr))) {
   381				skb_free_frag(buf);
   382				break;
   383			}
   384	
   385			qbuf.addr = addr + offset;
   386			qbuf.len = len - offset;
   387			idx = mt76_dma_add_buf(dev, q, &qbuf, 1, 0, buf, NULL);
   388			frames++;
   389		}
   390	
   391		if (frames)
   392			mt76_dma_kick_queue(dev, q);
   393	
   394		spin_unlock_bh(&q->lock);
   395	
   396		return frames;
   397	}
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
