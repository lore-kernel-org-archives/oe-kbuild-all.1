Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99DD261B71
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 01:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772155650; cv=none; b=cdMxavEP5JylUo5/Yn4Pa/U2OtfeUlmkRKHWUUSxFIu0i2zn6TOlwIzwkOBzzN1RB3vEbd2DK+Zbd6ppPgOKoU6JzyGpKTHDN2rsolMTiiGQcd6NbhyIeJ99EpAuGCqbYBqfOLujlcnAUkdUZmajojzNc+fT5Q0Zqfivm6x46P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772155650; c=relaxed/simple;
	bh=dTwqDKH5344b8y2sqsdutRu+zX5zbNMkERTJWXYPmaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J6nWew43/D9i0vJjP7z7VBnxZRETYfcq0sFiZipcPtBr0DJEWuuYRKvScu7bvaAe8L6Le+V8BWHoH9AB4JCAFJ2VIY084UwdayZKmW64yFaZH5K16dN7A40N+Am8OYh+X43LgM9qgwG2ynoOcooAgt5BwnxpncT5SS+BelHgWho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=doObAzSk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="doObAzSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772155649; x=1803691649;
  h=date:from:to:cc:subject:message-id;
  bh=dTwqDKH5344b8y2sqsdutRu+zX5zbNMkERTJWXYPmaU=;
  b=doObAzSkIP0m9Yqa7Say03usF3vI1Y6iJtN2nUkbZqrkaKumpduOsrI0
   Yceu7W+DFxmWvdyqRpN9s+DLxJQv7wzEAElRrvXempMDHjAur0aVPsRCH
   RYKQPZTJLrRH+ce2KYfPCyT/NIRecZeXFEASQx2O25j+FLIcQ4maOD7sU
   OoMDdJ/lSLuI9AJEP7iMgps095TEAvbf3sluGW1dgIiC9YTYjqMehRMrg
   bPG6x7u5aVO1rImv+uNeLSHceltXExbQTCM8zsvIpFamNDo+WDfw7cLYE
   wD+pvXJPh70bZuC1cyrfOJ0sTWv56+vlffTKgYkeOTBP8FI8BtX7hj1r0
   g==;
X-CSE-ConnectionGUID: 5wQCD/FLRNCy6ShNXkybwA==
X-CSE-MsgGUID: HKHtKfRiQtq7cgB4dbjwhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72266807"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="72266807"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 17:27:25 -0800
X-CSE-ConnectionGUID: Ta2SsWeESGyj0gwVsQZ5wA==
X-CSE-MsgGUID: Mqj4g5KQRmq0Dw+9aZWMiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="247269219"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Feb 2026 17:27:24 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvmdV-000000000QD-1wAC;
	Fri, 27 Feb 2026 01:27:21 +0000
Date: Fri, 27 Feb 2026 02:26:58 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] vec-syscfg.c:24:9:
 warning: "ARRAY_SIZE" redefined
Message-ID: <202602270201.MlLwuoyh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   b5e973f489e4928831610623d5e272716600ff94
commit: c9e52db90031b7a89bf667057df5ca9c25cd68ff [1/1] tools: fix ARRAY_SIZE defines in tools and selftests hdrs
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260227/202602270201.MlLwuoyh-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270201.MlLwuoyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270201.MlLwuoyh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vec-syscfg.c:24:9: warning: "ARRAY_SIZE" redefined
      24 | #define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
         |         ^~~~~~~~~~
   In file included from vec-syscfg.c:21:
   ../../kselftest.h:52:9: note: this is the location of the previous definition
      52 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |         ^~~~~~~~~~
   vec-syscfg.c: In function 'get_child_rdvl':
   vec-syscfg.c:112:33: warning: too many arguments for format [-Wformat-extra-args]
     112 |                 fprintf(stderr, "execl(%s) failed: %d\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   vec-syscfg.c: At top level:
   vec-syscfg.c:326:13: warning: 'prctl_set_same' defined but not used [-Wunused-function]
     326 | static void prctl_set_same(struct vec_data *data)
         |             ^~~~~~~~~~~~~~
   vec-syscfg.c: In function 'file_write_integer':
   vec-syscfg.c:195:12: warning: 'ret' may be used uninitialized [-Wmaybe-uninitialized]
     195 |         if (ret < 0) {
         |            ^
   vec-syscfg.c:183:13: note: 'ret' was declared here
     183 |         int ret;
         |             ^~~
--
>> vec-syscfg.c:24:9: warning: "ARRAY_SIZE" redefined
      24 | #define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
         |         ^~~~~~~~~~
   In file included from vec-syscfg.c:21:
   ../../kselftest.h:52:9: note: this is the location of the previous definition
      52 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |         ^~~~~~~~~~
   vec-syscfg.c: In function 'get_child_rdvl':
   vec-syscfg.c:112:33: warning: too many arguments for format [-Wformat-extra-args]
     112 |                 fprintf(stderr, "execl(%s) failed: %d\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   vec-syscfg.c: At top level:
   vec-syscfg.c:326:13: warning: 'prctl_set_same' defined but not used [-Wunused-function]
     326 | static void prctl_set_same(struct vec_data *data)
         |             ^~~~~~~~~~~~~~
   vec-syscfg.c: In function 'file_write_integer':
   vec-syscfg.c:195:12: warning: 'ret' may be used uninitialized [-Wmaybe-uninitialized]
     195 |         if (ret < 0) {
         |            ^
   vec-syscfg.c:183:13: note: 'ret' was declared here
     183 |         int ret;
         |             ^~~
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: /tmp/ccfQ44G7.o:(.data.rel+0x20): undefined reference to `rdvl_sve'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
