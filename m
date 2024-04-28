Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D96F524AD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714292789; cv=none; b=HFmHGjR7iWZqJz4LtX5tZSfHvBPfZ7b0tq9qo1sUde5mL/r0Et21j7Q/OvJOrxuaZwVmgWFjTCPq/W168zD4XWj1dwVWHVqXcz6nLzECPOUfFAUZS5tIlQtfk9UdpLESZyPKvpPRnHD371Z22D2VIZz9EMAWQjTkCuEi+E1/yJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714292789; c=relaxed/simple;
	bh=MH3rSiKJPDM9hOXLfPSXyG/vC4XcGtA3qA7+6cufGKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tjo/mZp4WtuXXh/O2eABl4F7wYDRC4Obb2o5bxWwDd/BMEKyZ9GS6c2ZGbr9EaBlXBe68zTJ0KUvTqdK4ruuU4GCzl+PbeAunTZyN8vm/fhAcBzKZHDqn96PS7P1i7NoHzFmAKhYpbtsCytezOzVs+8eRCmfFIxASMHcj8/Zajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkIzxCzT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkIzxCzT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714292786; x=1745828786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MH3rSiKJPDM9hOXLfPSXyG/vC4XcGtA3qA7+6cufGKo=;
  b=YkIzxCzToC06ge90dbhnc/ixWoMgYPQx0TJmDx9GioBcU9CFjO5advo0
   jtttszb7kuAXu36daYQdcaNPBLDjqf/End1LYRJBzYrui73IjMlfwKcJ/
   U3GG7obIK+hfwtALyQqREnn0/Y5cGSnmaDDNijnlJ3H6RwmG9KRvIB9mF
   ngmmcX/TH+FQCrXgNF2k9geV5Yaj+R5Gu0qMACcDyaeia73aQz3KMsZDH
   C2bNhIkmfdiBCrS8nYFxeb4VVUQmX9TbJrN6/Cc4merR4fc/IgReJicX2
   RL+l0atg2A8HUor5BBS2WdjYHZ852ybycmziYMAOxBHIBS/W9otdymfxf
   A==;
X-CSE-ConnectionGUID: ZttodYtCQOuRHjrXHJ79QQ==
X-CSE-MsgGUID: 2XPJYvxZTcGWAX/3H3htsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9856398"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="9856398"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 01:26:23 -0700
X-CSE-ConnectionGUID: Ke7VKm0oR+qpyzQXcoeKVg==
X-CSE-MsgGUID: hDXETAcQQ1qwz+/VIU8vDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="30629902"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Apr 2024 01:26:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0zrW-00060m-2T;
	Sun, 28 Apr 2024 08:26:18 +0000
Date: Sun, 28 Apr 2024 16:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7547/7556]
 drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:860: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202404281612.QppNPnCk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6773f12aed5e797a2c93fd0f7632568554503971
commit: 4213ff7957de370c1cfe528c2bad1eb2e499038a [7547/7556] net/ethernet/huawei/hinic3: Add the CQM on which the RDMA depends
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240428/202404281612.QppNPnCk-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281612.QppNPnCk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281612.QppNPnCk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_hw_cfg.c:1097: warning: expecting prototype for hinic_set_vf_dev_cap(). Prototype was for hinic3_init_vf_dev_cap() instead
--
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:863:5: warning: no previous prototype for function 'hinic3_global_func_id_hw' [-Wmissing-prototypes]
     863 | u16 hinic3_global_func_id_hw(void *hwdev)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:863:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     863 | u16 hinic3_global_func_id_hw(void *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:880:5: warning: no previous prototype for function 'hinic3_global_func_id_get' [-Wmissing-prototypes]
     880 | int hinic3_global_func_id_get(void *hwdev, u16 *func_id)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:880:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     880 | int hinic3_global_func_id_get(void *hwdev, u16 *func_id)
         | ^
         | static 
   2 warnings generated.
--
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:312: warning: Function parameter or member 'attr6' not described in 'set_hwif_attr'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:773: warning: Function parameter or member 'hwdev' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:773: warning: Function parameter or member 'cfg_reg_base' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:773: warning: Function parameter or member 'intr_reg_base' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:773: warning: Function parameter or member 'mgmt_regs_base' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:773: warning: Function parameter or member 'db_base_phy' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:773: warning: Function parameter or member 'db_base' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:773: warning: Function parameter or member 'db_dwqe_len' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:773: warning: Excess function parameter 'hwif' description in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:773: warning: Excess function parameter 'pdev' description in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:839: warning: Function parameter or member 'hwdev' not described in 'hinic3_free_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:839: warning: Excess function parameter 'hwif' description in 'hinic3_free_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:839: warning: Excess function parameter 'pdev' description in 'hinic3_free_hwif'
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:860: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * get function id from register,used by sriov hot migration process
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:876: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * get function id, used by sriov hot migratition process.
--
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:46:6: warning: no previous prototype for function 'hinic3_get_master_host_mbox_enable' [-Wmissing-prototypes]
      46 | bool hinic3_get_master_host_mbox_enable(void *hwdev)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      46 | bool hinic3_get_master_host_mbox_enable(void *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:148:5: warning: no previous prototype for function '__mbox_to_host' [-Wmissing-prototypes]
     148 | int __mbox_to_host(struct hinic3_hwdev *hwdev, enum hinic3_mod_type mod,
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     148 | int __mbox_to_host(struct hinic3_hwdev *hwdev, enum hinic3_mod_type mod,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:547:5: warning: no previous prototype for function 'sw_func_ppf_mbox_handler' [-Wmissing-prototypes]
     547 | int sw_func_ppf_mbox_handler(void *handle, u16 pf_idx, u16 vf_id, u16 cmd,
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:547:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     547 | int sw_func_ppf_mbox_handler(void *handle, u16 pf_idx, u16 vf_id, u16 cmd,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:570:5: warning: no previous prototype for function '__ppf_process_mbox_msg' [-Wmissing-prototypes]
     570 | int __ppf_process_mbox_msg(struct hinic3_hwdev *hwdev, u16 pf_idx, u16 vf_id,
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:570:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     570 | int __ppf_process_mbox_msg(struct hinic3_hwdev *hwdev, u16 pf_idx, u16 vf_id,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:599:5: warning: no previous prototype for function 'hinic3_ppf_process_mbox_msg' [-Wmissing-prototypes]
     599 | int hinic3_ppf_process_mbox_msg(struct hinic3_hwdev *hwdev, u16 pf_idx, u16 vf_id,
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:599:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     599 | int hinic3_ppf_process_mbox_msg(struct hinic3_hwdev *hwdev, u16 pf_idx, u16 vf_id,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:643:5: warning: no previous prototype for function 'comm_ppf_mbox_handler' [-Wmissing-prototypes]
     643 | int comm_ppf_mbox_handler(void *handle, u16 pf_idx, u16 vf_id, u16 cmd,
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:643:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     643 | int comm_ppf_mbox_handler(void *handle, u16 pf_idx, u16 vf_id, u16 cmd,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:652:5: warning: no previous prototype for function 'hilink_ppf_mbox_handler' [-Wmissing-prototypes]
     652 | int hilink_ppf_mbox_handler(void *handle, u16 pf_idx, u16 vf_id, u16 cmd,
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:652:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     652 | int hilink_ppf_mbox_handler(void *handle, u16 pf_idx, u16 vf_id, u16 cmd,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:661:5: warning: no previous prototype for function 'hinic3_nic_ppf_mbox_handler' [-Wmissing-prototypes]
     661 | int hinic3_nic_ppf_mbox_handler(void *handle, u16 pf_idx, u16 vf_id, u16 cmd,
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:661:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     661 | int hinic3_nic_ppf_mbox_handler(void *handle, u16 pf_idx, u16 vf_id, u16 cmd,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:670:5: warning: no previous prototype for function 'hinic3_register_slave_ppf' [-Wmissing-prototypes]
     670 | int hinic3_register_slave_ppf(struct hinic3_hwdev *hwdev, bool registered)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:670:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     670 | int hinic3_register_slave_ppf(struct hinic3_hwdev *hwdev, bool registered)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:743:5: warning: no previous prototype for function 'set_slave_func_nic_state' [-Wmissing-prototypes]
     743 | int set_slave_func_nic_state(struct hinic3_hwdev *hwdev,
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:743:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     743 | int set_slave_func_nic_state(struct hinic3_hwdev *hwdev,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:776:5: warning: no previous prototype for function 'get_slave_func_netdev_state' [-Wmissing-prototypes]
     776 | int get_slave_func_netdev_state(struct hinic3_hwdev *hwdev, u16 func_idx,
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:776:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     776 | int get_slave_func_netdev_state(struct hinic3_hwdev *hwdev, u16 func_idx,
         | ^
         | static 
   11 warnings generated.
--
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:30:25: warning: no previous prototype for function 'cqm3_cmd_alloc' [-Wmissing-prototypes]
      30 | struct tag_cqm_cmd_buf *cqm_cmd_alloc(void *ex_handle)
         |                         ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:13:44: note: expanded from macro 'cqm_cmd_alloc'
      13 | #define cqm_cmd_alloc                      cqm3_cmd_alloc
         |                                            ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | struct tag_cqm_cmd_buf *cqm_cmd_alloc(void *ex_handle)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:55:6: warning: no previous prototype for function 'cqm3_cmd_free' [-Wmissing-prototypes]
      55 | void cqm_cmd_free(void *ex_handle, struct tag_cqm_cmd_buf *cmd_buf)
         |      ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:15:44: note: expanded from macro 'cqm_cmd_free'
      15 | #define cqm_cmd_free                       cqm3_cmd_free
         |                                            ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      55 | void cqm_cmd_free(void *ex_handle, struct tag_cqm_cmd_buf *cmd_buf)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:95:5: warning: no previous prototype for function 'cqm3_send_cmd_box' [-Wmissing-prototypes]
      95 | s32 cqm_send_cmd_box(void *ex_handle, u8 mod, u8 cmd, struct tag_cqm_cmd_buf *buf_in,
         |     ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:16:44: note: expanded from macro 'cqm_send_cmd_box'
      16 | #define cqm_send_cmd_box                   cqm3_send_cmd_box
         |                                            ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | s32 cqm_send_cmd_box(void *ex_handle, u8 mod, u8 cmd, struct tag_cqm_cmd_buf *buf_in,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:141:5: warning: no previous prototype for function 'cqm3_lb_send_cmd_box' [-Wmissing-prototypes]
     141 | s32 cqm_lb_send_cmd_box(void *ex_handle, u8 mod, u8 cmd, u8 cos_id,
         |     ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:17:44: note: expanded from macro 'cqm_lb_send_cmd_box'
      17 | #define cqm_lb_send_cmd_box                cqm3_lb_send_cmd_box
         |                                            ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:141:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     141 | s32 cqm_lb_send_cmd_box(void *ex_handle, u8 mod, u8 cmd, u8 cos_id,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:184:5: warning: no previous prototype for function 'cqm3_lb_send_cmd_box_async' [-Wmissing-prototypes]
     184 | s32 cqm_lb_send_cmd_box_async(void *ex_handle, u8 mod, u8 cmd,
         |     ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:18:44: note: expanded from macro 'cqm_lb_send_cmd_box_async'
      18 | #define cqm_lb_send_cmd_box_async          cqm3_lb_send_cmd_box_async
         |                                            ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:184:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     184 | s32 cqm_lb_send_cmd_box_async(void *ex_handle, u8 mod, u8 cmd,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:226:5: warning: no previous prototype for function 'cqm3_send_cmd_imm' [-Wmissing-prototypes]
     226 | s32 cqm_send_cmd_imm(void *ex_handle, u8 mod, u8 cmd, struct tag_cqm_cmd_buf *buf_in,
         |     ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:19:44: note: expanded from macro 'cqm_send_cmd_imm'
      19 | #define cqm_send_cmd_imm                   cqm3_send_cmd_imm
         |                                            ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     226 | s32 cqm_send_cmd_imm(void *ex_handle, u8 mod, u8 cmd, struct tag_cqm_cmd_buf *buf_in,
         | ^
         | static 
   6 warnings generated.
--
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_db.c:75:6: warning: no previous prototype for function 'cqm3_db_addr_free' [-Wmissing-prototypes]
      75 | void cqm_db_addr_free(void *ex_handle, const void __iomem *db_addr,
         |      ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:21:44: note: expanded from macro 'cqm_db_addr_free'
      21 | #define cqm_db_addr_free                   cqm3_db_addr_free
         |                                            ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_db.c:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      75 | void cqm_db_addr_free(void *ex_handle, const void __iomem *db_addr,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_db.c:233:5: warning: no previous prototype for function 'cqm3_get_hardware_db_addr' [-Wmissing-prototypes]
     233 | s32 cqm_get_hardware_db_addr(void *ex_handle, u64 *addr,
         |     ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:14:44: note: expanded from macro 'cqm_get_hardware_db_addr'
      14 | #define cqm_get_hardware_db_addr           cqm3_get_hardware_db_addr
         |                                            ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_db.c:233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     233 | s32 cqm_get_hardware_db_addr(void *ex_handle, u64 *addr,
         | ^
         | static 
   2 warnings generated.
--
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object.c:1604:5: warning: no previous prototype for function 'cqm3_dtoe_share_recv_queue_create' [-Wmissing-prototypes]
    1604 | s32 cqm_dtoe_share_recv_queue_create(void *ex_handle, u32 contex_size,
         |     ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:47:44: note: expanded from macro 'cqm_dtoe_share_recv_queue_create'
      47 | #define cqm_dtoe_share_recv_queue_create   cqm3_dtoe_share_recv_queue_create
         |                                            ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object.c:1604:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1604 | s32 cqm_dtoe_share_recv_queue_create(void *ex_handle, u32 contex_size,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object.c:1649:6: warning: no previous prototype for function 'cqm3_dtoe_free_srq_bitmap_index' [-Wmissing-prototypes]
    1649 | void cqm_dtoe_free_srq_bitmap_index(void *ex_handle, u32 index_count, u32 index)
         |      ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:46:44: note: expanded from macro 'cqm_dtoe_free_srq_bitmap_index'
      46 | #define cqm_dtoe_free_srq_bitmap_index     cqm3_dtoe_free_srq_bitmap_index
         |                                            ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object.c:1649:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1649 | void cqm_dtoe_free_srq_bitmap_index(void *ex_handle, u32 index_count, u32 index)
         | ^
         | static 
   2 warnings generated.
--
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:35: warning: Function parameter or member 'cqm_handle' not described in 'bloomfilter_init_cmd'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:35: warning: expecting prototype for Prototype(). Prototype was for bloomfilter_init_cmd() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:207: warning: Function parameter or member 'ex_handle' not described in 'cqm_bloomfilter_init'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:207: warning: expecting prototype for Prototype(). Prototype was for cqm_bloomfilter_init() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:242: warning: Function parameter or member 'ex_handle' not described in 'cqm_bloomfilter_uninit'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:242: warning: expecting prototype for Prototype(). Prototype was for cqm_bloomfilter_uninit() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:265: warning: Function parameter or member 'ex_handle' not described in 'cqm_bloomfilter_cmd'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:265: warning: Function parameter or member 'func_id' not described in 'cqm_bloomfilter_cmd'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:265: warning: Function parameter or member 'op' not described in 'cqm_bloomfilter_cmd'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:265: warning: Function parameter or member 'k_flag' not described in 'cqm_bloomfilter_cmd'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:265: warning: Function parameter or member 'id' not described in 'cqm_bloomfilter_cmd'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:265: warning: expecting prototype for Prototype(). Prototype was for cqm_bloomfilter_cmd() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:363: warning: Function parameter or member 'ex_handle' not described in 'cqm_bloomfilter_inc'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:363: warning: Function parameter or member 'func_id' not described in 'cqm_bloomfilter_inc'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:363: warning: Function parameter or member 'id' not described in 'cqm_bloomfilter_inc'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:363: warning: expecting prototype for Prototype(). Prototype was for cqm_bloomfilter_inc() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:460: warning: Function parameter or member 'ex_handle' not described in 'cqm_bloomfilter_dec'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:460: warning: Function parameter or member 'func_id' not described in 'cqm_bloomfilter_dec'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:460: warning: Function parameter or member 'id' not described in 'cqm_bloomfilter_dec'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bloomfilter.c:460: warning: expecting prototype for Prototype(). Prototype was for cqm_bloomfilter_dec() instead
--
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:31: warning: Function parameter or member 'ex_handle' not described in 'cqm_cmd_alloc'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:31: warning: expecting prototype for Prototype(). Prototype was for cqm_cmd_alloc() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:56: warning: Function parameter or member 'ex_handle' not described in 'cqm_cmd_free'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:56: warning: Function parameter or member 'cmd_buf' not described in 'cqm_cmd_free'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:56: warning: expecting prototype for Prototype(). Prototype was for cqm_cmd_free() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:98: warning: Function parameter or member 'ex_handle' not described in 'cqm_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:98: warning: Function parameter or member 'mod' not described in 'cqm_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:98: warning: Function parameter or member 'cmd' not described in 'cqm_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:98: warning: Function parameter or member 'buf_in' not described in 'cqm_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:98: warning: Function parameter or member 'buf_out' not described in 'cqm_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:98: warning: Function parameter or member 'out_param' not described in 'cqm_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:98: warning: Function parameter or member 'timeout' not described in 'cqm_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:98: warning: Function parameter or member 'channel' not described in 'cqm_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:98: warning: expecting prototype for Prototype(). Prototype was for cqm_send_cmd_box() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:144: warning: Function parameter or member 'ex_handle' not described in 'cqm_lb_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:144: warning: Function parameter or member 'mod' not described in 'cqm_lb_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:144: warning: Function parameter or member 'cmd' not described in 'cqm_lb_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:144: warning: Function parameter or member 'cos_id' not described in 'cqm_lb_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:144: warning: Function parameter or member 'buf_in' not described in 'cqm_lb_send_cmd_box'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:144: warning: Function parameter or member 'buf_out' not described in 'cqm_lb_send_cmd_box'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:144: warning: Function parameter or member 'out_param' not described in 'cqm_lb_send_cmd_box'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:144: warning: Function parameter or member 'timeout' not described in 'cqm_lb_send_cmd_box'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:144: warning: Function parameter or member 'channel' not described in 'cqm_lb_send_cmd_box'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:144: warning: expecting prototype for Prototype(). Prototype was for cqm_lb_send_cmd_box() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:187: warning: Function parameter or member 'ex_handle' not described in 'cqm_lb_send_cmd_box_async'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:187: warning: Function parameter or member 'mod' not described in 'cqm_lb_send_cmd_box_async'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:187: warning: Function parameter or member 'cmd' not described in 'cqm_lb_send_cmd_box_async'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:187: warning: Function parameter or member 'cos_id' not described in 'cqm_lb_send_cmd_box_async'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:187: warning: Function parameter or member 'buf_in' not described in 'cqm_lb_send_cmd_box_async'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:187: warning: Function parameter or member 'channel' not described in 'cqm_lb_send_cmd_box_async'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:187: warning: expecting prototype for Prototype(). Prototype was for cqm_lb_send_cmd_box_async() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:228: warning: Function parameter or member 'ex_handle' not described in 'cqm_send_cmd_imm'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:228: warning: Function parameter or member 'mod' not described in 'cqm_send_cmd_imm'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:228: warning: Function parameter or member 'cmd' not described in 'cqm_send_cmd_imm'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:228: warning: Function parameter or member 'buf_in' not described in 'cqm_send_cmd_imm'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:228: warning: Function parameter or member 'out_param' not described in 'cqm_send_cmd_imm'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:228: warning: Function parameter or member 'timeout' not described in 'cqm_send_cmd_imm'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:228: warning: Function parameter or member 'channel' not described in 'cqm_send_cmd_imm'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:228: warning: expecting prototype for Prototype(). Prototype was for cqm_send_cmd_imm() instead
--
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:44: warning: Function parameter or member 'srq_head_container' not described in 'cqm_container_free'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:44: warning: Function parameter or member 'srq_tail_container' not described in 'cqm_container_free'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:44: warning: Function parameter or member 'common' not described in 'cqm_container_free'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:44: warning: expecting prototype for Prototype(). Prototype was for cqm_container_free() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:126: warning: Function parameter or member 'object' not described in 'cqm_container_create'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:126: warning: Function parameter or member 'container_addr' not described in 'cqm_container_create'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:126: warning: Function parameter or member 'link' not described in 'cqm_container_create'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:126: warning: expecting prototype for Prototype(). Prototype was for cqm_container_create() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:228: warning: Function parameter or member 'object' not described in 'cqm_srq_container_init'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:228: warning: expecting prototype for Prototype(). Prototype was for cqm_srq_container_init() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:280: warning: Function parameter or member 'object' not described in 'cqm_share_recv_queue_create'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:280: warning: expecting prototype for Prototype(). Prototype was for cqm_share_recv_queue_create() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:348: warning: Function parameter or member 'object' not described in 'cqm_srq_used_rq_delete'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:348: warning: expecting prototype for Prototype(). Prototype was for cqm_srq_used_rq_delete() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:408: warning: Function parameter or member 'object' not described in 'cqm_share_recv_queue_delete'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:408: warning: expecting prototype for Prototype(). Prototype was for cqm_share_recv_queue_delete() instead
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:458: warning: Function parameter or member 'object' not described in 'cqm_qpc_mpt_bitmap_alloc'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:458: warning: Function parameter or member 'cla_table' not described in 'cqm_qpc_mpt_bitmap_alloc'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:458: warning: Function parameter or member 'low2bit_align_en' not described in 'cqm_qpc_mpt_bitmap_alloc'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:458: warning: expecting prototype for Prototype(). Prototype was for cqm_qpc_mpt_bitmap_alloc() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:523: warning: Function parameter or member 'object' not described in 'cqm_qpc_mpt_create'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:523: warning: Function parameter or member 'low2bit_align_en' not described in 'cqm_qpc_mpt_create'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:523: warning: expecting prototype for Prototype(). Prototype was for cqm_qpc_mpt_create() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:622: warning: Function parameter or member 'object' not described in 'cqm_qpc_mpt_delete'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:622: warning: expecting prototype for Prototype(). Prototype was for cqm_qpc_mpt_delete() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:704: warning: Function parameter or member 'buf' not described in 'cqm_linkwqe_fill'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:704: warning: Function parameter or member 'wqe_per_buf' not described in 'cqm_linkwqe_fill'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:704: warning: Function parameter or member 'wqe_size' not described in 'cqm_linkwqe_fill'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:704: warning: Function parameter or member 'wqe_number' not described in 'cqm_linkwqe_fill'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:704: warning: Function parameter or member 'tail' not described in 'cqm_linkwqe_fill'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:704: warning: Function parameter or member 'link_mode' not described in 'cqm_linkwqe_fill'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:704: warning: expecting prototype for Prototype(). Prototype was for cqm_linkwqe_fill() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:889: warning: Function parameter or member 'object' not described in 'cqm_nonrdma_queue_create'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:889: warning: expecting prototype for Prototype(). Prototype was for cqm_nonrdma_queue_create() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:996: warning: Function parameter or member 'object' not described in 'cqm_nonrdma_queue_delete'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:996: warning: expecting prototype for Prototype(). Prototype was for cqm_nonrdma_queue_delete() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:1174: warning: Function parameter or member 'object' not described in 'cqm_rdma_queue_create'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:1174: warning: expecting prototype for Prototype(). Prototype was for cqm_rdma_queue_create() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:1258: warning: Function parameter or member 'object' not described in 'cqm_rdma_queue_delete'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:1258: warning: expecting prototype for Prototype(). Prototype was for cqm_rdma_queue_delete() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:1342: warning: Function parameter or member 'object' not described in 'cqm_rdma_table_create'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:1342: warning: expecting prototype for Prototype(). Prototype was for cqm_rdma_table_create() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:1391: warning: Function parameter or member 'object' not described in 'cqm_rdma_table_delete'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:1391: warning: expecting prototype for Prototype(). Prototype was for cqm_rdma_table_delete() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:1426: warning: Function parameter or member 'object' not described in 'cqm_rdma_table_offset_addr'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:1426: warning: Function parameter or member 'offset' not described in 'cqm_rdma_table_offset_addr'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:1426: warning: Function parameter or member 'paddr' not described in 'cqm_rdma_table_offset_addr'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_object_intern.c:1426: warning: expecting prototype for Prototype(). Prototype was for cqm_rdma_table_offset_addr() instead
..


vim +860 drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c

   763	
   764	/**
   765	 * hinic3_init_hwif - initialize the hw interface
   766	 * @hwif: the hardware interface of a pci function device
   767	 * @pdev: the pci device that will be part of the hwif struct
   768	 * Return: 0 - success, negative - failure
   769	 **/
   770	int hinic3_init_hwif(struct hinic3_hwdev *hwdev, void *cfg_reg_base,
   771			     void *intr_reg_base, void *mgmt_regs_base, u64 db_base_phy,
   772			     void *db_base, u64 db_dwqe_len)
 > 773	{
   774		struct hinic3_hwif *hwif = NULL;
   775		u32 attr1, attr4, attr5;
   776		int err;
   777	
   778		err = init_hwif(hwdev, cfg_reg_base, intr_reg_base, mgmt_regs_base);
   779		if (err)
   780			return err;
   781	
   782		hwif = hwdev->hwif;
   783	
   784		err = init_db_area_idx(hwif, db_base_phy, db_base, db_dwqe_len);
   785		if (err) {
   786			sdk_err(hwdev->dev_hdl, "Failed to init db area.\n");
   787			goto init_db_area_err;
   788		}
   789	
   790		err = wait_hwif_ready(hwdev);
   791		if (err) {
   792			attr1 = hinic3_hwif_read_reg(hwif, HINIC3_CSR_FUNC_ATTR1_ADDR);
   793			sdk_err(hwdev->dev_hdl, "Chip status is not ready, attr1:0x%x\n", attr1);
   794			goto hwif_ready_err;
   795		}
   796	
   797		err = get_hwif_attr(hwif);
   798		if (err) {
   799			sdk_err(hwdev->dev_hdl, "Get hwif attr failed\n");
   800			goto hwif_ready_err;
   801		}
   802	
   803		err = wait_until_doorbell_and_outbound_enabled(hwif);
   804		if (err) {
   805			attr4 = hinic3_hwif_read_reg(hwif, HINIC3_CSR_FUNC_ATTR4_ADDR);
   806			attr5 = hinic3_hwif_read_reg(hwif, HINIC3_CSR_FUNC_ATTR5_ADDR);
   807			sdk_err(hwdev->dev_hdl, "Hw doorbell/outbound is disabled, attr4 0x%x attr5 0x%x\n",
   808				attr4, attr5);
   809			goto hwif_ready_err;
   810		}
   811	
   812		select_ppf_mpf(hwdev);
   813	
   814		disable_all_msix(hwdev);
   815		/* disable mgmt cpu report any event */
   816		hinic3_set_pf_status(hwdev->hwif, HINIC3_PF_STATUS_INIT);
   817	
   818		sdk_info(hwdev->dev_hdl, "global_func_idx: %u, func_type: %d, host_id: %u, ppf: %u, mpf: %u\n",
   819			 hwif->attr.func_global_idx, hwif->attr.func_type, hwif->attr.pci_intf_idx,
   820			 hwif->attr.ppf_idx, hwif->attr.mpf_idx);
   821	
   822		return 0;
   823	
   824	hwif_ready_err:
   825		hinic3_show_chip_err_info(hwdev);
   826		free_db_area(&hwif->free_db_area);
   827	init_db_area_err:
   828		kfree(hwif);
   829	
   830		return err;
   831	}
   832	
   833	/**
   834	 * hinic3_free_hwif - free the hw interface
   835	 * @hwif: the hardware interface of a pci function device
   836	 * @pdev: the pci device that will be part of the hwif struct
   837	 **/
   838	void hinic3_free_hwif(struct hinic3_hwdev *hwdev)
   839	{
   840		spin_lock_deinit(&hwdev->hwif->free_db_area.idx_lock);
   841		free_db_area(&hwdev->hwif->free_db_area);
   842		enable_all_msix(hwdev);
   843		kfree(hwdev->hwif);
   844	}
   845	
   846	u16 hinic3_global_func_id(void *hwdev)
   847	{
   848		struct hinic3_hwif *hwif = NULL;
   849	
   850		if (!hwdev)
   851			return 0;
   852	
   853		hwif = ((struct hinic3_hwdev *)hwdev)->hwif;
   854	
   855		return hwif->attr.func_global_idx;
   856	}
   857	EXPORT_SYMBOL(hinic3_global_func_id);
   858	
   859	/**
 > 860	 * get function id from register,used by sriov hot migration process
   861	 * @hwdev: the pointer to hw device
   862	 */
 > 863	u16 hinic3_global_func_id_hw(void *hwdev)
   864	{
   865		u32 addr, attr0;
   866		struct hinic3_hwdev *dev;
   867	
   868		dev = (struct hinic3_hwdev *)hwdev;
   869		addr = HINIC3_CSR_FUNC_ATTR0_ADDR;
   870		attr0 = hinic3_hwif_read_reg(dev->hwif, addr);
   871	
   872		return HINIC3_AF0_GET(attr0, FUNC_GLOBAL_IDX);
   873	}
   874	
   875	/**
   876	 * get function id, used by sriov hot migratition process.
   877	 * @hwdev: the pointer to hw device
   878	 * @func_id: function id
   879	 */
 > 880	int hinic3_global_func_id_get(void *hwdev, u16 *func_id)
   881	{
   882		struct hinic3_hwdev *dev = (struct hinic3_hwdev *)hwdev;
   883	
   884		if (!hwdev || !func_id)
   885			return -EINVAL;
   886	
   887		/* only vf get func_id from chip reg for sriov migrate */
   888		if (!HINIC3_IS_VF(dev)) {
   889			*func_id = hinic3_global_func_id(hwdev);
   890			return 0;
   891		}
   892	
   893		*func_id = hinic3_global_func_id_hw(dev);
   894		return 0;
   895	}
   896	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
