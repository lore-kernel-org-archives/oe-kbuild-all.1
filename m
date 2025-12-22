Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946EA13959D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766386587; cv=none; b=Zw/SJ3j6K7d/sO1b9NYHExy/q00HvfODZmJJmfGtDErfjNdXZB1/SxvbZsrLBDOdp8TPtKqA3/ogpG+mLrzIb3iQCfzEvypl5ObhLqYrpXNPmOofR6EMCZAr5IsduUlCcEnEn2cdRYkznC265con2RMb+M+Aiw+OUJFqg2ZCXC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766386587; c=relaxed/simple;
	bh=UvNW1vahZBui/V6xOWSlS7o1OcKsJRCHkq4vPGBOnjY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pmHXfTYvDDnlc/n/7/kzOAcgc4/9gC6VaIv0/NaHFD1u391MQSJblIj+Xu+JjSOCnWMguWCrtj+GjogxCWPqqhCPmXunMXWZkwYFOVaZWnlvBv/N9nlM73OGcsVYtZShPdcH7ptjYPLDp5VJu59SEfP8fKbJ3Pf/epKrkKWTg8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwIaweWw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwIaweWw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766386586; x=1797922586;
  h=date:from:to:cc:subject:message-id;
  bh=UvNW1vahZBui/V6xOWSlS7o1OcKsJRCHkq4vPGBOnjY=;
  b=HwIaweWwuArftywKFZUI4FkudMoz5mQJCvy9qlwLAL+DcEmV/CNMbA8L
   uNP7tGEdd4b3blJlYxMT7yNuB3wIeLQMHPPoZiA6b1vKJnjmch7zWXP1v
   5ZR1IJmESla5aXWwoA9UMIuWSm78rp4RP5r36cDkH4eH+z+rPrBvdgUK8
   cPkAxVMsJQsnIw2QpGxN4CaVjbXaA00tZKzsUF0NQTMHm6b53TwjlbxkY
   SBTMRDGTwUwMMjUecybNHcN3tCBY6qngHWL9ySoQue/L3AZgwi5z5bdCg
   Vc5L/vYu/0p4y3628d/Mng64YwScRvqQXdd3FMO+VICOAUOYKhe6TSTAw
   A==;
X-CSE-ConnectionGUID: 6AyQm+IcQBejDhFMMHLgHQ==
X-CSE-MsgGUID: zhEfaHoaTUWmGM3XjD+lvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67232951"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="67232951"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 22:56:25 -0800
X-CSE-ConnectionGUID: i5GDR1S6RlGsVYs+d0C4SA==
X-CSE-MsgGUID: 9NR9TvFbRN+eE9SB4zllNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230110572"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2025 22:56:23 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXZpx-000000000Az-0b3d;
	Mon, 22 Dec 2025 06:56:13 +0000
Date: Mon, 22 Dec 2025 14:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 7/19] Warning:
 drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not
 described in 'genpd_power_off'
Message-ID: <202512221423.g65DyFqR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   ea4670c7e602bbd5d08cb2beef168aeb479bf195
commit: a645cebbc442a6b32b609fdb4e4664cddbd7519a [7/19] PM: domains: Add a flag to defer power-off until all consumers probe
config: sparc-randconfig-002-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221423.g65DyFqR-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221423.g65DyFqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221423.g65DyFqR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not described in 'genpd_power_off'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
