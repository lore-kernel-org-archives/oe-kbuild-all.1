Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36362286D6F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304194; cv=none; b=oCc5D1MwF5tiLZa7lQ9xs96+NcJbtBaAdNAQiimEibuqoeA2OeyhYHXZbvkLCbYHVNFwmFaLqjR3iqKH9icVwwh4P/SJlhNiGb6cyZBi+6eiQEju0QC7AO7uWmJdI0eMgtZ8n8XwX0DMJ2BIWZ458lsu+c78J6XjrMlH5jTx+5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304194; c=relaxed/simple;
	bh=fuDvjF3RyeKwxST3TgQsHT4vPiEHSyVzFdX2D5SrKqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XyHUW0WVcPGfzifkZlApXY2crdMstVR+vSbqRjUgJfHxJXQBha7zy3PCqKnkJR6dzRiFpIR3jfXJJRAFFfADUzz77lavRvhmraDvBg4rbrnDC3gzyYJS7GXI9lXygcueQ6ehYlLep5D4VA+G7g001UwIf+6n35OpfUjw9oIG9SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kc8zncqA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kc8zncqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751304192; x=1782840192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fuDvjF3RyeKwxST3TgQsHT4vPiEHSyVzFdX2D5SrKqA=;
  b=Kc8zncqASIq/BXBW4XIQLiLRhmowWbIg4l2sL1PYI9sSyTdNR5/FysHz
   zhhaS5J9aL/q49J0oQUaEjICh/oHxiWXh9PUQboV3y56fNA6LDp74wD8x
   h8cIWOowJIosS5zfmQOo+Ai12rQMJwEK+DzRoLD9AwoRlbddYBRxZRUY+
   tmSV/WV7ZuceOYX8uOeN6JTRBDr0zrFCP4bbZrvrrxOBE63i1uRNstNLW
   NyLVGmzIJUFRiFN/PdE+mJuRqYbG0kY+oUlLWj/YTykW1vOHG4umJ72AO
   5wTxe6Mr2rjkQ5bsUpxdT3UbwIQj/jvxav54IuhX5PRTNXEdSVSnozMBm
   A==;
X-CSE-ConnectionGUID: DHBLkn9uQfqt/3isP3fqzQ==
X-CSE-MsgGUID: 2Xx7E5n9RBqOFProp97F4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52655687"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="52655687"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 10:23:11 -0700
X-CSE-ConnectionGUID: UyrIJk5wRyuSJVXmFRLTSQ==
X-CSE-MsgGUID: YLIxp9vgTbG3sTuSFuyh9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="152904774"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 30 Jun 2025 10:23:10 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWIDj-0001Fr-1q;
	Mon, 30 Jun 2025 17:23:07 +0000
Date: Mon, 30 Jun 2025 19:23:00 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2994/2994]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:432:6: error: no
 previous prototype for function 'sxe_debugfs_entries_init'
Message-ID: <202506301940.eVT83gzC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2264b0731bcc958f540da580ad93b9f103a8e271
commit: 8cee206b5558245197158bd20895f95cc28d8468 [2994/2994] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250630/202506301940.eVT83gzC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301940.eVT83gzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301940.eVT83gzC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_xdp.c:403:6: error: no previous prototype for function 'sxe_txrx_ring_enable' [-Werror,-Wmissing-prototypes]
     403 | void sxe_txrx_ring_enable(struct sxe_adapter *adapter, u32 ring_idx)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_xdp.c:403:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     403 | void sxe_txrx_ring_enable(struct sxe_adapter *adapter, u32 ring_idx)
         | ^
         | static 
   1 error generated.
--
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
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:70:6: error: no previous prototype for function 'sxe_allow_inval_mac' [-Werror,-Wmissing-prototypes]
      70 | bool sxe_allow_inval_mac(void)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:70:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      70 | bool sxe_allow_inval_mac(void)
         | ^
         | static 
   1 error generated.
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
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:160:6: error: no previous prototype for function 'sxevf_hw_stop' [-Werror,-Wmissing-prototypes]
     160 | void sxevf_hw_stop(struct sxevf_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:160:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     160 | void sxevf_hw_stop(struct sxevf_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:187:6: error: no previous prototype for function 'sxevf_msg_write' [-Werror,-Wmissing-prototypes]
     187 | void sxevf_msg_write(struct sxevf_hw *hw, u8 index, u32 msg)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:187:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     187 | void sxevf_msg_write(struct sxevf_hw *hw, u8 index, u32 msg)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:196:5: error: no previous prototype for function 'sxevf_msg_read' [-Werror,-Wmissing-prototypes]
     196 | u32 sxevf_msg_read(struct sxevf_hw *hw, u8 index)
         |     ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:196:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     196 | u32 sxevf_msg_read(struct sxevf_hw *hw, u8 index)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:206:5: error: no previous prototype for function 'sxevf_mailbox_read' [-Werror,-Wmissing-prototypes]
     206 | u32 sxevf_mailbox_read(struct sxevf_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:206:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     206 | u32 sxevf_mailbox_read(struct sxevf_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:211:6: error: no previous prototype for function 'sxevf_mailbox_write' [-Werror,-Wmissing-prototypes]
     211 | void sxevf_mailbox_write(struct sxevf_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     211 | void sxevf_mailbox_write(struct sxevf_hw *hw, u32 value)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:216:6: error: no previous prototype for function 'sxevf_pf_req_irq_trigger' [-Werror,-Wmissing-prototypes]
     216 | void sxevf_pf_req_irq_trigger(struct sxevf_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:216:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     216 | void sxevf_pf_req_irq_trigger(struct sxevf_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:221:6: error: no previous prototype for function 'sxevf_pf_ack_irq_trigger' [-Werror,-Wmissing-prototypes]
     221 | void sxevf_pf_ack_irq_trigger(struct sxevf_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     221 | void sxevf_pf_ack_irq_trigger(struct sxevf_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:226:6: error: no previous prototype for function 'sxevf_event_irq_map' [-Werror,-Wmissing-prototypes]
     226 | void sxevf_event_irq_map(struct sxevf_hw *hw, u16 vector)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     226 | void sxevf_event_irq_map(struct sxevf_hw *hw, u16 vector)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:240:6: error: no previous prototype for function 'sxevf_specific_irq_enable' [-Werror,-Wmissing-prototypes]
     240 | void sxevf_specific_irq_enable(struct sxevf_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:240:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     240 | void sxevf_specific_irq_enable(struct sxevf_hw *hw, u32 value)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:245:6: error: no previous prototype for function 'sxevf_irq_enable' [-Werror,-Wmissing-prototypes]
     245 | void sxevf_irq_enable(struct sxevf_hw *hw, u32 mask)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     245 | void sxevf_irq_enable(struct sxevf_hw *hw, u32 mask)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:251:6: error: no previous prototype for function 'sxevf_irq_disable' [-Werror,-Wmissing-prototypes]
     251 | void sxevf_irq_disable(struct sxevf_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:251:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     251 | void sxevf_irq_disable(struct sxevf_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:259:6: error: no previous prototype for function 'sxevf_hw_ring_irq_map' [-Werror,-Wmissing-prototypes]
     259 | void sxevf_hw_ring_irq_map(struct sxevf_hw *hw, bool is_tx, u16 hw_ring_idx,
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:259:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     259 | void sxevf_hw_ring_irq_map(struct sxevf_hw *hw, bool is_tx, u16 hw_ring_idx,
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:276:6: error: no previous prototype for function 'sxevf_ring_irq_interval_set' [-Werror,-Wmissing-prototypes]
     276 | void sxevf_ring_irq_interval_set(struct sxevf_hw *hw, u16 irq_idx, u32 interval)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:276:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     276 | void sxevf_ring_irq_interval_set(struct sxevf_hw *hw, u16 irq_idx, u32 interval)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:313:6: error: no previous prototype for function 'sxevf_hw_reset' [-Werror,-Wmissing-prototypes]
     313 | void sxevf_hw_reset(struct sxevf_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:313:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     313 | void sxevf_hw_reset(struct sxevf_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:324:5: error: no previous prototype for function 'sxevf_link_state_get' [-Werror,-Wmissing-prototypes]
     324 | u32 sxevf_link_state_get(struct sxevf_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:324:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     324 | u32 sxevf_link_state_get(struct sxevf_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:539:6: error: no previous prototype for function 'sxevf_tx_ring_switch' [-Werror,-Wmissing-prototypes]
     539 | void sxevf_tx_ring_switch(struct sxevf_hw *hw, u8 reg_idx, bool is_on)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:539:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     539 | void sxevf_tx_ring_switch(struct sxevf_hw *hw, u8 reg_idx, bool is_on)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:594:6: error: no previous prototype for function 'sxevf_rx_ring_switch' [-Werror,-Wmissing-prototypes]
     594 | void sxevf_rx_ring_switch(struct sxevf_hw *hw, u8 reg_idx, bool is_on)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:594:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     594 | void sxevf_rx_ring_switch(struct sxevf_hw *hw, u8 reg_idx, bool is_on)
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:626:6: error: no previous prototype for function 'sxevf_rx_ring_desc_configure' [-Werror,-Wmissing-prototypes]
     626 | void sxevf_rx_ring_desc_configure(struct sxevf_hw *hw, u32 desc_mem_len,
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:626:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     626 | void sxevf_rx_ring_desc_configure(struct sxevf_hw *hw, u32 desc_mem_len,
         | ^
         | static 
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:640:6: error: no previous prototype for function 'sxevf_rx_rcv_ctl_configure' [-Werror,-Wmissing-prototypes]
     640 | void sxevf_rx_rcv_ctl_configure(struct sxevf_hw *hw, u8 reg_idx,
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:640:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     640 | void sxevf_rx_rcv_ctl_configure(struct sxevf_hw *hw, u8 reg_idx,
         | ^
         | static 
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
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
