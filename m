Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3BA18C03F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 02:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765248420; cv=none; b=LEtk4WkTIZ1PbPYIdeBsTlftgA9tN9UR4zwunOk6P/TzcFP3/c3gTW+mNm0vTXRwOIXITQ7CcLb/UtA4LFrAW3zO6ldjoRyQwrKjuM8G4SgsIfOiZT8moxpTWMvwsULBqlOPf+Cv3vis+DP3xLWqpC3kqnCkkbhkukGUcQytUA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765248420; c=relaxed/simple;
	bh=TK6PvFJQa6mr30z5drn6n5ko0unRc+bILMIUIHw9s8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DXw/gMBx0q1IwyTsn0RKlf5XXJQ2rdbU+B/0xa5nWbM9mQipRPs1we5ft6c33htmpZJ3WqEwEaU6uf3xSJxhYMyjRdjBL9WPwLtQwgtfDXzSMHoKEq/EmMS2Um/dK210t/oqF3PqOdBwYfLvkS6j8dkUWYpPgDHpdNC4ie/EHF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0HGuG4k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0HGuG4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765248418; x=1796784418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TK6PvFJQa6mr30z5drn6n5ko0unRc+bILMIUIHw9s8U=;
  b=J0HGuG4k/MbPz6UfTxxk4ojG3Z0KMRx/UsTU9F0Wyiveg4RKTadm8ton
   ER40u67iJE92mxs11eKp4MEs0hAWgaMuWzblis7tmb9Jsy0guJWr+9KQM
   WQPVxprk97J4pQW68m5Zx5AC0H9s/rnKC94nSvp5eRMJJpNs/RMgRoYGF
   QZH1/r5NDElzBDqCWz4R0AgMbZsD5aQ+OifzNQsCfzXnoVQdarRbvoXTJ
   jbOOJLRJ69VU0ExcraGY6NNzdNU9VMB9DIZc747TbGP0n1N4e8ku9l/5d
   gX6v14sGctX0TdhGOaxPmekbHxUO/Hj8S66wY80v2a3i0ecKe6gsxjaxL
   w==;
X-CSE-ConnectionGUID: 1NySXcMESemolHK/xnur0A==
X-CSE-MsgGUID: 24V+qUPqQGWJ7BPEl3sIRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67250282"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="67250282"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 18:46:58 -0800
X-CSE-ConnectionGUID: uESyGte2Rki1Svo+xj23RA==
X-CSE-MsgGUID: aIaQyYJ7QTqxMCM3H4arkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="196156092"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2025 18:46:57 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSnkb-0000000001Z-4AeP;
	Tue, 09 Dec 2025 02:46:53 +0000
Date: Tue, 9 Dec 2025 03:45:54 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3490/3490]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:838:6: error: no previous
 prototype for function 'sxe_hw_event_irq_auto_clear_set'
Message-ID: <202512090327.qpSaRPFx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   451d7461fb9403af592235b03ec6ead64b43e7c8
commit: 0ba0ebb029b99864fa5963024535f48299373354 [3490/3490] !15589 [OLK-6.6] Ethernet: Supports Linkdata ethernet Controllers
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251209/202512090327.qpSaRPFx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090327.qpSaRPFx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090327.qpSaRPFx-lkp@intel.com/

All errors (new ones prefixed by >>):

     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:230:6: error: no previous prototype for function 'sxe_hw_no_snoop_disable' [-Werror,-Wmissing-prototypes]
     230 | void sxe_hw_no_snoop_disable(struct sxe_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:230:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     230 | void sxe_hw_no_snoop_disable(struct sxe_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:262:6: error: no previous prototype for function 'sxe_hw_uc_addr_pool_del' [-Werror,-Wmissing-prototypes]
     262 | void sxe_hw_uc_addr_pool_del(struct sxe_hw *hw, u32 rar_idx, u32 pool_idx)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:262:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     262 | void sxe_hw_uc_addr_pool_del(struct sxe_hw *hw, u32 rar_idx, u32 pool_idx)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:283:5: error: no previous prototype for function 'sxe_hw_uc_addr_pool_enable' [-Werror,-Wmissing-prototypes]
     283 | s32 sxe_hw_uc_addr_pool_enable(struct sxe_hw *hw, u8 rar_idx, u8 pool_idx)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     283 | s32 sxe_hw_uc_addr_pool_enable(struct sxe_hw *hw, u8 rar_idx, u8 pool_idx)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:337:5: error: no previous prototype for function 'sxe_hw_nic_reset' [-Werror,-Wmissing-prototypes]
     337 | s32 sxe_hw_nic_reset(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:337:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     337 | s32 sxe_hw_nic_reset(struct sxe_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:367:6: error: no previous prototype for function 'sxe_hw_pf_rst_done_set' [-Werror,-Wmissing-prototypes]
     367 | void sxe_hw_pf_rst_done_set(struct sxe_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:367:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     367 | void sxe_hw_pf_rst_done_set(struct sxe_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:735:5: error: no previous prototype for function 'sxe_hw_pending_irq_read_clear' [-Werror,-Wmissing-prototypes]
     735 | u32 sxe_hw_pending_irq_read_clear(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:735:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     735 | u32 sxe_hw_pending_irq_read_clear(struct sxe_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:740:6: error: no previous prototype for function 'sxe_hw_pending_irq_write_clear' [-Werror,-Wmissing-prototypes]
     740 | void sxe_hw_pending_irq_write_clear(struct sxe_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:740:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     740 | void sxe_hw_pending_irq_write_clear(struct sxe_hw *hw, u32 value)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:745:5: error: no previous prototype for function 'sxe_hw_irq_cause_get' [-Werror,-Wmissing-prototypes]
     745 | u32 sxe_hw_irq_cause_get(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:745:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     745 | u32 sxe_hw_irq_cause_get(struct sxe_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:765:6: error: no previous prototype for function 'sxe_hw_ring_irq_auto_disable' [-Werror,-Wmissing-prototypes]
     765 | void sxe_hw_ring_irq_auto_disable(struct sxe_hw *hw, bool is_msix)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:765:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     765 | void sxe_hw_ring_irq_auto_disable(struct sxe_hw *hw, bool is_msix)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:775:6: error: no previous prototype for function 'sxe_hw_irq_general_reg_set' [-Werror,-Wmissing-prototypes]
     775 | void sxe_hw_irq_general_reg_set(struct sxe_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:775:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     775 | void sxe_hw_irq_general_reg_set(struct sxe_hw *hw, u32 value)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:780:5: error: no previous prototype for function 'sxe_hw_irq_general_reg_get' [-Werror,-Wmissing-prototypes]
     780 | u32 sxe_hw_irq_general_reg_get(struct sxe_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:780:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     780 | u32 sxe_hw_irq_general_reg_get(struct sxe_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:790:6: error: no previous prototype for function 'sxe_hw_event_irq_map' [-Werror,-Wmissing-prototypes]
     790 | void sxe_hw_event_irq_map(struct sxe_hw *hw, u8 offset, u16 irq_idx)
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:790:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     790 | void sxe_hw_event_irq_map(struct sxe_hw *hw, u8 offset, u16 irq_idx)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:806:6: error: no previous prototype for function 'sxe_hw_ring_irq_map' [-Werror,-Wmissing-prototypes]
     806 | void sxe_hw_ring_irq_map(struct sxe_hw *hw, bool is_tx, u16 reg_idx,
         |      ^
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:806:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     806 | void sxe_hw_ring_irq_map(struct sxe_hw *hw, bool is_tx, u16 reg_idx,
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:823:6: error: no previous prototype for function 'sxe_hw_ring_irq_interval_set' [-Werror,-Wmissing-prototypes]
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
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:160:6: error: no previous prototype for function 'sxevf_hw_stop' [-Werror,-Wmissing-prototypes]
     160 | void sxevf_hw_stop(struct sxevf_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:160:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     160 | void sxevf_hw_stop(struct sxevf_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:187:6: error: no previous prototype for function 'sxevf_msg_write' [-Werror,-Wmissing-prototypes]
     187 | void sxevf_msg_write(struct sxevf_hw *hw, u8 index, u32 msg)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:187:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     187 | void sxevf_msg_write(struct sxevf_hw *hw, u8 index, u32 msg)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:196:5: error: no previous prototype for function 'sxevf_msg_read' [-Werror,-Wmissing-prototypes]
     196 | u32 sxevf_msg_read(struct sxevf_hw *hw, u8 index)
         |     ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:196:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     196 | u32 sxevf_msg_read(struct sxevf_hw *hw, u8 index)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:206:5: error: no previous prototype for function 'sxevf_mailbox_read' [-Werror,-Wmissing-prototypes]
     206 | u32 sxevf_mailbox_read(struct sxevf_hw *hw)
         |     ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:206:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     206 | u32 sxevf_mailbox_read(struct sxevf_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:211:6: error: no previous prototype for function 'sxevf_mailbox_write' [-Werror,-Wmissing-prototypes]
     211 | void sxevf_mailbox_write(struct sxevf_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     211 | void sxevf_mailbox_write(struct sxevf_hw *hw, u32 value)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:216:6: error: no previous prototype for function 'sxevf_pf_req_irq_trigger' [-Werror,-Wmissing-prototypes]
     216 | void sxevf_pf_req_irq_trigger(struct sxevf_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:216:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     216 | void sxevf_pf_req_irq_trigger(struct sxevf_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:221:6: error: no previous prototype for function 'sxevf_pf_ack_irq_trigger' [-Werror,-Wmissing-prototypes]
     221 | void sxevf_pf_ack_irq_trigger(struct sxevf_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     221 | void sxevf_pf_ack_irq_trigger(struct sxevf_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:226:6: error: no previous prototype for function 'sxevf_event_irq_map' [-Werror,-Wmissing-prototypes]
     226 | void sxevf_event_irq_map(struct sxevf_hw *hw, u16 vector)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     226 | void sxevf_event_irq_map(struct sxevf_hw *hw, u16 vector)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:240:6: error: no previous prototype for function 'sxevf_specific_irq_enable' [-Werror,-Wmissing-prototypes]
     240 | void sxevf_specific_irq_enable(struct sxevf_hw *hw, u32 value)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:240:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     240 | void sxevf_specific_irq_enable(struct sxevf_hw *hw, u32 value)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:245:6: error: no previous prototype for function 'sxevf_irq_enable' [-Werror,-Wmissing-prototypes]
     245 | void sxevf_irq_enable(struct sxevf_hw *hw, u32 mask)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     245 | void sxevf_irq_enable(struct sxevf_hw *hw, u32 mask)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:251:6: error: no previous prototype for function 'sxevf_irq_disable' [-Werror,-Wmissing-prototypes]
     251 | void sxevf_irq_disable(struct sxevf_hw *hw)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:251:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     251 | void sxevf_irq_disable(struct sxevf_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:259:6: error: no previous prototype for function 'sxevf_hw_ring_irq_map' [-Werror,-Wmissing-prototypes]
     259 | void sxevf_hw_ring_irq_map(struct sxevf_hw *hw, bool is_tx, u16 hw_ring_idx,
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:259:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     259 | void sxevf_hw_ring_irq_map(struct sxevf_hw *hw, bool is_tx, u16 hw_ring_idx,
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:276:6: error: no previous prototype for function 'sxevf_ring_irq_interval_set' [-Werror,-Wmissing-prototypes]
     276 | void sxevf_ring_irq_interval_set(struct sxevf_hw *hw, u16 irq_idx, u32 interval)
         |      ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:276:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     276 | void sxevf_ring_irq_interval_set(struct sxevf_hw *hw, u16 irq_idx, u32 interval)
         | ^
         | static 
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:313:6: error: no previous prototype for function 'sxevf_hw_reset' [-Werror,-Wmissing-prototypes]
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
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/sxe_hw_event_irq_auto_clear_set +838 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c

dd013ad487534c liujie_answer 2025-04-15  837  
dd013ad487534c liujie_answer 2025-04-15 @838  void sxe_hw_event_irq_auto_clear_set(struct sxe_hw *hw, u32 value)
dd013ad487534c liujie_answer 2025-04-15  839  {
dd013ad487534c liujie_answer 2025-04-15  840  	SXE_REG_WRITE(hw, SXE_EIAC, value);
dd013ad487534c liujie_answer 2025-04-15  841  }
dd013ad487534c liujie_answer 2025-04-15  842  
dd013ad487534c liujie_answer 2025-04-15 @843  void sxe_hw_specific_irq_disable(struct sxe_hw *hw, u32 value)
dd013ad487534c liujie_answer 2025-04-15  844  {
dd013ad487534c liujie_answer 2025-04-15  845  	SXE_REG_WRITE(hw, SXE_EIMC, value);
dd013ad487534c liujie_answer 2025-04-15  846  }
dd013ad487534c liujie_answer 2025-04-15  847  
dd013ad487534c liujie_answer 2025-04-15 @848  void sxe_hw_specific_irq_enable(struct sxe_hw *hw, u32 value)
dd013ad487534c liujie_answer 2025-04-15  849  {
dd013ad487534c liujie_answer 2025-04-15  850  	SXE_REG_WRITE(hw, SXE_EIMS, value);
dd013ad487534c liujie_answer 2025-04-15  851  }
dd013ad487534c liujie_answer 2025-04-15  852  
dd013ad487534c liujie_answer 2025-04-15  853  static u32 sxe_hw_spp_state_get(struct sxe_hw *hw)
dd013ad487534c liujie_answer 2025-04-15  854  {
dd013ad487534c liujie_answer 2025-04-15  855  	return SXE_REG_READ(hw, SXE_SPP_STATE);
dd013ad487534c liujie_answer 2025-04-15  856  }
dd013ad487534c liujie_answer 2025-04-15  857  
dd013ad487534c liujie_answer 2025-04-15  858  static void sxe_hw_rx_los_disable(struct sxe_hw *hw)
dd013ad487534c liujie_answer 2025-04-15  859  {
dd013ad487534c liujie_answer 2025-04-15  860  	u32 value;
dd013ad487534c liujie_answer 2025-04-15  861  
dd013ad487534c liujie_answer 2025-04-15  862  	value = SXE_REG_READ(hw, SXE_EIMS);
dd013ad487534c liujie_answer 2025-04-15  863  	value &= ~SXE_EIMS_GPI_SPP1;
dd013ad487534c liujie_answer 2025-04-15  864  	SXE_REG_WRITE(hw, SXE_EIMS, value);
dd013ad487534c liujie_answer 2025-04-15  865  }
dd013ad487534c liujie_answer 2025-04-15  866  
dd013ad487534c liujie_answer 2025-04-15  867  static void sxe_hw_rx_los_enable(struct sxe_hw *hw)
dd013ad487534c liujie_answer 2025-04-15  868  {
dd013ad487534c liujie_answer 2025-04-15  869  	u32 value;
dd013ad487534c liujie_answer 2025-04-15  870  
dd013ad487534c liujie_answer 2025-04-15  871  	value = SXE_REG_READ(hw, SXE_EIMS);
dd013ad487534c liujie_answer 2025-04-15  872  	value |= SXE_EIMS_GPI_SPP1;
dd013ad487534c liujie_answer 2025-04-15  873  	SXE_REG_WRITE(hw, SXE_EIMS, value);
dd013ad487534c liujie_answer 2025-04-15  874  }
dd013ad487534c liujie_answer 2025-04-15  875  
dd013ad487534c liujie_answer 2025-04-15 @876  void sxe_hw_all_irq_disable(struct sxe_hw *hw)
dd013ad487534c liujie_answer 2025-04-15  877  {
dd013ad487534c liujie_answer 2025-04-15  878  	SXE_REG_WRITE(hw, SXE_EIMC, 0xFFFF0000);
dd013ad487534c liujie_answer 2025-04-15  879  
dd013ad487534c liujie_answer 2025-04-15  880  	SXE_REG_WRITE(hw, SXE_EIMC_EX(0), ~0);
dd013ad487534c liujie_answer 2025-04-15  881  	SXE_REG_WRITE(hw, SXE_EIMC_EX(1), ~0);
dd013ad487534c liujie_answer 2025-04-15  882  
dd013ad487534c liujie_answer 2025-04-15  883  	SXE_WRITE_FLUSH(hw);
dd013ad487534c liujie_answer 2025-04-15  884  }
dd013ad487534c liujie_answer 2025-04-15  885  

:::::: The code at line 838 was first introduced by commit
:::::: dd013ad487534c1838afc2f55efdb5daec15aace Ethernet: Linkdata: Supports Linkdata ethernet Controllers

:::::: TO: liujie_answer <liujie5@linkdatatechnology.com>
:::::: CC: liujie_answer <liujie5@linkdatatechnology.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
