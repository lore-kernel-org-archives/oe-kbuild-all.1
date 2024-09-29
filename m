Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B63C147
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 01:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727574012; cv=none; b=eIZfT+HWHipteXdFxU31blskuC2+gsX+Vef+Hmlxxl7PCffpt1hSvoyXyNFPZE7aep/C++Cgzh7Z/eGrvGX44USNtyh6isShiEWlc0wwQkoc6CJqwMS5txiFWdOVRYyKg7cpk+z/yrwcPyOAmS3UA0Zj4t08ZZ/eUwD2033dELc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727574012; c=relaxed/simple;
	bh=v0jsMUGy3z5iSrXYFuxDWHZ6MAtU5LGb5ilTltcPmis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QDxtaFAIIy0BCIQhmexjnRqXi1jDEeelKqDTNmLxdxOUJySuXqWN+Sh387FueETrbfjVADQl1JJneFi906Vnk/3BLtcyBzpAvfIKsMBGP7f+rJzjPXGZga+lK4/H91iGSlGh4DOWrT/jpQO133+aesAFHkHTNpX0fmWIgqSI/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUoVsaAY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUoVsaAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727574010; x=1759110010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v0jsMUGy3z5iSrXYFuxDWHZ6MAtU5LGb5ilTltcPmis=;
  b=QUoVsaAYdYN7Yvy5sdXqB3OddqYESoK3wBk5IQI07RKBLx/wmyL7j/eq
   nPXxLQuwUguImRxZOlM6LPLIkneQesK9eTxMr/FPbWNYFNxhQyX6SYHv7
   YdKhp+XaQZV4uFwDm59zEyar3hTFBOep5HGMyetxXtz0THv4H67OfodRq
   C42ZrLKcCwLTliqc77POMeitMDGmd35cAY54B5BjvZgZtTQLgqUEgj+O+
   3qzitCHpXUtLsLvQi4GrPN+b9e76U7wdcQtaEds+MEpsZsjMsd2KlJjR/
   loxdYJg8MlOF5Gy7bsi1FxBEiC7FdMLHjPShHZULMHPSpfK000pd+tKki
   g==;
X-CSE-ConnectionGUID: Y8PgchQHSqaZGDjzY1bg5w==
X-CSE-MsgGUID: LQjOzma6SJ+BJxMMpUQdVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="52101089"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="52101089"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 18:40:09 -0700
X-CSE-ConnectionGUID: cxQoGBFfTv+kX/GSEwpnrw==
X-CSE-MsgGUID: PIcpfziVSN+q+JVG0QN5dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="77439494"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2024 18:40:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suius-000Nol-0P;
	Sun, 29 Sep 2024 01:40:06 +0000
Date: Sun, 29 Sep 2024 09:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5940/23799]
 drivers/iommu/iommu.c:979:31: sparse: sparse: dubious: !x | !y
Message-ID: <202409290930.qkB2O1Kz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: ac084b72b429b1bc0378add3abecfe107a732b7a [5940/23799] iommu: introduce device fault report API
config: arm64-randconfig-r133-20240926 (https://download.01.org/0day-ci/archive/20240929/202409290930.qkB2O1Kz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409290930.qkB2O1Kz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290930.qkB2O1Kz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/iommu.c:979:31: sparse: sparse: dubious: !x | !y
   drivers/iommu/iommu.c: In function 'iommu_unregister_device_fault_handler':
   drivers/iommu/iommu.c:937:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     937 |         int ret = 0;
         |             ^~~

vim +979 drivers/iommu/iommu.c

   960	
   961	
   962	/**
   963	 * iommu_report_device_fault() - Report fault event to device
   964	 * @dev: the device
   965	 * @evt: fault event data
   966	 *
   967	 * Called by IOMMU model specific drivers when fault is detected, typically
   968	 * in a threaded IRQ handler.
   969	 *
   970	 * Return 0 on success, or an error.
   971	 */
   972	int iommu_report_device_fault(struct device *dev, struct iommu_fault_event *evt)
   973	{
   974		int ret = 0;
   975		struct iommu_fault_event *evt_pending;
   976		struct iommu_fault_param *fparam;
   977	
   978		/* iommu_param is allocated when device is added to group */
 > 979		if (!dev->iommu_param | !evt)
   980			return -EINVAL;
   981		/* we only report device fault if there is a handler registered */
   982		mutex_lock(&dev->iommu_param->lock);
   983		if (!dev->iommu_param->fault_param ||
   984			!dev->iommu_param->fault_param->handler) {
   985			ret = -EINVAL;
   986			goto done_unlock;
   987		}
   988		fparam = dev->iommu_param->fault_param;
   989		if (evt->type == IOMMU_FAULT_PAGE_REQ && evt->last_req) {
   990			evt_pending = kzalloc(sizeof(*evt_pending), GFP_ATOMIC);
   991			if (!evt_pending) {
   992				ret = -ENOMEM;
   993				goto done_unlock;
   994			}
   995			memcpy(evt_pending, evt, sizeof(struct iommu_fault_event));
   996			mutex_lock(&fparam->lock);
   997			list_add_tail(&evt_pending->list, &fparam->faults);
   998			mutex_unlock(&fparam->lock);
   999		}
  1000		ret = fparam->handler(evt, fparam->data);
  1001	done_unlock:
  1002		mutex_unlock(&dev->iommu_param->lock);
  1003		return ret;
  1004	}
  1005	EXPORT_SYMBOL_GPL(iommu_report_device_fault);
  1006	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
