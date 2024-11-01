Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6006B1B4F2D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730477224; cv=none; b=OSOd8K+443g4QQQFH2wR8VY3aWaGs04gbzhXO55hrF1VwWTtdVz9qF99mwAMahuqHlg9UaNNoL030jfUn+1sQwRiEofcy+KGqg6mRvqdopJ54N9xT2x8saeunpiTyaihhtnNXTH3HdZkVZpBjLQoqfdbOCyilH4MsJNfFdyHhVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730477224; c=relaxed/simple;
	bh=rRPvTVFna17iGS+epAo1AKdcuZubgr6oaJCa9o2rbRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4VX6BrvT/rQriEY5pKoaLOdNqHdrcH10r0T3XWH4J9d938FElCtX2BiRvB/ooVGPmIfbCSLRHzA6l9bGNgGXLJbFEVsse1bu88UddtFC6fCHYR0D0AWd1LpTpWjZHmmY33Z3oy/kLrQacORi5M4gh7HqxzBlmqQdU0t9rn+t1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+0EHJm9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+0EHJm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730477223; x=1762013223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rRPvTVFna17iGS+epAo1AKdcuZubgr6oaJCa9o2rbRA=;
  b=I+0EHJm94l6GjJkibQjrEdAc1r8lLLQsp5C/hEUJT/G2JVMc59IagkT/
   r9WJAgBKs2HcYl9MaOjXsIFYydqZezb3mKmlbzKI4UDn0VaBgoQux005i
   kuKD+mpNAcg6jbXLSt2OS9FL3LBVigZHwAYrhUysQ2kvID2J7K0o88kzu
   pc3yWhNbpS01GFQSzfCOZXjbP+3kyZ7A8jjkwOd2LRXJJN/LmtlkyaHd1
   S/YYitJINkDyLJooim7RR4hhiLXVYYYx/4t2GSc8SojgPYPlaSAu4ZLEV
   1MLPUOVUivJVnbab7yODDPpCl5y4kQZZpCKquL2dmbGj0i5pgAyiAXEma
   Q==;
X-CSE-ConnectionGUID: 0iAYpvMOSqKl420Z3WhzBA==
X-CSE-MsgGUID: gEp+dxS8S/OakP4ZeCg8HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30012172"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30012172"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 09:06:47 -0700
X-CSE-ConnectionGUID: DuZhFg/iSqO/gDYefDOGAw==
X-CSE-MsgGUID: Cixqz1bjRTaA5eRuq3bP1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="120462996"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Nov 2024 09:06:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6uAd-000hjl-2N;
	Fri, 01 Nov 2024 16:06:43 +0000
Date: Sat, 2 Nov 2024 00:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Steven Song <steven.song@3snic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1231/1231]
 drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:165:28: error: implicit
 declaration of function 'vlan_dev_priv'; did you mean 'netdev_priv'?
Message-ID: <202411012342.ooJtSVFz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fc269dcb986088196619510639266c08d10fc8b7
commit: a6a7981cbf66d4951425d33cdce6ef39206eba83 [1231/1231] Net: ethernet: Support 3snic 3s9xx network card
config: arm64-randconfig-004-20241029 (https://download.01.org/0day-ci/archive/20241101/202411012342.ooJtSVFz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012342.ooJtSVFz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012342.ooJtSVFz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_sriov.c:40:13: warning: 'sss_deinit_vf_hw' defined but not used [-Wunused-function]
      40 | static void sss_deinit_vf_hw(void *hwdev, u16 vf_num)
         |             ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_sriov.c:18:12: warning: 'sss_init_vf_hw' defined but not used [-Wunused-function]
      18 | static int sss_init_vf_hw(void *hwdev, u16 vf_num)
         |            ^~~~~~~~~~~~~~
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c: In function 'sss_nic_get_vlan_depth':
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:165:28: error: implicit declaration of function 'vlan_dev_priv'; did you mean 'netdev_priv'? [-Werror=implicit-function-declaration]
     165 |                 vlan_dev = vlan_dev_priv(vlan_dev)->real_dev;
         |                            ^~~~~~~~~~~~~
         |                            netdev_priv
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:165:51: error: invalid type argument of '->' (have 'int')
     165 |                 vlan_dev = vlan_dev_priv(vlan_dev)->real_dev;
         |                                                   ^~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c: At top level:
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:878:6: warning: no previous prototype for 'sss_nic_port_module_cable_plug' [-Wmissing-prototypes]
     878 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:884:6: warning: no previous prototype for 'sss_nic_port_module_cable_unplug' [-Wmissing-prototypes]
     884 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:890:6: warning: no previous prototype for 'sss_nic_port_module_link_err' [-Wmissing-prototypes]
     890 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1029:22: warning: no previous prototype for 'get_nic_uld_info' [-Wmissing-prototypes]
    1029 | struct sss_uld_info *get_nic_uld_info(void)
         |                      ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +165 drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c

   157	
   158	static u16 sss_nic_get_vlan_depth(struct net_device *dev)
   159	{
   160		u16 vlan_depth = 0;
   161		struct net_device *vlan_dev = dev;
   162	
   163		do {
   164			vlan_depth++;
 > 165			vlan_dev = vlan_dev_priv(vlan_dev)->real_dev;
   166		} while (is_vlan_dev(vlan_dev));
   167	
   168		return vlan_depth;
   169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
