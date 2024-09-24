Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B98D17993
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 06:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727160131; cv=none; b=OwdD7BtmycpUNJyWsDVUAyEvNVA1V2cXc3IEvh9xXVnjHFnWxUNO/kakk1znrQwV0xDG9Ro9JAcJvPUB1QLjghDTcVhQ7WdzAEB1/dgxQIpOkiTlJ+Xi8WsZT220gIwQFka6zoO030AxIr7YjVNk6zLEWocwME2kGNKb43mAvqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727160131; c=relaxed/simple;
	bh=uUMnEpSjd64NIHMsxcU6t4pmWldhIXRV/JNA4GgKJdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mMnwecIZ9gCSYcQ9BjJ1ZBDrldFZ1+F/VFLoEgJQUtvgSJ+8pazpI5Kr7fDJHKowyCsivGiqVFirCKGWV137jRhgX79OCBDjpxESms07iloS1OWw9NydwB/Wzo6DGnPM5gPJBCjUMl5/9yNDZ2xUuUdz1slkKYWRK8zqhzl8VHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKsaiwXC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKsaiwXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727160129; x=1758696129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uUMnEpSjd64NIHMsxcU6t4pmWldhIXRV/JNA4GgKJdQ=;
  b=NKsaiwXCHZ+gYFxeHlbERLax6rBcnvA1CyjvNS9AZcZGq5ZlEOKQzicr
   ++rnUUEo8eIvo0iL1+rc3l898IWiTe1U6pchs2zxNi+UXAuxHe5lNOKqE
   uQ+vrfXlzlMPEn1Yge0e5ZIbxFgJFRggGwk7FOFz2U8pIk9G6ah7nefWv
   0XTHf90yAIdeGPTFxdIxUH/WuTeG9GWsHxKVRBSAdE+iGJISl6qU4Bc3l
   FIgGzZSS8WtwM+4fwpoaYl3AmPavUrJrgDdKykeBhyu6kno8PxyaUQPSj
   fqJvb6Gc7u3tfrwnJzCyIDf6MrDhWMjAJqZn0fLbbK2aXnPwjUuJRrrwn
   Q==;
X-CSE-ConnectionGUID: qRb5StJxTWyBVYCzBF1jDw==
X-CSE-MsgGUID: +1BpPXsXRPymQnDX6Wqe3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="36721113"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="36721113"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 23:42:09 -0700
X-CSE-ConnectionGUID: m324V2gbSr+MhzqOY3pr+Q==
X-CSE-MsgGUID: 33Zpm/64So+lWsOjwDEtaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="75835302"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Sep 2024 23:42:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sszFL-000I2J-1r;
	Tue, 24 Sep 2024 06:42:03 +0000
Date: Tue, 24 Sep 2024 14:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 255/2441]
 drivers/iommu/rockchip-iommu.c:1069:17: error: implicit declaration of
 function 'iommu_group_get_for_dev'; did you mean 'iommu_group_get_by_id'?
Message-ID: <202409241409.u1iDjHLG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 0ff8731c5eb159640fc8a8113f4dcd41809c7f47 [255/2441] iommu: Unexport iommu_group_get_for_dev()
config: arm64-randconfig-004-20240923 (https://download.01.org/0day-ci/archive/20240924/202409241409.u1iDjHLG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241409.u1iDjHLG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241409.u1iDjHLG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/iommu/rockchip-iommu.c: In function 'rk_iommu_add_device':
>> drivers/iommu/rockchip-iommu.c:1069:17: error: implicit declaration of function 'iommu_group_get_for_dev'; did you mean 'iommu_group_get_by_id'? [-Werror=implicit-function-declaration]
    1069 |         group = iommu_group_get_for_dev(dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 iommu_group_get_by_id
>> drivers/iommu/rockchip-iommu.c:1069:15: warning: assignment to 'struct iommu_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1069 |         group = iommu_group_get_for_dev(dev);
         |               ^
   drivers/iommu/rockchip-iommu.c: At top level:
   drivers/iommu/rockchip-iommu.c:1127:16: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1127 |         .map = rk_iommu_map,
         |                ^~~~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1127:16: note: (near initialization for 'rk_iommu_ops.map')
   drivers/iommu/rockchip-iommu.c:1129:10: error: 'const struct iommu_ops' has no member named 'add_device'
    1129 |         .add_device = rk_iommu_add_device,
         |          ^~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1129:23: error: initialization of 'void (*)(struct iommu_domain *)' from incompatible pointer type 'int (*)(struct device *)' [-Werror=incompatible-pointer-types]
    1129 |         .add_device = rk_iommu_add_device,
         |                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1129:23: note: (near initialization for 'rk_iommu_ops.flush_iotlb_all')
   drivers/iommu/rockchip-iommu.c:1130:10: error: 'const struct iommu_ops' has no member named 'remove_device'; did you mean 'probe_device'?
    1130 |         .remove_device = rk_iommu_remove_device,
         |          ^~~~~~~~~~~~~
         |          probe_device
   drivers/iommu/rockchip-iommu.c:1130:26: error: initialization of 'void (*)(struct iommu_domain *)' from incompatible pointer type 'void (*)(struct device *)' [-Werror=incompatible-pointer-types]
    1130 |         .remove_device = rk_iommu_remove_device,
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1130:26: note: (near initialization for 'rk_iommu_ops.iotlb_sync_map')
   cc1: some warnings being treated as errors


vim +1069 drivers/iommu/rockchip-iommu.c

c68a292152d322 Daniel Kurtz      2014-11-03  1056  
c68a292152d322 Daniel Kurtz      2014-11-03  1057  static int rk_iommu_add_device(struct device *dev)
c68a292152d322 Daniel Kurtz      2014-11-03  1058  {
c68a292152d322 Daniel Kurtz      2014-11-03  1059  	struct iommu_group *group;
c9d9f2394c6a95 Joerg Roedel      2017-03-31  1060  	struct rk_iommu *iommu;
0f181d3cf7d984 Jeffy Chen        2018-03-23  1061  	struct rk_iommudata *data;
c68a292152d322 Daniel Kurtz      2014-11-03  1062  
0f181d3cf7d984 Jeffy Chen        2018-03-23  1063  	data = dev->archdata.iommu;
0f181d3cf7d984 Jeffy Chen        2018-03-23  1064  	if (!data)
c68a292152d322 Daniel Kurtz      2014-11-03  1065  		return -ENODEV;
c68a292152d322 Daniel Kurtz      2014-11-03  1066  
0f181d3cf7d984 Jeffy Chen        2018-03-23  1067  	iommu = rk_iommu_from_dev(dev);
0f181d3cf7d984 Jeffy Chen        2018-03-23  1068  
5fd577c3eac3bd Jeffy Chen        2018-03-23 @1069  	group = iommu_group_get_for_dev(dev);
5fd577c3eac3bd Jeffy Chen        2018-03-23  1070  	if (IS_ERR(group))
c68a292152d322 Daniel Kurtz      2014-11-03  1071  		return PTR_ERR(group);
5fd577c3eac3bd Jeffy Chen        2018-03-23  1072  	iommu_group_put(group);
c68a292152d322 Daniel Kurtz      2014-11-03  1073  
c9d9f2394c6a95 Joerg Roedel      2017-03-31  1074  	iommu_device_link(&iommu->iommu, dev);
ea4f6400251838 Rafael J. Wysocki 2019-02-01  1075  	data->link = device_link_add(dev, iommu->dev,
ea4f6400251838 Rafael J. Wysocki 2019-02-01  1076  				     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
c9d9f2394c6a95 Joerg Roedel      2017-03-31  1077  
c68a292152d322 Daniel Kurtz      2014-11-03  1078  	return 0;
c68a292152d322 Daniel Kurtz      2014-11-03  1079  }
c68a292152d322 Daniel Kurtz      2014-11-03  1080  

:::::: The code at line 1069 was first introduced by commit
:::::: 5fd577c3eac3bdb9aebfec01e9b3d7f07a14f2dd iommu/rockchip: Use OF_IOMMU to attach devices automatically

:::::: TO: Jeffy Chen <jeffy.chen@rock-chips.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
