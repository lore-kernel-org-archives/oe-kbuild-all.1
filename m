Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0A11E892
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 13:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728739808; cv=none; b=lMk6MEtBHZbCjHclXvSeCSOP3+S+b67WdF3IDJqW2XjD+1Sv+iNsJnm9nYepMxO8jzsxIBzC32RCUYTsxAFHVVinyucxaQsDWVGy8fANW5foCf3YxYN5taMmVO0NyQmmQ2XodwO6MHrJgNbhgyrYCCQHaPHyoPdaLom1XfYZd2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728739808; c=relaxed/simple;
	bh=elOcQdQuPf/jAAyq+pXWDm+kV3fsjl6gmgb3No2+bMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aVxdG8fV29lkrLMK10wls57e0r3G+2+bjZelgIX+tSZq+lX5ZJ/TupLde37orjMK4yuLeG7xI8upI2NtIn+Ap1I+DULRaVyQf3PDyLcF7pHfMKAgdHyQooz5W7M8pthu2gh0oAyrbu40AiR8v7qUW9SnSFrQWBDIDFizIUNrz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGc4lCrl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGc4lCrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728739807; x=1760275807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=elOcQdQuPf/jAAyq+pXWDm+kV3fsjl6gmgb3No2+bMk=;
  b=mGc4lCrlSPmLUmV2Hx3CFTFCoeuh4UfGaqsxPN1d+foTLzldMsM+51iF
   wVFq63se1OYqQk87yEpkZpBgqsLYgrNbwAbE4sKZXZZEl7XiGUROlV7YR
   FuiX9hpeHLdv6aKZyqEoDSzGqsc99J9cfnpwv0ez0+flcs3SQgBDuuIwB
   GOqMixylue+RAc/WL3SsC5tskd2mQ+H5nqqBBo9cijaqukARJ6Qt+ZIly
   vRnEqBhsk/q9ShPbmHTQYwViVgheEgBuXDoerWacG5lPcU54U/oiS89QT
   qAQEGnjWCYqyCKSdYHst0Ek2irFN33zAsV3VjfcVl6QOFeH03DXNixpH5
   w==;
X-CSE-ConnectionGUID: gE67bG3mSrOOQmeLEmtHUQ==
X-CSE-MsgGUID: 9UH93C6gSier0mNWO4E2sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28304089"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="28304089"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 06:30:06 -0700
X-CSE-ConnectionGUID: c5KVcdrPSRmKv7rijBj/lg==
X-CSE-MsgGUID: JEW2LOh9TuGQ4mw8u3MRjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="100475065"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Oct 2024 06:30:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szcC1-000DNn-2x;
	Sat, 12 Oct 2024 13:30:01 +0000
Date: Sat, 12 Oct 2024 21:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangdepei <yangdepei@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13480/14354]
 drivers/crypto/ccp/hygon/hct.c:2175:30: sparse: sparse: symbol
 'hct_noiommu_fops' was not declared. Should it be static?
Message-ID: <202410122155.DIPX3Kfh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b52135712fc8eae0751505713e1caf086a1437d4
commit: 6e2db6d2859f5c41ff51b696235dc3971f4bcd22 [13480/14354] hct: supporting memory encryption in host and wb set in vm
config: x86_64-randconfig-r122-20241012 (https://download.01.org/0day-ci/archive/20241012/202410122155.DIPX3Kfh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410122155.DIPX3Kfh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410122155.DIPX3Kfh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/crypto/ccp/hygon/hct.c:246:18: sparse: sparse: symbol 'hct_mdev_type' was not declared. Should it be static?
   drivers/crypto/ccp/hygon/hct.c:250:18: sparse: sparse: symbol 'hct_mdev_types' was not declared. Should it be static?
   drivers/crypto/ccp/hygon/hct.c:472:23: sparse: sparse: cast to restricted __le32
   drivers/crypto/ccp/hygon/hct.c:1217:20: sparse: sparse: symbol 'hct_mdev_driver' was not declared. Should it be static?
   drivers/crypto/ccp/hygon/hct.c:1346:13: sparse: sparse: symbol 'hct_pin_memory' was not declared. Should it be static?
   drivers/crypto/ccp/hygon/hct.c:2080:6: sparse: sparse: symbol 'hct_noiommu_set_memory_wb' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/hct.c:2175:30: sparse: sparse: symbol 'hct_noiommu_fops' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/hct.c:2180:19: sparse: sparse: symbol 'hct_noiommu_misc' was not declared. Should it be static?

vim +/hct_noiommu_fops +2175 drivers/crypto/ccp/hygon/hct.c

  2174	
> 2175	const struct file_operations hct_noiommu_fops = {
  2176		.owner          = THIS_MODULE,
  2177		.unlocked_ioctl = hct_noiommu_ioctl,
  2178	};
  2179	
> 2180	struct miscdevice hct_noiommu_misc = {
  2181		.minor = MISC_DYNAMIC_MINOR,
  2182		.name  = "hct_noiommu",
  2183		.fops  = &hct_noiommu_fops,
  2184	};
  2185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
