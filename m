Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE11536165E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 03:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783307418; cv=none; b=gpPmpTDueH5owJt4BsNY6WfRUuac+EYxU3VBFIXTWQJZgoM/kDfSYau/GejSxnhAbDD68o5X6uEMS+qlPBu90uUiCDI8De9sz0ztWz3Rc0Jl6M0tUIA4xRM7GssnLUWOQaPQbUFaeVCokfK+z4daDbA7vOBvOykkbvPqXKgpS8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783307418; c=relaxed/simple;
	bh=X6sKSFeR5JrPGgFiZw/VEKbHbkKz5aeQnXC99c+OuVI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LWiy6c8h95GMXXvimsYIISStoWlJ301VzmoUjxLN4MYB8YV3Pon/Fmr6/UmTiO7ch1QdnI9NBCs2YUspjjVHIElzCEs3jtflkJ2NgDsfmBEvSB9eXw+gJw8Qy9TpMa/n+PmC4EOPXcP97zsE6GaxFOks67mun7HRgozGC9CdFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUumfPYs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUumfPYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783307417; x=1814843417;
  h=date:from:to:cc:subject:message-id;
  bh=X6sKSFeR5JrPGgFiZw/VEKbHbkKz5aeQnXC99c+OuVI=;
  b=OUumfPYsga8oQSWM9QuFoLKv4515wvh2Hmgfogf4uO2eEsMaGJR2DUhJ
   AkNk9nenkFer8FIY+7GL4nv8oaiE3AMjPM2K4GrH0ueWU20uck9IwkNuI
   gAh0sWdyMqx1rhbZ0FwRjBKIgKZQBuXTVkUiuu1iIYfKLeV6FitFXZ0Vr
   RG2M35/ghQuVnDKhp2HXLJD90oqZcayDUOwAD2xEX4lh3kCSirtU7K0Ta
   x7iZmVChwIq+zRiKSXoxM9xxzgfZjIA0VBhyxSQMQAMz3/Yow49Bi4qky
   CcaYPHdCXAclxZSCqVpHjo+EfyadhM3GMwefeVVN/veRtlNXnOv8UsPjA
   w==;
X-CSE-ConnectionGUID: ifHi2ENfRhOxl7jbLQtWjg==
X-CSE-MsgGUID: 7eO+lMpFQPuNHKCGCKCuhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83708428"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83708428"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:10:16 -0700
X-CSE-ConnectionGUID: J+qFqQ4eRs2fzfW16XUb9Q==
X-CSE-MsgGUID: UKpXVC24QgKhGpF6NT/6yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="252519052"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 05 Jul 2026 20:10:15 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgZim-0000000025B-3xOA;
	Mon, 06 Jul 2026 03:10:12 +0000
Date: Mon, 06 Jul 2026 05:10:06 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-dango 181/215] Warning:
 drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202607060509.6jIPKD0v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-dango
head:   d19514df7d0958e914bdb3435ea4d64d2fc5766a
commit: 9ff7cf620a77384912985c98eb0369776932fba2 [181/215] net: phy: mxl: toggle SGMII AN on link change
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260706/202607060509.6jIPKD0v-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607060509.6jIPKD0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607060509.6jIPKD0v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * in some cases the GPY211 will link up but not RX packets

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
