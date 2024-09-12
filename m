Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F0F632
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 00:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726100068; cv=none; b=Ob5GDxEM4xl/lBhw9wtZLV8qkasq5hlF12M0DN8rCIftoa9/GGFeNCv8aQR6aDDUBTHhlIG0iuJbVSaRt6PMGOmD7rxbP0ZPK4vUIq5UMaGG38UvBrv32ukmIhBShYJqC007j0gaxW8eSjVchXZ93iIwGpMUuCKYahDciiuTNZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726100068; c=relaxed/simple;
	bh=GXtahGSAGFMqn7ratG8uptvqwK3UD0jyUWhzmNtTueE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lQvUw7xSdEwyrKscDarofSAPq7k/QYzkUl8rirlHMs2TaZvA98bo8sFk2VmhmVu5xahKRNT257IQjqIM0oxURenF9PK1F/zR1BJnuF/np/FN19ZMKxytMU5Mk/mDAtJ+mO7pcYGM/Lw+8msj7RNTd8YVRYYDWJa/Mve9UlGDeJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzx6MmW0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzx6MmW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726100066; x=1757636066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GXtahGSAGFMqn7ratG8uptvqwK3UD0jyUWhzmNtTueE=;
  b=hzx6MmW0kAcBUQ9JWXDEN6nmkySDK5NwSwhmnB9GSfcBXLfA9aLYKqRz
   XZndLweYEnZEAwgsVa9lHPFkIwPFFz0slw4rx1GnFQ8A0WuvyPcukCxSx
   5p8J/peTx4U471mStExFQlx/AMy9H4KdZbTatuq+EvIzL6V8mj1oFdlEd
   nuGM87jV+5FvYl+ech0xNA620A0zk8A8GEOsyZjvE1KEjbPrcay6iq2fM
   9n4JA8U8qkSZasiY/2wLKtKYFCrPOrIPT7LZIf5nbXjd6I9c02zjYSUHs
   diPx7Fw9A13e6o2wzvoa0fq/r8ytMfQJMAKPBUlhvCrGOAElm43W6NN1N
   A==;
X-CSE-ConnectionGUID: RKPzeQfXTWGntRzVvqaQ+A==
X-CSE-MsgGUID: EIlsm4cOS0mrz3FRgdff5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28818174"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="28818174"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 17:14:23 -0700
X-CSE-ConnectionGUID: Yp6pNO2vSZGqtfLa/voBiQ==
X-CSE-MsgGUID: vKv5uOAOSpqzrpJhLerG+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="104990687"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Sep 2024 17:14:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soXTY-0004Iz-04;
	Thu, 12 Sep 2024 00:14:20 +0000
Date: Thu, 12 Sep 2024 08:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hao Chen <chenhao418@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29992/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5484:43: warning:
 implicit conversion from 'enum hclge_ext_opcode_type' to 'enum
 hclge_opcode_type'
Message-ID: <202409120826.KCXBqer1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e23f76121de26a57b9f398c8b1ce5405a88acd8a
commit: 5008e61d36701b7908e5edae1dee581a40af6312 [29992/30000] net: hns3:support enable or disable pfc strom prevent
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240912/202409120826.KCXBqer1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120826.KCXBqer1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120826.KCXBqer1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_reset_event':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:4562:46: warning: implicit conversion from 'enum hnae3_reset_type' to 'enum hnae3_event_type_custom' [-Wenum-conversion]
    4562 |         ret = hclge_ext_call_event(hdev, hdev->reset_level);
         |                                          ~~~~^~~~~~~~~~~~~
   In file included from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:23:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_get_pfc_storm_prevent':
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5484:43: warning: implicit conversion from 'enum hclge_ext_opcode_type' to 'enum hclge_opcode_type' [-Wenum-conversion]
    5484 |         hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_CFG_PAUSE_STORM_PARA, true);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_cmd.h:24:47: note: in definition of macro 'hclge_cmd_setup_basic_desc'
      24 |         hclge_comm_cmd_setup_basic_desc(desc, opcode, is_read)
         |                                               ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_enable_pfc_storm_prevent':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5525:43: warning: implicit conversion from 'enum hclge_ext_opcode_type' to 'enum hclge_opcode_type' [-Wenum-conversion]
    5525 |         hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_CFG_PAUSE_STORM_PARA,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_cmd.h:24:47: note: in definition of macro 'hclge_cmd_setup_basic_desc'
      24 |         hclge_comm_cmd_setup_basic_desc(desc, opcode, is_read)
         |                                               ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_set_vport_mtu':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11407:30: warning: unused variable 'ae_dev' [-Wunused-variable]
   11407 |         struct hnae3_ae_dev *ae_dev = pci_get_drvdata(vport->nic.pdev);
         |                              ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_get_strings':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:634:50: warning: '%s' directive output may be truncated writing up to 4895 bytes into a region of size 32 [-Wformat-truncation=]
     634 |                 snprintf(buff, ETH_GSTRING_LEN, "%s", strs[i].desc);
         |                                                  ^~
   In function 'hclge_comm_get_strings',
       inlined from 'hclge_get_strings' at drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:750:7:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:634:17: note: 'snprintf' output between 1 and 4896 bytes into a destination of size 32
     634 |                 snprintf(buff, ETH_GSTRING_LEN, "%s", strs[i].desc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +5484 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c

  5476	
  5477	static int
  5478	hclge_get_pfc_storm_prevent(struct hclge_dev *hdev, int dir, bool *enable)
  5479	{
  5480		struct hclge_pfc_storm_para_cmd *para_cmd;
  5481		struct hclge_desc desc;
  5482		int ret;
  5483	
> 5484		hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_CFG_PAUSE_STORM_PARA, true);
  5485		para_cmd = (struct hclge_pfc_storm_para_cmd *)desc.data;
  5486		para_cmd->dir = cpu_to_le32(dir);
  5487		ret = hclge_cmd_send(&hdev->hw, &desc, 1);
  5488		if (ret)
  5489			return ret;
  5490	
  5491		*enable = !!le32_to_cpu(para_cmd->enable);
  5492		return 0;
  5493	}
  5494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
