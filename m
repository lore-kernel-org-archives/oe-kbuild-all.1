Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C084F4C9D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747505287; cv=none; b=Xz60vpfx8S2P3ylkl2pRx3rbQ48vu6uGDsrKzAPQo+/hwEwFOaJ+Km9dx/il0T2HFlBNM8nx2oYvpV8mDedZ4bWeqErLQd3hQ8Jutjc8rGfGopnlD8mqvrcKU4SMrv8X22b1UWcWQzDZM+hLa6ECkGgnxcQ6uHveCtfRdVCpaJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747505287; c=relaxed/simple;
	bh=eLaMSZByVRAxHb+Y5o0S2CHW/qCLTS96QzNeJDjpPfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gUWg4DA4iOl74D6/WK8z8qMZk5bsYCIrDF3KYOgVAv3XEYmobWF1xDYOqhM8BfsAUwuYDmtcxtcoTv8lP+CTpHbfzf47iJJC055IkVgNtjfikIZEyl/QGZL6RbKibtpMqda5Xoj5ga8l/YKJjaFV5U9oHnlgWIM5F/4TrMn30jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDRGqbzg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDRGqbzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747505286; x=1779041286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eLaMSZByVRAxHb+Y5o0S2CHW/qCLTS96QzNeJDjpPfU=;
  b=QDRGqbzgpa3l8fv8hPBmEgCE8P039kjLZqY2utF0nNdLQwTBhZXlW9U1
   JfLa42q2YIoJEvCjFmHZKNFaHyCERilh0xGR4mJspUPpm444myqmrtLoU
   rpItPXsQ+MPwX6zgSYhZk5855iW3UDdT2/WBkCjK9OmZBDLngaHzu+O68
   B0JczNRLNxigPyVAVjDEsmve0SlZ+Rq1WOZo/RSt0eHqLl0LbiHuE9q/b
   ujR/f3umg68/DKVkNeUqkfgCC/dIpLYgjEeopI7wv3WOtzHA19tWrCLDk
   L2PO5hCIeB8JKFzCooNHKdUoiWuxU1oNWozQ2/beXJIL8y8zV+ucKRe7F
   Q==;
X-CSE-ConnectionGUID: R0Ym4g57SzuvIt+NmPptzA==
X-CSE-MsgGUID: EY0E85oEQ3qJ7ZYa0mrK7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49521380"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="49521380"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 11:08:06 -0700
X-CSE-ConnectionGUID: V7VEysnQSVq9jm1QOmVkpg==
X-CSE-MsgGUID: kVH+Kcs1QuaDxetSurBvRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="139872782"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 May 2025 11:08:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGLx4-000KKX-0N;
	Sat, 17 May 2025 18:08:02 +0000
Date: Sun, 18 May 2025 02:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stffrdhrn:or1k-allyesconfig-2 4/4] or1k-linux-gcc: error:
 unrecognized command-line option '-mcmodel=large'
Message-ID: <202505180115.TrWFwA5K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stffrdhrn/linux.git or1k-allyesconfig-2
head:   c80ff8aae1207c8b1b8a00ebb709e03207940bdb
commit: c80ff8aae1207c8b1b8a00ebb709e03207940bdb [4/4] openrisc: Add -mcmodel=large support to fix allyesconfig
config: openrisc-randconfig-r064-20250518 (https://download.01.org/0day-ci/archive/20250518/202505180115.TrWFwA5K-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180115.TrWFwA5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180115.TrWFwA5K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> or1k-linux-gcc: error: unrecognized command-line option '-mcmodel=large'
>> or1k-linux-gcc: error: unrecognized command-line option '-mcmodel=large'
   make[3]: *** [scripts/Makefile.build:203: scripts/mod/empty.o] Error 1
   make[3]: *** [scripts/Makefile.build:98: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
