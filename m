Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1B721348
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 16:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740759020; cv=none; b=QioUhpozxnxHGhpDLrjLSVA8lkmQJR9trTzgIwmb0FU/FRbFFgf4S8GDMYM6hDc808J4fvRFZ9eMDiLzjHr0z7oXPO4VLe4gHK2isyXfH4sJL64+9HYT61nrWkA74+YfW+l5/7YRndzFdv95e68nRu2wrGD6QtlyIRJI48njD88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740759020; c=relaxed/simple;
	bh=6glGZMK6FSS238hev/0cHpExwDQb1spQsjweuCfBKmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5ff0dR7nShXlyNPxufu9nyUybvjmk+nmEMqdPh8+jiyaMDjgyTpP9oEibQAskHc5Vdx8Iaw/k4SRYt6N5ssRiUgIzpRzQXSgSzmumlYnOO2XKhP38dhusGTLmr8KOraWqOlan0J2T7DlS39KPnaUn+lLOTg3DtxFThv672Mu1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=coq6VUSc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="coq6VUSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740759018; x=1772295018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6glGZMK6FSS238hev/0cHpExwDQb1spQsjweuCfBKmQ=;
  b=coq6VUScvE8FJbWumELChJFeX0Lk21cXoB9yUcHwrcvUsijY8s8o3Zf3
   PRAQ+4ZBwWVuRD27b1t6po3j6NkvIzYmdUYvOvDsW1dHkxZQ1dDJKwFs0
   0gw3JvwJQrN8661KSkxYmnmPLDr25Gh6+pqazdK3l+rUMfYk7yA595fiR
   qGbZIbvS+27qhMCmsm8TCz/EcnyrzSCEtgL00Byx9SBciI9ScgSHBRbTs
   TnA0rwa6G6F3wQ8bQkkCU9ugrndtw4gje8/VrfjQc9BUB2jAP541kCIWw
   7ZH8WevIMoJvEcCzDzcAvpLWSIAGxwilz3jULwSK2VIH51i7xLU3/ogWB
   Q==;
X-CSE-ConnectionGUID: mmP4O8uRScSn9jdwjA1//w==
X-CSE-MsgGUID: ecJjY74RQUKtKgBSb0yGVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41820202"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="41820202"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 08:10:15 -0800
X-CSE-ConnectionGUID: NHKvwC71Tta+34UvaiVKjg==
X-CSE-MsgGUID: ZI9A5pB8QQ2UveJt7MXtnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118288109"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Feb 2025 08:10:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to2vx-000FAG-0U;
	Fri, 28 Feb 2025 16:09:58 +0000
Date: Sat, 1 Mar 2025 00:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [linux-next:master 4485/7423]
 drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:483: undefined reference to
 `ptp_clock_index'
Message-ID: <202502282345.HvKNSdqB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0eb65494e59d9834af7cbad983629e9017b25a1
commit: ce114069a654be6b1597da983a201c72ceca7a85 [4485/7423] net: wangxun: Support to get ts info
config: x86_64-randconfig-121-20250226 (https://download.01.org/0day-ci/archive/20250228/202502282345.HvKNSdqB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502282345.HvKNSdqB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502282345.HvKNSdqB-lkp@intel.com/

Note: the linux-next/master HEAD c0eb65494e59d9834af7cbad983629e9017b25a1 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/wangxun/libwx/wx_lib.o: in function `wx_clean_tx_irq':
   drivers/net/ethernet/wangxun/libwx/wx_lib.c:754: undefined reference to `ptp_schedule_worker'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_ts_info':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:483: undefined reference to `ptp_clock_index'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_create_clock':
   drivers/net/ethernet/wangxun/libwx/wx_ptp.c:251: undefined reference to `ptp_clock_register'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_stop':
   drivers/net/ethernet/wangxun/libwx/wx_ptp.c:536: undefined reference to `ptp_clock_unregister'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LIBWX
   Depends on [m]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PTP_1588_CLOCK_OPTIONAL [=m]
   Selected by [y]:
   - NGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]


vim +483 drivers/net/ethernet/wangxun/libwx/wx_ethtool.c

   458	
   459	int wx_get_ts_info(struct net_device *dev,
   460			   struct kernel_ethtool_ts_info *info)
   461	{
   462		struct wx *wx = netdev_priv(dev);
   463	
   464		info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) |
   465				   BIT(HWTSTAMP_FILTER_PTP_V1_L4_SYNC) |
   466				   BIT(HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ) |
   467				   BIT(HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
   468				   BIT(HWTSTAMP_FILTER_PTP_V2_L4_EVENT) |
   469				   BIT(HWTSTAMP_FILTER_PTP_V2_SYNC) |
   470				   BIT(HWTSTAMP_FILTER_PTP_V2_L2_SYNC) |
   471				   BIT(HWTSTAMP_FILTER_PTP_V2_L4_SYNC) |
   472				   BIT(HWTSTAMP_FILTER_PTP_V2_DELAY_REQ) |
   473				   BIT(HWTSTAMP_FILTER_PTP_V2_L2_DELAY_REQ) |
   474				   BIT(HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ) |
   475				   BIT(HWTSTAMP_FILTER_PTP_V2_EVENT);
   476	
   477		info->so_timestamping = SOF_TIMESTAMPING_TX_SOFTWARE |
   478					SOF_TIMESTAMPING_TX_HARDWARE |
   479					SOF_TIMESTAMPING_RX_HARDWARE |
   480					SOF_TIMESTAMPING_RAW_HARDWARE;
   481	
   482		if (wx->ptp_clock)
 > 483			info->phc_index = ptp_clock_index(wx->ptp_clock);
   484		else
   485			info->phc_index = -1;
   486	
   487		info->tx_types = BIT(HWTSTAMP_TX_OFF) |
   488				 BIT(HWTSTAMP_TX_ON);
   489	
   490		return 0;
   491	}
   492	EXPORT_SYMBOL(wx_get_ts_info);
   493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
