Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E2031A90
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696342945; x=1727878945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4JLA6Gg82SIPmiuXZk90gyCKk8kVwcng8NbaMXoVZtE=;
  b=lwhSxTBqtmH7mLh/P6zQZZzGJ6nlDyW0skgVwjVG0nlrMFC+KRAHoiR5
   B9ElLWIQvRLSeOf6vFhTn+6METn7gnuLjFu5Wc4PE2BzPgrygHbatutNe
   zJf5XQTdqTTrLz2g7LhOz0ewW05nj4hhL7yw46adALgPq2lY/8frwVLAR
   S1gYdiP/F4DqGnnzrA56U6qiY/il1l0ia03+Mt4r62s/qo25pj4ZMYlop
   w73OJpsKLKxtMMypC3bCSpABWUmm5MvMAXg2ieXfvT17J+wrURaSlAXe8
   o/rrehWuUdi71DMrK8wjI3+f3+ZkNmSwF9Z/rEDuNN7rvGo6jn7VLfKAt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382794216"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="382794216"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 07:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="816701903"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="816701903"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 03 Oct 2023 07:22:20 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qngHx-0007BB-2R;
	Tue, 03 Oct 2023 14:22:18 +0000
Date: Tue, 3 Oct 2023 22:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 670/1370] htmldocs:
 ./drivers/usb/dwc3/core.h:1136: warning: bad line:                 a
 hibernation wakeup event
Message-ID: <202310032245.Lph5Ppz6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: cbd364755cd28447d078372bda5ab27896856c84 [670/1370] usb: dwc3: don't setup event buffers when operating in host mode
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310032245.Lph5Ppz6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310032245.Lph5Ppz6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./drivers/usb/dwc3/core.h:1136: warning: bad line:                 a hibernation wakeup event
>> ./drivers/usb/dwc3/core.h:1360: warning: Function parameter or member 'dwc3_pmu' not described in 'dwc3'
>> ./drivers/usb/dwc3/core.h:1360: warning: Function parameter or member 'mask_phy_rst' not described in 'dwc3'

vim +1136 ./drivers/usb/dwc3/core.h

   974	
   975	/**
   976	 * struct dwc3 - representation of our controller
   977	 * @drd_work: workqueue used for role swapping
   978	 * @ep0_trb: trb which is used for the ctrl_req
   979	 * @bounce: address of bounce buffer
   980	 * @scratchbuf: address of scratch buffer
   981	 * @setup_buf: used while precessing STD USB requests
   982	 * @ep0_trb_addr: dma address of @ep0_trb
   983	 * @bounce_addr: dma address of @bounce
   984	 * @ep0_usb_req: dummy req used while handling STD USB requests
   985	 * @scratch_addr: dma address of scratchbuf
   986	 * @ep0_in_setup: one control transfer is completed and enter setup phase
   987	 * @lock: for synchronizing
   988	 * @mutex: for mode switching
   989	 * @dev: pointer to our struct device
   990	 * @sysdev: pointer to the DMA-capable device
   991	 * @xhci: pointer to our xHCI child
   992	 * @xhci_resources: struct resources for our @xhci child
   993	 * @ev_buf: struct dwc3_event_buffer pointer
   994	 * @eps: endpoint array
   995	 * @gadget: device side representation of the peripheral controller
   996	 * @gadget_driver: pointer to the gadget driver
   997	 * @bus_clk: clock for accessing the registers
   998	 * @ref_clk: reference clock
   999	 * @susp_clk: clock used when the SS phy is in low power (S3) state
  1000	 * @reset: reset control
  1001	 * @regs: base address for our registers
  1002	 * @regs_size: address space size
  1003	 * @fladj: frame length adjustment
  1004	 * @ref_clk_per: reference clock period configuration
  1005	 * @irq_gadget: peripheral controller's IRQ number
  1006	 * @otg_irq: IRQ number for OTG IRQs
  1007	 * @current_otg_role: current role of operation while using the OTG block
  1008	 * @desired_otg_role: desired role of operation while using the OTG block
  1009	 * @otg_restart_host: flag that OTG controller needs to restart host
  1010	 * @nr_scratch: number of scratch buffers
  1011	 * @u1u2: only used on revisions <1.83a for workaround
  1012	 * @maximum_speed: maximum speed requested (mainly for testing purposes)
  1013	 * @max_ssp_rate: SuperSpeed Plus maximum signaling rate and lane count
  1014	 * @gadget_max_speed: maximum gadget speed requested
  1015	 * @gadget_ssp_rate: Gadget driver's maximum supported SuperSpeed Plus signaling
  1016	 *			rate and lane count.
  1017	 * @ip: controller's ID
  1018	 * @revision: controller's version of an IP
  1019	 * @version_type: VERSIONTYPE register contents, a sub release of a revision
  1020	 * @dr_mode: requested mode of operation
  1021	 * @current_dr_role: current role of operation when in dual-role mode
  1022	 * @desired_dr_role: desired role of operation when in dual-role mode
  1023	 * @edev: extcon handle
  1024	 * @edev_nb: extcon notifier
  1025	 * @hsphy_mode: UTMI phy mode, one of following:
  1026	 *		- USBPHY_INTERFACE_MODE_UTMI
  1027	 *		- USBPHY_INTERFACE_MODE_UTMIW
  1028	 * @role_sw: usb_role_switch handle
  1029	 * @role_switch_default_mode: default operation mode of controller while
  1030	 *			usb role is USB_ROLE_NONE.
  1031	 * @usb_psy: pointer to power supply interface.
  1032	 * @usb2_phy: pointer to USB2 PHY
  1033	 * @usb3_phy: pointer to USB3 PHY
  1034	 * @usb2_generic_phy: pointer to USB2 PHY
  1035	 * @usb3_generic_phy: pointer to USB3 PHY
  1036	 * @phys_ready: flag to indicate that PHYs are ready
  1037	 * @ulpi: pointer to ulpi interface
  1038	 * @ulpi_ready: flag to indicate that ULPI is initialized
  1039	 * @u2sel: parameter from Set SEL request.
  1040	 * @u2pel: parameter from Set SEL request.
  1041	 * @u1sel: parameter from Set SEL request.
  1042	 * @u1pel: parameter from Set SEL request.
  1043	 * @num_eps: number of endpoints
  1044	 * @ep0_next_event: hold the next expected event
  1045	 * @ep0state: state of endpoint zero
  1046	 * @link_state: link state
  1047	 * @speed: device speed (super, high, full, low)
  1048	 * @hwparams: copy of hwparams registers
  1049	 * @regset: debugfs pointer to regdump file
  1050	 * @dbg_lsp_select: current debug lsp mux register selection
  1051	 * @test_mode: true when we're entering a USB test mode
  1052	 * @test_mode_nr: test feature selector
  1053	 * @lpm_nyet_threshold: LPM NYET response threshold
  1054	 * @hird_threshold: HIRD threshold
  1055	 * @rx_thr_num_pkt_prd: periodic ESS receive packet count
  1056	 * @rx_max_burst_prd: max periodic ESS receive burst size
  1057	 * @tx_thr_num_pkt_prd: periodic ESS transmit packet count
  1058	 * @tx_max_burst_prd: max periodic ESS transmit burst size
  1059	 * @tx_fifo_resize_max_num: max number of fifos allocated during txfifo resize
  1060	 * @clear_stall_protocol: endpoint number that requires a delayed status phase
  1061	 * @hsphy_interface: "utmi" or "ulpi"
  1062	 * @connected: true when we're connected to a host, false otherwise
  1063	 * @softconnect: true when gadget connect is called, false when disconnect runs
  1064	 * @delayed_status: true when gadget driver asks for delayed status
  1065	 * @ep0_bounced: true when we used bounce buffer
  1066	 * @ep0_expect_in: true when we expect a DATA IN transfer
  1067	 * @has_hibernation: true when dwc3 was configured with Hibernation
  1068	 * @sysdev_is_parent: true when dwc3 device has a parent driver
  1069	 * @has_lpm_erratum: true when core was configured with LPM Erratum. Note that
  1070	 *			there's now way for software to detect this in runtime.
  1071	 * @is_utmi_l1_suspend: the core asserts output signal
  1072	 *	0	- utmi_sleep_n
  1073	 *	1	- utmi_l1_suspend_n
  1074	 * @is_fpga: true when we are using the FPGA board
  1075	 * @pending_events: true when we have pending IRQs to be handled
  1076	 * @do_fifo_resize: true when txfifo resizing is enabled for dwc3 endpoints
  1077	 * @pullups_connected: true when Run/Stop bit is set
  1078	 * @setup_packet_pending: true when there's a Setup Packet in FIFO. Workaround
  1079	 * @three_stage_setup: set if we perform a three phase setup
  1080	 * @dis_start_transfer_quirk: set if start_transfer failure SW workaround is
  1081	 *			not needed for DWC_usb31 version 1.70a-ea06 and below
  1082	 * @usb3_lpm_capable: set if hadrware supports Link Power Management
  1083	 * @usb2_lpm_disable: set to disable usb2 lpm for host
  1084	 * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
  1085	 * @disable_scramble_quirk: set if we enable the disable scramble quirk
  1086	 * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  1087	 * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
  1088	 * @req_p1p2p3_quirk: set if we enable request p1p2p3 quirk
  1089	 * @del_p1p2p3_quirk: set if we enable delay p1p2p3 quirk
  1090	 * @del_phy_power_chg_quirk: set if we enable delay phy power change quirk
  1091	 * @lfps_filter_quirk: set if we enable LFPS filter quirk
  1092	 * @rx_detect_poll_quirk: set if we enable rx_detect to polling lfps quirk
  1093	 * @dis_u3_susphy_quirk: set if we disable usb3 suspend phy
  1094	 * @dis_u2_susphy_quirk: set if we disable usb2 suspend phy
  1095	 * @dis_enblslpm_quirk: set if we clear enblslpm in GUSB2PHYCFG,
  1096	 *                      disabling the suspend signal to the PHY.
  1097	 * @dis_u1_entry_quirk: set if link entering into U1 state needs to be disabled.
  1098	 * @dis_u2_entry_quirk: set if link entering into U2 state needs to be disabled.
  1099	 * @dis_rxdet_inp3_quirk: set if we disable Rx.Detect in P3
  1100	 * @async_callbacks: if set, indicate that async callbacks will be used.
  1101	 *
  1102	 * @dis_u2_freeclk_exists_quirk : set if we clear u2_freeclk_exists
  1103	 *			in GUSB2PHYCFG, specify that USB2 PHY doesn't
  1104	 *			provide a free-running PHY clock.
  1105	 * @dis_del_phy_power_chg_quirk: set if we disable delay phy power
  1106	 *			change quirk.
  1107	 * @enable_guctl1_ipd_quirk: set if we enable quirk for reducing timing of inter
  1108	 *			packet delay(ipd).
  1109	 * @dis_tx_ipgap_linecheck_quirk: set if we disable u2mac linestate
  1110	 *			check during HS transmit.
  1111	 * @resume-hs-terminations: Set if we enable quirk for fixing improper crc
  1112	 *			generation after resume from suspend.
  1113	 * @parkmode_disable_ss_quirk: set if we need to disable all SuperSpeed
  1114	 *			instances in park mode.
  1115	 * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  1116	 * @tx_de_emphasis: Tx de-emphasis value
  1117	 *	0	- -6dB de-emphasis
  1118	 *	1	- -3.5dB de-emphasis
  1119	 *	2	- No de-emphasis
  1120	 *	3	- Reserved
  1121	 * @is_hibernated: true when dwc3 is hibernated; abort processing events
  1122	 * @dis_metastability_quirk: set to disable metastability quirk.
  1123	 * @dis_split_quirk: set to disable split boundary.
  1124	 * @imod_interval: set the interrupt moderation interval in 250ns
  1125	 *			increments or 0 to disable.
  1126	 * @max_cfg_eps: current max number of IN eps used across all USB configs.
  1127	 * @last_fifo_depth: last fifo depth used to determine next fifo ram start
  1128	 *		     address.
  1129	 * @num_ep_resized: carries the current number endpoints which have had its tx
  1130	 *		    fifo resized.
  1131	 * @is_d3: set if the controller is in d3 state
  1132	 * @saved_regs: registers to be saved/restored during hibernation/wakeup events
  1133	 * @irq_wakeup: wakeup IRQ number, triggered when host asks to wakeup from
  1134	 *              hibernation
  1135	 * @force_hiber_wake: flag set when the gadget driver is forcefully triggering
> 1136			a hibernation wakeup event
  1137	 */
  1138	struct dwc3 {
  1139		struct work_struct	drd_work;
  1140		struct dwc3_trb		*ep0_trb;
  1141		void			*bounce;
  1142		void			*scratchbuf;
  1143		u8			*setup_buf;
  1144		dma_addr_t		ep0_trb_addr;
  1145		dma_addr_t		bounce_addr;
  1146		dma_addr_t		scratch_addr;
  1147		struct dwc3_request	ep0_usb_req;
  1148		struct completion	ep0_in_setup;
  1149	
  1150		/* device lock */
  1151		spinlock_t		lock;
  1152	
  1153		/* mode switching lock */
  1154		struct mutex		mutex;
  1155	
  1156		struct device		*dev;
  1157		struct device		*sysdev;
  1158	
  1159		struct platform_device	*xhci;
  1160		struct resource		xhci_resources[DWC3_XHCI_RESOURCES_NUM];
  1161	
  1162		struct dwc3_event_buffer *ev_buf;
  1163		struct dwc3_ep		*eps[DWC3_ENDPOINTS_NUM];
  1164	
  1165		struct usb_gadget	*gadget;
  1166		struct usb_gadget_driver *gadget_driver;
  1167	
  1168		struct clk		*bus_clk;
  1169		struct clk		*ref_clk;
  1170		struct clk		*susp_clk;
  1171	
  1172		struct reset_control	*reset;
  1173	
  1174		struct usb_phy		*usb2_phy;
  1175		struct usb_phy		*usb3_phy;
  1176	
  1177		struct phy		*usb2_generic_phy;
  1178		struct phy		*usb3_generic_phy;
  1179	
  1180		bool			phys_ready;
  1181	
  1182		struct ulpi		*ulpi;
  1183		bool			ulpi_ready;
  1184	
  1185		void __iomem		*regs;
  1186		size_t			regs_size;
  1187	
  1188		enum usb_dr_mode	dr_mode;
  1189		u32			current_dr_role;
  1190		u32			desired_dr_role;
  1191		struct extcon_dev	*edev;
  1192		struct notifier_block	edev_nb;
  1193		enum usb_phy_interface	hsphy_mode;
  1194		struct regulator	*dwc3_pmu;
  1195		struct usb_role_switch	*role_sw;
  1196		enum usb_dr_mode	role_switch_default_mode;
  1197	
  1198		struct power_supply	*usb_psy;
  1199	
  1200		u32			fladj;
  1201		u32			ref_clk_per;
  1202		u32			irq_gadget;
  1203		u32			otg_irq;
  1204		u32			current_otg_role;
  1205		u32			desired_otg_role;
  1206		bool			otg_restart_host;
  1207		u32			nr_scratch;
  1208		u32			u1u2;
  1209		u32			maximum_speed;
  1210		u32			gadget_max_speed;
  1211		enum usb_ssp_rate	max_ssp_rate;
  1212		enum usb_ssp_rate	gadget_ssp_rate;
  1213	
  1214		u32			ip;
  1215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
