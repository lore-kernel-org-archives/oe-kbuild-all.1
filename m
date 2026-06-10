Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20752EEE99
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 03:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781063173; cv=none; b=XiFaWGI7V1VcNBIJW1wozP+4PAfRfETXgGXVB3zzmKSRV7RBo/pGpXsehANMZXV4PzUTovMNUh8jPlVFt4OBg0MqQKgTqh8ZpCqL4WBszO2aW9IZWpZmsFRFDZia8mvjHFQL67AJo8pTV29Syd8q8vO7ZSNWF3ilsTqd5j7em8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781063173; c=relaxed/simple;
	bh=verQQH9xS0Kt9TML7W4Uyyf/Sx7YvSc3FYMDOwweIW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P3IUTLWu4Xh0IBO4i1cozBZsTMP5LLOgkbf1a4d5DDThYdQ7O21UYkAJPOPmLfZo6SEpsujvXP6IT5GhYpM3yKOgTxeEh+ZaYZQj7GP2RrstBpUBi0r5iYdHyM0+wE4kM6HN/fWZsNhKH/PlvrpZlbSWcmkqQ2SwFMYGvZSpaPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcR7q2LQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcR7q2LQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781063172; x=1812599172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=verQQH9xS0Kt9TML7W4Uyyf/Sx7YvSc3FYMDOwweIW8=;
  b=AcR7q2LQGZFFdvLsk0nOXJ+RTgIKSBH4YnJEkQAIF6G04+pcHk2xqBfv
   C4jXzUSjZ8xRXHTijWm1l5qLgXcvP2Ix+yFahK8tMjz6gzsO0wVWltdIP
   A14o5wJ12yRPLdvCZN0D0i2URR1keplgI8yLwcQYK5W74tn1IUhMqfEaO
   hQkmAiWwRph67VB1jqx1vlSki8+f8G0BiYGeaGCigzvO3X+ucwG4a4frw
   W8wNzGAVbtNbMZhaLbX9OU/i1WcQLNAr7WnKHkCjDkUERlIcM9zb7/H4W
   bdbiBIyZ4+pth1b3ke2Xv3QfRoMq8dFC3yuRMzBVRpnB4O3yyJvkDA1Dj
   w==;
X-CSE-ConnectionGUID: 9g2dKRDEQr2hqakdGHKQ3g==
X-CSE-MsgGUID: hEuLfwbNQMmZ6vgp7VdzWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85474431"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="85474431"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:46:10 -0700
X-CSE-ConnectionGUID: t942LcRBRzSliN9w/MHVVQ==
X-CSE-MsgGUID: xYHo/vVJRIyHcVAnDQDfDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="249973099"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2026 20:46:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX9tG-00000000KsA-0ajW;
	Wed, 10 Jun 2026 03:46:06 +0000
Date: Wed, 10 Jun 2026 11:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 71/74]
 drivers/hwmon/cros_ec_hwmon.c:158:13: warning:
 'cros_ec_hwmon_millicelsius_to_kelvin' defined but not used
Message-ID: <202606101103.K2DwFMw7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   1723bc01ecc7ca2f30272685121314379ba5eb18
commit: 4a1140942f92a3608a708be12cedae3968f9f9c8 [71/74] hwmon: (cros_ec) Implement custom kelvin to celsius conversions
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260610/202606101103.K2DwFMw7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101103.K2DwFMw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101103.K2DwFMw7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/cros_ec_hwmon.c:158:13: warning: 'cros_ec_hwmon_millicelsius_to_kelvin' defined but not used [-Wunused-function]
     158 | static long cros_ec_hwmon_millicelsius_to_kelvin(long t)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cros_ec_hwmon_millicelsius_to_kelvin +158 drivers/hwmon/cros_ec_hwmon.c

   157	
 > 158	static long cros_ec_hwmon_millicelsius_to_kelvin(long t)
   159	{
   160		return DIV_ROUND_CLOSEST(t - CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS,
   161					 MILLIDEGREE_PER_DEGREE);
   162	}
   163	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
