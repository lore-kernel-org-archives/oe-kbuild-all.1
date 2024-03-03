Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FF8B65C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 11:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709467191; cv=none; b=R430fUJqFw8LJIbCDoZZo1SSRNBT5ZQ+3IHWiLXnle9FWUgTc5nWlpOM+8phgH1MLDlYicGz4YMiPNZc9UpdcrBi1ERm7tLcF0YWIWkQmcuWO2s3V6T+OX8oCMEiUy1cNJrUC5vIh2mXFeFFmCkU22KOXEOOh6uB7wFH8SkxJZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709467191; c=relaxed/simple;
	bh=6bZhClnY52mrGNGVoNAbpqb3IpUlB4hdKauBYKa2rh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YP6bYhan7THgy7byJxONLcQ/F8lffO2zrzaTGpxLMVpGHGATSGqF6wPVXbBS51B3dygHP9gg1KSpdrUJnlcCHkCsfeGBJGtNK5ot8JALTV6dClaOEKR3dScXga6gIdi7+IwaE/PLnzrFMZ4wlHEJNdB6kLChlmAgZNXzyPr3Ia0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtQYZQpR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtQYZQpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709467189; x=1741003189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6bZhClnY52mrGNGVoNAbpqb3IpUlB4hdKauBYKa2rh4=;
  b=NtQYZQpRuAkc7GVFEFLemsaPAPlH1d35YFACKG0RH5ag0F/lmdIh4juW
   v6GWHY/N59P2HMbAhwL7AxCth0xk/p1QOuCopik7Xw0tbj+evcNXWQIer
   oStgjoI3FTpGoZj1+kqwJ6v7ITO6PUh14G4+qyvJV2qsYWPT9YTsPvzjI
   /4hQPxbvfg6Sa9JETFSV9l9jtecXWSd2UoA5Or9z0QVGnlKuV43Q/sW5C
   +HBPlbDX5bjRM8vQhMELbzs0ujE+vusmS4A1IFEdUtimLZOgjqimlhr2w
   7eBeU3Ty25fwSjGJrM59q2Ffrn/6rlxkhJiHWMOVx+jqz1vDqjZPf+UIa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4087948"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="4087948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 03:59:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="31849676"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2024 03:59:47 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgkVM-0001ke-2X;
	Sun, 03 Mar 2024 11:59:44 +0000
Date: Sun, 3 Mar 2024 19:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Steven Price <steven.price@arm.com>
Subject: [drm-misc:drm-misc-next 12/14] s390-linux-ld:
 drivers/gpu/drm/panthor/panthor_drv.o:undefined reference to
 `panthor_device_suspend'
Message-ID: <202403031944.EOimQ8WK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   216c1282dde38ca87ebdf1ccacee5a0682901574
commit: d72f049087d4f973f6332b599c92177e718107de [12/14] drm/panthor: Allow driver compilation
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240303/202403031944.EOimQ8WK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031944.EOimQ8WK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031944.EOimQ8WK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390-linux-ld: drivers/gpu/drm/panthor/panthor_drv.o:(.data.rel.ro+0x170): undefined reference to `panthor_device_suspend'
>> s390-linux-ld: drivers/gpu/drm/panthor/panthor_drv.o:(.data.rel.ro+0x178): undefined reference to `panthor_device_resume'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
