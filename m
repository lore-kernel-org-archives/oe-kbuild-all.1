Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745053C2763
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 05:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777959479; cv=none; b=ot/GSUWTdwk065ElQDZ7QWWuA07duasBkD6YOfSEl7AaPSzDkltURAjpAZbpSgGzfDPWAC/OsxSgrguW+bHvxSv/aSdMDKl+yyKVgWxmkHGmkk0pvK+GPr2PKSGX/lkaAcL1vImXvAmIAgV12p5cPjKSMT6iKNwgrdgorm/6MXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777959479; c=relaxed/simple;
	bh=c2BquUQTrtAP00/WigsyWvlpA82XaGp9uhgvSizA0HE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YD8Ga6SbMSJabjc3gjRKWLNLwcw/iALr2Yg0mwW4UjKC+5bbfCSKZDG9uKsGMhn1voCM2aSUjMxLcIEu1iOdJk/NLnSXxpI/WGNrFUN8ydnVsj42jvWPN5nTDFHOs9/ObGvUrK6IwZhqKd4vVIL3XYHtHGPj520TMxA4TqY/J90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYs01Yuw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYs01Yuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777959477; x=1809495477;
  h=date:from:to:cc:subject:message-id;
  bh=c2BquUQTrtAP00/WigsyWvlpA82XaGp9uhgvSizA0HE=;
  b=TYs01Yuwr0c09zkBrwD+RLjW/tJhu5RXR1H2jm26Uq4Nn8DR+uLrVy5b
   VPY5XEYFY3u6KxEWlcM0D2qLPry7Lx3kySx52b0R2gQVeAjjXxkqxDb0t
   R48/hS2rxHfn+M8sCKUlmDmsVF1dOvwofX8wPv5N0sKBDqq1VX8gAs9a8
   Bk61wdo8WMs7LUG8PI6zq4yfWDlovsR7LRsTJZ+bkgWZllkgy2gqBO8So
   3E9j5TtZyA6aGxKRxcQ+vRZiyGthSdvccMMOI8aO2ZedLwKLkJVRWfXIJ
   l3kHtXJHbpR+WbZyfs8bK+QSJLELUDYzf5qw4sz/8q3CoHqD+mQQDNdZX
   Q==;
X-CSE-ConnectionGUID: p8QjBz12SzWgc2Jo1BVm5g==
X-CSE-MsgGUID: eBs3DzHmR/qBeFXqKGX5EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78758813"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78758813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 22:37:56 -0700
X-CSE-ConnectionGUID: n9aRxF71QtGy9pexg4ogZg==
X-CSE-MsgGUID: z3c6apIfQ/y/hoRaWSrpqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="259067653"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 May 2026 22:37:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK8Tg-0000000069t-1x3C;
	Tue, 05 May 2026 05:37:52 +0000
Date: Tue, 05 May 2026 07:37:31 +0200
From: kernel test robot <lkp@intel.com>
To: Zhiping Zhang <zhipingz@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/infiniband/hw/mlx5/mr.c:913:25: error: 'struct
 pci_dev' has no member named 'tph_req_type'
Message-ID: <202605050702.yzjt9XXC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Zhiping-Zhang/vfio-add-dma-buf-get_tph-callback-and-DMA_BUF_TPH-feature/20260505-063643
head:   b58a906ae381ef91f4e88afd4862bee58a0c7bf2
commit: b58a906ae381ef91f4e88afd4862bee58a0c7bf2 RDMA/mlx5: get tph for p2p access when registering dma-buf mr
date:   7 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260505/202605050702.yzjt9XXC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050702.yzjt9XXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605050702.yzjt9XXC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/hw/mlx5/mr.c: In function 'get_tph_mr_dmabuf':
>> drivers/infiniband/hw/mlx5/mr.c:913:25: error: 'struct pci_dev' has no member named 'tph_req_type'
     913 |         st_width = (pdev->tph_req_type == PCI_TPH_REQ_EXT_TPH) ? 16 : 8;
         |                         ^~


vim +913 drivers/infiniband/hw/mlx5/mr.c

   903	
   904	static void get_tph_mr_dmabuf(struct mlx5_ib_dev *dev, int fd, u16 *st_index,
   905				      u8 *ph)
   906	{
   907		struct pci_dev *pdev = dev->mdev->pdev;
   908		struct dma_buf *dmabuf;
   909		u16 steering_tag;
   910		u8 st_width;
   911		int ret;
   912	
 > 913		st_width = (pdev->tph_req_type == PCI_TPH_REQ_EXT_TPH) ? 16 : 8;
   914	
   915		dmabuf = dma_buf_get(fd);
   916		if (IS_ERR(dmabuf))
   917			return;
   918	
   919		if (!dmabuf->ops->get_tph)
   920			goto end_dbuf_put;
   921	
   922		ret = dmabuf->ops->get_tph(dmabuf, &steering_tag, ph, st_width);
   923		if (ret) {
   924			mlx5_ib_dbg(dev, "get_tph failed (%d)\n", ret);
   925			goto end_dbuf_put;
   926		}
   927	
   928		ret = mlx5_st_alloc_index_by_tag(dev->mdev, steering_tag, st_index);
   929		if (ret) {
   930			*ph = MLX5_IB_NO_PH;
   931			mlx5_ib_dbg(dev, "st_alloc_index_by_tag failed (%d)\n", ret);
   932		}
   933	
   934	end_dbuf_put:
   935		dma_buf_put(dmabuf);
   936	}
   937	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
