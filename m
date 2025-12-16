Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8462270ED7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 05:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765863973; cv=none; b=OE37eJrP4S3fItQsPVvTGYRW43+M2CtvhgbrfZ3E2hflf6eHkKsriYlwWRsqzFUAyVHdtSY3RoEon1PsIpzt69z4VL8Hpbxk4ZR2EjvhG6bSNRes8QGNSBTTivV7AIrAbDi7C7W4nWNoGWjSwYVwuFOIbvqHTZ89wwiLPcyEspU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765863973; c=relaxed/simple;
	bh=589Sl9F1F7kyYQXD9MqPN9nLC6dd9osdanTiND3REr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XDvZm4CK3OLeT/w4Mc08uOV2Bsg+AQ4KuqJIofs2KIYiYGK9SQCdaswGC2QYY0PvqqIQIJmJBP6Jz3RwQ7Tr6eA7NlfYvetS2AvqrwF1HL27uGCnRoHjjFH9ib8pJ1nCoVRfBYwM68zdJUG/0YGjwnSQasSlIkKQYi4KEY0ip5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUh1gCy1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUh1gCy1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765863970; x=1797399970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=589Sl9F1F7kyYQXD9MqPN9nLC6dd9osdanTiND3REr0=;
  b=AUh1gCy1EsJYfYMAp+LmwXfUu/TRRjgRXb9ZAHYPq1Jf65/7+5ArFhjr
   kYmAqNa+9zeI/4NaVJ73d8PVIf/Mhg+pyTbEwiBOXszJRre451b6LVki2
   1tvEJHPxGSDgQFUU/bvJqVSO4jDIyvK415VMXrTnQBMGWRF6hq8t4b7/i
   9Z1ELpZGvTDTx9ZAFkSq58rzdAzG881lwp1B9HezwFOmuij1rR6oTpnz4
   xQQSSKDKdBgWtPFKUsdJ/n3XkI99/+1xL8hVC77EhPOilzNIOWWnbPfRn
   Ma7/WIrJ8ymkQkY4TR5cUeV0qZ6kogXV1WaCOOBFUUif7DEL7VjyKJffW
   A==;
X-CSE-ConnectionGUID: fdY9YkbgQRKawZ8PJ/TL4Q==
X-CSE-MsgGUID: 6qQxRjirSAW98BfgbTRC5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85187788"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="85187788"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 21:46:03 -0800
X-CSE-ConnectionGUID: 7jgINkIqSEayOH+KNhGg8w==
X-CSE-MsgGUID: DaKYssWaRlC1Lpcf0Ja/xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="235326977"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Dec 2025 21:46:02 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVNsl-000000001Ct-2ful;
	Tue, 16 Dec 2025 05:45:59 +0000
Date: Tue, 16 Dec 2025 13:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:31:27: warning:
 'pct_exp_name' defined but not used
Message-ID: <202512161331.oYVCXfSO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   48fa9d861c1eb99e9f682fb2623142fb456aa0eb
commit: 010d87517fe5ef837b847f17db54328aee3b6e07 [25/25] anolis: drivers: support for xsc drivers from Yunsilicon Technology
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251216/202512161331.oYVCXfSO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161331.oYVCXfSO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161331.oYVCXfSO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:182:5: warning: no previous prototype for 'xsc_priv_flags_num' [-Wmissing-prototypes]
     182 | int xsc_priv_flags_num(void)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:187:13: warning: no previous prototype for 'xsc_priv_flags_name' [-Wmissing-prototypes]
     187 | const char *xsc_priv_flags_name(int flag)
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:213:5: warning: no previous prototype for 'xsc_set_priv_flags' [-Wmissing-prototypes]
     213 | int xsc_set_priv_flags(struct net_device *dev, u32 pflags)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:369:5: warning: no previous prototype for 'xsc_get_priv_flags' [-Wmissing-prototypes]
     369 | u32 xsc_get_priv_flags(struct net_device *dev)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:849:5: warning: no previous prototype for 'xsc_get_rxnfc' [-Wmissing-prototypes]
     849 | int xsc_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *info, u32 *rule_locs)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:872:5: warning: no previous prototype for 'xsc_set_rxnfc' [-Wmissing-prototypes]
     872 | int xsc_set_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:901:5: warning: no previous prototype for 'xsc_get_rxfh' [-Wmissing-prototypes]
     901 | int xsc_get_rxfh(struct net_device *netdev, u32 *indir, u8 *key, u8 *hfunc)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:920:5: warning: no previous prototype for 'xsc_set_rxfh' [-Wmissing-prototypes]
     920 | int xsc_set_rxfh(struct net_device *dev, const u32 *indir, const u8 *key, const u8 hfunc)
         |     ^~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:31:27: warning: 'pct_exp_name' defined but not used [-Wunused-const-variable=]
      31 | static const char * const pct_exp_name[] = {"N", "E" };
         |                           ^~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:30:27: warning: 'pp_tbl_dma_name' defined but not used [-Wunused-const-variable=]
      30 | static const char * const pp_tbl_dma_name[] = {"N", "D" };
         |                           ^~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:29:27: warning: 'anlt_fec_name' defined but not used [-Wunused-const-variable=]
      29 | static const char * const anlt_fec_name[] = {"N", "A" };
         |                           ^~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:28:27: warning: 'ma_xbar_name' defined but not used [-Wunused-const-variable=]
      28 | static const char * const ma_xbar_name[] = {"N", "X" };
         |                           ^~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:27:27: warning: 'rdma_icrc_name' defined but not used [-Wunused-const-variable=]
      27 | static const char * const rdma_icrc_name[] = {"N", "C" };
         |                           ^~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:26:27: warning: 'onchip_ft_name' defined but not used [-Wunused-const-variable=]
      26 | static const char * const onchip_ft_name[] = {"N", "O" };
         |                           ^~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:25:27: warning: 'hps_ddr_name' defined but not used [-Wunused-const-variable=]
      25 | static const char * const hps_ddr_name[] = {"1", "2", "4", "unknown"};
         |                           ^~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:24:27: warning: 'fpga_type_name' defined but not used [-Wunused-const-variable=]
      24 | static const char * const fpga_type_name[] = {"S", "L"};
         |                           ^~~~~~~~~~~~~~


vim +/pct_exp_name +31 drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c

    23	
  > 24	static const char * const fpga_type_name[] = {"S", "L"};
    25	static const char * const hps_ddr_name[] = {"1", "2", "4", "unknown"};
    26	static const char * const onchip_ft_name[] = {"N", "O" };
    27	static const char * const rdma_icrc_name[] = {"N", "C" };
    28	static const char * const ma_xbar_name[] = {"N", "X" };
    29	static const char * const anlt_fec_name[] = {"N", "A" };
    30	static const char * const pp_tbl_dma_name[] = {"N", "D" };
  > 31	static const char * const pct_exp_name[] = {"N", "E" };
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
