Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00631E529
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 08:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718784299; cv=none; b=Qg8weqUHZQ3cAITFoVazYYi+GQPI8WBZL1jp2nT4YEtVHxDlZsktql7Q7RN8SXdUdQQKsaUkHlFpklnuxB958YE9EWaos9gTYMS648FPPGypxiOw8PlQ8GVNJ9v7jD288oL2R3Up/lSWNGS8WhTGojMvav0I7/JCA3sQGo32HpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718784299; c=relaxed/simple;
	bh=tVH09/3c4hRcXVQJ8skORg3REaCw9hcygYC9Dv5xXkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eaXXsYqUMTl9no6RO+T9mo7reQ4pKMWnfT19RqEq/uRc8vU5zruDhCfrViEp7saJatZfPQk+IfMxeKq3SzE2tfUKiTfVMlYop/v/Vk4oySz0hxsj6xWlh1yMCjTS+iH8AQRvHzpY9sQ8vRVy94EsLxGhAtzNn5nOi+rkG5KnyDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEjFVh+L; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEjFVh+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718784298; x=1750320298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tVH09/3c4hRcXVQJ8skORg3REaCw9hcygYC9Dv5xXkw=;
  b=FEjFVh+LjmuRaPOI2jBQf4VMQxydB42W8UGdSHDRbidmVgjf2Rh+1ZcX
   6fkQH3fqTDjxvhGH0TiUUaj0XeqtzfnO74SwYk3k33VA55rVMz7NVIqGh
   eOfCzUJ2dWMPUCX3MRD+mZzEbZNbxr/aW6I+XffcC6No2DYC7pLvJiH4J
   KYIi9BX/mU/NPEarF+XOnBl/A0mq0Thpu7u7OoUJvS5fmNo5oY3BhZvgG
   QcKTIy4Qorz7fol618dnPS/FsuUdgSIM/lCdF8Rk3TPsV2X1/nSdMhcmm
   EDYfAVvIHJbVhWdSsFI2RW4NPWhLHueTbjP/NyhZfj5U/MpexH8hx05kX
   Q==;
X-CSE-ConnectionGUID: YPTx14fhRU66onATF2H/iQ==
X-CSE-MsgGUID: Vurzg/CKQZ+zzMvtEaXNTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26300976"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="26300976"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 01:04:57 -0700
X-CSE-ConnectionGUID: xiNf0sqmTqORKZZewJxsOA==
X-CSE-MsgGUID: DPIgDemOSDaYN2HCknHvgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="46208043"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jun 2024 01:04:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJqJJ-0006QY-2P;
	Wed, 19 Jun 2024 08:04:53 +0000
Date: Wed, 19 Jun 2024 16:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17072/22974]
 drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:148:6:
 sparse: sparse: symbol 'hclge_reset_end_it' was not declared. Should it be
 static?
Message-ID: <202406191541.MxoJ4Pzy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiaran,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   44bbb358cb1ac8a5d2c2ad270c197cc25fcc39f4
commit: acebebc63e4378ca8b17b877258b702be47ab293 [17072/22974] net: hns3: change hclge_reset_done function name
config: arm64-randconfig-r111-20240615 (https://download.01.org/0day-ci/archive/20240619/202406191541.MxoJ4Pzy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240619/202406191541.MxoJ4Pzy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191541.MxoJ4Pzy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:140:44: sparse: sparse: mixing different enum types:
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:140:44: sparse:    unsigned int enum hnae3_reset_type
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:140:44: sparse:    unsigned int enum hnae3_event_type_custom
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:97:6: sparse: sparse: symbol 'hclge_reset_event_it' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:148:6: sparse: sparse: symbol 'hclge_reset_end_it' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:181:6: sparse: sparse: symbol 'hclge_ext_init' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:186:6: sparse: sparse: symbol 'hclge_ext_uninit' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:195:6: sparse: sparse: symbol 'hclge_ext_reset_done' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:204:5: sparse: sparse: symbol 'hclge_init_it' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:97:6: warning: no previous prototype for 'hclge_reset_event_it' [-Wmissing-prototypes]
      97 | void hclge_reset_event_it(struct pci_dev *pdev, struct hnae3_handle *handle)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c: In function 'hclge_reset_event_it':
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:140:44: warning: implicit conversion from 'enum hnae3_reset_type' to 'enum hnae3_event_type_custom' [-Wenum-conversion]
     140 |                 nic_call_event(netdev, hdev->reset_level);
         |                                        ~~~~^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c: At top level:
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:148:6: warning: no previous prototype for 'hclge_reset_end_it' [-Wmissing-prototypes]
     148 | bool hclge_reset_end_it(struct hnae3_handle *handle, bool done)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:181:6: warning: no previous prototype for 'hclge_ext_init' [-Wmissing-prototypes]
     181 | void hclge_ext_init(struct hnae3_handle *handle)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:186:6: warning: no previous prototype for 'hclge_ext_uninit' [-Wmissing-prototypes]
     186 | void hclge_ext_uninit(struct hnae3_handle *handle)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:195:6: warning: no previous prototype for 'hclge_ext_reset_done' [-Wmissing-prototypes]
     195 | void hclge_ext_reset_done(struct hnae3_handle *handle)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:204:5: warning: no previous prototype for 'hclge_init_it' [-Wmissing-prototypes]
     204 | int hclge_init_it(void)
         |     ^~~~~~~~~~~~~

vim +/hclge_reset_end_it +148 drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c

   147	
 > 148	bool hclge_reset_end_it(struct hnae3_handle *handle, bool done)
   149	{
   150		struct hclge_vport *vport = hclge_get_vport(handle);
   151		struct hclge_dev *hdev = vport->back;
   152		struct net_device *netdev;
   153	
   154		netdev = hdev->vport[0].nic.netdev;
   155	
   156		if (done) {
   157			dev_info(&hdev->pdev->dev, "IT Report Reset DONE!\n");
   158			if (nic_event_call)
   159				nic_call_event(netdev, HNAE3_RESET_DONE_CUSTOM);
   160		}
   161	
   162		if (hdev->reset_fail_cnt >= HCLGE_RESET_MAX_FAIL_CNT) {
   163			dev_err(&hdev->pdev->dev, "IT Report Reset fail!\n");
   164			if (nic_event_call) {
   165				if (hdev->reset_type == HNAE3_FUNC_RESET)
   166					nic_call_event(netdev,
   167						       HNAE3_FUNC_RESET_FAIL_CUSTOM);
   168				else if (hdev->reset_type == HNAE3_GLOBAL_RESET)
   169					nic_call_event(netdev,
   170						       HNAE3_GLOBAL_RESET_FAIL_CUSTOM);
   171				else if (hdev->reset_type == HNAE3_IMP_RESET)
   172					nic_call_event(netdev,
   173						       HNAE3_IMP_RESET_FAIL_CUSTOM);
   174			}
   175		}
   176	
   177		return done;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
