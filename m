Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB6F194A43
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 18:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729449066; cv=none; b=bg7erIg4bKUpmTdL31aM582RlVm3HP5/jA1fm/TDQPFTjRmmypArHTvi89mHSAwSvQOYq6wV6CQGcBWC8aUmgTg9fFmuzmB5y02oG4Isluy2ROwkrRr/BvflBMNQbYt5IN8meXJTPqAiXw+L5KA7inYUEsfjzbHDbzMFiXYCxFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729449066; c=relaxed/simple;
	bh=vuNEEOjjHC0A9ncRqzuI7nvJPoqSL2dBQIR1T2Oj6Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wu0s4kQSJJSZyvSo23W9RTwFqIqGpKPmbB5yCkBp0d5Zlh03+2VXdD/x9ZCJlU+oFOU9bym7YV31ypzBt64TyIl7kSXUX5bdC2Q/GP33xQ7+HXcnZ5l53FAVUAPyS1KJqv5kSXMtR36k2Az7qLdbxaNLgkPjnFn8FEKOPI5TNkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfiwkFml; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfiwkFml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729449064; x=1760985064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vuNEEOjjHC0A9ncRqzuI7nvJPoqSL2dBQIR1T2Oj6Rg=;
  b=GfiwkFmlAiH5F7F/rwYFD7rE2GB/WdTJZk8yaq62X8+A2wVfZXkttior
   8JQuNyoUiSA1x9TzAV1qB1b+4ok2ssbwvu7Nf6fr2XmG88oKTUKvtO/j8
   eUh4JzWtP3jYiSzac+WByOBWsrovuS4K9yDkNYofhhf6gYqGXfmFaVyt2
   RhZ891tJ+wmeopzMI/weVB5P4/MDpj/VrCWrxRyX67QsY5YjDztRUqrxl
   R00GyCjFbAcO7XBfmSM5nxqJX5jvfQo3/4+LYJ2YwVA9lgkuDYXfaF1tT
   gbuLn9v73WupdfE83cZgG+aaqiBdObFBHO+7wkDX7GBT9c2iRmZlsImwF
   A==;
X-CSE-ConnectionGUID: BfhgbbR/RQCRJr187TC5CA==
X-CSE-MsgGUID: 702pHnQoQx63XTePX6l1wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="32840921"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="32840921"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 11:31:03 -0700
X-CSE-ConnectionGUID: yvENeH8eQVKNgfjNz5J46g==
X-CSE-MsgGUID: t6tup9k7TliteAGuBhZ6RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="116786917"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2024 11:31:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2ahg-000Qgv-1C;
	Sun, 20 Oct 2024 18:31:00 +0000
Date: Mon, 21 Oct 2024 02:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-split-wip 7/8] block/blk-merge.c:571:9: error: too
 many arguments to function 'dma_iova_sync'
Message-ID: <202410210219.RtPGckO5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-split-wip
head:   9fc25a7b75656585da9e0c3d06d09c93581585f5
commit: d50f6fc2c4dd093d5e21baefd10df6df2cb31cc7 [7/8] FOLD: remove the mapped_size counter
config: sh-randconfig-r073-20241021 (https://download.01.org/0day-ci/archive/20241021/202410210219.RtPGckO5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210219.RtPGckO5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210219.RtPGckO5-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/blk-merge.c: In function 'blk_rq_dma_map_iova':
>> block/blk-merge.c:571:9: error: too many arguments to function 'dma_iova_sync'
     571 |         dma_iova_sync(dma_dev, state, 0, mapped, 0);
         |         ^~~~~~~~~~~~~
   In file included from include/linux/pci.h:2676,
                    from include/linux/pci-p2pdma.h:14,
                    from include/linux/blk-mq-dma.h:6,
                    from block/blk-merge.c:10:
   include/linux/dma-mapping.h:333:19: note: declared here
     333 | static inline int dma_iova_sync(struct device *dev,
         |                   ^~~~~~~~~~~~~
   block/blk-merge.c:575:9: error: too many arguments to function 'dma_iova_sync'
     575 |         dma_iova_sync(dma_dev, state, 0, mapped, error);
         |         ^~~~~~~~~~~~~
   include/linux/dma-mapping.h:333:19: note: declared here
     333 | static inline int dma_iova_sync(struct device *dev,
         |                   ^~~~~~~~~~~~~


vim +/dma_iova_sync +571 block/blk-merge.c

   546	
   547	static bool blk_rq_dma_map_iova(struct request *req, struct device *dma_dev,
   548			struct dma_iova_state *state, struct blk_dma_iter *iter,
   549			struct phys_vec *vec)
   550	{
   551		unsigned int total_len = blk_rq_payload_bytes(req);
   552		enum dma_data_direction dir = rq_dma_dir(req);
   553		unsigned int mapped = 0;
   554		int error = 0;
   555	
   556		iter->len = total_len;
   557		iter->addr = dma_iova_alloc(dma_dev, state, vec->paddr, total_len);
   558		if (dma_mapping_error(dma_dev, iter->addr)) {
   559			iter->status = BLK_STS_RESOURCE;
   560			return false;
   561		}
   562	
   563		do {
   564			error = dma_iova_link(dma_dev, state, vec->paddr, mapped,
   565					vec->len, dir, 0);
   566			if (error)
   567				goto fail;
   568			mapped += vec->len;
   569		} while (blk_map_iter_next(req, &iter->iter, vec));
   570	
 > 571		dma_iova_sync(dma_dev, state, 0, mapped, 0);
   572		return true;
   573	
   574	fail:
   575		dma_iova_sync(dma_dev, state, 0, mapped, error);
   576		iter->status = errno_to_blk_status(error);
   577		return false;
   578	}
   579	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
