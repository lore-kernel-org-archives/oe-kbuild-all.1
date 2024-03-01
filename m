Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC062B9B9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 01:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709256313; cv=none; b=TvRpVIbQ0xlcQgmnDaJaFK4+eNKtmoQUVWMpTBcYsUzNindEf5BF/jkF/4FZeduqIAe6DiTeEGoMthq3sIKA9nNGil9UJjd2htazt+83YxSK90GeGf3NxerSgxfE/svk4gWdjJspAKH+2RbA0a+SwEJq72P+4WNz74drKkUmBYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709256313; c=relaxed/simple;
	bh=GYt8IivvBjOikikpKR3lFA/ZJDyna9NWWkXdDupWKyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MnRBVL5zbGMdwLPo/+yCu5LeCTbxElOTEBRDK66SHcvkvpwdEGddpOU3oWX74pVjIKH9OWyaik+kHHCZasXPjYc8fPViVTVBu5Sy9r0FCq6ShtkkhUX/mD+ub+DBL6i6inUhrXDN22B80HqU+qb3PBwZdW1nPKuD5MPE6iClh2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZHopLX/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZHopLX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709256312; x=1740792312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GYt8IivvBjOikikpKR3lFA/ZJDyna9NWWkXdDupWKyQ=;
  b=iZHopLX/ppFb93LH6OpwtIJ/aYxIwaZYu8R3MKtg2MW0qnCkWixeMCg5
   gaOhCxWv1S3ZfgtDbCQKfDMXbcMpXh6z9jkBQHzIBbi1/NCG8G2qhObED
   mEO3m1o3HQ8eof7yI6naRILnXYPVOLonCzMQZGXNzw6Jf7AHkC5EM+zpk
   9ZHXAPHr9H1QmNFMF4SpJaPMwa52wNzo4b+Oyo65uQOGeChriDYMyoESn
   t4BNwNRN6ukR6JclCz4GTbOJNOgk+WhMcPnnbZttoeLi1CWQ4pzJGIll/
   k9+unlgvxVj7BZHYiPi998I52DCt51BaFT0dU/lG05n98PvVrFopbLBbO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="15209343"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="15209343"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 17:25:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="45576564"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Feb 2024 17:25:10 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfrcM-000DQH-30;
	Fri, 01 Mar 2024 01:23:48 +0000
Date: Fri, 1 Mar 2024 09:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie-new 71/72]
 drivers/net/ethernet/intel/idpf/idpf_xsk.c:280: warning: expecting prototype
 for idpf_check_alloc_rx_buffers_zc(). Prototype was for idpf_xsk_bufs_init()
 instead
Message-ID: <202403010956.b5SrptMz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   4f5b0ffad42edcd350b108d426044e00b0d80809
commit: b7c6db5781926c1802dd865aeaacf65b0b573e93 [71/72] idpf: implement Rx path for AF_XDP
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403010956.b5SrptMz-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010956.b5SrptMz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010956.b5SrptMz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_xsk.c:280: warning: expecting prototype for idpf_check_alloc_rx_buffers_zc(). Prototype was for idpf_xsk_bufs_init() instead


vim +280 drivers/net/ethernet/intel/idpf/idpf_xsk.c

   271	
   272	/**
   273	 * idpf_check_alloc_rx_buffers_zc - allocate a number of Rx buffers with logs
   274	 * @bufq: buffer queue
   275	 *
   276	 * Wrapper for internal allocation routine; Prints out logs, if allocation
   277	 * did not go as expected
   278	 */
   279	int idpf_xsk_bufs_init(struct idpf_buf_queue *bufq)
 > 280	{
   281		bufq->xsk_buf = kcalloc(bufq->desc_count, sizeof(*bufq->xsk_buf),
   282					GFP_KERNEL);
   283		if (!bufq->xsk_buf)
   284			return -ENOMEM;
   285	
   286		bufq->pending = bufq->desc_count;
   287		bufq->thresh = libeth_xdp_queue_threshold(bufq->desc_count);
   288	
   289		if (!idpf_alloc_rx_buffers_zc(bufq))
   290			netdev_err(bufq->pool->netdev,
   291				   "failed to allocate XSk buffers for qid %d\n",
   292				    bufq->pool->queue_id);
   293	
   294		bufq->rx_buf_size = xsk_pool_get_rx_frame_size(bufq->pool);
   295		__clear_bit(__IDPF_Q_HSPLIT_EN, bufq->flags);
   296		bufq->rx_hbuf_size = 0;
   297	
   298		if (xsk_uses_need_wakeup(bufq->pool))
   299			xsk_set_rx_need_wakeup(bufq->pool);
   300	
   301		bufq->next_to_alloc = bufq->next_to_use;
   302	
   303		return 0;
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
