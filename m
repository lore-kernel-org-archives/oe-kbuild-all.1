Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADFD52F6A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 19:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710531689; cv=none; b=eMAk2vdebWx9j2hMrt2riNouksTA3P99xbHF05Xh7nDzYcUUauRcUXK/fzMIcTEDTJSYhqZCx7nh4JD7YdxBCvcnS4DLF0TBstXQxfzvpWJP5w7+TsTDNwbv+Mgb7CIZQ3sBuImcEP8slqKEJFqMXE3ESqaPZT75652ToQnPcRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710531689; c=relaxed/simple;
	bh=ouCspkA6hYHYdrdRWE3n8fIR/JI/564MT9m+QkBSM58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FBczfFIHfYmcFwnai/ynYz1SIBnqEfZJJAIszASF+EPlaoDYjLpo6oA5Smow1HwUzuQORlrFXAvh2qFBWpWcYXNVPAiRqmnG5AE8i6LeiJBQRiJClVCJKqtVNbHjYLiNw8KB9qFgPODW+jQGKa4VAEvtWl8thyN3aeybwxa1aow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGt2uoo0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGt2uoo0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710531685; x=1742067685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ouCspkA6hYHYdrdRWE3n8fIR/JI/564MT9m+QkBSM58=;
  b=HGt2uoo0UrhE+awYLg+UOJGIP5tSUY972yoVTi2II4Yabcqv/Qj68qin
   YPQFoEJD8J4P17zOYc/DzPAVaCzE9hTjXTZMSUA9XiqpVa5ziJoiD9NkU
   AzVLg1JNgmBVkuCETW0cKswwmaUNeuNZz43BC/yI+haaz+5BjDilb2iPb
   FGPyJfTnXXue0U3QSADIVt1HfLYMb36g7Ylz+tix4zHIN+NrCKJAMZeff
   paFQpAVl8aECy8MPiJR7CJh4aZbj62fWf6W3hLQFuLYP465arlC5qwnF1
   pl+nC1uZ+QpZ1kqE+QR1iOUbNfN+qVymE8IQ1WTiai2nezIsZflgoHFZD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5551373"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5551373"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 12:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="13238004"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Mar 2024 12:41:22 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlDQd-000Ekr-1O;
	Fri, 15 Mar 2024 19:41:19 +0000
Date: Sat, 16 Mar 2024 03:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Steven Song <steven.song@3snic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21121/21871]
 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:276:5: sparse: sparse:
 symbol 'sss_attach_uld_driver' was not declared. Should it be static?
Message-ID: <202403160328.U3VDCuIj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c0f28264ce70e762ccdf396767a85688e6ed4810
commit: a6a7981cbf66d4951425d33cdce6ef39206eba83 [21121/21871] Net: ethernet: Support 3snic 3s9xx network card
config: x86_64-randconfig-r111-20240313 (https://download.01.org/0day-ci/archive/20240316/202403160328.U3VDCuIj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160328.U3VDCuIj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160328.U3VDCuIj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:65:5: sparse: sparse: symbol 'rx_buff_size' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:878:6: sparse: sparse: symbol 'sss_nic_port_module_cable_plug' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:884:6: sparse: sparse: symbol 'sss_nic_port_module_cable_unplug' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:890:6: sparse: sparse: symbol 'sss_nic_port_module_link_err' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1020:21: sparse: sparse: symbol 'g_nic_uld_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1029:21: sparse: sparse: symbol 'get_nic_uld_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:878:6: warning: no previous prototype for function 'sss_nic_port_module_cable_plug' [-Wmissing-prototypes]
     878 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:878:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     878 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:884:6: warning: no previous prototype for function 'sss_nic_port_module_cable_unplug' [-Wmissing-prototypes]
     884 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:884:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     884 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:890:6: warning: no previous prototype for function 'sss_nic_port_module_link_err' [-Wmissing-prototypes]
     890 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:890:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     890 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1029:22: warning: no previous prototype for function 'get_nic_uld_info' [-Wmissing-prototypes]
    1029 | struct sss_uld_info *get_nic_uld_info(void)
         |                      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1029:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1029 | struct sss_uld_info *get_nic_uld_info(void)
         | ^
         | static 
   4 warnings generated.
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.o: warning: objtool: sss_nic_event()+0x1bd: can't find switch jump table
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:44:5: sparse: sparse: symbol 'sss_nic_get_sset_count' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:62:6: sparse: sparse: symbol 'sss_nic_get_ethtool_stats' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:78:6: sparse: sparse: symbol 'sss_nic_get_strings' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:98:5: sparse: sparse: symbol 'sss_nic_get_link_ksettings' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:120:5: sparse: sparse: symbol 'sss_nic_set_link_ksettings' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:44:5: warning: no previous prototype for function 'sss_nic_get_sset_count' [-Wmissing-prototypes]
      44 | int sss_nic_get_sset_count(struct net_device *netdev, int settings)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      44 | int sss_nic_get_sset_count(struct net_device *netdev, int settings)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:62:6: warning: no previous prototype for function 'sss_nic_get_ethtool_stats' [-Wmissing-prototypes]
      62 | void sss_nic_get_ethtool_stats(struct net_device *netdev,
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      62 | void sss_nic_get_ethtool_stats(struct net_device *netdev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:78:6: warning: no previous prototype for function 'sss_nic_get_strings' [-Wmissing-prototypes]
      78 | void sss_nic_get_strings(struct net_device *netdev, u32 stringset, u8 *buf)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:78:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      78 | void sss_nic_get_strings(struct net_device *netdev, u32 stringset, u8 *buf)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:98:5: warning: no previous prototype for function 'sss_nic_get_link_ksettings' [-Wmissing-prototypes]
      98 | int sss_nic_get_link_ksettings(struct net_device *net_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:98:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      98 | int sss_nic_get_link_ksettings(struct net_device *net_dev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:120:5: warning: no previous prototype for function 'sss_nic_set_link_ksettings' [-Wmissing-prototypes]
     120 | int sss_nic_set_link_ksettings(struct net_device *netdev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:120:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     120 | int sss_nic_set_link_ksettings(struct net_device *netdev,
         | ^
         | static 
   5 warnings generated.
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.o: warning: objtool: sss_nic_get_sset_count()+0x4a: can't find switch jump table
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:878:6: warning: no previous prototype for function 'sss_nic_port_module_cable_plug' [-Wmissing-prototypes]
     878 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:878:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     878 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:884:6: warning: no previous prototype for function 'sss_nic_port_module_cable_unplug' [-Wmissing-prototypes]
     884 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:884:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     884 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:890:6: warning: no previous prototype for function 'sss_nic_port_module_link_err' [-Wmissing-prototypes]
     890 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:890:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     890 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1029:22: warning: no previous prototype for function 'get_nic_uld_info' [-Wmissing-prototypes]
    1029 | struct sss_uld_info *get_nic_uld_info(void)
         |                      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1029:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1029 | struct sss_uld_info *get_nic_uld_info(void)
         | ^
         | static 
   4 warnings generated.
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.o: warning: objtool: sss_nic_event()+0x1bd: can't find switch jump table
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:44:5: warning: no previous prototype for function 'sss_nic_get_sset_count' [-Wmissing-prototypes]
      44 | int sss_nic_get_sset_count(struct net_device *netdev, int settings)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      44 | int sss_nic_get_sset_count(struct net_device *netdev, int settings)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:62:6: warning: no previous prototype for function 'sss_nic_get_ethtool_stats' [-Wmissing-prototypes]
      62 | void sss_nic_get_ethtool_stats(struct net_device *netdev,
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      62 | void sss_nic_get_ethtool_stats(struct net_device *netdev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:78:6: warning: no previous prototype for function 'sss_nic_get_strings' [-Wmissing-prototypes]
      78 | void sss_nic_get_strings(struct net_device *netdev, u32 stringset, u8 *buf)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:78:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      78 | void sss_nic_get_strings(struct net_device *netdev, u32 stringset, u8 *buf)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:98:5: warning: no previous prototype for function 'sss_nic_get_link_ksettings' [-Wmissing-prototypes]
      98 | int sss_nic_get_link_ksettings(struct net_device *net_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:98:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      98 | int sss_nic_get_link_ksettings(struct net_device *net_dev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:120:5: warning: no previous prototype for function 'sss_nic_set_link_ksettings' [-Wmissing-prototypes]
     120 | int sss_nic_set_link_ksettings(struct net_device *netdev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:120:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     120 | int sss_nic_set_link_ksettings(struct net_device *netdev,
         | ^
         | static 
   5 warnings generated.
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.o: warning: objtool: sss_nic_get_sset_count()+0x4a: can't find switch jump table

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:276:5: sparse: sparse: symbol 'sss_attach_uld_driver' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:276:5: warning: no previous prototype for function 'sss_attach_uld_driver' [-Wmissing-prototypes]
     276 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:276:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     276 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:548:5: warning: no previous prototype for function 'sss_pci_probe' [-Wmissing-prototypes]
     548 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:548:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     548 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         | ^
         | static
   2 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:35:14: sparse: sparse: symbol 'g_uld_mutex' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:37:6: warning: no previous prototype for function 'sss_init_uld_lock' [-Wmissing-prototypes]
      37 | void sss_init_uld_lock(void)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | void sss_init_uld_lock(void)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:42:6: warning: no previous prototype for function 'sss_lock_uld' [-Wmissing-prototypes]
      42 | void sss_lock_uld(void)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | void sss_lock_uld(void)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:47:6: warning: no previous prototype for function 'sss_unlock_uld' [-Wmissing-prototypes]
      47 | void sss_unlock_uld(void)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      47 | void sss_unlock_uld(void)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:52:14: warning: no previous prototype for function 'sss_get_uld_names' [-Wmissing-prototypes]
      52 | const char **sss_get_uld_names(void)
         |              ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:52:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
      52 | const char **sss_get_uld_names(void)
         |       ^
         |       static
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:57:22: warning: no previous prototype for function 'sss_get_uld_info' [-Wmissing-prototypes]
      57 | struct sss_uld_info *sss_get_uld_info(void)
         |                      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:57:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      57 | struct sss_uld_info *sss_get_uld_info(void)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:62:6: warning: no previous prototype for function 'sss_attach_is_enable' [-Wmissing-prototypes]
      62 | bool sss_attach_is_enable(void)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      62 | bool sss_attach_is_enable(void)
         | ^
         | static
   6 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_export.c:38:11: sparse: sparse: symbol 'sss_rx_buf_size_level' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_export.c:137:15: sparse: sparse: dubious: !x & y
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_mgmt_channel.c:286:29: sparse: sparse: symbol 'g_mgmt_event_handler' was not declared. Should it be static?
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:311:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *db_base @@     got unsigned char [noderef] [usertype] __iomem *db_base @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:311:54: sparse:     expected unsigned char [usertype] *db_base
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:311:54: sparse:     got unsigned char [noderef] [usertype] __iomem *db_base
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:320:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:320:31: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:320:31: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:533:12: sparse: sparse: context imbalance in 'sss_ctrlq_msg_lock' - different lock contexts for basic block
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:547:13: sparse: sparse: context imbalance in 'sss_ctrlq_msg_unlock' - unexpected unlock
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:327:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem **db_base @@     got void [noderef] __iomem * @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:327:41: sparse:     expected void [noderef] __iomem **db_base
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:327:41: sparse:     got void [noderef] __iomem *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:277:5: warning: no previous prototype for function 'sss_reinit_ctrlq_ctx' [-Wmissing-prototypes]
     277 | int sss_reinit_ctrlq_ctx(struct sss_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:277:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     277 | int sss_reinit_ctrlq_ctx(struct sss_hwdev *hwdev)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:367:6: warning: no previous prototype for function 'sss_deinit_ctrlq' [-Wmissing-prototypes]
     367 | void sss_deinit_ctrlq(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:367:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     367 | void sss_deinit_ctrlq(struct sss_hwdev *hwdev)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:501:5: warning: no previous prototype for function 'sss_init_ctrlq_channel' [-Wmissing-prototypes]
     501 | int sss_init_ctrlq_channel(struct sss_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:501:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     501 | int sss_init_ctrlq_channel(struct sss_hwdev *hwdev)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:538:6: warning: no previous prototype for function 'sss_deinit_ctrlq_channel' [-Wmissing-prototypes]
     538 | void sss_deinit_ctrlq_channel(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:538:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     538 | void sss_deinit_ctrlq_channel(struct sss_hwdev *hwdev)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:547:6: warning: no previous prototype for function 'sss_ctrlq_flush_sync_cmd' [-Wmissing-prototypes]
     547 | void sss_ctrlq_flush_sync_cmd(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:547:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     547 | void sss_ctrlq_flush_sync_cmd(struct sss_hwdev *hwdev)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:573:5: warning: no previous prototype for function 'sss_wait_ctrlq_stop' [-Wmissing-prototypes]
     573 | int sss_wait_ctrlq_stop(struct sss_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:573:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     573 | int sss_wait_ctrlq_stop(struct sss_hwdev *hwdev)
         | ^
         | static
   6 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:294:30: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:294:30: sparse:     expected unsigned int val
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:294:30: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:294:73: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:294:73: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:294:73: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:312:30: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:312:30: sparse:     expected unsigned int val
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:312:30: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:313:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:313:67: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:313:67: sparse:     got unsigned char [usertype] *
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:364:19: sparse: sparse: cast to restricted __be64
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:346:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *data @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:346:24: sparse:     expected unsigned char [usertype] *data
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:346:24: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
   arch/x86/include/asm/bitops.h:111:37: sparse: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:252:5: warning: no previous prototype for function 'sss_init_func_mbx_msg' [-Wmissing-prototypes]
     252 | int sss_init_func_mbx_msg(void *hwdev, u16 func_num)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:252:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     252 | int sss_init_func_mbx_msg(void *hwdev, u16 func_num)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:401:5: warning: no previous prototype for function 'sss_hwif_init_mbx' [-Wmissing-prototypes]
     401 | int sss_hwif_init_mbx(struct sss_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:401:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     401 | int sss_hwif_init_mbx(struct sss_hwdev *hwdev)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:449:6: warning: no previous prototype for function 'sss_hwif_deinit_mbx' [-Wmissing-prototypes]
     449 | void sss_hwif_deinit_mbx(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:449:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     449 | void sss_hwif_deinit_mbx(struct sss_hwdev *hwdev)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:872:6: warning: no previous prototype for function 'sss_recv_mbx_aeq_handler' [-Wmissing-prototypes]
     872 | void sss_recv_mbx_aeq_handler(void *handle, u8 *header, u8 size)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:872:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     872 | void sss_recv_mbx_aeq_handler(void *handle, u8 *header, u8 size)
         | ^
         | static
   4 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:213:31: sparse: sparse: cast to restricted __be64
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:275:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:275:20: sparse:     expected unsigned long long [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:275:20: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:328:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] desc @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:328:20: sparse:     expected unsigned long long [usertype] desc
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:328:20: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:368:20: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:372:25: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:409:23: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:500:9: sparse: sparse: context imbalance in 'sss_adm_msg_lock' - wrong count at exit
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:509:28: sparse: sparse: context imbalance in 'sss_adm_msg_unlock' - unexpected unlock
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:545:5: warning: no previous prototype for function 'sss_adm_msg_write' [-Wmissing-prototypes]
     545 | int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:545:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     545 | int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:551:5: warning: no previous prototype for function 'sss_adm_msg_read' [-Wmissing-prototypes]
     551 | int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:551:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     551 | int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:597:5: warning: no previous prototype for function 'sss_adm_msg_read_ack' [-Wmissing-prototypes]
     597 | int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:597:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     597 | int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:618:5: warning: no previous prototype for function 'sss_adm_msg_write_nack' [-Wmissing-prototypes]
     618 | int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:618:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     618 | int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:682:5: warning: no previous prototype for function 'sss_sync_send_adm_msg' [-Wmissing-prototypes]
     682 | int sss_sync_send_adm_msg(void *hwdev, u8 mod, u16 cmd, void *buf_in,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:682:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     682 | int sss_sync_send_adm_msg(void *hwdev, u8 mod, u16 cmd, void *buf_in,
         | ^
         | static
   5 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:272:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_msg_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:272:34: sparse:     expected unsigned long long [usertype] hw_msg_paddr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:272:34: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:288:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_wb_reply_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:288:38: sparse:     expected unsigned long long [usertype] hw_wb_reply_paddr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:288:38: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:310:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_msg_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:310:33: sparse:     expected unsigned long long [usertype] hw_msg_paddr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:310:33: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:328:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_wb_reply_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:328:38: sparse:     expected unsigned long long [usertype] hw_wb_reply_paddr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:328:38: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:391:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] next_elem_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:391:50: sparse:     expected unsigned long long [usertype] next_elem_paddr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:391:50: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:400:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] next_elem_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:400:31: sparse:     expected unsigned long long [usertype] next_elem_paddr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:400:31: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:463:45: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int flag @@     got restricted gfp_t @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:463:45: sparse:     expected unsigned int flag
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:463:45: sparse:     got restricted gfp_t
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:580:6: sparse: sparse: symbol 'sss_destroy_adm_msg' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:580:6: warning: no previous prototype for function 'sss_destroy_adm_msg' [-Wmissing-prototypes]
     580 | void sss_destroy_adm_msg(struct sss_adm_msg *adm_msg)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     580 | void sss_destroy_adm_msg(struct sss_adm_msg *adm_msg)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:689:5: warning: no previous prototype for function 'sss_hwif_init_adm' [-Wmissing-prototypes]
     689 | int sss_hwif_init_adm(struct sss_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:689:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     689 | int sss_hwif_init_adm(struct sss_hwdev *hwdev)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:738:6: warning: no previous prototype for function 'sss_hwif_deinit_adm' [-Wmissing-prototypes]
     738 | void sss_hwif_deinit_adm(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:738:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     738 | void sss_hwif_deinit_adm(struct sss_hwdev *hwdev)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:752:6: warning: no previous prototype for function 'sss_complete_adm_event' [-Wmissing-prototypes]
     752 | void sss_complete_adm_event(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:752:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     752 | void sss_complete_adm_event(struct sss_hwdev *hwdev)
         | ^
         | static
   4 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_init.c:311:32: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_init.c:309:54: sparse: sparse: incompatible types in conditional expression (different address spaces):
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_init.c:309:54: sparse:    void [noderef] __iomem *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_init.c:309:54: sparse:    unsigned char [usertype] *
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:31:24: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:34:24: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:41:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:41:24: sparse:     expected unsigned int val
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:41:24: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:44:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:44:24: sparse:     expected unsigned int val
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:44:24: sparse:     got restricted __be32 [usertype]
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_eq.c:138:67: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int flag @@     got restricted gfp_t @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_eq.c:138:67: sparse:     expected unsigned int flag
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_eq.c:138:67: sparse:     got restricted gfp_t
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_aeq.c:153:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] init_val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_aeq.c:153:18: sparse:     expected unsigned int [usertype] init_val
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_aeq.c:153:18: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_aeq.c:238:24: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_aeq.c:408:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_aeq.c: note: in included file (through drivers/net/ethernet/3snic/sssnic/hw/include/sss_hwdev.h):
>> drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:99:26: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:99:26: sparse: sparse: cast to restricted __be32
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_common.c:30:14: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flag @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_common.c:30:14: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/ethernet/3snic/sssnic/hw/sss_common.c:30:14: sparse:     got unsigned int flag
   drivers/net/ethernet/3snic/sssnic/hw/sss_common.c:42:14: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flag @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_common.c:42:14: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/ethernet/3snic/sssnic/hw/sss_common.c:42:14: sparse:     got unsigned int flag
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_wq.c:48:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_wq.c:48:36: sparse:     expected unsigned long long [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/sss_wq.c:48:36: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/3snic/sssnic/hw/sss_wq.c:72:68: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int flag @@     got restricted gfp_t @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_wq.c:72:68: sparse:     expected unsigned int flag
   drivers/net/ethernet/3snic/sssnic/hw/sss_wq.c:72:68: sparse:     got restricted gfp_t
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ceq.c:102:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] init_val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ceq.c:102:18: sparse:     expected unsigned int [usertype] init_val
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ceq.c:102:18: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ceq.c:95:6: sparse: sparse: symbol 'sss_init_ceqe_desc' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ceq.c:130:13: sparse: sparse: symbol 'sss_ceq_intr_handle' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ceq.c:174:24: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ceq.c:377:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ceq.c:95:6: warning: no previous prototype for function 'sss_init_ceqe_desc' [-Wmissing-prototypes]
      95 | void sss_init_ceqe_desc(void *data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ceq.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | void sss_init_ceqe_desc(void *data)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ceq.c:130:13: warning: no previous prototype for function 'sss_ceq_intr_handle' [-Wmissing-prototypes]
     130 | irqreturn_t sss_ceq_intr_handle(int irq, void *data)
         |             ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ceq.c:130:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     130 | irqreturn_t sss_ceq_intr_handle(int irq, void *data)
         | ^
         | static
   2 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_adapter_mgmt.c:64:1: sparse: sparse: symbol 'g_chip_list' was not declared. Should it be static?
--
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:80:6: sparse: sparse: symbol 'sss_tool_free_in_buf' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:91:6: sparse: sparse: symbol 'sss_tool_free_out_buf' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:104:5: sparse: sparse: symbol 'sss_tool_alloc_in_buf' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:146:5: sparse: sparse: symbol 'sss_tool_alloc_out_buf' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:189:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:189:42: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:189:42: sparse:     got void *out_buf
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:194:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:194:34: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:194:34: sparse:     got void *out_buf
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:182:5: sparse: sparse: symbol 'sss_tool_copy_to_user' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:211:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *in_buf @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:211:45: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:211:45: sparse:     got void *in_buf
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:238:36: sparse: sparse: symbol 'g_deal_msg_handle' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:318:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:318:40: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:318:40: sparse:     got void *
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:380:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct sss_tool_ffm_record_info *ffm_rd @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:380:42: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:380:42: sparse:     got struct sss_tool_ffm_record_info *ffm_rd
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:416:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:416:37: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:416:37: sparse:     got void *
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:80:6: warning: no previous prototype for function 'sss_tool_free_in_buf' [-Wmissing-prototypes]
      80 | void sss_tool_free_in_buf(void *hwdev, const struct sss_tool_msg *tool_msg, void *in_buf)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | void sss_tool_free_in_buf(void *hwdev, const struct sss_tool_msg *tool_msg, void *in_buf)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:91:6: warning: no previous prototype for function 'sss_tool_free_out_buf' [-Wmissing-prototypes]
      91 | void sss_tool_free_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      91 | void sss_tool_free_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:104:5: warning: no previous prototype for function 'sss_tool_alloc_in_buf' [-Wmissing-prototypes]
     104 | int sss_tool_alloc_in_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     104 | int sss_tool_alloc_in_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:146:5: warning: no previous prototype for function 'sss_tool_alloc_out_buf' [-Wmissing-prototypes]
     146 | int sss_tool_alloc_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:146:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     146 | int sss_tool_alloc_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:182:5: warning: no previous prototype for function 'sss_tool_copy_to_user' [-Wmissing-prototypes]
     182 | int sss_tool_copy_to_user(struct sss_tool_msg *tool_msg,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     182 | int sss_tool_copy_to_user(struct sss_tool_msg *tool_msg,
         | ^
         | static
   5 warnings generated.
--
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:498:5: sparse: sparse: symbol 'sss_tool_send_clp_msg' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:604:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:604:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:604:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:606:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:606:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:606:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:588:5: sparse: sparse: symbol 'sss_tool_adm_csr_rd32' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:635:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:635:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:635:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:637:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:637:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:637:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:621:5: sparse: sparse: symbol 'sss_tool_adm_csr_wr32' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:704:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:704:35: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:704:35: sparse:     got void *
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:498:5: warning: no previous prototype for function 'sss_tool_send_clp_msg' [-Wmissing-prototypes]
     498 | int sss_tool_send_clp_msg(struct sss_hwdev *hwdev, u8 mod, u16 cmd, const void *buf_in,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:498:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     498 | int sss_tool_send_clp_msg(struct sss_hwdev *hwdev, u8 mod, u16 cmd, const void *buf_in,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:588:5: warning: no previous prototype for function 'sss_tool_adm_csr_rd32' [-Wmissing-prototypes]
     588 | int sss_tool_adm_csr_rd32(struct sss_hwdev *hwdev, u8 dest, u32 addr, u32 *val)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:588:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     588 | int sss_tool_adm_csr_rd32(struct sss_hwdev *hwdev, u8 dest, u32 addr, u32 *val)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:621:5: warning: no previous prototype for function 'sss_tool_adm_csr_wr32' [-Wmissing-prototypes]
     621 | int sss_tool_adm_csr_wr32(struct sss_hwdev *hwdev, u8 dest, u32 addr, u32 val)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:621:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     621 | int sss_tool_adm_csr_wr32(struct sss_hwdev *hwdev, u8 dest, u32 addr, u32 val)
         | ^
         | static
   3 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:878:6: sparse: sparse: symbol 'sss_nic_port_module_cable_plug' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:884:6: sparse: sparse: symbol 'sss_nic_port_module_cable_unplug' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:890:6: sparse: sparse: symbol 'sss_nic_port_module_link_err' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1020:21: sparse: sparse: symbol 'g_nic_uld_info' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1029:21: sparse: sparse: symbol 'get_nic_uld_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:878:6: warning: no previous prototype for function 'sss_nic_port_module_cable_plug' [-Wmissing-prototypes]
     878 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:878:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     878 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:884:6: warning: no previous prototype for function 'sss_nic_port_module_cable_unplug' [-Wmissing-prototypes]
     884 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:884:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     884 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:890:6: warning: no previous prototype for function 'sss_nic_port_module_link_err' [-Wmissing-prototypes]
     890 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:890:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     890 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1029:22: warning: no previous prototype for function 'get_nic_uld_info' [-Wmissing-prototypes]
    1029 | struct sss_uld_info *get_nic_uld_info(void)
         |                      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1029:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1029 | struct sss_uld_info *get_nic_uld_info(void)
         | ^
         | static
   4 warnings generated.
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.o: warning: objtool: sss_nic_event()+0x1bd: can't find switch jump table
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx.c:710:9: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx.c: note: in included file:
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse:     got unsigned long long [usertype] *
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx.c: note: in included file:
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse:     got unsigned long long [usertype] *
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse:     got unsigned long long [usertype] *
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c: note: in included file:
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:37: sparse:     got unsigned long long [usertype] *
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:179:6: warning: no previous prototype for function 'sss_nic_rq_watchdog_handler' [-Wmissing-prototypes]
     179 | void sss_nic_rq_watchdog_handler(struct work_struct *work)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     179 | void sss_nic_rq_watchdog_handler(struct work_struct *work)
         | ^
         | static
   1 warning generated.
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rss.c:276:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rss.c:276:41: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rss.c:276:41: sparse:     got restricted __be32 [usertype]
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:87:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:100:17: sparse: sparse: restricted __be32 degrades to integer
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:135:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dport:16 @@     got restricted __be16 [usertype] pdst @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:135:39: sparse:     expected unsigned int [usertype] dport:16
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:135:39: sparse:     got restricted __be16 [usertype] pdst
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:138:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] sport:16 @@     got restricted __be16 [usertype] psrc @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:138:39: sparse:     expected unsigned int [usertype] sport:16
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:138:39: sparse:     got restricted __be16 [usertype] psrc
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:271:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dport:16 @@     got restricted __be16 [usertype] pdst @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:271:39: sparse:     expected unsigned int [usertype] dport:16
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:271:39: sparse:     got restricted __be16 [usertype] pdst
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:274:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] sport:16 @@     got restricted __be16 [usertype] psrc @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:274:39: sparse:     expected unsigned int [usertype] sport:16
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:274:39: sparse:     got restricted __be16 [usertype] psrc
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:350:6: sparse: sparse: symbol 'sss_nic_flush_tcam_list' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:366:6: sparse: sparse: symbol 'sss_nic_flush_tcam_node_list' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:382:6: sparse: sparse: symbol 'sss_nic_flush_rx_flow_rule' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:350:6: warning: no previous prototype for function 'sss_nic_flush_tcam_list' [-Wmissing-prototypes]
     350 | void sss_nic_flush_tcam_list(struct sss_nic_tcam_info *tcam_info)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:350:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     350 | void sss_nic_flush_tcam_list(struct sss_nic_tcam_info *tcam_info)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:366:6: warning: no previous prototype for function 'sss_nic_flush_tcam_node_list' [-Wmissing-prototypes]
     366 | void sss_nic_flush_tcam_node_list(struct sss_nic_tcam_info *tcam_info)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:366:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     366 | void sss_nic_flush_tcam_node_list(struct sss_nic_tcam_info *tcam_info)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:382:6: warning: no previous prototype for function 'sss_nic_flush_rx_flow_rule' [-Wmissing-prototypes]
     382 | void sss_nic_flush_rx_flow_rule(struct sss_nic_rx_rule *rx_flow_rule)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     382 | void sss_nic_flush_rx_flow_rule(struct sss_nic_rx_rule *rx_flow_rule)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:397:6: warning: no previous prototype for function 'sss_nic_flush_tcam' [-Wmissing-prototypes]
     397 | void sss_nic_flush_tcam(struct sss_nic_dev *nic_dev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:397:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     397 | void sss_nic_flush_tcam(struct sss_nic_dev *nic_dev)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:797:5: warning: no previous prototype for function 'sss_nic_ethtool_update_flow' [-Wmissing-prototypes]
     797 | int sss_nic_ethtool_update_flow(struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:797:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     797 | int sss_nic_ethtool_update_flow(struct sss_nic_dev *nic_dev,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:842:5: warning: no previous prototype for function 'sss_nic_ethtool_delete_flow' [-Wmissing-prototypes]
     842 | int sss_nic_ethtool_delete_flow(struct sss_nic_dev *nic_dev, u32 location)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:842:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     842 | int sss_nic_ethtool_delete_flow(struct sss_nic_dev *nic_dev, u32 location)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:864:5: warning: no previous prototype for function 'sss_nic_ethtool_get_flow' [-Wmissing-prototypes]
     864 | int sss_nic_ethtool_get_flow(const struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:864:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     864 | int sss_nic_ethtool_get_flow(const struct sss_nic_dev *nic_dev,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:887:5: warning: no previous prototype for function 'sss_nic_ethtool_get_all_flows' [-Wmissing-prototypes]
     887 | int sss_nic_ethtool_get_all_flows(const struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:887:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     887 | int sss_nic_ethtool_get_all_flows(const struct sss_nic_dev *nic_dev,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:905:6: warning: no previous prototype for function 'sss_nic_validate_channel_setting_in_ntuple' [-Wmissing-prototypes]
     905 | bool sss_nic_validate_channel_setting_in_ntuple(const struct sss_nic_dev *nic_dev, u32 q_num)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:905:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     905 | bool sss_nic_validate_channel_setting_in_ntuple(const struct sss_nic_dev *nic_dev, u32 q_num)
         | ^
         | static
   9 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_api.c:644:5: sparse: sparse: symbol 'sss_nic_finish_loop_test' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_api.c:644:5: warning: no previous prototype for function 'sss_nic_finish_loop_test' [-Wmissing-prototypes]
     644 | int sss_nic_finish_loop_test(struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_api.c:644:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     644 | int sss_nic_finish_loop_test(struct sss_nic_dev *nic_dev,
         | ^
         | static
   1 warning generated.
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:297:5: sparse: sparse: symbol 'sss_nic_ndo_vlan_rx_add_vid' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:318:5: sparse: sparse: symbol 'sss_nic_ndo_vlan_rx_kill_vid' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:506:5: sparse: sparse: symbol 'sss_nic_ndo_set_vf_link_state' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:297:5: warning: no previous prototype for function 'sss_nic_ndo_vlan_rx_add_vid' [-Wmissing-prototypes]
     297 | int sss_nic_ndo_vlan_rx_add_vid(struct net_device *netdev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:297:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     297 | int sss_nic_ndo_vlan_rx_add_vid(struct net_device *netdev,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:318:5: warning: no previous prototype for function 'sss_nic_ndo_vlan_rx_kill_vid' [-Wmissing-prototypes]
     318 | int sss_nic_ndo_vlan_rx_kill_vid(struct net_device *netdev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:318:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     318 | int sss_nic_ndo_vlan_rx_kill_vid(struct net_device *netdev,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:506:5: warning: no previous prototype for function 'sss_nic_ndo_set_vf_link_state' [-Wmissing-prototypes]
     506 | int sss_nic_ndo_set_vf_link_state(struct net_device *netdev, int vf_id, int link)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:506:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     506 | int sss_nic_ndo_set_vf_link_state(struct net_device *netdev, int vf_id, int link)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:787:6: warning: no previous prototype for function 'sss_nic_set_netdev_ops' [-Wmissing-prototypes]
     787 | void sss_nic_set_netdev_ops(struct sss_nic_dev *nic_dev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:787:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     787 | void sss_nic_set_netdev_ops(struct sss_nic_dev *nic_dev)
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:795:6: warning: no previous prototype for function 'sss_nic_is_netdev_ops_match' [-Wmissing-prototypes]
     795 | bool sss_nic_is_netdev_ops_match(const struct net_device *netdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:795:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     795 | bool sss_nic_is_netdev_ops_match(const struct net_device *netdev)
         | ^
         | static
   5 warnings generated.
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_cfg.c: note: in included file (through drivers/net/ethernet/3snic/sssnic/include/sss_hw.h):
>> drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     got restricted __be32 [usertype]
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_vf_cfg.c: note: in included file (through drivers/net/ethernet/3snic/sssnic/include/sss_hw.h):
>> drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     got restricted __be32 [usertype]
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rss_cfg.c:109:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rss_cfg.c:109:31: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rss_cfg.c:109:31: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rss_cfg.c:160:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ctx @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rss_cfg.c:160:26: sparse:     expected unsigned int [usertype] ctx
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rss_cfg.c:160:26: sparse:     got restricted __be32 [usertype]
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:400:31: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:400:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *sq_db_addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:400:28: sparse:     expected unsigned char [noderef] [usertype] __iomem *sq_db_addr
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:400:28: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:408:31: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:408:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *rq_db_addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:408:28: sparse:     expected unsigned char [noderef] [usertype] __iomem *rq_db_addr
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:408:28: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c: note: in included file (through drivers/net/ethernet/3snic/sssnic/include/sss_hw.h):
>> drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     got restricted __be32 [usertype]
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops_api.c:689:33: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops_api.c:692:38: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops_api.c:728:37: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops_api.c:729:37: sparse: sparse: restricted __be32 degrades to integer
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops_api.c:741:37: sparse: sparse: cast to restricted __be16
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops_api.c:741:37: sparse: sparse: cast to restricted __be16
--
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:71:39: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:88:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] hw_pi @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:88:24: sparse:     expected unsigned short [usertype] hw_pi
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:88:24: sparse:     got restricted __be16 [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:137:5: sparse: sparse: symbol 'sss_tool_get_tx_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:163:5: sparse: sparse: symbol 'sss_tool_get_tx_wqe_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:182:5: sparse: sparse: symbol 'sss_tool_get_rx_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:223:5: sparse: sparse: symbol 'sss_tool_get_rx_wqe_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:242:5: sparse: sparse: symbol 'sss_tool_get_rx_cqe_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:280:5: sparse: sparse: symbol 'sss_tool_get_q_num' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:304:5: sparse: sparse: symbol 'sss_tool_get_inter_num' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:137:5: warning: no previous prototype for function 'sss_tool_get_tx_info' [-Wmissing-prototypes]
     137 | int sss_tool_get_tx_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     137 | int sss_tool_get_tx_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:163:5: warning: no previous prototype for function 'sss_tool_get_tx_wqe_info' [-Wmissing-prototypes]
     163 | int sss_tool_get_tx_wqe_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:163:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     163 | int sss_tool_get_tx_wqe_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:182:5: warning: no previous prototype for function 'sss_tool_get_rx_info' [-Wmissing-prototypes]
     182 | int sss_tool_get_rx_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     182 | int sss_tool_get_rx_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:223:5: warning: no previous prototype for function 'sss_tool_get_rx_wqe_info' [-Wmissing-prototypes]
     223 | int sss_tool_get_rx_wqe_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:223:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     223 | int sss_tool_get_rx_wqe_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:242:5: warning: no previous prototype for function 'sss_tool_get_rx_cqe_info' [-Wmissing-prototypes]
     242 | int sss_tool_get_rx_cqe_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:242:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     242 | int sss_tool_get_rx_cqe_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:280:5: warning: no previous prototype for function 'sss_tool_get_q_num' [-Wmissing-prototypes]
     280 | int sss_tool_get_q_num(struct sss_nic_dev *nic_dev, const void *in_buf, u32 in_len,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:280:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     280 | int sss_tool_get_q_num(struct sss_nic_dev *nic_dev, const void *in_buf, u32 in_len,
         | ^
         | static
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:304:5: warning: no previous prototype for function 'sss_tool_get_inter_num' [-Wmissing-prototypes]
     304 | int sss_tool_get_inter_num(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:304:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     304 | int sss_tool_get_inter_num(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static
   7 warnings generated.

vim +/sss_attach_uld_driver +276 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c

   275	
 > 276	int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
   277				  enum sss_service_type type, const struct sss_uld_info *uld_info)
   278	{
   279		int ret = 0;
   280		void *uld = NULL;
   281		const char **name = sss_get_uld_names();
   282		struct pci_dev *pdev = adapter->pcidev;
   283	
   284		mutex_lock(&adapter->uld_attach_mutex);
   285	
   286		if (adapter->uld_dev[type]) {
   287			sdk_err(&pdev->dev, "Fail to attach pci dev, driver %s\n", name[type]);
   288			mutex_unlock(&adapter->uld_attach_mutex);
   289			return 0;
   290		}
   291	
   292		ret = uld_info->probe(&adapter->hal_dev, &uld, adapter->uld_dev_name[type]);
   293		if (ret != 0) {
   294			sdk_err(&pdev->dev, "Fail to probe for driver %s\n", name[type]);
   295			mutex_unlock(&adapter->uld_attach_mutex);
   296			return ret;
   297		}
   298	
   299		adapter->uld_dev[type] = uld;
   300		set_bit(type, &adapter->uld_attach_state);
   301		mutex_unlock(&adapter->uld_attach_mutex);
   302	
   303		sdk_info(&pdev->dev, "Success to attach %s driver\n", name[type]);
   304	
   305		return 0;
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
