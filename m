Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB3226281
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 06:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718692301; cv=none; b=uY1bj5B8BeqQYGeCFNyXnSOND+hmS3s1sU+HYeVqaIJ/yDQl64i1toY+4gNDjhxgeCWzHiDFIxaH5+fP0pyKBjLABDRzqVh0+WfFX/G6Q0Cv0AfIfvVa6zxFnZs3GMrNTJBFfbw/eNRPHpi6POOk6e0+ufX2UOs3fa3Tx+inexo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718692301; c=relaxed/simple;
	bh=3Tyn/sTcOWNKBWlMHNIIuXoo7Qv3nOPz4A/+pMczxiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTvkXXB5Cjg4Yf9XUOjQQlmS5Ie4Up/XjOwCSQxnaO8xYgLKhE7z0eytujG0MmxDPB6aPtacdxb428cyi2ZgNabywQujG/h1Ktq5DDjdgUm0zK8ay6nS+arWBSChSL7L6eXWzSWQujeweA0nZp/UKdKjMnZc/YNe3l8IVaKvugM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuWJAE5N; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuWJAE5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718692299; x=1750228299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Tyn/sTcOWNKBWlMHNIIuXoo7Qv3nOPz4A/+pMczxiQ=;
  b=nuWJAE5NPK+PX7wx8V3nEMNKHbhBlsjPPn4r3FrLUvietdwlKM6NZAkK
   omdxpP5X8PaoSQKOudTpSwRzzPZf4cEWESvmt2gBuJuHLPQtN6oFcUKJm
   39CB1muk0ztlm4vZx47snGxznXRMMK6j9bkwlC0NmLO8piM843UDrYylx
   VHVFlJQMBM6f2xOOVR3Zne8fe4K+X/0lDDE7nBzg7TzahrvVFpMJGFou5
   BpBfYNsepnGvX6NCSCJVC1u2yVMRu1GJ07p08MrlSv0bQnW/PVG8Cnxhs
   WIaVxsCJoTq8j+MM6q4vtynMfPIX2kNkUwfeFbjWE0U7scBUfwLf9f55C
   g==;
X-CSE-ConnectionGUID: AMOK4mesSHexdZyoDOb0+g==
X-CSE-MsgGUID: PF5lEpWiRd2UIwEzfGje/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15419528"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15419528"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 23:31:38 -0700
X-CSE-ConnectionGUID: aeGMGu2cR6KkN5mAOL8wDQ==
X-CSE-MsgGUID: Kwn8ahaRRnSwXjOOAWjz7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="42144587"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jun 2024 23:31:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJSNS-0005Gt-1m;
	Tue, 18 Jun 2024 06:31:34 +0000
Date: Tue, 18 Jun 2024 14:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11555/22961]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:39:30: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202406181426.ygyn6idN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   74cd1e5b892070aee2e2ce11eae993856552e98c
commit: 8ad07513042c8fef5a03b404f0bbf066f603c101 [11555/22961] net: hns3: place dcqcn implementations in an ind file
config: arm64-randconfig-r111-20240615 (https://download.01.org/0day-ci/archive/20240618/202406181426.ygyn6idN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240618/202406181426.ygyn6idN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406181426.ygyn6idN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:39:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:39:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:39:30: sparse:     got unsigned int [usertype]
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:42:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:42:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:42:22: sparse:     got unsigned int
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:43:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:43:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:43:22: sparse:     got int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:44:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:44:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:44:22: sparse:     got int
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:53:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:53:23: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:53:23: sparse:     got restricted __le32
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:255:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dcqcn_rx_cnt @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:255:42: sparse:     expected unsigned int [usertype] dcqcn_rx_cnt
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:255:42: sparse:     got restricted __le32
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:256:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dcqcn_tx_cnt @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:256:42: sparse:     expected unsigned int [usertype] dcqcn_tx_cnt
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:256:42: sparse:     got restricted __le32
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:257:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dcqcn_db_cnt @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:257:42: sparse:     expected unsigned int [usertype] dcqcn_db_cnt
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:257:42: sparse:     got restricted __le32

vim +39 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c

    15	
    16	static int hns3_dcqcn_rw(struct hns3_nic_priv *net_priv,
    17				 u32 offset, u32 *data, u32 rw_type)
    18	{
    19		struct hnae3_handle *h = net_priv->ae_handle;
    20		struct hclge_vport *vport;
    21		struct hclge_dev *hdev;
    22		struct hclge_desc desc;
    23		int ret;
    24	
    25		if (!data)
    26			return -EFAULT;
    27	
    28		vport = container_of(h, struct hclge_vport, nic);
    29		hdev = vport->back;
    30	
    31		if (rw_type == DEVMEM_CFG_READ) {
    32			hns3_cae_cmd_setup_basic_desc(&desc,
    33						      HCLGE_OPC_DCQCN_TEMPLATE_CFG,
    34						      true);
    35		} else {
    36			hns3_cae_cmd_setup_basic_desc(&desc,
    37						      HCLGE_OPC_DCQCN_TEMPLATE_CFG,
    38						      false);
  > 39			desc.data[2] = *data;
    40		}
    41	
  > 42		desc.data[0] = SCC_TEMP_LOW_ADDR + offset;
  > 43		desc.data[1] = SCC_TEMP_HIGH_ADDR;
    44		desc.data[4] = 32;
    45	
    46		ret = hns3_cae_cmd_send(hdev, &desc, 1);
    47		if (ret) {
    48			dev_err(&hdev->pdev->dev, "disable net lane failed %d\n", ret);
    49			return ret;
    50		}
    51	
    52		if (rw_type == DEVMEM_CFG_READ)
  > 53			*data = desc.data[2];
    54	
    55		return 0;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
