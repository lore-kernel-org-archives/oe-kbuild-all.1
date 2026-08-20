Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3043D5652
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 20:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787257889; cv=none; b=LEakFSdg+UubB1OAfjeiUrbNjeBlyAQx90VHq0B/YR163ETR3WauD/6fvm+jKfNQUjq8MKNyE1MjZBPBuGhYBFR6HxXPQJNgVZYIvB6PzowwNIU0FWu74nM0V6jY3b2vtlcSxmz65qmexCOL7OLWivAMFDRSJzfGUro0Yui+k4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787257889; c=relaxed/simple;
	bh=7uUjpVlbNLKpJ0erEsiVukwXHdGrn47BSy1VQIXUuSE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cabpqvn+Gd9bgXhai29/DxybY7Haso+YndGswyjfXY55r6Td0kS81iAinKjWbR7ySCNrD36wpeskABh/6CUGxcJR9/Isvr5VNQA6ksjze4CH7DV2O4htUR5Ou4CSQa7Ye+ANWBLOd7olHoli2YpDND4tpHRUzAcveszP8J/7Eno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGRgZt1O; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGRgZt1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787257887; x=1818793887;
  h=date:from:to:cc:subject:message-id;
  bh=7uUjpVlbNLKpJ0erEsiVukwXHdGrn47BSy1VQIXUuSE=;
  b=dGRgZt1O2BYVQPSOHjF9p7KGC8KiNLNWbEw5Qswmw7GIYPuY6L8kcV9W
   dUGvapMC2+Ab0D6Rj5bYBuBZjIAmvSklRKPy1ASSLC+0b2/eh0gQLhRi9
   zgFt6wwK2/F20nHNSJULwvJ6R4mCf+6zzwbqZER/1uGBB6h5Tht1odsgy
   9ZPSVP+NvrCU5k1uDYo9sfa/gvlb4J4NUJQvghRYKsuzlU3f9n2QlxLXU
   D83F6dDYgVzluk23YlGqPOQ9VqsgYz+xgOpaHSDhXieCriCIkzrlBphOG
   eVWkWvG3wMHhaD6EvLTpMcFrO1uU/CbJz30wDrnvLMHQu2CIFKrNPQN8O
   Q==;
X-CSE-ConnectionGUID: TjYH3ByrRUOqvFLCTuTjFw==
X-CSE-MsgGUID: VmuHfqNhSqac6preGnhAWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87569412"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="87569412"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 13:31:26 -0700
X-CSE-ConnectionGUID: EcUoS7dPRIGOEK8bPhJw8Q==
X-CSE-MsgGUID: x3JoqjzxTkqK1QArzSJlnA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2026 13:31:24 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx9Q1-000000007Yz-3QZ5;
	Thu, 20 Aug 2026 20:31:21 +0000
Date: Thu, 20 Aug 2026 22:30:52 +0200
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
Message-ID: <202608202219.VnR0XsPr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf62c7084acfa9f1ef98ce81b38c934c7ea10f93
commit: f673055a46784ccea04465b9213e999f7bc5187e drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
date:   1 year, 11 months ago
config: hexagon-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_LDB-0-0 (https://download.01.org/0day-ci/archive/20260820/202608202219.VnR0XsPr-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260820/202608202219.VnR0XsPr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f673055a4678 ("drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608202219.VnR0XsPr-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
