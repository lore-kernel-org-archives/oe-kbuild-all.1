Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7B117837F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 21:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718745206; cv=none; b=Dt4IBUh2iqiH/aDelm/AEQZQXSxRB/ZckA4voQzqplXUaQXlzsROaQb9E8T1/pJZZ2gWpkWmIYOMcYVYc14PkQEIuj16FuzWG8sPhIGB8xcdMTJygvUI/vY4ars/ugJPqz/ul+yJ7M7y9sbbEHb9pz+WCO40McvUrMVggV+kM94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718745206; c=relaxed/simple;
	bh=hOdku8v75xRZNO6UfgcyAx7BFqPEDs/H2c0zdIUUCPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TnjjJh/jc+N8z86+ryE1CtsQaPMzg54Q/UrQaXCBIwP6PFPgJ3a8IjrZotYlG9tmZQfCDgm5skpex8143Yq1/4qZ4fnAHfHn+KlbkvSVot3xWWgqY7u45U8QDkXhjnKGH9hfQASGEUI2Yb06r0v1H4ckd/JQo1H8gYjgUBZahgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQ6+xP0g; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQ6+xP0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718745204; x=1750281204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hOdku8v75xRZNO6UfgcyAx7BFqPEDs/H2c0zdIUUCPo=;
  b=GQ6+xP0g65yK8fv/C7mSmYjRrqptC6q/QquuJ3EnteVSFMrEcGsi/exr
   8WmUKNa/yLukO2LJrSAkdB96NMkFM4ywqY808POEFSrVCeQdq6w01pHwt
   bxIaMb/VRCIMsjofrCWhru9kKnuvDS4jRWe1+GW/iVsJtbCuv5GbLuzYs
   IjxyV6IbIwW8CbXteeqDYkJzYJNI2W7SxuxYnvS4bqVY3zWHVo+W3W7TA
   S9/gls41fwrQ9oy2O2qiG95vc/Xk1I/6WLbt4Y09rWIjiXWmSb20tuPBo
   Ce+qQfPqk9F9yOMot0qpzz7WquXVDU4TBajf8u+vutxacnDLsTRivwJ4M
   A==;
X-CSE-ConnectionGUID: 1M8iamw1QrOMzWGor+Kz0g==
X-CSE-MsgGUID: eJv7dLRBRgmHHz1+K5kZWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26337704"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="26337704"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 14:13:23 -0700
X-CSE-ConnectionGUID: njq97tZPT1+5VIBXK/ibeg==
X-CSE-MsgGUID: rftHeeCBT5OvmrbtZ0y7ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="46064710"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jun 2024 14:13:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJg8m-0005vR-0H;
	Tue, 18 Jun 2024 21:13:20 +0000
Date: Wed, 19 Jun 2024 05:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11568/22966]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_led.c:37:39: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202406190521.KlNZgJpz-lkp@intel.com>
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
commit: eb3a8c90a2b27a2f2dbe26e8a2e7edff6b61417c [11568/22966] net: HNS3: Increase the dft for the command of led
config: arm64-randconfig-r111-20240615 (https://download.01.org/0day-ci/archive/20240619/202406190521.KlNZgJpz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240619/202406190521.KlNZgJpz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190521.KlNZgJpz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_led.c:37:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_led.c:37:39: sparse:     expected unsigned int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_led.c:37:39: sparse:     got restricted __le32

vim +37 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_led.c

    10	
    11	int hns3_led_cfg_ncl_info(struct hns3_nic_priv *net_priv, void *buf_in,
    12				  u32 in_size, void *buf_out, u32 out_size)
    13	{
    14		struct hnae3_handle *handle = hns3_get_handle(net_priv->netdev);
    15		struct hclge_vport *vport = hns3_cae_get_vport(handle);
    16		struct led_statistic_param *parm_out = buf_out;
    17		struct hclge_dev *hdev = vport->back;
    18		struct hclge_desc desc = {0};
    19		bool check;
    20		int index;
    21		int ret;
    22	
    23		check = !buf_out || out_size < sizeof(struct led_statistic_param);
    24		if (check) {
    25			pr_err("input param buf_out error in %s function\n", __func__);
    26			return -EFAULT;
    27		}
    28	
    29		hns3_cae_cmd_setup_basic_desc(&desc, HCLGE_OPC_LED_CFG_NCL_INFO, true);
    30		ret = hns3_cae_cmd_send(hdev, &desc, 1);
    31		if (ret) {
    32			dev_err(&hdev->pdev->dev, "send led command failed %d\n", ret);
    33			return ret;
    34		}
    35	
    36		for (index = 0; index < HCLGE_DESC_DATA_LEN; index++)
  > 37			parm_out->data[index] = desc.data[index];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
