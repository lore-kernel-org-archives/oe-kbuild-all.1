Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B715F9440
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Dec 2023 04:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWF/lGjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703305281; x=1734841281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qRnh6hca/WvdxRw+YS1DTQphCmg5T3LVn1o4cP1SBko=;
  b=fWF/lGjNklGob5ToHsY2DtOTcWdrvk4Nq5zLAeMPTgVdWAsihgH7aYZ7
   Jouj3YOhFRcFF7WyWUtVc0LBpIhsmVmiDzjlIhf9eS0qmlWy+etHBDWm8
   ya6IIAMGxEymZRAEmd8x2iyS7jA1O+YGIrrWJmh9WtqVn6Vvyipjwl680
   4/69+oBP3Z+7LX9YADBrMtHA3HRmpDcAO1vY9EOp/nt//KyvaWhA/Rq5N
   +27XDR3ciWKPtiShvQUYQ8vxZx/ecBTIGnBtK3QmB6EBLwcdsaUl97pN9
   eYzCQjq2s8UddnPT+NUK382SNL5gLrwAjjQJhB0Kr7Bw319McEVU44OQe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="398965809"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="398965809"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 20:21:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="806186474"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="806186474"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Dec 2023 20:21:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGtVW-000AG1-2L;
	Sat, 23 Dec 2023 04:21:09 +0000
Date: Sat, 23 Dec 2023 12:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kuliga <jankul@alatek.krakow.pl>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 9985/10295] drivers/dma/xilinx/xdma.c:729:1:
 warning: no previous prototype for 'xdma_prep_interleaved_dma'
Message-ID: <202312231258.L3C56jBw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 01e6d907656134949c4126e7fd64984d4daa4c1e [9985/10295] dmaengine: xilinx: xdma: Implement interleaved DMA transfers
config: csky-buildonly-randconfig-r004-20230509 (https://download.01.org/0day-ci/archive/20231223/202312231258.L3C56jBw-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312231258.L3C56jBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312231258.L3C56jBw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/xilinx/xdma.c:729:1: warning: no previous prototype for 'xdma_prep_interleaved_dma' [-Wmissing-prototypes]
     729 | xdma_prep_interleaved_dma(struct dma_chan *chan,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xdma_prep_interleaved_dma +729 drivers/dma/xilinx/xdma.c

   721	
   722	/**
   723	 * xdma_prep_interleaved_dma - Prepare virtual descriptor for interleaved DMA transfers
   724	 * @chan: DMA channel
   725	 * @xt: DMA transfer template
   726	 * @flags: tx flags
   727	 */
   728	struct dma_async_tx_descriptor *
 > 729	xdma_prep_interleaved_dma(struct dma_chan *chan,
   730				  struct dma_interleaved_template *xt,
   731				  unsigned long flags)
   732	{
   733		int i;
   734		u32 desc_num = 0, period_size = 0;
   735		struct dma_async_tx_descriptor *tx_desc;
   736		struct xdma_chan *xchan = to_xdma_chan(chan);
   737		struct xdma_desc *sw_desc;
   738		u64 src_addr, dst_addr;
   739	
   740		for (i = 0; i < xt->frame_size; ++i)
   741			desc_num += DIV_ROUND_UP(xt->sgl[i].size, XDMA_DESC_BLEN_MAX);
   742	
   743		sw_desc = xdma_alloc_desc(xchan, desc_num, false);
   744		if (!sw_desc)
   745			return NULL;
   746		sw_desc->dir = xt->dir;
   747		sw_desc->interleaved_dma = true;
   748		sw_desc->cyclic = flags & DMA_PREP_REPEAT;
   749		sw_desc->frames_left = xt->numf;
   750		sw_desc->periods = xt->numf;
   751	
   752		desc_num = 0;
   753		src_addr = xt->src_start;
   754		dst_addr = xt->dst_start;
   755		for (i = 0; i < xt->frame_size; ++i) {
   756			desc_num += xdma_fill_descs(sw_desc, src_addr, dst_addr, xt->sgl[i].size, desc_num);
   757			src_addr += dmaengine_get_src_icg(xt, &xt->sgl[i]) + xt->src_inc ?
   758								      xt->sgl[i].size : 0;
   759			dst_addr += dmaengine_get_dst_icg(xt, &xt->sgl[i]) + xt->dst_inc ?
   760								      xt->sgl[i].size : 0;
   761			period_size += xt->sgl[i].size;
   762		}
   763		sw_desc->period_size = period_size;
   764	
   765		tx_desc = vchan_tx_prep(&xchan->vchan, &sw_desc->vdesc, flags);
   766		if (tx_desc)
   767			return tx_desc;
   768	
   769		xdma_free_desc(&sw_desc->vdesc);
   770		return NULL;
   771	}
   772	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
