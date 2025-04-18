Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DB12AD0C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Apr 2025 22:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745014042; cv=none; b=lyIGTMlhlqbomL2gaywWK5BM7Brri4QC6rTLg1hnKRf7Jgo1iRxajbKj8wuGCQbqaGAHIuUp9+7ZCoK3sBHVpsLJj//kYO57O7SNFPpmm84e5DaIX7LT035NQs8rJ9lZf1AuxiYaPXnJG3+wIJxFF/tB7H/ot4HNcd3Us3cyLNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745014042; c=relaxed/simple;
	bh=px6SEO8O67MOEa/+0ClbPZtusv4Vp39Jc8P6KNsl/9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qq7jJDXnOdayivGY0L6a8lJkQjX0rLfzHH4xX4/vtuDJe4T6SbE/8QR06XwWK81W7dHlK3ur3T0HoCc575RK/GU91B4jiSuxDk0N7lplcH21rQXsUFwxeKAm7fWTHc0SlzxpqwuL09QdXQC3kRpDycwU9YyOx1AcpCxa20B2v4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrBzo4ve; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrBzo4ve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745014040; x=1776550040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=px6SEO8O67MOEa/+0ClbPZtusv4Vp39Jc8P6KNsl/9w=;
  b=RrBzo4veH+v/sTkzz1uAXKBT/oGXlBMGyMenVzx0gWO/Z8jCKmpH3JZO
   SI0FBLz5G51OMHnCeGnFMLHJsJ/bR28iG6PYGDUjv0gvjLRyvjSPGi/oA
   mAugpBjxbHbFU/P5mGiF08X9DYsD55oB5+AaVPKSBA5/54vWjVJSPhDhi
   jPePwssSCucwt589FkzndEz5XqAuFuoUBuTVX5vLlddx+f+vVKPuSOzFh
   fPrmiGd1V3NpgPS8ouhudXL75BdrOx4CkYB6Txt3qu2RwSC8nANsc7fP+
   7exrezJdbDf4Qy2lLJRY60PJJkYf15jD3f17QL7iXVofeMocgLYFAJrXW
   A==;
X-CSE-ConnectionGUID: gPiAmyGgTN2RGs2klTA54w==
X-CSE-MsgGUID: 0NnlSNnoQ2+Qj7EKunQZtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46529785"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="46529785"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 15:07:20 -0700
X-CSE-ConnectionGUID: MIAtwVxcR22t/pOBXTzEmg==
X-CSE-MsgGUID: Tj4vrabuSdK0MMOCpFZTXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="131518625"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Apr 2025 15:07:19 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5trg-0003NF-24;
	Fri, 18 Apr 2025 22:07:16 +0000
Date: Sat, 19 Apr 2025 06:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-next:master 3573/4779] kernel/dma/mapping.c:922: warning:
 expecting prototype for dma_addressing_limited(). Prototype was for
 __dma_addressing_limited() instead
Message-ID: <202504190615.g9fANxHw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
commit: 2042c352e21d19eaf5f9e22fb6afce72293ef28c [3573/4779] dma/mapping.c: dev_dbg support for dma_addressing_limited
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20250419/202504190615.g9fANxHw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190615.g9fANxHw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504190615.g9fANxHw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/mapping.c:922: warning: expecting prototype for dma_addressing_limited(). Prototype was for __dma_addressing_limited() instead


vim +922 kernel/dma/mapping.c

8ddbe5943c0b12 Christoph Hellwig 2018-12-06  912  
8ae0e970319ac0 Jia He            2023-10-28  913  /**
8ae0e970319ac0 Jia He            2023-10-28  914   * dma_addressing_limited - return if the device is addressing limited
8ae0e970319ac0 Jia He            2023-10-28  915   * @dev:	device to check
8ae0e970319ac0 Jia He            2023-10-28  916   *
8ae0e970319ac0 Jia He            2023-10-28  917   * Return %true if the devices DMA mask is too small to address all memory in
8ae0e970319ac0 Jia He            2023-10-28  918   * the system, else %false.  Lack of addressing bits is the prime reason for
8ae0e970319ac0 Jia He            2023-10-28  919   * bounce buffering, but might not be the only one.
8ae0e970319ac0 Jia He            2023-10-28  920   */
2042c352e21d19 Balbir Singh      2025-04-14  921  static bool __dma_addressing_limited(struct device *dev)
8ae0e970319ac0 Jia He            2023-10-28 @922  {
a409d9600959f3 Jia He            2023-10-28  923  	const struct dma_map_ops *ops = get_dma_ops(dev);
a409d9600959f3 Jia He            2023-10-28  924  
a409d9600959f3 Jia He            2023-10-28  925  	if (min_not_zero(dma_get_mask(dev), dev->bus_dma_limit) <
a409d9600959f3 Jia He            2023-10-28  926  			 dma_get_required_mask(dev))
a409d9600959f3 Jia He            2023-10-28  927  		return true;
a409d9600959f3 Jia He            2023-10-28  928  
b348b6d17fd1d5 Leon Romanovsky   2024-09-22  929  	if (unlikely(ops) || use_dma_iommu(dev))
a409d9600959f3 Jia He            2023-10-28  930  		return false;
a409d9600959f3 Jia He            2023-10-28  931  	return !dma_direct_all_ram_mapped(dev);
8ae0e970319ac0 Jia He            2023-10-28  932  }
2042c352e21d19 Balbir Singh      2025-04-14  933  

:::::: The code at line 922 was first introduced by commit
:::::: 8ae0e970319ac0b516d285650a744bab4ed3dd37 dma-mapping: move dma_addressing_limited() out of line

:::::: TO: Jia He <justin.he@arm.com>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
