Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81C72597
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 08:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683880428; x=1715416428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zd3MKXuQS5MxA15kWVdbKYAMPwNv7AYfI6WDzwLp78Y=;
  b=kaTP4YG/oL6P6hcjdMn1M8C8pX5IEce5dp42dWn7+PxM98SLYwSRFtPf
   y2GeGnPQBtRBWAN091fJm59n83osS6NTt5I1d/oxRxeD6Yyl8s05mQSMC
   z6NQYcSrcuCGjl3OGAKjtfj5VuflGzxTQ8hF8l0CKgwNCoSVeRmlpKNej
   RGjNuMeCyoWJwINlhg4HWZRhQNUv3dCVrw7a/+elrAhu3CRSD+tTz8tTf
   EGk5oIg6rprv53VA1zin49RfSAWCpRQFnECyvwXf5CRYlJhYGstzmqu+c
   Day2+9obDFYtuHb5t6riLj/u5QfTyivb5n4DIg6JXifEDA2jh4QraQzJN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350763131"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="350763131"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 01:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="844339974"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="844339974"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 May 2023 01:33:43 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxODe-0004i0-2O;
	Fri, 12 May 2023 08:33:42 +0000
Date: Fri, 12 May 2023 16:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Add workaround 14016712196
Message-ID: <202305121641.r0X84703-lkp@intel.com>
References: <20230512052744.778113-1-tejas.upadhyay@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512052744.778113-1-tejas.upadhyay@intel.com>

Hi Tejas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Tejas-Upadhyay/drm-i915-gt-Add-workaround-14016712196/20230512-132314
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230512052744.778113-1-tejas.upadhyay%40intel.com
patch subject: [Intel-gfx] [PATCH] drm/i915/gt: Add workaround 14016712196
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230512/202305121641.r0X84703-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/429038a73fb0b1cbcfa5b41e17d70e48d835d347
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tejas-Upadhyay/drm-i915-gt-Add-workaround-14016712196/20230512-132314
        git checkout 429038a73fb0b1cbcfa5b41e17d70e48d835d347
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121641.r0X84703-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/gen8_engine_cs.c:180:5: error: no previous prototype for 'mtl_dummy_pipe_control' [-Werror=missing-prototypes]
     180 | int mtl_dummy_pipe_control(struct i915_request *rq, u32 *cs)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/mtl_dummy_pipe_control +180 drivers/gpu/drm/i915/gt/gen8_engine_cs.c

   179	
 > 180	int mtl_dummy_pipe_control(struct i915_request *rq, u32 *cs)
   181	{
   182		struct intel_engine_cs *engine = rq->engine;
   183	
   184		if (IS_MTL_GRAPHICS_STEP(engine->i915, M, STEP_A0, STEP_B0) ||
   185		    IS_MTL_GRAPHICS_STEP(engine->i915, P, STEP_A0, STEP_B0)) {
   186			/* dummy PIPE_CONTROL + depth flush */
   187			cs = intel_ring_begin(rq, 6);
   188			if (IS_ERR(cs))
   189				return PTR_ERR(cs);
   190			cs = gen12_emit_pipe_control(cs,
   191						     0,
   192						     PIPE_CONTROL_DEPTH_CACHE_FLUSH,
   193						     LRC_PPHWSP_SCRATCH_ADDR);
   194			intel_ring_advance(rq, cs);
   195		}
   196	
   197		return 0;
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
