Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5EB42049
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190987; cv=none; b=E/G9kAZNFNY5yYCJppRniJ3eIs3jr08PW4JoJT5kWVNILC6AkEJj1gf4y86NwlbC6zvv9RhIAMJ5kG+pkT8DIoaU8w5G5WFhJrDWiwbbW8OmMv3czWbZUqa/51sqCp6NxOguvF4UlID9PuGf/wKn12cOjUFT3m0/RpHyO3X9If4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190987; c=relaxed/simple;
	bh=RXHAQecscKpTlhAL+D4v6ebtb3J70tmDyrK9QZssiNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJrZ3equxMkyLZM2SftKN7Md8L4Rp/axg6XKKSVe5gJtGkQFdpJuS1ThNxlopMcrcUb8ADGEqnWwMrSUeNSGVLxiaxArnWLWgBuZ8qNjLZ+ezagp0M1+OGn6SqJEO/tO/QscxUeExM4RQdilt8Om0JDVemCVU2+y645RxaTHTBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eyyjyNWz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyyjyNWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746190985; x=1777726985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RXHAQecscKpTlhAL+D4v6ebtb3J70tmDyrK9QZssiNk=;
  b=eyyjyNWz6yErbkEo2U8H4v6WqR6j2aTbp2RaPKEpqoxnc0f/3HsOqT7u
   zC8gAAJD0J9ja6zq+vtmrIS5DiXnCuvg+sAHuuFaw3sylRGC64lTzyaMO
   lBe/BZDlesV18xAlAHovpf++AxoK10qJDElGVTaUynLkJwutJcUE71zVB
   +0pQid1Mmo+81jrUjGOwi0hJ7TZdeLW7mvgVtuBNHb8MhFKfnICewHPAh
   5DEU608Hk1tahx6RBxz7CMA8/pzk6XnMYTUjZ1GC+GWs7KW9Ao34/sRTo
   xqd7mUgRci33mJecV0vKHuGLZWHPetSXMaFUjVfGLH/mK2hktOxvPdj0L
   Q==;
X-CSE-ConnectionGUID: GOES0GXES6+WjCzw0863nA==
X-CSE-MsgGUID: L/Z+qEiYTTmmyvToGwea/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47756088"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47756088"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 06:03:05 -0700
X-CSE-ConnectionGUID: s/xaZH3eSsuagXPdRqyMbQ==
X-CSE-MsgGUID: lKO3othvQEeF4JPPngDdZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139633363"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 May 2025 06:03:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAq2e-0004l3-2A;
	Fri, 02 May 2025 13:03:00 +0000
Date: Fri, 2 May 2025 21:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/9] drm/xe/late_bind_fw: Introducing late_bind_fw
Message-ID: <202505022043.YbpXzZkS-lkp@intel.com>
References: <20250429160956.1014376-4-badal.nilawar@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429160956.1014376-4-badal.nilawar@intel.com>

Hi Badal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.15-rc4 next-20250502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/mei-bus-add-mei_cldev_mtu-interface/20250430-001015
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250429160956.1014376-4-badal.nilawar%40intel.com
patch subject: [RFC 3/9] drm/xe/late_bind_fw: Introducing late_bind_fw
config: x86_64-kismet-CONFIG_INTEL_MEI_LATE_BIND-CONFIG_DRM_XE-0-0 (https://download.01.org/0day-ci/archive/20250502/202505022043.YbpXzZkS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250502/202505022043.YbpXzZkS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505022043.YbpXzZkS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_LATE_BIND when selected by DRM_XE
   WARNING: unmet direct dependencies detected for INTEL_MEI_LATE_BIND
     Depends on [n]: INTEL_MEI [=n] && DRM_XE [=y]
     Selected by [y]:
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m [=m] && MODULES [=y] || KUNIT [=y]=y [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
