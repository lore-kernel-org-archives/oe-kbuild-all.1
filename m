Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09641D2FD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 19:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690313177; x=1721849177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tyy253SRnN3wJuOeOEL5gUWU1Rharp/64Y+1bcfXmQ4=;
  b=kMnncPoKEzBoAMCrYwQYgmkirtdn4otvqmaisJmOFhwHNmsEVszA6bQm
   hg/kpj5PwgxKCp81WIvVENNhI0nM97X8bK7wG5Eb/O3owfTHJWHe7T1Wh
   6Is3VKnxAa2cUGcGc0Nc1fSDJAUa06FYj7KWPgdhAepsL1eJWfZCpXz6b
   U0obsp5dUiYm+C71hJiuxxPc915lK8hLXmcHGozWTeq4nlfDtvtF6yYS5
   HZ1DP9DjoHkPODZyvYplxU/mw7YJwCCk1WVM+3BJY+QROECfHoA57k8yn
   64/eTy35ChQMyX0Kwm8Fw57UuFLbuybuBAMBbgYQzznJfU2UoQePG7t8I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="365287462"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="365287462"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 12:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="816367698"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="816367698"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2023 12:26:13 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qONfg-0000Hh-1R;
	Tue, 25 Jul 2023 19:26:12 +0000
Date: Wed, 26 Jul 2023 03:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH dii-client 1/2] drm/i915: Make
 i915_coherent_map_type GT-centric
Message-ID: <202307260357.c9AxPrQR-lkp@intel.com>
References: <20230725160145.1486613-1-jonathan.cavitt@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725160145.1486613-1-jonathan.cavitt@intel.com>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-i915-gt-Apply-workaround-22016122933-correctly/20230726-001113
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230725160145.1486613-1-jonathan.cavitt%40intel.com
patch subject: [Intel-gfx] [PATCH dii-client 1/2] drm/i915: Make i915_coherent_map_type GT-centric
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230726/202307260357.c9AxPrQR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260357.c9AxPrQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260357.c9AxPrQR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c: In function 'gsccs_create_buffer':
>> drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:339:54: error: implicit declaration of function 'intel_gt_coherent_map_type' [-Werror=implicit-function-declaration]
     339 |         *map = i915_gem_object_pin_map_unlocked(obj, intel_gt_coherent_map_type(gt, obj, true));
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/intel_gt_coherent_map_type +339 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c

   314	
   315	static int
   316	gsccs_create_buffer(struct intel_gt *gt,
   317			    const char *bufname, size_t size,
   318			    struct i915_vma **vma, void **map)
   319	{
   320		struct drm_i915_private *i915 = gt->i915;
   321		struct drm_i915_gem_object *obj;
   322		int err = 0;
   323	
   324		obj = i915_gem_object_create_internal(i915, size);
   325		if (IS_ERR(obj)) {
   326			drm_err(&i915->drm, "Failed to allocate gsccs backend %s.\n", bufname);
   327			err = PTR_ERR(obj);
   328			goto out_none;
   329		}
   330	
   331		*vma = i915_vma_instance(obj, gt->vm, NULL);
   332		if (IS_ERR(*vma)) {
   333			drm_err(&i915->drm, "Failed to vma-instance gsccs backend %s.\n", bufname);
   334			err = PTR_ERR(*vma);
   335			goto out_put;
   336		}
   337	
   338		/* return a virtual pointer */
 > 339		*map = i915_gem_object_pin_map_unlocked(obj, intel_gt_coherent_map_type(gt, obj, true));
   340		if (IS_ERR(*map)) {
   341			drm_err(&i915->drm, "Failed to map gsccs backend %s.\n", bufname);
   342			err = PTR_ERR(*map);
   343			goto out_put;
   344		}
   345	
   346		/* all PXP sessions commands are treated as non-privileged */
   347		err = i915_vma_pin(*vma, 0, 0, PIN_USER);
   348		if (err) {
   349			drm_err(&i915->drm, "Failed to vma-pin gsccs backend %s.\n", bufname);
   350			goto out_unmap;
   351		}
   352	
   353		return 0;
   354	
   355	out_unmap:
   356		i915_gem_object_unpin_map(obj);
   357	out_put:
   358		i915_gem_object_put(obj);
   359	out_none:
   360		*vma = NULL;
   361		*map = NULL;
   362	
   363		return err;
   364	}
   365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
