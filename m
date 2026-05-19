Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862983B47D8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184144; cv=none; b=dLMYi5s5a5FWSbyPRSMWsuXHUwV4sU6j6PCmRgbhTPaLIIsUgSXfAiWDBhy0mqxJoAoWNMgPJQyBImNQ4t00ravNWanitIEcpH6xRY+n+rg4MCi1oHrBdUEtytvfwvEuEwsWX2GFlAZGJ1brzrPMoUH+p0H+qeFWv6CdpVvobe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184144; c=relaxed/simple;
	bh=eUhSraSYdzukjdMM+KWwAyF/ERw0b1yogcUo/IiGLc8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sva26BnK9lShQrKUsbFzmanRiXdQlupcqlhUMkXH1hF7NqakV9QXsU28uT4YPDwyaoYOQRpwi4jIbDfnVoLfuspbkT6pxJc0SH1dE1ICK57H1+GaAJiOp/bOEBQ6zu29uWCHmhrH7TaEmuBkgc6fyEOc7IP//iX2IaUfbG0e4SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5Vcx1U9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5Vcx1U9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779184144; x=1810720144;
  h=date:from:to:cc:subject:message-id;
  bh=eUhSraSYdzukjdMM+KWwAyF/ERw0b1yogcUo/IiGLc8=;
  b=c5Vcx1U9xLu9NbnJ2KRd/bgXOtz3fVt6gC9v92Thl2mmV9XbC5vtjBFb
   wliTpuQxf29qRhbqWEck8s7mkZlhgi4IMIafeWC4EBU2Gj4uTQzbG6Ra2
   Cxc7uJUIBwsZLB/uTxKJVDEciKTXf0D9eT0K5oG3Egdp2SteNdRqnO0gJ
   ulLWzgNcZNbF4ihi7E3QGaNSRUCtmrnD4A/iv2CUj1attLo7D09F7a4Dk
   DKFVcmeQmxQpmYsj75ETElW5XKz+bit+Ipk13b/3OfSPvJp5gCb61bUqn
   qR4JrdY4wu/SkYWrS0t+YO423SbILZFGRLeOLc0Oin7yYYdS/iruQQrNA
   A==;
X-CSE-ConnectionGUID: 9osTQur3QX2yw40G4lrjrg==
X-CSE-MsgGUID: lkz2CXCCSWeGwvDOGWADIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97490396"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97490396"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 02:49:03 -0700
X-CSE-ConnectionGUID: oIgfvod/QFK1hq6u4G/blg==
X-CSE-MsgGUID: MW4ge9Q3RGCqnwL9KfWiRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239773880"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 May 2026 02:49:01 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPH3p-000000000pJ-2Eym;
	Tue, 19 May 2026 09:48:37 +0000
Date: Tue, 19 May 2026 17:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 7/15] Warning:
 drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not
 described in 'genpd_power_off'
Message-ID: <202605191756.57RmG10Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   2d19ada761763b43f923d925f771946cec9f3c41
commit: 8cf148ea728027afbf485e957c1e5ddd4e560099 [7/15] PM: domains: Add a flag to defer power-off until all consumers probe
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260519/202605191756.57RmG10Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191756.57RmG10Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191756.57RmG10Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not described in 'genpd_power_off'
>> Warning: drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not described in 'genpd_power_off'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
