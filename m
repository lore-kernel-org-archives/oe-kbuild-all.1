Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284DE1EB26
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 11:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709637109; cv=none; b=dHtwNucjBtEiJc4QEVa8V3nsVO9BU5k69LLnagx8ol0Iiz8rvOL1FfvrhjOXDE8DbRlSpo3qY2JvG3ucKkvkniwuSLGJFCcsqczvNl7n0wJOCFAO3Vb5X7TBvinmT46M/TIz+GGyzVyTb5YA86BX6KEApO+2J8cL999jMmXsRFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709637109; c=relaxed/simple;
	bh=qnYbUCGv4i3xK28rdJ04+nAtacxZCaIbBqI/btR76cM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hvl6aePyTTLq9vEvabTyQLgHmM1l2qZ/Mr8ssXjl96J7sc89Vk+UMRVREJHTKVYC8YO5asxXI+ifNW7qr4qYzlyAdyK2+cKRREE+JB403HYh3UKBr/VlGREOKyGhnXq6sDmWqfoD3Shb4MDOznDIarMW6UA2LUvnKvSCHr82E+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCDDAzUL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCDDAzUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709637106; x=1741173106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qnYbUCGv4i3xK28rdJ04+nAtacxZCaIbBqI/btR76cM=;
  b=nCDDAzULyFRdHhtrgtK025GfJd/QzGa1ZheNLy/TAPX5D4ryKI/w5Zg9
   ClbUDYUFRM/7pKUr7tLv+cyoVp4RGMVBPlkEHTKsWG8YpbKi2H7ceUahM
   p3TJq1OQXQrqpfGM3RVP2a5Y2D7BZGD8aRa6LNK0+Sq8ugwcALqRLpZzW
   e+YX99ddRt5z7etVGOxBBmDeG/9yX91iWRZdn3nv9TNwqeL7lHT3PC6ch
   3Uc04TCsO5CreBFojNGByhW8dW0CN/f+iedW8l1UQY7bm2GMqte0s2Of9
   cXjW4/q02E2vidNDA3Rljz9udZzUjkpsqt8qUxhfRnTIzO+uDo5bDY7hh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4038443"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4038443"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 03:11:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9406941"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2024 03:11:42 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhShv-0003G9-1l;
	Tue, 05 Mar 2024 11:11:39 +0000
Date: Tue, 5 Mar 2024 19:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/scsi/smartpqi/smartpqi_init.c:4066:29: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202403051924.O81M00PO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 947b4728299262baefd907dae678bddf171c5c98 scsi: smartpqi: compat for tk4
date:   2 years, 7 months ago
config: arm64-randconfig-r131-20240303 (https://download.01.org/0day-ci/archive/20240305/202403051924.O81M00PO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240305/202403051924.O81M00PO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051924.O81M00PO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/smartpqi/smartpqi_init.c:4066:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] [usertype] <asn:2> *iq_ci @@     got unsigned int * @@
   drivers/scsi/smartpqi/smartpqi_init.c:4066:29: sparse:     expected unsigned int [noderef] [usertype] <asn:2> *iq_ci
   drivers/scsi/smartpqi/smartpqi_init.c:4066:29: sparse:     got unsigned int *
>> drivers/scsi/smartpqi/smartpqi_init.c:4080:19: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/scsi/smartpqi/smartpqi_init.c:2143:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] wwid @@     got unsigned long long [usertype] @@
   drivers/scsi/smartpqi/smartpqi_init.c:2143:30: sparse:     expected restricted __be64 [usertype] wwid
   drivers/scsi/smartpqi/smartpqi_init.c:2143:30: sparse:     got unsigned long long [usertype]

vim +4066 drivers/scsi/smartpqi/smartpqi_init.c

^590eaf1fec755 Kaixu Xia  2021-03-16  4038  
^590eaf1fec755 Kaixu Xia  2021-03-16  4039  static int pqi_alloc_admin_queues(struct pqi_ctrl_info *ctrl_info)
^590eaf1fec755 Kaixu Xia  2021-03-16  4040  {
^590eaf1fec755 Kaixu Xia  2021-03-16  4041  	size_t alloc_length;
^590eaf1fec755 Kaixu Xia  2021-03-16  4042  	struct pqi_admin_queues_aligned *admin_queues_aligned;
^590eaf1fec755 Kaixu Xia  2021-03-16  4043  	struct pqi_admin_queues *admin_queues;
^590eaf1fec755 Kaixu Xia  2021-03-16  4044  
^590eaf1fec755 Kaixu Xia  2021-03-16  4045  	alloc_length = sizeof(struct pqi_admin_queues_aligned) +
^590eaf1fec755 Kaixu Xia  2021-03-16  4046  		PQI_QUEUE_ELEMENT_ARRAY_ALIGNMENT;
^590eaf1fec755 Kaixu Xia  2021-03-16  4047  
^590eaf1fec755 Kaixu Xia  2021-03-16  4048  	ctrl_info->admin_queue_memory_base =
ff579791c772af Fuhai Wang 2021-07-30  4049  		dma_zalloc_coherent(&ctrl_info->pci_dev->dev,
ff579791c772af Fuhai Wang 2021-07-30  4050  			alloc_length,
^590eaf1fec755 Kaixu Xia  2021-03-16  4051  			&ctrl_info->admin_queue_memory_base_dma_handle,
^590eaf1fec755 Kaixu Xia  2021-03-16  4052  			GFP_KERNEL);
^590eaf1fec755 Kaixu Xia  2021-03-16  4053  
^590eaf1fec755 Kaixu Xia  2021-03-16  4054  	if (!ctrl_info->admin_queue_memory_base)
^590eaf1fec755 Kaixu Xia  2021-03-16  4055  		return -ENOMEM;
^590eaf1fec755 Kaixu Xia  2021-03-16  4056  
^590eaf1fec755 Kaixu Xia  2021-03-16  4057  	ctrl_info->admin_queue_memory_length = alloc_length;
^590eaf1fec755 Kaixu Xia  2021-03-16  4058  
^590eaf1fec755 Kaixu Xia  2021-03-16  4059  	admin_queues = &ctrl_info->admin_queues;
^590eaf1fec755 Kaixu Xia  2021-03-16  4060  	admin_queues_aligned = PTR_ALIGN(ctrl_info->admin_queue_memory_base,
^590eaf1fec755 Kaixu Xia  2021-03-16  4061  		PQI_QUEUE_ELEMENT_ARRAY_ALIGNMENT);
^590eaf1fec755 Kaixu Xia  2021-03-16  4062  	admin_queues->iq_element_array =
^590eaf1fec755 Kaixu Xia  2021-03-16  4063  		&admin_queues_aligned->iq_element_array;
^590eaf1fec755 Kaixu Xia  2021-03-16  4064  	admin_queues->oq_element_array =
^590eaf1fec755 Kaixu Xia  2021-03-16  4065  		&admin_queues_aligned->oq_element_array;
^590eaf1fec755 Kaixu Xia  2021-03-16 @4066  	admin_queues->iq_ci = &admin_queues_aligned->iq_ci;
^590eaf1fec755 Kaixu Xia  2021-03-16  4067  	admin_queues->oq_pi =
^590eaf1fec755 Kaixu Xia  2021-03-16  4068  		(pqi_index_t __iomem *)&admin_queues_aligned->oq_pi;
^590eaf1fec755 Kaixu Xia  2021-03-16  4069  
^590eaf1fec755 Kaixu Xia  2021-03-16  4070  	admin_queues->iq_element_array_bus_addr =
^590eaf1fec755 Kaixu Xia  2021-03-16  4071  		ctrl_info->admin_queue_memory_base_dma_handle +
^590eaf1fec755 Kaixu Xia  2021-03-16  4072  		(admin_queues->iq_element_array -
^590eaf1fec755 Kaixu Xia  2021-03-16  4073  		ctrl_info->admin_queue_memory_base);
^590eaf1fec755 Kaixu Xia  2021-03-16  4074  	admin_queues->oq_element_array_bus_addr =
^590eaf1fec755 Kaixu Xia  2021-03-16  4075  		ctrl_info->admin_queue_memory_base_dma_handle +
^590eaf1fec755 Kaixu Xia  2021-03-16  4076  		(admin_queues->oq_element_array -
^590eaf1fec755 Kaixu Xia  2021-03-16  4077  		ctrl_info->admin_queue_memory_base);
^590eaf1fec755 Kaixu Xia  2021-03-16  4078  	admin_queues->iq_ci_bus_addr =
^590eaf1fec755 Kaixu Xia  2021-03-16  4079  		ctrl_info->admin_queue_memory_base_dma_handle +
^590eaf1fec755 Kaixu Xia  2021-03-16 @4080  		((void *)admin_queues->iq_ci -
^590eaf1fec755 Kaixu Xia  2021-03-16  4081  		ctrl_info->admin_queue_memory_base);
^590eaf1fec755 Kaixu Xia  2021-03-16  4082  	admin_queues->oq_pi_bus_addr =
^590eaf1fec755 Kaixu Xia  2021-03-16  4083  		ctrl_info->admin_queue_memory_base_dma_handle +
^590eaf1fec755 Kaixu Xia  2021-03-16  4084  		((void __iomem *)admin_queues->oq_pi -
^590eaf1fec755 Kaixu Xia  2021-03-16  4085  		(void __iomem *)ctrl_info->admin_queue_memory_base);
^590eaf1fec755 Kaixu Xia  2021-03-16  4086  
^590eaf1fec755 Kaixu Xia  2021-03-16  4087  	return 0;
^590eaf1fec755 Kaixu Xia  2021-03-16  4088  }
^590eaf1fec755 Kaixu Xia  2021-03-16  4089  

:::::: The code at line 4066 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
