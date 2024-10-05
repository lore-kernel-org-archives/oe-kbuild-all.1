Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DB7154439
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728134954; cv=none; b=qG5gfH43Jp5Eyjcc1BcW26R2s7oEHkJdXGUkd1wvGGQITPj5fYSCBe6BWUlreJ3LcQGPdPz4gjeh2O+hfofJ5y146fXYfblGhUuzBzD5fpbXHKRGxBymhZ+6vqo20n5m26M9r2G7Nqcj9TZJhQnVCbYeumXWfnxGRCYHcm8hCAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728134954; c=relaxed/simple;
	bh=YOq/kNWxjKJO2JzBOMJslze08Bs6AU1lMzBBJUVYPac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oelsjShpmMc1YmzzT8M7alWRPSOH1p8wmpzk9tiz2v6xBLgZAK0AT8kLpbGOYGzjdR0m/Pl2zloKEzPj9SouYnuoocW8IeyerNJaFQMv49OuFcMilk2SPNkKpfssJMI4nJVCOy3euN4HLwymKkQ6eOcbBBeFaylsmHmfyehJ8zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2GuOl+3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2GuOl+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728134953; x=1759670953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YOq/kNWxjKJO2JzBOMJslze08Bs6AU1lMzBBJUVYPac=;
  b=P2GuOl+3wuiRF4aAXLsg+Q51rPkVBfOb/gWv5rF358fCe9ro2NVkgqG4
   1yT+L7wZ+JS1BqHHaBiWrDC4oJKBc/oJHHxRnWBDmYbSJydnRApkt8oqU
   wNhfdO1AHjVy9WpA8/6kck7y2hDTiZUOvKjhsWon0JEb0M8B1IUF67bIU
   DEQWwtIWb7hcraScq11o/vSn/deDPFpQR/6z7RPe/NIywnnUSYJx/y1PF
   wEgut6qzQbDl1HwH25RP6Q+0SI3lV2n1r65ur9JSDTwasrsn2jZMs+5UM
   29LZI4521H9C2Le6UEWkRX91UgluxrO6pCNDD6EzPsoqLgZQwfZwyhIok
   w==;
X-CSE-ConnectionGUID: Wwt0n/rSRLG5NwhkOlSMFA==
X-CSE-MsgGUID: FgldNFSHRJiJ6N5Rx0Pd3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26844154"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="26844154"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 06:29:12 -0700
X-CSE-ConnectionGUID: uBk82wgbT623KKSSwUR9AA==
X-CSE-MsgGUID: GyvTgY4LSm2KDQnvJvm0ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="105735038"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Oct 2024 06:29:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx4qJ-0002ya-2J;
	Sat, 05 Oct 2024 13:29:07 +0000
Date: Sat, 5 Oct 2024 21:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Satish Kumar Nagireddy <satish.nagireddy.nagireddy@xilinx.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 297/1001]
 drivers/media/platform/xilinx/xilinx-scenechange-dma.c:283: warning:
 expecting prototype for scd_dma_chan_desc_cleanup(). Prototype was for
 xscd_dma_chan_desc_cleanup() instead
Message-ID: <202410052130.FkYSjxCA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 141f08660589f823c03e9e70c51357865f068a71 [297/1001] v4l: xilinx: scd: New Scene Change Detection driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241005/202410052130.FkYSjxCA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410052130.FkYSjxCA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410052130.FkYSjxCA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/xilinx/xilinx-scenechange-dma.c:283: warning: expecting prototype for scd_dma_chan_desc_cleanup(). Prototype was for xscd_dma_chan_desc_cleanup() instead
>> drivers/media/platform/xilinx/xilinx-scenechange-dma.c:323: warning: expecting prototype for xscd_dma_dma_prep_interleaved(). Prototype was for xscd_dma_prep_interleaved() instead


vim +283 drivers/media/platform/xilinx/xilinx-scenechange-dma.c

   277	
   278	/**
   279	 * scd_dma_chan_desc_cleanup - Clean channel descriptors
   280	 * @chan: Driver specific dma channel
   281	 */
   282	static void xscd_dma_chan_desc_cleanup(struct xscd_dma_chan *chan)
 > 283	{
   284		struct xscd_dma_tx_descriptor *desc, *next;
   285		unsigned long flags;
   286	
   287		spin_lock_irqsave(&chan->lock, flags);
   288	
   289		list_for_each_entry_safe(desc, next, &chan->done_list, node) {
   290			dma_async_tx_callback callback;
   291			void *callback_param;
   292	
   293			list_del(&desc->node);
   294	
   295			/* Run the link descriptor callback function */
   296			callback = desc->async_tx.callback;
   297			callback_param = desc->async_tx.callback_param;
   298			if (callback) {
   299				spin_unlock_irqrestore(&chan->lock, flags);
   300				callback(callback_param);
   301				spin_lock_irqsave(&chan->lock, flags);
   302			}
   303	
   304			kfree(desc);
   305		}
   306	
   307		spin_unlock_irqrestore(&chan->lock, flags);
   308	}
   309	
   310	/**
   311	 * xscd_dma_dma_prep_interleaved - prepare a descriptor for a
   312	 * DMA_SLAVE transaction
   313	 * @dchan: DMA channel
   314	 * @xt: Interleaved template pointer
   315	 * @flags: transfer ack flags
   316	 *
   317	 * Return: Async transaction descriptor on success and NULL on failure
   318	 */
   319	static struct dma_async_tx_descriptor *
   320	xscd_dma_prep_interleaved(struct dma_chan *dchan,
   321				  struct dma_interleaved_template *xt,
   322				  unsigned long flags)
 > 323	{
   324		struct xscd_dma_chan *chan = to_xscd_dma_chan(dchan);
   325		struct xscd_dma_tx_descriptor *desc;
   326		struct xscd_dma_desc *sw;
   327	
   328		desc = kzalloc(sizeof(*desc), GFP_KERNEL);
   329		if (!desc)
   330			return NULL;
   331	
   332		dma_async_tx_descriptor_init(&desc->async_tx, &chan->common);
   333		desc->async_tx.tx_submit = xscd_dma_tx_submit;
   334		async_tx_ack(&desc->async_tx);
   335	
   336		sw = &desc->sw;
   337		sw->vsize = xt->numf;
   338		sw->hsize = xt->sgl[0].size;
   339		sw->stride = xt->sgl[0].size + xt->sgl[0].icg;
   340		sw->luma_plane_addr = xt->src_start;
   341	
   342		return &desc->async_tx;
   343	}
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
