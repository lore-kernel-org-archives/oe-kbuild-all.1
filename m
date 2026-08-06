Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEE834B669
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 07:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001745; cv=none; b=TMXGaZ3UulTTy2gLwltjhdXt3HYYqLmxly/0QLPIT4l24qpJuFVUg93UEAB6MeIUOo36FTqNQms7DMFbEoMZvVR3IfKNFwCBBtpQ/ELj8oe42bdVvv+4js2umNkDpeEh2GKwy8OUCDIbjrxFx0RaZONnDTSsMCRzn8zDvWQIZNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001745; c=relaxed/simple;
	bh=B/iJbU/9Attl7ERTMzn1WOPKcgX8CaiaQNrVJMIKLPQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c9n1LG4Oqgs7jVglmuP5ntYoH3f6BjDjMjGWErEoxneOpuvR/x17DY3K5d/p87sNrJo9KBm7A88fmX7STGg/aNLv2G4vrH7APts5ukedabw2hl4wZVonQ31DLSNvAwxAxIx3jjNDOz7yfqLh428dRQikztphdh1nWvpEX/VHu54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9xjcbhV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9xjcbhV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786001743; x=1817537743;
  h=date:from:to:cc:subject:message-id;
  bh=B/iJbU/9Attl7ERTMzn1WOPKcgX8CaiaQNrVJMIKLPQ=;
  b=Q9xjcbhV4WszP4LKBZ2DgLIw6c0T8JeiJKxCfGxkCxgvCUsyI5KYBrob
   ja8U2g+AbVvmoLzOLYVmgLkK87xOqhqhptJzo3ayZrLCcK3Tw0noXt5rw
   xuEL8A+BhBsb8iacPRCh2bBrLHH6CAwm1PuMQGR27yyNFquS9qcOabim9
   Min4OjZO0UXMomshgtFNzPmTS5AA5RQhe/MGCbb/VgjUa2h1dsvbGw9rm
   bC8SkaKNc76Idk9LcdGxXGIz2LTH4H7Pv9Ph+B3iPV/KmaKwtAWN6V7Wg
   FTccCw0g/kl2TGbE3EKV/UjYkz5RRXVL0ymEpuOAgUcHsbKFcQcs6sj9c
   Q==;
X-CSE-ConnectionGUID: DZYD8Tz8TKyAh1gpOU9KOA==
X-CSE-MsgGUID: d+Smzr9ATHuhn717ZNOyGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86702705"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86702705"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 00:35:43 -0700
X-CSE-ConnectionGUID: CjxLbZpgRbSMoCuoWvOx+Q==
X-CSE-MsgGUID: kDcKnAPfQjmbi9YBz1BGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="261488409"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 06 Aug 2026 00:35:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrsdf-000000004aQ-2V1p;
	Thu, 06 Aug 2026 07:35:39 +0000
Date: Thu, 06 Aug 2026 09:34:48 +0200
From: kernel test robot <lkp@intel.com>
To: WenTao Liang <vulab@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/ntb/test/ntb_perf.c:854:9: error: implicit
 declaration of function 'dmaengine_desc_put'; did you mean
 'dmaengine_desc_free'?
Message-ID: <202608060947.hhZqC9D0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/WenTao-Liang/fix-ntb-perf_copy_chunk-fix-tx-descriptor-and-unmap-kref-leak-on-dmaengine_submit-failure/20260806-074331
head:   b44abf35f0528183fbc3ffd676ccfb1f4e8da678
commit: b44abf35f0528183fbc3ffd676ccfb1f4e8da678 fix: ntb: perf_copy_chunk: fix tx descriptor and unmap kref leak on dmaengine_submit failure
date:   8 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260806/202608060947.hhZqC9D0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060947.hhZqC9D0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060947.hhZqC9D0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ntb/test/ntb_perf.c: In function 'perf_copy_chunk':
>> drivers/ntb/test/ntb_perf.c:854:9: error: implicit declaration of function 'dmaengine_desc_put'; did you mean 'dmaengine_desc_free'? [-Wimplicit-function-declaration]
     854 |         dmaengine_desc_put(tx);
         |         ^~~~~~~~~~~~~~~~~~
         |         dmaengine_desc_free


vim +854 drivers/ntb/test/ntb_perf.c

   784	
   785	static int perf_copy_chunk(struct perf_thread *pthr,
   786				   void __iomem *dst, void *src, size_t len)
   787	{
   788		struct dma_async_tx_descriptor *tx;
   789		struct dmaengine_unmap_data *unmap;
   790		struct device *dma_dev;
   791		int try = 0, ret = 0;
   792		struct perf_peer *peer = pthr->perf->test_peer;
   793		void __iomem *vbase;
   794		void __iomem *dst_vaddr;
   795		dma_addr_t dst_dma_addr;
   796	
   797		if (!use_dma) {
   798			memcpy_toio(dst, src, len);
   799			goto ret_check_tsync;
   800		}
   801	
   802		dma_dev = pthr->dma_chan->device->dev;
   803	
   804		if (!is_dma_copy_aligned(pthr->dma_chan->device, offset_in_page(src),
   805					 offset_in_page(dst), len))
   806			return -EIO;
   807	
   808		vbase = peer->outbuf;
   809		dst_vaddr = dst;
   810		dst_dma_addr = peer->dma_dst_addr + (dst_vaddr - vbase);
   811	
   812		unmap = dmaengine_get_unmap_data(dma_dev, 1, GFP_NOWAIT);
   813		if (!unmap)
   814			return -ENOMEM;
   815	
   816		unmap->len = len;
   817		unmap->addr[0] = dma_map_page(dma_dev, virt_to_page(src),
   818			offset_in_page(src), len, DMA_TO_DEVICE);
   819		if (dma_mapping_error(dma_dev, unmap->addr[0])) {
   820			ret = -EIO;
   821			goto err_free_resource;
   822		}
   823		unmap->to_cnt = 1;
   824	
   825		do {
   826			tx = dmaengine_prep_dma_memcpy(pthr->dma_chan, dst_dma_addr,
   827				unmap->addr[0], len, DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
   828			if (!tx)
   829				msleep(DMA_MDELAY);
   830		} while (!tx && (try++ < DMA_TRIES));
   831	
   832		if (!tx) {
   833			ret = -EIO;
   834			goto err_free_resource;
   835		}
   836	
   837		tx->callback = perf_dma_copy_callback;
   838		tx->callback_param = pthr;
   839		dma_set_unmap(tx, unmap);
   840	
   841		ret = dma_submit_error(dmaengine_submit(tx));
   842		if (ret)
   843			goto err_free_resource;
   844	
   845		dmaengine_unmap_put(unmap);
   846	
   847		atomic_inc(&pthr->dma_sync);
   848		dma_async_issue_pending(pthr->dma_chan);
   849	
   850	ret_check_tsync:
   851		return likely(atomic_read(&pthr->perf->tsync) > 0) ? 0 : -EINTR;
   852	
   853	err_free_resource:
 > 854		dmaengine_desc_put(tx);
   855		dmaengine_unmap_put(unmap);
   856	
   857		return ret;
   858	}
   859	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
