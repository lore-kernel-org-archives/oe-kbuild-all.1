Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710FE2CA7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Dec 2023 22:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXFOxqwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703284253; x=1734820253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GB2y/ewdiroxZqqb1HiLugkIEwuWZU9aFhjCf4awwag=;
  b=MXFOxqwF3QtV36t3J0Nx1Fb+nRwOU9yCGC+fsFHixBT4VVho2u6JFOh1
   MUzz77a80sLBhs3kOh5TqU1GwUew4L9NbctKnwqIAysSGuwTureIWyjSS
   fcSu45nQ0vYOHnK4laaesKG3w5ij8uwtFgxaR5V7kbBd+hKAtvza8ebfD
   aLW5lazJc4CB5vw8olUVvtSSMLfj4YIY4FGszi+X/pfY8wwyKjx9LWy/F
   Y+Xl7kJ4WlQ0vXsfK+YOFKpinhC2+vgVpJxvOFEGIAVrSK/I0rnngbacq
   EpVfUJnnwSCw4swMnNpBgaN+ywyhFYO4BGDKwJazlsUQ61sISB9PJX6ck
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="3415922"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="3415922"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 14:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="950414492"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="950414492"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Dec 2023 14:30:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGo2b-0009vs-0D;
	Fri, 22 Dec 2023 22:30:49 +0000
Date: Sat, 23 Dec 2023 06:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kuliga <jankul@alatek.krakow.pl>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 9984/10295] drivers/dma/xilinx/xdma.c:555:
 warning: Function parameter or struct member 'sw_desc' not described in
 'xdma_fill_descs'
Message-ID: <202312230634.3AIMQ3OP-lkp@intel.com>
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
commit: fa88abfd0d03fea8b800ff1df4f161c804d24c8a [9984/10295] dmaengine: xilinx: xdma: Prepare the introduction of interleaved DMA transfers
config: csky-buildonly-randconfig-r004-20230509 (https://download.01.org/0day-ci/archive/20231223/202312230634.3AIMQ3OP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230634.3AIMQ3OP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230634.3AIMQ3OP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/xilinx/xdma.c:555: warning: Function parameter or struct member 'sw_desc' not described in 'xdma_fill_descs'
>> drivers/dma/xilinx/xdma.c:555: warning: Function parameter or struct member 'src_addr' not described in 'xdma_fill_descs'
>> drivers/dma/xilinx/xdma.c:555: warning: Function parameter or struct member 'dst_addr' not described in 'xdma_fill_descs'
>> drivers/dma/xilinx/xdma.c:555: warning: Function parameter or struct member 'size' not described in 'xdma_fill_descs'
>> drivers/dma/xilinx/xdma.c:555: warning: Function parameter or struct member 'filled_descs_num' not described in 'xdma_fill_descs'


vim +555 drivers/dma/xilinx/xdma.c

   544	
   545	/**
   546	 * xdma_fill_descs - Fill hardware descriptors with contiguous memory block addresses
   547	 * @sw_desc - tx descriptor state container
   548	 * @src_addr - Value for a ->src_addr field of a first descriptor
   549	 * @dst_addr - Value for a ->dst_addr field of a first descriptor
   550	 * @size - Total size of a contiguous memory block
   551	 * @filled_descs_num - Number of filled hardware descriptors for corresponding sw_desc
   552	 */
   553	static inline u32 xdma_fill_descs(struct xdma_desc *sw_desc, u64 src_addr,
   554					  u64 dst_addr, u32 size, u32 filled_descs_num)
 > 555	{
   556		u32 left = size, len, desc_num = filled_descs_num;
   557		struct xdma_desc_block *dblk;
   558		struct xdma_hw_desc *desc;
   559	
   560		dblk = sw_desc->desc_blocks + (desc_num / XDMA_DESC_ADJACENT);
   561		desc = dblk->virt_addr;
   562		desc += desc_num & XDMA_DESC_ADJACENT_MASK;
   563		do {
   564			len = min_t(u32, left, XDMA_DESC_BLEN_MAX);
   565			/* set hardware descriptor */
   566			desc->bytes = cpu_to_le32(len);
   567			desc->src_addr = cpu_to_le64(src_addr);
   568			desc->dst_addr = cpu_to_le64(dst_addr);
   569			if (!(++desc_num & XDMA_DESC_ADJACENT_MASK))
   570				desc = (++dblk)->virt_addr;
   571			else
   572				desc++;
   573	
   574			src_addr += len;
   575			dst_addr += len;
   576			left -= len;
   577		} while (left);
   578	
   579		return desc_num - filled_descs_num;
   580	}
   581	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
