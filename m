Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6BD817
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 04:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXuKczsD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697861689; x=1729397689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QAeNQiVTZQsFEUlE9Zj9jq2+a1kUDkeF+tGuMpSqlXU=;
  b=aXuKczsDIUyjouD41sUz/fIvK98NYksdac0Bo1s7YnqsKHg+w2eARYdC
   KfSmTcAEoZAeTDyEyYJ+VTsZNd6tVPcRpG05xyX6I9sIKgsXR5F1Ql4HP
   bOJgo1jNYGpeL7i0beKR033mpyxXNrPqdyY7/96skIU6iHbCq8n/XGu8D
   2mvSboJMpg8pBIRtRUrZW4oU1uRgVeN/y9FFYi0yAol5Y67fwhRjcJq61
   pISzkJ6mXXe3lwWh4dwhm70bGtMviG0RzC44puZH/akLIOBMXyMUfxj+U
   XtdzSjypdU69VbTgcymL2vz6vozig7ZAP9L/iV6JG6vymGFtYNm7Cks1C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="385499902"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="385499902"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 21:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="823453370"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="823453370"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Oct 2023 21:14:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu3Nt-0004Os-27;
	Sat, 21 Oct 2023 04:14:45 +0000
Date: Sat, 21 Oct 2023 12:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 07/17] drm/colorop: Introduce new drm_colorop mode
 object
Message-ID: <202310211231.WlOSaCad-lkp@intel.com>
References: <20231019212133.245155-8-harry.wentland@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019212133.245155-8-harry.wentland@amd.com>

Hi Harry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-atomic-Allow-get_value-for-immutable-properties-on-atomic-drivers/20231020-052542
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231019212133.245155-8-harry.wentland%40amd.com
patch subject: [RFC PATCH v2 07/17] drm/colorop: Introduce new drm_colorop mode object
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231021/202310211231.WlOSaCad-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211231.WlOSaCad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211231.WlOSaCad-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_colorop.c:59:6: warning: no previous prototype for '__drm_atomic_helper_colorop_duplicate_state' [-Wmissing-prototypes]
      59 | void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_colorop.c:95:6: warning: no previous prototype for '__drm_colorop_destroy_state' [-Wmissing-prototypes]
      95 | void __drm_colorop_destroy_state(struct drm_colorop_state *state)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_colorop.c:108:6: warning: no previous prototype for 'drm_colorop_destroy_state' [-Wmissing-prototypes]
     108 | void drm_colorop_destroy_state(struct drm_colorop *colorop,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_colorop.c:123:6: warning: no previous prototype for '__drm_colorop_state_reset' [-Wmissing-prototypes]
     123 | void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_colorop.c:142:6: warning: no previous prototype for '__drm_colorop_reset' [-Wmissing-prototypes]
     142 | void __drm_colorop_reset(struct drm_colorop *colorop,
         |      ^~~~~~~~~~~~~~~~~~~


vim +/__drm_atomic_helper_colorop_duplicate_state +59 drivers/gpu/drm/drm_colorop.c

    58	
  > 59	void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
    60							 struct drm_colorop_state *state)
    61	{
    62		memcpy(state, colorop->state, sizeof(*state));
    63	}
    64	
    65	struct drm_colorop_state *
    66	drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop)
    67	{
    68		struct drm_colorop_state *state;
    69	
    70		if (WARN_ON(!colorop->state))
    71			return NULL;
    72	
    73		state = kmalloc(sizeof(*state), GFP_KERNEL);
    74		if (state)
    75			__drm_atomic_helper_colorop_duplicate_state(colorop, state);
    76	
    77		return state;
    78	}
    79	
    80	
    81	void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
    82					      struct drm_colorop_state *state)
    83	{
    84		kfree(state);
    85	}
    86	
    87	/**
    88	 * __drm_colorop_destroy_state - release colorop state
    89	 * @state: colorop state object to release
    90	 *
    91	 * Releases all resources stored in the colorop state without actually freeing
    92	 * the memory of the colorop state. This is useful for drivers that subclass the
    93	 * colorop state.
    94	 */
  > 95	void __drm_colorop_destroy_state(struct drm_colorop_state *state)
    96	{
    97		/* TODO might need this later */
    98	}
    99	
   100	/**
   101	 * drm_colorop_destroy_state - default state destroy hook
   102	 * @colorop: drm colorop
   103	 * @state: colorop state object to release
   104	 *
   105	 * Default colorop state destroy hook for drivers which don't have their own
   106	 * subclassed colorop state structure.
   107	 */
 > 108	void drm_colorop_destroy_state(struct drm_colorop *colorop,
   109						   struct drm_colorop_state *state)
   110	{
   111		kfree(state);
   112	}
   113	EXPORT_SYMBOL(drm_colorop_destroy_state);
   114	
   115	/**
   116	 * __drm_colorop_state_reset - resets colorop state to default values
   117	 * @colorop_state: atomic colorop state, must not be NULL
   118	 * @colorop: colorop object, must not be NULL
   119	 *
   120	 * Initializes the newly allocated @colorop_state with default
   121	 * values. This is useful for drivers that subclass the CRTC state.
   122	 */
 > 123	void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
   124						   struct drm_colorop *colorop)
   125	{
   126		colorop_state->colorop = colorop;
   127	}
   128	EXPORT_SYMBOL(__drm_colorop_state_reset);
   129	
   130	/**
   131	 * __drm_colorop_reset - reset state on colorop
   132	 * @colorop: drm colorop
   133	 * @colorop_state: colorop state to assign
   134	 *
   135	 * Initializes the newly allocated @colorop_state and assigns it to
   136	 * the &drm_crtc->state pointer of @colorop, usually required when
   137	 * initializing the drivers or when called from the &drm_colorop_funcs.reset
   138	 * hook.
   139	 *
   140	 * This is useful for drivers that subclass the colorop state.
   141	 */
 > 142	void __drm_colorop_reset(struct drm_colorop *colorop,
   143					     struct drm_colorop_state *colorop_state)
   144	{
   145		if (colorop_state)
   146			__drm_colorop_state_reset(colorop_state, colorop);
   147	
   148		colorop->state = colorop_state;
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
