Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182D1368263
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 11:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979091; cv=none; b=GpRc+5/8tcTVSGUj2k887arHzbdM8XyB5iLvXCpp63E1c13SIlMH+g7I3B8dTD5cXFzFQzGsww4A8nD84I5Kstc8cyDDV72obSxcYAAock5ysURBTYR4ZF3jOyds+DKE2cNWaRFOEDG4gNBRYapAFM40eYWY7JML7qB58GmUmlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979091; c=relaxed/simple;
	bh=MHMZthi2r8EacJ9dEHCVrUsTGll93qFQlbwwNDSiikc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HPZ1V3GvtoRTsALO8d+8HJap+OtyyRlINsvkOaBIAv+3lYqvSExv7xa5UYS+miem4SFFHdds+4NyPYnFf7GdYETV7Zvsv5y+34n0xZqBA41i0d0VjXcwC8SDWA8Cktti9T1xprrC7rwcNGh/tRGpY220/8UA8JdUNdb+a7Rq+Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msCktNgq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msCktNgq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777979090; x=1809515090;
  h=date:from:to:cc:subject:message-id;
  bh=MHMZthi2r8EacJ9dEHCVrUsTGll93qFQlbwwNDSiikc=;
  b=msCktNgquZL1EtWvtOmD1U1Ejhc7kycpDgbFOj5vg8DGMvt36jBu7lcL
   ULzpT5HqM1e5yd15WZNPJU89dppYOpPQxbsxeXGLqIMvjPcn2Y/ChXH3M
   u+WyTNy3vXwWytwoeyQXrZcZHLA90s4vrXIxf5YFE8WyGLtUZKEi3MMph
   fEJH2hHCOoDmrbWT3/tIRwhOgl61lMRdjDU+4Jmku5sY9+82AU3A1ZT+b
   udT962kTkWoTar2jzeJfLQAnajeBLEG22bSLWecdPgM213cEkmq6hhDzC
   lXkXavJE+H48kViPqZAaxqPMONB+eMe9jpPAMwut69d5ObIdMBdFgGMT4
   Q==;
X-CSE-ConnectionGUID: vhNXYiZ7SbOXzYXFhVZVgA==
X-CSE-MsgGUID: xneacPtCRbmog8CvIFqe8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="90302655"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="90302655"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 04:04:49 -0700
X-CSE-ConnectionGUID: KmhwZh7RTWqrdDlFznsPuA==
X-CSE-MsgGUID: CzZJ6hT9TzaOepOHYC/BNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="235659311"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 May 2026 04:04:47 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKDa0-0000000005p-3jEN;
	Tue, 05 May 2026 11:04:44 +0000
Date: Tue, 05 May 2026 19:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:shrinker_debug_6.19 2/5] Warning:
 mm/shrinker.c:833 function parameter 'out' not described in
 'shrinkers_to_text'
Message-ID: <202605051827.fHU3ncv2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs shrinker_debug_6.19
head:   f6a6818a809b0259a5f42dc265698775dead6b47
commit: f160c55ec224dc9b5e699ea0f54cfdfa32b951c4 [2/5] mm: shrinker: Add a .to_text() method for shrinkers
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260505/202605051827.fHU3ncv2-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051827.fHU3ncv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051827.fHU3ncv2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/shrinker.c:833 function parameter 'out' not described in 'shrinkers_to_text'
>> Warning: mm/shrinker.c:833 function parameter 'out' not described in 'shrinkers_to_text'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
