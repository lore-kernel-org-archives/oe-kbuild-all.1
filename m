Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73876D2F7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 20:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680813995; x=1712349995;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JkhwAkWaoNw5nijAAhhTxxf8sbcXXQAuNNpi92cu6bg=;
  b=CEPLJCtM0Ujup3JHrLyLygp8iczgbi69c/+9iYfK16Bt3SVhqPCRUtto
   QWrKrJJxDiqmh/P+TuSW5uo6fWO7saBTGcSUxIph1sM4WNMjbZdZCN4g/
   +YvO0wTLEL8ZXjhgasLYcPcglKCtF6e8Z8FY3kMs1KYbCCFDgfJ9QVbfP
   DFkaJdspd8o2oV4U3sO1fN1U1z/HSIjQdVTMDtIssOJqsjP2YLyU3Ch5I
   Su4bJ2BWpOeu9DPNJSK440/3zraYIIxJqxXz963HE0GbYCZRU9xmo8WcI
   pAg5EjlfEZqNg/ZV5j2JF7PLyqGUk2jkngdCCPjPx6SeVn1pRT/GrGmjh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370674192"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="370674192"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 13:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="719832227"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="719832227"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 13:46:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkWUk-000RlC-2V;
	Thu, 06 Apr 2023 20:46:10 +0000
Date: Fri, 7 Apr 2023 04:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 7/7] drivers/gpu/drm/i915/gt/intel_engine_user.c:99:
 warning: "MAP" redefined
Message-ID: <202304070447.CKOPBg1U-lkp@intel.com>
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
config: i386-randconfig-r015-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070447.CKOPBg1U-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/jimc/linux/commit/9c0824a037ac394909bf05dddcace5fd127384bc
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout 9c0824a037ac394909bf05dddcace5fd127384bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070447.CKOPBg1U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/intel_engine_user.c: In function 'set_scheduler_caps':
>> drivers/gpu/drm/i915/gt/intel_engine_user.c:99: warning: "MAP" redefined
      99 | #define MAP(x, y) { ilog2(I915_ENGINE_##x), ilog2(I915_SCHEDULER_CAP_##y) }
         | 
   In file included from include/linux/dynamic_debug.h:10,
                    from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/plist.h:80,
                    from include/linux/pm_qos.h:15,
                    from drivers/gpu/drm/i915/i915_drv.h:35,
                    from drivers/gpu/drm/i915/gt/intel_engine_user.c:10:
   include/linux/map.h:46: note: this is the location of the previous definition
      46 | #define MAP(f, ...) EVAL(MAP1(f, __VA_ARGS__, ()()(), ()()(), ()()(), 0))
         | 


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
