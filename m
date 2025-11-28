Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6295A1B3923
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 01:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764292012; cv=none; b=GrDh39eAh75hT2p+MkwZkvVt7sRB/oG9jRfOMFV9hafFuwJXLxpKv8FsoVrDuq2E1tS7fgBmijM+WoCNGK3wF5fhpS4Lk4HkLy6TLiojn1iEatMuKS8BVctZGXmh0JodgAYyg08qC150EJkyxWzh7B7zGPx8WigOKZ6W3MJUtOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764292012; c=relaxed/simple;
	bh=OO03E0n/IUOMczcN43LZ+tclrhjhsZoEWLJpvt8MYwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XhFOLUiZjNHh73XLUIIBmLTh1ZY//455rz+KcKcnhr5Oe2hmPw2MCFkAyhEINHdKyKDQQHtrmZ+RjwaWuXduyeLHXf0Lb+quuS7E3fGolzFe1nSsZj5CJ/LJyLe5deXr5X6yLdXFeTQw+uDwBynnfiqZYXoby7poU/B9aAmFqzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWjNKnqp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWjNKnqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764292011; x=1795828011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OO03E0n/IUOMczcN43LZ+tclrhjhsZoEWLJpvt8MYwA=;
  b=nWjNKnqp6CBYTq2InLr9F02ngyHawKu9YfAQOkhrznfiaCzAhRY3cWzx
   3cfpW7tA0KiIrdYx+0YIQqNG4wVh39PJV8Av5Le2cRMaezIoTqGnb5mWv
   1Im1+fb1T4k8FWjTPlQgLuoeD+bJ4K+e2u6/nnAw0/s84KWunj9FmWV4Z
   iAE8NiSgBY8X5umCxf3um7CShAeKyL6UaaTO65L0EtCTNOEY0/j5K3Cy0
   kMS71Sl18/fdXoFqUmc+257YyPuEQ3IMO01sz6q9AoYaUb3D0qOqiKg6P
   5uLjJp53clVFgo7/maUkLF/Zcfy8JHB89OhDv8XOmOxsouL5EHSkXeT0Q
   w==;
X-CSE-ConnectionGUID: Tdq5jM+vQvGn046M+0bbYQ==
X-CSE-MsgGUID: 5ul9cP8RSXaa4Oa3IW8zkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="53898205"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="53898205"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 17:06:50 -0800
X-CSE-ConnectionGUID: VJ8g0R+1RsuSiZMmxWpFWg==
X-CSE-MsgGUID: +lyYgP+URqyuPsZvcbjRDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193440740"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2025 17:06:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOmwf-000000005tb-1mql;
	Fri, 28 Nov 2025 01:06:45 +0000
Date: Fri, 28 Nov 2025 09:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 9984/12398] ERROR: modpost: "hid_allocate_device"
 [sound/soc/sdca/snd-soc-sdca.ko] undefined!
Message-ID: <202511280822.i2fveMpR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: 2d877d0659cb69cc0677ee2805e9521966d70ac5 [9984/12398] ASoC: SDCA: Add basic SDCA class driver
config: x86_64-randconfig-002-20251128 (https://download.01.org/0day-ci/archive/20251128/202511280822.i2fveMpR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280822.i2fveMpR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280822.i2fveMpR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "hid_allocate_device" [sound/soc/sdca/snd-soc-sdca.ko] undefined!
>> ERROR: modpost: "hid_destroy_device" [sound/soc/sdca/snd-soc-sdca.ko] undefined!
>> ERROR: modpost: "hid_input_report" [sound/soc/sdca/snd-soc-sdca.ko] undefined!
>> ERROR: modpost: "hid_parse_report" [sound/soc/sdca/snd-soc-sdca.ko] undefined!
>> ERROR: modpost: "hid_add_device" [sound/soc/sdca/snd-soc-sdca.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_SDCA_HID
   Depends on [n]: SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_SOC_SDCA [=m] && (HID [=n]=y [=y] || HID [=n]=SND_SOC_SDCA [=m])
   Selected by [m]:
   - SND_SOC_SDCA_CLASS [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_SOC_SDCA [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
