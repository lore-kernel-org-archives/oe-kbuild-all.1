Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A9B1898E3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276248; cv=none; b=fiMlLBlzvr40Aq+qcyD6rRJM87PmWs9UFInkRTqTtQzNhni6v6msMJfF9WL9nEqTTKwZWzhT7Zc5klhhDV0e6RXdw4MsMjTRzyUBVutY91uvO8IRv+GNWSuKnvBvqf+7HbgOfMNH8fClHTe1XxsgMhFsoySbyycY/qoT5VUCsHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276248; c=relaxed/simple;
	bh=pA1FxXPvPj/kId1dTT5cxmNAR2xtIimhEfc40tNPI8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAqEn8e3hu71K7UfFeQw0bXsbc4elO7E42WYhbRlWEdL6iEmGDSAunfxy92uRS2LaZctdDI/5xL47LHztB2/dHichJr7R17eeb3mgEekWlhdn0lNiBdEoUB2NvN4IpM3xPTMR+Jc927/fdpB9w73/3sCpqJDFir85HYsCqJpM7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LutYUKI8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LutYUKI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727276245; x=1758812245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pA1FxXPvPj/kId1dTT5cxmNAR2xtIimhEfc40tNPI8s=;
  b=LutYUKI8pe8LnbKX0TSI4MlC0QET2gKCaS52MptW6aG7oNHB1oyT7eLf
   Q3lsVD+2S9B23wD+tXrofpZdIP13bxe61XOnagUu/imfCDHteCZSEgPbH
   Iexq0PPfo6rjlE4+wkK339rTAV+vAxapVa8D54y2+tHZo4yEb/Zphnrtu
   cdzSQgVCPf6WinF0Kl2KVW9uGIyWCo6N3S+gIfcUFmWo/xyJx8XeLO0Cw
   AxphVINx24ZEToqd0aXsDEbqEJl0nD13L7tgB/iiVo0Es8GLTEqb0Awsd
   DYvaaIBX7WFR/Vvw5euZaLrhuTEpeIloVK4wGxqnG7nwY/bfK2605HWXR
   A==;
X-CSE-ConnectionGUID: OcPlYKSaQzGN8ql+0F+aUA==
X-CSE-MsgGUID: 0FThJ9QWTKOLliJcHqL3Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48863031"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="48863031"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 07:57:25 -0700
X-CSE-ConnectionGUID: marKu3KwRgybp+E2xwPd4w==
X-CSE-MsgGUID: Hr/6q477RkeqLHdXZCmqcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="76609358"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Sep 2024 07:57:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stTSB-000Jcr-0c;
	Wed, 25 Sep 2024 14:57:19 +0000
Date: Wed, 25 Sep 2024 22:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 255/2443]
 drivers/iommu/tegra-smmu.c:793:15: warning: assignment to 'struct
 iommu_group *' from 'int' makes pointer from integer without a cast
Message-ID: <202409252210.awEEScJ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   9d665359e14c559b74a94a55057e9c0fbd31a81a
commit: 0ff8731c5eb159640fc8a8113f4dcd41809c7f47 [255/2443] iommu: Unexport iommu_group_get_for_dev()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240925/202409252210.awEEScJ6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409252210.awEEScJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409252210.awEEScJ6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/tegra-smmu.c: In function 'tegra_smmu_add_device':
   drivers/iommu/tegra-smmu.c:793:17: error: implicit declaration of function 'iommu_group_get_for_dev'; did you mean 'iommu_group_get_by_id'? [-Werror=implicit-function-declaration]
     793 |         group = iommu_group_get_for_dev(dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 iommu_group_get_by_id
>> drivers/iommu/tegra-smmu.c:793:15: warning: assignment to 'struct iommu_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     793 |         group = iommu_group_get_for_dev(dev);
         |               ^
   drivers/iommu/tegra-smmu.c: At top level:
   drivers/iommu/tegra-smmu.c:893:10: error: 'const struct iommu_ops' has no member named 'add_device'
     893 |         .add_device = tegra_smmu_add_device,
         |          ^~~~~~~~~~
   drivers/iommu/tegra-smmu.c:893:23: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct device *)' [-Werror=incompatible-pointer-types]
     893 |         .add_device = tegra_smmu_add_device,
         |                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/tegra-smmu.c:893:23: note: (near initialization for 'tegra_smmu_ops.map')
   drivers/iommu/tegra-smmu.c:894:10: error: 'const struct iommu_ops' has no member named 'remove_device'; did you mean 'probe_device'?
     894 |         .remove_device = tegra_smmu_remove_device,
         |          ^~~~~~~~~~~~~
         |          probe_device
   drivers/iommu/tegra-smmu.c:894:26: error: initialization of 'size_t (*)(struct iommu_domain *, long unsigned int,  size_t,  struct iommu_iotlb_gather *)' {aka 'long unsigned int (*)(struct iommu_domain *, long unsigned int,  long unsigned int,  struct iommu_iotlb_gather *)'} from incompatible pointer type 'void (*)(struct device *)' [-Werror=incompatible-pointer-types]
     894 |         .remove_device = tegra_smmu_remove_device,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/tegra-smmu.c:894:26: note: (near initialization for 'tegra_smmu_ops.unmap')
   drivers/iommu/tegra-smmu.c:896:16: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     896 |         .map = tegra_smmu_map,
         |                ^~~~~~~~~~~~~~
   drivers/iommu/tegra-smmu.c:896:16: note: (near initialization for 'tegra_smmu_ops.map')
   drivers/iommu/tegra-smmu.c:896:16: warning: initialized field overwritten [-Woverride-init]
   drivers/iommu/tegra-smmu.c:896:16: note: (near initialization for 'tegra_smmu_ops.map')
   drivers/iommu/tegra-smmu.c:897:18: warning: initialized field overwritten [-Woverride-init]
     897 |         .unmap = tegra_smmu_unmap,
         |                  ^~~~~~~~~~~~~~~~
   drivers/iommu/tegra-smmu.c:897:18: note: (near initialization for 'tegra_smmu_ops.unmap')
   cc1: some warnings being treated as errors


vim +793 drivers/iommu/tegra-smmu.c

7f4c9176f760f4 Thierry Reding 2017-10-12  754  
89184651631713 Thierry Reding 2014-04-16  755  static int tegra_smmu_add_device(struct device *dev)
7a31f6f48bb6e3 Hiroshi DOYU   2011-11-17  756  {
89184651631713 Thierry Reding 2014-04-16  757  	struct device_node *np = dev->of_node;
7f4c9176f760f4 Thierry Reding 2017-10-12  758  	struct tegra_smmu *smmu = NULL;
d92e1f849830fc Robin Murphy   2017-07-21  759  	struct iommu_group *group;
89184651631713 Thierry Reding 2014-04-16  760  	struct of_phandle_args args;
89184651631713 Thierry Reding 2014-04-16  761  	unsigned int index = 0;
7f4c9176f760f4 Thierry Reding 2017-10-12  762  	int err;
7a31f6f48bb6e3 Hiroshi DOYU   2011-11-17  763  
89184651631713 Thierry Reding 2014-04-16  764  	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
89184651631713 Thierry Reding 2014-04-16  765  					  &args) == 0) {
89184651631713 Thierry Reding 2014-04-16  766  		smmu = tegra_smmu_find(args.np);
89184651631713 Thierry Reding 2014-04-16  767  		if (smmu) {
7f4c9176f760f4 Thierry Reding 2017-10-12  768  			err = tegra_smmu_configure(smmu, dev, &args);
7f4c9176f760f4 Thierry Reding 2017-10-12  769  			of_node_put(args.np);
7f4c9176f760f4 Thierry Reding 2017-10-12  770  
7f4c9176f760f4 Thierry Reding 2017-10-12  771  			if (err < 0)
7f4c9176f760f4 Thierry Reding 2017-10-12  772  				return err;
7f4c9176f760f4 Thierry Reding 2017-10-12  773  
89184651631713 Thierry Reding 2014-04-16  774  			/*
89184651631713 Thierry Reding 2014-04-16  775  			 * Only a single IOMMU master interface is currently
89184651631713 Thierry Reding 2014-04-16  776  			 * supported by the Linux kernel, so abort after the
89184651631713 Thierry Reding 2014-04-16  777  			 * first match.
89184651631713 Thierry Reding 2014-04-16  778  			 */
89184651631713 Thierry Reding 2014-04-16  779  			dev->archdata.iommu = smmu;
0b480e44700614 Joerg Roedel   2017-08-09  780  
0b480e44700614 Joerg Roedel   2017-08-09  781  			iommu_device_link(&smmu->iommu, dev);
0b480e44700614 Joerg Roedel   2017-08-09  782  
89184651631713 Thierry Reding 2014-04-16  783  			break;
7a31f6f48bb6e3 Hiroshi DOYU   2011-11-17  784  		}
7a31f6f48bb6e3 Hiroshi DOYU   2011-11-17  785  
7f4c9176f760f4 Thierry Reding 2017-10-12  786  		of_node_put(args.np);
89184651631713 Thierry Reding 2014-04-16  787  		index++;
89184651631713 Thierry Reding 2014-04-16  788  	}
7a31f6f48bb6e3 Hiroshi DOYU   2011-11-17  789  
7f4c9176f760f4 Thierry Reding 2017-10-12  790  	if (!smmu)
7f4c9176f760f4 Thierry Reding 2017-10-12  791  		return -ENODEV;
7f4c9176f760f4 Thierry Reding 2017-10-12  792  
d92e1f849830fc Robin Murphy   2017-07-21 @793  	group = iommu_group_get_for_dev(dev);
d92e1f849830fc Robin Murphy   2017-07-21  794  	if (IS_ERR(group))
d92e1f849830fc Robin Murphy   2017-07-21  795  		return PTR_ERR(group);
d92e1f849830fc Robin Murphy   2017-07-21  796  
d92e1f849830fc Robin Murphy   2017-07-21  797  	iommu_group_put(group);
d92e1f849830fc Robin Murphy   2017-07-21  798  
89184651631713 Thierry Reding 2014-04-16  799  	return 0;
7a31f6f48bb6e3 Hiroshi DOYU   2011-11-17  800  }
7a31f6f48bb6e3 Hiroshi DOYU   2011-11-17  801  

:::::: The code at line 793 was first introduced by commit
:::::: d92e1f849830fc78c50a00b953361fc1449aa1e2 iommu/tegra-smmu: Add iommu_group support

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
