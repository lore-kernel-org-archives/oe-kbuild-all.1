Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006A144D09
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716462873; cv=none; b=tXisUDyOElRUm3YLoK0CUlsdCFKBgSQyvL/xAsFbNLVMIP6XyCeoM6iPagftEJZ2i6yziNG9bu85x1nDzQGvAx0FGX5HeDadwXFqgN7Jb1hnYlmvd9TIthQ0kTVHHPifDB0YElSRYQTfPLuPbkq54kTLnV1XfUtl+7IC5GWuhFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716462873; c=relaxed/simple;
	bh=WhfYjXNHqQBifJZV8NKde1TlFWjifwYOIRpWV+KvpAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JUQDSFgKi6fmrGsM8XPLCA9K/w42GrHDBqYPsKO2x4sooz4UdEIRX/C2yuQdXNF4IbKw+0Y9lLHk9DMmiwnYvhYx0/1kg02tnmJ7tv1JmWXPQnrgLtZJSxxD2S4ypNGx9SbYMp+BXh5u72R+2QNztRD6ANosskI4nwVTmERsP50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9yRKdPX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9yRKdPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716462871; x=1747998871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WhfYjXNHqQBifJZV8NKde1TlFWjifwYOIRpWV+KvpAw=;
  b=Y9yRKdPXU5xhHnoomt1bVz4qgcT0k+F2pa+2qP3/ybgCQT0YzD5uDRsS
   8sAf7dcIDAOF/ceCqzWzpBRrw28afXmS7qW8bJhoSphzhEgzKZPhWSJV2
   1zV9c70Urzjq43pce1ltr2aZc0gCZgSMyFI6kFb9fKVp6DZAzpBGV6g07
   PN8N2hdY+ehtcKwxzt1MorFnTsMFNNAYis3EpfN1mxChWE8Eeu4GWEMFV
   kXSteet3QIUkqpwSU/WRA1hC0J2Yj7vUetH37/5SIlQqcHYY75vPNqdyM
   whbZQ4VpwCtp4d2f4oQ+EYsYag6+LXC7o547vQjvZnzhbjy/wErPnM5OY
   A==;
X-CSE-ConnectionGUID: untQaPxdQnm68JTv5HOKhw==
X-CSE-MsgGUID: YTK0zuCYTuCG1xQLzCWJuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23439505"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="23439505"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 04:14:31 -0700
X-CSE-ConnectionGUID: GdkcHGwNQsO+1b/R+VgrJA==
X-CSE-MsgGUID: WahcOSRuSUiwycdgcJSRKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="34101863"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 May 2024 04:14:30 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA6Ox-0002lt-1P;
	Thu, 23 May 2024 11:14:27 +0000
Date: Thu, 23 May 2024 19:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 13/14] drivers/net/veth.c:1060:61: warning:
 'struct io_zc_rx_ifq' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202405231902.Hyoz7fqY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   9b5718278c90658985f5d335dff91dd589b3d4c7
commit: 83b53b75f5f938c3c6e4f9905220baa53e63e11e [13/14] veth: add support for io_uring zc rx
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240523/202405231902.Hyoz7fqY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231902.Hyoz7fqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231902.Hyoz7fqY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/veth.c:1060:61: warning: 'struct io_zc_rx_ifq' declared inside parameter list will not be visible outside of this definition or declaration
    1060 | static int veth_create_page_pool(struct veth_rq *rq, struct io_zc_rx_ifq *ifq)
         |                                                             ^~~~~~~~~~~~
>> drivers/net/veth.c:1705:12: warning: 'veth_iou_set' defined but not used [-Wunused-function]
    1705 | static int veth_iou_set(struct net_device *dev,
         |            ^~~~~~~~~~~~


vim +1060 drivers/net/veth.c

  1059	
> 1060	static int veth_create_page_pool(struct veth_rq *rq, struct io_zc_rx_ifq *ifq)
  1061	{
  1062		struct page_pool_params pp_params = {
  1063			.order = 0,
  1064			.pool_size = VETH_RING_SIZE,
  1065			.nid = NUMA_NO_NODE,
  1066			.dev = &rq->dev->dev,
  1067			.napi = &rq->xdp_napi,
  1068		};
  1069	
  1070		if (ifq) {
  1071			rq->rq.mp_params.mp_ops = &io_uring_pp_zc_ops;
  1072			rq->rq.mp_params.mp_priv = ifq;
  1073			pp_params.queue = &rq->rq;
  1074		}
  1075	
  1076		rq->page_pool = page_pool_create(&pp_params);
  1077		if (IS_ERR(rq->page_pool)) {
  1078			int err = PTR_ERR(rq->page_pool);
  1079	
  1080			rq->page_pool = NULL;
  1081			return err;
  1082		}
  1083	
  1084		return 0;
  1085	}
  1086	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
