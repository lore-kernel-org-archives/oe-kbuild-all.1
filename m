Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D684317D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 03:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765511399; cv=none; b=CCm52BTN0bi8TMau1AsltoYZKCp/s2fH03n/TzH/AfG6/jR2iMo77wRDU1AdijDxugFSlwcDJZytoCVAlqjyseveBKVxWHKDT4mk0KFDYItmPeDej+8Tp/SFJw7/ZTXkUd9XY9H7Z2CFkFnlKVBP6/Bsj9wh53hdAjR5rf8GEMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765511399; c=relaxed/simple;
	bh=D9dmxwlvpNVkGAiPe5YGutD+TfVuXVRSBNueyf4PPJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YLj2PfHhSmNJsB7iQvh5ErTjZlRI+Icz7KgF7zHi+7y1PIYhdh96aN3FJW+Y02ztIofxTyIUKyUoQhKesrEKSlppw126jtdLaYbYJ+ZZVlrACfDP7qbsJFBQpq94xiPmiYWhxHAl3byAOojOmTRK6C/p7drHPLtFUyJLTSgNneU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieBUswIX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieBUswIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765511398; x=1797047398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D9dmxwlvpNVkGAiPe5YGutD+TfVuXVRSBNueyf4PPJk=;
  b=ieBUswIXyMaa09PJ5eHV8YJmKvn4Z4RMDL0EP3cQxdz19jrTNpYYcXGy
   R4IJ7CeVCX98JjAAoY56r7nhqEd1uGzgopqAx2nVySfsanAng0cSW9o8u
   fZZwk+aMTPj0+31CcU1r+GSej2k/8S4QLpXVWetT4JSMtzoj4hmIOF7u7
   kDCKmhbVtolg31f7SZPtp8vHEW2vYbZzpQ+xAslNOqzwLHmBmvjTdyfaD
   lUyMJhQSLnbaBvSN/YyEiR6Cm/zGS7vp8Xh8hdlysPM2Z+c28U6toylfH
   8az4RT86W9e3aybrZsR8kCEP0ccG6scr6X44p235qzCrMO0yOe//egJ2W
   A==;
X-CSE-ConnectionGUID: Vl6+6EpWTJGy/1NSLMDRBQ==
X-CSE-MsgGUID: 9dcscvxFTDKu5J3t4l6HCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70082754"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="70082754"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 19:49:57 -0800
X-CSE-ConnectionGUID: jBMTQFpCQxiT6uUwKg61rg==
X-CSE-MsgGUID: +AHJ0ulsQgOb9KJqmEqyTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="228038450"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2025 19:49:56 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTuAE-000000001Ho-1hoC;
	Fri, 12 Dec 2025 03:49:54 +0000
Date: Fri, 12 Dec 2025 04:49:42 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25] kismet:
 WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected
 by SXE
Message-ID: <202512120415.r0qfkvOk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   48fa9d861c1eb99e9f682fb2623142fb456aa0eb
commit: 6d3faafa89dee569bd8376840a2f60114538f2a8 [25/25] anolis: net: supports linkdata ethernet controllers
config: x86_64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE-0-0 (https://download.01.org/0day-ci/archive/20251212/202512120415.r0qfkvOk-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251212/202512120415.r0qfkvOk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120415.r0qfkvOk-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - SXE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     Selected by [m]:
     - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
