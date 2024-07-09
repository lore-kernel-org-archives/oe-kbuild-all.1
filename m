Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C6B144D00
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 23:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720567914; cv=none; b=Kqm2Up0JZuv9UY4PeTncBvJ2dansy/HSxlJhtKQEOxdq400ZB5C7Lid69X7v8s2EiiKOjSXc+wWCziirqPl98qBHZ5E14BR3dObf+MQwgfTWkSTp3PM/S2RaJrEHdvizyG+XBFWzyg+4y3/i2jsZ1d/a1+FuYdNjJhiKEM/tYwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720567914; c=relaxed/simple;
	bh=chwPktDL50QQB3QC5KB2JdUACfMmbuOIhXSt9C/AXL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tRThvFS4JJRfVHUUbobnPcfwl8w9yzwGrYQelt0irLoR8BbSHKtJoAPKJJcGBAGUpie/5/nAe6IGXbyB4kICJPIDMNhvPoV9YBzFxWKxHUqouZmCqw2usAGDyQ7Es8JdIJ3Z2Oc4GDpa8PWH9G3ywa70DbE6Azcg3ktw7jUiwr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lk9260He; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lk9260He"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720567913; x=1752103913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=chwPktDL50QQB3QC5KB2JdUACfMmbuOIhXSt9C/AXL4=;
  b=lk9260He63R1vFR20dVDORIeSo05mVzjUYUybeN+zFA3U2JtnKwgVjhU
   NcUd4ppnFtNs3uDqxOZRYrbn2prGCJiPystotHjxTZbUkkzVcbtetAk3v
   Lc9B83EqFiglQ8ag9+dDkpgW+yv2srPrIVNgP2xflHkv7p1yXxeIeakw7
   whK+y/sEmt6tnoGgqD1V3+GTG3LWio6KrNlVVihZqjqNBNN97GbP9xy7G
   NgIDZ51nwDVuVM59JEZH5WWHa92SrzaUnIzHISyaZeRTkGs7qKF3fDcMm
   mQbDiK7OxIWNAHf5xBDjgHFsylnItodht7czR+1sVAlEcaq+viVJRZc8F
   A==;
X-CSE-ConnectionGUID: UWTwpVmzTiSlwXpV1lugqg==
X-CSE-MsgGUID: e5xIHz+tS3W+UZWmVCU26A==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28453801"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="28453801"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 16:31:53 -0700
X-CSE-ConnectionGUID: H61pdOB7RC25cyIJ8MfitA==
X-CSE-MsgGUID: qxQgv0SpTKuOZ2RbilhYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="48465038"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2024 16:31:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRKJI-000XFE-1l;
	Tue, 09 Jul 2024 23:31:48 +0000
Date: Wed, 10 Jul 2024 07:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Mohan Kumar <mkumard@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [linux-next:master 1675/11980] arm-linux-gnueabi-ld:
 tegra210_i2s.c:undefined reference to `simple_util_get_sample_fmt'
Message-ID: <202407100702.G3amP5te-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82d01fe6ee52086035b201cfa1410a3b04384257
commit: 2502f8dd8c30edbca9253d5999294f58211039b1 [1675/11980] ASoC: tegra: I2S client convert formats handling
config: arm-randconfig-r034-20230422 (https://download.01.org/0day-ci/archive/20240710/202407100702.G3amP5te-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407100702.G3amP5te-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407100702.G3amP5te-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: sound/soc/tegra/tegra210_i2s.o: in function `tegra210_i2s_probe':
   tegra210_i2s.c:(.text+0xc80): undefined reference to `simple_util_parse_convert'
>> arm-linux-gnueabi-ld: tegra210_i2s.c:(.text+0xcb0): undefined reference to `simple_util_get_sample_fmt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
