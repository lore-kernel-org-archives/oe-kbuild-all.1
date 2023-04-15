Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7EB7EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 06:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681541119; x=1713077119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8jq2WECQ2oaqdz/nj/RNc82Kzb1caH1O0gQzuQI82ts=;
  b=dT0aZZWVF/qI43fN80ROcot232iG9VQ90XwZuCmIBHmJsg3wGOVdLTdM
   MA7RaxDjkevZeMSSjqw+IsiY/YWA1L4RM7puU3AQf+q3qrWkl/uV24VyP
   dsjT1XgW+6xSvMviuhu7qcyBQAq1fDfnUx0P7YYqlurkj4rh91tfkgTEH
   DPwilkta9a8IVjAokIYSJ0nyoy8g0/qn6699ur4nK0EkSDYhNViLb4CZc
   AZrlacAANZOJ5/8LWxmimyz9W+SFHkd3YJwfrua3Taby2vBgW/bxdNYY2
   QR7+iDJhehknSAfaaMC2Nu+6gxEq7qsyZssakBgWH3xaj1mX8ST71GI9H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="346465105"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="346465105"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 23:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722724082"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="722724082"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Apr 2023 23:45:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnZev-000ac5-26;
	Sat, 15 Apr 2023 06:45:17 +0000
Date: Sat, 15 Apr 2023 14:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [spandruvada:intel_tpmi_uncore 62/65]
 drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c:331:27:
 error: initialization of 'void (*)(struct auxiliary_device *)' from
 incompatible pointer type 'int (*)(struct auxiliary_device *)'
Message-ID: <202304151445.2aHiym7P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/spandruvada/linux-kernel intel_tpmi_uncore
head:   86f738b1487c199ca6066ed10af09667e684180e
commit: 1f86cedfe5d33dd44555736521d63812ce3e19ea [62/65] platform/x86/intel-uncore-freq: Uncore frequency control via TPMI
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304151445.2aHiym7P-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/spandruvada/linux-kernel/commit/1f86cedfe5d33dd44555736521d63812ce3e19ea
        git remote add spandruvada https://github.com/spandruvada/linux-kernel
        git fetch --no-tags spandruvada intel_tpmi_uncore
        git checkout 1f86cedfe5d33dd44555736521d63812ce3e19ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151445.2aHiym7P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c:331:27: error: initialization of 'void (*)(struct auxiliary_device *)' from incompatible pointer type 'int (*)(struct auxiliary_device *)' [-Werror=incompatible-pointer-types]
     331 |         .remove         = uncore_remove,
         |                           ^~~~~~~~~~~~~
   drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c:331:27: note: (near initialization for 'intel_uncore_aux_driver.remove')
   cc1: some warnings being treated as errors


vim +331 drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c

   328	
   329	static struct auxiliary_driver intel_uncore_aux_driver = {
   330		.id_table       = intel_uncore_id_table,
 > 331		.remove         = uncore_remove,
   332		.probe          = uncore_probe,
   333	};
   334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
