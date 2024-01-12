Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7CB1B283
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 04:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTX5CbRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705032582; x=1736568582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=93T+H9AGUKDsD81/NgwEenPm6OfpxwJCX++66OwOURE=;
  b=cTX5CbRyGEwham8/B+DKUpdj4g7KJsBCllZPuozzzJUJ9QMKHHbyjUSq
   qfWLF65ewzvK9eGUlUGmZZn+HQtiX61ED5Z98sG80EuQ0RAU+C++Fxx4O
   GQZ7cO3CBtnNWLLuvqbsJiZNVbf8lS/D3EyREdHDlWobcxbCafQ0A+Tyr
   2uJm90CMQMBbXT5rHF5BNQ8M+wfUs04+WF4Cnh8bR6E9/gclad0XFXXyz
   gOvnKYJyPCAH5mgjXcYRikWVNo9hTfUe+jOeS4j7oHvm/4M8TdDh8rwO8
   D4r+IssvgbHWraScFgwqpFYTf28PHuYJZCD35jCn/0xvSeKQzXldj0lO5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="389519599"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="389519599"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 20:09:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="786226708"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="786226708"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jan 2024 20:09:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO8rQ-000930-29;
	Fri, 12 Jan 2024 04:09:36 +0000
Date: Fri, 12 Jan 2024 12:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13425/21544]
 drivers/net/ethernet/huawei/hinic/hinic_hwif.c:564: warning: Function
 parameter or member 'intr_reg_base' not described in 'hinic_init_hwif'
Message-ID: <202401121143.CVWNrg1F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 90f09a01314abe26de1a722d1b51c351d84e1f5b [13425/21544] net/hinic: Add support for X86 Arch
config: x86_64-openeuler_defconfig (https://download.01.org/0day-ci/archive/20240112/202401121143.CVWNrg1F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401121143.CVWNrg1F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401121143.CVWNrg1F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:491:5: warning: no previous prototype for 'hinic_hiovs_set_cpath_vlan' [-Wmissing-prototypes]
     491 | int hinic_hiovs_set_cpath_vlan(void *hwdev, u16 vlan_id, u16 pf_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:517:5: warning: no previous prototype for 'hinic_hiovs_del_cpath_vlan' [-Wmissing-prototypes]
     517 | int hinic_hiovs_del_cpath_vlan(void *hwdev, u16 vlan_id, u16 pf_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:2711:5: warning: no previous prototype for 'nic_pf_mbox_handler' [-Wmissing-prototypes]
    2711 | int nic_pf_mbox_handler(void *hwdev, u16 vf_id, u8 cmd, void *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:364:6: warning: no previous prototype for 'hinic_qp_prepare_cmdq_header' [-Wmissing-prototypes]
     364 | void hinic_qp_prepare_cmdq_header(struct hinic_qp_ctxt_header *qp_ctxt_hdr,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:383:6: warning: no previous prototype for 'hinic_sq_prepare_ctxt' [-Wmissing-prototypes]
     383 | void hinic_sq_prepare_ctxt(struct hinic_sq *sq, u16 global_qpn,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:445:6: warning: no previous prototype for 'hinic_rq_prepare_ctxt' [-Wmissing-prototypes]
     445 | void hinic_rq_prepare_ctxt(struct hinic_rq *rq, struct hinic_rq_ctxt *rq_ctxt)
         |      ^~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:564: warning: Function parameter or member 'intr_reg_base' not described in 'hinic_init_hwif'
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:564: warning: Function parameter or member 'db_base_phy' not described in 'hinic_init_hwif'
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:564: warning: Function parameter or member 'db_base' not described in 'hinic_init_hwif'
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:564: warning: Function parameter or member 'dwqe_mapping' not described in 'hinic_init_hwif'
--
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c: In function 'aeq_irq_handler':
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:539:37: warning: implicit conversion from 'enum hinic_aeq_type' to 'enum hinic_ucode_event_type' [-Wenum-conversion]
     539 |                         ucode_event = event;
         |                                     ^
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:321: warning: Function parameter or member 'hwe_cb' not described in 'hinic_aeq_register_hw_cb'
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:321: warning: Excess function parameter 'hw_cb' description in 'hinic_aeq_register_hw_cb'
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:369: warning: Function parameter or member 'aeq_swe_cb' not described in 'hinic_aeq_register_swe_cb'
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:369: warning: Excess function parameter 'sw_cb' description in 'hinic_aeq_register_swe_cb'
--
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:792:5: warning: no previous prototype for 'set_vf_mbox_random_id' [-Wmissing-prototypes]
     792 | int set_vf_mbox_random_id(struct hinic_hwdev *hwdev, u16 func_id)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:844:6: warning: no previous prototype for 'check_vf_mbox_random_id' [-Wmissing-prototypes]
     844 | bool check_vf_mbox_random_id(struct hinic_mbox_func_to_func *func_to_func,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:1011:6: warning: no previous prototype for 'dump_mox_reg' [-Wmissing-prototypes]
    1011 | void dump_mox_reg(struct hinic_hwdev *hwdev)
         |      ^~~~~~~~~~~~
--
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c: In function 'api_chain_init':
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1040:41: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1040 |                 sema_deinit(&chain->sem);
         |                                         ^
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c: In function 'api_chain_free':
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1063:41: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1063 |                 sema_deinit(&chain->sem);
         |                                         ^
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1075: warning: Function parameter or member 'cmd_chain' not described in 'api_cmd_create_chain'
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1075: warning: Excess function parameter 'chain' description in 'api_cmd_create_chain'
--
>> drivers/net/ethernet/huawei/hinic/hinic_mgmt.c:940: warning: Function parameter or member 'hwdev' not described in 'hinic_api_cmd_write_nack'
>> drivers/net/ethernet/huawei/hinic/hinic_mgmt.c:940: warning: Function parameter or member 'dest' not described in 'hinic_api_cmd_write_nack'
>> drivers/net/ethernet/huawei/hinic/hinic_mgmt.c:940: warning: Function parameter or member 'cmd' not described in 'hinic_api_cmd_write_nack'
>> drivers/net/ethernet/huawei/hinic/hinic_mgmt.c:940: warning: Function parameter or member 'size' not described in 'hinic_api_cmd_write_nack'
--
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1369:5: warning: no previous prototype for 'hinic_set_cmdq_ctxts' [-Wmissing-prototypes]
    1369 | int hinic_set_cmdq_ctxts(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1074:5: warning: no previous prototype for 'hinic_msg_to_mgmt_no_ack' [-Wmissing-prototypes]
    1074 | int hinic_msg_to_mgmt_no_ack(void *hwdev, enum hinic_mod_type mod, u8 cmd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1918:5: warning: no previous prototype for 'hinic_sync_heartbeat_status' [-Wmissing-prototypes]
    1918 | int hinic_sync_heartbeat_status(struct hinic_hwdev *hwdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2020:5: warning: no previous prototype for 'comm_pf_mbox_handler' [-Wmissing-prototypes]
    2020 | int comm_pf_mbox_handler(void *handle, u16 vf_id, u8 cmd, void *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2766:5: warning: no previous prototype for 'ppf_ht_gpa_set' [-Wmissing-prototypes]
    2766 | int ppf_ht_gpa_set(struct hinic_hwdev *hwdev, struct hinic_page_addr *pg0,
         |     ^~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2812:5: warning: no previous prototype for 'hinic_ppf_ht_gpa_init' [-Wmissing-prototypes]
    2812 | int hinic_ppf_ht_gpa_init(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2858:6: warning: no previous prototype for 'hinic_ppf_ht_gpa_deinit' [-Wmissing-prototypes]
    2858 | void hinic_ppf_ht_gpa_deinit(struct hinic_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2935:5: warning: no previous prototype for 'mqm_eqm_try_alloc_mem' [-Wmissing-prototypes]
    2935 | int mqm_eqm_try_alloc_mem(struct hinic_hwdev *hwdev, u32 page_size,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2972:5: warning: no previous prototype for 'mqm_eqm_alloc_page_mem' [-Wmissing-prototypes]
    2972 | int mqm_eqm_alloc_page_mem(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2997:6: warning: no previous prototype for 'mqm_eqm_free_page_mem' [-Wmissing-prototypes]
    2997 | void mqm_eqm_free_page_mem(struct hinic_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3013:5: warning: no previous prototype for 'mqm_eqm_set_cfg_2_hw' [-Wmissing-prototypes]
    3013 | int mqm_eqm_set_cfg_2_hw(struct hinic_hwdev *hwdev, u32 valid)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3038:5: warning: no previous prototype for 'mqm_eqm_set_page_2_hw' [-Wmissing-prototypes]
    3038 | int mqm_eqm_set_page_2_hw(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3116:5: warning: no previous prototype for 'mqm_eqm_init' [-Wmissing-prototypes]
    3116 | int mqm_eqm_init(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3179:6: warning: no previous prototype for 'mqm_eqm_deinit' [-Wmissing-prototypes]
    3179 | void mqm_eqm_deinit(struct hinic_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c: In function 'port_sfp_info_event':
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3855:13: warning: the comparison will always evaluate as 'true' for the address of 'rt_cmd' will never be NULL [-Waddress]
    3855 |         if (!chip_node->rt_cmd)
         |             ^
   In file included from drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:28:
   drivers/net/ethernet/huawei/hinic/hinic_hw.h:335:39: note: 'rt_cmd' declared here
     335 |         struct hinic_port_routine_cmd rt_cmd[HINIC_MAX_PORT_ID];
         |                                       ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c: In function 'port_sfp_abs_event':
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3884:13: warning: the comparison will always evaluate as 'true' for the address of 'rt_cmd' will never be NULL [-Waddress]
    3884 |         if (!chip_node->rt_cmd)
         |             ^
   drivers/net/ethernet/huawei/hinic/hinic_hw.h:335:39: note: 'rt_cmd' declared here
     335 |         struct hinic_port_routine_cmd rt_cmd[HINIC_MAX_PORT_ID];
         |                                       ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c: At top level:
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4209:6: warning: no previous prototype for 'print_hilink_info' [-Wmissing-prototypes]
    4209 | void print_hilink_info(struct hinic_hwdev *hwdev,
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4486:6: warning: no previous prototype for 'pf_fault_event_handler' [-Wmissing-prototypes]
    4486 | void pf_fault_event_handler(void *hwdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4494:6: warning: no previous prototype for 'mgmt_watchdog_event_handler' [-Wmissing-prototypes]
    4494 | void mgmt_watchdog_event_handler(void *hwdev, void *buf_in, u16 in_size,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4501:6: warning: no previous prototype for 'mgmt_fmw_act_event_handler' [-Wmissing-prototypes]
    4501 | void mgmt_fmw_act_event_handler(void *hwdev, void *buf_in, u16 in_size,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4508:6: warning: no previous prototype for 'mgmt_pcie_dfx_event_handler' [-Wmissing-prototypes]
    4508 | void mgmt_pcie_dfx_event_handler(void *hwdev, void *buf_in, u16 in_size,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4515:6: warning: no previous prototype for 'mgmt_get_mctp_event_handler' [-Wmissing-prototypes]
    4515 | void mgmt_get_mctp_event_handler(void *hwdev, void *buf_in, u16 in_size,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4799:5: warning: no previous prototype for '_set_led_status' [-Wmissing-prototypes]
    4799 | int _set_led_status(struct hinic_hwdev *hwdev, u8 port,
         |     ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4885:5: warning: no previous prototype for 'hinic_get_phy_init_status' [-Wmissing-prototypes]
    4885 | int hinic_get_phy_init_status(void *hwdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:5094:5: warning: no previous prototype for 'hinic_read_reg' [-Wmissing-prototypes]
    5094 | int hinic_read_reg(void *hwdev, u32 reg_addr, u32 *val)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:5183:5: warning: no previous prototype for 'hinic_register_fault_recover' [-Wmissing-prototypes]
    5183 | int hinic_register_fault_recover(void *hwdev, void *pri_handle,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:5205:5: warning: no previous prototype for 'hinic_unregister_fault_recover' [-Wmissing-prototypes]
    5205 | int hinic_unregister_fault_recover(void *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c: In function '__print_cable_info':
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4100:23: warning: 'snprintf' argument 4 overlaps destination object 'tmp_str' [-Wrestrict]
    4100 |                 err = snprintf(tmp_str, sizeof(tmp_str),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4101 |                                "%s, %s, Temperature: %u", tmp_str,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4102 |                                info->sfp_type ? "SFP" : "QSFP",
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4103 |                                info->cable_temp);
         |                                ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4055:14: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
    4055 |         char tmp_str[CAP_INFO_MAC_LEN] = {0};
         |              ^~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4116:31: warning: 'snprintf' argument 4 overlaps destination object 'tmp_str' [-Wrestrict]
    4116 |                         err = snprintf(tmp_str, sizeof(tmp_str),
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4117 |                                        "%s, rx power: %uuw %uuW %uuW %uuW",
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4118 |                                        tmp_str, info->power[0], info->power[1],
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4119 |                                        info->power[2], info->power[3]);
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4055:14: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
    4055 |         char tmp_str[CAP_INFO_MAC_LEN] = {0};
         |              ^~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4112:31: warning: 'snprintf' argument 4 overlaps destination object 'tmp_str' [-Wrestrict]
    4112 |                         err = snprintf(tmp_str, sizeof(tmp_str),
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4113 |                                        "%s, rx power: %uuW, tx power: %uuW",
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4114 |                                        tmp_str, info->power[0], info->power[1]);
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4055:14: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
    4055 |         char tmp_str[CAP_INFO_MAC_LEN] = {0};
         |              ^~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1129:5: warning: no previous prototype for 'hinic_vector_to_irq' [-Wmissing-prototypes]
    1129 | int hinic_vector_to_irq(void *hwdev, enum hinic_service_type type, int vector)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1451:5: warning: no previous prototype for 'init_cfg_mgmt' [-Wmissing-prototypes]
    1451 | int init_cfg_mgmt(struct hinic_hwdev *dev)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1501:6: warning: no previous prototype for 'free_cfg_mgmt' [-Wmissing-prototypes]
    1501 | void free_cfg_mgmt(struct hinic_hwdev *dev)
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1536:5: warning: no previous prototype for 'init_capability' [-Wmissing-prototypes]
    1536 | int init_capability(struct hinic_hwdev *dev)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1565:6: warning: no previous prototype for 'free_capability' [-Wmissing-prototypes]
    1565 | void free_capability(struct hinic_hwdev *dev)
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1814:5: warning: no previous prototype for 'cfg_set_func_sf_en' [-Wmissing-prototypes]
    1814 | int cfg_set_func_sf_en(void *hwdev, u32 enbits, u32 enmask)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1857:5: warning: no previous prototype for 'cfg_get_func_sf_en' [-Wmissing-prototypes]
    1857 | int cfg_get_func_sf_en(void *hwdev, u32 *enbits)
         |     ^~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:87:5: warning: no previous prototype for 'hinic_sm_ctr_rd32' [-Wmissing-prototypes]
      87 | int hinic_sm_ctr_rd32(void *hwdev, u8 node, u8 instance, u32 ctr_id, u32 *value)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:124:5: warning: no previous prototype for 'hinic_sm_ctr_rd32_clear' [-Wmissing-prototypes]
     124 | int hinic_sm_ctr_rd32_clear(void *hwdev, u8 node, u8 instance,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:163:5: warning: no previous prototype for 'hinic_sm_ctr_wr32' [-Wmissing-prototypes]
     163 | int hinic_sm_ctr_wr32(void *hwdev, u8 node, u8 instance, u32 ctr_id, u32 value)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:188:5: warning: no previous prototype for 'hinic_sm_ctr_rd64' [-Wmissing-prototypes]
     188 | int hinic_sm_ctr_rd64(void *hwdev, u8 node, u8 instance, u32 ctr_id, u64 *value)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:223:5: warning: no previous prototype for 'hinic_sm_ctr_wr64' [-Wmissing-prototypes]
     223 | int hinic_sm_ctr_wr64(void *hwdev, u8 node, u8 instance, u32 ctr_id, u64 value)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:249:5: warning: no previous prototype for 'hinic_sm_ctr_rd64_pair' [-Wmissing-prototypes]
     249 | int hinic_sm_ctr_rd64_pair(void *hwdev, u8 node, u8 instance,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:300:5: warning: no previous prototype for 'hinic_sm_ctr_wr64_pair' [-Wmissing-prototypes]
     300 | int hinic_sm_ctr_wr64_pair(void *hwdev, u8 node, u8 instance,
         |     ^~~~~~~~~~~~~~~~~~~~~~
..


vim +564 drivers/net/ethernet/huawei/hinic/hinic_hwif.c

746ea35981b1f7 Xue           2019-01-30  554  
746ea35981b1f7 Xue           2019-01-30  555  /**
746ea35981b1f7 Xue           2019-01-30  556   * hinic_init_hwif - initialize the hw interface
89b31b95cfaa65 Shaozhengchao 2019-10-15  557   * @hwdev: the pointer to hw device
89b31b95cfaa65 Shaozhengchao 2019-10-15  558   * @cfg_reg_base: configuration base address
746ea35981b1f7 Xue           2019-01-30  559   * Return: 0 - success, negative - failure
60c099fbda43bc Shaozhengchao 2019-12-16  560   */
746ea35981b1f7 Xue           2019-01-30  561  int hinic_init_hwif(struct hinic_hwdev *hwdev, void *cfg_reg_base,
746ea35981b1f7 Xue           2019-01-30  562  		    void *intr_reg_base, u64 db_base_phy,
746ea35981b1f7 Xue           2019-01-30  563  		    void *db_base, void *dwqe_mapping)
746ea35981b1f7 Xue           2019-01-30 @564  {
746ea35981b1f7 Xue           2019-01-30  565  	struct hinic_hwif *hwif;
746ea35981b1f7 Xue           2019-01-30  566  	int err;
746ea35981b1f7 Xue           2019-01-30  567  
746ea35981b1f7 Xue           2019-01-30  568  	hwif = kzalloc(sizeof(*hwif), GFP_KERNEL);
746ea35981b1f7 Xue           2019-01-30  569  	if (!hwif)
746ea35981b1f7 Xue           2019-01-30  570  		return -ENOMEM;
746ea35981b1f7 Xue           2019-01-30  571  
746ea35981b1f7 Xue           2019-01-30  572  	hwdev->hwif = hwif;
746ea35981b1f7 Xue           2019-01-30  573  	hwif->pdev = hwdev->pcidev_hdl;
746ea35981b1f7 Xue           2019-01-30  574  
746ea35981b1f7 Xue           2019-01-30  575  	hwif->cfg_regs_base = cfg_reg_base;
746ea35981b1f7 Xue           2019-01-30  576  	hwif->intr_regs_base = intr_reg_base;
746ea35981b1f7 Xue           2019-01-30  577  
746ea35981b1f7 Xue           2019-01-30  578  	hwif->db_base_phy = db_base_phy;
746ea35981b1f7 Xue           2019-01-30  579  	hwif->db_base = db_base;
746ea35981b1f7 Xue           2019-01-30  580  	hwif->dwqe_mapping = dwqe_mapping;
e67c958c7b6b8d Chiqijun      2020-05-20  581  
e67c958c7b6b8d Chiqijun      2020-05-20  582  	hwif->db_size = hinic_get_db_size(cfg_reg_base, &hwif->chip_mode);
e67c958c7b6b8d Chiqijun      2020-05-20  583  
e67c958c7b6b8d Chiqijun      2020-05-20  584  	sdk_info(hwdev->dev_hdl, "Doorbell size: 0x%x, chip mode: %d\n",
e67c958c7b6b8d Chiqijun      2020-05-20  585  		 hwif->db_size, hwif->chip_mode);
e67c958c7b6b8d Chiqijun      2020-05-20  586  
e67c958c7b6b8d Chiqijun      2020-05-20  587  	init_db_area_idx(hwif);
746ea35981b1f7 Xue           2019-01-30  588  
746ea35981b1f7 Xue           2019-01-30  589  	err = wait_hwif_ready(hwdev);
746ea35981b1f7 Xue           2019-01-30  590  	if (err) {
746ea35981b1f7 Xue           2019-01-30  591  		sdk_err(hwdev->dev_hdl, "Chip status is not ready\n");
746ea35981b1f7 Xue           2019-01-30  592  		__print_selftest_reg(hwdev);
746ea35981b1f7 Xue           2019-01-30  593  		goto hwif_ready_err;
746ea35981b1f7 Xue           2019-01-30  594  	}
746ea35981b1f7 Xue           2019-01-30  595  
746ea35981b1f7 Xue           2019-01-30  596  	get_hwif_attr(hwif);
746ea35981b1f7 Xue           2019-01-30  597  
746ea35981b1f7 Xue           2019-01-30  598  	err = wait_until_doorbell_and_outbound_enabled(hwif);
746ea35981b1f7 Xue           2019-01-30  599  	if (err) {
746ea35981b1f7 Xue           2019-01-30  600  		sdk_err(hwdev->dev_hdl, "Hw doorbell/outbound is disabled\n");
746ea35981b1f7 Xue           2019-01-30  601  		goto hwif_ready_err;
746ea35981b1f7 Xue           2019-01-30  602  	}
746ea35981b1f7 Xue           2019-01-30  603  
746ea35981b1f7 Xue           2019-01-30  604  	if (!HINIC_IS_VF(hwdev)) {
746ea35981b1f7 Xue           2019-01-30  605  		set_ppf(hwif);
746ea35981b1f7 Xue           2019-01-30  606  
746ea35981b1f7 Xue           2019-01-30  607  		if (HINIC_IS_PPF(hwdev))
746ea35981b1f7 Xue           2019-01-30  608  			set_mpf(hwif);
746ea35981b1f7 Xue           2019-01-30  609  
746ea35981b1f7 Xue           2019-01-30  610  		get_mpf(hwif);
746ea35981b1f7 Xue           2019-01-30  611  	}
746ea35981b1f7 Xue           2019-01-30  612  
746ea35981b1f7 Xue           2019-01-30  613  	disable_all_msix(hwdev);
70ffa6e4fea08c Xue           2019-04-23  614  	/* disable mgmt cpu report any event */
70ffa6e4fea08c Xue           2019-04-23  615  	hinic_set_pf_status(hwdev->hwif, HINIC_PF_STATUS_INIT);
746ea35981b1f7 Xue           2019-01-30  616  
746ea35981b1f7 Xue           2019-01-30  617  	pr_info("global_func_idx: %d, func_type: %d, host_id: %d, ppf: %d, mpf: %d\n",
746ea35981b1f7 Xue           2019-01-30  618  		hwif->attr.func_global_idx, hwif->attr.func_type,
746ea35981b1f7 Xue           2019-01-30  619  		hwif->attr.pci_intf_idx, hwif->attr.ppf_idx,
746ea35981b1f7 Xue           2019-01-30  620  		hwif->attr.mpf_idx);
746ea35981b1f7 Xue           2019-01-30  621  
746ea35981b1f7 Xue           2019-01-30  622  	return 0;
746ea35981b1f7 Xue           2019-01-30  623  
746ea35981b1f7 Xue           2019-01-30  624  hwif_ready_err:
746ea35981b1f7 Xue           2019-01-30  625  	spin_lock_deinit(&hwif->free_db_area.idx_lock);
746ea35981b1f7 Xue           2019-01-30  626  	kfree(hwif);
746ea35981b1f7 Xue           2019-01-30  627  
746ea35981b1f7 Xue           2019-01-30  628  	return err;
746ea35981b1f7 Xue           2019-01-30  629  }
746ea35981b1f7 Xue           2019-01-30  630  

:::::: The code at line 564 was first introduced by commit
:::::: 746ea35981b1f77e988d48642409d73f0470b3eb net: hinic: Add Hardware Abstract Layer

:::::: TO: Xue <xuechaojing@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
