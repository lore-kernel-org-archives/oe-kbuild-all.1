Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA0522AE7E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215592; cv=none; b=f2w6KF6/fng7OzbuSDoC0YySdoU9LX7i5KBljEU08nWmmPyfTzWPyX4oMHsGoL2ZW6bv0KmfwzyLU8n6cqMPWId4+fzWkKga3Q990mlgrZjDS8nPF2W0d9p3qLfVxWMg4OkHKIFTWsQxEbHVWNd3sJdPEMqUeG9dvxjyV6i1Sog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215592; c=relaxed/simple;
	bh=RDsyyLLA85kOrRXsC60U1HBqMlKT7bJIP89mWT7Dr9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T8/GMoqD3oA+hK85WIDepzGZ0zgTLNv/w9HBoG+zEz4Vf4Qnm18plWo7FkROLOqIbR2SBONjorguSrARY/aINtJgGFWrsFHaD8KGDKCAK4GQ80tzpwh9Qs38WoXwHOVHEiA2a1TVs5d7HnJREC4G/zv+1O83SGt0jSsOw5p+Hyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rp/gFWnq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rp/gFWnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747215590; x=1778751590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RDsyyLLA85kOrRXsC60U1HBqMlKT7bJIP89mWT7Dr9k=;
  b=Rp/gFWnqSXSnv3KE/itWSyDYu2FGI7L4lK4vHDSYoh/O5LVf9FLajovb
   21zrmA4zK5IoU1QOhIeSgs4OfTfi9WtEy/QRYbmWC8mI1/2lL6uDOGoSl
   Wo1dJ2KpGjEg0JhuPisUAG2xvC8E+IsuePPGeonR/xCfQDrcnXe0IpKIk
   JGdrHDKrCbpLh7rMsTm0+jSeeQIDCoCsM8DPRtDU+vH4pxxwoXpjcyfM4
   Bk+0bopARB9BVkV4YOayq/3knTrVCjcTNLSWjVVsNJQi57ExaLO7jp2jI
   VIh/0T5qbe5Jxvj7prb7TVsEfy05c0Xvvae7yL8M6UquCN7bcYyD6fErP
   g==;
X-CSE-ConnectionGUID: AWBXlCddQDSkFTDQxiKMwQ==
X-CSE-MsgGUID: hGcyE0Z4RXG71QFwG6R6aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52910446"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="52910446"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 02:39:40 -0700
X-CSE-ConnectionGUID: eQAqO26RQYeF54yoc+hywQ==
X-CSE-MsgGUID: WsU1Dz5ATyalwL2Ka7Glaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138972624"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 May 2025 02:39:39 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF8aO-00018I-2O;
	Wed, 14 May 2025 09:39:36 +0000
Date: Wed, 14 May 2025 17:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229]
 drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function
 parameter or member 'intr_reg_base' not described in 'hinic_init_hwif'
Message-ID: <202505141758.HmJKRSap-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a53913bacac4876eee9ce118b3101dff842318ef
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [2229/2229] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250514/202505141758.HmJKRSap-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.71.1 (eb26296b5 2023-08-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141758.HmJKRSap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141758.HmJKRSap-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:531:5: warning: no previous prototype for function 'hinic_hiovs_set_cpath_vlan' [-Wmissing-prototypes]
     531 | int hinic_hiovs_set_cpath_vlan(void *hwdev, u16 vlan_id, u16 pf_id)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:531:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     531 | int hinic_hiovs_set_cpath_vlan(void *hwdev, u16 vlan_id, u16 pf_id)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:557:5: warning: no previous prototype for function 'hinic_hiovs_del_cpath_vlan' [-Wmissing-prototypes]
     557 | int hinic_hiovs_del_cpath_vlan(void *hwdev, u16 vlan_id, u16 pf_id)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     557 | int hinic_hiovs_del_cpath_vlan(void *hwdev, u16 vlan_id, u16 pf_id)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:2622:5: warning: no previous prototype for function 'nic_pf_mbox_handler' [-Wmissing-prototypes]
    2622 | int nic_pf_mbox_handler(void *hwdev, u16 vf_id, u8 cmd, void *buf_in,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:2622:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2622 | int nic_pf_mbox_handler(void *hwdev, u16 vf_id, u8 cmd, void *buf_in,
         | ^
         | static 
   3 warnings generated.
--
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:362:6: warning: no previous prototype for function 'hinic_qp_prepare_cmdq_header' [-Wmissing-prototypes]
     362 | void hinic_qp_prepare_cmdq_header(struct hinic_qp_ctxt_header *qp_ctxt_hdr,
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:362:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     362 | void hinic_qp_prepare_cmdq_header(struct hinic_qp_ctxt_header *qp_ctxt_hdr,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:381:6: warning: no previous prototype for function 'hinic_sq_prepare_ctxt' [-Wmissing-prototypes]
     381 | void hinic_sq_prepare_ctxt(struct hinic_sq *sq, u16 global_qpn,
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:381:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     381 | void hinic_sq_prepare_ctxt(struct hinic_sq *sq, u16 global_qpn,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:443:6: warning: no previous prototype for function 'hinic_rq_prepare_ctxt' [-Wmissing-prototypes]
     443 | void hinic_rq_prepare_ctxt(struct hinic_rq *rq, struct hinic_rq_ctxt *rq_ctxt)
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:443:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     443 | void hinic_rq_prepare_ctxt(struct hinic_rq *rq, struct hinic_rq_ctxt *rq_ctxt)
         | ^
         | static 
   3 warnings generated.
--
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:518:5: warning: variable 'lev' set but not used [-Wunused-but-set-variable]
     518 |         u8 lev;
         |            ^
   1 warning generated.
--
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function parameter or member 'intr_reg_base' not described in 'hinic_init_hwif'
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function parameter or member 'db_base_phy' not described in 'hinic_init_hwif'
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function parameter or member 'db_base' not described in 'hinic_init_hwif'
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function parameter or member 'dwqe_mapping' not described in 'hinic_init_hwif'
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:717: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * get function id from register,used by sriov hot migration process
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:802: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * get function id, used by sriov hot migratition process.
--
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:796:5: warning: no previous prototype for function 'set_vf_mbox_random_id' [-Wmissing-prototypes]
     796 | int set_vf_mbox_random_id(struct hinic_hwdev *hwdev, u16 func_id)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:796:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     796 | int set_vf_mbox_random_id(struct hinic_hwdev *hwdev, u16 func_id)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:846:6: warning: no previous prototype for function 'check_vf_mbox_random_id' [-Wmissing-prototypes]
     846 | bool check_vf_mbox_random_id(struct hinic_mbox_func_to_func *func_to_func,
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:846:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     846 | bool check_vf_mbox_random_id(struct hinic_mbox_func_to_func *func_to_func,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:1009:6: warning: no previous prototype for function 'dump_mox_reg' [-Wmissing-prototypes]
    1009 | void dump_mox_reg(struct hinic_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:1009:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1009 | void dump_mox_reg(struct hinic_hwdev *hwdev)
         | ^
         | static 
   3 warnings generated.
--
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:321: warning: Function parameter or member 'hwe_cb' not described in 'hinic_aeq_register_hw_cb'
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:321: warning: Excess function parameter 'hw_cb' description in 'hinic_aeq_register_hw_cb'
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:369: warning: Function parameter or member 'aeq_swe_cb' not described in 'hinic_aeq_register_swe_cb'
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:369: warning: expecting prototype for hinic_aeq_register_sw_cb(). Prototype was for hinic_aeq_register_swe_cb() instead
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:391: warning: expecting prototype for hinic_aeq_unregister_sw_cb(). Prototype was for hinic_aeq_unregister_swe_cb() instead
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:417: warning: expecting prototype for hinic_ceq_register_sw_cb(). Prototype was for hinic_ceq_register_cb() instead
--
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:373: warning: expecting prototype for hinic_unregister_ppf_mbox_cb(). Prototype was for hinic_unregister_pf_mbox_cb() instead
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:411: warning: expecting prototype for hinic_unregister_ppf_mbox_cb(). Prototype was for hinic_unregister_ppf_to_pf_mbox_cb() instead
--
>> drivers/net/ethernet/huawei/hinic/hinic_mgmt.c:939: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * api cmd write or read bypass defaut use poll, if want to use aeq interrupt,
--
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:413: warning: expecting prototype for prepare_cell(). Prototype was for wait_for_resp_polling() instead
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1056: warning: Function parameter or member 'cmd_chain' not described in 'api_cmd_create_chain'
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1056: warning: Excess function parameter 'chain' description in 'api_cmd_create_chain'
--
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1384:5: warning: no previous prototype for function 'hinic_set_cmdq_ctxts' [-Wmissing-prototypes]
    1384 | int hinic_set_cmdq_ctxts(struct hinic_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1384:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1384 | int hinic_set_cmdq_ctxts(struct hinic_hwdev *hwdev)
         | ^
         | static 
   1 warning generated.
--
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1061:5: warning: no previous prototype for function 'hinic_msg_to_mgmt_no_ack' [-Wmissing-prototypes]
    1061 | int hinic_msg_to_mgmt_no_ack(void *hwdev, enum hinic_mod_type mod, u8 cmd,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1061:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1061 | int hinic_msg_to_mgmt_no_ack(void *hwdev, enum hinic_mod_type mod, u8 cmd,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1978:5: warning: no previous prototype for function 'comm_pf_mbox_handler' [-Wmissing-prototypes]
    1978 | int comm_pf_mbox_handler(void *handle, u16 vf_id, u8 cmd, void *buf_in,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1978:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1978 | int comm_pf_mbox_handler(void *handle, u16 vf_id, u8 cmd, void *buf_in,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2749:5: warning: no previous prototype for function 'hinic_ppf_ht_gpa_init' [-Wmissing-prototypes]
    2749 | int hinic_ppf_ht_gpa_init(struct hinic_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2749:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2749 | int hinic_ppf_ht_gpa_init(struct hinic_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2795:6: warning: no previous prototype for function 'hinic_ppf_ht_gpa_deinit' [-Wmissing-prototypes]
    2795 | void hinic_ppf_ht_gpa_deinit(struct hinic_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2795:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2795 | void hinic_ppf_ht_gpa_deinit(struct hinic_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2872:5: warning: no previous prototype for function 'mqm_eqm_try_alloc_mem' [-Wmissing-prototypes]
    2872 | int mqm_eqm_try_alloc_mem(struct hinic_hwdev *hwdev, u32 page_size,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2872:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2872 | int mqm_eqm_try_alloc_mem(struct hinic_hwdev *hwdev, u32 page_size,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2909:5: warning: no previous prototype for function 'mqm_eqm_alloc_page_mem' [-Wmissing-prototypes]
    2909 | int mqm_eqm_alloc_page_mem(struct hinic_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2909:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2909 | int mqm_eqm_alloc_page_mem(struct hinic_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2934:6: warning: no previous prototype for function 'mqm_eqm_free_page_mem' [-Wmissing-prototypes]
    2934 | void mqm_eqm_free_page_mem(struct hinic_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2934:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2934 | void mqm_eqm_free_page_mem(struct hinic_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2950:5: warning: no previous prototype for function 'mqm_eqm_set_cfg_2_hw' [-Wmissing-prototypes]
    2950 | int mqm_eqm_set_cfg_2_hw(struct hinic_hwdev *hwdev, u32 valid)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2950:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2950 | int mqm_eqm_set_cfg_2_hw(struct hinic_hwdev *hwdev, u32 valid)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2975:5: warning: no previous prototype for function 'mqm_eqm_set_page_2_hw' [-Wmissing-prototypes]
    2975 | int mqm_eqm_set_page_2_hw(struct hinic_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2975:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2975 | int mqm_eqm_set_page_2_hw(struct hinic_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3053:5: warning: no previous prototype for function 'mqm_eqm_init' [-Wmissing-prototypes]
    3053 | int mqm_eqm_init(struct hinic_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3053:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3053 | int mqm_eqm_init(struct hinic_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3116:6: warning: no previous prototype for function 'mqm_eqm_deinit' [-Wmissing-prototypes]
    3116 | void mqm_eqm_deinit(struct hinic_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3116:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3116 | void mqm_eqm_deinit(struct hinic_hwdev *hwdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3719:18: warning: address of array 'chip_node->rt_cmd' will always evaluate to 'true' [-Wpointer-bool-conversion]
    3719 |         if (!chip_node->rt_cmd)
         |             ~~~~~~~~~~~~^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3748:18: warning: address of array 'chip_node->rt_cmd' will always evaluate to 'true' [-Wpointer-bool-conversion]
    3748 |         if (!chip_node->rt_cmd)
         |             ~~~~~~~~~~~~^~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4581:5: warning: no previous prototype for function '_set_led_status' [-Wmissing-prototypes]
    4581 | int _set_led_status(struct hinic_hwdev *hwdev, u8 port,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4581:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4581 | int _set_led_status(struct hinic_hwdev *hwdev, u8 port,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4667:5: warning: no previous prototype for function 'hinic_get_phy_init_status' [-Wmissing-prototypes]
    4667 | int hinic_get_phy_init_status(void *hwdev,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4667:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4667 | int hinic_get_phy_init_status(void *hwdev,
         | ^
         | static 
   15 warnings generated.
..


vim +581 drivers/net/ethernet/huawei/hinic/hinic_hwif.c

   571	
   572	/**
   573	 * hinic_init_hwif - initialize the hw interface
   574	 * @hwdev: the pointer to hw device
   575	 * @cfg_reg_base: configuration base address
   576	 * Return: 0 - success, negative - failure
   577	 */
   578	int hinic_init_hwif(struct hinic_hwdev *hwdev, void *cfg_reg_base,
   579			    void *intr_reg_base, u64 db_base_phy,
   580			    void *db_base, void *dwqe_mapping)
 > 581	{
   582		struct hinic_hwif *hwif;
   583		int err;
   584	
   585		hwif = kzalloc(sizeof(*hwif), GFP_KERNEL);
   586		if (!hwif)
   587			return -ENOMEM;
   588	
   589		hwdev->hwif = hwif;
   590		hwif->pdev = hwdev->pcidev_hdl;
   591	
   592		hwif->cfg_regs_base = cfg_reg_base;
   593		hwif->intr_regs_base = intr_reg_base;
   594	
   595		hwif->db_base_phy = db_base_phy;
   596		hwif->db_base = db_base;
   597		hwif->dwqe_mapping = dwqe_mapping;
   598	
   599		hwif->db_size = hinic_get_db_size(cfg_reg_base, &hwif->chip_mode);
   600	
   601		sdk_info(hwdev->dev_hdl, "Doorbell size: 0x%x, chip mode: %d\n",
   602			 hwif->db_size, hwif->chip_mode);
   603	
   604		init_db_area_idx(hwif);
   605	
   606		err = wait_hwif_ready(hwdev);
   607		if (err) {
   608			sdk_err(hwdev->dev_hdl, "Chip status is not ready\n");
   609			__print_selftest_reg(hwdev);
   610			goto hwif_ready_err;
   611		}
   612	
   613		get_hwif_attr(hwif);
   614	
   615		err = wait_until_doorbell_and_outbound_enabled(hwif);
   616		if (err) {
   617			sdk_err(hwdev->dev_hdl, "Hw doorbell/outbound is disabled\n");
   618			goto hwif_ready_err;
   619		}
   620	
   621		if (!HINIC_IS_VF(hwdev)) {
   622			set_ppf(hwif);
   623	
   624			if (HINIC_IS_PPF(hwdev))
   625				set_mpf(hwif);
   626	
   627			get_mpf(hwif);
   628		}
   629	
   630		disable_all_msix(hwdev);
   631		/* disable mgmt cpu report any event */
   632		hinic_set_pf_status(hwdev->hwif, HINIC_PF_STATUS_INIT);
   633	
   634		sdk_info(hwdev->dev_hdl, "global_func_idx: %d, func_type: %d, host_id: %d, ppf: %d, mpf: %d\n",
   635			 hwif->attr.func_global_idx, hwif->attr.func_type,
   636			 hwif->attr.pci_intf_idx, hwif->attr.ppf_idx,
   637			 hwif->attr.mpf_idx);
   638	
   639		return 0;
   640	
   641	hwif_ready_err:
   642		kfree(hwif);
   643	
   644		return err;
   645	}
   646	
   647	/**
   648	 * hinic_free_hwif - free the hw interface
   649	 * @hwdev: the pointer to hw device
   650	 */
   651	void hinic_free_hwif(struct hinic_hwdev *hwdev)
   652	{
   653		kfree(hwdev->hwif);
   654	}
   655	
   656	int hinic_dma_alloc_coherent_align(void *dev_hdl, u64 size, u64 align,
   657					   unsigned int flag,
   658					   struct hinic_dma_addr_align *mem_align)
   659	{
   660		void *vaddr, *align_vaddr;
   661		dma_addr_t paddr, align_paddr;
   662		u64 real_size = size;
   663	
   664		vaddr = dma_alloc_coherent(dev_hdl, real_size, &paddr, flag);
   665		if (!vaddr)
   666			return -ENOMEM;
   667	
   668		align_paddr = ALIGN(paddr, align);
   669		/* align */
   670		if (align_paddr == paddr) {
   671			align_vaddr = vaddr;
   672			goto out;
   673		}
   674	
   675		dma_free_coherent(dev_hdl, real_size, vaddr, paddr);
   676	
   677		/* realloc memory for align */
   678		real_size = size + align;
   679		vaddr = dma_alloc_coherent(dev_hdl, real_size, &paddr, flag);
   680		if (!vaddr)
   681			return -ENOMEM;
   682	
   683		align_paddr = ALIGN(paddr, align);
   684		align_vaddr = (void *)((u64)vaddr + (align_paddr - paddr));
   685	
   686	out:
   687		mem_align->real_size = (u32)real_size;
   688		mem_align->ori_vaddr = vaddr;
   689		mem_align->ori_paddr = paddr;
   690		mem_align->align_vaddr = align_vaddr;
   691		mem_align->align_paddr = align_paddr;
   692	
   693		return 0;
   694	}
   695	
   696	void hinic_dma_free_coherent_align(void *dev_hdl,
   697					   struct hinic_dma_addr_align *mem_align)
   698	{
   699		dma_free_coherent(dev_hdl, mem_align->real_size,
   700				  mem_align->ori_vaddr, mem_align->ori_paddr);
   701	}
   702	
   703	u16 hinic_global_func_id(void *hwdev)
   704	{
   705		struct hinic_hwif *hwif;
   706	
   707		if (!hwdev)
   708			return 0;
   709	
   710		hwif = ((struct hinic_hwdev *)hwdev)->hwif;
   711	
   712		return hwif->attr.func_global_idx;
   713	}
   714	EXPORT_SYMBOL(hinic_global_func_id);
   715	
   716	/**
 > 717	 * get function id from register,used by sriov hot migration process
   718	 * @hwdev: the pointer to hw device
   719	 */
   720	u16 hinic_global_func_id_hw(void *hwdev)
   721	{
   722		u32 addr, attr0;
   723		struct hinic_hwdev *dev;
   724	
   725		dev = (struct hinic_hwdev *)hwdev;
   726		addr   = HINIC_CSR_FUNC_ATTR0_ADDR;
   727		attr0  = hinic_hwif_read_reg(dev->hwif, addr);
   728	
   729		return HINIC_AF0_GET(attr0, FUNC_GLOBAL_IDX);
   730	}
   731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
