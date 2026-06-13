Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614C23DEAE0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781355542; cv=none; b=EqCghgpZxFH8/zsqN6zXFFFEj+0XZiM2yvY5eOLQ4hzZP1YfmX26qToX2gQXq4HDQLtUIpnsvSMZZKL2DI2C2p1dHgntR0VenkHDRE1FNCOQhk2jFVEE4t5OsWG6xUla485qyPMRNk7d1yIRoTVarJV+AMxDIOXMhe5MIlmiKeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781355542; c=relaxed/simple;
	bh=trorSezLe0VqUf7MsJmAoYCY0RMpiFNMujxzGANO9+0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TZNvye+dMxWCw9U3Y719dD0jv3z5Zxjs/e1Wk8zREbuVmJWSBiXa3wQHtETUhfodlEsi+a1z/B1TWWcBUYfP6mDDvb1Zu9+jMG5K+zXHnGX6OsaVV03ryR+HJTJaA3NrHcuiNd3VQ1q7gpdFXaZKu5HmmyDWBiCob9FdxxJD1G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSNxd6tQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSNxd6tQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781355541; x=1812891541;
  h=date:from:to:cc:subject:message-id;
  bh=trorSezLe0VqUf7MsJmAoYCY0RMpiFNMujxzGANO9+0=;
  b=CSNxd6tQqMkifIJmAwV7F6fneQXwE+P+yH7TV88Pl65z2QRI90FiTFZE
   KHvVb6qA0VLK0CB1IW2USiR0DT7bKZSENh5s35+svlLqxuYwmogyIzhwS
   JMEtDnEyNDPGy9IrN5eR0nZLOWW2MwJRGy0Fm+lHiEHxJLCQ6uAH7cSrG
   UcMSTQSdULsA1mJ2UiCwNFZyRO7YYuOiD1YYqeJFfJO9R+X2CiH3X6Fuy
   V1Ip4JK3fK2yqAgWi9HdlSo8o4ciymMWWsskI2PtyUgOmU4We1ssVjSat
   aPpQIku/m46KBl2O+l4efaERV3h0dXQrgAVo1+bvro7LItHbOmN0VBQzQ
   g==;
X-CSE-ConnectionGUID: 3bmL03pOSa2M7D5T8glBVw==
X-CSE-MsgGUID: FQ+3PrZtR8WBZC021273yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86065393"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="86065393"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 05:59:00 -0700
X-CSE-ConnectionGUID: 0LlWkXZ4Qs+/u9kavZAPYQ==
X-CSE-MsgGUID: yqsF0c6hTamrvn8qOdKBzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="245937234"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2026 05:58:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYNwu-00000000Puu-0b0L;
	Sat, 13 Jun 2026 12:58:56 +0000
Date: Sat, 13 Jun 2026 20:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tsm_d0 1/1] drivers/pci/tsm.c:900:13: warning: suggest
 parentheses around assignment used as truth value
Message-ID: <202606132045.S5Y9fQe3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux tsm_d0
head:   5d1328bf1d1aa1bfefc2aa97b82783e053dccfda
commit: 5d1328bf1d1aa1bfefc2aa97b82783e053dccfda [1/1] PCI/TSM: Resume device to D0 for CMA-SPDM operation
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260613/202606132045.S5Y9fQe3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606132045.S5Y9fQe3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606132045.S5Y9fQe3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/tsm.c: In function 'pci_tsm_doe_transfer':
>> drivers/pci/tsm.c:900:13: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
     900 |         if (rc = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |             ^~


vim +900 drivers/pci/tsm.c

   885	
   886	int pci_tsm_doe_transfer(struct pci_dev *pdev, u8 type, const void *req,
   887				 size_t req_sz, void *resp, size_t resp_sz)
   888	{
   889		struct pci_tsm_pf0 *tsm;
   890		int rc;
   891	
   892		if (!pdev->tsm || !is_pci_tsm_pf0(pdev))
   893			return -ENXIO;
   894	
   895		tsm = to_pci_tsm_pf0(pdev->tsm);
   896		if (!tsm->doe_mb)
   897			return -ENXIO;
   898	
   899		PM_RUNTIME_ACQUIRE(&pdev->dev, pm);
 > 900		if (rc = PM_RUNTIME_ACQUIRE_ERR(&pm))

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
