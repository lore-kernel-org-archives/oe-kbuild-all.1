Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF441BF58
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 00:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751674020; cv=none; b=hCjHsvGwgUKT//tQNxqRTedNKre060bapnyEzJ5YB/ie/kgBaRk3RVnfkOojwaSQ5pOEA6G1i/nKD3MGY0+ozt9QqeRVD0jYMhyuesnkd2Kr1fs9HQWQg0KH/WIOA1KfCh0rOHxDciWzbv5b9xsWS1+IwRUmEQ4tPV/gxTWpjdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751674020; c=relaxed/simple;
	bh=05sDY4lIKMA6qbRhVi7MyTDmZyGTmNP4Ze+E/rIumW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PcPvM3QtqrZ004gph63slSqu/YP9h/kCuxs8BV34dSBBGkR8ixC128MKS4a+3ObNirwBlD1aP2b0fNLN7PIswhbyvFxdxFEnhI1HWTf3XJIxWV/Kij9QOkEvYYmIwP4qn2VIZc3wgbWYsYulMkdJ5fJ7VF8onMTUYGH3ixSvwCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Leh9FfG6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Leh9FfG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751674017; x=1783210017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=05sDY4lIKMA6qbRhVi7MyTDmZyGTmNP4Ze+E/rIumW4=;
  b=Leh9FfG6KS6Ca2LPZBi6vB5WQLc8DRFXChCZa1gwTJvCtEdDQpRObFJt
   UFN5FH5B3HwEVLyAmQlPlHnD5/S8lh6Zc+LI64dj5EXq0W72y9vUyCIf+
   rrYCXPbbxGKbXm55yqt4XFw9TBIdqOPGN4DNndkI5THJPaCf6LczK9t0o
   vLLsEGybQx4LQUxYXLbMojggPcT+CNyI3WLJWsHkStCp2y9M+7iJ9Ccbp
   jd1f4HsDrPxwrf75ssqq1D1g/JaqfOGK+AtJwW5YJAwODq3sfORTh/XPN
   +F+7wJH4d8OJ5QG6PyFbjFMZ6myU6adaiYNucp0y4xOL+VPO7Teqx5pDn
   Q==;
X-CSE-ConnectionGUID: RdjlRiLXTwCrHIBPNziApg==
X-CSE-MsgGUID: 8tNV9uNKTBW1CpPpnJWTWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53920110"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="53920110"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 17:06:56 -0700
X-CSE-ConnectionGUID: NBZrKPkwRW2dWiDxxQjo6A==
X-CSE-MsgGUID: 3nqQCqsRSTKZyXfk/rjGZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="154482506"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Jul 2025 17:06:56 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXqQe-00049V-3A;
	Sat, 05 Jul 2025 00:06:52 +0000
Date: Sat, 5 Jul 2025 08:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2439/2439]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:843:6: error: no previous
 prototype for function 'sxe_hw_specific_irq_disable'
Message-ID: <202507050814.KUGpMC88-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi openeuler-ci-bot,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   016a2eb38be5e29bea5011bd5fed627886f59f65
commit: 0ba0ebb029b99864fa5963024535f48299373354 [2439/2439] !15589 [OLK-6.6] Ethernet: Supports Linkdata ethernet Controllers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250705/202507050814.KUGpMC88-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050814.KUGpMC88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507050814.KUGpMC88-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:838:6: error: no previous prototype for function 'sxe_hw_event_irq_auto_clear_set' [-Werror,-Wmissing-prototypes]
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
   In file included from drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_ethtool.c:12:
   In file included from drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_ethtool.h:14:
   In file included from include/linux/ethtool.h:16:
   In file included from include/linux/bitmap.h:11:
   In file included from include/linux/string.h:294:
>> include/linux/fortify-string.h:606:4: error: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
     606 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   1 error generated.
--
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
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:324:5: error: no previous prototype for function 'sxevf_link_state_get' [-Werror,-Wmissing-prototypes]
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


vim +/sxe_hw_specific_irq_disable +843 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c

dd013ad487534c liujie_answer 2025-04-15   842  
dd013ad487534c liujie_answer 2025-04-15  @843  void sxe_hw_specific_irq_disable(struct sxe_hw *hw, u32 value)
dd013ad487534c liujie_answer 2025-04-15   844  {
dd013ad487534c liujie_answer 2025-04-15   845  	SXE_REG_WRITE(hw, SXE_EIMC, value);
dd013ad487534c liujie_answer 2025-04-15   846  }
dd013ad487534c liujie_answer 2025-04-15   847  
dd013ad487534c liujie_answer 2025-04-15  @848  void sxe_hw_specific_irq_enable(struct sxe_hw *hw, u32 value)
dd013ad487534c liujie_answer 2025-04-15   849  {
dd013ad487534c liujie_answer 2025-04-15   850  	SXE_REG_WRITE(hw, SXE_EIMS, value);
dd013ad487534c liujie_answer 2025-04-15   851  }
dd013ad487534c liujie_answer 2025-04-15   852  
dd013ad487534c liujie_answer 2025-04-15   853  static u32 sxe_hw_spp_state_get(struct sxe_hw *hw)
dd013ad487534c liujie_answer 2025-04-15   854  {
dd013ad487534c liujie_answer 2025-04-15   855  	return SXE_REG_READ(hw, SXE_SPP_STATE);
dd013ad487534c liujie_answer 2025-04-15   856  }
dd013ad487534c liujie_answer 2025-04-15   857  
dd013ad487534c liujie_answer 2025-04-15   858  static void sxe_hw_rx_los_disable(struct sxe_hw *hw)
dd013ad487534c liujie_answer 2025-04-15   859  {
dd013ad487534c liujie_answer 2025-04-15   860  	u32 value;
dd013ad487534c liujie_answer 2025-04-15   861  
dd013ad487534c liujie_answer 2025-04-15   862  	value = SXE_REG_READ(hw, SXE_EIMS);
dd013ad487534c liujie_answer 2025-04-15   863  	value &= ~SXE_EIMS_GPI_SPP1;
dd013ad487534c liujie_answer 2025-04-15   864  	SXE_REG_WRITE(hw, SXE_EIMS, value);
dd013ad487534c liujie_answer 2025-04-15   865  }
dd013ad487534c liujie_answer 2025-04-15   866  
dd013ad487534c liujie_answer 2025-04-15   867  static void sxe_hw_rx_los_enable(struct sxe_hw *hw)
dd013ad487534c liujie_answer 2025-04-15   868  {
dd013ad487534c liujie_answer 2025-04-15   869  	u32 value;
dd013ad487534c liujie_answer 2025-04-15   870  
dd013ad487534c liujie_answer 2025-04-15   871  	value = SXE_REG_READ(hw, SXE_EIMS);
dd013ad487534c liujie_answer 2025-04-15   872  	value |= SXE_EIMS_GPI_SPP1;
dd013ad487534c liujie_answer 2025-04-15   873  	SXE_REG_WRITE(hw, SXE_EIMS, value);
dd013ad487534c liujie_answer 2025-04-15   874  }
dd013ad487534c liujie_answer 2025-04-15   875  
dd013ad487534c liujie_answer 2025-04-15  @876  void sxe_hw_all_irq_disable(struct sxe_hw *hw)
dd013ad487534c liujie_answer 2025-04-15   877  {
dd013ad487534c liujie_answer 2025-04-15   878  	SXE_REG_WRITE(hw, SXE_EIMC, 0xFFFF0000);
dd013ad487534c liujie_answer 2025-04-15   879  
dd013ad487534c liujie_answer 2025-04-15   880  	SXE_REG_WRITE(hw, SXE_EIMC_EX(0), ~0);
dd013ad487534c liujie_answer 2025-04-15   881  	SXE_REG_WRITE(hw, SXE_EIMC_EX(1), ~0);
dd013ad487534c liujie_answer 2025-04-15   882  
dd013ad487534c liujie_answer 2025-04-15   883  	SXE_WRITE_FLUSH(hw);
dd013ad487534c liujie_answer 2025-04-15   884  }
dd013ad487534c liujie_answer 2025-04-15   885  
dd013ad487534c liujie_answer 2025-04-15   886  static void sxe_hw_spp_configure(struct sxe_hw *hw, u32 hw_spp_proc_delay_us)
dd013ad487534c liujie_answer 2025-04-15   887  {
dd013ad487534c liujie_answer 2025-04-15   888  	u32 reg = SXE_REG_READ(hw, SXE_SPP_PROC);
dd013ad487534c liujie_answer 2025-04-15   889  
dd013ad487534c liujie_answer 2025-04-15   890  	reg &= ~SXE_SPP_PROC_DELAY_US_MASK;
dd013ad487534c liujie_answer 2025-04-15   891  	reg |= hw_spp_proc_delay_us;
dd013ad487534c liujie_answer 2025-04-15   892  	reg &= SXE_SPP_PROC_SPP2_TRIGGER_MASK;
dd013ad487534c liujie_answer 2025-04-15   893  	reg |= SXE_SPP_PROC_SPP2_TRIGGER;
dd013ad487534c liujie_answer 2025-04-15   894  
dd013ad487534c liujie_answer 2025-04-15   895  	SXE_REG_WRITE(hw, SXE_SPP_PROC, reg);
dd013ad487534c liujie_answer 2025-04-15   896  }
dd013ad487534c liujie_answer 2025-04-15   897  
dd013ad487534c liujie_answer 2025-04-15   898  static s32 sxe_hw_irq_test(struct sxe_hw *hw, u32 *icr, bool shared)
dd013ad487534c liujie_answer 2025-04-15   899  {
dd013ad487534c liujie_answer 2025-04-15   900  	s32 ret = 0;
dd013ad487534c liujie_answer 2025-04-15   901  	u32 i, mask;
dd013ad487534c liujie_answer 2025-04-15   902  	struct sxe_adapter *adapter = hw->adapter;
dd013ad487534c liujie_answer 2025-04-15   903  
dd013ad487534c liujie_answer 2025-04-15   904  	sxe_hw_specific_irq_disable(hw, 0xFFFFFFFF);
dd013ad487534c liujie_answer 2025-04-15   905  	sxe_hw_regs_flush(hw);
dd013ad487534c liujie_answer 2025-04-15   906  	usleep_range(10000, 20000);
dd013ad487534c liujie_answer 2025-04-15   907  
dd013ad487534c liujie_answer 2025-04-15   908  	for (i = 0; i < 10; i++) {
dd013ad487534c liujie_answer 2025-04-15   909  		mask = BIT(i);
dd013ad487534c liujie_answer 2025-04-15   910  		if (!shared) {
dd013ad487534c liujie_answer 2025-04-15   911  			LOG_INFO_BDF("test irq: irq test start\n");
dd013ad487534c liujie_answer 2025-04-15   912  			*icr = 0;
dd013ad487534c liujie_answer 2025-04-15   913  			SXE_REG_WRITE(hw, SXE_EIMC, ~mask & 0x00007FFF);
dd013ad487534c liujie_answer 2025-04-15   914  			SXE_REG_WRITE(hw, SXE_EICS, ~mask & 0x00007FFF);
dd013ad487534c liujie_answer 2025-04-15   915  			sxe_hw_regs_flush(hw);
dd013ad487534c liujie_answer 2025-04-15   916  			usleep_range(10000, 20000);
dd013ad487534c liujie_answer 2025-04-15   917  
dd013ad487534c liujie_answer 2025-04-15   918  			if (*icr & mask) {
dd013ad487534c liujie_answer 2025-04-15   919  				LOG_ERROR_BDF("test irq: failed, eicr = %x\n", *icr);
dd013ad487534c liujie_answer 2025-04-15   920  				ret = -SXE_DIAG_DISABLE_IRQ_TEST_ERR;
dd013ad487534c liujie_answer 2025-04-15   921  				break;
dd013ad487534c liujie_answer 2025-04-15   922  			}
dd013ad487534c liujie_answer 2025-04-15   923  			LOG_INFO_BDF("test irq: irq test end\n");
dd013ad487534c liujie_answer 2025-04-15   924  		}
dd013ad487534c liujie_answer 2025-04-15   925  
dd013ad487534c liujie_answer 2025-04-15   926  		LOG_INFO_BDF("test irq: mask irq test start\n");
dd013ad487534c liujie_answer 2025-04-15   927  		*icr = 0;
dd013ad487534c liujie_answer 2025-04-15   928  		SXE_REG_WRITE(hw, SXE_EIMS, mask);
dd013ad487534c liujie_answer 2025-04-15   929  		SXE_REG_WRITE(hw, SXE_EICS, mask);
dd013ad487534c liujie_answer 2025-04-15   930  		sxe_hw_regs_flush(hw);
dd013ad487534c liujie_answer 2025-04-15   931  		usleep_range(10000, 20000);
dd013ad487534c liujie_answer 2025-04-15   932  
dd013ad487534c liujie_answer 2025-04-15   933  		if (!(*icr & mask)) {
dd013ad487534c liujie_answer 2025-04-15   934  			LOG_ERROR_BDF("test irq: mask failed, eicr = %x\n", *icr);
dd013ad487534c liujie_answer 2025-04-15   935  			ret = -SXE_DIAG_ENABLE_IRQ_TEST_ERR;
dd013ad487534c liujie_answer 2025-04-15   936  			break;
dd013ad487534c liujie_answer 2025-04-15   937  		}
dd013ad487534c liujie_answer 2025-04-15   938  		LOG_INFO_BDF("test irq: mask irq test end\n");
dd013ad487534c liujie_answer 2025-04-15   939  
dd013ad487534c liujie_answer 2025-04-15   940  		sxe_hw_specific_irq_disable(hw, mask);
dd013ad487534c liujie_answer 2025-04-15   941  		sxe_hw_regs_flush(hw);
dd013ad487534c liujie_answer 2025-04-15   942  		usleep_range(10000, 20000);
dd013ad487534c liujie_answer 2025-04-15   943  
dd013ad487534c liujie_answer 2025-04-15   944  		if (!shared) {
dd013ad487534c liujie_answer 2025-04-15   945  			LOG_INFO_BDF("test irq: other irq test start\n");
dd013ad487534c liujie_answer 2025-04-15   946  			*icr = 0;
dd013ad487534c liujie_answer 2025-04-15   947  			SXE_REG_WRITE(hw, SXE_EIMC, ~mask & 0x00007FFF);
dd013ad487534c liujie_answer 2025-04-15   948  			SXE_REG_WRITE(hw, SXE_EICS, ~mask & 0x00007FFF);
dd013ad487534c liujie_answer 2025-04-15   949  			sxe_hw_regs_flush(hw);
dd013ad487534c liujie_answer 2025-04-15   950  			usleep_range(10000, 20000);
dd013ad487534c liujie_answer 2025-04-15   951  
dd013ad487534c liujie_answer 2025-04-15   952  			if (*icr) {
dd013ad487534c liujie_answer 2025-04-15   953  				LOG_ERROR_BDF("test irq: other irq failed, eicr = %x\n", *icr);
dd013ad487534c liujie_answer 2025-04-15   954  				ret = -SXE_DIAG_DISABLE_OTHER_IRQ_TEST_ERR;
dd013ad487534c liujie_answer 2025-04-15   955  				break;
dd013ad487534c liujie_answer 2025-04-15   956  			}
dd013ad487534c liujie_answer 2025-04-15   957  			LOG_INFO_BDF("test irq: other irq test end\n");
dd013ad487534c liujie_answer 2025-04-15   958  		}
dd013ad487534c liujie_answer 2025-04-15   959  	}
dd013ad487534c liujie_answer 2025-04-15   960  
dd013ad487534c liujie_answer 2025-04-15   961  	sxe_hw_specific_irq_disable(hw, 0xFFFFFFFF);
dd013ad487534c liujie_answer 2025-04-15   962  	sxe_hw_regs_flush(hw);
dd013ad487534c liujie_answer 2025-04-15   963  	usleep_range(10000, 20000);
dd013ad487534c liujie_answer 2025-04-15   964  
dd013ad487534c liujie_answer 2025-04-15   965  	return ret;
dd013ad487534c liujie_answer 2025-04-15   966  }
dd013ad487534c liujie_answer 2025-04-15   967  
dd013ad487534c liujie_answer 2025-04-15   968  static const struct sxe_irq_operations sxe_irq_ops = {
dd013ad487534c liujie_answer 2025-04-15   969  	.event_irq_auto_clear_set = sxe_hw_event_irq_auto_clear_set,
dd013ad487534c liujie_answer 2025-04-15   970  	.ring_irq_interval_set = sxe_hw_ring_irq_interval_set,
dd013ad487534c liujie_answer 2025-04-15   971  	.event_irq_interval_set = sxe_hw_event_irq_interval_set,
dd013ad487534c liujie_answer 2025-04-15   972  	.set_eitrsel = sxe_hw_set_eitrsel,
dd013ad487534c liujie_answer 2025-04-15   973  	.ring_irq_map = sxe_hw_ring_irq_map,
dd013ad487534c liujie_answer 2025-04-15   974  	.event_irq_map = sxe_hw_event_irq_map,
dd013ad487534c liujie_answer 2025-04-15   975  	.irq_general_reg_set = sxe_hw_irq_general_reg_set,
dd013ad487534c liujie_answer 2025-04-15   976  	.irq_general_reg_get = sxe_hw_irq_general_reg_get,
dd013ad487534c liujie_answer 2025-04-15   977  	.ring_irq_auto_disable = sxe_hw_ring_irq_auto_disable,
dd013ad487534c liujie_answer 2025-04-15   978  	.pending_irq_read_clear = sxe_hw_pending_irq_read_clear,
dd013ad487534c liujie_answer 2025-04-15   979  	.pending_irq_write_clear = sxe_hw_pending_irq_write_clear,
dd013ad487534c liujie_answer 2025-04-15   980  	.ring_irq_enable = sxe_hw_ring_irq_enable,
dd013ad487534c liujie_answer 2025-04-15   981  	.irq_cause_get = sxe_hw_irq_cause_get,
dd013ad487534c liujie_answer 2025-04-15   982  	.event_irq_trigger = sxe_hw_event_irq_trigger,
dd013ad487534c liujie_answer 2025-04-15   983  	.ring_irq_trigger = sxe_hw_ring_irq_trigger,
dd013ad487534c liujie_answer 2025-04-15   984  	.specific_irq_disable = sxe_hw_specific_irq_disable,
dd013ad487534c liujie_answer 2025-04-15   985  	.specific_irq_enable = sxe_hw_specific_irq_enable,
dd013ad487534c liujie_answer 2025-04-15   986  	.spp_state_get = sxe_hw_spp_state_get,
dd013ad487534c liujie_answer 2025-04-15   987  	.rx_los_disable = sxe_hw_rx_los_disable,
dd013ad487534c liujie_answer 2025-04-15   988  	.rx_los_enable = sxe_hw_rx_los_enable,
dd013ad487534c liujie_answer 2025-04-15   989  	.all_irq_disable = sxe_hw_all_irq_disable,
dd013ad487534c liujie_answer 2025-04-15   990  	.spp_configure = sxe_hw_spp_configure,
dd013ad487534c liujie_answer 2025-04-15   991  	.irq_test = sxe_hw_irq_test,
dd013ad487534c liujie_answer 2025-04-15   992  };
dd013ad487534c liujie_answer 2025-04-15   993  
dd013ad487534c liujie_answer 2025-04-15  @994  u32 sxe_hw_link_speed_get(struct sxe_hw *hw)
dd013ad487534c liujie_answer 2025-04-15   995  {
dd013ad487534c liujie_answer 2025-04-15   996  	u32 speed, value;
dd013ad487534c liujie_answer 2025-04-15   997  	struct sxe_adapter *adapter = hw->adapter;
dd013ad487534c liujie_answer 2025-04-15   998  
dd013ad487534c liujie_answer 2025-04-15   999  	value = SXE_REG_READ(hw, SXE_COMCTRL);
dd013ad487534c liujie_answer 2025-04-15  1000  
dd013ad487534c liujie_answer 2025-04-15  1001  	if ((value & SXE_COMCTRL_SPEED_10G) == SXE_COMCTRL_SPEED_10G)
dd013ad487534c liujie_answer 2025-04-15  1002  		speed = SXE_LINK_SPEED_10GB_FULL;
dd013ad487534c liujie_answer 2025-04-15  1003  	else if ((value & SXE_COMCTRL_SPEED_1G) == SXE_COMCTRL_SPEED_1G)
dd013ad487534c liujie_answer 2025-04-15  1004  		speed = SXE_LINK_SPEED_1GB_FULL;
dd013ad487534c liujie_answer 2025-04-15  1005  	else
dd013ad487534c liujie_answer 2025-04-15  1006  		speed = SXE_LINK_SPEED_UNKNOWN;
dd013ad487534c liujie_answer 2025-04-15  1007  
dd013ad487534c liujie_answer 2025-04-15  1008  	LOG_DEBUG_BDF("hw link speed=%x, (0x80=10G, 0x20=1G)\n, reg=%x",
dd013ad487534c liujie_answer 2025-04-15  1009  		      speed, value);
dd013ad487534c liujie_answer 2025-04-15  1010  
dd013ad487534c liujie_answer 2025-04-15  1011  	return speed;
dd013ad487534c liujie_answer 2025-04-15  1012  }
dd013ad487534c liujie_answer 2025-04-15  1013  

:::::: The code at line 843 was first introduced by commit
:::::: dd013ad487534c1838afc2f55efdb5daec15aace Ethernet: Linkdata: Supports Linkdata ethernet Controllers

:::::: TO: liujie_answer <liujie5@linkdatatechnology.com>
:::::: CC: liujie_answer <liujie5@linkdatatechnology.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
