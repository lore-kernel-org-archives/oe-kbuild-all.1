Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425F217C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 01:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681175989; x=1712711989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rQMr1kaGKle6bVepyPFiq+Y9qGdZ5nRMlRTZAZs1xMI=;
  b=NQqwwyBqMkzU7GwrmUgECJjILdUi5OP7eG856mhIbs0dUR13ZU/CUzAe
   3iqYTekUA4NUwpPUxQ3u/QbvLFu4NWXflxbBA7/kA50qcj3wfUjLrzzbh
   ZcTr1RCHZ78Bfq0IePKpPH5QksJlpN//737pwwuDBEVBLIdabaNwBdQ/g
   EG565Y2ysLfmB289FuzRsI+iPNR5JYGn2K9fIs3aN+evC0E88JA/90QHN
   LG+J+XstcJ5Cx5dl7WPP6JDB5pYkOhTsF/dsYm/Ic/5r3cZ1r1GX+1s0m
   i53alcfhs84jWpGGm2yuoOJLolGhTS2SlcqrwGnHFV6TFyroosqfAT9r4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="345283556"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="345283556"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 18:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="812377969"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="812377969"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Apr 2023 18:19:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm2fi-000Vn1-2R;
	Tue, 11 Apr 2023 01:19:46 +0000
Date: Tue, 11 Apr 2023 09:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter-upstream 30/39]
 arch/x86/coco/tdx/filter.c:21:13: warning: 'filter_overridden' defined but
 not used
Message-ID: <202304110900.lDFzbPsY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   359e363de7b2f8863a0cbfb771cceaefb7a80873
commit: a4a44ebfde8563bd89c8f7824cc62e17b992f267 [30/39] x86/tdx: Add a command line option to add new ACPI tables to the filter
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230411/202304110900.lDFzbPsY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/a4a44ebfde8563bd89c8f7824cc62e17b992f267
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout a4a44ebfde8563bd89c8f7824cc62e17b992f267
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110900.lDFzbPsY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/filter.c:21:13: warning: 'filter_overridden' defined but not used [-Wunused-variable]
      21 | static bool filter_overridden;
         |             ^~~~~~~~~~~~~~~~~


vim +/filter_overridden +21 arch/x86/coco/tdx/filter.c

    19	
    20	/* Set true if authorize_allow_devs is used */
  > 21	static bool filter_overridden;
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
