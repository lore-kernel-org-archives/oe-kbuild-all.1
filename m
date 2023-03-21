Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9DED2ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 17:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679419316; x=1710955316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CeumtqwMHI9L5A38y41dlVRO0aDPkgHahrBh+sfBNbU=;
  b=CkqfzojIW4+xPPv9XBH2uUUNktigrsRr8g+5IqSmZGTmiDfF0WbHIanp
   VJIicjKBrm1A5GkKyqEqjiq13XzbBQRg+Q02Tj1lP9GLOao6x5ruhhaVF
   u+t9n1hmZzUwpkmTea4fHPB7auTyHVuxyb6PPvCfGfJhdGo8FJXxPxSre
   /K/lqGiczq64pt27B5B9jeLzHVAlPVLj8t67NWct14zgr8Pg7KlB22D9E
   8+rG336cMHX5BaI3dTLxbztkMYHKm3y9YaN83ZP1ai3qlLAn8onRJmgAC
   KBUYXBbDjkPlDOltWsT/aayrWhauPCtm8ULvajPtcqZO61csntasDlflo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="319401490"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="319401490"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 10:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825037280"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="825037280"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2023 10:21:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pefg4-000CCE-2Q;
	Tue, 21 Mar 2023 17:21:40 +0000
Date: Wed, 22 Mar 2023 01:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [RFC][PATCH v2 1/3] drm: Introduce plane SIZE_HINTS
 property
Message-ID: <202303220125.amZYGvSj-lkp@intel.com>
References: <20230321143643.26676-2-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321143643.26676-2-ville.syrjala@linux.intel.com>

Hi Ville,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-Introduce-plane-SIZE_HINTS-property/20230321-223915
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230321143643.26676-2-ville.syrjala%40linux.intel.com
patch subject: [Intel-gfx] [RFC][PATCH v2 1/3] drm: Introduce plane SIZE_HINTS property
config: arm-randconfig-r025-20230319 (https://download.01.org/0day-ci/archive/20230322/202303220125.amZYGvSj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dd0b889c4dae763a60ddd19c018a825beb3b1d6a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ville-Syrjala/drm-Introduce-plane-SIZE_HINTS-property/20230321-223915
        git checkout dd0b889c4dae763a60ddd19c018a825beb3b1d6a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220125.amZYGvSj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_plane.c:1637: warning: Function parameter or member 'size_ok' not described in 'drm_plane_add_size_hints_property'
>> drivers/gpu/drm/drm_plane.c:1637: warning: expecting prototype for drm_plane_add_size_hint_property(). Prototype was for drm_plane_add_size_hints_property() instead


vim +1637 drivers/gpu/drm/drm_plane.c

  1616	
  1617	/**
  1618	 * drm_plane_add_size_hint_property - create a size hint property
  1619	 *
  1620	 * @plane: drm plane
  1621	 * @min_width: minimum width
  1622	 * @min_height: minimum height
  1623	 * @max_width: maximum width
  1624	 * @max_height: maximum height
  1625	 * @cursor_size_ok: function to check if specified size is ok
  1626	 *
  1627	 * Create a size hints property for the plane.
  1628	 *
  1629	 * RETURNS:
  1630	 * Zero for success or -errno
  1631	 */
  1632	int drm_plane_add_size_hints_property(struct drm_plane *plane,
  1633					      int min_width, int min_height,
  1634					      int max_width, int max_height,
  1635					      bool (*size_ok)(struct drm_plane *plane,
  1636							      int width, int height))
> 1637	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
