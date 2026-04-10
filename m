Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA44371CF5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 09:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814508; cv=none; b=FXUIk71TCP++3uk0m9/8G6slw8RLI2UuUOcmdWEBw1NmIQWk7JTOoLfa1RYxlFLnNOa9QbH/3BIXpLlDEu63s1db+DakOhoELTG5xE4u7SzIcy9hBLFVWzQGhlcuFLTzddmSxsf1Kj4ViJCM4R4lgQoYsgGRy8oTZJr1Kk4zlU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814508; c=relaxed/simple;
	bh=iq0BCyDxX0IG6j/37JMP6OdDWUJ2rbz2anCt8uOYT54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ncNn7NUvqgpkVpmUTYs6kuiLj1jtbBILYyL8+BwVjXyUi/OiH/gxSogzOFNYVjInJp0fdNxaZq6egE0b3Rj1gc3TsrOzDIuiOXnzTWle7FrY5r7oSO3cze5eFb40oroOonsXg50Lo3WDtcKoR2PCVJRjXWHbD3iS3Mac8IDE79g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtogVego; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtogVego"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775814507; x=1807350507;
  h=date:from:to:cc:subject:message-id;
  bh=iq0BCyDxX0IG6j/37JMP6OdDWUJ2rbz2anCt8uOYT54=;
  b=dtogVegofD53MLyuTC4vmXJu2lE/8lACw3nZniRhioFj6eIVOjRLWn53
   W5agDyWHGbwX82nxUrowDqYF1GTP8u9XvavhiHxRy2TlyITL/S+EXFjbp
   vCSFgyQ31skZ9Yau1C66URKpZDz05bfOqjqDx23pl5R/hNkhZDtvxwAE1
   2+VxzadyV6j0VNw/+OVl1R/L+gaAZ7lMag0j5LUmB8FGeDXKr2XsLlDyI
   9OHpvohNOKZcAng4MdXeBW1n54CnAci38N7Ult/Sp5nuvKYN4knCOlCP+
   NgVcKoJ2mGHxXlevv4xR251GkxhoI31eq/XGEaV+qpRW+h0hyvr7ONFuW
   g==;
X-CSE-ConnectionGUID: E9V4lSY4SIyCeXftHvrbfA==
X-CSE-MsgGUID: hXAn78FXSyyE4lC/GFD27g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94410849"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="94410849"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 02:48:26 -0700
X-CSE-ConnectionGUID: uAkkzNWBS2u4JPN+wtJg0A==
X-CSE-MsgGUID: Bhv0vZRERPus5XoIHnFARA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="267008610"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Apr 2026 02:48:25 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB8TO-000000003Zj-2yxS;
	Fri, 10 Apr 2026 09:48:22 +0000
Date: Fri, 10 Apr 2026 17:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/netkit-iouring28 16/16] net/xdp/xsk.c:132:7:
 error: implicit declaration of function 'netif_rxq_is_leased'; did you mean
 'netif_is_queue_leasee'?
Message-ID: <202604101745.xx2rLlx4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring28
head:   28fb61aaf5d0f6b9ca1d5b686cdbd5a8f0cfc750
commit: 28fb61aaf5d0f6b9ca1d5b686cdbd5a8f0cfc750 [16/16] errata
config: m68k-randconfig-r073-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101745.xx2rLlx4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101745.xx2rLlx4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101745.xx2rLlx4-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/xdp/xsk.c: In function 'xsk_clear_pool_at_qid':
>> net/xdp/xsk.c:132:7: error: implicit declaration of function 'netif_rxq_is_leased'; did you mean 'netif_is_queue_leasee'? [-Werror=implicit-function-declaration]
     if (!netif_rxq_is_leased(dev, queue_id))
          ^~~~~~~~~~~~~~~~~~~
          netif_is_queue_leasee
   cc1: some warnings being treated as errors


vim +132 net/xdp/xsk.c

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
