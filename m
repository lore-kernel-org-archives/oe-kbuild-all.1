Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464F7156C3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 21:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dm4MWoCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696887198; x=1728423198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NuTz6wgYs7FznGcxHe4VvoLd+Sbc9V/IwX33F/DuIFo=;
  b=dm4MWoCc3oeB7YbCw+cquXjrQrrPbAtrHyEb6GADT9dfnPHNhvHi1CwG
   qaynm0YXGz0gz8Bhm8ZGuWU1TWLCYLzIvLMBYUXnCiQ8o180K0Jec+LnI
   pOAZCdFeJ79t2xY05zgaqHixWbtPqssD2lXEn5HrKIyAsusnn+3rBIxTE
   3Gt7YgnNbVPJoBgc3YnBbWSZlhTrXbxPCO3YWF0SAvDiCT/4rxo4h4OIU
   BEyqfjc2/whi9IQe5uLPW4CiNlRLDxxtlZGWRogYCkY0u5b8lW9CeOvrO
   eBQ2lXDmyO0scd+WKP6DURZBeC0gMicggRpSxHFjrak7OeWmdfbspvIJJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="448444210"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="448444210"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 14:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="818980682"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="818980682"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 09 Oct 2023 14:33:16 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpxsI-0000hs-0c;
	Mon, 09 Oct 2023 21:33:14 +0000
Date: Tue, 10 Oct 2023 05:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5i 30/30] aarch64-linux-ld:
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.o:(__dyndbg_class_users+0x0): multiple
 definition of `__UNIQUE_ID_ddebug_class_user455';
 drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): first
 defined here
Message-ID: <202310100527.hZr1HfjJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-5i
head:   b5e43c478d17fce2548fce898a0362deabd3f624
commit: b5e43c478d17fce2548fce898a0362deabd3f624 [30/30] dyndbg: export-user-rec (doesnt help)
config: arm64-randconfig-002-20231009 (https://download.01.org/0day-ci/archive/20231010/202310100527.hZr1HfjJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100527.hZr1HfjJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100527.hZr1HfjJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: drivers/gpu/drm/vmwgfx/vmwgfx_drv.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user455'; drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
