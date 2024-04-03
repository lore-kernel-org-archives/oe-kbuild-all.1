Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B496195
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 00:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712103528; cv=none; b=WVGkPc6iOJaWVgoHl2yhwDvewNv/MOtbQBO5hw9zi52LOGGIYOuaMtlQxJeSuCR7sYKOknoxvRsonOvHitrKuJxpUv6m04rTXuUadDmzc6tv3AqQ7CY2mwVjg6Qz8tAC3Kt52A1gE0Yek8lAecgz1O/1muvT5lhuFQpAMnH5k/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712103528; c=relaxed/simple;
	bh=uGdLvzMM/tvXVSP6p0/9xOMIkaw2PTSTPzAQjqORd6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aEf/MJTc30J6yx4xQPJWLPIeNQpC2ObuaijgbAv8G5Z6xgLs03MJ3cZHSLpnRucfGra0JyQsX6SYxHIa5Y9NpXhy9fcd/UUh2ZBgZdqq506YMqD7kTHclFl8e5m23C3aRJziINkte75reJ/R5DCgojbQXCeC8KxBS1/hhmH/MRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYe4GdhA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYe4GdhA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712103527; x=1743639527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uGdLvzMM/tvXVSP6p0/9xOMIkaw2PTSTPzAQjqORd6k=;
  b=FYe4GdhAS+dMUS0lZs3Ucc9l7MNXvnN4Rki+l4qUv+S44+xVGazSaqXG
   fT/IskJm1xNwDLiKy4H6bg4sjggcaiQ8EuHhnj5MLcXPVSDn5UypTc2KM
   Xc7rMGSugZ2/Njn6e50q4zpvS1LoD03J7UJY+pj1LDIhEnV2iZROWaYFy
   5iMysvFyuo/CAH5E+NVwGJs59vUBJA8RP5mhQgINTjyJZ3etb6lzdj2A2
   Cnr+eltDBlBEESJgI4W2St3O9Q1uGQiDaNBVp+vo3M7xFFX3CxyOkhyq4
   HfXPHvdmqGVs3bHTf1WI/w49lMpTXypwa0tYCgktwT6EorAUrNTwJy70J
   Q==;
X-CSE-ConnectionGUID: qOBgAaccSGur3CO+jIxUmw==
X-CSE-MsgGUID: f00NkyLOQgm89beB/Mg+tQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="24802631"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="24802631"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 17:18:45 -0700
X-CSE-ConnectionGUID: VqDnWvnCTXaJfkVeszCv3Q==
X-CSE-MsgGUID: mx/+XVzERAeMBNT/WHVNQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18834799"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Apr 2024 17:18:44 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rroKv-0001er-0H;
	Wed, 03 Apr 2024 00:18:41 +0000
Date: Wed, 3 Apr 2024 08:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:iommufd-io-pgfault-delivery-v4 3/12]
 drivers/iommu/iommu.c:3501:6: warning: variable 'ret' is used uninitialized
 whenever 'if' condition is true
Message-ID: <202404030811.d15pFYS5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LuBaolu/intel-iommu.git iommufd-io-pgfault-delivery-v4
head:   6fc25b16b714233cbcb75b7dd5ded49f35f11e54
commit: d5026804d865698bd727f615117eed7f231b25a6 [3/12] iommu: Introduce domain attachment handle
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240403/202404030811.d15pFYS5-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030811.d15pFYS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030811.d15pFYS5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommu.c:9:
   In file included from include/linux/amba/bus.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/iommu.c:3501:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    3501 |         if (IS_ERR(handle))
         |             ^~~~~~~~~~~~~~
   drivers/iommu/iommu.c:3516:9: note: uninitialized use occurs here
    3516 |         return ret;
         |                ^~~
   drivers/iommu/iommu.c:3501:2: note: remove the 'if' if its condition is always false
    3501 |         if (IS_ERR(handle))
         |         ^~~~~~~~~~~~~~~~~~~
    3502 |                 goto out_unlock;
         |                 ~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:3480:9: note: initialize the variable 'ret' to silence this warning
    3480 |         int ret;
         |                ^
         |                 = 0
   6 warnings generated.


vim +3501 drivers/iommu/iommu.c

  3464	
  3465	/*
  3466	 * iommu_attach_device_pasid() - Attach a domain to pasid of device
  3467	 * @domain: the iommu domain.
  3468	 * @dev: the attached device.
  3469	 * @pasid: the pasid of the device.
  3470	 *
  3471	 * Return: 0 on success, or an error.
  3472	 */
  3473	int iommu_attach_device_pasid(struct iommu_domain *domain,
  3474				      struct device *dev, ioasid_t pasid)
  3475	{
  3476		/* Caller must be a probed driver on dev */
  3477		struct iommu_group *group = dev->iommu_group;
  3478		struct iommu_attach_handle *handle;
  3479		struct group_device *device;
  3480		int ret;
  3481	
  3482		if (!domain->ops->set_dev_pasid)
  3483			return -EOPNOTSUPP;
  3484	
  3485		if (!group)
  3486			return -ENODEV;
  3487	
  3488		if (!dev_has_iommu(dev) || dev_iommu_ops(dev) != domain->owner ||
  3489		    pasid == IOMMU_NO_PASID)
  3490			return -EINVAL;
  3491	
  3492		mutex_lock(&group->mutex);
  3493		for_each_group_device(group, device) {
  3494			if (pasid >= device->dev->iommu->max_pasids) {
  3495				ret = -EINVAL;
  3496				goto out_unlock;
  3497			}
  3498		}
  3499	
  3500		handle = iommu_attach_handle_set(domain, group, pasid);
> 3501		if (IS_ERR(handle))
  3502			goto out_unlock;
  3503	
  3504		ret = __iommu_set_group_pasid(domain, group, pasid);
  3505		if (ret)
  3506			goto out_put_handle;
  3507		mutex_unlock(&group->mutex);
  3508	
  3509		return 0;
  3510	
  3511	out_put_handle:
  3512		__iommu_remove_group_pasid(group, pasid);
  3513		iommu_attach_handle_put(handle);
  3514	out_unlock:
  3515		mutex_unlock(&group->mutex);
  3516		return ret;
  3517	}
  3518	EXPORT_SYMBOL_GPL(iommu_attach_device_pasid);
  3519	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
