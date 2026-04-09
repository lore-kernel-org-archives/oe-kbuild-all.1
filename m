Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D893A5E84
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 23:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775779026; cv=none; b=ECbzFbkkBZkM6su583dYOGUZgzQnZgXtk4CnH/75c3os9hqr9UnUizyLrbrqY1oS41jU3y5e3MF/T7xnD5psmOaPcWtPgSMhL4drLCFL9XDAeXKvtjgN1dmQKKaLzyhTyCQoFuNtxXy7cZcNNwU7bjvNpTuAiSbl3H7SSQW2XMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775779026; c=relaxed/simple;
	bh=rKR88WBqUwnqSob4Xk+KG+VQ+cSlO0IrzEfIlHKcHQA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b/XHgtd1aXPGuzWkgAR4m1kH05cjzrQ6ZICHvEu0ppckdIZvtJqkePgeM5swyu7f3w4f4vAXaworJuFBCdKzsNQlns424E44BLkGxOQXq7ZXGfi9ypZRhjIt/6B8eBxmHnrBmMWDP9zWVp7ZvFLeTlq0Sk9G335f06Lx5+yawOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAFDBDX6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAFDBDX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775779025; x=1807315025;
  h=date:from:to:cc:subject:message-id;
  bh=rKR88WBqUwnqSob4Xk+KG+VQ+cSlO0IrzEfIlHKcHQA=;
  b=BAFDBDX6dACVCGsUZCR+Uj/QS3lk+roufGLUlWocRCXBKIeRA4eLYfDk
   qR48jOO4g/SUYBMceDPUH7OmXCpg8HOPFqvdb0cuXHpL8tppytGCp6nAc
   aVWz4WqGsL9R0jnEfiIvpCeL3suXftAsYKQqEJio9Xowr74VJyFUBsPHy
   dUjvgxWWGzOKEaBf8LBaOdaMhEQY4iNP3yjBoXopT21smLSqohSdhcXUx
   Kc9Td3tBAtBwYA1rMIVMnu5zT3ZjdHgSq3QvKdwS4t9M6UuRFCJJbJksY
   dkUu5yaG4p/fQbci8aLWOpoPkCsaZHSQU5yeUc02JM4N0f4BQSgK0S8Fe
   g==;
X-CSE-ConnectionGUID: kgOnVvT+QR2hov6ss1EAHQ==
X-CSE-MsgGUID: ESS51Uv4RaurZgleGXCBCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80685325"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="80685325"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 16:57:04 -0700
X-CSE-ConnectionGUID: kk/75jRSSOKI6ORdfZV/Og==
X-CSE-MsgGUID: GD/4/AZRSDaRs1pjBHAvIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="259401459"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Apr 2026 16:57:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAzF6-00000000Akz-26kP;
	Thu, 09 Apr 2026 23:57:00 +0000
Date: Fri, 10 Apr 2026 01:56:21 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/netkit-iouring28 16/16] net/xdp/xsk.c:132:14:
 error: implicit declaration of function 'netif_rxq_is_leased'
Message-ID: <202604100140.hhGWHtL6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring28
head:   28fb61aaf5d0f6b9ca1d5b686cdbd5a8f0cfc750
commit: 28fb61aaf5d0f6b9ca1d5b686cdbd5a8f0cfc750 [16/16] errata
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260410/202604100140.hhGWHtL6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604100140.hhGWHtL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604100140.hhGWHtL6-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/xdp/xsk.c: In function 'xsk_clear_pool_at_qid':
>> net/xdp/xsk.c:132:14: error: implicit declaration of function 'netif_rxq_is_leased' [-Wimplicit-function-declaration]
     132 |         if (!netif_rxq_is_leased(dev, queue_id))
         |              ^~~~~~~~~~~~~~~~~~~


vim +/netif_rxq_is_leased +132 net/xdp/xsk.c

f785e9937db541 Jakub Kicinski  2026-04-08  127  
1c1efc2af15886 Magnus Karlsson 2020-08-28  128  void xsk_clear_pool_at_qid(struct net_device *dev, u16 queue_id)
1c1efc2af15886 Magnus Karlsson 2020-08-28  129  {
f785e9937db541 Jakub Kicinski  2026-04-08  130  	struct netdev_rx_queue *hw_rxq;
3224a26004da42 Daniel Borkmann 2026-04-03  131  
f785e9937db541 Jakub Kicinski  2026-04-08 @132  	if (!netif_rxq_is_leased(dev, queue_id))
f785e9937db541 Jakub Kicinski  2026-04-08  133  		return __xsk_clear_pool_at_qid(dev, queue_id);
f785e9937db541 Jakub Kicinski  2026-04-08  134  	WARN_ON_ONCE(!netif_is_queue_leasee(dev));
3224a26004da42 Daniel Borkmann 2026-04-03  135  
f785e9937db541 Jakub Kicinski  2026-04-08  136  	hw_rxq = __netif_get_rx_queue(dev, queue_id)->lease;
3224a26004da42 Daniel Borkmann 2026-04-03  137  
f785e9937db541 Jakub Kicinski  2026-04-08  138  	netdev_lock(hw_rxq->dev);
f785e9937db541 Jakub Kicinski  2026-04-08  139  	queue_id = get_netdev_rx_queue_index(hw_rxq);
f785e9937db541 Jakub Kicinski  2026-04-08  140  	__xsk_clear_pool_at_qid(hw_rxq->dev, queue_id);
f785e9937db541 Jakub Kicinski  2026-04-08  141  	netdev_unlock(hw_rxq->dev);
f785e9937db541 Jakub Kicinski  2026-04-08  142  }
f785e9937db541 Jakub Kicinski  2026-04-08  143  

:::::: The code at line 132 was first introduced by commit
:::::: f785e9937db541632ce741099e1573a297a1c161 net: Remove the netif_get_rx_queue_lease_locked() helpers

:::::: TO: Jakub Kicinski <kuba@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
