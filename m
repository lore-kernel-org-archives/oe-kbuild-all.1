Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2B910E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 00:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692665774; x=1724201774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wSsSoYPeMITAmS+zKNkD7FeAwCRfOpeSNirkJsrLm2Y=;
  b=TqDg/sAFsP5BFLMt24qIgQ3/KW3WoIaQojMmd41dOf3xlOPwHLeuIDjC
   u1ZdiGDCCCn0bkwEK3QHCohQjk8civVWqvBwvoP28hnIvbsKLtYQ2tr48
   Ls+kwbdO0mLnSh//QPwBh7NOqIb7s1DKvAExxryQJy+6dcQxgO0YfkFl7
   XD5KxcRM1ETlJi/LgMbV0TAjgwT3diq8B38B7FxKsGx07X5QO4Dk5hlpV
   9sqxrtMKH/t6M6gdwQjBBBxDgXQZtkgO8i3WJ7hBYzMGpEqTHwL8GkAoN
   RWBgUmmN1tLAA38I7DKsvc6MZ6m0ukXHew6gWzlvgkUp8jgnJhUYwxtTf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371167320"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="371167320"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 17:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850390974"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="850390974"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2023 17:56:12 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYFgH-00018g-2R;
	Tue, 22 Aug 2023 00:55:50 +0000
Date: Tue, 22 Aug 2023 08:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: htmldocs: ./drivers/usb/dwc3/core.h:1259: warning: Function
 parameter or member 'need_phy_for_wakeup' not described in 'dwc3'
Message-ID: <202308220815.Xd2P76za-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: a13d98912ca411880fcbbe2732319e8cacd3ca0d FROMLIST: usb: dwc3: core: Host wake up support from system suspend
date:   2 years, 8 months ago
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220815.Xd2P76za-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220815.Xd2P76za-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./drivers/usb/dwc3/core.h:1259: warning: Function parameter or member 'need_phy_for_wakeup' not described in 'dwc3'
>> ./drivers/usb/dwc3/core.h:1259: warning: Function parameter or member 'hs_phy_flags' not described in 'dwc3'

vim +1259 ./drivers/usb/dwc3/core.h

475d8e0197f1bc Thinh Nguyen         2018-11-08  1184  
b53c772d16a975 Felipe Balbi         2011-08-30  1185  	enum dwc3_ep0_next	ep0_next_event;
72246da40f3719 Felipe Balbi         2011-08-19  1186  	enum dwc3_ep0_state	ep0state;
72246da40f3719 Felipe Balbi         2011-08-19  1187  	enum dwc3_link_state	link_state;
72246da40f3719 Felipe Balbi         2011-08-19  1188  
865e09e71622f9 Felipe Balbi         2012-04-24  1189  	u16			u2sel;
865e09e71622f9 Felipe Balbi         2012-04-24  1190  	u16			u2pel;
865e09e71622f9 Felipe Balbi         2012-04-24  1191  	u8			u1sel;
865e09e71622f9 Felipe Balbi         2012-04-24  1192  	u8			u1pel;
865e09e71622f9 Felipe Balbi         2012-04-24  1193  
72246da40f3719 Felipe Balbi         2011-08-19  1194  	u8			speed;
865e09e71622f9 Felipe Balbi         2012-04-24  1195  
47d3946ea220f2 Bryan O'Donoghue     2017-01-31  1196  	u8			num_eps;
789451f6c69828 Felipe Balbi         2011-05-05  1197  
a32994998c2ffa Felipe Balbi         2011-09-30  1198  	struct dwc3_hwparams	hwparams;
72246da40f3719 Felipe Balbi         2011-08-19  1199  	struct dentry		*root;
d7668024b3b5f9 Felipe Balbi         2013-01-18  1200  	struct debugfs_regset32	*regset;
3b637367ae40b6 Gerard Cauvy         2012-02-10  1201  
62ba09d6bb6330 Thinh Nguyen         2018-11-07  1202  	u32			dbg_lsp_select;
62ba09d6bb6330 Thinh Nguyen         2018-11-07  1203  
3b637367ae40b6 Gerard Cauvy         2012-02-10  1204  	u8			test_mode;
3b637367ae40b6 Gerard Cauvy         2012-02-10  1205  	u8			test_mode_nr;
80caf7d21adca1 Huang Rui            2014-10-28  1206  	u8			lpm_nyet_threshold;
460d098cb67281 Huang Rui            2014-10-31  1207  	u8			hird_threshold;
938a5ad1d3055c Thinh Nguyen         2018-03-16  1208  	u8			rx_thr_num_pkt_prd;
938a5ad1d3055c Thinh Nguyen         2018-03-16  1209  	u8			rx_max_burst_prd;
938a5ad1d3055c Thinh Nguyen         2018-03-16  1210  	u8			tx_thr_num_pkt_prd;
938a5ad1d3055c Thinh Nguyen         2018-03-16  1211  	u8			tx_max_burst_prd;
f2b685d5aad81f Felipe Balbi         2013-12-19  1212  
3e10a2ce98d1a5 Heikki Krogerus      2015-05-13  1213  	const char		*hsphy_interface;
3e10a2ce98d1a5 Heikki Krogerus      2015-05-13  1214  
fc8bb91bc83ef8 Felipe Balbi         2016-05-16  1215  	unsigned		connected:1;
f2b685d5aad81f Felipe Balbi         2013-12-19  1216  	unsigned		delayed_status:1;
f2b685d5aad81f Felipe Balbi         2013-12-19  1217  	unsigned		ep0_bounced:1;
f2b685d5aad81f Felipe Balbi         2013-12-19  1218  	unsigned		ep0_expect_in:1;
81bc5599d66d74 Felipe Balbi         2013-12-19  1219  	unsigned		has_hibernation:1;
d64ff406e51e4f Arnd Bergmann        2016-11-17  1220  	unsigned		sysdev_is_parent:1;
80caf7d21adca1 Huang Rui            2014-10-28  1221  	unsigned		has_lpm_erratum:1;
460d098cb67281 Huang Rui            2014-10-31  1222  	unsigned		is_utmi_l1_suspend:1;
946bd579a63855 Huang Rui            2014-10-28  1223  	unsigned		is_fpga:1;
fc8bb91bc83ef8 Felipe Balbi         2016-05-16  1224  	unsigned		pending_events:1;
f2b685d5aad81f Felipe Balbi         2013-12-19  1225  	unsigned		pullups_connected:1;
f2b685d5aad81f Felipe Balbi         2013-12-19  1226  	unsigned		setup_packet_pending:1;
f2b685d5aad81f Felipe Balbi         2013-12-19  1227  	unsigned		three_stage_setup:1;
d92021f66063b3 Thinh Nguyen         2018-11-14  1228  	unsigned		dis_start_transfer_quirk:1;
eac68e8f979b82 Robert Baldyga       2015-03-09  1229  	unsigned		usb3_lpm_capable:1;
022a0208c0ff03 Thinh Nguyen         2018-11-07  1230  	unsigned		usb2_lpm_disable:1;
3b81221a529c08 Huang Rui            2014-10-28  1231  
3b81221a529c08 Huang Rui            2014-10-28  1232  	unsigned		disable_scramble_quirk:1;
9a5b2f3167c1f9 Huang Rui            2014-10-28  1233  	unsigned		u2exit_lfps_quirk:1;
b5a65c406367e3 Huang Rui            2014-10-28  1234  	unsigned		u2ss_inp3_quirk:1;
df31f5b3a6d3ef Huang Rui            2014-10-28  1235  	unsigned		req_p1p2p3_quirk:1;
a2a1d0f5838d6a Huang Rui            2014-10-28  1236  	unsigned                del_p1p2p3_quirk:1;
41c06ffdf9cc63 Huang Rui            2014-10-28  1237  	unsigned		del_phy_power_chg_quirk:1;
fb67afca177a21 Huang Rui            2014-10-28  1238  	unsigned		lfps_filter_quirk:1;
14f4ac53dfb232 Huang Rui            2014-10-28  1239  	unsigned		rx_detect_poll_quirk:1;
59acfa20816420 Huang Rui            2014-10-31  1240  	unsigned		dis_u3_susphy_quirk:1;
0effe0a3e741c0 Huang Rui            2014-10-31  1241  	unsigned		dis_u2_susphy_quirk:1;
ec791d149bca45 John Youn            2015-10-02  1242  	unsigned		dis_enblslpm_quirk:1;
729dcffd1ed319 Anurag Kumar Vulisha 2019-05-10  1243  	unsigned		dis_u1_entry_quirk:1;
729dcffd1ed319 Anurag Kumar Vulisha 2019-05-10  1244  	unsigned		dis_u2_entry_quirk:1;
e58dd357741b93 Rajesh Bhagat        2016-03-14  1245  	unsigned		dis_rxdet_inp3_quirk:1;
16199f33893922 William Wu           2016-08-16  1246  	unsigned		dis_u2_freeclk_exists_quirk:1;
00fe081dc3a370 William Wu           2016-08-16  1247  	unsigned		dis_del_phy_power_chg_quirk:1;
65db7a0c981637 William Wu           2017-04-19  1248  	unsigned		dis_tx_ipgap_linecheck_quirk:1;
7ba6b09fda5e0c Neil Armstrong       2020-02-21  1249  	unsigned		parkmode_disable_ss_quirk:1;
6b6a0c9a3ffa31 Huang Rui            2014-10-31  1250  
6b6a0c9a3ffa31 Huang Rui            2014-10-31  1251  	unsigned		tx_de_emphasis_quirk:1;
6b6a0c9a3ffa31 Huang Rui            2014-10-31  1252  	unsigned		tx_de_emphasis:2;
cf40b86b6ef6df John Youn            2016-11-14  1253  
42bf02ec6e420e Roger Quadros        2017-10-31  1254  	unsigned		dis_metastability_quirk:1;
42bf02ec6e420e Roger Quadros        2017-10-31  1255  
f580170f135af1 Yu Chen              2020-09-08  1256  	unsigned		dis_split_quirk:1;
f580170f135af1 Yu Chen              2020-09-08  1257  
cf40b86b6ef6df John Youn            2016-11-14  1258  	u16			imod_interval;
72246da40f3719 Felipe Balbi         2011-08-19 @1259  };
72246da40f3719 Felipe Balbi         2011-08-19  1260  

:::::: The code at line 1259 was first introduced by commit
:::::: 72246da40f3719af3bfd104a2365b32537c27d83 usb: Introduce DesignWare USB3 DRD Driver

:::::: TO: Felipe Balbi <balbi@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
