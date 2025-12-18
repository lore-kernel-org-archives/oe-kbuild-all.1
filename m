Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C909033971E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 21:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766092545; cv=none; b=DoAtT8aVrYTFyy9NfkYt0x3YOHfOXh8XJnmJQ8MgvWLQEoESWKt6xdW+Qb07qBuQT8FXGxZZ+CdUqR7et/bAsqmhRZn0QLrvYHTJNusZdcd4166vjHon3sV60ch8VPWTqDFgYarOPjz0sGm1NU1gFH5VdHKWYfMI/pC4DHXhMu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766092545; c=relaxed/simple;
	bh=zwTQSITnkzSukcNKoWaTVNYc2b3pMZIW8PgQWrPMBwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tG1LU9r8O+ZK83CS+4RFvX/XXXPJH9XiS6eHVkzb+xKY1+kbmB6kj28EnOwa6TIbodSgduWAFIscTWlfp01uXRj9SxFY2Nu1M+vkNWc67wgH2PRTelVBrQ/RWIYUTiBbvwM9PmipSQtJvh/ei2xsmwBhkWWS1QZjIxSYEIXhvqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLHJCoFm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLHJCoFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766092536; x=1797628536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zwTQSITnkzSukcNKoWaTVNYc2b3pMZIW8PgQWrPMBwc=;
  b=iLHJCoFm1XFfWVcCCL6EbK8Z4guqw92oXeeOeUm2+pvUBfyqnA59zS/E
   tKtWoQtN0Ctgv2LUbcY6sFEVPr9+9xiWlC76T2YZjXbpMgtNwv37L2DYR
   zSttgPB0Xl00VznQ+rN4zxTPP+yi1QYpFzTTGQxgfh7uVPwYFKqMHbdmf
   TpJJDOMHFZ/MgVh4MqAV4nza9Uab8fhA6weM2R7VFojWZ2VsZVJjfouxB
   CbV7m9Q0HmhaE3ttu/OFOr5U4V8/APFxRasNRltddX0Zyxb20Hq3caXng
   Hc1YwxS+JnBNLLKJxzNpZ6crh5BVm/56fD7o1dFkqIApXWjcQXrJRN7xA
   Q==;
X-CSE-ConnectionGUID: UtrqMFsHSLqVsl8XCqOzQQ==
X-CSE-MsgGUID: xBCrUR6pRNC3dJ1z6XtXUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78691760"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78691760"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 13:15:32 -0800
X-CSE-ConnectionGUID: Jv2vzVYmTgOe+6wr0IKDTQ==
X-CSE-MsgGUID: SdppXH+rSRSd2BBZZONi6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198749015"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Dec 2025 13:15:30 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWLLM-000000002fY-0cFI;
	Thu, 18 Dec 2025 21:15:28 +0000
Date: Fri, 19 Dec 2025 05:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1946/1946]
 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:53:32: error: 'struct
 pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
Message-ID: <202512190528.ut6FEno8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: a6a7981cbf66d4951425d33cdce6ef39206eba83 [1946/1946] Net: ethernet: Support 3snic 3s9xx network card
config: arm64-randconfig-r062-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190528.ut6FEno8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190528.ut6FEno8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190528.ut6FEno8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c: In function 'sss_get_vf_load_state':
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:53:32: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
      53 |  dev = pdev->is_virtfn ? pdev->physfn : pdev;
         |                                ^~~~~~
         |                                is_physfn
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c: At top level:
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:276:5: error: no previous prototype for 'sss_attach_uld_driver' [-Werror=missing-prototypes]
     276 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c: In function 'sss_get_vf_service_load':
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:319:39: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
     319 |  dev = (pdev->is_virtfn != 0) ? pdev->physfn : pdev;
         |                                       ^~~~~~
         |                                       is_physfn
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c: At top level:
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:548:5: error: no previous prototype for 'sss_pci_probe' [-Werror=missing-prototypes]
     548 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         |     ^~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_sriov.c:40:13: error: 'sss_deinit_vf_hw' defined but not used [-Werror=unused-function]
      40 | static void sss_deinit_vf_hw(void *hwdev, u16 vf_num)
         |             ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_sriov.c:18:12: error: 'sss_init_vf_hw' defined but not used [-Werror=unused-function]
      18 | static int sss_init_vf_hw(void *hwdev, u16 vf_num)
         |            ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/net/ethernet/3snic/sssnic/hw/sss_adapter_mgmt.c: In function 'sss_get_pci_bus_id':
>> drivers/net/ethernet/3snic/sssnic/hw/sss_adapter_mgmt.c:234:30: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
     234 |   pf_pdev = adapter->pcidev->physfn;
         |                              ^~~~~~
         |                              is_physfn
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c: In function 'sss_nic_get_vlan_depth':
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:165:14: error: implicit declaration of function 'vlan_dev_priv'; did you mean 'netdev_priv'? [-Werror=implicit-function-declaration]
     165 |   vlan_dev = vlan_dev_priv(vlan_dev)->real_dev;
         |              ^~~~~~~~~~~~~
         |              netdev_priv
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:165:37: error: invalid type argument of '->' (have 'int')
     165 |   vlan_dev = vlan_dev_priv(vlan_dev)->real_dev;
         |                                     ^~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c: At top level:
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:878:6: error: no previous prototype for 'sss_nic_port_module_cable_plug' [-Werror=missing-prototypes]
     878 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:884:6: error: no previous prototype for 'sss_nic_port_module_cable_unplug' [-Werror=missing-prototypes]
     884 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:890:6: error: no previous prototype for 'sss_nic_port_module_link_err' [-Werror=missing-prototypes]
     890 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1029:22: error: no previous prototype for 'get_nic_uld_info' [-Werror=missing-prototypes]
    1029 | struct sss_uld_info *get_nic_uld_info(void)
         |                      ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_export.c:99:5-24: WARNING: atomic_dec_and_test variation before object free at line 103.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_adapter_mgmt.c:210:7-16: ERROR: iterator variable bound on line 209 cannot be NULL
--
>> drivers/net/ethernet/3snic/sssnic/hw/tool/sss_tool_chip.c:700:8-15: WARNING opportunity for memdup_user
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_link.c:620:30-68: WARNING avoid newline at end of message in NL_SET_ERR_MSG_MOD
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops_api.c:1006:7-43: WARNING avoid newline at end of message in NL_SET_ERR_MSG_MOD
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool.c:284:5-25: opportunity for str_on_off(pauseparam -> rx_pause)
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool.c:284:42-62: opportunity for str_on_off(pauseparam -> tx_pause)
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:456:5-17: opportunity for str_enable_disable(set_spoofchk)
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:462:5-17: opportunity for str_enable_disable(set_spoofchk)
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops_api.c:419:6-16: opportunity for str_up_down(link_state)
--
>> drivers/net/ethernet/3snic/sssnic/nic/tool/sss_tool_nic_phy_attr.c:132:5-16: opportunity for str_up_down(link_status)
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:589:6-9: ERROR: invalid reference to the index variable of the iterator on line 583
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:589:13-16: ERROR: invalid reference to the index variable of the iterator on line 583
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:459:6-9: ERROR: invalid reference to the index variable of the iterator on line 453
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:459:13-16: ERROR: invalid reference to the index variable of the iterator on line 453

vim +53 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c

    33	
    34	#define SSS_CHECK_EVENT_INFO(event) \
    35				((event)->service == SSS_EVENT_SRV_COMM && \
    36				(event)->type == SSS_EVENT_FAULT)
    37	
    38	#define SSS_CHECK_FAULT_EVENT_INFO(hwdev, fault_event) \
    39				((fault_event)->fault_level == SSS_FAULT_LEVEL_SERIOUS_FLR && \
    40				(fault_event)->info.chip.func_id < sss_get_max_pf_num(hwdev))
    41	
    42	#define SSS_GET_CFG_REG_BAR(pdev) (SSS_IS_VF_DEV(pdev) ? \
    43				SSS_VF_PCI_CFG_REG_BAR : SSS_PF_PCI_CFG_REG_BAR)
    44	
    45	static bool sss_get_vf_load_state(struct pci_dev *pdev)
    46	{
    47		struct sss_pci_adapter *adapter = NULL;
    48		struct pci_dev *dev = NULL;
    49	
    50		if (pci_is_root_bus(pdev->bus))
    51			return false;
    52	
  > 53		dev = pdev->is_virtfn ? pdev->physfn : pdev;
    54		adapter = pci_get_drvdata(dev);
    55	
    56		if (!adapter) {
    57			sdk_err(&pdev->dev, "Invalid adapter, is null.\n");
    58			return false;
    59		}
    60	
    61		return true;
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
