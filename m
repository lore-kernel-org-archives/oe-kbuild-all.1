Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14563A49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 02:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695178181; x=1726714181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DcfqcUAU+jyXcEgC2vsTr+BQj+upkVP5oRZD5u2uQ7g=;
  b=DwQjaSEP7AiVFoH6b6bul+XEj0jMw7n14oPqYP6sa7NSJM1CKMTWzIl9
   HuOkUML+EDLsMqauE77Nzv3GwDojeWtDmw5b/rKK4r81yxcOlUeUjCxlb
   NbImg/h7+dsnMK0T1+5QDxJ2uhd8ZTQMJqtgNCW7HmxQYvycCb6VQsGdj
   qaBrl/wDaMOmsDR5rRF+GCNe26G/DEeRa158IhxiJC+GurBLDoq10igQX
   Mzs+wzUWwBcdiKbZKN6B5uxBCpreBJM92mnDvireWhZ8p0qs1ZOmk7U04
   +hp6YrJyAXakhFkDfq9mXRz5YjZKVp+00P3jjYgpjykK6mdPIgTPfI1Ay
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="360363171"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="360363171"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 19:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781529807"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="781529807"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Sep 2023 19:49:38 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qinHU-0008C2-23;
	Wed, 20 Sep 2023 02:49:36 +0000
Date: Wed, 20 Sep 2023 10:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] media: i2c: Add driver for onsemi MT9M114 camera
 sensor
Message-ID: <202309201018.WK1TBQe9-lkp@intel.com>
References: <20230919232636.19755-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919232636.19755-3-laurent.pinchart@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0bb80ecc33a8fb5a682236443c1e740d5c917d1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-dt-bindings-media-i2c-Add-MT9M114-camera-sensor-binding/20230920-072719
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20230919232636.19755-3-laurent.pinchart%40ideasonboard.com
patch subject: [PATCH v3 2/2] media: i2c: Add driver for onsemi MT9M114 camera sensor
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309201018.WK1TBQe9-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201018.WK1TBQe9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201018.WK1TBQe9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/media/i2c/mt9m114.c:12:
   drivers/media/i2c/mt9m114.c: In function 'mt9m114_ifp_init_cfg':
>> arch/sparc/include/asm/string.h:18:29: warning: '__builtin_memset' offset [0, 27] is out of the bounds [0, 0] [-Warray-bounds=]
      18 | #define memset(s, c, count) __builtin_memset(s, c, count)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/mt9m114.c:1635:9: note: in expansion of macro 'memset'
    1635 |         memset(format, 0, sizeof(*format));
         |         ^~~~~~


vim +/__builtin_memset +18 arch/sparc/include/asm/string.h

70a6fcf3283a0a Al Viro 2016-01-17  16  
70a6fcf3283a0a Al Viro 2016-01-17  17  #define __HAVE_ARCH_MEMSET
70a6fcf3283a0a Al Viro 2016-01-17 @18  #define memset(s, c, count) __builtin_memset(s, c, count)
70a6fcf3283a0a Al Viro 2016-01-17  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
