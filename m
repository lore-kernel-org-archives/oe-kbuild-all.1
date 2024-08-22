Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D2F13C90A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724332991; cv=none; b=ku7iRSWU4OXqw7xfol0H/8ORWrLr6J7t3zsOZsnR0WPnJbHCOPGx6g+yxEH7vhtGh9FmrwRDnTSCBwxg8Vm93zAoHMg2CKc6oi2ttmJNv9/rStqqF+aZYtQs/e+XJhDKZ8V7MKWZYfqaSNvAr8cAU4Yhxq6tFYAPXfaY5dBsZJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724332991; c=relaxed/simple;
	bh=yIypRD1k6XYRabvVE3iB8FacqDj+VebCibjvHbTL5n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzXY1qULLDvmYJVWrpgcjezqRJq293k4FFDnuVB0rOT+OIPCuU7V+X0U8IQPjBxmNAbQpNFZlub+4m2t73beRBFlvixy8QK2ylCapFuUFJkU2rBV995di+/uvCVSGPGojIfNImMbeWbDmDNS8B4TgqNUVH8Ny5kaigkPLNLedtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dM6dqHWi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dM6dqHWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724332989; x=1755868989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yIypRD1k6XYRabvVE3iB8FacqDj+VebCibjvHbTL5n0=;
  b=dM6dqHWih/hBOal/lpZTRXjN6dmz1mHtAA7k1Ws2T0yQIOERWYgNzv4g
   +goJ19fm0aUik7b9o1frmy5wFsTmJw9gIX1m8+hzxY3vI4RNKIsohcmFa
   /wHxHJuCyOqksKkZFyfl2TPJt49awXtb4KInpmhLMUX9j+7cx9iD08X+/
   uogIXQSns4Bqj9ulYPuJiZ1OZY7JRZyz3+7b6UVwy0ACzxrR1tB4ZRNE/
   0so6JOsH/vHKV+pGkHxfh18fkOaQ9nZU7ptv4JkAWwK2TmYCF3+XRn6qj
   /Owp25FeqXjU7rDQG5erBsEUDmJy3kXBzCF9QcZmeMN7OY9qdBXDKZwKH
   w==;
X-CSE-ConnectionGUID: EfU6BWnrRwuQmvS7ESfCqw==
X-CSE-MsgGUID: x7McbkzYQjSBWIWJSxje2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34127241"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="34127241"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:23:09 -0700
X-CSE-ConnectionGUID: CVXLEPCkSP+q6m079s7p0Q==
X-CSE-MsgGUID: sUiTGApnS9yq75oR+nw3UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61465126"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Aug 2024 06:23:07 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh7mL-000CmT-1S;
	Thu, 22 Aug 2024 13:23:05 +0000
Date: Thu, 22 Aug 2024 21:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Wojciech Drewek <wojciech.drewek@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v10 14/14] iavf: add support
 for Rx timestamps to hotpath
Message-ID: <202408222123.LEHTAhtq-lkp@intel.com>
References: <20240821121539.374343-15-wojciech.drewek@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821121539.374343-15-wojciech.drewek@intel.com>

Hi Wojciech,

kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Wojciech-Drewek/virtchnl-add-support-for-enabling-PTP-on-iAVF/20240821-202156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20240821121539.374343-15-wojciech.drewek%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next v10 14/14] iavf: add support for Rx timestamps to hotpath
config: i386-buildonly-randconfig-002-20240822 (https://download.01.org/0day-ci/archive/20240822/202408222123.LEHTAhtq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408222123.LEHTAhtq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408222123.LEHTAhtq-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_hwstamp_set':
   drivers/net/ethernet/intel/iavf/iavf_main.c:5095: undefined reference to `iavf_ptp_set_ts_config'
   ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_select_rx_desc_format':
>> drivers/net/ethernet/intel/iavf/iavf_main.c:734: undefined reference to `iavf_ptp_cap_supported'
   ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_remove':
   drivers/net/ethernet/intel/iavf/iavf_main.c:5517: undefined reference to `iavf_ptp_release'
   ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_init_config_adapter':
   drivers/net/ethernet/intel/iavf/iavf_main.c:2851: undefined reference to `iavf_ptp_init'
   ld: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: in function `iavf_configure_queues':
   drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:409: undefined reference to `iavf_ptp_cap_supported'
   ld: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: in function `iavf_virtchnl_completion':
   drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:2595: undefined reference to `iavf_ptp_process_caps'
   ld: drivers/net/ethernet/intel/iavf/iavf_txrx.o: in function `iavf_flex_rx_tstamp':
>> drivers/net/ethernet/intel/iavf/iavf_txrx.c:1124: undefined reference to `iavf_ptp_extend_32b_timestamp'
   ld: net/core/net-sysfs.o: in function `netdev_queue_update_kobjects':
   net/core/net-sysfs.c:1852: undefined reference to `dql_group'
   ld: net/core/net-sysfs.o: in function `netdev_queue_add_kobject':
   net/core/net-sysfs.c:1792: undefined reference to `dql_group'


vim +734 drivers/net/ethernet/intel/iavf/iavf_main.c

   712	
   713	/**
   714	 * iavf_select_rx_desc_format - Select Rx descriptor format
   715	 * @adapter: adapter private structure
   716	 *
   717	 * Select what Rx descriptor format based on availability and enabled
   718	 * features.
   719	 *
   720	 * Return: the desired RXDID to select for a given Rx queue, as defined by
   721	 *         enum virtchnl_rxdid_format.
   722	 */
   723	static u8 iavf_select_rx_desc_format(const struct iavf_adapter *adapter)
   724	{
   725		u64 rxdids = adapter->supp_rxdids;
   726	
   727		/* If we did not negotiate VIRTCHNL_VF_OFFLOAD_RX_FLEX_DESC, we must
   728		 * stick with the default value of the legacy 32 byte format.
   729		 */
   730		if (!IAVF_RXDID_ALLOWED(adapter))
   731			return VIRTCHNL_RXDID_1_32B_BASE;
   732	
   733		/* Rx timestamping requires the use of flexible NIC descriptors */
 > 734		if (iavf_ptp_cap_supported(adapter, VIRTCHNL_1588_PTP_CAP_RX_TSTAMP)) {
   735			if (rxdids & BIT(VIRTCHNL_RXDID_2_FLEX_SQ_NIC))
   736				return VIRTCHNL_RXDID_2_FLEX_SQ_NIC;
   737	
   738			pci_warn(adapter->pdev,
   739				 "Unable to negotiate flexible descriptor format\n");
   740		}
   741	
   742		/* Warn if the PF does not list support for the default legacy
   743		 * descriptor format. This shouldn't happen, as this is the format
   744		 * used if VIRTCHNL_VF_OFFLOAD_RX_FLEX_DESC is not supported. It is
   745		 * likely caused by a bug in the PF implementation failing to indicate
   746		 * support for the format.
   747		 */
   748		if (!(rxdids & VIRTCHNL_RXDID_1_32B_BASE_M))
   749			pci_warn(adapter->pdev, "PF does not list support for default Rx descriptor format\n");
   750	
   751		return VIRTCHNL_RXDID_1_32B_BASE;
   752	}
   753	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
