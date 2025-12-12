Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753ED27E1DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 04:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765512203; cv=none; b=bMP6yxabwBJ0VfDIRZosRyQNOiV0ASsL0DmU+ZXr48BehfZXq1FuntvWPBAXtXUmEuy8GkNp021FORMf7WKSwQOcSKSw2gavvhxaj/NIN3nH0vfN+CSIwjg2G05x9+S4AMqAzrx/kkiLj3oH5J2DJcpS9PH77Rn7+t+3anrnhnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765512203; c=relaxed/simple;
	bh=hRpI/uOL9y4FYH4OEpymESjk5y0RqJhWQvYWxm7VlQQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JlSp2ADpQ0DTF84Sb4qahLB14UyN1e3j4q9fTGjknidOoi3Sqm0ST0DUIGoTJJhdTfh+xIsjfxdnVhDnCR2njV7z2plJpkFYv/zO96Y6oHZdJ2+WaNhbfV2gnrVXCo0mvw99U5ULNH+3kUM4p7Cag4YAHcc6nRInQKTkygulgnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wmz/EHXk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wmz/EHXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765512203; x=1797048203;
  h=date:from:cc:subject:message-id:mime-version;
  bh=hRpI/uOL9y4FYH4OEpymESjk5y0RqJhWQvYWxm7VlQQ=;
  b=Wmz/EHXkyp4Q9lCVelPyY5A6DMyYMSq7u7NTXRqVB8ZUOxxsdpnLsNyI
   bNjFcuO7xDNmIvZgABSBj2RHwNOWN+zWBjRhDHMXRvn9G5pFXsXO2k5Hq
   TxmYxaQjANRACBnFlr0lW5olU3aHLVsNfker1iQ8HkL7/T66384ibFwFT
   TZRBW8nuET6HpEuSjhKTG3Gexp7hgHNrW6z5YUU/QqGFdbiyudHuOraq8
   n/HvyGHqcQhDoDPm2Niap76uXgIPvErxrFw0G93++3cdx0AG4JscJTxsa
   9LaYbs1zIEXRtNjlQ867um0cG8vCq80/kSAMPqHTN9ybabzl+QNHCBTCK
   w==;
X-CSE-ConnectionGUID: 8wsvyydsSluhhDRTHeorQg==
X-CSE-MsgGUID: cmxCSC9rTbS5Zd2anlXYiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67550700"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67550700"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 20:03:22 -0800
X-CSE-ConnectionGUID: I9Ilkw2IQQa7F0hhexXr1A==
X-CSE-MsgGUID: pwYhBtwnRuasCs4R7ukzoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197788421"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2025 20:03:21 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTuNC-000000005Tj-2emh;
	Fri, 12 Dec 2025 04:03:18 +0000
Date: Fri, 12 Dec 2025 12:02:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/regulator/dummy.c:59:24: sparse: sparse: symbol
 'dummy_regulator_driver' was not declared. Should it be static?
Message-ID: <202512121137.A83PsV3j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: dcd2a9a5550ef556c8fc11601a0f729fb71ead5d regulator: dummy: convert to use the faux device interface
date:   9 months ago
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121137.A83PsV3j-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121137.A83PsV3j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121137.A83PsV3j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/dummy.c:59:24: sparse: sparse: symbol 'dummy_regulator_driver' was not declared. Should it be static?

vim +/dummy_regulator_driver +59 drivers/regulator/dummy.c

    58	
  > 59	struct faux_device_ops dummy_regulator_driver = {
    60		.probe = dummy_regulator_probe,
    61	};
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
