Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B205171A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 16:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727539524; cv=none; b=UL5T9ADCKERz6KJ7E86Fqjt4AcWtFxCVV+EFlIfHcKUuPORJjae1gWA/M7zJNRrp/g+P1zZ+RIq9CckHntfHwXUegYSWUaL9gTbmq6qRbyXxapRhtBDGH+ZNdOE051T044klcVUCZfqopKz7vfrlHEzkS8ugVyCnPxN3CNIvR0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727539524; c=relaxed/simple;
	bh=SAuxAgI1cu8ayZN3B2mf/WH0HYw3aDskboSM1ygd3Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LKF24n7E78a3+ktD5f4YCqUAbigvQ8uTumFssIcEDJZHfYELfqnr85+2FrXoLkoBqZR8otC4XKBQ2dBElY5nI5aTBa1sJKij7Z5mfaXYj/zrw2f5xkCm9vNtTzWTygrIhU7yFwOREZq8KFacOr3Pd0K5YRwloFrSXZbx91HMHbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NC9lSm5w; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NC9lSm5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727539521; x=1759075521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SAuxAgI1cu8ayZN3B2mf/WH0HYw3aDskboSM1ygd3Ts=;
  b=NC9lSm5wOX72MyZP4s/lEu8XyG675f2d6GEiD7MVfDYe9XkKH5P3ptIq
   3h25fia5Q4YoSg7LnPe3htrX8tJ3651rs/f4E7UEZ6DK7wIRP8TBOG46F
   fcHZ38LACFv8Bbr+Y4D2Lj86tLev+JL79rjPdev4fIXRVaRYp2Uir4Ybf
   SH0zs1tfOzpFIuyP4EycoLtPqC2cJDUw70nT8UlQ1Sy7ED8qrTeIOqpSH
   1FUhq8l1UZqoVQjPKn/dFWAJpmDWdu85dbSX0737rl+Ce30Oq3t1Vllq1
   NKNOmR1TNw5ujsNBe30BymOxk1bRUgZE3aqljBB5e4A3pG1eOOIyerYH7
   g==;
X-CSE-ConnectionGUID: xSziPpHFRlaNpJy1MH4f8A==
X-CSE-MsgGUID: jCvrac0lQgGxcZBr/GOg2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="38058816"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="38058816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 09:05:21 -0700
X-CSE-ConnectionGUID: /He6nM6NSjyjHMiff9AQyg==
X-CSE-MsgGUID: 3C0GTVcaSmqvGKlzZ+BNEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73257293"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Sep 2024 09:05:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suZwb-000NOj-1W;
	Sat, 28 Sep 2024 16:05:17 +0000
Date: Sun, 29 Sep 2024 00:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan <mufengyan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19782/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:3270:29: sparse: sparse:
 symbol 'hns3_unic_netdev_ops' was not declared. Should it be static?
Message-ID: <202409290026.ODSSLRxB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 737ec46e963210dc3b856637e871fa5b0c91316e [19782/30000] UNIC: Adds the process of UNIC driver initializing
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240929/202409290026.ODSSLRxB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409290026.ODSSLRxB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290026.ODSSLRxB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:1200:29: sparse: sparse: restricted __be32 degrades to integer
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:3270:29: sparse: sparse: symbol 'hns3_unic_netdev_ops' was not declared. Should it be static?

vim +/hns3_unic_netdev_ops +3270 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c

  3269	
> 3270	const struct net_device_ops hns3_unic_netdev_ops = {
  3271		.ndo_open		= hns3_nic_net_open,
  3272		.ndo_stop		= hns3_nic_net_stop,
  3273		.ndo_start_xmit		= hns3_nic_net_xmit,
  3274		.ndo_tx_timeout		= hns3_nic_net_timeout,
  3275		.ndo_do_ioctl		= hns3_nic_do_ioctl,
  3276		.ndo_change_mtu		= hns3_nic_change_mtu,
  3277		.ndo_set_features	= hns3_nic_set_features,
  3278		.ndo_features_check	= hns3_features_check,
  3279		.ndo_get_stats64	= hns3_nic_get_stats64,
  3280		.ndo_setup_tc		= hns3_nic_setup_tc,
  3281		.ndo_set_rx_mode	= hns3_nic_set_rx_mode,
  3282		.ndo_set_vf_trust	= hns3_set_vf_trust,
  3283	#ifdef CONFIG_RFS_ACCEL
  3284		.ndo_rx_flow_steer	= hns3_rx_flow_steer,
  3285	#endif
  3286		.ndo_get_vf_config	= hns3_nic_get_vf_config,
  3287		.ndo_set_vf_link_state	= hns3_nic_set_vf_link_state,
  3288		.ndo_set_vf_rate	= hns3_nic_set_vf_rate,
  3289		.ndo_select_queue	= hns3_nic_select_queue,
  3290	};
  3291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
