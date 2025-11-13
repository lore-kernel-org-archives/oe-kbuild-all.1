Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EA33054F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009429; cv=none; b=DUaVnC2VheO32ojLRIY7/DzPzejgDddFDaSLV95p2Rc90AQ11ZYbRXaJBcO2V6IiXPF0Pv+YzXa8EyFD3vfudg+PCF+h0LQCVL1zX7gpAUuTHoNonJt+zZ7EUGXKpFhA8PUrFZNlvNioe61inD9fhkJCa8iY6cR7otllcFwEuks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009429; c=relaxed/simple;
	bh=90ttPY1qI/ixvslP1H1VXQfWx72HxaioAD+B6TMWq8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIv+acNuwuS5Y8tgmyXS5xv5GCnACMLyNgG1uDY6SDVWx/zUKsNDOzZmqupkLeqdBfQDbAjIRnpubMnlfupHFFgpaGF3QKFVTGcgNUW3JQ3Q9+Omsu/D2z9iZuMbXyYwybJPXbKxVywPEvhcwcnabQXeR/0qIdHBcV2I/7Go7TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tsv9m/Mh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tsv9m/Mh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009428; x=1794545428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=90ttPY1qI/ixvslP1H1VXQfWx72HxaioAD+B6TMWq8k=;
  b=Tsv9m/MhRJeiAar69DuEizfbq1vJWEKdNco735cJekQTXevctdO3hwQK
   1jybXOoBp1/h4QG+IeLFXK0JaR5xujJYl2GlVMJO8ho3jYI+6A1pvClKb
   dIsrNvs6Lpdxrkw2xzIm8y5uVo9CQGqomddWowFr6TU5PCL1r4kejM2hM
   +vDYZewqiXO/mud8IgNC5fBXUWl+wWmIn+9SHwTZk5TEuUbrL7lROMiZG
   uvtUd+hzMx9RwLduqQc4WxHc5XwdELTXKG0bYsAtj4FWeFB9pnZNiZeDa
   VJmMdXKx7sdcLD9HnWFLcvfvdwLuSLHNfSD/XmYXyN/sQhHS5Git6mvNd
   Q==;
X-CSE-ConnectionGUID: lFUGvYNOQn2q+WFgdADOEg==
X-CSE-MsgGUID: swmOSxrVSiq/0WdjdS5aEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68947849"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="68947849"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:50:25 -0800
X-CSE-ConnectionGUID: xZPmvstDSqm4XKzyYbWeug==
X-CSE-MsgGUID: KFMe4rC1TxmUXAbV/+YC+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="212789118"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2025 20:50:20 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPHm-0004sf-2D;
	Thu, 13 Nov 2025 04:50:18 +0000
Date: Thu, 13 Nov 2025 12:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrei Botila <andrei.botila@oss.nxp.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH net-next 1/8] phy: add hwtstamp_get callback to retrieve
 config
Message-ID: <202511122341.yMQLxKfa-lkp@intel.com>
References: <20251112000257.1079049-2-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112000257.1079049-2-vadim.fedorenko@linux.dev>

Hi Vadim,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/phy-add-hwtstamp_get-callback-to-retrieve-config/20251112-080606
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251112000257.1079049-2-vadim.fedorenko%40linux.dev
patch subject: [PATCH net-next 1/8] phy: add hwtstamp_get callback to retrieve config
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251112/202511122341.yMQLxKfa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511122341.yMQLxKfa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511122341.yMQLxKfa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/ti/netcp_ethss.c: In function 'gbe_hwtstamp_set':
>> drivers/net/ethernet/ti/netcp_ethss.c:2660:37: error: 'struct mii_timestamper' has no member named 'hwtstamp'; did you mean 'rxtstamp'?
    2660 |                 return phy->mii_ts->hwtstamp(phy->mii_ts, cfg, extack);
         |                                     ^~~~~~~~
         |                                     rxtstamp


vim +2660 drivers/net/ethernet/ti/netcp_ethss.c

6246168b4a3835 WingMan Kwok    2016-12-08  2645  
3f02b82725576a Vadim Fedorenko 2025-11-03  2646  static int gbe_hwtstamp_set(void *intf_priv, struct kernel_hwtstamp_config *cfg,
3f02b82725576a Vadim Fedorenko 2025-11-03  2647  			    struct netlink_ext_ack *extack)
6246168b4a3835 WingMan Kwok    2016-12-08  2648  {
3f02b82725576a Vadim Fedorenko 2025-11-03  2649  	struct gbe_intf *gbe_intf = intf_priv;
3f02b82725576a Vadim Fedorenko 2025-11-03  2650  	struct gbe_priv *gbe_dev;
3f02b82725576a Vadim Fedorenko 2025-11-03  2651  	struct phy_device *phy;
3f02b82725576a Vadim Fedorenko 2025-11-03  2652  
3f02b82725576a Vadim Fedorenko 2025-11-03  2653  	gbe_dev = gbe_intf->gbe_dev;
6246168b4a3835 WingMan Kwok    2016-12-08  2654  
3f02b82725576a Vadim Fedorenko 2025-11-03  2655  	if (!gbe_dev->cpts)
6246168b4a3835 WingMan Kwok    2016-12-08  2656  		return -EOPNOTSUPP;
6246168b4a3835 WingMan Kwok    2016-12-08  2657  
3f02b82725576a Vadim Fedorenko 2025-11-03  2658  	phy = gbe_intf->slave->phy;
3f02b82725576a Vadim Fedorenko 2025-11-03  2659  	if (phy_has_hwtstamp(phy))
3f02b82725576a Vadim Fedorenko 2025-11-03 @2660  		return phy->mii_ts->hwtstamp(phy->mii_ts, cfg, extack);
6246168b4a3835 WingMan Kwok    2016-12-08  2661  
3f02b82725576a Vadim Fedorenko 2025-11-03  2662  	switch (cfg->tx_type) {
6246168b4a3835 WingMan Kwok    2016-12-08  2663  	case HWTSTAMP_TX_OFF:
a9423120343cb5 Ivan Khoronzhuk 2018-11-12  2664  		gbe_dev->tx_ts_enabled = 0;
6246168b4a3835 WingMan Kwok    2016-12-08  2665  		break;
6246168b4a3835 WingMan Kwok    2016-12-08  2666  	case HWTSTAMP_TX_ON:
a9423120343cb5 Ivan Khoronzhuk 2018-11-12  2667  		gbe_dev->tx_ts_enabled = 1;
6246168b4a3835 WingMan Kwok    2016-12-08  2668  		break;
6246168b4a3835 WingMan Kwok    2016-12-08  2669  	default:
6246168b4a3835 WingMan Kwok    2016-12-08  2670  		return -ERANGE;
6246168b4a3835 WingMan Kwok    2016-12-08  2671  	}
6246168b4a3835 WingMan Kwok    2016-12-08  2672  
3f02b82725576a Vadim Fedorenko 2025-11-03  2673  	switch (cfg->rx_filter) {
6246168b4a3835 WingMan Kwok    2016-12-08  2674  	case HWTSTAMP_FILTER_NONE:
a9423120343cb5 Ivan Khoronzhuk 2018-11-12  2675  		gbe_dev->rx_ts_enabled = HWTSTAMP_FILTER_NONE;
6246168b4a3835 WingMan Kwok    2016-12-08  2676  		break;
6246168b4a3835 WingMan Kwok    2016-12-08  2677  	case HWTSTAMP_FILTER_PTP_V1_L4_EVENT:
6246168b4a3835 WingMan Kwok    2016-12-08  2678  	case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
6246168b4a3835 WingMan Kwok    2016-12-08  2679  	case HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ:
a9423120343cb5 Ivan Khoronzhuk 2018-11-12  2680  		gbe_dev->rx_ts_enabled = HWTSTAMP_FILTER_PTP_V1_L4_EVENT;
3f02b82725576a Vadim Fedorenko 2025-11-03  2681  		cfg->rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_EVENT;
6246168b4a3835 WingMan Kwok    2016-12-08  2682  		break;
6246168b4a3835 WingMan Kwok    2016-12-08  2683  	case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
6246168b4a3835 WingMan Kwok    2016-12-08  2684  	case HWTSTAMP_FILTER_PTP_V2_L4_SYNC:
6246168b4a3835 WingMan Kwok    2016-12-08  2685  	case HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ:
6246168b4a3835 WingMan Kwok    2016-12-08  2686  	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
6246168b4a3835 WingMan Kwok    2016-12-08  2687  	case HWTSTAMP_FILTER_PTP_V2_L2_SYNC:
6246168b4a3835 WingMan Kwok    2016-12-08  2688  	case HWTSTAMP_FILTER_PTP_V2_L2_DELAY_REQ:
6246168b4a3835 WingMan Kwok    2016-12-08  2689  	case HWTSTAMP_FILTER_PTP_V2_EVENT:
6246168b4a3835 WingMan Kwok    2016-12-08  2690  	case HWTSTAMP_FILTER_PTP_V2_SYNC:
6246168b4a3835 WingMan Kwok    2016-12-08  2691  	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
a9423120343cb5 Ivan Khoronzhuk 2018-11-12  2692  		gbe_dev->rx_ts_enabled = HWTSTAMP_FILTER_PTP_V2_EVENT;
3f02b82725576a Vadim Fedorenko 2025-11-03  2693  		cfg->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
6246168b4a3835 WingMan Kwok    2016-12-08  2694  		break;
6246168b4a3835 WingMan Kwok    2016-12-08  2695  	default:
6246168b4a3835 WingMan Kwok    2016-12-08  2696  		return -ERANGE;
6246168b4a3835 WingMan Kwok    2016-12-08  2697  	}
6246168b4a3835 WingMan Kwok    2016-12-08  2698  
6246168b4a3835 WingMan Kwok    2016-12-08  2699  	gbe_hwtstamp(gbe_intf);
6246168b4a3835 WingMan Kwok    2016-12-08  2700  
3f02b82725576a Vadim Fedorenko 2025-11-03  2701  	return 0;
6246168b4a3835 WingMan Kwok    2016-12-08  2702  }
6246168b4a3835 WingMan Kwok    2016-12-08  2703  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
