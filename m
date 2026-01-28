Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F991AF0AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 02:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769568766; cv=none; b=LjGAcH/ItYeGXcdo/9mHjmcLcvX6+aaXg5kgnLOgSbDUgw7p9zRg/OsIJ5Upwt2v+hnbhXY3kok5HIWxsE+BI1rrwZtOS5CED93PtzwsgkZJLeOQGvFlGHDg7whw1DljVCNv8SpGDrepbH4hUAsPlA8Po6rw1xR/1fKHQeRKuqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769568766; c=relaxed/simple;
	bh=R82ZVKQIStfcdObNOk8ebxBwcjG9qVjC8FMZZo1K7ho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R+aDnMSyP3Qgyy7Tx+Nr3S7aeWlBfIzzwgfupZbEkvWhW/7OgcWuUoEg91xIidteqpl9+E4pipGcQBqAzSUdNPZ3+9BKy+rSBX8xZWlS2RY4mT2w8qivaJCJDYv2HTyGgcytPVDZ2z7fytBS+N2G6ljpuvz5mO7if17sEYdlRT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjMcWStq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjMcWStq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769568764; x=1801104764;
  h=date:from:to:cc:subject:message-id;
  bh=R82ZVKQIStfcdObNOk8ebxBwcjG9qVjC8FMZZo1K7ho=;
  b=CjMcWStqIH4ihHhvd9YMzcJJEejfroNpiZ6wCsQVHe7wLh44oz+qMDM4
   Qk15o4zsh0168Ag1aFYUEgVkBK6eoW3XAfPo9q4UXH/gM+nQAhE5e+w3z
   qCYQrkUy0k+higH7Pe9j8lFMj+5x2CQeNE8FINjUCJDvBNYEhNsiJ9klJ
   AAX8ek5l71QKwjwCAa1+q1D3J4HyiWB0FdLQDpfXWWhjLONi1SbJyReLk
   RvMX2AqeVaN0WkCJLQwO5PR1AfAj6sA+bas2laUT72jO7/tfRcRW2Xo7P
   uKQmoH7vNh1MNy/0zHZx4TZLUHe8GJAGN3BfbQ93/oe+ykfMljBZ768VF
   w==;
X-CSE-ConnectionGUID: /xo/abEvQSGkgDnoE+zl3g==
X-CSE-MsgGUID: h/YntqG1RZekQ9vE2Q5rAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="73367420"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="73367420"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:52:44 -0800
X-CSE-ConnectionGUID: gYeSkTcHSpa7ykpN7GVGCQ==
X-CSE-MsgGUID: Hav4So4LTo6o8IvZyYUfdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207381258"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 27 Jan 2026 18:52:42 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkvfc-000000001zV-0mgR;
	Wed, 28 Jan 2026 02:52:40 +0000
Date: Wed, 28 Jan 2026 03:52:14 +0100
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/netkit-iouring15 17/18] net/xdp/xsk.c:126:31:
 error: implicit declaration of function 'netif_get_rx_queue_lease_locked'
Message-ID: <202601280343.kYEi5r3y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring15
head:   2bfd97dc4072315c583d973b90386dd82df70fae
commit: 2735913301fe3285613f291f594b1749487137aa [17/18] Revert "net: Proxy net_mp_{open,close}_rxq for leased queues"
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260128/202601280343.kYEi5r3y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280343.kYEi5r3y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280343.kYEi5r3y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/kernel.h:23,
                    from include/linux/sched/mm.h:5,
                    from net/xdp/xsk.c:16:
   net/xdp/xsk.c: In function 'xsk_clear_pool_at_qid':
>> net/xdp/xsk.c:126:31: error: implicit declaration of function 'netif_get_rx_queue_lease_locked' [-Wimplicit-function-declaration]
     126 |                 WARN_ON_ONCE(!netif_get_rx_queue_lease_locked(&dev, &id));
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
>> net/xdp/xsk.c:133:9: error: implicit declaration of function 'netif_put_rx_queue_lease_locked' [-Wimplicit-function-declaration]
     133 |         netif_put_rx_queue_lease_locked(orig_dev, dev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
