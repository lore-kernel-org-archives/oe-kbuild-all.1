Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C96A4C7D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 22:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690929707; x=1722465707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1GCeMII5MW9uRPXks7dkCS/u0+kAhKpMcIiaPwzr9AI=;
  b=JWewMhiMyzt8mxPTO79TNz4eTiSr7HWmBmh1rOTw5nhzbC5jeO1VFlm5
   Ndk8BRYbjtkN/5IaQDAAa1FRflsZtUWO0Cd9olhnIkYrNC6n0C5/4/VFi
   RwAh4KzHSd3SZb5hhRI1gNSsIkkGiz0DNKoL6an02ed81EK+6nDRY/qXV
   LyPxw7VeqiCiuFsMjYbk4Vtk1XwuLeWnQK4Kx5bx6A+UTWZoGUtIrLLoB
   9Qv107GVIuMHzYd9eq1AtVhvAGDcDdi7JXwvbvb83hw4YZ0Rttz4IaORP
   aIiuwX2bsJ/XU+YLIAdD6/I9W1/KfuYIQsyoMfbs5xLMfy0Rju2ti2Swe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400374748"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="400374748"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 15:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="728866325"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="728866325"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Aug 2023 15:41:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQy3k-0000df-03;
	Tue, 01 Aug 2023 22:41:44 +0000
Date: Wed, 2 Aug 2023 06:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tpm 5/6] drivers/char/tpm/tpm_tdx.c:884:32:
 warning: 'tdx_guest_ids' defined but not used
Message-ID: <202308020625.qSVLTU2Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tpm
head:   bd11e879e2f173be2f4aeed6d040fe61a5a37d5a
commit: ae6b392cf132fb5d5117ba9022233c599d6b4699 [5/6] tpm: Add vTPM TDX support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230802/202308020625.qSVLTU2Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020625.qSVLTU2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020625.qSVLTU2Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm_tdx.c:884:32: warning: 'tdx_guest_ids' defined but not used [-Wunused-const-variable=]
     884 | static const struct x86_cpu_id tdx_guest_ids[] = {
         |                                ^~~~~~~~~~~~~


vim +/tdx_guest_ids +884 drivers/char/tpm/tpm_tdx.c

   883	
 > 884	static const struct x86_cpu_id tdx_guest_ids[] = {
   885		X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
   886		{}
   887	};
   888	MODULE_DEVICE_TABLE(x86cpu, tdx_guest_ids);
   889	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
