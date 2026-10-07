Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1870739182E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361305; cv=none; b=j4TFS7Njd5xSNRP0w4Z44qEtSE2rMkJlpirbMOP/FMRciaBVsLXzQ1DZeylamWHZpPM48e2BBOtHr0Nq13n+FVE8aEaZoAHxqxQUUD5/PLBz8DJZGotg7XhrM5acuai0+o4XFGNDLnLEPlQiVti/x0Vs4hnPsHfB1/kC6TrwErs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361305; c=relaxed/simple;
	bh=PEoe+3fGPCHJosCA2T2WYIDsTIVJOA5Y+hjOzE7m4q4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LsUDUZUlZaYwW89pzzmRxC0LXZY3sTZZ4yiBXznqg+EExKC9TG8Eis/evBVXAISjU5Ho906tv8vNb3E+gsGO3CYFNxuInu592Doyp+Sng1f46iqZ3FgsTscr98nEzlKu/WJu+noTQizt7ejnaVGkNcYRmZcTiMPThvZIB5Q9/jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lw6YjRzR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lw6YjRzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791361304; x=1822897304;
  h=date:from:to:cc:subject:message-id;
  bh=PEoe+3fGPCHJosCA2T2WYIDsTIVJOA5Y+hjOzE7m4q4=;
  b=Lw6YjRzRacudk/q3QCrVchQESeNuWpMrlI3gI8I/0tAODg+qOARQDvD8
   WjJGY3kR35p/FUqE/wB5ttrcdZoIXVl5rjVhfcLhOl0nULSy5/RbiKZIf
   V9jWtuQFqkbgRHFgtuSLuPiL8pMO7IxcSTQse8hdaIYB5KlT0Smc5UBOf
   uaimq3/pqsW0AeEKiSje/hBnu6FnvL8Ohe34h61YjWAWsrjehmaaCx2Qv
   YEA0YqXQ/9IT2dhjw5ak5jlzBEi7Ai4b0tzHQ43ug+wTVN2j03aAnLz57
   Og8XfqYV5/boSehncUrVEOx9P46qPEiY/B8aLunFHgSHtS8vUjMd1sery
   w==;
X-CSE-ConnectionGUID: IPlR42KQRn+fiV5hMsnw4w==
X-CSE-MsgGUID: KZ915iDUQLeOTaA/Xlsavw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="123312"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="123312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:21:43 -0700
X-CSE-ConnectionGUID: NYoRdiVzRs+mIsDeAle4UQ==
X-CSE-MsgGUID: epd+8TIwQV6lnGy18Eiyag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="305365988"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 07 Oct 2026 01:21:42 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEMuC-000000002l5-2C91;
	Wed, 07 Oct 2026 08:21:40 +0000
Date: Wed, 07 Oct 2026 10:21:01 +0200
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ERROR: modpost: drivers/media/i2c/mira016.ko: symbol
 '__aeabi_uldivmod' undefined!
Message-ID: <202610071033.6KLbvGsl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/dt-bindings-media-i2c-Add-Mira016-image-sensor/20260930-125119
head:   e8dec93c8edef3169a4bfd129a021b31dbf5d018
commit: e8dec93c8edef3169a4bfd129a021b31dbf5d018 media: i2c: mira016: Add driver for Mira016
date:   7 days ago
config: arm-randconfig-r2104-20261007 (https://download.01.org/0day-ci/archive/20261007/202610071033.6KLbvGsl-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project dbeca9a3a3ba0b46471efb339b0ea8f2194f6f68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071033.6KLbvGsl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610071033.6KLbvGsl-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/media/i2c/mira016.ko: symbol '__aeabi_uldivmod' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
