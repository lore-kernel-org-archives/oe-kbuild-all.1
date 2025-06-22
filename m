Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C569FC2FA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 22:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750629828; cv=none; b=rHTVHDhzTx+ic48S4oRrVc4o3MhegowvuNENAycjxXKV3yXxfikNL70yvpguD1yEqm+/W4QruZ/wqvnY04NRc8H87b+v7cQWstyEJOtFM+4nqmlnl3PsOdcr00UxSv3Am2X1A1sOahOtm4MYhNdKJksss5VatFmBDXVWEQ3cmaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750629828; c=relaxed/simple;
	bh=ANGU0DCspdY1g9fhEkU+ry8W/3n0SlbC5mWq78aX78M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BlEukrnSchJdwmnhy0PM2nqPJlVbxbRV23Dqk14MQJmbrWJYv5oKLszvq8XbNidHK6qLzJ/QVhC41MO5CUvlDxZeWrRHmrblBJjN+N4b7792IMirlAdvRv3lqVY6R2arzDhOeP4wxDuEsQA5x0Vtzp/78LkBg6PyIL9wdXA59N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvJI3RLE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvJI3RLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750629827; x=1782165827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ANGU0DCspdY1g9fhEkU+ry8W/3n0SlbC5mWq78aX78M=;
  b=IvJI3RLEhJtAj1pUtaetkvb9Sg7S9P7s6uPbpPtj9uqIwa4q8f/cNotv
   PC7TIffXzbYtmSnMT7259UPv5STvT+PeQ3C9/+B+mgLZuBIQF95rhBZYj
   QvcOEZXrqIrhL/QJ8CKjPZ8bInZzGDTllYNAKXWTga+8c5qI93kdyBraX
   0RtFFmPVmSaiV/vnUZ6jLGq6W+r89AajPVaEGRCPecZs8WYSnXYuCCDOd
   3/USrJde0alserVfR3K5gEAs8B4m8kKNBDbApvCJWelmrd2etAuje5z3j
   loq4MKziNnsw6OYz0hb3xPHbcpXJun95twkS4rNMttz9AW/PL2CfPfkSO
   Q==;
X-CSE-ConnectionGUID: BXQ6Cc9pTLGFFIPKnWZOng==
X-CSE-MsgGUID: H5hk3jBPR+K62DFjXIYTzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52545054"
X-IronPort-AV: E=Sophos;i="6.16,257,1744095600"; 
   d="scan'208";a="52545054"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 15:03:46 -0700
X-CSE-ConnectionGUID: SEszzUScRT6VUn3GywKB6Q==
X-CSE-MsgGUID: uMfBKESFQJeacNYDtplzNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,257,1744095600"; 
   d="scan'208";a="156913550"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2025 15:03:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTSms-000NXk-0W;
	Sun, 22 Jun 2025 22:03:42 +0000
Date: Mon, 23 Jun 2025 06:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: Erni Sri Satya Vennela <ernis@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Shradha Gupta <shradhagupta@linux.microsoft.com>,
	Saurabh Singh Sengar <ssengar@linux.microsoft.com>,
	Long Li <longli@microsoft.com>
Subject: [linux-next:master 3909/4336]
 drivers/net/ethernet/microsoft/mana/mana_en.c:804:10: error: 'const struct
 net_device_ops' has no member named 'net_shaper_ops'
Message-ID: <202506230625.bfUlqb8o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5d4809e25903ab8e74034c1f23c787fd26d52934
commit: 75cabb46935b6de8e2bdfde563e460ac41cfff12 [3909/4336] net: mana: Add support for net_shaper_ops
config: x86_64-randconfig-161-20250614 (https://download.01.org/0day-ci/archive/20250623/202506230625.bfUlqb8o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506230625.bfUlqb8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506230625.bfUlqb8o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/microsoft/mana/mana_en.c:804:10: error: 'const struct net_device_ops' has no member named 'net_shaper_ops'
     804 |         .net_shaper_ops         = &mana_shaper_ops,
         |          ^~~~~~~~~~~~~~
>> drivers/net/ethernet/microsoft/mana/mana_en.c:804:35: error: initialization of 'int (*)(struct net_device *, struct neigh_parms *)' from incompatible pointer type 'const struct net_shaper_ops *' [-Werror=incompatible-pointer-types]
     804 |         .net_shaper_ops         = &mana_shaper_ops,
         |                                   ^
   drivers/net/ethernet/microsoft/mana/mana_en.c:804:35: note: (near initialization for 'mana_devops.ndo_neigh_setup')
   cc1: some warnings being treated as errors


vim +804 drivers/net/ethernet/microsoft/mana/mana_en.c

   793	
   794	static const struct net_device_ops mana_devops = {
   795		.ndo_open		= mana_open,
   796		.ndo_stop		= mana_close,
   797		.ndo_select_queue	= mana_select_queue,
   798		.ndo_start_xmit		= mana_start_xmit,
   799		.ndo_validate_addr	= eth_validate_addr,
   800		.ndo_get_stats64	= mana_get_stats64,
   801		.ndo_bpf		= mana_bpf,
   802		.ndo_xdp_xmit		= mana_xdp_xmit,
   803		.ndo_change_mtu		= mana_change_mtu,
 > 804		.net_shaper_ops         = &mana_shaper_ops,
   805	};
   806	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
