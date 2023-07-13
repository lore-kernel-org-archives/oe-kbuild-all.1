Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D831F192
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 17:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689269533; x=1720805533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aqZZR5aSFyb3ihHjWvKtkrN0ttaooxoQga5SzvgHaRk=;
  b=fQWvmKSdi+fXaEOeEarxNGqsymm+DeAomUAxShQutCIYbn+ZJfYOVkM5
   Wgsev/vx5L2ttF3t7Go1d/zY2HrRRf5a6/y6xQH5hgmH1Y5ooL1zCbgDH
   5vfbd6gsSYl7dmVSW833bDoXlTWbUJTy00W6HGKyPCVa6wGVm4uziZjUj
   TdO3Ds9BJ2G4nd+Wv3yfZTMp//52giW46O7fYvIa3qC716hINbCQRAtJD
   PqQalRY6LBHMFOZX6C1bwBJHXRHXxLIUT5+OFEBGLgrXzBCb1LKJiFifR
   BtqBus9ftntK6HBosMfTOYagIsXUXBGj5fJigVwj9qpj49I6A9koB6uuG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367906739"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="367906739"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 10:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="968702647"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="968702647"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2023 10:32:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK0Ad-0006nn-2v;
	Thu, 13 Jul 2023 17:32:03 +0000
Date: Fri, 14 Jul 2023 01:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mugunthan V N <mugunthanvnm@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 8/13] drivers/net/ethernet/ti/cpsw.c:1191:35:
 error: initialization of 'int (*)(struct net_device *, struct ifreq *, int)'
 from incompatible pointer type 'int (*)(struct net_device *, struct ifreq *,
 void *, int)'
Message-ID: <202307140132.Dmt3wwRF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   65bcc3fe777617e7f0d4d0e120e2e88d0f4ef646
commit: e9fcaf938bb8303e89133b4e71fb28bb35e77eb4 [8/13] HACK: drivers: net: cpsw: add support for switch ioctl
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230714/202307140132.Dmt3wwRF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140132.Dmt3wwRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140132.Dmt3wwRF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/ti/cpsw.c: In function 'cpsw_ndo_start_xmit':
   drivers/net/ethernet/ti/cpsw.c:913:22: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     913 |         unsigned int len;
         |                      ^~~
   drivers/net/ethernet/ti/cpsw.c: At top level:
>> drivers/net/ethernet/ti/cpsw.c:1191:35: error: initialization of 'int (*)(struct net_device *, struct ifreq *, int)' from incompatible pointer type 'int (*)(struct net_device *, struct ifreq *, void *, int)' [-Werror=incompatible-pointer-types]
    1191 |         .ndo_eth_ioctl          = cpsw_ndo_ioctl_legacy,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/cpsw.c:1191:35: note: (near initialization for 'cpsw_netdev_ops.ndo_eth_ioctl')
   cc1: some warnings being treated as errors


vim +1191 drivers/net/ethernet/ti/cpsw.c

  1185	
  1186	static const struct net_device_ops cpsw_netdev_ops = {
  1187		.ndo_open		= cpsw_ndo_open,
  1188		.ndo_stop		= cpsw_ndo_stop,
  1189		.ndo_start_xmit		= cpsw_ndo_start_xmit,
  1190		.ndo_set_mac_address	= cpsw_ndo_set_mac_address,
> 1191		.ndo_eth_ioctl		= cpsw_ndo_ioctl_legacy,
  1192		.ndo_validate_addr	= eth_validate_addr,
  1193		.ndo_tx_timeout		= cpsw_ndo_tx_timeout,
  1194		.ndo_set_rx_mode	= cpsw_ndo_set_rx_mode,
  1195		.ndo_set_tx_maxrate	= cpsw_ndo_set_tx_maxrate,
  1196	#ifdef CONFIG_NET_POLL_CONTROLLER
  1197		.ndo_poll_controller	= cpsw_ndo_poll_controller,
  1198	#endif
  1199		.ndo_vlan_rx_add_vid	= cpsw_ndo_vlan_rx_add_vid,
  1200		.ndo_vlan_rx_kill_vid	= cpsw_ndo_vlan_rx_kill_vid,
  1201		.ndo_setup_tc           = cpsw_ndo_setup_tc,
  1202		.ndo_bpf		= cpsw_ndo_bpf,
  1203		.ndo_xdp_xmit		= cpsw_ndo_xdp_xmit,
  1204	};
  1205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
