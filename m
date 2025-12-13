Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0561459F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 05:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765604948; cv=none; b=Ed72jb0PpXteCs6/+5BO4y1EIqMsIsK+EYILTjAau9bSfqfxAO+ctH+HW80CurcyyCyfARYG49/VtXd1+pkRfJ2N5apbEZjh/tnGCc2nrM/1laDogsjcc1xzO2K3d3ry6e5NQWTXAAf5Hsc5bUE4IwSX0+k7olINPrbJ0uaoEQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765604948; c=relaxed/simple;
	bh=zf4HveJ37GGOYQLCo2kWHBj8mBpxMpGCdVsZJroEseg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MhPZGptF4S06+sdupU8sSUmyh9nMu98arjZ2erjKUqcdke4pzOxuzJQrwFU3Ds5cnOHXqUCw46aPwbnQ/f9F2sEKJcVSgGQ3piiAQvX1fuDjsUBBTU2hDkRtPPBJ266SsF1n1nrHuBocy+zoSpkW97+hOZpVmPtqTGAZaEuErs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AK5mUL0d; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AK5mUL0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765604946; x=1797140946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zf4HveJ37GGOYQLCo2kWHBj8mBpxMpGCdVsZJroEseg=;
  b=AK5mUL0dLgzG5LRtOa+zNNn+1KN5b/uv+Rq7tCrkb5qXOvJMuA/09r30
   Shxg+5dWWGhAC7zzEmtd5xf8vXCWbHN+eAR5etRwKW0bmouyxgF2izzqh
   cUwJtCmRPo04kUb14rc3hrZWepkqHNnnqzandKz/mnNGXz5W3Aft3GeAX
   5BJXX264mDzZZ2qL04R97u0PsATfQBooSqH+PZNEXpZQtIZnQu2A132te
   lK1efcd7t3hNt7knwYSfKYT5O9QbALPr+2Wpyck6qT/pl3wNwcp2tU1zG
   jeDG1dbPsfk9+zzwK45GoO56EJweSUML+ggrySMPM9nym5Uh+/AcWqDgI
   Q==;
X-CSE-ConnectionGUID: yT8mSHL7Q7qYjQVbpERRTg==
X-CSE-MsgGUID: vnJeST43Tb6PwhWQSej/xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67484703"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67484703"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 21:49:05 -0800
X-CSE-ConnectionGUID: LFsJklUuQsGrYdCLJyAejw==
X-CSE-MsgGUID: dR0RF4aNS3G/K0OgpZqtxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196873276"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Dec 2025 21:49:03 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUIV3-0000000077l-1khF;
	Sat, 13 Dec 2025 05:49:01 +0000
Date: Sat, 13 Dec 2025 13:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 13897/14265]
 drivers/gpu/drm/xe/xe_survivability_mode.c:139:6: error: variable 'index'
 set but not used
Message-ID: <202512131341.1GNtRXjy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d9771d0dbe18dd643760431870a6abf9b0866bb0
commit: f4e9fc967afdb53b1203f894fb4b68451a7fe202 [13897/14265] drm/xe/xe_survivability: Redesign survivability mode
config: i386-randconfig-053-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131341.1GNtRXjy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131341.1GNtRXjy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131341.1GNtRXjy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_survivability_mode.c:139:6: error: variable 'index' set but not used [-Werror,-Wunused-but-set-variable]
     139 |         int index;
         |             ^
   1 error generated.


vim +/index +139 drivers/gpu/drm/xe/xe_survivability_mode.c

5e940312a2ac64 Riana Tauro 2025-01-28  132  
5e940312a2ac64 Riana Tauro 2025-01-28  133  static void populate_survivability_info(struct xe_device *xe)
5e940312a2ac64 Riana Tauro 2025-01-28  134  {
5e940312a2ac64 Riana Tauro 2025-01-28  135  	struct xe_survivability *survivability = &xe->survivability;
f4e9fc967afdb5 Riana Tauro 2025-12-08  136  	u32 *info = survivability->info;
5e940312a2ac64 Riana Tauro 2025-01-28  137  	struct xe_mmio *mmio;
5e940312a2ac64 Riana Tauro 2025-01-28  138  	u32 id = 0, reg_value;
5e940312a2ac64 Riana Tauro 2025-01-28 @139  	int index;
5e940312a2ac64 Riana Tauro 2025-01-28  140  
5e940312a2ac64 Riana Tauro 2025-01-28  141  	mmio = xe_root_tile_mmio(xe);
f4e9fc967afdb5 Riana Tauro 2025-12-08  142  	set_survivability_info(mmio, info, CAPABILITY_INFO);
f4e9fc967afdb5 Riana Tauro 2025-12-08  143  	reg_value = info[CAPABILITY_INFO];
5e940312a2ac64 Riana Tauro 2025-01-28  144  
5e940312a2ac64 Riana Tauro 2025-01-28  145  	if (reg_value & HISTORY_TRACKING) {
f4e9fc967afdb5 Riana Tauro 2025-12-08  146  		set_survivability_info(mmio, info, POSTCODE_TRACE);
5e940312a2ac64 Riana Tauro 2025-01-28  147  
f4e9fc967afdb5 Riana Tauro 2025-12-08  148  		if (reg_value & OVERFLOW_SUPPORT)
f4e9fc967afdb5 Riana Tauro 2025-12-08  149  			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW);
5e940312a2ac64 Riana Tauro 2025-01-28  150  	}
5e940312a2ac64 Riana Tauro 2025-01-28  151  
5e940312a2ac64 Riana Tauro 2025-01-28  152  	if (reg_value & AUXINFO_SUPPORT) {
5e940312a2ac64 Riana Tauro 2025-01-28  153  		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
5e940312a2ac64 Riana Tauro 2025-01-28  154  
f4e9fc967afdb5 Riana Tauro 2025-12-08  155  		for (index = 0; id >= AUX_INFO0 && id < MAX_SCRATCH_REG; index++) {
f4e9fc967afdb5 Riana Tauro 2025-12-08  156  			set_survivability_info(mmio, info, id);
f4e9fc967afdb5 Riana Tauro 2025-12-08  157  			id = aux_history_offset(info[id]);
5e940312a2ac64 Riana Tauro 2025-01-28  158  		}
5e940312a2ac64 Riana Tauro 2025-01-28  159  	}
5e940312a2ac64 Riana Tauro 2025-01-28  160  }
5e940312a2ac64 Riana Tauro 2025-01-28  161  

:::::: The code at line 139 was first introduced by commit
:::::: 5e940312a2ac64ba0d6239aff72135226818b238 drm/xe: Add functions and sysfs for boot survivability

:::::: TO: Riana Tauro <riana.tauro@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
