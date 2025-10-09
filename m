Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C222127A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760027885; cv=none; b=mbVJ822/XvXsIjQoMQDTzb1/UxRuiywT3VDtJrBOvnd4Pz4MiqxwIeOGTT619abqqyihEMRxDH4vt52+R8LfUjizW9xh8LBJYjs1cPkZjf1R0ZIFuu0e6hDcrBZItbrw+W/aUcS3UfGcairfBAyThwv5i0nsPlAQlEouHZN6fas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760027885; c=relaxed/simple;
	bh=z/hZ5DM6M0o0TCihfIsH/c48ih6CVoJTdXbB1y6QgSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Py3WTJk7bAYWBNzT61eU9bqJeXHTdxQDykKVTZjH3Ws61PdT6M0cVMtrFnF9I8XG0byAapBTnqnSb8IRzvJk7kCV/pOF1g7uVW3Vb8CypewlRFGWY0GilEg+1EoMaz5u0yhGMKLnzWClMZcFv09EAWPM69gh5Uw7knyv2xIub1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XIVQyRdw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIVQyRdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760027883; x=1791563883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/hZ5DM6M0o0TCihfIsH/c48ih6CVoJTdXbB1y6QgSw=;
  b=XIVQyRdwuA0mqFpbiJcNeaMksQncI9F9J0vQROckGj2kKwovO63TGqLM
   GISVH4JCtiHszlBF30VzCAuTk3qUGTStr2PLWkWBkhx4uzE6BrWvVH0tt
   2IckWUymUobIDMFwo2hyuAOVd3VhUkXjlg+np4Ka0wxzYg0hcvN4lh5t9
   Daqo6UxkqX1GNcrJRaRi8wfFIPQO/ORK/Ot8MHqbL17u/xV6iVNBCXQzf
   1jGRe3dUcYQ1sq/hxzZUdorRGv7o1hh5UumZbWOQapfp49oA2H9eNDvMf
   ZXz83QZnQfMMMSobJzVpnu45pFR3vKzH22HxYgO8QP8axiFWlPOzKzo64
   A==;
X-CSE-ConnectionGUID: 5ASSWeS7SfGxozmj6ZD0zQ==
X-CSE-MsgGUID: BE4CaqHMQPacd05UZRL0Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73672978"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="73672978"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:37:59 -0700
X-CSE-ConnectionGUID: 2xVUCcz7TRu8S3Gre42rVg==
X-CSE-MsgGUID: F6APZYT7Qrio8NdwRLoVag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="181182060"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Oct 2025 09:37:58 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6teN-00011C-2t;
	Thu, 09 Oct 2025 16:37:55 +0000
Date: Fri, 10 Oct 2025 00:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3225/3225]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:432:6: error: no
 previous prototype for function 'sxe_debugfs_entries_init'
Message-ID: <202510100010.1sOZz1Ev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liujie_answer,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ed0b197442ae45344fe89df38c8549ec188846b6
commit: 8cee206b5558245197158bd20895f95cc28d8468 [3225/3225] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-buildonly-randconfig-004-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100010.1sOZz1Ev-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100010.1sOZz1Ev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100010.1sOZz1Ev-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:432:6: error: no previous prototype for function 'sxe_debugfs_entries_init' [-Werror,-Wmissing-prototypes]
     432 | void sxe_debugfs_entries_init(struct sxe_adapter *adapter)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:432:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     432 | void sxe_debugfs_entries_init(struct sxe_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:459:6: error: no previous prototype for function 'sxe_debugfs_entries_exit' [-Werror,-Wmissing-prototypes]
     459 | void sxe_debugfs_entries_exit(struct sxe_adapter *adapter)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:459:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     459 | void sxe_debugfs_entries_exit(struct sxe_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:465:6: error: no previous prototype for function 'sxe_debugfs_init' [-Werror,-Wmissing-prototypes]
     465 | void sxe_debugfs_init(void)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:465:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     465 | void sxe_debugfs_init(void)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:470:6: error: no previous prototype for function 'sxe_debugfs_exit' [-Werror,-Wmissing-prototypes]
     470 | void sxe_debugfs_exit(void)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:470:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     470 | void sxe_debugfs_exit(void)
         | ^
         | static 
   4 errors generated.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:230:6: error: no previous prototype for function 'sxe_hw_no_snoop_disable' [-Werror,-Wmissing-prototypes]
     230 | void sxe_hw_no_snoop_disable(struct sxe_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:230:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     230 | void sxe_hw_no_snoop_disable(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:262:6: error: no previous prototype for function 'sxe_hw_uc_addr_pool_del' [-Werror,-Wmissing-prototypes]
     262 | void sxe_hw_uc_addr_pool_del(struct sxe_hw *hw, u32 rar_idx, u32 pool_idx)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:262:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     262 | void sxe_hw_uc_addr_pool_del(struct sxe_hw *hw, u32 rar_idx, u32 pool_idx)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:283:5: error: no previous prototype for function 'sxe_hw_uc_addr_pool_enable' [-Werror,-Wmissing-prototypes]
     283 | s32 sxe_hw_uc_addr_pool_enable(struct sxe_hw *hw, u8 rar_idx, u8 pool_idx)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     283 | s32 sxe_hw_uc_addr_pool_enable(struct sxe_hw *hw, u8 rar_idx, u8 pool_idx)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:337:5: error: no previous prototype for function 'sxe_hw_nic_reset' [-Werror,-Wmissing-prototypes]
     337 | s32 sxe_hw_nic_reset(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:337:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     337 | s32 sxe_hw_nic_reset(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:367:6: error: no previous prototype for function 'sxe_hw_pf_rst_done_set' [-Werror,-Wmissing-prototypes]
     367 | void sxe_hw_pf_rst_done_set(struct sxe_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:367:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     367 | void sxe_hw_pf_rst_done_set(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:735:5: error: no previous prototype for function 'sxe_hw_pending_irq_read_clear' [-Werror,-Wmissing-prototypes]
     735 | u32 sxe_hw_pending_irq_read_clear(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:735:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     735 | u32 sxe_hw_pending_irq_read_clear(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:740:6: error: no previous prototype for function 'sxe_hw_pending_irq_write_clear' [-Werror,-Wmissing-prototypes]
     740 | void sxe_hw_pending_irq_write_clear(struct sxe_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:740:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     740 | void sxe_hw_pending_irq_write_clear(struct sxe_hw *hw, u32 value)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:745:5: error: no previous prototype for function 'sxe_hw_irq_cause_get' [-Werror,-Wmissing-prototypes]
     745 | u32 sxe_hw_irq_cause_get(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:745:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     745 | u32 sxe_hw_irq_cause_get(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:765:6: error: no previous prototype for function 'sxe_hw_ring_irq_auto_disable' [-Werror,-Wmissing-prototypes]
     765 | void sxe_hw_ring_irq_auto_disable(struct sxe_hw *hw, bool is_msix)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:765:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     765 | void sxe_hw_ring_irq_auto_disable(struct sxe_hw *hw, bool is_msix)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:775:6: error: no previous prototype for function 'sxe_hw_irq_general_reg_set' [-Werror,-Wmissing-prototypes]
     775 | void sxe_hw_irq_general_reg_set(struct sxe_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:775:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     775 | void sxe_hw_irq_general_reg_set(struct sxe_hw *hw, u32 value)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:780:5: error: no previous prototype for function 'sxe_hw_irq_general_reg_get' [-Werror,-Wmissing-prototypes]
     780 | u32 sxe_hw_irq_general_reg_get(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:780:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     780 | u32 sxe_hw_irq_general_reg_get(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:790:6: error: no previous prototype for function 'sxe_hw_event_irq_map' [-Werror,-Wmissing-prototypes]
     790 | void sxe_hw_event_irq_map(struct sxe_hw *hw, u8 offset, u16 irq_idx)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:790:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     790 | void sxe_hw_event_irq_map(struct sxe_hw *hw, u8 offset, u16 irq_idx)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:806:6: error: no previous prototype for function 'sxe_hw_ring_irq_map' [-Werror,-Wmissing-prototypes]
     806 | void sxe_hw_ring_irq_map(struct sxe_hw *hw, bool is_tx, u16 reg_idx,
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:806:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     806 | void sxe_hw_ring_irq_map(struct sxe_hw *hw, bool is_tx, u16 reg_idx,
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:823:6: error: no previous prototype for function 'sxe_hw_ring_irq_interval_set' [-Werror,-Wmissing-prototypes]
     823 | void sxe_hw_ring_irq_interval_set(struct sxe_hw *hw, u16 irq_idx, u32 interval)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:823:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     823 | void sxe_hw_ring_irq_interval_set(struct sxe_hw *hw, u16 irq_idx, u32 interval)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:838:6: error: no previous prototype for function 'sxe_hw_event_irq_auto_clear_set' [-Werror,-Wmissing-prototypes]
     838 | void sxe_hw_event_irq_auto_clear_set(struct sxe_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:838:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     838 | void sxe_hw_event_irq_auto_clear_set(struct sxe_hw *hw, u32 value)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:843:6: error: no previous prototype for function 'sxe_hw_specific_irq_disable' [-Werror,-Wmissing-prototypes]
     843 | void sxe_hw_specific_irq_disable(struct sxe_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:843:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     843 | void sxe_hw_specific_irq_disable(struct sxe_hw *hw, u32 value)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:848:6: error: no previous prototype for function 'sxe_hw_specific_irq_enable' [-Werror,-Wmissing-prototypes]
     848 | void sxe_hw_specific_irq_enable(struct sxe_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:848:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     848 | void sxe_hw_specific_irq_enable(struct sxe_hw *hw, u32 value)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:876:6: error: no previous prototype for function 'sxe_hw_all_irq_disable' [-Werror,-Wmissing-prototypes]
     876 | void sxe_hw_all_irq_disable(struct sxe_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:876:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     876 | void sxe_hw_all_irq_disable(struct sxe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:994:5: error: no previous prototype for function 'sxe_hw_link_speed_get' [-Werror,-Wmissing-prototypes]
     994 | u32 sxe_hw_link_speed_get(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:994:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     994 | u32 sxe_hw_link_speed_get(struct sxe_hw *hw)
         | ^
         | static 
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_phy.c:733:5: error: no previous prototype for function 'sxe_multispeed_sfp_link_configure' [-Werror,-Wmissing-prototypes]
     733 | s32 sxe_multispeed_sfp_link_configure(struct sxe_adapter *adapter, u32 speed)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_phy.c:733:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     733 | s32 sxe_multispeed_sfp_link_configure(struct sxe_adapter *adapter, u32 speed)
         | ^
         | static 
   1 error generated.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_rx_proc.c:1431:6: error: no previous prototype for function 'sxe_headers_cleanup' [-Werror,-Wmissing-prototypes]
    1431 | bool sxe_headers_cleanup(struct sxe_ring *rx_ring,
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_rx_proc.c:1431:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1431 | bool sxe_headers_cleanup(struct sxe_ring *rx_ring,
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_rx_proc.c:1569:6: error: no previous prototype for function 'sxe_rx_buffer_page_offset_update' [-Werror,-Wmissing-prototypes]
    1569 | void sxe_rx_buffer_page_offset_update(struct sxe_ring *rx_ring,
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_rx_proc.c:1569:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1569 | void sxe_rx_buffer_page_offset_update(struct sxe_ring *rx_ring,
         | ^
         | static 
   2 errors generated.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:136:5: error: no previous prototype for function 'sxe_msi_irq_init' [-Werror,-Wmissing-prototypes]
     136 | int sxe_msi_irq_init(struct sxe_adapter *adapter)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:136:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     136 | int sxe_msi_irq_init(struct sxe_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:182:6: error: no previous prototype for function 'sxe_disable_dcb' [-Werror,-Wmissing-prototypes]
     182 | void sxe_disable_dcb(struct sxe_adapter *adapter)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     182 | void sxe_disable_dcb(struct sxe_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:212:6: error: no previous prototype for function 'sxe_disable_rss' [-Werror,-Wmissing-prototypes]
     212 | void sxe_disable_rss(struct sxe_adapter *adapter)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:212:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     212 | void sxe_disable_rss(struct sxe_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:729:6: error: no previous prototype for function 'sxe_lsc_irq_handler' [-Werror,-Wmissing-prototypes]
     729 | void sxe_lsc_irq_handler(struct sxe_adapter *adapter)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:729:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     729 | void sxe_lsc_irq_handler(struct sxe_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:745:6: error: no previous prototype for function 'sxe_mailbox_irq_handler' [-Werror,-Wmissing-prototypes]
     745 | void sxe_mailbox_irq_handler(struct sxe_adapter *adapter)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:745:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     745 | void sxe_mailbox_irq_handler(struct sxe_adapter *adapter)
         | ^
         | static 
   5 errors generated.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_xdp.c:403:6: error: no previous prototype for function 'sxe_txrx_ring_enable' [-Werror,-Wmissing-prototypes]
     403 | void sxe_txrx_ring_enable(struct sxe_adapter *adapter, u32 ring_idx)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_xdp.c:403:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     403 | void sxe_txrx_ring_enable(struct sxe_adapter *adapter, u32 ring_idx)
         | ^
         | static 
   1 error generated.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_sriov.c:766:6: error: variable 'ret' set but not used [-Werror,-Wunused-but-set-variable]
     766 |         s32 ret;
         |             ^
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_sriov.c:1552:6: error: no previous prototype for function 'sxe_set_vf_link_enable' [-Werror,-Wmissing-prototypes]
    1552 | void sxe_set_vf_link_enable(struct sxe_adapter *adapter, s32 vf_idx, s32 state)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_sriov.c:1552:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1552 | void sxe_set_vf_link_enable(struct sxe_adapter *adapter, s32 vf_idx, s32 state)
         | ^
         | static 
   2 errors generated.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:2022:5: error: no previous prototype for function 'sxe_reg_test' [-Werror,-Wmissing-prototypes]
    2022 | int sxe_reg_test(struct sxe_adapter *adapter)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:2022:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2022 | int sxe_reg_test(struct sxe_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:2644:5: error: no previous prototype for function 'sxe_phys_id_set' [-Werror,-Wmissing-prototypes]
    2644 | int sxe_phys_id_set(struct net_device *netdev, enum ethtool_phys_id_state state)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:2644:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2644 | int sxe_phys_id_set(struct net_device *netdev, enum ethtool_phys_id_state state)
         | ^
         | static 
   2 errors generated.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:70:6: error: no previous prototype for function 'sxe_allow_inval_mac' [-Werror,-Wmissing-prototypes]
      70 | bool sxe_allow_inval_mac(void)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:70:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      70 | bool sxe_allow_inval_mac(void)
         | ^
         | static 
   1 error generated.
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_rx_proc.c:362:6: error: no previous prototype for function 'sxevf_rx_ring_buffers_alloc' [-Werror,-Wmissing-prototypes]
     362 | void sxevf_rx_ring_buffers_alloc(struct sxevf_ring *rx_ring, u16 cleaned_count)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_rx_proc.c:362:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     362 | void sxevf_rx_ring_buffers_alloc(struct sxevf_ring *rx_ring, u16 cleaned_count)
         | ^
         | static 
   1 error generated.
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:88:6: error: no previous prototype for function 'sxevf_tx_ring_free' [-Werror,-Wmissing-prototypes]
      88 | void sxevf_tx_ring_free(struct sxevf_ring *ring)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:88:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      88 | void sxevf_tx_ring_free(struct sxevf_ring *ring)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:127:5: error: no previous prototype for function 'sxevf_tx_ring_alloc' [-Werror,-Wmissing-prototypes]
     127 | s32 sxevf_tx_ring_alloc(struct sxevf_ring *ring)
         |     ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:127:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     127 | s32 sxevf_tx_ring_alloc(struct sxevf_ring *ring)
         | ^
         | static 
   2 errors generated.
..


vim +/sxe_debugfs_entries_init +432 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c

   431	
 > 432	void sxe_debugfs_entries_init(struct sxe_adapter *adapter)
   433	{
   434		struct dentry *dir;
   435		const char *name = pci_name(adapter->pdev);
   436	
   437		adapter->debugfs_entries = debugfs_create_dir(name, sxe_debugfs_root);
   438		dir = debugfs_create_file("reg_ops", 0600, adapter->debugfs_entries,
   439					  adapter, &sxe_debugfs_reg_ops_fops);
   440		if (!dir || dir == ERR_PTR(-ENODEV))
   441			LOG_INFO_BDF("debugfs:reg_ops file create failed\n");
   442	
   443		dir = debugfs_create_file("netdev_ops", 0600, adapter->debugfs_entries,
   444					  adapter, &sxe_debugfs_netdev_ops_fops);
   445		if (!dir || dir == ERR_PTR(-ENODEV))
   446			LOG_INFO_BDF("debugfs:netdev_ops file create failed\n");
   447	
   448		dir = debugfs_create_file("hw_stats", 0400, adapter->debugfs_entries,
   449					  adapter, &sxe_debugfs_hw_stats_fops);
   450		if (!dir || dir == ERR_PTR(-ENODEV))
   451			LOG_INFO_BDF("debugfs:hw_stats file create failed\n");
   452	
   453		dir = debugfs_create_file("sfp_info", 0400, adapter->debugfs_entries,
   454					  adapter, &sxe_debugfs_sfp_info_fops);
   455		if (!dir || dir == ERR_PTR(-ENODEV))
   456			LOG_INFO_BDF("debugfs:sfp_info file create failed\n");
   457	}
   458	
 > 459	void sxe_debugfs_entries_exit(struct sxe_adapter *adapter)
   460	{
   461		debugfs_remove_recursive(adapter->debugfs_entries);
   462		adapter->debugfs_entries = NULL;
   463	}
   464	
 > 465	void sxe_debugfs_init(void)
   466	{
   467		sxe_debugfs_root = debugfs_create_dir(SXE_DRV_NAME, NULL);
   468	}
   469	
 > 470	void sxe_debugfs_exit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
