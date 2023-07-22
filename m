Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5176E7F3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 21:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690060693; x=1721596693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lNn9DhhXt2kYOEJGo0QZIn1c8U3qA14zE23n4I8Z58s=;
  b=GFxIlvJF3xmeF1JnbHV+8u0yjoP77rPLioT5Kb+5IWvVpR/ibA59jbeH
   HjbFZsB8OFU/CmNPjNOc/NDeW3PqWhO4SudEJsXwYCN59fi9qkT+WinpD
   GA+h6XVjA3diWVQK4pE3538sVpK0UAFmOi8y1AIod0cmJKGqsdv5q9kEw
   ONGeGPXGbMb8Zgkzv9+Vxi/+4shxZC3I8tpQAWpZsVDa4LdbAe0MhUIuq
   hQo7rWs6WOFFyd7FdkHztTLFK8/vnX2afWGRmjQFgjd/YYOAXkhZkWMas
   KxVpsp3f6F7oSNDQeCrDxKtvkCmy65RdlizXN2+zmbL186SISoa1ja/Mh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="352122276"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="352122276"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 14:18:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="899073708"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="899073708"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Jul 2023 14:18:11 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNJzO-0008cP-2b;
	Sat, 22 Jul 2023 21:18:10 +0000
Date: Sun, 23 Jul 2023 05:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:preparatory-io-pgfault-delivery-v2 5/13]
 drivers/iommu/iommu.c:350 iommu_init_device() warn: inconsistent indenting
Message-ID: <202307230547.vVnYRqv1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LuBaolu/intel-iommu.git preparatory-io-pgfault-delivery-v2
head:   4937b3f9bee1a82d407843717b41474041fe8332
commit: 48136ac69845b9c4edd865b7bcbf766120c9ab88 [5/13] iommu: Change the return value of dev_iommu_get()
config: i386-randconfig-m021-20230723 (https://download.01.org/0day-ci/archive/20230723/202307230547.vVnYRqv1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230547.vVnYRqv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230547.vVnYRqv1-lkp@intel.com/

smatch warnings:
drivers/iommu/iommu.c:350 iommu_init_device() warn: inconsistent indenting
drivers/iommu/iommu.c:352 iommu_init_device() warn: ignoring unreachable code.

vim +350 drivers/iommu/iommu.c

   338	
   339	/*
   340	 * Init the dev->iommu and dev->iommu_group in the struct device and get the
   341	 * driver probed
   342	 */
   343	static int iommu_init_device(struct device *dev, const struct iommu_ops *ops)
   344	{
   345		struct iommu_device *iommu_dev;
   346		struct iommu_group *group;
   347		int ret;
   348	
   349		ret = dev_iommu_get(dev);
 > 350			return ret;
   351	
 > 352		if (!try_module_get(ops->owner)) {
   353			ret = -EINVAL;
   354			goto err_free;
   355		}
   356	
   357		iommu_dev = ops->probe_device(dev);
   358		if (IS_ERR(iommu_dev)) {
   359			ret = PTR_ERR(iommu_dev);
   360			goto err_module_put;
   361		}
   362	
   363		ret = iommu_device_link(iommu_dev, dev);
   364		if (ret)
   365			goto err_release;
   366	
   367		group = ops->device_group(dev);
   368		if (WARN_ON_ONCE(group == NULL))
   369			group = ERR_PTR(-EINVAL);
   370		if (IS_ERR(group)) {
   371			ret = PTR_ERR(group);
   372			goto err_unlink;
   373		}
   374		dev->iommu_group = group;
   375	
   376		dev->iommu->iommu_dev = iommu_dev;
   377		dev->iommu->max_pasids = dev_iommu_get_max_pasids(dev);
   378		if (ops->is_attach_deferred)
   379			dev->iommu->attach_deferred = ops->is_attach_deferred(dev);
   380		return 0;
   381	
   382	err_unlink:
   383		iommu_device_unlink(iommu_dev, dev);
   384	err_release:
   385		if (ops->release_device)
   386			ops->release_device(dev);
   387	err_module_put:
   388		module_put(ops->owner);
   389	err_free:
   390		dev_iommu_free(dev);
   391		return ret;
   392	}
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
