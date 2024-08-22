Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A735B1CAA6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724310778; cv=none; b=WPs4WxnLBR5ys0p0n32gXa2jQZvGeasLCe9ftIkdiOoefi1nlgoJm96C66UfqV3r4Z5zMqQEWtCEKX7iP8KsyVRipx+J61dHDEVR+JFp1Daki8/RkVrSSofwmbqzCX4ZE9br9nwGXcDNZITil6gAuE87l6auy+56stpBs/DxooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724310778; c=relaxed/simple;
	bh=cXKkfVg5x/qVhIrVLFOzvlCLydqEAc0iTQbro2Dmxuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pikm7j0wNkSeTlZsMvSj3EMBUASI08OVTnF3Vx+RWW3/tsN/3n74H8VPHW5y2tkeDY3frU2wXZCQ6Pk/+5y9zp6mGdqoJfGXEwPJFRnVrli+2tNn1ZUw6ELgJC90U92+QFXm1S1SkBomkaTg4X9vZtpViurSqh++P4Y9r+gpkWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlbNDrTW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlbNDrTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724310777; x=1755846777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cXKkfVg5x/qVhIrVLFOzvlCLydqEAc0iTQbro2Dmxuo=;
  b=SlbNDrTW6PI7YMHRaRoiG9jPBSpq2CGTS2zLkOa0oejWedW4KTMQbNjY
   OnYWXsliAeG/Wp4Xz1sdf2PzFDnUivgxo9I1xsaXOcexlRRXt9DGxemnk
   3FfjX5cjMzGDoMe2Ke5e62HZH2CiQa3KsKYNapt+x7oLFR3jiYtYHhvTO
   6x67Bp7t5Wfab0n1Cy3JoeSGJGWh1YXA9MWAKUV+qKKNcSy+rBG89Y3vs
   cV4uGjJFiBngulQr9ux+tNxqNg9obdUROvHdfvlgwH+InoNFhd1bjMOfL
   Gt6xhiUDku1TjtLKTS9KVYPMrUZZNWl4AbU3Zt5IGyv2RlB7bCG2qbYKQ
   w==;
X-CSE-ConnectionGUID: FQvMjBE6Tl2eZZqADUDtuw==
X-CSE-MsgGUID: gfVQimcBTK65tsTOK28aNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22860442"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22860442"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 00:12:57 -0700
X-CSE-ConnectionGUID: u73+OdXBTkCzPEnjPhK/Dw==
X-CSE-MsgGUID: z/0xb2/eT0OYs11eRz18IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="66291821"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Aug 2024 00:12:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh205-000CWY-12;
	Thu, 22 Aug 2024 07:12:53 +0000
Date: Thu, 22 Aug 2024 15:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: Wojciech Drewek <wojciech.drewek@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v10 13/14] iavf: handle set
 and get timestamps ops
Message-ID: <202408221439.JAkhKOoS-lkp@intel.com>
References: <20240821121539.374343-14-wojciech.drewek@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821121539.374343-14-wojciech.drewek@intel.com>

Hi Wojciech,

kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Wojciech-Drewek/virtchnl-add-support-for-enabling-PTP-on-iAVF/20240821-202156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20240821121539.374343-14-wojciech.drewek%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next v10 13/14] iavf: handle set and get timestamps ops
config: i386-buildonly-randconfig-002-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221439.JAkhKOoS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221439.JAkhKOoS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221439.JAkhKOoS-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_hwstamp_set':
>> drivers/net/ethernet/intel/iavf/iavf_main.c:5086: undefined reference to `iavf_ptp_set_ts_config'
   ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_remove':
   drivers/net/ethernet/intel/iavf/iavf_main.c:5508: undefined reference to `iavf_ptp_release'
   ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_init_config_adapter':
   drivers/net/ethernet/intel/iavf/iavf_main.c:2842: undefined reference to `iavf_ptp_init'
   ld: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: in function `iavf_configure_queues':
   drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:409: undefined reference to `iavf_ptp_cap_supported'
   ld: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: in function `iavf_virtchnl_completion':
   drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:2595: undefined reference to `iavf_ptp_process_caps'
   ld: net/core/net-sysfs.o: in function `netdev_queue_update_kobjects':
   net/core/net-sysfs.c:1852: undefined reference to `dql_group'
   ld: net/core/net-sysfs.o: in function `netdev_queue_add_kobject':
   net/core/net-sysfs.c:1792: undefined reference to `dql_group'


vim +5086 drivers/net/ethernet/intel/iavf/iavf_main.c

  5079	
  5080	static int iavf_hwstamp_set(struct net_device *netdev,
  5081				    struct kernel_hwtstamp_config *config,
  5082				    struct netlink_ext_ack *extack)
  5083	{
  5084		struct iavf_adapter *adapter = netdev_priv(netdev);
  5085	
> 5086		return iavf_ptp_set_ts_config(adapter, config, extack);
  5087	}
  5088	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
