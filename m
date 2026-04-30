Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB4446AEFC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777565622; cv=none; b=EoTkqLoIhD35h6o9FYapEs3sQNUssU4S86dW79CiXPWcUocg+MrnsGO7YDwJyYK4CZ8OtmavxijqTlqUXAW3w9Ps/zoAw8K1Q0hi4ibFC4dEh6j8Gf1VnwsD67/P5BTP6PSHq3VCXwqp8y1dDHC9zKb0f3QLT3mXzSF9Kvp3zj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777565622; c=relaxed/simple;
	bh=lq8jBT61I1uiGUR5LkOt48M85YX/pTLmb1BRdmrnAu8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uBvYM7pGBkNDu87lUwDPTNPZPFmhVc1cPn3hJIXJUAizAqVt+EMa0jdTKP6piL9O4PA9iiwQ2VlPZTdPv11LJ9ApUxY9iBMEOXFLKw/dA3+R4Rvc+7RgD56L9f2/FtVp1KvUQBGCZxsodZbr03Ah17/F6uBjJhEUqjYSuw0oYvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzCsnuM5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzCsnuM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777565620; x=1809101620;
  h=date:from:to:cc:subject:message-id;
  bh=lq8jBT61I1uiGUR5LkOt48M85YX/pTLmb1BRdmrnAu8=;
  b=JzCsnuM5Uy4Xo/V5eixFnFtDFfldTviLOCKLlC6zI+B1nl8tOtHXzRoH
   cK9nvg+jhUoEvS3ehW6ZEDEMJZ6W38FAzsHNntDxZWh9shZTrFtEjJDwn
   CmJr11gIHfkCQHtY1jXusqz2yFK6u6nP+MtazSwtDLtf3u5V0sz3+Kj0J
   a85eCNUEPVWFG27B1596n1ojWEe1xIlvFeF6poRiJ73ezd9mTOPw4Sr/M
   VIJQI6pfyQX2P1m+o+F9qhHBE4CjCpEnH+2Jk6TXJXImUIKyJsvTjvVsi
   sF+GYdLef82bW7mmp6Ktk8jlBwIILTUFlQBFT4JWobjBiVGilw91v5p45
   A==;
X-CSE-ConnectionGUID: rFjzpF0BTK+sHo9OYzpV3A==
X-CSE-MsgGUID: y0MgWhJuRnu0QYTwOY+CNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="81100517"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="81100517"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 09:13:39 -0700
X-CSE-ConnectionGUID: wjYcXfIRSeS6zIHfTCZpbg==
X-CSE-MsgGUID: ZXd5EdebS9GrStM0B2xTOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="239635955"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Apr 2026 09:13:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIU1A-000000004r5-0Jtg;
	Thu, 30 Apr 2026 16:13:36 +0000
Date: Thu, 30 Apr 2026 18:13:02 +0200
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/base/test/platform-device-test.c:350:35: warning:
 'platform_device_test_primary_swnode' defined but not used
Message-ID: <202604301801.b0eNhM15-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/driver-core-platform-remove-software-node-on-release/20260430-181813
head:   b96eb2a182c07ba3198eb9bc3373eef3201ddcf3
commit: b96eb2a182c07ba3198eb9bc3373eef3201ddcf3 driver core: platform: tests: add test cases for correct swnode removal
date:   6 hours ago
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260430/202604301801.b0eNhM15-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301801.b0eNhM15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301801.b0eNhM15-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/test/platform-device-test.c:350:35: warning: 'platform_device_test_primary_swnode' defined but not used [-Wunused-const-variable=]
     350 | static const struct software_node platform_device_test_primary_swnode = { };
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/platform_device_test_primary_swnode +350 drivers/base/test/platform-device-test.c

   349	
 > 350	static const struct software_node platform_device_test_primary_swnode = { };
   351	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
