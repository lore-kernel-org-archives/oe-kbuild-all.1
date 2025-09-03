Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1772D46D8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 20:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756931737; cv=none; b=V9ekkUBU2TMNi22HiTOh7XpaDsoGSbW7jlXziEG2ScxNxkqyTPurEW4oN5FxMRElC1Hkzb3I6WiGHaxhBExv33BEKykGBDuSmmj3KJ0YAHDFyBJ1IEiOtmGInn8inif5v11RImb9Kx+zPzrKaD4TnkO7G5Gjad45Qr/S6r9rey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756931737; c=relaxed/simple;
	bh=6sTTkQQA+pefHgTBoF4P8HGPX63bGPu6xq5JZFoDcaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yeoj/wLaTjfH5mMNGoufSUZd4VkJSyayuwFWREduIeChshFMcLdeNsqcYnY1FkKQA/iagZf/GOy/3kMbe2ANgatVE6PESdwGmzdrZEWbJhME8pVpwxxT3WNHNd62UyaBgBgxZdAVq7ZXF+yGWYLpwYvIwspwLl7HTxQez4oltYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5wny5I1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5wny5I1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756931735; x=1788467735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6sTTkQQA+pefHgTBoF4P8HGPX63bGPu6xq5JZFoDcaE=;
  b=X5wny5I12pvyqKAhN7f4echPtGj5ygsFHtauXCcpfGUVieNskoPy5fcX
   t6hCIVSt+b0znKhbir4X0Ab7Hx0kzM2/dVQ7FABrVnoRXq0NlXZQGJz/1
   OpZFocQojnPlOge6L2fOYeqsxbUlGBYVBRsvlgkxaFweTsfQi2h3nx+A9
   U26wHOkwnbWtatzBWchW7AIXzNDoc0OugzpbGkGk+8QTXv8nUITD5pcXP
   ed5OPZcaZAb1N+J1icVwpXFyImuoUOebOe0sZ2OMMUhHipnZn6eCypOGH
   uFIivvaBksD8aYoKtrm4qMgyHNuqr3dDJ+QCxggGSRx82taLgvQJ3OK2z
   Q==;
X-CSE-ConnectionGUID: NXg83KVsSvKEXSuDFZSbiQ==
X-CSE-MsgGUID: XXqWwaPqSU+GJfLWjaheWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69518828"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="69518828"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 13:35:35 -0700
X-CSE-ConnectionGUID: +p6yAL0iQhCKqRzNM923aQ==
X-CSE-MsgGUID: tXiKdqrtQHq8MZoyJogdHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="172062164"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2025 13:35:32 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utuCL-0004PH-1r;
	Wed, 03 Sep 2025 20:35:29 +0000
Date: Thu, 4 Sep 2025 04:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit-iouring 11/13] drivers/net/netkit.c:397:22: error:
 'struct netdev_rx_queue' has no member named 'pool'
Message-ID: <202509040452.c5DVg68p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[community] /zdci/src/lkp/sbin/sync-produce --item /zdci/kbuild/indicators/16/16544d1248d6ce9cb78371299aa44a86f959052b-first_error_kconfig --flag create-dir

tree:   https://github.com/cilium/linux.git pr/netkit-iouring
head:   e770abe7d0f680ac35fa4472ef996c543cee1184
commit: 16544d1248d6ce9cb78371299aa44a86f959052b [11/13] netkit: Implement ndo_queue_xsk_pool_{register,get,clear} operations
config: riscv-randconfig-001-20250904 (https://download.01.org/0day-ci/archive/20250904/202509040452.c5DVg68p-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040452.c5DVg68p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040452.c5DVg68p-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/netkit.c: In function 'netkit_queue_xsk_pool_register':
   drivers/net/netkit.c:390:6: error: implicit declaration of function 'xsk_get_pool_from_qid' [-Werror=implicit-function-declaration]
     if (xsk_get_pool_from_qid(phys, phys_idx))
         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/netkit.c:393:6: error: dereferencing pointer to incomplete type 'struct xsk_buff_pool'
     pool->netdev = phys;
         ^~
>> drivers/net/netkit.c:397:22: error: 'struct netdev_rx_queue' has no member named 'pool'
      phys->_rx[phys_idx].pool = pool;
                         ^
>> drivers/net/netkit.c:399:22: error: 'struct netdev_queue' has no member named 'pool'
      phys->_tx[phys_idx].pool = pool;
                         ^
   drivers/net/netkit.c: In function 'netkit_queue_xsk_pool_get':
   drivers/net/netkit.c:421:29: error: 'struct netdev_rx_queue' has no member named 'pool'
      return phys->_rx[phys_idx].pool;
                                ^
   drivers/net/netkit.c:423:29: error: 'struct netdev_queue' has no member named 'pool'
      return phys->_tx[phys_idx].pool;
                                ^
   drivers/net/netkit.c: In function 'netkit_queue_xsk_pool_clear':
   drivers/net/netkit.c:444:22: error: 'struct netdev_rx_queue' has no member named 'pool'
      phys->_rx[phys_idx].pool = NULL;
                         ^
   drivers/net/netkit.c:446:22: error: 'struct netdev_queue' has no member named 'pool'
      phys->_tx[phys_idx].pool = NULL;
                         ^
   cc1: some warnings being treated as errors


vim +397 drivers/net/netkit.c

   372	
   373	static int netkit_queue_xsk_pool_register(struct net_device *dev,
   374						  struct xsk_buff_pool *pool, int idx)
   375	{
   376		struct netdev_rx_queue *rxq;
   377		struct net_device *phys;
   378		int phys_idx;
   379	
   380		if (idx >= dev->real_num_rx_queues)
   381			return -EINVAL;
   382	
   383		rxq = __netif_get_rx_queue(dev, idx);
   384		if (!rxq->peer)
   385			return -EOPNOTSUPP;
   386	
   387		phys = rxq->peer->dev;
   388		phys_idx = get_netdev_rx_queue_index(rxq->peer);
   389	
   390		if (xsk_get_pool_from_qid(phys, phys_idx))
   391			return -EBUSY;
   392	
   393		pool->netdev = phys;
   394		pool->queue_id = phys_idx;
   395	
   396		if (phys_idx < phys->real_num_rx_queues)
 > 397			phys->_rx[phys_idx].pool = pool;
   398		if (phys_idx < phys->real_num_tx_queues)
 > 399			phys->_tx[phys_idx].pool = pool;
   400		return 0;
   401	}
   402	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
