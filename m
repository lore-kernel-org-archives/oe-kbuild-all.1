Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89733259D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 18:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688409450; x=1719945450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G5+6nEgjf+geJF8euj1/Wn5xmQNN3AVS4aahg34OoNU=;
  b=HffXH33EA6yTj23zKnt3o5rqAWQV0oDhMToMHlSA23TfSo2ACmKSjsN4
   SHgqBimjF+Csh84CQjXUrtNBEUV1nCUQ/QugJdcLljkR+t56bBsCOujin
   8rVzop2sGIAOQdJeW76yOYrMr9kcscoc/74w6k+L9dMEVfz2KO4CfhqyC
   af/I5DT9iqOE0cQDI4StswGeoaPiIz16nUChbAwe/1qyaVMtlDgnrHtEV
   sMomsp3rM7BFZce3qdxaOejCmzxEepsJk48DrlMSLu7hI8/Li1sFFd/md
   ezIjoOIAdZzqA4JAaueXHAW0nZlfkoiR7Eb0bRHP7mziJiVUgO5J+cbAu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343279819"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="343279819"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 11:37:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="668830225"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="668830225"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Jul 2023 11:37:20 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGOQJ-000HaL-0u;
	Mon, 03 Jul 2023 18:37:19 +0000
Date: Tue, 4 Jul 2023 02:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 26/26]
 drivers/gpu/drm/i915/display/intel_pmdemand.h:36:24: error: 'I915_MAX_PIPES'
 undeclared here (not in a function)
Message-ID: <202307040218.4V2FLxpY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   b9c2968f3aefef7f4d9f13f04f40e27c61ef6d32
commit: b9c2968f3aefef7f4d9f13f04f40e27c61ef6d32 [26/26] BACKPORT: drm/i915/mtl: Add support for PM DEMAND
config: i386-randconfig-m021-20230703 (https://download.01.org/0day-ci/archive/20230704/202307040218.4V2FLxpY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040218.4V2FLxpY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040218.4V2FLxpY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> drivers/gpu/drm/i915/display/intel_pmdemand.h:36:24: error: 'I915_MAX_PIPES' undeclared here (not in a function)
      36 |         int ddi_clocks[I915_MAX_PIPES];
         |                        ^~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_pmdemand.h:55:44: error: 'enum pipe' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      55 |                                       enum pipe pipe, int port_clock);
         |                                            ^~~~
   cc1: all warnings being treated as errors


vim +/I915_MAX_PIPES +36 drivers/gpu/drm/i915/display/intel_pmdemand.h

    31	
    32	struct intel_pmdemand_state {
    33		struct intel_global_state base;
    34	
    35		/* Maintain a persistent list of port clocks across all crtcs */
  > 36		int ddi_clocks[I915_MAX_PIPES];
    37	
    38		/* Maintain a persistent list of non type C phys mask */
    39		u16 active_combo_phys_mask;
    40	
    41		/* Parameters to be configured in the pmdemand registers */
    42		struct pmdemand_params params;
    43	};
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
