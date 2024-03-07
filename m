Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A1312BE9A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 21:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709846803; cv=none; b=gT6efjyTsYVpY8UE1Xnlj17KosF/ZbbiZBR3LYfcdJo/8Hw04mlqoYJqBpqSO47I0l5lePg9LDGHBleI8qx0ZVm7tEzH1G1MP/+GuIdUS0GR+eBj4lcxwtJeMWyGfgvNetGFpFiV4bBDhLXzUAg5/EhVLc/VgYvYzuzo3W8NgOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709846803; c=relaxed/simple;
	bh=l5Ggfxzvzcv4SSKDvhFVQstG5fPsy4afmpF/03EmjxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FiKOL/5Hs0Wt0kmdF53TtpH5I4BshvYu9NDeasKRlXTugw7BkfC7eORoti5jHgtLRFM6ZQ+1n9x9sfzP6+C3T3W3wJWi7sNQhVG7gHDjcbbGZIxyBytTaVW2iCke+UPX/02fOfndQIHBYlAsqxrgFBgppokBHKuPMuJUjUShluk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxSha6Gi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxSha6Gi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709846802; x=1741382802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l5Ggfxzvzcv4SSKDvhFVQstG5fPsy4afmpF/03EmjxI=;
  b=cxSha6Gi2cMCPgRnd0/kPJsShZET72rHU6IWTq9ZSneKa/N/3St0UaV9
   FjKNfSZkZPqA32FXocYI1EfWpnZRCeR4WUFOmegcdXHEr0k+n5fniMWg1
   02VZshVaWWgJkdsxhiZaHl6T2hwoGtoKO27PAdhhNMEtTTqtZtpXQzlX2
   B14bhkEaAtHXvoztKhGl/gJrSHAu05B0xjWExbGOzyQgbw/whR9J3u7Vp
   eeGf37d9At4ppFq12PXYGBhAfrhfOni6Fe6S0O7AeNhdn7nqJDbRDHDPz
   YRGiM55PGDx5P4IDhuTKGXN4Irr+D7c8k52c2jsnQc3uRBgJfyMXSAfT4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4473430"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4473430"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 13:26:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="10140851"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2024 13:26:22 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riLFr-0005if-1Z;
	Thu, 07 Mar 2024 21:26:19 +0000
Date: Fri, 8 Mar 2024 05:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 6/61]
 drivers/net/ethernet/intel/libeth/rx.c:38: warning: Function parameter or
 struct member 'fq' not described in 'libeth_rx_page_pool_create'
Message-ID: <202403080535.EjWcUNcJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   f0c4d376aeaf6cba04a656f613dcc90d2ee9da2d
commit: cffb67007609e22c89004299da23c09dce3072e5 [6/61] libeth: add Rx buffer management
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240308/202403080535.EjWcUNcJ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080535.EjWcUNcJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080535.EjWcUNcJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/libeth/rx.c:38: warning: Function parameter or struct member 'fq' not described in 'libeth_rx_page_pool_create'
>> drivers/net/ethernet/intel/libeth/rx.c:38: warning: Excess function parameter 'bq' description in 'libeth_rx_page_pool_create'


vim +38 drivers/net/ethernet/intel/libeth/rx.c

    28	
    29	/**
    30	 * libeth_rx_page_pool_create - create a PP with the default libeth settings
    31	 * @bq: buffer queue struct to fill
    32	 * @napi: &napi_struct covering this PP (no usage outside its poll loops)
    33	 *
    34	 * Return: 0 on success, -errno on failure.
    35	 */
    36	int libeth_rx_page_pool_create(struct libeth_fq *fq,
    37				       struct napi_struct *napi)
  > 38	{
    39		struct page_pool_params pp = {
    40			.flags		= PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
    41			.order		= LIBETH_RX_PAGE_ORDER,
    42			.pool_size	= fq->count,
    43			.nid		= NUMA_NO_NODE,
    44			.dev		= napi->dev->dev.parent,
    45			.netdev		= napi->dev,
    46			.napi		= napi,
    47			.dma_dir	= DMA_FROM_DEVICE,
    48			.offset		= LIBETH_SKB_HEADROOM,
    49		};
    50		struct libeth_fqe *fqes;
    51		struct page_pool *pool;
    52	
    53		/* HW-writeable / syncable length per one page */
    54		pp.max_len = LIBETH_RX_PAGE_LEN(pp.offset);
    55	
    56		/* HW-writeable length per buffer */
    57		fq->buf_len = libeth_rx_hw_len(&pp, fq->buf_len);
    58		/* Buffer size to allocate */
    59		fq->truesize = roundup_pow_of_two(SKB_HEAD_ALIGN(pp.offset +
    60								 fq->buf_len));
    61	
    62		pool = page_pool_create(&pp);
    63		if (IS_ERR(pool))
    64			return PTR_ERR(pool);
    65	
    66		fqes = kcalloc(fq->count, sizeof(*fqes), GFP_KERNEL);
    67		if (!fqes)
    68			goto err_buf;
    69	
    70		fq->fqes = fqes;
    71		fq->pp = pool;
    72	
    73		return 0;
    74	
    75	err_buf:
    76		page_pool_destroy(pool);
    77	
    78		return -ENOMEM;
    79	}
    80	EXPORT_SYMBOL_NS_GPL(libeth_rx_page_pool_create, LIBETH);
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
