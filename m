Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A8A81720
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 11:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760699973; cv=none; b=F0fsFosTQ/t90Hl3jv5ixFDaR/89uD69evAtQPNjOGxRWpvHKa2YJRAyN5d7P9USTGwao/CzIypSL4FBLU241E1Tx/R+IQM5q64/weFaPROFckGCR4AbYSR1Ig+bZmYrQ3rX9dD4YTz+mRAQ0V48uCPJzSq19cmn5aJhNPL50Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760699973; c=relaxed/simple;
	bh=8MsOM03pXc7Ax5q0mCwysYrX9pm4sTnoctwX/A8aheI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AX2yAdC5oQ1SGC/Ep+DJjCL6WhwBQxNjFpm5h6VztIIv7JuUOwoJIjjJtRLK1APfwBzrqMwoJ7S95CSDQZB2IXF3fXRbXHzMZyG6yxztfAzTtCUaegB7YYH5OW5+9STtSEfwvi18SntwUcB3cjqjGsPEH3e0+/MiXeqYAhtmMxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=koOPdFzY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="koOPdFzY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760699971; x=1792235971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8MsOM03pXc7Ax5q0mCwysYrX9pm4sTnoctwX/A8aheI=;
  b=koOPdFzYz1z9CDOyMXM0I0MmiwYMtwjbWa0ZCombvHgyL3XNgZe7u9d4
   FG/joQYD6/slHC+b2GsbDsT2sw3qk4g9Qb9tK8eGob4FFGzDS0+70B9mR
   Q3GCJL/u7UDPOUqby/3uWrv6onqRl4B2tHIpUZ67s90Z44A3knfoOyF4i
   a/JKT3E39l42xmGD0ir5qcL8dbJJ9urJTdkMtyt+ms0XfB+lAiO595z7A
   QDSgh8yhF6Wmnw9HzTgijaz5Roh7ffUDj9qFpqRKQQjDD2M+XavQ6GMcR
   eGqAsHqcUL85bmcDeCRrHFstw3p/HFct8iAoe0A1Go4mwuC9djsg6cIE1
   g==;
X-CSE-ConnectionGUID: OPtQEYO8RyuP/vtIQNeubg==
X-CSE-MsgGUID: THbQNdRXTv2nNklw6dHw/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66555801"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="66555801"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 04:19:31 -0700
X-CSE-ConnectionGUID: fWzu1B5mRIW0L/ehNOHJdw==
X-CSE-MsgGUID: HgYRS2rJToewAFu3pfjVbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="213679277"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2025 04:19:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9iUV-0005uF-0R;
	Fri, 17 Oct 2025 11:19:23 +0000
Date: Fri, 17 Oct 2025 19:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH net-next 6/6] net: hns3: add hwtstamp_get/hwtstamp_set ops
Message-ID: <202510171940.xIqxEaCD-lkp@intel.com>
References: <20251016180727.3511399-7-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016180727.3511399-7-vadim.fedorenko@linux.dev>

Hi Vadim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/octeontx2-convert-to-ndo_hwtstamp-API/20251017-021210
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251016180727.3511399-7-vadim.fedorenko%40linux.dev
patch subject: [PATCH net-next 6/6] net: hns3: add hwtstamp_get/hwtstamp_set ops
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251017/202510171940.xIqxEaCD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171940.xIqxEaCD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171940.xIqxEaCD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:2436:12: warning: 'hns3_nic_hwtstamp_set' defined but not used [-Wunused-function]
    2436 | static int hns3_nic_hwtstamp_set(struct net_device *netdev,
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:2422:12: warning: 'hns3_nic_hwtstamp_get' defined but not used [-Wunused-function]
    2422 | static int hns3_nic_hwtstamp_get(struct net_device *netdev,
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/hns3_nic_hwtstamp_set +2436 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c

  2421	
> 2422	static int hns3_nic_hwtstamp_get(struct net_device *netdev,
  2423					 struct kernel_hwtstamp_config *config)
  2424	{
  2425		struct hnae3_handle *h = hns3_get_handle(netdev);
  2426	
  2427		if (!netif_running(netdev))
  2428			return -EINVAL;
  2429	
  2430		if (!h->ae_algo->ops->hwtstamp_get)
  2431			return -EOPNOTSUPP;
  2432	
  2433		return h->ae_algo->ops->hwtstamp_get(h, config);
  2434	}
  2435	
> 2436	static int hns3_nic_hwtstamp_set(struct net_device *netdev,
  2437					 struct kernel_hwtstamp_config *config,
  2438					 struct netlink_ext_ack *extack)
  2439	{
  2440		struct hnae3_handle *h = hns3_get_handle(netdev);
  2441	
  2442		if (!netif_running(netdev))
  2443			return -EINVAL;
  2444	
  2445		if (!h->ae_algo->ops->hwtstamp_set)
  2446			return -EOPNOTSUPP;
  2447	
  2448		return h->ae_algo->ops->hwtstamp_set(h, config, extack);
  2449	}
  2450	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
