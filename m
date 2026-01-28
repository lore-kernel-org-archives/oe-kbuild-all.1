Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B268A1A285
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769584847; cv=none; b=kK3T+xyT3rfT0Q3rUN03LorbO1rbCICiIVlGRdzVq9bz+S1fezsXHyD7QwW/LGtHCBm6RIenTJgVBvOMUDQwyLU+Xq5MgKbImforwR9PZ50sjEqar2kHTF1j3QfXO+QPx2TWFcHiAGiNI6UDLx7lrufeK5kL9jJb+jie2H0a5cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769584847; c=relaxed/simple;
	bh=arqh/3JWCQPrRCPf4Lg/x7LUbmToIY+dbU6nl1I528M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gouEdMn3LF7B6v6Fjm1SCUY4zIaov8QHFjA38qT5x1/ttURsrSKhYoTgKoz7DBLx66ekRstW7QhT4XTLlup105YjmYWPztLbHX+938PvRnZqMLQpJNHP2fCb1oEjQhff2ouko8r/b0rWxVeacGn4xwVMT4gg0NT0Ad5/GUxKgeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zneftik0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zneftik0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769584846; x=1801120846;
  h=date:from:to:cc:subject:message-id;
  bh=arqh/3JWCQPrRCPf4Lg/x7LUbmToIY+dbU6nl1I528M=;
  b=Zneftik0hF4tySBmxZVjxESdZx+/y+NprzJWET+mVIUfOJ9rr2vcZ4+h
   KMThb6W1r0IMMFgf621qZ5uwWOpjP+AlIReQatEHRVAGIIoSueQkdynid
   Yy9bPvo0x8Zw4HYS+ob4rfruOplV21Gd6tbwDGL0LTsBXpnRThMaiEEJn
   gUON8Fq4M6LnoSMFG+HQEXSaUHnSvbIjU+pJ8+7fJmu/+YnOQtKBtMBh6
   7tfXz5pIZMBCgXBuOIlJChEzxQ9Kjo8X46Qda4ItBZbTzvMURobA+QFUC
   aGWwSJBD1rJYXPgJ0Ot7KQ7qJwF1LUa98JX7UJsBgsZB1r5yjngbsD6XX
   Q==;
X-CSE-ConnectionGUID: enIYh/zYTXGAC1jGf5lsWw==
X-CSE-MsgGUID: 3msNbTxzR9+Pb4Iz8hmuUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74639704"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74639704"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 23:20:45 -0800
X-CSE-ConnectionGUID: /D4uKsuZQySZJJXgK+l8Ug==
X-CSE-MsgGUID: 2IRhwk5tRR+heetCmFpomQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212739088"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Jan 2026 23:20:45 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkzqz-0000000021R-3Av3;
	Wed, 28 Jan 2026 07:20:41 +0000
Date: Wed, 28 Jan 2026 08:20:41 +0100
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/netkit-iouring15 17/18] net/xdp/xsk.c:126:17:
 error: call to undeclared function 'netif_get_rx_queue_lease_locked'; ISO C99
 and later do not support implicit function declarations
Message-ID: <202601280810.qSqTo7ht-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring15
head:   2bfd97dc4072315c583d973b90386dd82df70fae
commit: 2735913301fe3285613f291f594b1749487137aa [17/18] Revert "net: Proxy net_mp_{open,close}_rxq for leased queues"
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260128/202601280810.qSqTo7ht-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280810.qSqTo7ht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280810.qSqTo7ht-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/xdp/xsk.c:126:17: error: call to undeclared function 'netif_get_rx_queue_lease_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |                 WARN_ON_ONCE(!netif_get_rx_queue_lease_locked(&dev, &id));
         |                               ^
   net/xdp/xsk.c:126:17: note: did you mean '__netif_get_rx_queue_lease'?
   ./include/net/netdev_rx_queue.h:76:1: note: '__netif_get_rx_queue_lease' declared here
      76 | __netif_get_rx_queue_lease(struct net_device **dev, unsigned int *rxq,
         | ^
>> net/xdp/xsk.c:133:2: error: call to undeclared function 'netif_put_rx_queue_lease_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     133 |         netif_put_rx_queue_lease_locked(orig_dev, dev);
         |         ^
   net/xdp/xsk.c:151:8: error: call to undeclared function 'netif_get_rx_queue_lease_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     151 |                 if (!netif_get_rx_queue_lease_locked(&dev, &id))
         |                      ^
   net/xdp/xsk.c:164:2: error: call to undeclared function 'netif_put_rx_queue_lease_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     164 |         netif_put_rx_queue_lease_locked(orig_dev, dev);
         |         ^
   4 errors generated.


vim +/netif_get_rx_queue_lease_locked +126 net/xdp/xsk.c

1c1efc2af15886 Magnus Karlsson 2020-08-28  119  
1c1efc2af15886 Magnus Karlsson 2020-08-28  120  void xsk_clear_pool_at_qid(struct net_device *dev, u16 queue_id)
1c1efc2af15886 Magnus Karlsson 2020-08-28  121  {
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  122  	struct net_device *orig_dev = dev;
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  123  	unsigned int id = queue_id;
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  124  
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  125  	if (id < dev->real_num_rx_queues)
e1d8d7f33eef21 Daniel Borkmann 2026-01-15 @126  		WARN_ON_ONCE(!netif_get_rx_queue_lease_locked(&dev, &id));
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  127  
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  128  	if (id < dev->real_num_rx_queues)
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  129  		dev->_rx[id].pool = NULL;
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  130  	if (id < dev->real_num_tx_queues)
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  131  		dev->_tx[id].pool = NULL;
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  132  
e1d8d7f33eef21 Daniel Borkmann 2026-01-15 @133  	netif_put_rx_queue_lease_locked(orig_dev, dev);
1c1efc2af15886 Magnus Karlsson 2020-08-28  134  }
1c1efc2af15886 Magnus Karlsson 2020-08-28  135  

:::::: The code at line 126 was first introduced by commit
:::::: e1d8d7f33eef21fc3c25b5f8234820db9dec3438 xsk: Proxy pool management for leased queues

:::::: TO: Daniel Borkmann <daniel@iogearbox.net>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
