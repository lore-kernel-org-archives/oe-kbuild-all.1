Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6D03A7822
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778578772; cv=none; b=mhjVeZkGQ3gF3OiTGOGtdjIecmg0nQetT2V+oRTXtBd31O2IzHbZrnl2cNnrdODBi5isx1k2kiVF/uzLdy5vnx9qZtKr2fqd/yxU6apCc0U6a4xTQZX9bqok2SO0LO6LugylxillpvlEsmPPTv6AoMOaX2jOgW7pWIILABmbHi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778578772; c=relaxed/simple;
	bh=CV5DWryN+y9Y63hABQEwo0D5uKCgly+s5Uj3RScLOCE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=upmIrDvYPNfPi5lzuNcrTdFJehcQZHXyhitzNrZ9YrtoP8f4Dgv/Wyw4Y3o2G7UPvWLwHnv37FbYxRj1QxrGsaI9OPBGFhVjxI6oECoO0n606m+ypgoLmnWD65VaRUT2fbsvI22SvmVNMPpOSfHc7pwiSVH3aTYaotomVbv+qhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edTdlxov; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edTdlxov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778578769; x=1810114769;
  h=date:from:to:cc:subject:message-id;
  bh=CV5DWryN+y9Y63hABQEwo0D5uKCgly+s5Uj3RScLOCE=;
  b=edTdlxovH8ohbFzsJlthDIWZbHpSb5eayIBTymfB/9Zh3wk2+yrtr+vS
   NAkDgQlIACipmZyal6w2FNmqzAhxhKZyIdYg4O7jRWk3X53SZU5ZHxwMl
   PBQ9yLfuKtdljpvI0MP2Kn3GBUL8WdhMzoV7La8NvUvqwylr1BRP20GpB
   KEtyX1bnPl+E8SL6a2BIGpiwq1wVmg14ValpqO3BWNqgIgTwLicJ5OthC
   1JmadWJ8JUmhzuqscQ98jQ63V1D7fHZBwpwuHbCniFFoKE7Cw/szCcBbY
   o8QRNn++Lr5DFsfSNdwdf+iIbB8HzMbiNrYssIqAZP8j9LJ5PYwiW97Dd
   g==;
X-CSE-ConnectionGUID: Ipb3/IzGSQup4ciiJtBSDQ==
X-CSE-MsgGUID: fDsDs1u8RvaObQSEbnCEqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79200332"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79200332"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 02:39:27 -0700
X-CSE-ConnectionGUID: YVwmGb0eSVyA0Lh6efQvKw==
X-CSE-MsgGUID: lehxbHiyQCGp+zvUYa2dkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="233241679"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 May 2026 02:39:25 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMjaE-000000001wC-3VI8;
	Tue, 12 May 2026 09:39:22 +0000
Date: Tue, 12 May 2026 17:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v4 14/17]
 drivers/nvme/host/pci.c:893:25: error: implicit declaration of function
 '__dma_sync_single_for_cpu'; did you mean 'dma_sync_single_for_cpu'?
Message-ID: <202605121735.alwDeYNW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v4
head:   d7beabda16cb470d93299bcb5ea0faf34e3f2e48
commit: b9a3b61cfd3e5e580e511290d6600bc16b72807a [14/17] nvme-pci: implement dma_token backed requests
config: i386-randconfig-011-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121735.alwDeYNW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121735.alwDeYNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121735.alwDeYNW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/pci.c: In function 'nvme_dmabuf_map_sync':
>> drivers/nvme/host/pci.c:893:25: error: implicit declaration of function '__dma_sync_single_for_cpu'; did you mean 'dma_sync_single_for_cpu'? [-Wimplicit-function-declaration]
     893 |                         __dma_sync_single_for_cpu(dev, dma_addr,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                         dma_sync_single_for_cpu
>> drivers/nvme/host/pci.c:896:25: error: implicit declaration of function '__dma_sync_single_for_device'; did you mean 'dma_sync_single_for_device'? [-Wimplicit-function-declaration]
     896 |                         __dma_sync_single_for_device(dev, dma_addr,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         dma_sync_single_for_device


vim +893 drivers/nvme/host/pci.c

   869	
   870	static void nvme_dmabuf_map_sync(struct nvme_dev *nvme_dev, struct request *req,
   871					 bool for_cpu)
   872	{
   873		int length = blk_rq_payload_bytes(req);
   874		struct device *dev = nvme_dev->dev;
   875		enum dma_data_direction dma_dir;
   876		struct bio *bio = req->bio;
   877		struct nvme_dmabuf_map *map;
   878		dma_addr_t *dma_list;
   879		int offset, map_idx;
   880	
   881		dma_dir = rq_data_dir(req) == READ ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
   882		map = container_of(bio->dmabuf_map, struct nvme_dmabuf_map, base);
   883		dma_list = map->dma_list;
   884	
   885		offset = bio->bi_iter.bi_bvec_done;
   886		map_idx = offset / NVME_CTRL_PAGE_SIZE;
   887		length += offset & (NVME_CTRL_PAGE_SIZE - 1);
   888	
   889		while (length > 0) {
   890			u64 dma_addr = dma_list[map_idx++];
   891	
   892			if (for_cpu)
 > 893				__dma_sync_single_for_cpu(dev, dma_addr,
   894							  NVME_CTRL_PAGE_SIZE, dma_dir);
   895			else
 > 896				__dma_sync_single_for_device(dev, dma_addr,
   897							     NVME_CTRL_PAGE_SIZE,
   898							     dma_dir);
   899			length -= NVME_CTRL_PAGE_SIZE;
   900		}
   901	}
   902	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
