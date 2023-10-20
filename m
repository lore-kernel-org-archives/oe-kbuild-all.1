Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DFB369
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 00:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaRvDi/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697760998; x=1729296998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PiOWWAb+9+MPFfy9VOXpdVcn2EbEZJK/SuN5C8CalgE=;
  b=TaRvDi/LN1z33szSMBBoAXJSURRNChPAcgT3WHsseC0NyRpiMY2IoOrn
   swtrsgmDww+HS5lqM3hE6RVX7YaY7RyjHl/OAcG1bel32vUIaOIHOabio
   g8SIbU3uKl9aFpESv+/59H528Tp+2zOkFygcAMwFPcXa1vK84K1g5FJNZ
   FDiHV68vOcfJH3s7/Dw1jv+9oEcMtdhym9Jb1JlguHY9R5UcXbeT1UFZC
   sKNjvf+pP94I5qSini4kEmEMSs8gTdoXqgESHzLwg6Nkj6/ufS16TpoKt
   L3kbjB+D3sYfAFmFfO/kw7lsuB3/3hrxU3j9GMKA0VP7vkxEZ1XCR/6Tf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="389260741"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="389260741"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 17:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="847897224"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="847897224"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2023 17:16:36 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtdBq-0002le-23;
	Fri, 20 Oct 2023 00:16:34 +0000
Date: Fri, 20 Oct 2023 08:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 14/17] drm/plane: Add COLOR PIPELINE property
Message-ID: <202310200805.Auf2m41s-lkp@intel.com>
References: <20231019212133.245155-15-harry.wentland@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019212133.245155-15-harry.wentland@amd.com>

Hi Harry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.6-rc6 next-20231019]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-atomic-Allow-get_value-for-immutable-properties-on-atomic-drivers/20231020-052542
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231019212133.245155-15-harry.wentland%40amd.com
patch subject: [RFC PATCH v2 14/17] drm/plane: Add COLOR PIPELINE property
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310200805.Auf2m41s-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200805.Auf2m41s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200805.Auf2m41s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_atomic.c:1496:1: warning: no previous prototype for 'drm_atomic_add_affected_colorops' [-Wmissing-prototypes]
    1496 | drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_atomic_add_affected_colorops +1496 drivers/gpu/drm/drm_atomic.c

  1474	
  1475	/**
  1476	 * drm_atomic_add_affected_colorops - add colorops for plane
  1477	 * @state: atomic state
  1478	 * @plane: DRM plane
  1479	 *
  1480	 * This function walks the current configuration and adds all colorops
  1481	 * currently used by @plane to the atomic configuration @state. This is useful
  1482	 * when an atomic commit also needs to check all currently enabled colorop on
  1483	 * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
  1484	 * to avoid special code to force-enable all colorops.
  1485	 *
  1486	 * Since acquiring a colorop state will always also acquire the w/w mutex of the
  1487	 * current plane for that colorop (if there is any) adding all the colorop states for
  1488	 * a plane will not reduce parallelism of atomic updates.
  1489	 *
  1490	 * Returns:
  1491	 * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
  1492	 * then the w/w mutex code has detected a deadlock and the entire atomic
  1493	 * sequence must be restarted. All other errors are fatal.
  1494	 */
  1495	int
> 1496	drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
  1497					 struct drm_plane *plane)
  1498	{
  1499		struct drm_colorop *colorop;
  1500		struct drm_colorop_state *colorop_state;
  1501	
  1502		WARN_ON(!drm_atomic_get_new_plane_state(state, plane));
  1503	
  1504		drm_dbg_atomic(plane->dev,
  1505			       "Adding all current colorops for [plane:%d:%s] to %p\n",
  1506			       plane->base.id, plane->name, state);
  1507	
  1508		drm_for_each_colorop(colorop, plane->dev) {
  1509			if (colorop->plane != plane)
  1510				continue;
  1511	
  1512			colorop_state = drm_atomic_get_colorop_state(state, colorop);
  1513			if (IS_ERR(colorop_state))
  1514				return PTR_ERR(colorop_state);
  1515		}
  1516	
  1517		return 0;
  1518	}
  1519	EXPORT_SYMBOL(drm_atomic_add_affected_colorops);
  1520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
