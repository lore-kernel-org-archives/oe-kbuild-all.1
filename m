Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5EA26E179
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 15:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766504543; cv=none; b=Y0ouQkr+n3y/4M+swUhYjQVfrzzqOxilSLibA6yp0jY6erF4BomJO2NHF1pBoJJ7g62tn20J6hH3644LXHC58NMDHtO9Y2kuKsVGykjZm9D2fADpI3emnw6h6EXntE+KSC+sYo8dDaMV7vPE9VwkN+rLOVJruaCLP5uB88zO5Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766504543; c=relaxed/simple;
	bh=uvj822lo33RsBgpvRskxSsABc7sp6KZ2G0vjqPx7N2s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WEruCTKKpayrmLJeGuEPpMjzZ++2CfYQbuyN2nClJZ/EEs6Oba3U9VTSGFibm94dgoq5KiNx5yhL/q1Z7Ta75WztkPrcNXQRzPKs7nzGVxvAM2mC3q0BrMZYGhIS+aq2mqeU3dpH0CNjyNIuq+yIFYda7Q6gGdYeBPfTyJK3DSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YL/Hqb2/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YL/Hqb2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766504541; x=1798040541;
  h=date:from:to:cc:subject:message-id;
  bh=uvj822lo33RsBgpvRskxSsABc7sp6KZ2G0vjqPx7N2s=;
  b=YL/Hqb2/c9G89k/n1i3ciePaaNqAmCo5hvYdUzZBYNDC2xPmIy7IekPa
   x4OJLACv5ZF5QmF1tcEepmmDU3HopDsseCmZ9HKNtaU9qW5PNdrgP/IuP
   eMTU6MxvBu/B73PFMUkN2BlyzimW5m+vhn9/BJzhJpjWg6fWNqWtB8QMQ
   nKryuxoL8QxzrayoCZ2WGKrsPLVJyPlT8h3UpDgB5edHAxKmzqxxDZe+x
   xjy+YRa8qkpxtnPK6J2pmxMOFKoSa5P3Jm6DQcrMM821SDs+y+x4ms/xa
   bQ4Hu1N3Rcu5zaG1NBnZjxe19VKkGzLidv0fs1i6QSn1klzoXmJ7fVHB+
   w==;
X-CSE-ConnectionGUID: D0ve2paxQTqTN01MSx9VPQ==
X-CSE-MsgGUID: Eun2BhsIQo6EFS1kRTeQsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79804938"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79804938"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 07:42:19 -0800
X-CSE-ConnectionGUID: 62kADcLqTsC+0rf7fpyXRA==
X-CSE-MsgGUID: N0LQ43jFSS2WymnkYeAlxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="200707099"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Dec 2025 07:42:17 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY4Wc-0000000025F-3H9h;
	Tue, 23 Dec 2025 15:42:14 +0000
Date: Tue, 23 Dec 2025 23:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2/2]
 drivers/crypto/ccp/hygon/hct.c:2175:30: sparse: sparse: symbol
 'hct_noiommu_fops' was not declared. Should it be static?
Message-ID: <202512232326.ySrpmNr0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: 6e2db6d2859f5c41ff51b696235dc3971f4bcd22 [2/2] hct: supporting memory encryption in host and wb set in vm
config: x86_64-randconfig-123-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232326.ySrpmNr0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232326.ySrpmNr0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512232326.ySrpmNr0-lkp@intel.com/

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
