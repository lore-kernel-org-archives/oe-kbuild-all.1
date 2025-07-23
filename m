Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE4C149C41
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753287817; cv=none; b=mJjMM+Kk5lB4lMFY9pUrgMA+Onfc+MQh2d4tFEOYGBN/aoB2uxqw+6463rxOPhmxS2yoO63NZ3okezOlTROgR5zWxDXvkeQxlQeO/NZwhBgziJJLY5LjNMsV1plozCHmMvV9vr/bCGtmnYPPDoO1BytJi2xIP8O6kXy6GuNokQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753287817; c=relaxed/simple;
	bh=mSMSqdAHWMGj6qQJ+rur2V864haBiCYCUhdd+P5nJVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ker0bb1P2dMBZSQdJ/b+66uyxW0K/Fg8L33e+fa0ESQfnWfW8mn5bWNOCfPshbq50pVx5LVgR+LrmVM6zxKhZq9cLhQCKf/3+4+0qkgaDV13S7YZZrXbXz3I0E9QzF5DrhXZCD8VvVx52nCApSh1oTlB5I8DIs8TUy4mOk/fo5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTghQz9S; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTghQz9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753287816; x=1784823816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mSMSqdAHWMGj6qQJ+rur2V864haBiCYCUhdd+P5nJVk=;
  b=NTghQz9SHcfo3rY6SL9S3/RS9HkAtVh/n28fmWCPqrIWEh2d0SYL1eJ5
   SXtKHRYWHu2NTktkFioucVjGC0tZC023/M/7yh/M1PL6Qe5ypc1W7gh2g
   cBxZiIncC0p0h+YNwBXS1292haZjPdtb8zSMIm+pf9zGCX9T+gBa4FUD6
   re6dGplEzX9gfLHpx7fw/54Hs1Wx6uUYKRGDfecqawkwNZfHGCfDKD2TW
   CZLaYhroAmrDlU4flZxi11/IbHu59dX9gG4yzrDItZDYNXlbqxBKOY86r
   kxndyTxkvjTAfYfcDIK3XObipRr4zoDwsAWyjAUkDiDGkfWy/osuGI2ym
   g==;
X-CSE-ConnectionGUID: xVxj7DgVTnGO9NrYDI9Ldg==
X-CSE-MsgGUID: GGrKFVnRRDOBogkSdVBj7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59237039"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="59237039"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 09:23:36 -0700
X-CSE-ConnectionGUID: 1zJRo9JnTtGJnExoCTWJHA==
X-CSE-MsgGUID: L/hU4U9ySay98CX006d+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="163681431"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jul 2025 09:23:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uecFg-000JXf-1D;
	Wed, 23 Jul 2025 16:23:32 +0000
Date: Thu, 24 Jul 2025 00:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1] kismet: WARNING: unmet
 direct dependencies detected for IOMMU_SVA when selected by
 GKI_HIDDEN_IOMMU_CONFIGS
Message-ID: <202507240031.IWTI9D4y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   d671109f9c2772023d19a4f10c4ad5d4ebf5b391
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [1/1] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: i386-kismet-CONFIG_IOMMU_SVA-CONFIG_GKI_HIDDEN_IOMMU_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250724/202507240031.IWTI9D4y-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250724/202507240031.IWTI9D4y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507240031.IWTI9D4y-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_SVA when selected by GKI_HIDDEN_IOMMU_CONFIGS
   WARNING: unmet direct dependencies detected for IOMMU_SVA
     Depends on [n]: IOMMU_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_IOMMU_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
