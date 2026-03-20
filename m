Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F483AB273
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774023832; cv=none; b=Iw/LvqNI7mCg82KNvXk5uZNMwTY4/8iNqUPnmog0c8uLBWSV7THQxo5IM6f8Q/X9wJnLnPu+HjxW3Z9EamdiwHiFP66K3zgbA+/o1fNappsMZHldbb417e6aaoXb1JAAb8uEPC9Ib7UKkWRR1j2xihK2UQBUWSfoZm/s19Q4ucc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774023832; c=relaxed/simple;
	bh=Vw46Plhw00qZkGskvb71wTqvoNsMb+SY5IMJhT/V1zE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nN2EuWf/1jnE+mKl2ejo7t6iM9sQkBKu3hMKMibiB5270R4AJC1WUCroslHN4zuSvR1+D1f1KsAcakfnxUD6UFhdltUxFtwxxfrNpmY10EC5RmS0lVoQpM3EVfPmf5Nw1hS19I5euVVwRiH2m9Ox3PUvWPS1kPA7Dx6Ej+N6N1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQs+7pY6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQs+7pY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774023828; x=1805559828;
  h=date:from:to:cc:subject:message-id;
  bh=Vw46Plhw00qZkGskvb71wTqvoNsMb+SY5IMJhT/V1zE=;
  b=EQs+7pY69WVQLODIpWiy+xTmz03eznE2xWlOJqRalpBKot4EKtE102Kz
   vVLVFveQ6fwe21nTkpuN2eWUX3XV9DUIi75cdTu3CVcqMWa61ct+AqNRz
   kgBc7KfJYAVHijxUNqMP4umX6977G+ox4aTc/QaPGy0ipBPhcllp9Bwom
   DxhE5MH9qpVMR5QuEzEyct5NIN85SauAmklOTiJasGEs5vpSDUv783jgk
   t675QblMZQaSQF3WBHhusKSnpabhztmhiiIoyAd9HozKmK1YbKp3A4Y8A
   g1oCAQerq78wSh13sAR7Wb6azNH5H/j2So7AsxuDPbNWX8V7lFkoe8r6n
   g==;
X-CSE-ConnectionGUID: 7MO5XLayQ1mu/1qvjTmY8A==
X-CSE-MsgGUID: HucjS+zYT+uMxCA/3tujwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74814896"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74814896"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 09:23:48 -0700
X-CSE-ConnectionGUID: RebXjlVDQg6OJd56iuc36Q==
X-CSE-MsgGUID: /BQC4WSDRyWSB4tv3DcQxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="220664931"
Received: from lkp-server01.sh.intel.com (HELO ba623fe84fe1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Mar 2026 09:23:45 -0700
Received: from kbuild by ba623fe84fe1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3cdS-0000000007z-4Bdv;
	Fri, 20 Mar 2026 16:23:42 +0000
Date: Sat, 21 Mar 2026 00:23:11 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, David Wei <dw@davidwei.uk>
Subject: [cilium:pr/netkit-iouring19 570/583]
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:5617:14: error: implicit
 declaration of function 'netif_rxq_has_unreadable_mp'
Message-ID: <202603210044.MIbt3UZA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring19
head:   263b05479cf2219b9610925d32a127cb5adde246
commit: 8b33e9b1c0bee6f058cbe6cf57915e49e58baa9d [570/583] net: Implement netdev_nl_queue_create_doit
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260321/202603210044.MIbt3UZA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210044.MIbt3UZA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210044.MIbt3UZA-lkp@intel.com/

Note: the cilium/pr/netkit-iouring19 HEAD 263b05479cf2219b9610925d32a127cb5adde246 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/en_main.c: In function 'mlx5e_queue_validate_page_size':
>> drivers/net/ethernet/mellanox/mlx5/core/en_main.c:5617:14: error: implicit declaration of function 'netif_rxq_has_unreadable_mp' [-Wimplicit-function-declaration]
    5617 |         if (!netif_rxq_has_unreadable_mp(dev, queue_index))
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/meta/fbnic/fbnic_txrx.c: In function 'fbnic_alloc_qt_page_pools':
>> drivers/net/ethernet/meta/fbnic/fbnic_txrx.c:1586:13: error: implicit declaration of function 'netif_rxq_has_unreadable_mp' [-Wimplicit-function-declaration]
    1586 |         if (netif_rxq_has_unreadable_mp(fbn->netdev, rxq_idx)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/netif_rxq_has_unreadable_mp +5617 drivers/net/ethernet/mellanox/mlx5/core/en_main.c

0fa8c93357601c Dragos Tatulea 2026-02-23  5609  
df5135fced85bf Dragos Tatulea 2026-02-23  5610  static bool mlx5e_queue_validate_page_size(struct net_device *dev,
df5135fced85bf Dragos Tatulea 2026-02-23  5611  					   struct netdev_queue_config *qcfg,
df5135fced85bf Dragos Tatulea 2026-02-23  5612  					   int queue_index)
df5135fced85bf Dragos Tatulea 2026-02-23  5613  {
df5135fced85bf Dragos Tatulea 2026-02-23  5614  	if (qcfg->rx_page_size == PAGE_SIZE)
df5135fced85bf Dragos Tatulea 2026-02-23  5615  		return true;
df5135fced85bf Dragos Tatulea 2026-02-23  5616  
df5135fced85bf Dragos Tatulea 2026-02-23 @5617  	if (!netif_rxq_has_unreadable_mp(dev, queue_index))
df5135fced85bf Dragos Tatulea 2026-02-23  5618  		return false;
df5135fced85bf Dragos Tatulea 2026-02-23  5619  
df5135fced85bf Dragos Tatulea 2026-02-23  5620  	return true;
df5135fced85bf Dragos Tatulea 2026-02-23  5621  }
df5135fced85bf Dragos Tatulea 2026-02-23  5622  

:::::: The code at line 5617 was first introduced by commit
:::::: df5135fced85bf3c3dfe174f1cf853cdf39312e5 net/mlx5e: SHAMPO, Allow high order pages in zerocopy mode

:::::: TO: Dragos Tatulea <dtatulea@nvidia.com>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
