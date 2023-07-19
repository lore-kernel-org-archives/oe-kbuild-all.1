Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A711BB27
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 23:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689807790; x=1721343790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kmTcgqQuolMYGlCeUWpXioYaB5cnRjkKxB0PS/dQTf4=;
  b=jFFybRwCOCXwUR2rZkscVeveDtjzeOpsLzsNQUDHwxWOYyqwkCN84DFM
   W7KKzda/PqHo/5fdJ4lAG+XH7uilWOGPsV2+/qFMqaeplOwfhuoAheQu6
   hxoGIZ1NW6H33tOcJHusXii7HKXUfmE4VCYuFMlN+TLNI6w0SGC+iDeiA
   2NLJ1t8zWV1fVQcSKJTE8ZJVN20o6KwCUQdJjz3yQZHZburOhPLT97HEV
   HtEpgP7qmWgbecQ1OA5CG2nuSxGt6bpZ2JV/ebJh71YtfCX+t+coYv9qC
   kZDexMskrbqEnNO5EQyRRILTi4DQKoR/6wsHsBLcjOr1vAgLQbUtmQ18w
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="432778524"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="432778524"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 16:03:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="898082872"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="898082872"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Jul 2023 16:03:08 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMGCJ-0005Z7-32;
	Wed, 19 Jul 2023 23:03:07 +0000
Date: Thu, 20 Jul 2023 07:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/638 1039/12469]
 drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:184:10: error: 'const struct
 drm_bridge_funcs' has no member named 'atomic_get_input_bus_fmts'
Message-ID: <202307200742.4QhwY2vM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/638
head:   3f1f2ea7295505de340ba4089817ae1021920928
commit: 80409490d038dd395225e3fdca9f745ef1dbffc7 [1039/12469] LF-5320: drm/bridge: nxp-seiko-43wvfig: fix boot freeze
config: m68k-randconfig-r035-20230720 (https://download.01.org/0day-ci/archive/20230720/202307200742.4QhwY2vM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200742.4QhwY2vM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200742.4QhwY2vM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:31:33: error: field 'bridge' has incomplete type
      31 |         struct drm_bridge       bridge;
         |                                 ^~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:81:46: warning: 'enum drm_bridge_attach_flags' declared inside parameter list will not be visible outside of this definition or declaration
      81 |                                         enum drm_bridge_attach_flags flags)
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:81:70: error: parameter 2 ('flags') has incomplete type
      81 |                                         enum drm_bridge_attach_flags flags)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:80:12: error: function declaration isn't a prototype [-Werror=strict-prototypes]
      80 | static int seiko_adapter_bridge_attach(struct drm_bridge *bridge,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_attach':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:83:44: error: invalid use of undefined type 'struct drm_bridge'
      83 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:85:45: error: invalid use of undefined type 'struct drm_bridge'
      85 |         struct drm_encoder *encoder = bridge->encoder;
         |                                             ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_detach':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:119:44: error: invalid use of undefined type 'struct drm_bridge'
     119 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_enable':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:126:44: error: invalid use of undefined type 'struct drm_bridge'
     126 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_disable':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:142:44: error: invalid use of undefined type 'struct drm_bridge'
     142 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_atomic_get_input_bus_fmts':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:162:44: error: invalid use of undefined type 'struct drm_bridge'
     162 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: At top level:
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:178:21: error: variable 'seiko_adapter_bridge_funcs' has initializer but incomplete type
     178 | static const struct drm_bridge_funcs seiko_adapter_bridge_funcs = {
         |                     ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:179:10: error: 'const struct drm_bridge_funcs' has no member named 'enable'
     179 |         .enable = seiko_adapter_bridge_enable,
         |          ^~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:179:19: warning: excess elements in struct initializer
     179 |         .enable = seiko_adapter_bridge_enable,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:179:19: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:180:10: error: 'const struct drm_bridge_funcs' has no member named 'disable'
     180 |         .disable = seiko_adapter_bridge_disable,
         |          ^~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:180:20: warning: excess elements in struct initializer
     180 |         .disable = seiko_adapter_bridge_disable,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:180:20: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:181:10: error: 'const struct drm_bridge_funcs' has no member named 'attach'
     181 |         .attach = seiko_adapter_bridge_attach,
         |          ^~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:181:19: warning: excess elements in struct initializer
     181 |         .attach = seiko_adapter_bridge_attach,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:181:19: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:182:10: error: 'const struct drm_bridge_funcs' has no member named 'detach'
     182 |         .detach = seiko_adapter_bridge_detach,
         |          ^~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:182:19: warning: excess elements in struct initializer
     182 |         .detach = seiko_adapter_bridge_detach,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:182:19: note: (near initialization for 'seiko_adapter_bridge_funcs')
>> drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:184:10: error: 'const struct drm_bridge_funcs' has no member named 'atomic_get_input_bus_fmts'
     184 |         .atomic_get_input_bus_fmts = seiko_adapter_atomic_get_input_bus_fmts,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:184:38: warning: excess elements in struct initializer
     184 |         .atomic_get_input_bus_fmts = seiko_adapter_atomic_get_input_bus_fmts,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:184:38: note: (near initialization for 'seiko_adapter_bridge_funcs')
>> drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:186:10: error: 'const struct drm_bridge_funcs' has no member named 'atomic_duplicate_state'
     186 |         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
         |          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:186:35: warning: excess elements in struct initializer
     186 |         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:186:35: note: (near initialization for 'seiko_adapter_bridge_funcs')
>> drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:187:10: error: 'const struct drm_bridge_funcs' has no member named 'atomic_destroy_state'
     187 |         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
         |          ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:187:33: warning: excess elements in struct initializer
     187 |         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:187:33: note: (near initialization for 'seiko_adapter_bridge_funcs')
>> drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:188:10: error: 'const struct drm_bridge_funcs' has no member named 'atomic_reset'
     188 |         .atomic_reset = drm_atomic_helper_bridge_reset,
         |          ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:188:25: warning: excess elements in struct initializer
     188 |         .atomic_reset = drm_atomic_helper_bridge_reset,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:188:25: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_probe':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:237:9: error: implicit declaration of function 'drm_bridge_add' [-Werror=implicit-function-declaration]
     237 |         drm_bridge_add(&adap->bridge);
         |         ^~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: At top level:
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:178:38: error: storage size of 'seiko_adapter_bridge_funcs' isn't known
     178 | static const struct drm_bridge_funcs seiko_adapter_bridge_funcs = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +184 drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c

   177	
   178	static const struct drm_bridge_funcs seiko_adapter_bridge_funcs = {
   179		.enable = seiko_adapter_bridge_enable,
   180		.disable = seiko_adapter_bridge_disable,
   181		.attach = seiko_adapter_bridge_attach,
   182		.detach = seiko_adapter_bridge_detach,
   183	
 > 184		.atomic_get_input_bus_fmts = seiko_adapter_atomic_get_input_bus_fmts,
   185	
 > 186		.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 > 187		.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 > 188		.atomic_reset = drm_atomic_helper_bridge_reset,
   189	};
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
