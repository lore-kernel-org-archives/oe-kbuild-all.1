Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08D981724
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 03:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790479234; cv=none; b=GXOvHPsVOEKMHRg/3rpuQNrywqo/jXbXuC1A38hxu0kQg1nsmwHCWozNqQfF1CyNHj30wAZdE32Ym501U4j2n6QaEzBk9aGX3JOzJZLThnBdlDdz3GNqbhxc9i6ZJoFPqM2lMJ782eLnvFlCU2U72FKZvpxWFFt6J0j7Pn5Nhro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790479234; c=relaxed/simple;
	bh=4iWE8aqlS9h4gSgwxAkDRdqXaodRT07REcFuTLkFj0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eZaCXq6+G2qc+7bEIA1c/2oVP1bTKOlQCcSoM/lKvEL5OWbV0Ay8CjYzp352w1fT6SrxeAzeVfPpww8Lr4fQZow2jpVrjwPjq3Oh7BWF88zML/DYPI9vNCy8YG3xH0jDME51JFBSEpMIQJwb254KMREuWaRCsCSPhiRghjkzaro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEW7ej8c; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEW7ej8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790479232; x=1822015232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4iWE8aqlS9h4gSgwxAkDRdqXaodRT07REcFuTLkFj0I=;
  b=nEW7ej8c77cy/eoDbYwRpe3ok7ZFcRGfdpMhkN0doqPf3WCpoyUMscaC
   Bk+HQLhaUr20BaOdJJIG6ZciDSMnHmGWwj5yrwKhewxc4wbsL43SsfvbH
   8Ynn3gBXaYalGgCBMOGJGpelEpJ7JU5P8rZ/Duih3UkQMRRemeT5s9eNo
   XrbaxjzHCgGUv2jG5H7tvtFoKyAb+g7JonepXWDw6HZdGezJRisq1qRU/
   oKaikHdwt1ZcOqdTDwO9HmwHPpMrlzOuVt0jIQHlZ7T7raXdTWYwPZQBo
   NUKfl0Ofmnjvk1thlOK93EqDJ1jL1oSZP+A1mVhl9SJzuj7pFR3yJk3Bz
   g==;
X-CSE-ConnectionGUID: EScfQVWhQCqMj4nu0H02Fg==
X-CSE-MsgGUID: 1ED6apGwQ3SOAPbAw571FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="90433898"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="90433898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 20:20:31 -0700
X-CSE-ConnectionGUID: gXS7ymY/T8WHqJSDn9Kt/g==
X-CSE-MsgGUID: JPMOE6XsR0avaVYdmBcjUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="312632514"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Sep 2026 20:20:30 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAfRD-000000000P9-26zq;
	Sun, 27 Sep 2026 03:20:27 +0000
Date: Sun, 27 Sep 2026 05:19:45 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmaps-v8 33/44] Warning:
 lib/dynamic_debug.c:739 expecting prototype for param_set_dyndbg_classes().
 Prototype was for param_set_dyndbg_module_classes() instead
Message-ID: <202609270516.qT3lV1zN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-classmaps-v8
head:   89143f99ac8f270ba0c42d403345380fe8b6a270
commit: e804bda0b826fce67e58cdcd931bee5d696babe8 [33/44] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260927/202609270516.qT3lV1zN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270516.qT3lV1zN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270516.qT3lV1zN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/dynamic_debug.c:739 expecting prototype for param_set_dyndbg_classes(). Prototype was for param_set_dyndbg_module_classes() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
