Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908E640D598
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 04:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782794107; cv=none; b=OmjSWFG439aixmfsQpNVx/UEnMBt0ceR+jBUdEQMTYht/Kifx07G3HbuFhuxverqOkV8zSKSfNRsoyC5FxxO3ZsaAE9KRKkcFRTf7m/LBuoGyIghpdVsrAIX1bTlx1ny16o9d8aQbhv1URVqeXK3AFyK6wpyRU9XdoTI6Sx0DX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782794107; c=relaxed/simple;
	bh=ANYRRDwZFuJ49+roz2O4CY+AR6QI2YXmDX2wgVbszXU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tu38qcpTNYim3t+KvsLugrT+cVGgbX2rNTPLdgtHHr9hFtBsa7XhDn3qnjCuU+XKgBs/I8SEHXzF6PFJQJUN1LXBOAAPg/pcQxb27EvC/A+3dWdloFzwjltzJxHEbYefPkUWrnVWtY9FrXirEKHsRwvKnTnIM5AQfFEqhDqIvvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlYwtqoT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlYwtqoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782794105; x=1814330105;
  h=date:from:to:cc:subject:message-id;
  bh=ANYRRDwZFuJ49+roz2O4CY+AR6QI2YXmDX2wgVbszXU=;
  b=LlYwtqoToPFAOASphXlppgzn1sUgJM4np6lc+p+UAhnsxezGqhbF9l0k
   rKEKBV5ekZ7jKhDhZWdUrU90wOKKYzQ/8AwO7UQFFOR4kCXJuh4vfIHOA
   beA/p+bLH+g+BXSPogNuHP2QFLTLzLWSTrXjbodnkZnUBtmoFCsdYuEG0
   13YmMzCNkl2CTSt+4emxT6cs3e5hbB6mLpVs/jv2/yvshhyQuknT4scft
   z7ByNHA9vAPSZT+LUrTC9PepBQre+e20zxu8yC0Et+W4mVotkvM9VXS+y
   ojFGNyLHex8pC6YLrlEechKVseZpZ8WAzzozSBE5AADT65Xnr1IIcLXR8
   g==;
X-CSE-ConnectionGUID: nYWfFjRVQO+gKlGjDklmzQ==
X-CSE-MsgGUID: HpWFuyoNQ5y0BC86Z0nOqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83372351"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83372351"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 21:35:05 -0700
X-CSE-ConnectionGUID: YTZBTKBTShm3cO9yp1ltHA==
X-CSE-MsgGUID: 6G4MqlQKSe6j1hIt+cOIIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="276416504"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jun 2026 21:35:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weQBZ-0000000080d-19Td;
	Tue, 30 Jun 2026 04:35:01 +0000
Date: Tue, 30 Jun 2026 12:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 0/167] ERROR: modpost:
 "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-himax-hx83121a.ko]
 undefined!
Message-ID: <202606301234.ylgpFM8T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   866eb49750d39fe938dca71acece6f1540bb1123
commit: a7c61963b7278cbe2c27e35ce93f3787a0d5b5bf [0/167] drm/panel: Add Himax HX83121A panel driver
config: i386-randconfig-002-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301234.ylgpFM8T-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301234.ylgpFM8T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a7c61963b727 ("drm/panel: Add Himax HX83121A panel driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301234.ylgpFM8T-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-himax-hx83121a.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
