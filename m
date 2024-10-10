Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB27D1BD005
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 08:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728547499; cv=none; b=O5oW+RYeBGxdDzIBXQW59Ly/QP3nGyhclRgDV/R+yx+WJVwQW9x5VgZUOpIbLOWylg/IsIZOP4ojYAUV4342KyuQ1VECvQ2U1FxN/s+o6VpJXVP/XtHHcTgxsyoZY1IGA/tSc60VZeiga20uFgesU6qJDa5W8r/WnqM55rQjA3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728547499; c=relaxed/simple;
	bh=OiyiZ+1BnoukLqrAFXdcXE225UsVAN+CHCEfoR/ipoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVhPCwyTq58S/3BTIsE3aI6GwewgLturr0ngAwyEBZXOGT+cHvIcmCWCMqccxC6tdzp59UQEV3v6CPxaxkbeSgZJg+EjVeRnEF1lqr7Q2uL9odVmISQXwBX5+s2lJtZbKDWZhNdHZfG/ePINwqeIAiMf79uDe1iscicJdXRJ2dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZQKi6RJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZQKi6RJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728547498; x=1760083498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OiyiZ+1BnoukLqrAFXdcXE225UsVAN+CHCEfoR/ipoI=;
  b=JZQKi6RJr06+6XivxgzUWqfngRTK2/IYsWYokkVUPwDu63QtAOSx6ZOO
   JwO4aEAaVk2SaSXVkExwOLK0WdDLletFgtEC+jEb/vBpTyqGsA3jysUmn
   EapLEfnF+f3MNRij0hjVAg/bc0wv7wdkNhqiMu4LJMjFVE4vJiLN61uDb
   udDuSzl7qkMlLgn5WJj9EI6sgLatKfnbZeH/uadWRY5ncY9xXFpx/XBYD
   YliAY1yiLXwckxxdTHMbgilKm62Q23DrvstnWoaHfW3vzQ1c1dQ9v3ZnT
   vHNNaiQPwsWzGpNw3BnKUGXl1xSCkgk922K2SfDZbGBrzm5hfwKBMUpih
   w==;
X-CSE-ConnectionGUID: ySGHg9HoTNKSaudfXaBbmQ==
X-CSE-MsgGUID: acRsEyJ3RI+Zo2DmnydgHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28005452"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="28005452"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 01:04:58 -0700
X-CSE-ConnectionGUID: 4xIDIZldSqKA//PguxSJYg==
X-CSE-MsgGUID: M3/ygp56QbqdfPsHupe+6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76725881"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2024 01:04:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syoAH-000ANU-2G;
	Thu, 10 Oct 2024 08:04:53 +0000
Date: Thu, 10 Oct 2024 16:04:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 61/65] ERROR: modpost: "xfs_zone_record_blocks"
 [fs/xfs/xfs.ko] undefined!
Message-ID: <202410101604.vzsYtOo5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   d8a9d812373b2a67b55d9122292f21f4b75a28b0
commit: 504ee6e13910320846d5913b48941f7d995eff5c [61/65] xfs: split the zoned from the COW end I/O path
config: i386-buildonly-randconfig-004-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101604.vzsYtOo5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101604.vzsYtOo5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101604.vzsYtOo5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "xfs_zone_record_blocks" [fs/xfs/xfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
