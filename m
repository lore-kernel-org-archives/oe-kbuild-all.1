Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC87259CAF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 05:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748497418; cv=none; b=Xx7VSykCcwZ6mhCfE6jwWCzJUf20owT+FbM3FOlPa3PEJUQgYoqoGn/OmGioVs0FcvSjP7wc/x3sO+FPX6+VIpposvXFWXsBhC9bbKAenPvTPjUbLpodMsPazV1N7kZaKrDL2D5lq6XwJr7A+YAd1CI8R3b7dxZmTsc7SHfXEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748497418; c=relaxed/simple;
	bh=FjkplMudlya5diOegXuMVIXAhK7xMMXihwz2h+vot60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ESMRC/0XW6GKphHQ8wtxO0jEcP2SoQAgWNogBrw3dw4lBsS2Clveo3IJI65trZjugiAIIbaco9nf0/9pOWYcjfnon2ACViJ+a+C0+as2abmyIkbAjuBaMo8dKk7LcOVln2EnwCOXNX3xWkaDcL0y6P8q2GRY278bBqExxuF5uIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKk9DRJM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKk9DRJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748497414; x=1780033414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FjkplMudlya5diOegXuMVIXAhK7xMMXihwz2h+vot60=;
  b=hKk9DRJMEPPpjyP8PNUP8Va0Y8G96o2H8T5IcdN1Tv7+NpDDBE1e1kr5
   lIxzZZW/+sHdNLP5WRVMP2hPBQoxsMEKgaUXw1n51S2LddG6jj9x5cRIm
   bkivGGHfd+X02sBVEGZA85CuBNxTdvGbpcwTNxgvWT8Qkpou1IgjQmkXQ
   LE6rl7CbVrqhFnvNefXMT1l5Ul+WVXJV81y8HjswpwWl+uv9A/A5uFiRt
   0slc7Szbo6pIi+Myht3/8o54PcgBbGKC9WsUjrvaycJ6CwXC93TWDQN5D
   SbwTmK5T20vTBacEclQqmXjppbLHRl14UT1KUAp+t4FgB4e2W5Zj4M/Nl
   A==;
X-CSE-ConnectionGUID: IgbJYAiVSZekTC7kXu0ELw==
X-CSE-MsgGUID: I8YOti3eTCG+4pmymZX/zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50698686"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="50698686"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 22:43:34 -0700
X-CSE-ConnectionGUID: IKGOWzTdRW2x54aeQ6w5RA==
X-CSE-MsgGUID: CbY5uL63Tga73mOWcS59rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="147349253"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2025 22:43:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKW38-000WMg-33;
	Thu, 29 May 2025 05:43:30 +0000
Date: Thu, 29 May 2025 13:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2331/2331] kismet: WARNING: unmet direct
 dependencies detected for DEBUG_FEATURE_BYPASS when selected by FAST_SYSCALL
Message-ID: <202505291329.BZ34eEzz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66b0cef2a959be1562a528e3d8cc260dc3803e61
commit: c294b5b18fc820cc006dd69fadefe24d4c321412 [2331/2331] arm64/Kconfig: Add turbo features submenuconfig
config: arm64-kismet-CONFIG_DEBUG_FEATURE_BYPASS-CONFIG_FAST_SYSCALL-0-0 (https://download.01.org/0day-ci/archive/20250529/202505291329.BZ34eEzz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250529/202505291329.BZ34eEzz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291329.BZ34eEzz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DEBUG_FEATURE_BYPASS when selected by FAST_SYSCALL
   WARNING: unmet direct dependencies detected for DEBUG_FEATURE_BYPASS
     Depends on [n]: (FAST_SYSCALL [=y] || FAST_IRQ [=n]) && !LOCKDEP [=y]
     Selected by [y]:
     - FAST_SYSCALL [=y]
   
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
     Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
     Selected by [y]:
     - ARM64 [=y]
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
