Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3258079ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 00:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692664284; x=1724200284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Vuh2ToI9YVOPrpE/TdHVU2+2r/R4vxYDJYFSVhuGZs=;
  b=hAx+ioOFQVMAxAn50Qv2JsnGlLBiXaYoENVl1wCLcG23r1nlxRKysjdd
   HbVUNWFtKZcL6qziu8GnFiIsQupMqWFG5uQQiBGMAR3mPO3Ep908gAaMe
   IH5Z6offC2hpEjqTJKu+t2vIHf5/0n2msN/8OrbCSbY9s87IIwd+cYCPZ
   fBgyEiB4EwXluFfUxFoF/QjbRx2a6wwASLY+FaOrqxqDwWLOQGs/KRa0A
   gOOhd8q30K90scE8qcDzJn3FrRLMaURXjA3/6Xf+0JqJbRcqs8xqvIC5R
   KVIBLfWEf7zwbeZqAVQc7wJbWB3X4Yguo93npFnMx1dKLKCVZ3bMtRLvr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404740262"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="404740262"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 17:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="879719795"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2023 17:31:17 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYFIY-00016m-2s;
	Tue, 22 Aug 2023 00:31:12 +0000
Date: Tue, 22 Aug 2023 08:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] htmldocs:
 ./drivers/usb/dwc3/core.h:1324: warning: Function parameter or member '' not
 described in 'dwc3'
Message-ID: <202308220819.RReYZGib-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wesley,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3ca64f2c1d4a9c43702fb81c557480d6e43870f2
commit: 82beac34d825032d1aac1ebbbdcea3358e7eaef1 [1/1] BACKPORT: UPSTREAM: usb: dwc3: EP clear halt leading to clearing of delayed_status
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220819.RReYZGib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220819.RReYZGib-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./drivers/usb/dwc3/core.h:1324: warning: Function parameter or member '' not described in 'dwc3'

vim +1324 ./drivers/usb/dwc3/core.h

475d8e0197f1bc Thinh Nguyen         2018-11-08  1234  
b53c772d16a975 Felipe Balbi         2011-08-30  1235  	enum dwc3_ep0_next	ep0_next_event;
72246da40f3719 Felipe Balbi         2011-08-19  1236  	enum dwc3_ep0_state	ep0state;
72246da40f3719 Felipe Balbi         2011-08-19  1237  	enum dwc3_link_state	link_state;
72246da40f3719 Felipe Balbi         2011-08-19  1238  
865e09e71622f9 Felipe Balbi         2012-04-24  1239  	u16			u2sel;
865e09e71622f9 Felipe Balbi         2012-04-24  1240  	u16			u2pel;
865e09e71622f9 Felipe Balbi         2012-04-24  1241  	u8			u1sel;
865e09e71622f9 Felipe Balbi         2012-04-24  1242  	u8			u1pel;
865e09e71622f9 Felipe Balbi         2012-04-24  1243  
72246da40f3719 Felipe Balbi         2011-08-19  1244  	u8			speed;
865e09e71622f9 Felipe Balbi         2012-04-24  1245  
47d3946ea220f2 Bryan O'Donoghue     2017-01-31  1246  	u8			num_eps;
789451f6c69828 Felipe Balbi         2011-05-05  1247  
a32994998c2ffa Felipe Balbi         2011-09-30  1248  	struct dwc3_hwparams	hwparams;
d7668024b3b5f9 Felipe Balbi         2013-01-18  1249  	struct debugfs_regset32	*regset;
3b637367ae40b6 Gerard Cauvy         2012-02-10  1250  
62ba09d6bb6330 Thinh Nguyen         2018-11-07  1251  	u32			dbg_lsp_select;
62ba09d6bb6330 Thinh Nguyen         2018-11-07  1252  
3b637367ae40b6 Gerard Cauvy         2012-02-10  1253  	u8			test_mode;
3b637367ae40b6 Gerard Cauvy         2012-02-10  1254  	u8			test_mode_nr;
80caf7d21adca1 Huang Rui            2014-10-28  1255  	u8			lpm_nyet_threshold;
460d098cb67281 Huang Rui            2014-10-31  1256  	u8			hird_threshold;
938a5ad1d3055c Thinh Nguyen         2018-03-16  1257  	u8			rx_thr_num_pkt_prd;
938a5ad1d3055c Thinh Nguyen         2018-03-16  1258  	u8			rx_max_burst_prd;
938a5ad1d3055c Thinh Nguyen         2018-03-16  1259  	u8			tx_thr_num_pkt_prd;
938a5ad1d3055c Thinh Nguyen         2018-03-16  1260  	u8			tx_max_burst_prd;
9f607a309fbe95 Wesley Cheng         2021-07-10  1261  	u8			tx_fifo_resize_max_num;
f2b685d5aad81f Felipe Balbi         2013-12-19  1262  
3e10a2ce98d1a5 Heikki Krogerus      2015-05-13  1263  	const char		*hsphy_interface;
3e10a2ce98d1a5 Heikki Krogerus      2015-05-13  1264  
fc8bb91bc83ef8 Felipe Balbi         2016-05-16  1265  	unsigned		connected:1;
ef6a831b6db9cd Wesley Cheng         2021-09-16  1266  	unsigned		softconnect:1;
f2b685d5aad81f Felipe Balbi         2013-12-19  1267  	unsigned		delayed_status:1;
f2b685d5aad81f Felipe Balbi         2013-12-19  1268  	unsigned		ep0_bounced:1;
f2b685d5aad81f Felipe Balbi         2013-12-19  1269  	unsigned		ep0_expect_in:1;
81bc5599d66d74 Felipe Balbi         2013-12-19  1270  	unsigned		has_hibernation:1;
d64ff406e51e4f Arnd Bergmann        2016-11-17  1271  	unsigned		sysdev_is_parent:1;
80caf7d21adca1 Huang Rui            2014-10-28  1272  	unsigned		has_lpm_erratum:1;
460d098cb67281 Huang Rui            2014-10-31  1273  	unsigned		is_utmi_l1_suspend:1;
946bd579a63855 Huang Rui            2014-10-28  1274  	unsigned		is_fpga:1;
fc8bb91bc83ef8 Felipe Balbi         2016-05-16  1275  	unsigned		pending_events:1;
9f607a309fbe95 Wesley Cheng         2021-07-10  1276  	unsigned		do_fifo_resize:1;
f2b685d5aad81f Felipe Balbi         2013-12-19  1277  	unsigned		pullups_connected:1;
f2b685d5aad81f Felipe Balbi         2013-12-19  1278  	unsigned		setup_packet_pending:1;
f2b685d5aad81f Felipe Balbi         2013-12-19  1279  	unsigned		three_stage_setup:1;
d92021f66063b3 Thinh Nguyen         2018-11-14  1280  	unsigned		dis_start_transfer_quirk:1;
eac68e8f979b82 Robert Baldyga       2015-03-09  1281  	unsigned		usb3_lpm_capable:1;
022a0208c0ff03 Thinh Nguyen         2018-11-07  1282  	unsigned		usb2_lpm_disable:1;
475e8be53d0496 Thinh Nguyen         2021-04-13  1283  	unsigned		usb2_gadget_lpm_disable:1;
3b81221a529c08 Huang Rui            2014-10-28  1284  
3b81221a529c08 Huang Rui            2014-10-28  1285  	unsigned		disable_scramble_quirk:1;
9a5b2f3167c1f9 Huang Rui            2014-10-28  1286  	unsigned		u2exit_lfps_quirk:1;
b5a65c406367e3 Huang Rui            2014-10-28  1287  	unsigned		u2ss_inp3_quirk:1;
df31f5b3a6d3ef Huang Rui            2014-10-28  1288  	unsigned		req_p1p2p3_quirk:1;
a2a1d0f5838d6a Huang Rui            2014-10-28  1289  	unsigned                del_p1p2p3_quirk:1;
41c06ffdf9cc63 Huang Rui            2014-10-28  1290  	unsigned		del_phy_power_chg_quirk:1;
fb67afca177a21 Huang Rui            2014-10-28  1291  	unsigned		lfps_filter_quirk:1;
14f4ac53dfb232 Huang Rui            2014-10-28  1292  	unsigned		rx_detect_poll_quirk:1;
59acfa20816420 Huang Rui            2014-10-31  1293  	unsigned		dis_u3_susphy_quirk:1;
0effe0a3e741c0 Huang Rui            2014-10-31  1294  	unsigned		dis_u2_susphy_quirk:1;
ec791d149bca45 John Youn            2015-10-02  1295  	unsigned		dis_enblslpm_quirk:1;
729dcffd1ed319 Anurag Kumar Vulisha 2019-05-10  1296  	unsigned		dis_u1_entry_quirk:1;
729dcffd1ed319 Anurag Kumar Vulisha 2019-05-10  1297  	unsigned		dis_u2_entry_quirk:1;
e58dd357741b93 Rajesh Bhagat        2016-03-14  1298  	unsigned		dis_rxdet_inp3_quirk:1;
16199f33893922 William Wu           2016-08-16  1299  	unsigned		dis_u2_freeclk_exists_quirk:1;
00fe081dc3a370 William Wu           2016-08-16  1300  	unsigned		dis_del_phy_power_chg_quirk:1;
65db7a0c981637 William Wu           2017-04-19  1301  	unsigned		dis_tx_ipgap_linecheck_quirk:1;
7ba6b09fda5e0c Neil Armstrong       2020-02-21  1302  	unsigned		parkmode_disable_ss_quirk:1;
6b6a0c9a3ffa31 Huang Rui            2014-10-31  1303  
6b6a0c9a3ffa31 Huang Rui            2014-10-31  1304  	unsigned		tx_de_emphasis_quirk:1;
6b6a0c9a3ffa31 Huang Rui            2014-10-31  1305  	unsigned		tx_de_emphasis:2;
cf40b86b6ef6df John Youn            2016-11-14  1306  
42bf02ec6e420e Roger Quadros        2017-10-31  1307  	unsigned		dis_metastability_quirk:1;
42bf02ec6e420e Roger Quadros        2017-10-31  1308  
f580170f135af1 Yu Chen              2020-09-08  1309  	unsigned		dis_split_quirk:1;
40edb52298df4c Linyu Yuan           2021-06-29  1310  	unsigned		async_callbacks:1;
f580170f135af1 Yu Chen              2020-09-08  1311  
cf40b86b6ef6df John Youn            2016-11-14  1312  	u16			imod_interval;
9f607a309fbe95 Wesley Cheng         2021-07-10  1313  
9f607a309fbe95 Wesley Cheng         2021-07-10  1314  	int			max_cfg_eps;
9f607a309fbe95 Wesley Cheng         2021-07-10  1315  	int			last_fifo_depth;
9f607a309fbe95 Wesley Cheng         2021-07-10  1316  	int			num_ep_resized;
db2b68eb63bde5 Greg Kroah-Hartman   2021-04-23  1317  
82beac34d82503 Wesley Cheng         2022-04-14  1318  	ANDROID_KABI_USE(1, struct{ u8 clear_stall_protocol; u8 padding1;
82beac34d82503 Wesley Cheng         2022-04-14  1319  				u8 padding2; u8 padding3; u8 padding4; u8 padding5;
82beac34d82503 Wesley Cheng         2022-04-14  1320  				u8 padding6; u8 padding7; });
db2b68eb63bde5 Greg Kroah-Hartman   2021-04-23  1321  	ANDROID_KABI_RESERVE(2);
db2b68eb63bde5 Greg Kroah-Hartman   2021-04-23  1322  	ANDROID_KABI_RESERVE(3);
db2b68eb63bde5 Greg Kroah-Hartman   2021-04-23  1323  	ANDROID_KABI_RESERVE(4);
72246da40f3719 Felipe Balbi         2011-08-19 @1324  };
72246da40f3719 Felipe Balbi         2011-08-19  1325  

:::::: The code at line 1324 was first introduced by commit
:::::: 72246da40f3719af3bfd104a2365b32537c27d83 usb: Introduce DesignWare USB3 DRD Driver

:::::: TO: Felipe Balbi <balbi@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
