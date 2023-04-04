Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581757F3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 06:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680591180; x=1712127180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=shcUlQWRVhXNjZ/W69WmPSiUHXgcb59ku8UZc8dh6eI=;
  b=fgiQUREjOtPA5A25UMC7TwgGkWPpO1v+6BV2s4vI+vrItJbA5oSZY5BP
   Y/4A7Tv8PC2/BfKy6259P01I3o4ljLdEoq1sDeCx8EdgEVsMGdAn0Izat
   9rZ/AYrAHv0SaSE+ewJqJBBzW/wWNfxDZwS1dcuDvKtZTL04vQCRwMkIs
   UEYyDcMECTVvMJHhAWg9lZQW1FMbQyDRpPR6+NIIW0VVH95B3rpkDjjBJ
   oPKsXPQZN0D0bj3GoMW16RVw24G9iv9JjM2UwvAWtX/YowVkytxYdT1hd
   iM+J+fgc5SRDLeNne6ubJyuTN20xaowxiwFHpX+T50erk1hSb6oUcKVq5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="428391636"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="428391636"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 23:52:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="932340891"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="932340891"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2023 23:52:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjaXK-000PIe-15;
	Tue, 04 Apr 2023 06:52:58 +0000
Date: Tue, 4 Apr 2023 14:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tpm-wip 5/7] drivers/char/tpm/tpm_tdx.c:672:32:
 warning: 'tdx_guest_ids' defined but not used
Message-ID: <202304041409.apNHLtp6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tpm-wip
head:   e2f91af6624fa658a8c4fea969584f50e46f0397
commit: a9bf1e73e7c00cb700bc2cc98c65a18113bb50da [5/7] tpm: Add TDX support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230404/202304041409.apNHLtp6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/a9bf1e73e7c00cb700bc2cc98c65a18113bb50da
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-tpm-wip
        git checkout a9bf1e73e7c00cb700bc2cc98c65a18113bb50da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/char/tpm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041409.apNHLtp6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm_tdx.c:672:32: warning: 'tdx_guest_ids' defined but not used [-Wunused-const-variable=]
     672 | static const struct x86_cpu_id tdx_guest_ids[] = {
         |                                ^~~~~~~~~~~~~


vim +/tdx_guest_ids +672 drivers/char/tpm/tpm_tdx.c

   671	
 > 672	static const struct x86_cpu_id tdx_guest_ids[] = {
   673		X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
   674		{}
   675	};
   676	MODULE_DEVICE_TABLE(x86cpu, tdx_guest_ids);
   677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
