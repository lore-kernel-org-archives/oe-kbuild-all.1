Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3007356B8C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 16:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729472; cv=none; b=b0ZgSBkNd+0HqV9uBJkwdtdpxSWbHPs/WiMm5FVK/LEG817qt07JFvGJRs3mnoeVjCKm7jItTkUwKCobQOp0LtmC3z8yxb9BF2aIRRsiSIecZQGUIuAvoxuFJIBv11tCX4sC4I1+bQcdcM6cvUViM3RzEs/35d5Ubk7YvNAMsjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729472; c=relaxed/simple;
	bh=WxU9uDFWNvPVhH/pvVWRwR8P1Sa75201U4iL9JljlAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ax1JUahTA9d4gy7d2316tYIExUuvnAxr4TUHf2L2YdyRU1i454Y2B/onsc/2J3HTBGzR+bLz0asN/e4am8WIS6zj0Cl3LiSUdvW+WQTkO8qS2oqGFJbjH/XUFplx8BDAO0J48webt8QSM6weRXh2WMSR+DNf55C2CjDtZocS1S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DB5vOlzI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DB5vOlzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718729470; x=1750265470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WxU9uDFWNvPVhH/pvVWRwR8P1Sa75201U4iL9JljlAM=;
  b=DB5vOlzI/KeJ1QYObDZXxZSUHgeW/adsqV8TRdvx724ZpZgIoC8UpYft
   sydvLAVjO81mKeJcy6JM2aMmfDZVP62fPqrfHlcQyjmZABF9KUiREmiKB
   GwTGtdHwbtAAET63l63Lhu323jZ/C479pk5dSQd0nIPCXo1Negl/hKHPY
   QJCbNv7IMusCKjoTeXV903Hr0CtrxRW3b91hF2h62eTpGfyVGvfeL4kT8
   Iqxto207L4gTMEv0DRnKZLUPLZWhVsN/fekC2S0r8E9cWnAk8THBkShpt
   NdYddFVLlv63rbIe/0zBATF5Z/e+rPEoJeQzLOgV1nKPUB0GcuYBaof88
   g==;
X-CSE-ConnectionGUID: CNfg9d3PTOSmxELo1wcA0A==
X-CSE-MsgGUID: duKI7N5SQzGa94ZN+s00aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15769653"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15769653"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 09:51:10 -0700
X-CSE-ConnectionGUID: f1vQpOcOT/27k+XJyu2jkg==
X-CSE-MsgGUID: /3MrGR13Tlu0aesVi7F9rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="79083856"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jun 2024 09:51:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJc30-0005je-0Q;
	Tue, 18 Jun 2024 16:51:06 +0000
Date: Wed, 19 Jun 2024 00:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11566/22966]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:29:22:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202406190057.DrPNl3Zc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   26bfb7d9b0ef31487312e8e9e6eb097acaf5d739
commit: cf7415aa7aae0ef2c815ab271528a29a5ea68c51 [11566/22966] net: hns3: cae module now provides an independent pfc storm cfg feature
config: arm64-randconfig-r111-20240615 (https://download.01.org/0day-ci/archive/20240619/202406190057.DrPNl3Zc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240619/202406190057.DrPNl3Zc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190057.DrPNl3Zc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:29:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] dir @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:29:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:29:22: sparse:     got unsigned int [usertype] dir
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:30:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] enable @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:30:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:30:22: sparse:     got unsigned int [usertype] enable
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:31:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] period_ms @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:31:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:31:22: sparse:     got unsigned int [usertype] period_ms
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:32:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] times @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:32:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:32:22: sparse:     got unsigned int [usertype] times
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:33:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] recovery_period_ms @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:33:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:33:22: sparse:     got unsigned int [usertype] recovery_period_ms
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:74:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] dir @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:74:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:74:22: sparse:     got unsigned int [usertype] dir
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:84:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] enable @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:84:48: sparse:     expected unsigned int [usertype] enable
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:84:48: sparse:     got restricted __le32
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:85:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] period_ms @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:85:51: sparse:     expected unsigned int [usertype] period_ms
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:85:51: sparse:     got restricted __le32
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:86:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] times @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:86:47: sparse:     expected unsigned int [usertype] times
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:86:47: sparse:     got restricted __le32
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:87:60: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] recovery_period_ms @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:87:60: sparse:     expected unsigned int [usertype] recovery_period_ms
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c:87:60: sparse:     got restricted __le32

vim +29 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_pfc_storm.c

     8	
     9	static int hns3_cae_set_pfc_storm_cfg(struct hns3_nic_priv *net_priv,
    10					      void *buf_in, u32 in_size)
    11	{
    12		struct cmd_pfc_storm_param *prelude_in;
    13		struct net_device *netdev;
    14		struct hclge_vport *vport;
    15		struct hnae3_handle *h;
    16		struct hclge_dev *hdev;
    17		struct hclge_desc desc;
    18		int ret;
    19	
    20		prelude_in = (struct cmd_pfc_storm_param *)buf_in;
    21		netdev = net_priv->netdev;
    22		h = hns3_get_handle(netdev);
    23		vport = hns3_cae_get_vport(h);
    24		hdev = vport->back;
    25	
    26		hns3_cae_cmd_setup_basic_desc(&desc,
    27					      HCLGE_OPC_CFG_PAUSE_STORM_PARA,
    28					      false);
  > 29		desc.data[0] = prelude_in->pfc_storm_param_mkii.dir;
  > 30		desc.data[1] = prelude_in->pfc_storm_param_mkii.enable;
  > 31		desc.data[2] = prelude_in->pfc_storm_param_mkii.period_ms;
  > 32		desc.data[3] = prelude_in->pfc_storm_param_mkii.times;
  > 33		desc.data[4] = prelude_in->pfc_storm_param_mkii.recovery_period_ms;
    34		ret = hns3_cae_cmd_send(hdev, &desc, 1);
    35		if (ret) {
    36			dev_err(&hdev->pdev->dev, "set pfc storm para failed %d\n",
    37				ret);
    38			return ret;
    39		}
    40	
    41		return 0;
    42	}
    43	
    44	static int hns3_cae_get_pfc_storm_cfg(struct hns3_nic_priv *net_priv,
    45					      void *buf_in, u32 in_size, void *buf_out,
    46					      u32 out_size)
    47	{
    48		struct cmd_pfc_storm_param *prelude_in;
    49		struct cmd_pfc_storm_param *info_dstn;
    50		struct net_device *netdev;
    51		struct hclge_vport *vport;
    52		struct hnae3_handle *h;
    53		struct hclge_dev *hdev;
    54		struct hclge_desc desc;
    55		int check;
    56		int ret;
    57	
    58		check = !buf_out || out_size < sizeof(struct cmd_pfc_storm_param);
    59		if (check) {
    60			pr_err("input param buf_out error in %s.\n", __func__);
    61			return -EFAULT;
    62		}
    63	
    64		prelude_in = (struct cmd_pfc_storm_param *)buf_in;
    65		info_dstn = (struct cmd_pfc_storm_param *)buf_out;
    66		netdev = net_priv->netdev;
    67		h = hns3_get_handle(netdev);
    68		vport = hns3_cae_get_vport(h);
    69		hdev = vport->back;
    70	
    71		hns3_cae_cmd_setup_basic_desc(&desc,
    72					      HCLGE_OPC_CFG_PAUSE_STORM_PARA,
    73					      true);
    74		desc.data[0] = prelude_in->pfc_storm_param_mkii.dir;
    75		ret = hns3_cae_cmd_send(hdev, &desc, 1);
    76		if (ret) {
    77			dev_err(&hdev->pdev->dev, "get pfc storm para failed %d\n",
    78				ret);
    79			return ret;
    80		}
    81	
    82		info_dstn->pfc_storm_param_mkii.dir =
    83						   prelude_in->pfc_storm_param_mkii.dir;
  > 84		info_dstn->pfc_storm_param_mkii.enable = desc.data[1];
  > 85		info_dstn->pfc_storm_param_mkii.period_ms = desc.data[2];
  > 86		info_dstn->pfc_storm_param_mkii.times = desc.data[3];
  > 87		info_dstn->pfc_storm_param_mkii.recovery_period_ms = desc.data[4];
    88	
    89		return 0;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
