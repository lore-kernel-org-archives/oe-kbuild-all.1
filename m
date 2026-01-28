Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936072FFDEB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 05:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769576904; cv=none; b=nT8im3Ms3jwa+iac5dEvXDNNHNebwcy/o7V9e9Wnnoxa/epenzWQktCStlB5p8XOI3nZY/Sv17scnhc4gMkpEeUx+9wdZBkLrogZ+2Rm9XwaX1lCeJ6fQ+/NbfW6b+8DWp8DO2cIFGXLGRzi3Ze620AdaLS4DBAdE0b+SghQoA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769576904; c=relaxed/simple;
	bh=OJG+hPtRgxe1f5rtXsA/aZJW1ZVZt2kiUNd2bK8ehX8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YEObJwkF/qsnDF++3lEJVe1H0PQ42fkqx2aUx4lbc1wVRcafdPYMDEwnpZdk2RDFWMhSppYwqq2g82Uldq6cGBcd1/K3RUD/o++wKnKzmXMnWA8pdJ8340eieAYBimEGxrCrDA2lNe1ncbdmWIBslaAKfqk86eDT92XvS3cLftc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAwjxkdF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAwjxkdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769576902; x=1801112902;
  h=date:from:to:cc:subject:message-id;
  bh=OJG+hPtRgxe1f5rtXsA/aZJW1ZVZt2kiUNd2bK8ehX8=;
  b=AAwjxkdFLq88qDwZUq5lxpo2Y7aJwaJKTcwdOTztKU8OmnDa//LZ+UPJ
   upeQUo3jScrgZ3I906s/JPuk3FvAplVrbDRy7/WTq0B934iftnyQs2mGX
   2Zcv2eU5SFpVFmXCFB0ZJ3epVbqsBtlka74AeQ75ShfiYcYMYDXnk64NZ
   TbkNnIe2gfGBb+Kzh4rr0p3Yc3xIIQkCHbOt8ZxSfqld+Lm0xe7UhHRqJ
   W+9b89Kgr+MfV1cJMKjx1jt9Qu6swNyNvyQWPdwPCtG5tuW3zzlUY97fE
   aeu2amC3aBozRi7Ajo9RKnf0TZ+Ui84vu+AM2V8gvOp9/J/wtHzXHUY+O
   w==;
X-CSE-ConnectionGUID: k+p1kEkIRbuSQVUo+g+Y2g==
X-CSE-MsgGUID: PGA0bLgnQ6avXQph3sm5Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="73376500"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="73376500"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 21:08:18 -0800
X-CSE-ConnectionGUID: 7RjB/j0sRS24xVXcYnwZEw==
X-CSE-MsgGUID: ruHA5cg5T8+iEGOqgaXAUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208239196"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jan 2026 21:08:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkxmo-00000000ZJu-1rXp;
	Wed, 28 Jan 2026 05:08:14 +0000
Date: Wed, 28 Jan 2026 13:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/netkit-iouring15 17/18] net/xdp/xsk.c:126:31:
 error: implicit declaration of function 'netif_get_rx_queue_lease_locked'
Message-ID: <202601281347.7ktKHLMJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring15
head:   2bfd97dc4072315c583d973b90386dd82df70fae
commit: 2735913301fe3285613f291f594b1749487137aa [17/18] Revert "net: Proxy net_mp_{open,close}_rxq for leased queues"
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260128/202601281347.7ktKHLMJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281347.7ktKHLMJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281347.7ktKHLMJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/sched/mm.h:7,
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
