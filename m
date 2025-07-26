Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E65339A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 13:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535448; cv=none; b=J3jaR64z59cG9e//E+pY1xVvL+bTvPuoAj4J9wuVkmZ0xqPKA5XzUWMrT/Xc/yWN2Uw5g2EhNm6KqasFTGudcuvFTbTPXa/KsSJlF2LyHzclc6UyaD8E0aokRYTwsPDBFYte/q00DQFwtU3KEDa5yShq3dqMgvQ9CAv2RRiic9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535448; c=relaxed/simple;
	bh=MUr2pfCRzwQv/cxIlfRNNx5NuIqzQZytUjrYtJlln3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snizNSzT0M7e5DDrBxx1BBOo5dAczNRa80E2rY/2gnCflZulz8357fPLHytFuk9KSdtKVu+kQa5Tm6muVLBKjGLGZfZi0AG7Y7yNzVdlWG6JKS3niBtigk1C0ttpBwOWubQrU9dvfFKfqG4a0xcTvWAGqYjwEZrMY89vmL+KhGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEQTZKkg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEQTZKkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753535447; x=1785071447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MUr2pfCRzwQv/cxIlfRNNx5NuIqzQZytUjrYtJlln3Q=;
  b=lEQTZKkgDwfGQowJA0tulFmQG42fkBSBV+DNVLRWnjqW7Rkw4UIIvNGm
   924nYsbIgqSQmDt1YTLva7+f9fOmEsfUy/fyEi3lvTXl59L+O+QnuauqY
   vUSLpGCAxn2RrdEQzUNM5BtzfGQJiqDCWrX8hnj/nqvjrd6foQn4Pm0QA
   WnP67gCiJI9sMcfZR6veBBgmtGRGyqMwiY4N1FmPy4m7GwvCvg9JogUVi
   KZDTBTbDx65sCbixbzgIzQhA/fJ1bum+ZOXBLBqDbpSwWVCK03BoxTDjH
   UDJ2cxiOxPwYGhb1zxtQVTAD/qzXu2f5YJIS8AYFzLMtypVxKZMBNbsFc
   g==;
X-CSE-ConnectionGUID: 7w/AIFcfQ8WZR6AXaldi0Q==
X-CSE-MsgGUID: 4XesXcx5R/Of/EbsZ7tKDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="56000834"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="56000834"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 06:10:45 -0700
X-CSE-ConnectionGUID: +D4fztZ9S2mnFjl5+0kjmA==
X-CSE-MsgGUID: jzqKvswbSSeFtzKVh8YE1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162356963"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jul 2025 06:10:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufefg-000Lzj-1H;
	Sat, 26 Jul 2025 13:10:40 +0000
Date: Sat, 26 Jul 2025 21:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>,
	Shankar@kaveri.local, Uma <uma.shankar@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>, victoria@system76.com,
	David Turner <david.turner@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm: Add HW_DONE_DEADLINE immutable atomic CRTC
 property
Message-ID: <202507262035.wxgiJwAZ-lkp@intel.com>
References: <20250724165220.1189129-4-michel@daenzer.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724165220.1189129-4-michel@daenzer.net>

Hi Michel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.16-rc7 next-20250725]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michel-D-nzer/drm-kms-Add-DRM_EVENT_ATOMIC_HW_DONE-event-type/20250725-010202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250724165220.1189129-4-michel%40daenzer.net
patch subject: [PATCH 3/4] drm: Add HW_DONE_DEADLINE immutable atomic CRTC property
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250726/202507262035.wxgiJwAZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507262035.wxgiJwAZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507262035.wxgiJwAZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_crtc.c:963 function parameter 'deadline' not described in 'drm_crtc_set_hw_done_deadline_property'
   Warning: drivers/gpu/drm/drm_crtc.c:963 Excess function parameter 'capable' description in 'drm_crtc_set_hw_done_deadline_property'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
