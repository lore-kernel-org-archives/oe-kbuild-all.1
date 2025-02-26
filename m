Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5335C84A2B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740578210; cv=none; b=uRRbqzi6OsnFFkeadM4bQ+K1+wzu9tK2sMSMB/ZyObzWSTTxxtcUb7zKwzDWvt4HTjlXPADqXUG/l7tVhJV/7Ow7t6P5xy0QSv6J9ZOquwSd8uMBNubeQVpzqQio95B4FSV94fLrLSy1n1iCntUMVGES9ry2/A7Nksc24oCDGDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740578210; c=relaxed/simple;
	bh=nrWBQGCp+3ch0t/k21Dr53sLmxacv0ekbKNz4YVuujY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lxaZxVsCQhB0ofMrDbxlhnFbHjKZqItVSUEGmnr70daBKTubReEsgM2UaFwGQ2OIIZkTd2ZT8wPU5ykwGOXpJOGpR3nhfjx0rMha/WTdvNQIFrde8rtlCVzkxHwsmfFLKwJUMgcewtsBdojWZOPyEKj9MU+rOYOGSAxn3VjQ/k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URIXfWGP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URIXfWGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740578207; x=1772114207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nrWBQGCp+3ch0t/k21Dr53sLmxacv0ekbKNz4YVuujY=;
  b=URIXfWGPHB2W7zWSHBSRkGpuBciqZ61+r3MdtcxP485Ve+YczfXAYm3c
   22A9dpyCIKwZM8IqyQ1ZxfLYL+ZAbQ60/sd4WgvbNHa0KrpCVRFiDXKtp
   SBXiZUh8uxJflO1n7s+c6abcjRfQh5Q+IEUmDKea7jyNz+BEe0ToiSUZe
   8RBWGO25NpOma9BQV5mM2z7wxDjsPud+lEaP9yZ9RLaRNiuRhpWmH/P2R
   WPs+6QULXbAgLzuvs1sWgnFfDex74yM/MXiRM5kfp7W3xiXBumEcQrdhY
   FBR47P6Mt9jhaKNTpaq2PkmhqbcJ933XWvW8iBlFfAj1Y7OJl07kIU3Kl
   A==;
X-CSE-ConnectionGUID: h3UH4f83R52B1SlXoeT1MA==
X-CSE-MsgGUID: xYth7QWHSImNKQwbTAa1gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="58841400"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="58841400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:56:47 -0800
X-CSE-ConnectionGUID: Hb+bRrHgSAmaDfuCSRpw2w==
X-CSE-MsgGUID: sa7NZll7Q1WUhdGcO7DKEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="116896198"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2025 05:56:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnHtX-000Blv-11;
	Wed, 26 Feb 2025 13:56:20 +0000
Date: Wed, 26 Feb 2025 21:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1974/1974] drivers/cpufreq/acpi-cpufreq.c:638:13:
 warning: 'sched_set_itmt' defined but not used
Message-ID: <202502262126.WKwzRa2g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2a45fac1ca21c05d0e90f3177c4856bd0fffd363
commit: 06ee47aa957617950ebf29f2a9dbb5682233ba4e [1974/1974] cpufreq: ACPI: add ITMT support when CPPC enabled
config: x86_64-buildonly-randconfig-005-20250226 (https://download.01.org/0day-ci/archive/20250226/202502262126.WKwzRa2g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502262126.WKwzRa2g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502262126.WKwzRa2g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/acpi-cpufreq.c:638:13: warning: 'sched_set_itmt' defined but not used [-Wunused-function]
     638 | static void sched_set_itmt(void)
         |             ^~~~~~~~~~~~~~


vim +/sched_set_itmt +638 drivers/cpufreq/acpi-cpufreq.c

   637	
 > 638	static void sched_set_itmt(void)
   639	{
   640		schedule_work(&sched_itmt_work);
   641	}
   642	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
