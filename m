Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1CC101F2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 17:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688406924; x=1719942924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izlcICAw9i9UdkpdtDSdYt43RB79bUY9LKBj0ojfkKI=;
  b=h3ZzIESIwdyySiWthUcxwUSuzuprypbQVty5O+CJKSpwkLJLH/bm7RDX
   a2+TZ5aniWL/dAsluFUJ5ciXFnLwUoMIk+ZE71NucP0LIZBc06OEl9ekn
   IWfmmXALhZKkyb5IhcEbtcEBm48WBFXy75rZTcUiBst7bqa/KxPaYEgI8
   Y6+tgG+woXrg7p+YeXbdrIveHDaq02J38z8nyODvSrkRRm4rE4OIwxck3
   6tLNpv3OYVZuYSuf+DaSule3CS6V1xEWTfCkfDZAvqKOPtGZ64+jWhzwX
   l3tntI8pKLl2PAL7ILrmuVINj9S7qCMfxWIGV8X0P7qbn5Uik+V9MqhMK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343270557"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="343270557"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 10:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="668822444"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="668822444"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Jul 2023 10:55:19 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGNld-000HYN-35;
	Mon, 03 Jul 2023 17:55:17 +0000
Date: Tue, 4 Jul 2023 01:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 26/26]
 drivers/gpu/drm/i915/display/intel_pmdemand.h:36:17: error: use of
 undeclared identifier 'I915_MAX_PIPES'
Message-ID: <202307040134.DUlTsahS-lkp@intel.com>
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
config: x86_64-randconfig-x006-20230703 (https://download.01.org/0day-ci/archive/20230704/202307040134.DUlTsahS-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040134.DUlTsahS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040134.DUlTsahS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
>> drivers/gpu/drm/i915/display/intel_pmdemand.h:36:17: error: use of undeclared identifier 'I915_MAX_PIPES'
           int ddi_clocks[I915_MAX_PIPES];
                          ^
>> drivers/gpu/drm/i915/display/intel_pmdemand.h:55:16: error: declaration of 'enum pipe' will not be visible outside of this function [-Werror,-Wvisibility]
                                         enum pipe pipe, int port_clock);
                                              ^
   2 errors generated.


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
    45	#define to_intel_pmdemand_state(x) container_of((x), \
    46							struct intel_pmdemand_state, \
    47							base)
    48	
    49	void intel_pmdemand_init_early(struct drm_i915_private *i915);
    50	int intel_pmdemand_init(struct drm_i915_private *i915);
    51	void intel_pmdemand_init_pmdemand_params(struct drm_i915_private *i915,
    52						 struct intel_pmdemand_state *pmdemand_state);
    53	void intel_pmdemand_update_port_clock(struct drm_i915_private *i915,
    54					      struct intel_pmdemand_state *pmdemand_state,
  > 55					      enum pipe pipe, int port_clock);
    56	void intel_pmdemand_update_phys_mask(struct drm_i915_private *i915,
    57					     struct intel_encoder *encoder,
    58					     struct intel_pmdemand_state *pmdemand_state,
    59					     bool clear_bit);
    60	void intel_pmdemand_program_dbuf(struct drm_i915_private *i915,
    61					 u8 dbuf_slices);
    62	void intel_pmdemand_pre_plane_update(struct intel_atomic_state *state);
    63	void intel_pmdemand_post_plane_update(struct intel_atomic_state *state);
    64	int intel_pmdemand_atomic_check(struct intel_atomic_state *state);
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
