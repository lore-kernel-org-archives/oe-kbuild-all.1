Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1735223AE9B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 04:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773894937; cv=none; b=eWX+EX8VnLkW6/GvRSNfBEIKdIhNNL6yqFVBSdXVqabWnLBTtr5+l9grzsAkpWJdo1UG9SqMt8A13ievhyv+fYAD5k7xr4d23GThpLZNz3mqZws0npcqajwA2mF+1+Ctspw0YTesL2epR94BpSJcWGIrHRv6qqij+9GzyFJlDdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773894937; c=relaxed/simple;
	bh=XOQJX6DutUN0w2RnNl3UE44VuIbNxrz8DJPJAJHq8/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ASpSZHwLS3HdvXLwa9wD8nSrmvxlqQd+AD8WUowg9zWzurfBD/kAHlHyPQSjctqVHCvpz7Tc+gZY8knvLiu0PoQCiUtW6whm6rcVM6MyLhrUM+cI+WovSi+NLJrmch5BDoierV3dsy2P8cIlXucaUzeSZPZLcyOsL2+S0uNhERs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fW5vrjU0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fW5vrjU0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773894936; x=1805430936;
  h=date:from:to:cc:subject:message-id;
  bh=XOQJX6DutUN0w2RnNl3UE44VuIbNxrz8DJPJAJHq8/w=;
  b=fW5vrjU0RtubpgwRP+F1f9c2Wd9FShP+O8h2N9z6AnIde41tgxM7zhzg
   zTobdr+f9PrMTfnVdXUKQWkSpjjHx4syEyoRIiyXtD3Gdq0iERqFSbKiS
   tZFzrBq6XGWF/ZwUipRZkX7H0v8jJFVI1fufxvyYgjlSHGbPaeCr/88Rr
   +ymG0BJy1OMni7140fKc/o8ny8Vt6Cwf4GffkhFL8eAg3EaFIpA+ylOWv
   xt+beYx4HImtb2UXluEiz9IF80ujfx/pR5xpJKgWLohnxfMHnsIPbb8ue
   6SUe17YIYeUvMMIE51E89BUWuQk8Sdtz2sl0snloYij6puXNiEM4OHKSD
   w==;
X-CSE-ConnectionGUID: c8XwZ2u/QAuHJrS3PFx35g==
X-CSE-MsgGUID: sGxM43RWTf+WBQjbwHxd+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="97573190"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="97573190"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 21:35:36 -0700
X-CSE-ConnectionGUID: 2Dmso7VCTMGbxiSdHMLvlg==
X-CSE-MsgGUID: hCQus919Tu+ZdnyZ5o/PTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="260743839"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 21:35:33 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w356Y-000000000JZ-1Qr3;
	Thu, 19 Mar 2026 04:35:30 +0000
Date: Thu, 19 Mar 2026 12:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: Larysa Zaremba <larysa.zaremba@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Subject: [tnguy-next-queue:dev-queue 83/97]
 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:3178:27: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202603191235.t3CNQjw3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   8cf0b18c0700c55deb424e284912d0161885434b
commit: 556b0d5d0b19690e7951bf5f6bc584037c4017cf [83/97] ixgbevf: use libeth in Rx processing
config: alpha-randconfig-r123-20260319 (https://download.01.org/0day-ci/archive/20260319/202603191235.t3CNQjw3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191235.t3CNQjw3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191235.t3CNQjw3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:768:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bpf_prog *xdp_prog @@     got struct bpf_prog [noderef] __rcu * @@
   drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:768:18: sparse:     expected struct bpf_prog *xdp_prog
   drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:768:18: sparse:     got struct bpf_prog [noderef] __rcu *
>> drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:3178:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bpf_prog [noderef] __rcu *xdp_prog @@     got struct bpf_prog *xdp_prog @@
   drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:3178:27: sparse:     expected struct bpf_prog [noderef] __rcu *xdp_prog
   drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:3178:27: sparse:     got struct bpf_prog *xdp_prog
>> drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:4136:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct bpf_prog [noderef] __rcu *_x_ @@     got struct bpf_prog *xdp_prog @@
   drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:4136:25: sparse:     expected struct bpf_prog [noderef] __rcu *_x_
   drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:4136:25: sparse:     got struct bpf_prog *xdp_prog

vim +3178 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c

92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3124  
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3125  /**
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3126   * ixgbevf_setup_rx_resources - allocate Rx resources (Descriptors)
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen      2018-03-16  3127   * @adapter: board private structure
dec0d8e462322a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Jeff Kirsher     2015-02-10  3128   * @rx_ring: Rx descriptor ring (for a specific queue) to setup
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3129   *
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3130   * Returns 0 on success, negative on failure
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3131   **/
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen      2018-03-16  3132  int ixgbevf_setup_rx_resources(struct ixgbevf_adapter *adapter,
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen      2018-03-16  3133  			       struct ixgbevf_ring *rx_ring)
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3134  {
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3135  	struct libeth_fq fq = {
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3136  		.count		= rx_ring->count,
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3137  		.nid		= NUMA_NO_NODE,
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3138  		.type		= LIBETH_FQE_MTU,
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3139  		.xdp		= !!rx_ring->xdp_prog,
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3140  		.idx		= rx_ring->queue_index,
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3141  		.buf_len	= IXGBEVF_RX_PAGE_LEN(rx_ring->xdp_prog ?
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3142  						      LIBETH_XDP_HEADROOM :
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3143  						      LIBETH_SKB_HEADROOM),
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3144  	};
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3145  	int ret;
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3146  
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3147  	ret = libeth_rx_fq_create(&fq, &rx_ring->q_vector->napi);
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3148  	if (ret)
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3149  		return ret;
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3150  
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3151  	rx_ring->pp = fq.pp;
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3152  	rx_ring->rx_fqes = fq.fqes;
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3153  	rx_ring->truesize = fq.truesize;
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3154  	rx_ring->rx_buf_len = fq.buf_len;
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3155  
7c3a4626eb65e7 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Florian Fainelli 2017-08-01  3156  	u64_stats_init(&rx_ring->syncp);
7c3a4626eb65e7 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Florian Fainelli 2017-08-01  3157  
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3158  	/* Round up to nearest 4K */
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3159  	rx_ring->size = rx_ring->count * sizeof(union ixgbe_adv_rx_desc);
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3160  	rx_ring->size = ALIGN(rx_ring->size, 4096);
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3161  
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3162  	rx_ring->desc = dma_alloc_coherent(fq.pp->p.dev, rx_ring->size,
2a1f8794161d9d drivers/net/ixgbevf/ixgbevf_main.c                Nick Nunley      2010-04-27  3163  					   &rx_ring->dma, GFP_KERNEL);
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3164  
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3165  	if (!rx_ring->desc) {
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3166  		ret = -ENOMEM;
05d063aa867b7a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov    2014-01-17  3167  		goto err;
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3168  	}
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3169  
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen      2018-03-16  3170  	/* XDP RX-queue info */
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3171  	ret = __xdp_rxq_info_reg(&rx_ring->xdp_rxq, adapter->netdev,
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3172  				 rx_ring->queue_index, 0, rx_ring->truesize);
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3173  	if (ret)
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen      2018-03-16  3174  		goto err;
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen      2018-03-16  3175  
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3176  	xdp_rxq_info_attach_page_pool(&rx_ring->xdp_rxq, fq.pp);
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3177  
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen      2018-03-16 @3178  	rx_ring->xdp_prog = adapter->xdp_prog;
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen      2018-03-16  3179  
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3180  	return 0;
05d063aa867b7a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov    2014-01-17  3181  err:
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3182  	libeth_rx_fq_destroy(&fq);
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3183  	rx_ring->rx_fqes = NULL;
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3184  	rx_ring->pp = NULL;
05d063aa867b7a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov    2014-01-17  3185  	dev_err(rx_ring->dev, "Unable to allocate memory for the Rx descriptor ring\n");
556b0d5d0b1969 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Larysa Zaremba   2026-03-04  3186  	return ret;
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3187  }
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose        2010-01-09  3188  

:::::: The code at line 3178 was first introduced by commit
:::::: c7aec59657b60f3a29fc7d3274ebefd698879301 ixgbevf: Add XDP support for pass and drop actions

:::::: TO: Tony Nguyen <anthony.l.nguyen@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
