Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3674113AA2B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 20:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729716859; cv=none; b=bPvgW1B2MnqxftlsvPIycLMjA2BcMB+conf7H9lQIN5Qkgelewe7+jZJDa/3Ww3CGk3ldPtEF6Fi7hk7Ry/fsLEe2Q6alh8gFgVdAJONECsKMPPkcEtNTvWLun7wp43RFRGcTZWZOdc5OkV/MI7mghyzsqJ9JvTASAkHmjfzzCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729716859; c=relaxed/simple;
	bh=W4YzhFK1Av6LmMfuQvFPl4iIpOl2UiEbxEMPC2Q0tDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A8HdIQAhL/GtSqD5g5MLxyf8OVIWo9WFCkaMl53B5V/YdotNTMWsCZHdDViUD0Zr0J4pckxCAwigUpbDul2UeADhowrFk7836BzK85myMO9Py7ydbV0H50kIghP+Txwf/M+TdjparBG+JRUTR1t6ZLKaaX2+wT49PQHCAjsdmE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPspkYZn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPspkYZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729716857; x=1761252857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W4YzhFK1Av6LmMfuQvFPl4iIpOl2UiEbxEMPC2Q0tDg=;
  b=nPspkYZnZfkbnP/Hr3koG65ubcVOwHjsZhp7VNLXbmoYzyp1x65AHX7/
   +2IQMJWEhYZuR6ve0/Y8oCXy6Kk1lmUtk0z75vWoR6KbmhXx69ft4iIYu
   E2hEct3mocCxdDasDeBuJN95i2whzI6wwIrS/s3Wx8oE5N69GTOdrBXqQ
   2hdSc9PI/Zb4Ur9Wdn+Y7V/zQtQHpjGi2Oa6F9ZiNkxiswFj8DFQ1F70c
   LIELBJO0bpekUbY3iQnKSsJQqf++6BqpszxZqF8XDjph96DIysGn4gunb
   GRDxa82M0r86xe3aS8+0vg66mi3eCG5wBx2y1h4awRhIrSTvmYcCh0chx
   w==;
X-CSE-ConnectionGUID: g6rGMSGdRia24hpOinTuwA==
X-CSE-MsgGUID: IpFPG6c8QI2qeu0glGC8lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29489444"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29489444"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 13:54:17 -0700
X-CSE-ConnectionGUID: lsgeIvwXQjyA5GngevnSmA==
X-CSE-MsgGUID: M3231IwfTDi6BOm3EaJf7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80691795"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Oct 2024 13:54:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3iMs-000VYQ-31;
	Wed, 23 Oct 2024 20:54:10 +0000
Date: Thu, 24 Oct 2024 04:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6945/13046]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:721:43: warning:
 'hclge_dbg_tqp_reg' defined but not used
Message-ID: <202410240416.BVbVUSco-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 80e44dd85d0746f2749a9fec5466eb9a4f2a1d9a [6945/13046] net: hns3: dump more reg info based on ras mod
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241024/202410240416.BVbVUSco-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240416.BVbVUSco-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240416.BVbVUSco-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.h:8,
                    from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:26:
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
