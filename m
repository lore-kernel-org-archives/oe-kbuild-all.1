Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC52C236D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 04:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766465082; cv=none; b=lxqbNUJagDod7N2hpMER1qiJrU/Q2cKMWFMmYD6q3ogIOzmjtqK0df6C6S9jhfwokopkjPBPuaZ1P9zVOm6s7MSVC9FEAkq/jj0dNRnEXN1H0pUrQWdYbaGLvdQug88ux0idmzf/DHwBGSqyF+k6d5YsyXxWo9qE4Ah/6R02HI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766465082; c=relaxed/simple;
	bh=dgQAGyay30tEz9e1Kx5nGhTf5DibPWfJn8ynooqEIqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VAel/SwRsAgL/6mbtSFaeKUT4KmkvQLA9JdSDHIg/cLnnWyxM30Qs2OCAlCy/9Lu0pp8Olrqyc57WyYqcrOT/QgDCFKV00/LUUzg+ktHXXdTCfQPuJUIzMKuMDQVSsdKqj+VQ6o2FjQLLoHb0PTjOUQBv8wh5WyW02ZpoA8+VnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDAIjH7q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDAIjH7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766465080; x=1798001080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dgQAGyay30tEz9e1Kx5nGhTf5DibPWfJn8ynooqEIqo=;
  b=EDAIjH7qgk/71mkHYngy0h6GcutIkPJ7gzsbhNz6IQPnPRMbVpt5optJ
   vwDbPk/YXqcUZnGK5Es4gqiDr+OnJBKEl6ocBeclTvDh/LiRtw7bljb3X
   4UDzTlr+A7VJumg/f0Hp+JWY5UAZZW4uMBoT+5jJYo20CyiznXHtxXTGz
   6dAAX62eoJsXZXvCv8tUaQElcin1/LkDnaPErHgmu7m3lS5Vnfuh0bivn
   y7gSruxJM0CVjA5byluBFAdMIKoTMCtb8+2x/6CZYcWAAgeQXhEeHf6xX
   +BM7TXoAGD80kazOW5+y0xUcruQvwbr5fETZ/SQHuHKJCfJgCj2ecyjYo
   g==;
X-CSE-ConnectionGUID: 8zGcab5kR7aN2TpqqawWHw==
X-CSE-MsgGUID: TLSv/M93Sj6a6w1+HBqe6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68199157"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68199157"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 20:44:40 -0800
X-CSE-ConnectionGUID: bbeWjXc9QEKvcZLLVvy3rA==
X-CSE-MsgGUID: 8qoImaPZTWC7rrQfS1y0zQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2025 20:44:39 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXuG9-000000005po-15Oc;
	Tue, 23 Dec 2025 04:44:33 +0000
Date: Tue, 23 Dec 2025 05:43:35 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 15/15] kismet: WARNING: unmet
 direct dependencies detected for INTEL_MEI_ME when selected by
 INTEL_MEI_HDCP
Message-ID: <202512230557.G376Paav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   4e640d57b9513962095028e1186dddf47814e50f
commit: d31eda960d587e7797f948cb91d5cc9cf951e9b2 [15/15] Merge 4cece7649650 ("Linux 6.9-rc1") into android-mainline
config: arm64-kismet-CONFIG_INTEL_MEI_ME-CONFIG_INTEL_MEI_HDCP-0-0 (https://download.01.org/0day-ci/archive/20251223/202512230557.G376Paav-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230557.G376Paav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230557.G376Paav-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_HDCP
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
     Depends on [n]: X86 && PCI [=y]
     Selected by [m]:
     - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
