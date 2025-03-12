Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDB72356A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741769891; cv=none; b=upfiq2xOHp+Xy2LJxDNXmnCrGf9s4uzt0tVaHePTG6nPFQMG20g92gzzwgwu6HS0FNvWnFhVhHqz77PFHOqKHVZWPqaCvI8P/vfDmf3RWLW3qZpakBpPxNlTgQ/83hnlYkL+7jNC9PmnT2j1bsRH597N96qo1yuirCe2QUj64IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741769891; c=relaxed/simple;
	bh=PEC5G2GCrifbbUI/1tvL+CsrNlPHxrsEB+xXwPTMgHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W+xekpW1XiLuMCabLwTBjAfVMS586zSsqbiT5WrWLY3b9NRNT52GJZ/jbyVn6VAOea4jdspUWeHYilxNZ+1hqU4j0vbADJk4WeCVvbvQuzg7i4xH3Bnvie6jrzlBfMY9m6T7+oY/CmmGZnOpzfJLno8oO+qdBTI5K5vqadJ/aw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asw6j5VS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asw6j5VS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741769890; x=1773305890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PEC5G2GCrifbbUI/1tvL+CsrNlPHxrsEB+xXwPTMgHo=;
  b=asw6j5VS3cOFM4BsnYYPB9OSWAtmaG9U1BIrCcSfTN717kitOZtAHiYj
   YWaWEf00xbT4WDZ6zefb/aX8Y//uH32aRmRIcLfoT4hOpUrn2Nx9LoZMS
   UOUzERF2R30JXHilQr5WDS0ej2VMsKubvbeXnkUXSn8WXUtBtKJVIbiAn
   WVuJ8e4aT9G4nTsiRD2VGexIq9FmiovB265JO7DqvFIZ3dXAV3qffq3Pw
   FaL63psOzqCJ+FMial+8CGiRiHnGsI36arNZ5Zgg35w/Cq6r2kycvZeNT
   nH0hy919Uhhdn8z+m1D0REVHn6VLZf7GGyE5/y0MNQKlTFRsxDrfdtKHB
   w==;
X-CSE-ConnectionGUID: qnQbWrw8RUuImT7rQmXHBQ==
X-CSE-MsgGUID: nRRSf8pWTKGrWOATZ3UCIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46484157"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="46484157"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 01:58:10 -0700
X-CSE-ConnectionGUID: se198f3URNiY4gj+ZEWtTw==
X-CSE-MsgGUID: CZ4ilLBVSTCzElQix4/Tpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120600758"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 12 Mar 2025 01:58:08 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsHug-0008Io-0p;
	Wed, 12 Mar 2025 08:58:06 +0000
Date: Wed, 12 Mar 2025 16:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6/6] kismet: WARNING: unmet direct
 dependencies detected for GENERIC_GETTIMEOFDAY when selected by
 HAVE_ARM_ARCH_TIMER
Message-ID: <202503121650.YUBe5WD4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   196e23be873afbb2901b85db8be99549a8cbd0f4
commit: a5ebd44814f4303c7b249833698574d48ebf1aae [6/6] UPSTREAM: arm64: Introduce a way to disable the 32bit vdso
config: arm-kismet-CONFIG_GENERIC_GETTIMEOFDAY-CONFIG_HAVE_ARM_ARCH_TIMER-0-0 (https://download.01.org/0day-ci/archive/20250312/202503121650.YUBe5WD4-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250312/202503121650.YUBe5WD4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121650.YUBe5WD4-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_GETTIMEOFDAY when selected by HAVE_ARM_ARCH_TIMER
   WARNING: unmet direct dependencies detected for GENERIC_GETTIMEOFDAY
     Depends on [n]: HAVE_GENERIC_VDSO [=n]
     Selected by [y]:
     - HAVE_ARM_ARCH_TIMER [=y] && CPU_V7 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
