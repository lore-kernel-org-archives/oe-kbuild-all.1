Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8331E19D88A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 05:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718342262; cv=none; b=DMD+DH3wVnXplsVHg5EEVFRWD4yP1hKUg6zkqai9fajxeAvurJrul6ZeCJ0IFhuMSt34O8UTgUvGDd4Oh6j+adVJ6G/P4NPvQDq7wAc4cm4Ru9HyIqq4cx9B4s0BLDcGF8xoEZsouVViysdGwwVlWkWgBeeHk1D5qpAlAL//XnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718342262; c=relaxed/simple;
	bh=ncCiBUTZi0R6mt2IYHoQKezdQ2ey6nCs1eCs/kOwWa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CQodr2xPw4dZ7v/YjSUmay3ATNfkwc4dEEA+oMVVgll5t6cPNTMwKPlpwOVXGuU2JegRu7H53J2cbVcxXKW7s6OiI+OfO7FemQzSzn600vpMkuEHwUKCSXNruOf/WRvuNDcFUMMABH9AEjsX9VJ7k7RDO38QS0ftbX7NC7Tpaik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h95vleTI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h95vleTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718342260; x=1749878260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ncCiBUTZi0R6mt2IYHoQKezdQ2ey6nCs1eCs/kOwWa8=;
  b=h95vleTIHzzfcdh99qljAIzWVWd5Y/QThOZfxStEEYsvMbPlxGjWdsWY
   F0B6Uxub4z8d+eQN7gT/EM/jD0oOv/vALoGrFem8UFhGH3EIiVKAT6Poe
   vkm5+JpLnot9fnm6MR7hXXLd1kxNs6dXmIt7yluIKKC68RO4613nmUN/Y
   HmleS/UPGebe6QyXdWQeN8EYU+gJs2qmmeLMx9cJY0xgaj4prOfhLAFVF
   Anmikikm/S60yVT05jCSy2OveXkSMO2r1a2bUrfHfItg1AuRuFhlcQXVJ
   hM4TyZT28q+hjyI6K8RttgcRA6z8glTzVyMn/eWF9SxtKR7PTI06DnNEU
   Q==;
X-CSE-ConnectionGUID: 62GWONWmTDWXfdb97XOZCw==
X-CSE-MsgGUID: w4Y/8xkvQKa1AnohQ9h3BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="14994356"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="14994356"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 22:17:40 -0700
X-CSE-ConnectionGUID: RRr4a8N0SaaQwQQ3Z+c8eg==
X-CSE-MsgGUID: doTjSzBoQkaOVTgRsjuqtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="44765447"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2024 22:17:37 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHzJf-0000qm-07;
	Fri, 14 Jun 2024 05:17:35 +0000
Date: Fri, 14 Jun 2024 13:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 255/2440]
 drivers/iommu/exynos-iommu.c:1247:17: error: implicit declaration of
 function 'iommu_group_get_for_dev'; did you mean 'iommu_group_get_by_id'?
Message-ID: <202406141334.sg7CQ22p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   fe31b499a60a7694174364399cf4f5c5e5808f62
commit: 0ff8731c5eb159640fc8a8113f4dcd41809c7f47 [255/2440] iommu: Unexport iommu_group_get_for_dev()
config: arm64-randconfig-001-20240612 (https://download.01.org/0day-ci/archive/20240614/202406141334.sg7CQ22p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141334.sg7CQ22p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141334.sg7CQ22p-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/iommu/exynos-iommu.c: In function 'exynos_iommu_add_device':
>> drivers/iommu/exynos-iommu.c:1247:17: error: implicit declaration of function 'iommu_group_get_for_dev'; did you mean 'iommu_group_get_by_id'? [-Werror=implicit-function-declaration]
    1247 |         group = iommu_group_get_for_dev(dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 iommu_group_get_by_id
>> drivers/iommu/exynos-iommu.c:1247:15: warning: assignment to 'struct iommu_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1247 |         group = iommu_group_get_for_dev(dev);
         |               ^
   drivers/iommu/exynos-iommu.c: At top level:
   drivers/iommu/exynos-iommu.c:1334:16: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1334 |         .map = exynos_iommu_map,
         |                ^~~~~~~~~~~~~~~~
   drivers/iommu/exynos-iommu.c:1334:16: note: (near initialization for 'exynos_iommu_ops.map')
   drivers/iommu/exynos-iommu.c:1338:10: error: 'const struct iommu_ops' has no member named 'add_device'
    1338 |         .add_device = exynos_iommu_add_device,
         |          ^~~~~~~~~~
   drivers/iommu/exynos-iommu.c:1338:23: error: initialization of 'int (*)(struct iommu_domain *, enum iommu_attr,  void *)' from incompatible pointer type 'int (*)(struct device *)' [-Werror=incompatible-pointer-types]
    1338 |         .add_device = exynos_iommu_add_device,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/exynos-iommu.c:1338:23: note: (near initialization for 'exynos_iommu_ops.domain_get_attr')
   drivers/iommu/exynos-iommu.c:1339:10: error: 'const struct iommu_ops' has no member named 'remove_device'; did you mean 'probe_device'?
    1339 |         .remove_device = exynos_iommu_remove_device,
         |          ^~~~~~~~~~~~~
         |          probe_device
   drivers/iommu/exynos-iommu.c:1339:26: error: initialization of 'int (*)(struct iommu_domain *, enum iommu_attr,  void *)' from incompatible pointer type 'void (*)(struct device *)' [-Werror=incompatible-pointer-types]
    1339 |         .remove_device = exynos_iommu_remove_device,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/exynos-iommu.c:1339:26: note: (near initialization for 'exynos_iommu_ops.domain_set_attr')
   cc1: some warnings being treated as errors


vim +1247 drivers/iommu/exynos-iommu.c

2a96536e77b43cf KyongHo Cho       2012-05-12  1237  
bf4a1c920286076 Antonios Motakis  2014-05-12  1238  static int exynos_iommu_add_device(struct device *dev)
bf4a1c920286076 Antonios Motakis  2014-05-12  1239  {
7a974b29fe5d370 Marek Szyprowski  2017-09-15  1240  	struct exynos_iommu_owner *owner = dev->archdata.iommu;
7a974b29fe5d370 Marek Szyprowski  2017-09-15  1241  	struct sysmmu_drvdata *data;
bf4a1c920286076 Antonios Motakis  2014-05-12  1242  	struct iommu_group *group;
bf4a1c920286076 Antonios Motakis  2014-05-12  1243  
06801db0d3bba2b Marek Szyprowski  2015-05-19  1244  	if (!has_sysmmu(dev))
06801db0d3bba2b Marek Szyprowski  2015-05-19  1245  		return -ENODEV;
06801db0d3bba2b Marek Szyprowski  2015-05-19  1246  
6c2ae7e2916b028 Marek Szyprowski  2016-02-18 @1247  	group = iommu_group_get_for_dev(dev);
bf4a1c920286076 Antonios Motakis  2014-05-12  1248  
6c2ae7e2916b028 Marek Szyprowski  2016-02-18  1249  	if (IS_ERR(group))
bf4a1c920286076 Antonios Motakis  2014-05-12  1250  		return PTR_ERR(group);
bf4a1c920286076 Antonios Motakis  2014-05-12  1251  
7a974b29fe5d370 Marek Szyprowski  2017-09-15  1252  	list_for_each_entry(data, &owner->controllers, owner_node) {
7a974b29fe5d370 Marek Szyprowski  2017-09-15  1253  		/*
7a974b29fe5d370 Marek Szyprowski  2017-09-15  1254  		 * SYSMMU will be runtime activated via device link
7a974b29fe5d370 Marek Szyprowski  2017-09-15  1255  		 * (dependency) to its master device, so there are no
7a974b29fe5d370 Marek Szyprowski  2017-09-15  1256  		 * direct calls to pm_runtime_get/put in this driver.
7a974b29fe5d370 Marek Szyprowski  2017-09-15  1257  		 */
7a974b29fe5d370 Marek Szyprowski  2017-09-15  1258  		data->link = device_link_add(dev, data->sysmmu,
ea4f64002518386 Rafael J. Wysocki 2019-02-01  1259  					     DL_FLAG_STATELESS |
7a974b29fe5d370 Marek Szyprowski  2017-09-15  1260  					     DL_FLAG_PM_RUNTIME);
7a974b29fe5d370 Marek Szyprowski  2017-09-15  1261  	}
bf4a1c920286076 Antonios Motakis  2014-05-12  1262  	iommu_group_put(group);
bf4a1c920286076 Antonios Motakis  2014-05-12  1263  
6c2ae7e2916b028 Marek Szyprowski  2016-02-18  1264  	return 0;
bf4a1c920286076 Antonios Motakis  2014-05-12  1265  }
bf4a1c920286076 Antonios Motakis  2014-05-12  1266  

:::::: The code at line 1247 was first introduced by commit
:::::: 6c2ae7e2916b028bd4c0fff04589bd176487a122 iommu/exynos: Rework iommu group initialization

:::::: TO: Marek Szyprowski <m.szyprowski@samsung.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
