Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C74A28FFE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339390; cv=none; b=KJUWTBcMUSL4lOjZuLVSI3bGo8nerWrvJTvOKeGABcjRKeI37NkXWxlHFu+wlcJs7bAlcRlaFIDof0BC8ffHTdMCyjqrKh9bXSlPK7ArPyuFCa5HFF83BVsVcfZYsipMGekpLRBp6neMeb6IcVdTW7zmdISpk+aejtwsRPph934=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339390; c=relaxed/simple;
	bh=BjCKZGTXB/uQ5b/mANIivmBUEKcsp6ADJaiTPKVG+vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dr5mxvD4dvSEOxycf5JlkUn+DPmfO44cAXTPSD86OgvVkmRLOV8CCNhpM7URb29MVSEGA6SnjLiPWd7d/wxzyL6PAzMpGbMGig7M3/iG89bHLOVh2bUZT5u38wbj1PG/9OtNbKulB2uPQ9dbFWgzZbLhHepdW1/Dx2Th9YMzRck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibzkFN+a; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibzkFN+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745339389; x=1776875389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BjCKZGTXB/uQ5b/mANIivmBUEKcsp6ADJaiTPKVG+vk=;
  b=ibzkFN+asUtpFKCj3xsVT2EkM/eczQ78G5ZY7B9AJuS8UnqA79Lt4b6/
   VbiziVMsxRhq+ZSF1BQzWBoQRDzPOjyWQ9MDDKXKwlbH8cFcM9s34WttN
   ruuQBAr6Xtgyg9iAvwf5T4KtpxJwtl3vuNCnvdUrKNHJNWmHpBUxPye8l
   Vcgck3rNsvMKfGoTQLZUN2nmbMzTPUoDlw9Zyhi5BWm0vaPe6hUuPtuBP
   OZwkaQJqzVGGcZwjO+luQukkhiXzjW/ZLxfniv1UXLFzvV7XGyZOch1u7
   2cl5nEKqATmt2DmT6JTJMTtDXstBQZ/o5Ehdr5Yw6XwGw2t0Skrx8lU/0
   A==;
X-CSE-ConnectionGUID: ltnNv8bhQma3GVUzKv6rSQ==
X-CSE-MsgGUID: J2PSwvIqTy+dQpufSCf6Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="72294067"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="72294067"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 09:29:48 -0700
X-CSE-ConnectionGUID: EMPMOTWhQfOab8Nb50xXtA==
X-CSE-MsgGUID: z+PxoM6xRe27xvNrEAXXLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="136848146"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2025 09:29:46 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7GVE-0001Ak-0F;
	Tue, 22 Apr 2025 16:29:44 +0000
Date: Wed, 23 Apr 2025 00:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>
Subject: [linux-next:master 4702/5419] kismet: WARNING: unmet direct
 dependencies detected for DRM_DISPLAY_DP_AUX_BUS when selected by
 DRM_ROCKCHIP
Message-ID: <202504230032.c3sVVT9R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2c9c612abeb38aab0e87d48496de6fd6daafb00b
commit: d7b4936b2bc0987ccea125d9653381a1a0038d6d [4702/5419] drm/rockchip: analogix_dp: Add support to get panel from the DP AUX bus
config: alpha-kismet-CONFIG_DRM_DISPLAY_DP_AUX_BUS-CONFIG_DRM_ROCKCHIP-0-0 (https://download.01.org/0day-ci/archive/20250423/202504230032.c3sVVT9R-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250423/202504230032.c3sVVT9R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504230032.c3sVVT9R-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_AUX_BUS when selected by DRM_ROCKCHIP
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_AUX_BUS
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
     Selected by [y]:
     - DRM_ROCKCHIP [=y] && HAS_IOMEM [=y] && DRM [=y] && ROCKCHIP_IOMMU [=y] && ROCKCHIP_ANALOGIX_DP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
