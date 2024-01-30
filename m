Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5D66D1D0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706649519; cv=none; b=rOnAqUPBBbsuR5l76CiCUPflTGo1fIIZjeprAPX002oG6IuGaWb4LMcMeDl5sLR9peVQ5ZCYXhfhTaKJ4rAblFCgAjS1rVqPnrAtGQZv1kVPBhQ6xl4r0QFDSAHTLUbDR9s0EuS8zLkv3PogXhBigrOZwiA0qi+nlwBQInyW4yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706649519; c=relaxed/simple;
	bh=qaKZ7JZXSOF5piaybfyzgPM7Y1t5U9xo6NyBAwBmmUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sRVVfwrM+R3VdPwo5VEJv3vY3gA4fYEDYKmtD4+yMZuiLFqnbSgJUSImVl5wQjRiEBH5Iglh137jFXBZeAZHIjnKORRPYJzBqXr0yP8d2LIQ2j4DGuYG/a1zB1E9mhHMsQNw4BHL5N5NNC2/vAk6dyFC2ikt86JyiXVPMxDBCAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGvtHoen; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGvtHoen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706649517; x=1738185517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qaKZ7JZXSOF5piaybfyzgPM7Y1t5U9xo6NyBAwBmmUQ=;
  b=IGvtHoenNEfqFDiZinj0fUCf0iqvi8Nga3fI2zNgDIZz3g5ThgSAekJr
   M0Eevbg2e3hwsgVIHAa0Y9Zfx6U88ndYBM0Kuby8fD+Z7w4J/cVNl59rZ
   zcs9SoEbl6/A268Mp1Lgl9KwOiggmazb627x4Vj4691BFDOt0W6eHM+5I
   iJdYLHMm9iC3fObJ1J38gm2LnS50/xuxUbmmrhwQIEvQkEBYpkoVVBYdR
   bj+iY74kECPinIld7BxAEoTb5L2qFk4TU8hNlEsdrYFk62HqNSuMbDM2c
   SgBECYB3ahGeZfsEaf5fEHPz3yzb/ZuAEw5WPU9xOma6nhVuxyDwNAb49
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10074040"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="10074040"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 13:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="907635676"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="907635676"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2024 13:18:35 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUvV2-0000q6-38;
	Tue, 30 Jan 2024 21:18:32 +0000
Date: Wed, 31 Jan 2024 05:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 20/30]
 drivers/net/ethernet/intel/libeth/rx.c:39: warning: Excess function
 parameter 'max_len' description in 'libeth_rx_page_pool_create'
Message-ID: <202401310522.mNRVimvu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   30d7705c3b30a6e802712079c94daac42a3d41ab
commit: ce037c17a195036ba2779c1969018ff1c5e3a818 [20/30] libie: add Rx buffer management (via Page Pool)
config: arc-randconfig-001-20240130 (https://download.01.org/0day-ci/archive/20240131/202401310522.mNRVimvu-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310522.mNRVimvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310522.mNRVimvu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/libeth/rx.c:39: warning: Excess function parameter 'max_len' description in 'libeth_rx_page_pool_create'


vim +39 drivers/net/ethernet/intel/libeth/rx.c

    28	
    29	/**
    30	 * libeth_rx_page_pool_create - create a PP with the default libeth settings
    31	 * @bq: buffer queue struct to fill
    32	 * @napi: &napi_struct covering this PP (no usage outside its poll loops)
    33	 * @max_len: maximum buffer size for a single descriptor
    34	 *
    35	 * Return: 0 on success, -errno on failure.
    36	 */
    37	int libeth_rx_page_pool_create(struct libeth_buf_queue *bq,
    38				       struct napi_struct *napi)
  > 39	{
    40		struct page_pool_params pp = {
    41			.flags		= PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
    42			.order		= LIBETH_RX_PAGE_ORDER,
    43			.pool_size	= bq->count,
    44			.nid		= NUMA_NO_NODE,
    45			.dev		= napi->dev->dev.parent,
    46			.netdev		= napi->dev,
    47			.napi		= napi,
    48			.dma_dir	= DMA_FROM_DEVICE,
    49			.offset		= LIBETH_SKB_HEADROOM,
    50		};
    51	
    52		/* HW-writeable / syncable length per one page */
    53		pp.max_len = LIBETH_RX_PAGE_LEN(pp.offset);
    54	
    55		/* HW-writeable length per buffer */
    56		bq->rx_buf_len = libeth_rx_hw_len(&pp, bq->rx_buf_len);
    57		/* Buffer size to allocate */
    58		bq->truesize = roundup_pow_of_two(SKB_HEAD_ALIGN(pp.offset +
    59								 bq->rx_buf_len));
    60	
    61		bq->pp = page_pool_create(&pp);
    62	
    63		return PTR_ERR_OR_ZERO(bq->pp);
    64	}
    65	EXPORT_SYMBOL_NS_GPL(libeth_rx_page_pool_create, LIBETH);
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
