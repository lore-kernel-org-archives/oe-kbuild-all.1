Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330632568
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694367195; x=1725903195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=geGPwINWy2Ys8RdapqdNX9L4Hlw6lAygCnn2Ncb2CEY=;
  b=fa93sJRGT7/N22ud0Jt7VB3EzVU02d0PF+7ZoIdU7yoMPcLL3HvoX9/U
   hmXlCSqlqSuJCxnXef8nbJ6nI0eU9/oLN8z3ok+6nagzOtIFFSZ40s99G
   WdHzVEO8cSilmfdIxOTvW+efJ7yTujDE8kNI/usIEl81Oh7iofn4Npw81
   pKQ0c+R4udvfsbRYy+Nqtb3AkvM+HLQtAGSXJ8/px9bOsLAZ1k/DF9srL
   JUDiiuMBsSXFLLYvrlhcYWANtpofUC4m2a1c31+VL6hrh3pMU6TxgMBDP
   8ifMV1+RSfDocotK0GgD0U/BdQYUr40bU0sMPx6DppSZ5pfaV4fD4oq35
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="381732783"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="381732783"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 10:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="743072913"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="743072913"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Sep 2023 10:33:13 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfOJ4-0005E0-3C;
	Sun, 10 Sep 2023 17:33:11 +0000
Date: Mon, 11 Sep 2023 01:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 7532/25020]
 drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:183:10: error: 'const struct
 drm_bridge_funcs' has no member named 'atomic_get_input_bus_fmts'
Message-ID: <202309110133.n48qorVL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurentiu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: 382a2c19e952cfab61353bdc44fa6f0b790613d3 [7532/25020] LF-5320: drm/bridge: nxp-seiko-43wvfig: fix boot freeze
config: x86_64-randconfig-r022-20230910 (https://download.01.org/0day-ci/archive/20230911/202309110133.n48qorVL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110133.n48qorVL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110133.n48qorVL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:30:33: error: field 'bridge' has incomplete type
      30 |         struct drm_bridge       bridge;
         |                                 ^~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:80:46: warning: 'enum drm_bridge_attach_flags' declared inside parameter list will not be visible outside of this definition or declaration
      80 |                                         enum drm_bridge_attach_flags flags)
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:80:70: error: parameter 2 ('flags') has incomplete type
      80 |                                         enum drm_bridge_attach_flags flags)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:79:12: error: function declaration isn't a prototype [-Werror=strict-prototypes]
      79 | static int seiko_adapter_bridge_attach(struct drm_bridge *bridge,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_attach':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:82:44: error: invalid use of undefined type 'struct drm_bridge'
      82 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:84:45: error: invalid use of undefined type 'struct drm_bridge'
      84 |         struct drm_encoder *encoder = bridge->encoder;
         |                                             ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_detach':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:118:44: error: invalid use of undefined type 'struct drm_bridge'
     118 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_enable':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:125:44: error: invalid use of undefined type 'struct drm_bridge'
     125 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_disable':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:141:44: error: invalid use of undefined type 'struct drm_bridge'
     141 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_atomic_get_input_bus_fmts':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:161:44: error: invalid use of undefined type 'struct drm_bridge'
     161 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: At top level:
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:177:21: error: variable 'seiko_adapter_bridge_funcs' has initializer but incomplete type
     177 | static const struct drm_bridge_funcs seiko_adapter_bridge_funcs = {
         |                     ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:178:10: error: 'const struct drm_bridge_funcs' has no member named 'enable'
     178 |         .enable = seiko_adapter_bridge_enable,
         |          ^~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:178:19: warning: excess elements in struct initializer
     178 |         .enable = seiko_adapter_bridge_enable,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:178:19: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:179:10: error: 'const struct drm_bridge_funcs' has no member named 'disable'
     179 |         .disable = seiko_adapter_bridge_disable,
         |          ^~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:179:20: warning: excess elements in struct initializer
     179 |         .disable = seiko_adapter_bridge_disable,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:179:20: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:180:10: error: 'const struct drm_bridge_funcs' has no member named 'attach'
     180 |         .attach = seiko_adapter_bridge_attach,
         |          ^~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:180:19: warning: excess elements in struct initializer
     180 |         .attach = seiko_adapter_bridge_attach,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:180:19: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:181:10: error: 'const struct drm_bridge_funcs' has no member named 'detach'
     181 |         .detach = seiko_adapter_bridge_detach,
         |          ^~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:181:19: warning: excess elements in struct initializer
     181 |         .detach = seiko_adapter_bridge_detach,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:181:19: note: (near initialization for 'seiko_adapter_bridge_funcs')
>> drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:183:10: error: 'const struct drm_bridge_funcs' has no member named 'atomic_get_input_bus_fmts'
     183 |         .atomic_get_input_bus_fmts = seiko_adapter_atomic_get_input_bus_fmts,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:183:38: warning: excess elements in struct initializer
     183 |         .atomic_get_input_bus_fmts = seiko_adapter_atomic_get_input_bus_fmts,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:183:38: note: (near initialization for 'seiko_adapter_bridge_funcs')
>> drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:185:10: error: 'const struct drm_bridge_funcs' has no member named 'atomic_duplicate_state'
     185 |         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
         |          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:185:35: warning: excess elements in struct initializer
     185 |         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:185:35: note: (near initialization for 'seiko_adapter_bridge_funcs')
>> drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:186:10: error: 'const struct drm_bridge_funcs' has no member named 'atomic_destroy_state'
     186 |         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
         |          ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:186:33: warning: excess elements in struct initializer
     186 |         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:186:33: note: (near initialization for 'seiko_adapter_bridge_funcs')
>> drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:187:10: error: 'const struct drm_bridge_funcs' has no member named 'atomic_reset'
     187 |         .atomic_reset = drm_atomic_helper_bridge_reset,
         |          ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:187:25: warning: excess elements in struct initializer
     187 |         .atomic_reset = drm_atomic_helper_bridge_reset,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:187:25: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_probe':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:236:9: error: implicit declaration of function 'drm_bridge_add' [-Werror=implicit-function-declaration]
     236 |         drm_bridge_add(&adap->bridge);
         |         ^~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: At top level:
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:177:38: error: storage size of 'seiko_adapter_bridge_funcs' isn't known
     177 | static const struct drm_bridge_funcs seiko_adapter_bridge_funcs = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:19:
   include/drm/drm_of.h:78:12: warning: 'drm_of_component_probe_with_match' defined but not used [-Wunused-function]
      78 | static int drm_of_component_probe_with_match(struct device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +183 drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c

   176	
   177	static const struct drm_bridge_funcs seiko_adapter_bridge_funcs = {
   178		.enable = seiko_adapter_bridge_enable,
   179		.disable = seiko_adapter_bridge_disable,
 > 180		.attach = seiko_adapter_bridge_attach,
 > 181		.detach = seiko_adapter_bridge_detach,
   182	
 > 183		.atomic_get_input_bus_fmts = seiko_adapter_atomic_get_input_bus_fmts,
   184	
 > 185		.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 > 186		.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 > 187		.atomic_reset = drm_atomic_helper_bridge_reset,
   188	};
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
