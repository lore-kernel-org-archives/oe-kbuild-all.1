Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A588352C34
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 21:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780003389; cv=none; b=DzO6IWKa2Z+kCbDCNw5G3MghJlUQzUCSd5EupFErLucb+eK7nTFydIJePSL6xnpMR7IRxrWUDXbhr9411C1VNq+GOvr3T90wWOyWfMqp2fwkjVultLg2X1x5TFV8xidL4yYCIFpt4RZRvHVjTTXbBT5rEavEXyB1UG8PMhD4Z6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780003389; c=relaxed/simple;
	bh=7AFc8/fuvMzeGoQQM3/QJSGNlfludg64iPJGsGCiLjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YeRi98Nm60zjKCOcF9rjYpAZryhFVhF34eCS7C8uVdge9FK7Srl1Cim/yP4iB6dJADFhDb/kuvegeYSLjP3eU7WY2ra2viSD9PtephbE+EaBQeRI1pc3MSLA/jYGJJDzt3pmhNZUIL5qTABQ1t9c27zXVFHq/9NDVrtRzUY1UUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4R1+HxA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4R1+HxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780003388; x=1811539388;
  h=date:from:to:cc:subject:message-id;
  bh=7AFc8/fuvMzeGoQQM3/QJSGNlfludg64iPJGsGCiLjI=;
  b=H4R1+HxAcU08YIID23oTn9BZgwraLLAZKnJo2eLSwvmafjDfPGhMh2p/
   rqV/nnLURkRE8KZm9Couw6Rw8zw6ZiGaLmK9Kj/0cBzf/8ikW6sfsS0ZD
   cRIizgl6PNoLLUHCkcQIwR6vOSGG4LR7G1rrLOjFhyfMC9MkudWH6gkBQ
   Z2lV80SFUVgdOI6QyE50ccoUUM69U5FKn4Y9e5fE9s0TFmKgmUrp91kKm
   3GYFBDXn4f+n8pebs8rNntqspgf5SVQ0ernhqOagBKHTELxpKg5OXeFp+
   Zeg4M1PoeSVCaJddQ90kUqFTKvvZkgCi02dr8JY+0kKjiOyD8z8/ygHq+
   w==;
X-CSE-ConnectionGUID: DZ9GPMxkQWaxFIVRwBsHQw==
X-CSE-MsgGUID: L9z49CsQQ7ez1uu8Hl+FPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80848442"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80848442"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 14:23:07 -0700
X-CSE-ConnectionGUID: oNufm+a/RnawODbBmzCsvQ==
X-CSE-MsgGUID: AMpgb5eHRTy/a9aOuaml+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="246951720"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2026 14:23:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSiBz-000000006Sc-3Ko7;
	Thu, 28 May 2026 21:23:03 +0000
Date: Fri, 29 May 2026 05:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Subject: [jic23-iio:testing 242/251] ERROR: modpost: "__udivmoddi4"
 [drivers/iio/light/apds9999.ko] undefined!
Message-ID: <202605290546.WR17V9S7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   6f15decff24dac42895c0f01f0c2143f9b8961a6
commit: 0467fb7ad204eeb42ed04db475ad05e6311a5c2d [242/251] iio: light: add support for APDS9999 sensor
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260529/202605290546.WR17V9S7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290546.WR17V9S7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290546.WR17V9S7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivmoddi4" [drivers/iio/light/apds9999.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
