Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4D132AAB3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jul 2026 04:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784955492; cv=none; b=pRInuH9MOkQoWzaPYe4lK8BDBRIUgAQDTXx7rLo5+GOXGhtaXvb0WojFUg3N0UmyDoUEhi0jvciqtFKjO66Ib5zfi4JEQ2GRpDZ2svA+8pg1Nkwb+FIbPpTXedSMzJ5HI0jdP3WECuBkdDk95faOCFgGv9V3sfLklXagQi6oaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784955492; c=relaxed/simple;
	bh=ujV7jtInfa5uMa9+0y9IHW+Ex9ZUtSYYkaL7olbUI18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KJcfnQJBGBq3FMiwC6Tb09X7Sj72FTgejFBEx8HkcNjXlw/ESDvopv4JYzGxqIxxZchU+mCWkhDEOsFkZAEhXTllAZ+A0EtTHjum6SShQfDuEJCeWBnfUwR35fo9z+hOkVAgCdE3h3Eavedii22dC4FMiLYYe2D0vlja/dpeBJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myxlTF3N; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myxlTF3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784955491; x=1816491491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ujV7jtInfa5uMa9+0y9IHW+Ex9ZUtSYYkaL7olbUI18=;
  b=myxlTF3Nt1YpBcy6fmNpMlOiUcsISKq9C60qO7GueotASiMWS+u3rYff
   3gx2VF/XvOZvYQPRtyn4BYbS+lHv9RV6bFShGVexFWRmv8H4+6uyU4afJ
   FgvG/2ddybHkB06fLKYSzZJalmipil/HNyIN0U7NWlBVqqFYpkLH6lEKp
   vt6JwUXFb5+0H7y0xXSeyKNMgs1kswcPWGrPeBgS5jjQoeK3sZQuA7lMV
   LfLKpNF84vu3sCi+lra7aEYYkqjSK38+Se0MkFHHNNo4tPuCCZmIYSx5A
   imMbfpBrMTU+R7Y+ynWYTOvWvgtdQTWE13oiO1idAs121Csqz60vnBAzb
   Q==;
X-CSE-ConnectionGUID: 4/U1FQxNTvKmjU1+6n5X0A==
X-CSE-MsgGUID: xEA25LIMRnyI1a0LYx/3OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="85661679"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="85661679"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 21:58:10 -0700
X-CSE-ConnectionGUID: 8JBoPMW4RN6Oxc0zIl5RSw==
X-CSE-MsgGUID: 0xuWfWYoRAuWCdCAg8o8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="258960711"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Jul 2026 21:58:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnUSc-00000000bUk-2EMG;
	Sat, 25 Jul 2026 04:58:06 +0000
Date: Sat, 25 Jul 2026 12:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-cmap-part1 21/31] Warning: lib/dynamic_debug.c:672
 expecting prototype for param_set_dyndbg_classes(). Prototype was for
 param_set_dyndbg_module_classes() instead
Message-ID: <202607251252.Z5wTJE6Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-cmap-part1
head:   cf789fdbcadea49e2a592226d61aa4555e7f53ff
commit: 6db0e6bcc5a5d1d0145722de315aa9de459a6948 [21/31] dyndbg: refactor param_set_dyndbg_classes and below
config: x86_64-randconfig-161-20260604 (https://download.01.org/0day-ci/archive/20260725/202607251252.Z5wTJE6Y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260725/202607251252.Z5wTJE6Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607251252.Z5wTJE6Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/dynamic_debug.c:672 expecting prototype for param_set_dyndbg_classes(). Prototype was for param_set_dyndbg_module_classes() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
