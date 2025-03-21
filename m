Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE3E41C64
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 19:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742586318; cv=none; b=ii8Lb37R+So42A2SRevo2AGj+I3MTGL88+LTHS1j/jEPjur4KXQNpzo+MGai8ugJu5+3LTmNHrVGx95MmXqXEAqLuV6wukUwpXpJ+PB8IceyARC7ZQCayERbUYTr6zAp0C5bMRhuuWGaHB1eXxFhZUfVW03rysrPWBqws70k2uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742586318; c=relaxed/simple;
	bh=1IHm7SEdaZ84vjsplqaQBVwZqgB23zKIT4EuZr5kdjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AFKCAHWHyCgnjduLkECkD9111uU2w27OIR5rqiuNbiovQHjBlqiljZ8A+O0F+e3vo0+PQtjP3/mXa8wmJTEnYmMVI6AhbNVpVWmMtnoMMWUBfNMu53ImLmKEaugWAgeowzWrmwFIgAJ7fm35VTRLxQ1GiatODwSIeNLfLXdM+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLYTC8Io; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLYTC8Io"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742586317; x=1774122317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1IHm7SEdaZ84vjsplqaQBVwZqgB23zKIT4EuZr5kdjM=;
  b=bLYTC8IoXZndGIgoRb5CT4GdgQ565BEMSBMksDe2Y5n272QkBA9ZQraN
   sUQTjBjfeVFKzIhfsI/4RCVO4zbZboSXr4UDPUDN4vqsuEzci+V41MDeJ
   4ZToAsZ9B6lYzcLoxcYUDFmMEB/MYDagNGzY++NMv3NsyCWrjWUIjb9/6
   JQ54WMxCxKSyrf+Yy+yrsVj7qq/ieRJbfEDOGjzfrVrzXE0NB1QrGcWxT
   sxBDmq1QFBcRzLJrjjo1yZrrAD5VlLXOPHDUC2IvJ3KD4Bp7pcpwLb+hj
   baC/TFvX2PasAbfUoqwj6doJ8cka3yAEbl4bhs+VfOS3buvqqbGNlSOWw
   w==;
X-CSE-ConnectionGUID: qFXVe4FRQg6EO9o0ZK8LJg==
X-CSE-MsgGUID: IzrDILM8Ti+GideCxwYVTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="47521550"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="47521550"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 12:45:16 -0700
X-CSE-ConnectionGUID: JnCFprnHT6SgUU7eylWyTQ==
X-CSE-MsgGUID: y/DWdXYWRsivOrqN9wg2Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="123948994"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Mar 2025 12:45:15 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tviIr-0001dd-0U;
	Fri, 21 Mar 2025 19:45:13 +0000
Date: Sat, 22 Mar 2025 03:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit-xdp 6/8] drivers/net/netkit.c:218:39: error:
 'struct netdev_rx_queue' has no member named 'pool'
Message-ID: <202503220355.oWbqoLu6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-xdp
head:   6f1df43931ef06ffe83eaa6a0d3df5d4c9a53786
commit: 65332eb9360ea7f0f0bcea9de6c4b2ec7a8ca936 [6/8] netkit: implement ndos
config: arm-randconfig-002-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220355.oWbqoLu6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220355.oWbqoLu6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220355.oWbqoLu6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/netkit.c: In function 'netkit_xsk_get_pool_from_qid':
>> drivers/net/netkit.c:218:39: error: 'struct netdev_rx_queue' has no member named 'pool'
      return nk->lower->dev->_rx[queue_id].pool;
                                          ^
>> drivers/net/netkit.c:220:39: error: 'struct netdev_queue' has no member named 'pool'
      return nk->lower->dev->_tx[queue_id].pool;
                                          ^
   drivers/net/netkit.c: In function 'netkit_xsk_reg_pool_at_qid':
   drivers/net/netkit.c:245:32: error: 'struct netdev_rx_queue' has no member named 'pool'
      nk->lower->dev->_rx[queue_id].pool = pool;
                                   ^
   drivers/net/netkit.c:247:32: error: 'struct netdev_queue' has no member named 'pool'
      nk->lower->dev->_tx[queue_id].pool = pool;
                                   ^
   drivers/net/netkit.c: In function 'netkit_xsk_clear_pool_at_qid':
   drivers/net/netkit.c:261:32: error: 'struct netdev_rx_queue' has no member named 'pool'
      nk->lower->dev->_rx[queue_id].pool = NULL;
                                   ^
   drivers/net/netkit.c:263:32: error: 'struct netdev_queue' has no member named 'pool'
      nk->lower->dev->_tx[queue_id].pool = NULL;
                                   ^


vim +218 drivers/net/netkit.c

   207	
   208	static struct xsk_buff_pool *
   209	netkit_xsk_get_pool_from_qid(struct net_device *dev, u16 queue_id)
   210	{
   211		struct netkit *nk = netkit_priv(dev);
   212	
   213		if (!nk->lower || nk->primary)
   214			return NULL;
   215		if (!netkit_queue_valid(dev, queue_id))
   216			return NULL;
   217		if (queue_id < nk->lower->dev->real_num_rx_queues)
 > 218			return nk->lower->dev->_rx[queue_id].pool;
   219		if (queue_id < nk->lower->dev->real_num_tx_queues)
 > 220			return nk->lower->dev->_tx[queue_id].pool;
   221		return NULL;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
