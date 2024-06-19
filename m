Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA694C630
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 05:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718773487; cv=none; b=A/i08lARWZ/Ts9WqawNYGmpSVS6Uzky/uft3KL5cCANND0GIiI7CWJr6EzGDXowbIKZfetu+os5k88AqBO7KrhlfXd/RlN9iMgZcO9SvANm2nvi54Nl3qRQu5x2ChlqNTCUOX+Aro1haccjx3RdLOgVWk1flLiIakpMQ/mDGCtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718773487; c=relaxed/simple;
	bh=p51oRDz22xeoe62hM9HlFARnR46e1x1RyJPcOzWjy3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A9OYS8RqI6eWZqseZtlFuETjuqbymkvINzI/pWYlyQr9K6fMe3iLGl9G4La8HkkVAKfy3pnsm/0m+AxnKvemd75Ct2o6Td1FM6OZ7rCvTKUz1GUAxLBNcKfPdbBFHYrarCjgMrjyyCVrkcBP5V1AR8p+aRHCYddTL7sGfnD9n6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1oUTPoR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1oUTPoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718773485; x=1750309485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p51oRDz22xeoe62hM9HlFARnR46e1x1RyJPcOzWjy3U=;
  b=Y1oUTPoR3+TLNMSFAEDEUy/Sx0MUL9oTFV1oXgNop5Lp66w1OYdji78l
   IzLGsRjUiYP+DwhlG0fBr2c36fXRN95KxwkVySsR0BMVHKxmXygNzKKYD
   NBdBSZC+xYo1NXaCbPi88wRFEQg2PqKP59ARG+MZLi1NNvT4Mwl9b6XiB
   DVcRCNDJ027nQMVbbgYS/DuoZdLzFAqw7znUL/DJgZms7m6hIp6maqJdV
   GE6zK3rCHwPPtkINd7hMCOxommMU+SPgVE/kUVseMycBJGc9Bql5SItdg
   V7zeBU7ecBdPKT1wdm86w/fMp5+HyFQLzRqxcRn5UHNSsu7k7azo0fWSL
   A==;
X-CSE-ConnectionGUID: Jd0YiXisRjOv7KrK19H3pw==
X-CSE-MsgGUID: YZm2AM3+S+iNpmznLjHnug==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15524531"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="15524531"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 22:04:44 -0700
X-CSE-ConnectionGUID: CBEZgsCHSJS9MaDYBoeNOQ==
X-CSE-MsgGUID: 2I7wS6DLSYmWdqYh4d6BZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="46914722"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jun 2024 22:04:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJnUu-0006J7-1U;
	Wed, 19 Jun 2024 05:04:40 +0000
Date: Wed, 19 Jun 2024 13:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15323/22974]
 drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:181:6:
 sparse: sparse: symbol 'hclge_ext_init' was not declared. Should it be
 static?
Message-ID: <202406191251.tnS3pNVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9e57bb4473766dca5e26f8b78853f38dd62d1aa3
commit: c3acbb84d1aa72a112cdfb9479ae744b21a92751 [15323/22974] net: hns3: adds support for setting pf max tx rate via sysfs
config: arm64-randconfig-r111-20240615 (https://download.01.org/0day-ci/archive/20240619/202406191251.tnS3pNVS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240619/202406191251.tnS3pNVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191251.tnS3pNVS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:140:44: sparse: sparse: mixing different enum types:
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:140:44: sparse:    unsigned int enum hnae3_reset_type
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:140:44: sparse:    unsigned int enum hnae3_event_type_custom
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:97:6: sparse: sparse: symbol 'hclge_reset_event_it' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:148:6: sparse: sparse: symbol 'hclge_reset_done_it' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:181:6: sparse: sparse: symbol 'hclge_ext_init' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:186:6: sparse: sparse: symbol 'hclge_ext_uninit' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:195:6: sparse: sparse: symbol 'hclge_ext_reset_done' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:204:5: sparse: sparse: symbol 'hclge_init_it' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:97:6: warning: no previous prototype for 'hclge_reset_event_it' [-Wmissing-prototypes]
      97 | void hclge_reset_event_it(struct pci_dev *pdev, struct hnae3_handle *handle)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c: In function 'hclge_reset_event_it':
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:140:44: warning: implicit conversion from 'enum hnae3_reset_type' to 'enum hnae3_event_type_custom' [-Wenum-conversion]
     140 |                 nic_call_event(netdev, hdev->reset_level);
         |                                        ~~~~^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c: At top level:
   drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c:148:6: warning: no previous prototype for 'hclge_reset_done_it' [-Wmissing-prototypes]
     148 | bool hclge_reset_done_it(struct hnae3_handle *handle, bool done)
         |      ^~~~~~~~~~~~~~~~~~~
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

vim +/hclge_ext_init +181 drivers/net/ethernet/hisilicon/hns3/hns3_extension/hns3pf/hclge_main_it.c

   179	
   180	#ifdef CONFIG_HNS3_TEST
 > 181	void hclge_ext_init(struct hnae3_handle *handle)
   182	{
   183		hclge_sysfs_init(handle);
   184	}
   185	
 > 186	void hclge_ext_uninit(struct hnae3_handle *handle)
   187	{
   188		struct hclge_vport *vport = hclge_get_vport(handle);
   189		struct hclge_dev *hdev = vport->back;
   190	
   191		hclge_reset_pf_rate(hdev);
   192		hclge_sysfs_uninit(handle);
   193	}
   194	
 > 195	void hclge_ext_reset_done(struct hnae3_handle *handle)
   196	{
   197		struct hclge_vport *vport = hclge_get_vport(handle);
   198		struct hclge_dev *hdev = vport->back;
   199	
   200		hclge_resume_pf_rate(hdev);
   201	}
   202	#endif
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
