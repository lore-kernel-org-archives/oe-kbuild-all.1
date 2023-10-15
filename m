Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902E112B9B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 23:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUrlWpyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697414226; x=1728950226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mrWMZeej3GeSkztU9/Z8T3qNeU4sLSEZ91s72V40gb8=;
  b=QUrlWpyzFHYvPdALQZLub0URDEAWHZ/gClFZr3PGOiCqCPGRQ5fC85/r
   80OB1PfcLgd/mDxwIK1rO8HusbVX90Po5K+JxLOUUaJkzWdk/e6ppTr2U
   NBsm6q/v9LNhmRHkmU/zLWUTD4IsycOXMD/FWQxXiRogHybK9N93B6xar
   mP6XCoFUvGUvqc79mBWdakZ+TIuH7s/Fk3ngcfG47q64A2YZuwMUnNq8k
   +BTjm88divLVeY7et1kACmjEtUPAgFZNG9WN5uTEXBjTZ4t9EcGH3X/wG
   2YAtebwIefdyXoXehBTfTxM57ye1RuIAXEsApvI2lvCSwqIzYNBFwSj7l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364784161"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="364784161"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 16:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="899283179"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="899283179"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2023 16:55:07 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsAyk-0007wF-0b;
	Sun, 15 Oct 2023 23:57:02 +0000
Date: Mon, 16 Oct 2023 07:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-3b 32/34] checkpatch: WARNING: please, no space
 before tabs
Message-ID: <202310160728.OEcMzKpg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-3b
head:   5abd981a4880b734bd589e9d30373f917a5abc89
commit: 5ea8a6cd8f1cf76a0ae361c54875b345ad434e56 [32/34] dyndbg: drop _ddebug.site member
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160728.OEcMzKpg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160728.OEcMzKpg-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#39: FILE: include/linux/dynamic_debug.h:230:
+^Istatic struct _ddebug_site  __used __aligned(8) ^I\$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
