Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0061F3FC8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753100541; cv=none; b=YLKqppLiA5jLznumb6e0dyT2O5UPffm1yXVI63bYwJRFek69Ewyh4oyBjCPZVwavOh1pvzHioPz9VwOyM9JxBdZ3HC36GxNj3vSMxrYDVgrezCAcYnEe40wwCnKoZRZrIr9SfHS0iVYTqajdSyx2Juely7ECgN9WBHMRLhDZhBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753100541; c=relaxed/simple;
	bh=RgBGIj4sfqip5fByAjyP2WGDDt9+piGg4z47XgQxbvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GUrz6iivaphZeK2PzpMv/Qmh605wM6cqIVXhXvf821JBDbZZjDp3USp+ELmGgeCvvGvnRD10xl6i89qmyTnHBKf/8LpAfCn/FUk+a1JOPOs8fmW7powX32sFwCKUa0Mr29XskG2ZHJdZeIb/duJMfbOL8eidFKWpbvEmHWw9y5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXcyisn0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXcyisn0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753100540; x=1784636540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RgBGIj4sfqip5fByAjyP2WGDDt9+piGg4z47XgQxbvQ=;
  b=dXcyisn0V/Maq2mNxI17aWrIShpuczmnKc/OWAy0cGWJ9Q23Yo1JNyM0
   hJhHFtrTt7kEoTNsKxWvQcyHj4o71c+M0yPWVtIq77y9x9DNv4f8aiX6Z
   X21Ary5+ZNsuKLayN91++JS6pXf6H7sM9W9zhBTwIt5WgNkJZD8bP6DiH
   YiTChO0DWsLsJpVwGsfSjklp+tu38OS5dpexjXUOwNF+UoFAQkZ6NguGr
   mnd6YaZkMD+WAZGHkom5p0/L50RHOTHBJbUo8ylAhdAn2t3gtbuS4s8bt
   8KF+0RJ3qY7u3+BbhJZTkWritLN2IlNqT5wtsUWFQ0CQxPWGKBhhEk+OT
   w==;
X-CSE-ConnectionGUID: W7XWSfUXQFqIDbirmyro7Q==
X-CSE-MsgGUID: NMYdUuZSR1uSwnrhgCcyQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66661535"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="66661535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 05:22:19 -0700
X-CSE-ConnectionGUID: PWhYLEILTHaK9jtY1XSU1Q==
X-CSE-MsgGUID: 09S+JiC/QMqGdkTEfwbIgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="159373996"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2025 05:22:19 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udpX6-000Gn7-1l;
	Mon, 21 Jul 2025 12:22:16 +0000
Date: Mon, 21 Jul 2025 20:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:dmabuf-rw/v1-test 10/17] drivers/nvme/host/pci.c:661:25:
 error: implicit declaration of function '__dma_sync_single_for_cpu'; did you
 mean 'dma_sync_single_for_cpu'?
Message-ID: <202507212025.uzbhJaVf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux dmabuf-rw/v1-test
head:   15efa838854bfd4d3826df4753a884b531b74880
commit: e3bb5f806418a281c6753e822b6e06f6f08f1fd0 [10/17] nvme-pci: add support for user passed dma vectors
config: i386-randconfig-141-20250721 (https://download.01.org/0day-ci/archive/20250721/202507212025.uzbhJaVf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507212025.uzbhJaVf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507212025.uzbhJaVf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/pci.c: In function 'nvme_sync_dma':
>> drivers/nvme/host/pci.c:661:25: error: implicit declaration of function '__dma_sync_single_for_cpu'; did you mean 'dma_sync_single_for_cpu'? [-Werror=implicit-function-declaration]
     661 |                         __dma_sync_single_for_cpu(dev, dma_addr, dma_len, dir);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                         dma_sync_single_for_cpu
>> drivers/nvme/host/pci.c:663:25: error: implicit declaration of function '__dma_sync_single_for_device'; did you mean 'dma_sync_single_for_device'? [-Werror=implicit-function-declaration]
     663 |                         __dma_sync_single_for_device(dev, dma_addr,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         dma_sync_single_for_device
   cc1: some warnings being treated as errors


vim +661 drivers/nvme/host/pci.c

   639	
   640	static void nvme_sync_dma(struct nvme_dev *nvme_dev, struct request *req,
   641				  enum dma_data_direction dir)
   642	{
   643		bool for_cpu = dir == DMA_FROM_DEVICE;
   644		struct device *dev = nvme_dev->dev;
   645		struct bio *bio = req->bio;
   646		int offset, length;
   647		struct dmavec *dmav;
   648	
   649		if (!dma_dev_need_sync(dev))
   650			return;
   651	
   652		offset = bio->bi_iter.bi_bvec_done;
   653		length = blk_rq_payload_bytes(req);
   654		dmav = &bio->bi_dmavec[bio->bi_iter.bi_idx];
   655	
   656		while (length) {
   657			u64 dma_addr = dmav->addr + offset;
   658			int dma_len = min(dmav->len - offset, length);
   659	
   660			if (for_cpu)
 > 661				__dma_sync_single_for_cpu(dev, dma_addr, dma_len, dir);
   662			else
 > 663				__dma_sync_single_for_device(dev, dma_addr,
   664							     dma_len, dir);
   665	
   666			length -= dma_len;
   667		}
   668	}
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
