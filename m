Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E648914F125
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 00:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761437018; cv=none; b=t+gKY1uIOEfuidwuYm2Kd3MNVTZEnhOvqZ0/+guD6TeOzC0YIAFMT6bDMUqbGx0mqf/zNOYBTa/Xb/M1Flb63Z6dnVk8UBKDc+f4mxOmD9TSYqglFe0Nn/8WcDx6JweMHzTEFJvxQ/nOWzZw6wkNLjgwmDASMpBzgde71PWN+D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761437018; c=relaxed/simple;
	bh=oy8CY58sYVyKhQIkxBwaW4Iwkss8IglISOWTg32EhXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZbvDOzBfR8PRaf8te6xF2Ac+wDlcQk20pwUJ3IgMeCAertPPPhw4/xNIN7j32ymAUDA/uLEWe094buHfJ20aAk+kGItfmAQpsWnip8iiikEWJnWRNcgrZ1xpc0cqCK3BDfkFmHa//H4kaxWpJz5d6IdOKK6+SIt5+JB3SeGoThc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sk89ymlg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sk89ymlg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761437017; x=1792973017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oy8CY58sYVyKhQIkxBwaW4Iwkss8IglISOWTg32EhXQ=;
  b=Sk89ymlgcJOPRLKN8YEijsbzByD8AVJthrj2H1i90GxNvqoMLBpCRoeS
   LF2sVoJzX5OSxuSHt8IZZqEA4gRTQVKYiNzC9kkCm8eYCNnYhQ41mFAsC
   5Y1ooiKpmrZase/OrLcFyj65e+X6Z+B6QZzxQEfWKbPI8gZQcrBlyLC9x
   KqtfGXbCQ9IvB+hpv96BhQ285+igRi11zxIBeovtLLXHBEpqykqNTUJ6w
   J1SmhfQz94gHVJXv76gZIeUhJl7icwnj3KmLPQAjGbP6jFwKsaBd92D4B
   NLK4dVZtHCpgE1pRGo5fb+a7ueF7Ax5N/in/0drIvMwEJp7WTigodxeD4
   Q==;
X-CSE-ConnectionGUID: sRYN4lmHRVC/NJ0sTUDSTg==
X-CSE-MsgGUID: 3GVvcMPwS92Awfm50LUITw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67400155"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67400155"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 17:03:37 -0700
X-CSE-ConnectionGUID: h5bdYzz/SpaLwy6ul84JsA==
X-CSE-MsgGUID: Tzn7Jz5jSfuos5dCc6lFXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="221923284"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Oct 2025 17:03:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCoEP-000FiJ-12;
	Sun, 26 Oct 2025 00:03:33 +0000
Date: Sun, 26 Oct 2025 08:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] init/main.c:251:6: sparse:
 sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
Message-ID: <202510260758.PYavI1S1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   cdcb3f81dc05bd42f88ca759416912fdf53b03ec
commit: dca811b6c4342bf1b98b67e199b9b01d3b3c2166 [1/1] UPSTREAM: bootconfig: init: Allow admin to use bootconfig for kernel command line
config: arm64-randconfig-r113-20250923 (https://download.01.org/0day-ci/archive/20251026/202510260758.PYavI1S1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260758.PYavI1S1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260758.PYavI1S1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/main.c:251:6: sparse: sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
   init/main.c:327:5: sparse: sparse: symbol 'boot_config_checksum' was not declared. Should it be static?

vim +/xbc_namebuf +251 init/main.c

   250	
 > 251	char xbc_namebuf[XBC_KEYLEN_MAX] __initdata;
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
