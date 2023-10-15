Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3431FD7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 06:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnW1BosM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697350961; x=1728886961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=igCgwWAxO+jba/v+cwpdnltw8hAoVNorgbeYR513f5w=;
  b=HnW1BosMMHYG6xQlQnu60iFeWcOzIGz+Qhn6WwvzRQ3J34IXM8lRTLlW
   fV6z5DCgAIhWUjDP21q4Y7ob7kULXg4Wyq8YcFRbtRrjLyT5m9r5TjAps
   oyYXS41C0tXEroZFh1rLF6hxBj0hnjXocnscnxgxNCmSqlQf108zHFj7N
   ZS9VSFNeN/CPK4cWu+rPqGosgGAldSNZQlLMvGoBopeiociFCRXlQc4rW
   QffbJMTNVVm21QKHhTc4Z6mrcpXcB1QVZDaA3ARduXjQGhOcSV8OqbHyX
   v71OG2qzQWDgsPIxGAlZ17+NZ02i1xcJZrr/HsYXU+5QeZ1pJfznItr3r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389229053"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389229053"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 23:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="899077398"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="899077398"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2023 23:20:43 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qruWK-00077f-1g;
	Sun, 15 Oct 2023 06:22:36 +0000
Date: Sun, 15 Oct 2023 14:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-r3mini 5/18] checkpatch: ERROR: trailing
 whitespace
Message-ID: <202310151454.AOxH6d3c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-r3mini
head:   17d137ab830925bb82623f79f804856078677bdc
commit: 5ac002870c8d2c3d602c4a8deed90d002af07fa6 [5/18] build.sh: add build-script and configs
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151454.AOxH6d3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151454.AOxH6d3c-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#493: FILE: arch/arm/configs/mt7623n_evb_fwu_defconfig:455:
+#Bluetooth Classic (BR/EDR) features $

ERROR:TRAILING_WHITESPACE: trailing whitespace
#1683: FILE: arch/arm/configs/mt7623n_fwu_owrt_defconfig:907:
+#Bluetooth Classic (BR/EDR) features $

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
