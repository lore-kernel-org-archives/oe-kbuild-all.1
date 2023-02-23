Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54782F2A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 18:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677175875; x=1708711875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XOci6UhsNnVxIz6zy968mVV8a4znuNLGzhQt2FR9m14=;
  b=NymUd5QJSx5SZpryliUSXTkHEb+1aRIb4UmKMNzKzvvjPtKQmvVunqjc
   K7L0TGD48mJ3cY+DBKgIL7tlXl6rqvaOhRAj9PRl9g+DEHwknbWVUB4fk
   6YrY9MdaE0HB/SjJDPo30SbaUMePyiRHurlvbqw82AB5J9+oVKFp6Ok/4
   7V5JWEUGjZKlIA7AdOHaR8rkRNAeHf/zx8GJD4tzrgxEg/tO9kxOrj/FF
   szNH8o+P9gdH6cfZldCmJgmjYkFssikjb+Uihm7GwG3BC/kTe3odzgYOJ
   Vs08bvSvkCDxCEl2382iGymyEsBb5IQSi2RLtvLptHJ+9DE2W3gZAqYFK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="419514628"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="419514628"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 10:11:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="815446846"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="815446846"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2023 10:11:14 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVG3l-0001c1-1j;
	Thu, 23 Feb 2023 18:11:13 +0000
Date: Fri, 24 Feb 2023 02:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/3] drm/amd: Convert amdgpu to use suballocation
 helper.
Message-ID: <202302240233.19d88V2Y-lkp@intel.com>
References: <20230223142531.8446-3-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223142531.8446-3-thomas.hellstrom@linux.intel.com>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-suballoc-Extract-amdgpu_sa-c-as-generic-suballocation-helper/20230223-225547
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230223142531.8446-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v3 2/3] drm/amd: Convert amdgpu to use suballocation helper.
config: m68k-randconfig-r005-20230222 (https://download.01.org/0day-ci/archive/20230224/202302240233.19d88V2Y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/566352490ef7a031bd23f9d6524057fd7b31330c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-suballoc-Extract-amdgpu_sa-c-as-generic-suballocation-helper/20230223-225547
        git checkout 566352490ef7a031bd23f9d6524057fd7b31330c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240233.19d88V2Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/gpu/drm/drm_suballoc.o: in function `drm_suballoc_try_alloc':
>> drivers/gpu/drm/drm_suballoc.c:168: undefined reference to `__umoddi3'
   m68k-linux-ld: drivers/gpu/drm/drm_suballoc.o: in function `__drm_suballoc_event':
   drivers/gpu/drm/drm_suballoc.c:196: undefined reference to `__umoddi3'
   m68k-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_setup_mclk_provider':
   drivers/media/i2c/tc358746.c:1257: undefined reference to `devm_clk_hw_register'
   m68k-linux-ld: drivers/media/i2c/tc358746.c:1263: undefined reference to `of_clk_hw_simple_get'
   m68k-linux-ld: drivers/media/i2c/tc358746.c:1263: undefined reference to `devm_of_clk_add_hw_provider'


vim +168 drivers/gpu/drm/drm_suballoc.c

d550f4b8345a4b Maarten Lankhorst 2023-02-23  159  
d550f4b8345a4b Maarten Lankhorst 2023-02-23  160  static bool drm_suballoc_try_alloc(struct drm_suballoc_manager *sa_manager,
d550f4b8345a4b Maarten Lankhorst 2023-02-23  161  				   struct drm_suballoc *sa,
d550f4b8345a4b Maarten Lankhorst 2023-02-23  162  				   u64 size, u64 align)
d550f4b8345a4b Maarten Lankhorst 2023-02-23  163  {
d550f4b8345a4b Maarten Lankhorst 2023-02-23  164  	u64 soffset, eoffset, wasted;
d550f4b8345a4b Maarten Lankhorst 2023-02-23  165  
d550f4b8345a4b Maarten Lankhorst 2023-02-23  166  	soffset = drm_suballoc_hole_soffset(sa_manager);
d550f4b8345a4b Maarten Lankhorst 2023-02-23  167  	eoffset = drm_suballoc_hole_eoffset(sa_manager);
d550f4b8345a4b Maarten Lankhorst 2023-02-23 @168  	wasted = (align - (soffset % align)) % align;
d550f4b8345a4b Maarten Lankhorst 2023-02-23  169  
d550f4b8345a4b Maarten Lankhorst 2023-02-23  170  	if ((eoffset - soffset) >= (size + wasted)) {
d550f4b8345a4b Maarten Lankhorst 2023-02-23  171  		soffset += wasted;
d550f4b8345a4b Maarten Lankhorst 2023-02-23  172  
d550f4b8345a4b Maarten Lankhorst 2023-02-23  173  		sa->manager = sa_manager;
d550f4b8345a4b Maarten Lankhorst 2023-02-23  174  		sa->soffset = soffset;
d550f4b8345a4b Maarten Lankhorst 2023-02-23  175  		sa->eoffset = soffset + size;
d550f4b8345a4b Maarten Lankhorst 2023-02-23  176  		list_add(&sa->olist, sa_manager->hole);
d550f4b8345a4b Maarten Lankhorst 2023-02-23  177  		INIT_LIST_HEAD(&sa->flist);
d550f4b8345a4b Maarten Lankhorst 2023-02-23  178  		sa_manager->hole = &sa->olist;
d550f4b8345a4b Maarten Lankhorst 2023-02-23  179  		return true;
d550f4b8345a4b Maarten Lankhorst 2023-02-23  180  	}
d550f4b8345a4b Maarten Lankhorst 2023-02-23  181  	return false;
d550f4b8345a4b Maarten Lankhorst 2023-02-23  182  }
d550f4b8345a4b Maarten Lankhorst 2023-02-23  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
