Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C492877D6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 05:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766382077; cv=none; b=uHfiGnuuJGTK2lg2BODVRTcJrY11YRekfU/lrVbIGvAHDG0RKi4RSeNR8JilpkLDyIvD1UuRhsycm5LPoWHD9g7q9XRrlfnmt3bmuCgjeTDNGtBF6pq3KFscXpxOfHJVNlHJRiVxzCI1zqfvCH7Udr2QSlByOKfQ1/g+MqHIFxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766382077; c=relaxed/simple;
	bh=SbmFJmqhWOE9nco8vytHzj4mv39PZHeeoQL27/Wha5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUa64S2YpCysG+ZktLscPx6bwkwmmk8WwN0dNYQhDEFH/NJcY7CeAfn0ENAz3TGD2wQnqlWdiOmF5KJ+ENij0Zg6oIsNZCb/ayaFuBA+4syBJRc7SuOQTHJUvPLo/OpRJIsos25/4I74ikFwXYQX2PWMEuM2S6u9P0+VpobOkN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gm+/gEk4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gm+/gEk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766382076; x=1797918076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SbmFJmqhWOE9nco8vytHzj4mv39PZHeeoQL27/Wha5k=;
  b=Gm+/gEk45HzatofLmGBxHtAuCdPABtUpONKBbTzaX5849SVv0W//zOFL
   NvDsRXGHBkQWe5amJga+DL6+agECF7not02UB5+9M5rsMlyZPtnvm8Vez
   eoY7l19idZnVW3seLH3wjLSUpgpufxVajpVrNTUXDYP6Kt+uXTBCdmMjr
   ngPj0k6vGwcfhYS7Lgn7IP68pvS+Zj7ru5kECPvUXaqfFNaqEOw6E0KqY
   OtH0pOYSNleSFnoN9+6/+QB48z62tyHI7B5SoPdfxENG2gwi4s8PKtXVC
   gGKAqZm7apWogOQlIcQZDi37i0fkb9cb9DOlhs/WSTqvVp8Bxj4KCvL7m
   A==;
X-CSE-ConnectionGUID: xuV5aYK+SjmuwT5UgU7ajw==
X-CSE-MsgGUID: hbz0DoDcSUSLv4dvYaxYHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68175616"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68175616"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 21:41:15 -0800
X-CSE-ConnectionGUID: 3HrQqAEYSwShLd9XfSVj6g==
X-CSE-MsgGUID: L2R4kbZVSQSlTG52NXPN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230093771"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2025 21:41:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXYfQ-000000005NG-0QVc;
	Mon, 22 Dec 2025 05:41:12 +0000
Date: Mon, 22 Dec 2025 06:40:19 +0100
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 7/19] Warning: drivers/pmdomain/core.c:980
 function parameter 'one_dev_probing' not described in 'genpd_power_off'
Message-ID: <202512220651.AWEuWkTG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   ea4670c7e602bbd5d08cb2beef168aeb479bf195
commit: a645cebbc442a6b32b609fdb4e4664cddbd7519a [7/19] PM: domains: Add a flag to defer power-off until all consumers probe
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251222/202512220651.AWEuWkTG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220651.AWEuWkTG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220651.AWEuWkTG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not described in 'genpd_power_off'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
