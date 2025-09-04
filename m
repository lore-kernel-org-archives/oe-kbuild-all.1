Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CF013C695
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 01:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756950920; cv=none; b=uooH6FB4080r8qprRU+sk71xNh1XjGhwspSu0jgCkCapJLVFVbZV/nCFmbh1PIPrsJa908hCJ420ubqqcNysLEP1c7ErJlWtRgDJtWebeRTU77yASbFw6fS3dyCHo6L+475YXFMMdX5T+mXVLsqs/SBt3eDyfjs/vVyFvNQ38Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756950920; c=relaxed/simple;
	bh=L7P/l1VUtFi45VZRMuokNP1WGwhEo9w0/bPQJ5TCRAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DeS91C9WkzLx2n6I3S0hpzPYO4XyTsLeKiC+Z9tbBDoCdFCga6gB2x2yH48fGVXQvulsYERKps6PwVVyy0Nl6BbhEZo4aM7dl6XWVehomeJ+qJcTsiacmV6FR/KEMtErYCFOCfh8yLqmvcMu/AsZdTgYbRTkWNDEvpU/eFMI1Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCiTq0K/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCiTq0K/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756950918; x=1788486918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L7P/l1VUtFi45VZRMuokNP1WGwhEo9w0/bPQJ5TCRAg=;
  b=bCiTq0K/018jSausSAHOiPzLE8JnqIK0hpgz2UiV0eQ+mk+ptAcKHphS
   Q68AIObIGAZZjh3Q2CgfYJR20/TZKAWBW4j+QzGnaU2/BQxzKpLCZ05Zu
   uWtAOSqKIwLYyzR4LY1pjXQVADtekOvSPkk9Z4nXEnDhJ+W7O2ZfnKRHc
   2z7YZe+TGDr+RJ0y4QLh+ALcrzhd5h9bmzrHRexGjZYAVGUL6jeYswgp7
   dz6BGFzH6A6Wcmxi/UE1msoZjIXhg2mcbqgYY5SgcQqzYgPsFYpeEtSW1
   1gLnD8UZAkwccBzfO/GTfKD5tCAB4F3qLxWxXRo+36tbOSNA2rSRIaKLb
   Q==;
X-CSE-ConnectionGUID: WeRxpjU2T9yMUsQf7ovjGw==
X-CSE-MsgGUID: Vzz6KA6oR1uMt1O2x3hSEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81865434"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81865434"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:55:16 -0700
X-CSE-ConnectionGUID: eoylKlfCRr22k1bfMzralw==
X-CSE-MsgGUID: OqeNjO3zSTOqiPC4dGaelw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="172201798"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Sep 2025 18:55:14 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utzBb-0004al-0L;
	Thu, 04 Sep 2025 01:54:59 +0000
Date: Thu, 4 Sep 2025 09:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit-iouring 11/13] drivers/net/netkit.c:413:1:
 warning: control reaches end of non-void function
Message-ID: <202509040934.ddF5Ozbl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring
head:   f8826b7e84197b32729dda9b4169cba095600ca3
commit: b58035b960888b005e921461fdb873ee5b9976f2 [11/13] netkit: Implement ndo_queue_xsk_pool_{register,get,clear} operations
config: riscv-randconfig-001-20250904 (https://download.01.org/0day-ci/archive/20250904/202509040934.ddF5Ozbl-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040934.ddF5Ozbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040934.ddF5Ozbl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/netkit.c: In function 'netkit_queue_xsk_pool_register':
   drivers/net/netkit.c:390:6: error: implicit declaration of function 'xsk_get_pool_from_qid' [-Werror=implicit-function-declaration]
     if (xsk_get_pool_from_qid(phys, phys_idx))
         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/netkit.c:393:6: error: dereferencing pointer to incomplete type 'struct xsk_buff_pool'
     pool->netdev = phys;
         ^~
   drivers/net/netkit.c:396:11: error: 'struct netdev_rx_queue' has no member named 'pool'
     rxq->peer->pool = pool;
              ^~
   drivers/net/netkit.c: In function 'netkit_queue_xsk_pool_get':
   drivers/net/netkit.c:412:18: error: 'struct netdev_rx_queue' has no member named 'pool'
     return rxq->peer->pool;
                     ^~
   drivers/net/netkit.c: In function 'netkit_queue_xsk_pool_clear':
   drivers/net/netkit.c:426:11: error: 'struct netdev_rx_queue' has no member named 'pool'
     rxq->peer->pool = NULL;
              ^~
   drivers/net/netkit.c: In function 'netkit_queue_xsk_pool_get':
>> drivers/net/netkit.c:413:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors


vim +413 drivers/net/netkit.c

   399	
   400	static struct xsk_buff_pool *
   401	netkit_queue_xsk_pool_get(struct net_device *dev, int idx)
   402	{
   403		struct netdev_rx_queue *rxq;
   404	
   405		if (idx >= dev->real_num_rx_queues)
   406			return NULL;
   407	
   408		rxq = __netif_get_rx_queue(dev, idx);
   409		if (!rxq->peer)
   410			return NULL;
   411	
   412		return rxq->peer->pool;
 > 413	}
   414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
