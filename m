Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB077BB19
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 05:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717134530; cv=none; b=h6xGRx7A/4BC0N5H95GvRmLyRWaRd/TAee0OcICMHl3xVNlKDKW3Mo009HrqAGvYGEpasdMEYQNS0exQSA+zQfI1TQ8FS62GN1pi4UpBycv3WXstf8sAaLYFKR7vgkwcxP7LuLFyyWM/Vx0EqC7Qo+nQdnPAWBS8Nx0VevSBqy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717134530; c=relaxed/simple;
	bh=/kUu2F/Nu9OqjKm88F/urU68Ns8PeLbr3pq6N/Bex3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GRqefdEOSDh9s4Ueqnzkllm+WqQtetO7fKTxdTV6GJZBlgWW70eX0KZsDyuYHBTHOKuTDaDjVwCEua5bpoRoogtNJq9h+LGTm6NbIcsh/UvfwrhpwHzxEWrxn8OGDmuDImtQTcSMG3hR348K2nIHpDsZyf0XS3rpumZd9jj6DKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBgbALxm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBgbALxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717134529; x=1748670529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/kUu2F/Nu9OqjKm88F/urU68Ns8PeLbr3pq6N/Bex3Y=;
  b=KBgbALxmhNZOITfNeI/Rj4Ny6FgkuPfMSE8At8oaqkdi2wLBW2XQnKSB
   27dPU2Mac0SUv4rjKGMmH+ePV3KB8KYJbonC+ML6LJ+bii3EgYyUDZGQf
   C+IUAeBASk2RrImrrfv6/YcvN1A25ojz1969dtaw695FftDOgla14+hc1
   bNdTz+ceqgBNG5Y/oLlhY2UROeR+he27y76JQpaOfl/+PiedLZ5HbeJPM
   z0m+OKQR5vHC4nFBJswXYPJF/uRxpai2RkUvoM0s2F6FpdxmqLmYGnZ3D
   3zwwbfp/UaS3s5HxbSOLkxv1E7qrShRXhQoY2vbd7+LN+8vvlWeKVHQ3Q
   g==;
X-CSE-ConnectionGUID: RxSLnnanQvOplHyxF0BXeQ==
X-CSE-MsgGUID: +hRAe68ISCOOUbvqwkBTnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17508880"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="17508880"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 22:48:39 -0700
X-CSE-ConnectionGUID: +DV/Yp1VRB2em0DUd6whOg==
X-CSE-MsgGUID: depjWS6TQiSak4NWJyZ0XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36161116"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 May 2024 22:48:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCv7z-000Gaf-1Y;
	Fri, 31 May 2024 05:48:35 +0000
Date: Fri, 31 May 2024 13:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1606/22616]
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:43:28: sparse: sparse:
 symbol 'hns3_pci_tbl' was not declared. Should it be static?
Message-ID: <202405311309.sjTeOAO2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e8bccb051f559b78517ce23633a3d983f48abb0b
commit: 09262653590358d6bd64c121600490fcfa3312b3 [1606/22616] driver: hns3: update hns3 driver from drivers
config: arm64-randconfig-r122-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311309.sjTeOAO2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240531/202405311309.sjTeOAO2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311309.sjTeOAO2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:43:28: sparse: sparse: symbol 'hns3_pci_tbl' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:1949:27: sparse: sparse: symbol 'hns3_err_handler' was not declared. Should it be static?
   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:14:
   include/uapi/linux/sctp.h:390:1: warning: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Wpacked-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:719:1: warning: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Wpacked-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:718:33: warning: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Wpacked-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
   include/uapi/linux/sctp.h:732:1: warning: alignment 4 of 'struct sctp_prim' is less than 8 [-Wpacked-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:731:33: warning: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Wpacked-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
   include/uapi/linux/sctp.h:783:1: warning: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Wpacked-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:775:33: warning: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Wpacked-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
   include/uapi/linux/sctp.h:896:1: warning: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Wpacked-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:890:33: warning: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Wpacked-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c: In function 'hns3_rx_checksum':
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:2414:33: warning: this statement may fall through [-Wimplicit-fallthrough=]
    2414 |                 skb->csum_level = 1;
         |                 ~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:2415:9: note: here
    2415 |         case HNS3_OL4_TYPE_NO_TUN:
         |         ^~~~

vim +/hns3_pci_tbl +43 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c

    35	
    36	/* hns3_pci_tbl - PCI Device ID Table
    37	 *
    38	 * Last entry must be all 0s
    39	 *
    40	 * { Vendor ID, Device ID, SubVendor ID, SubDevice ID,
    41	 *   Class, Class Mask, private data (not used) }
    42	 */
  > 43	const struct pci_device_id hns3_pci_tbl[] = {
    44		{PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_GE), 0},
    45		{PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_25GE), 0},
    46		{PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_25GE_RDMA),
    47		 HNAE3_DEV_SUPPORT_ROCE_DCB_BITS},
    48		{PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_25GE_RDMA_MACSEC),
    49		 HNAE3_DEV_SUPPORT_ROCE_DCB_BITS},
    50		{PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_50GE_RDMA),
    51		 HNAE3_DEV_SUPPORT_ROCE_DCB_BITS},
    52		{PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_50GE_RDMA_MACSEC),
    53		 HNAE3_DEV_SUPPORT_ROCE_DCB_BITS},
    54		{PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_100G_RDMA_MACSEC),
    55		 HNAE3_DEV_SUPPORT_ROCE_DCB_BITS},
    56		{PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_100G_VF), 0},
    57		{PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_100G_RDMA_DCB_PFC_VF),
    58		 HNAE3_DEV_SUPPORT_ROCE_DCB_BITS},
    59		/* required last entry */
    60		{0, }
    61	};
    62	MODULE_DEVICE_TABLE(pci, hns3_pci_tbl);
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
