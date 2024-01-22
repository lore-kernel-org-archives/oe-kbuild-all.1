Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0D93CF63
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705929963; cv=none; b=brwVAOeADatQ6yo2NWCtp1fwiXmSa4cRClET8rpwxStny2zRj+oo0S5/xShd7pSj/P6CQmk9FateMwga7HAMMK2NXSUH8VWLkGFXB5MaqZLS5snvcs4leDBptFcTA67BYA00t2FVycANenQLE6rPIT0OXESVe7VnXQaOsfCGVj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705929963; c=relaxed/simple;
	bh=DDB5rD5DUmoqOGcTZzaieay6ZfWmIdm+rrhBWABa838=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZk9HBB2GO7MQuuxC3NWz5bmn7y8q/Uh+oQbXmZlbMigB7B6SDUssQ9FYqG048wyLlFjgmGdezOZit6V2i7zpLn1AJMoghwXHS49KFKlgyy/ZeiHWsFGmV3yFFCH5nuaKMxN5N4nx3+LJEerHjP4RgY5Kd0s4Db370Q+6c4F2S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHdtweQf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHdtweQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705929961; x=1737465961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DDB5rD5DUmoqOGcTZzaieay6ZfWmIdm+rrhBWABa838=;
  b=NHdtweQfJRtxmixQ1Y6UP1OMeTLbRtnhael/eZgz2MLQtj2HRVAaicsj
   0hOEQE24Wp9+84I8btLTXkXVGHLkrmPtpn5nWHk1iwfqQImBQM3Cd0Eg6
   SkUoon6cV1LY6saw4mWDps+3J46QR8FtIKLebnPNq5EAgUGMdsfqPf3nx
   iOl1Gax8EjygTPX6mkLIk2HA7fyfFm8iyo8S08//LDAbcLd1WB8FYU0HU
   G32V71SYgIICG28vEf4qUNP13tuLrWztV5enp7cWnHDQSf1txY8FdNS04
   CTMQIvL9y3F7FEW78DVQb/+cpagkObnlP7Jy43k1AfLzHaw0+AOAhD4v8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22683938"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="22683938"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 05:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="34038079"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Jan 2024 05:25:55 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRuJD-0006cm-26;
	Mon, 22 Jan 2024 13:25:51 +0000
Date: Mon, 22 Jan 2024 21:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26784/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:721:43: warning:
 'hclge_dbg_tqp_reg' defined but not used
Message-ID: <202401222119.vrDbjHb2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5b9222cde1b41a53fc814d98cd15aea84832aca3
commit: 193e5e1d2edcd566ccf9d920354ac22c3241434e [26784/30000] UNIC: add nfe ras for PFA and TXPM module
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240122/202401222119.vrDbjHb2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401222119.vrDbjHb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401222119.vrDbjHb2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_udma.c:19:
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:721:43: warning: 'hclge_dbg_tqp_reg' defined but not used [-Wunused-const-variable=]
     721 | static const struct hclge_dbg_dfx_message hclge_dbg_tqp_reg[] = {
         |                                           ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:649:43: warning: 'hclge_dbg_rcb_reg' defined but not used [-Wunused-const-variable=]
     649 | static const struct hclge_dbg_dfx_message hclge_dbg_rcb_reg[] = {
         |                                           ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:493:43: warning: 'hclge_dbg_ppp_reg' defined but not used [-Wunused-const-variable=]
     493 | static const struct hclge_dbg_dfx_message hclge_dbg_ppp_reg[] = {
         |                                           ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:463:43: warning: 'hclge_dbg_rtc_reg' defined but not used [-Wunused-const-variable=]
     463 | static const struct hclge_dbg_dfx_message hclge_dbg_rtc_reg[] = {
         |                                           ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:391:43: warning: 'hclge_dbg_ncsi_reg' defined but not used [-Wunused-const-variable=]
     391 | static const struct hclge_dbg_dfx_message hclge_dbg_ncsi_reg[] = {
         |                                           ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:375:43: warning: 'hclge_dbg_rpu_reg_1' defined but not used [-Wunused-const-variable=]
     375 | static const struct hclge_dbg_dfx_message hclge_dbg_rpu_reg_1[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:366:43: warning: 'hclge_dbg_rpu_reg_0' defined but not used [-Wunused-const-variable=]
     366 | static const struct hclge_dbg_dfx_message hclge_dbg_rpu_reg_0[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:301:43: warning: 'hclge_dbg_igu_egu_reg' defined but not used [-Wunused-const-variable=]
     301 | static const struct hclge_dbg_dfx_message hclge_dbg_igu_egu_reg[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:292:43: warning: 'hclge_dbg_ssu_reg_2' defined but not used [-Wunused-const-variable=]
     292 | static const struct hclge_dbg_dfx_message hclge_dbg_ssu_reg_2[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:185:43: warning: 'hclge_dbg_ssu_reg_1' defined but not used [-Wunused-const-variable=]
     185 | static const struct hclge_dbg_dfx_message hclge_dbg_ssu_reg_1[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:113:43: warning: 'hclge_dbg_ssu_reg_0' defined but not used [-Wunused-const-variable=]
     113 | static const struct hclge_dbg_dfx_message hclge_dbg_ssu_reg_0[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:97:43: warning: 'hclge_dbg_bios_common_reg' defined but not used [-Wunused-const-variable=]
      97 | static const struct hclge_dbg_dfx_message hclge_dbg_bios_common_reg[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hclge_dbg_tqp_reg +721 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h

27cf979a15841e liuzhongzhu      2018-12-15  648  
e4b9146849f246 Rikard Falkeborn 2020-09-22 @649  static const struct hclge_dbg_dfx_message hclge_dbg_rcb_reg[] = {
27cf979a15841e liuzhongzhu      2018-12-15  650  	{false, "Reserved"},
27cf979a15841e liuzhongzhu      2018-12-15  651  	{true,	"FSM_DFX_ST0"},
27cf979a15841e liuzhongzhu      2018-12-15  652  	{true,	"FSM_DFX_ST1"},
27cf979a15841e liuzhongzhu      2018-12-15  653  	{true,	"FSM_DFX_ST2"},
27cf979a15841e liuzhongzhu      2018-12-15  654  	{true,	"FIFO_DFX_ST0"},
27cf979a15841e liuzhongzhu      2018-12-15  655  	{true,	"FIFO_DFX_ST1"},
27cf979a15841e liuzhongzhu      2018-12-15  656  
27cf979a15841e liuzhongzhu      2018-12-15  657  	{true,	"FIFO_DFX_ST2"},
27cf979a15841e liuzhongzhu      2018-12-15  658  	{true,	"FIFO_DFX_ST3"},
27cf979a15841e liuzhongzhu      2018-12-15  659  	{true,	"FIFO_DFX_ST4"},
27cf979a15841e liuzhongzhu      2018-12-15  660  	{true,	"FIFO_DFX_ST5"},
27cf979a15841e liuzhongzhu      2018-12-15  661  	{true,	"FIFO_DFX_ST6"},
27cf979a15841e liuzhongzhu      2018-12-15  662  	{true,	"FIFO_DFX_ST7"},
27cf979a15841e liuzhongzhu      2018-12-15  663  
27cf979a15841e liuzhongzhu      2018-12-15  664  	{true,	"FIFO_DFX_ST8"},
27cf979a15841e liuzhongzhu      2018-12-15  665  	{true,	"FIFO_DFX_ST9"},
27cf979a15841e liuzhongzhu      2018-12-15  666  	{true,	"FIFO_DFX_ST10"},
27cf979a15841e liuzhongzhu      2018-12-15  667  	{true,	"FIFO_DFX_ST11"},
27cf979a15841e liuzhongzhu      2018-12-15  668  	{true,	"Q_CREDIT_VLD_0"},
27cf979a15841e liuzhongzhu      2018-12-15  669  	{true,	"Q_CREDIT_VLD_1"},
27cf979a15841e liuzhongzhu      2018-12-15  670  
27cf979a15841e liuzhongzhu      2018-12-15  671  	{true,	"Q_CREDIT_VLD_2"},
27cf979a15841e liuzhongzhu      2018-12-15  672  	{true,	"Q_CREDIT_VLD_3"},
27cf979a15841e liuzhongzhu      2018-12-15  673  	{true,	"Q_CREDIT_VLD_4"},
27cf979a15841e liuzhongzhu      2018-12-15  674  	{true,	"Q_CREDIT_VLD_5"},
27cf979a15841e liuzhongzhu      2018-12-15  675  	{true,	"Q_CREDIT_VLD_6"},
27cf979a15841e liuzhongzhu      2018-12-15  676  	{true,	"Q_CREDIT_VLD_7"},
27cf979a15841e liuzhongzhu      2018-12-15  677  
27cf979a15841e liuzhongzhu      2018-12-15  678  	{true,	"Q_CREDIT_VLD_8"},
27cf979a15841e liuzhongzhu      2018-12-15  679  	{true,	"Q_CREDIT_VLD_9"},
27cf979a15841e liuzhongzhu      2018-12-15  680  	{true,	"Q_CREDIT_VLD_10"},
27cf979a15841e liuzhongzhu      2018-12-15  681  	{true,	"Q_CREDIT_VLD_11"},
27cf979a15841e liuzhongzhu      2018-12-15  682  	{true,	"Q_CREDIT_VLD_12"},
27cf979a15841e liuzhongzhu      2018-12-15  683  	{true,	"Q_CREDIT_VLD_13"},
27cf979a15841e liuzhongzhu      2018-12-15  684  
27cf979a15841e liuzhongzhu      2018-12-15  685  	{true,	"Q_CREDIT_VLD_14"},
27cf979a15841e liuzhongzhu      2018-12-15  686  	{true,	"Q_CREDIT_VLD_15"},
27cf979a15841e liuzhongzhu      2018-12-15  687  	{true,	"Q_CREDIT_VLD_16"},
27cf979a15841e liuzhongzhu      2018-12-15  688  	{true,	"Q_CREDIT_VLD_17"},
27cf979a15841e liuzhongzhu      2018-12-15  689  	{true,	"Q_CREDIT_VLD_18"},
27cf979a15841e liuzhongzhu      2018-12-15  690  	{true,	"Q_CREDIT_VLD_19"},
27cf979a15841e liuzhongzhu      2018-12-15  691  
27cf979a15841e liuzhongzhu      2018-12-15  692  	{true,	"Q_CREDIT_VLD_20"},
27cf979a15841e liuzhongzhu      2018-12-15  693  	{true,	"Q_CREDIT_VLD_21"},
27cf979a15841e liuzhongzhu      2018-12-15  694  	{true,	"Q_CREDIT_VLD_22"},
27cf979a15841e liuzhongzhu      2018-12-15  695  	{true,	"Q_CREDIT_VLD_23"},
27cf979a15841e liuzhongzhu      2018-12-15  696  	{true,	"Q_CREDIT_VLD_24"},
27cf979a15841e liuzhongzhu      2018-12-15  697  	{true,	"Q_CREDIT_VLD_25"},
27cf979a15841e liuzhongzhu      2018-12-15  698  
27cf979a15841e liuzhongzhu      2018-12-15  699  	{true,	"Q_CREDIT_VLD_26"},
27cf979a15841e liuzhongzhu      2018-12-15  700  	{true,	"Q_CREDIT_VLD_27"},
27cf979a15841e liuzhongzhu      2018-12-15  701  	{true,	"Q_CREDIT_VLD_28"},
27cf979a15841e liuzhongzhu      2018-12-15  702  	{true,	"Q_CREDIT_VLD_29"},
27cf979a15841e liuzhongzhu      2018-12-15  703  	{true,	"Q_CREDIT_VLD_30"},
27cf979a15841e liuzhongzhu      2018-12-15  704  	{true,	"Q_CREDIT_VLD_31"},
27cf979a15841e liuzhongzhu      2018-12-15  705  
27cf979a15841e liuzhongzhu      2018-12-15  706  	{true,	"GRO_BD_SERR_CNT"},
27cf979a15841e liuzhongzhu      2018-12-15  707  	{true,	"GRO_CONTEXT_SERR_CNT"},
27cf979a15841e liuzhongzhu      2018-12-15  708  	{true,	"RX_STASH_CFG_SERR_CNT"},
27cf979a15841e liuzhongzhu      2018-12-15  709  	{true,	"AXI_RD_FBD_SERR_CNT"},
27cf979a15841e liuzhongzhu      2018-12-15  710  	{true,	"GRO_BD_MERR_CNT"},
27cf979a15841e liuzhongzhu      2018-12-15  711  	{true,	"GRO_CONTEXT_MERR_CNT"},
27cf979a15841e liuzhongzhu      2018-12-15  712  
27cf979a15841e liuzhongzhu      2018-12-15  713  	{true,	"RX_STASH_CFG_MERR_CNT"},
27cf979a15841e liuzhongzhu      2018-12-15  714  	{true,	"AXI_RD_FBD_MERR_CNT"},
27cf979a15841e liuzhongzhu      2018-12-15  715  	{false, "Reserved"},
27cf979a15841e liuzhongzhu      2018-12-15  716  	{false, "Reserved"},
27cf979a15841e liuzhongzhu      2018-12-15  717  	{false, "Reserved"},
27cf979a15841e liuzhongzhu      2018-12-15  718  	{false, "Reserved"},
27cf979a15841e liuzhongzhu      2018-12-15  719  };
27cf979a15841e liuzhongzhu      2018-12-15  720  
e4b9146849f246 Rikard Falkeborn 2020-09-22 @721  static const struct hclge_dbg_dfx_message hclge_dbg_tqp_reg[] = {
27cf979a15841e liuzhongzhu      2018-12-15  722  	{true, "q_num"},
27cf979a15841e liuzhongzhu      2018-12-15  723  	{true, "RCB_CFG_RX_RING_TAIL"},
27cf979a15841e liuzhongzhu      2018-12-15  724  	{true, "RCB_CFG_RX_RING_HEAD"},
27cf979a15841e liuzhongzhu      2018-12-15  725  	{true, "RCB_CFG_RX_RING_FBDNUM"},
27cf979a15841e liuzhongzhu      2018-12-15  726  	{true, "RCB_CFG_RX_RING_OFFSET"},
27cf979a15841e liuzhongzhu      2018-12-15  727  	{true, "RCB_CFG_RX_RING_FBDOFFSET"},
27cf979a15841e liuzhongzhu      2018-12-15  728  
27cf979a15841e liuzhongzhu      2018-12-15  729  	{true, "RCB_CFG_RX_RING_PKTNUM_RECORD"},
27cf979a15841e liuzhongzhu      2018-12-15  730  	{true, "RCB_CFG_TX_RING_TAIL"},
27cf979a15841e liuzhongzhu      2018-12-15  731  	{true, "RCB_CFG_TX_RING_HEAD"},
27cf979a15841e liuzhongzhu      2018-12-15  732  	{true, "RCB_CFG_TX_RING_FBDNUM"},
27cf979a15841e liuzhongzhu      2018-12-15  733  	{true, "RCB_CFG_TX_RING_OFFSET"},
27cf979a15841e liuzhongzhu      2018-12-15  734  	{true, "RCB_CFG_TX_RING_EBDNUM"},
27cf979a15841e liuzhongzhu      2018-12-15  735  };
27cf979a15841e liuzhongzhu      2018-12-15  736  

:::::: The code at line 721 was first introduced by commit
:::::: e4b9146849f246e77da4787657a3a95c1b6d2833 net: hns3: Constify static structs

:::::: TO: Rikard Falkeborn <rikard.falkeborn@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
