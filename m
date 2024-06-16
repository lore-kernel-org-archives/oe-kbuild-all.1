Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D2B6D1C1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 22:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718576814; cv=none; b=DdDEjeRn43HEUv1bL9xhOBEzOSEE6ncfrxIXwcrXJugYZHduBLKFWSqNDNm/9Lux7oO2cMc8UXc6n4MRYMvIwHk4ct8tXkcyvIey14wSg6vYXWVbfyXnDQQ36MA1lHq9hnNINAowBAFkv+rH/YIzdoQhvQVVC/Z7avmcoX52w3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718576814; c=relaxed/simple;
	bh=EYBJvGpzcVa6UGTRDgLF64YGZ5t6c8xuKNP09BvKeh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IW/kydUKelv1xzx3JLsvW/7UZPM8jrghv/PltvHha2DZDKO9M47vUcm+Fznrn0YCxriNhvrqn0qjE2+JAaIWW/jsBlg53xJCFD62dYh12rUWmlVNsYfqvuube3Wx5wiJbfp0fx7C/ti0pnwS7iFQd0TtrTj4FpqBsGsUJ9q6TRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jt4jSh6W; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jt4jSh6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718576811; x=1750112811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EYBJvGpzcVa6UGTRDgLF64YGZ5t6c8xuKNP09BvKeh0=;
  b=Jt4jSh6WThjhxEPEClM4wCz14FMULQP4pZgtIWi32OOQpkObwzcW7wmz
   l/doinImmuCjQt5EwAcskgNvU8+wo6eDtQoZaK6/FNhJlI8P7MVZ3mf9o
   teoJDYDxqu/Nt45cOM2C2yqBruKG+PmzrhBxifbQfwvsWdHZxpUnH8wMJ
   OBtMby1ApUUvbgHloSmZY0YGuX7x4JR4kfxKqJ+1XkxMrtg7cl55sUEej
   olN2RHypHUbFdYskV2QLy9vaSoKoUosLhHMSpfqTv+6ISDs4A5n57jVzV
   A0h9a/xEqMA+Nl30a3H6BX1ubSeBwCGNiBhUjIJI/ASxAIfFYpqomonBq
   w==;
X-CSE-ConnectionGUID: orNblk3WT5irif5EKL99Pg==
X-CSE-MsgGUID: dPl3bRUMTZKbbt86Vr3csA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15547615"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="15547615"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 15:26:51 -0700
X-CSE-ConnectionGUID: fkaOuBFlRX+cNaXry37LSg==
X-CSE-MsgGUID: IFM/kPTySI6xXTeichD0iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="41170019"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2024 15:26:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIyKl-0003P3-2F;
	Sun, 16 Jun 2024 22:26:47 +0000
Date: Mon, 17 Jun 2024 06:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11555/22937]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.c:39:30: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202406170627.RHMdP5Jc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   745a3c567e1c329d131a8896642475f3916d020a
commit: 8ad07513042c8fef5a03b404f0bbf066f603c101 [11555/22937] net: hns3: place dcqcn implementations in an ind file
config: arm64-randconfig-r111-20240615 (https://download.01.org/0day-ci/archive/20240617/202406170627.RHMdP5Jc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240617/202406170627.RHMdP5Jc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170627.RHMdP5Jc-lkp@intel.com/

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
