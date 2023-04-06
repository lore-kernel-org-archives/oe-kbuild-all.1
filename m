Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957E5D524
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 20:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680813379; x=1712349379;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dy78pIx6uBQ+eEzkYzLPhc9NJw9K69rD4ctYjhEJADM=;
  b=OtqQC42EtIdcNSEf94RzTw+hjy0M5UXp/mFhbbjEnTwBJZ2w9bSOynIT
   CQfJMORgvYNN6huJY0xGL0q/evGrG4NBl7zh5SfraP4Owx348MZgNyh6T
   obLjFgFy2r4AoBPVpTw28aJE77EtgsigFBte2qN6Ogdrnh12+K93l9P9/
   fwDGyZgbNkvbpjDGBeJnf8FIeLjBwrmIaHgW6q3jAqhYZWj540VtM9jUo
   e/D/nzbxB95P1jvuIK3XXdvDa5RMD1tQ3v+y0tWpxQYPWjBLdK8QSAahf
   cPQfhM27AMS1kUrfeEDkz5ClL7GztMON6AZg2OHZXDFYmTPxJ0gEquM4W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326907149"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="326907149"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 13:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664630707"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="664630707"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2023 13:36:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkWL4-000RkU-1Z;
	Thu, 06 Apr 2023 20:36:10 +0000
Date: Fri, 7 Apr 2023 04:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 7/7] drivers/gpu/drm/i915/gt/intel_engine_user.c:99:9:
 warning: 'MAP' macro redefined
Message-ID: <202304070401.ZNOI8RFv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/jimc/linux.git maph
head:   9c0824a037ac394909bf05dddcace5fd127384bc
commit: 9c0824a037ac394909bf05dddcace5fd127384bc [7/7] map.h: include it from dynamic_debug.h, get fallout from robots
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230407/202304070401.ZNOI8RFv-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/9c0824a037ac394909bf05dddcace5fd127384bc
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout 9c0824a037ac394909bf05dddcace5fd127384bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070401.ZNOI8RFv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_engine_user.c:99:9: warning: 'MAP' macro redefined [-Wmacro-redefined]
   #define MAP(x, y) { ilog2(I915_ENGINE_##x), ilog2(I915_SCHEDULER_CAP_##y) }
           ^
   include/linux/map.h:46:9: note: previous definition is here
   #define MAP(f, ...) EVAL(MAP1(f, __VA_ARGS__, ()()(), ()()(), ()()(), 0))
           ^
   1 warning generated.


vim +/MAP +99 drivers/gpu/drm/i915/gt/intel_engine_user.c

750e76b4f9f63c Chris Wilson     2019-08-06   92  
750e76b4f9f63c Chris Wilson     2019-08-06   93  static void set_scheduler_caps(struct drm_i915_private *i915)
750e76b4f9f63c Chris Wilson     2019-08-06   94  {
750e76b4f9f63c Chris Wilson     2019-08-06   95  	static const struct {
750e76b4f9f63c Chris Wilson     2019-08-06   96  		u8 engine;
750e76b4f9f63c Chris Wilson     2019-08-06   97  		u8 sched;
750e76b4f9f63c Chris Wilson     2019-08-06   98  	} map[] = {
750e76b4f9f63c Chris Wilson     2019-08-06  @99  #define MAP(x, y) { ilog2(I915_ENGINE_##x), ilog2(I915_SCHEDULER_CAP_##y) }
750e76b4f9f63c Chris Wilson     2019-08-06  100  		MAP(HAS_PREEMPTION, PREEMPTION),
750e76b4f9f63c Chris Wilson     2019-08-06  101  		MAP(HAS_SEMAPHORES, SEMAPHORES),
750e76b4f9f63c Chris Wilson     2019-08-06  102  		MAP(SUPPORTS_STATS, ENGINE_BUSY_STATS),
750e76b4f9f63c Chris Wilson     2019-08-06  103  #undef MAP
750e76b4f9f63c Chris Wilson     2019-08-06  104  	};
750e76b4f9f63c Chris Wilson     2019-08-06  105  	struct intel_engine_cs *engine;
750e76b4f9f63c Chris Wilson     2019-08-06  106  	u32 enabled, disabled;
750e76b4f9f63c Chris Wilson     2019-08-06  107  
750e76b4f9f63c Chris Wilson     2019-08-06  108  	enabled = 0;
750e76b4f9f63c Chris Wilson     2019-08-06  109  	disabled = 0;
750e76b4f9f63c Chris Wilson     2019-08-06  110  	for_each_uabi_engine(engine, i915) { /* all engines must agree! */
750e76b4f9f63c Chris Wilson     2019-08-06  111  		int i;
750e76b4f9f63c Chris Wilson     2019-08-06  112  
3f623e06cd5657 Matthew Brost    2021-06-17  113  		if (engine->sched_engine->schedule)
750e76b4f9f63c Chris Wilson     2019-08-06  114  			enabled |= (I915_SCHEDULER_CAP_ENABLED |
750e76b4f9f63c Chris Wilson     2019-08-06  115  				    I915_SCHEDULER_CAP_PRIORITY);
750e76b4f9f63c Chris Wilson     2019-08-06  116  		else
750e76b4f9f63c Chris Wilson     2019-08-06  117  			disabled |= (I915_SCHEDULER_CAP_ENABLED |
750e76b4f9f63c Chris Wilson     2019-08-06  118  				     I915_SCHEDULER_CAP_PRIORITY);
750e76b4f9f63c Chris Wilson     2019-08-06  119  
c14adcbd1a9648 Michał Winiarski 2021-12-14  120  		if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
ee242ca704d386 Matthew Brost    2021-07-26  121  			enabled |= I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP;
ee242ca704d386 Matthew Brost    2021-07-26  122  
750e76b4f9f63c Chris Wilson     2019-08-06  123  		for (i = 0; i < ARRAY_SIZE(map); i++) {
750e76b4f9f63c Chris Wilson     2019-08-06  124  			if (engine->flags & BIT(map[i].engine))
750e76b4f9f63c Chris Wilson     2019-08-06  125  				enabled |= BIT(map[i].sched);
750e76b4f9f63c Chris Wilson     2019-08-06  126  			else
750e76b4f9f63c Chris Wilson     2019-08-06  127  				disabled |= BIT(map[i].sched);
750e76b4f9f63c Chris Wilson     2019-08-06  128  		}
750e76b4f9f63c Chris Wilson     2019-08-06  129  	}
750e76b4f9f63c Chris Wilson     2019-08-06  130  
750e76b4f9f63c Chris Wilson     2019-08-06  131  	i915->caps.scheduler = enabled & ~disabled;
750e76b4f9f63c Chris Wilson     2019-08-06  132  	if (!(i915->caps.scheduler & I915_SCHEDULER_CAP_ENABLED))
750e76b4f9f63c Chris Wilson     2019-08-06  133  		i915->caps.scheduler = 0;
750e76b4f9f63c Chris Wilson     2019-08-06  134  }
750e76b4f9f63c Chris Wilson     2019-08-06  135  

:::::: The code at line 99 was first introduced by commit
:::::: 750e76b4f9f63c95bf4c283ccf8e2af0e258d3bb drm/i915/gt: Move the [class][inst] lookup for engines onto the GT

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
