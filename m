Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98FA22577E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 18:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744135365; cv=none; b=X7vW0+YbMDgfgBtgm/MQEkexIElfADulmYEkpxLpOH3uuJThsrDV25FsbmM/NWjtiHleN0vLnHwlInGTTXD6L5Agq7kS/pxZWIid4lc4P4L64GU44RakbPqnL+vhqzezztSOQygIH6DOOLOkr5Ej/bzpXtNqZlw5E8/vEc1xk9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744135365; c=relaxed/simple;
	bh=pcPjXrp6uJ1rlAXSmdUtDCyocEFcg5A3h48kQgQ0GeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCt54jR9RyYrgbGrO/BOSAgWwJ1nslKN4e82V6qQmznEpiILnQbvUr3qRR5jj/dRX2c42efTjb+nKayHlgXHs8BQsauHDYq0bS3xusAtuw47WoHqd3f7PXrOVVlPIwItr6/sUnJXFHfNXZESmxQPjoueAPQVADqbUtwJ9HBZ+RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJSihTSa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJSihTSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744135363; x=1775671363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pcPjXrp6uJ1rlAXSmdUtDCyocEFcg5A3h48kQgQ0GeQ=;
  b=GJSihTSaVExIAg24RY8JALmbn6J5rFKClppQwLiFPGEPTtH5viuGUejk
   HVOrc0Re9bVEDB2YmuJyGbZP6SRDVpGlh5xOeKb/mPSiLL8UGa+Bc3MaQ
   664FunSADpxAvo5adpaBAsGJ691dVGAmJuqVkoxrc6/BvBHj2UtX7dpM2
   pk1uTy/uAvklGixN/zXCOeJ5gYfNnR8SUHreLvSoINo4Czopz3CRLEQOs
   80RVYgHmA9K/j1NabDig4FP+d9haul6Lw/5xwxrngbZUrw8UbdmROznXn
   uT9oeIzsqe9VAVWj7RoDVePTLcIRQ3izA1PeF3Yfxa7xOCSrIWyT/dJRY
   w==;
X-CSE-ConnectionGUID: RjisQ8S1QZmnIW5HcSgZ5w==
X-CSE-MsgGUID: kuTbSZWFQ2SX0EVbFzZUeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45678580"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45678580"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 11:02:37 -0700
X-CSE-ConnectionGUID: jURqNA5ATxu538mKO+tTIA==
X-CSE-MsgGUID: AeEkztG+RrmTylfXoAJ1KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128331453"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Apr 2025 11:02:36 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2DHN-0007ol-1f;
	Tue, 08 Apr 2025 18:02:33 +0000
Date: Wed, 9 Apr 2025 02:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
Message-ID: <202504090102.ZWASrKa7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   c55bd07f747cd457f58e5781279fa11a5fc0add1
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [9/9] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20250409/202504090102.ZWASrKa7-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250409/202504090102.ZWASrKa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090102.ZWASrKa7-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=n] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=n] || CPU_SUP_AMD [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
