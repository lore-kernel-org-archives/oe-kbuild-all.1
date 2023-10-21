Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4D31110
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bpkl6FKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697879101; x=1729415101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cmi7mqZpw6OcrH8ifMi8TEfwrHhrkx+7dKpVLHF1oV4=;
  b=Bpkl6FKl4M+R8RKFVthfRehVu/JBEcvhBbgmMH3qgXhtH5Y+xTjoHNCU
   ZIYdPnL+v8Ev73gyEvHsEtwIBNCARRN8lnbq3kbPDF3sQGH+fpJOLyv3x
   Xml5AvFR1Zc+kgb7YgG/r4aUv3dpSz8p1XVfxbn17hzLpbC9hc+RzZxSA
   FiZwwpn1I+qJ9Uhk8GedLZ5AeRZqXjsPtMapdaE4RdmvC6RyQCsPg8VlY
   9SKAX5RCagXDpPPw9w7LsTEHDTNHbE1v6D87D1cuUck99kbHiJJLYJPvw
   TiBXEVXLEHH7PcUqbKPcCRk4QwgcZRj1VHfC5a10DSg9h+zHDSCMIS5lB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="366849869"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="366849869"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 02:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="757689586"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="757689586"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Oct 2023 02:04:59 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu7uj-0004fF-0H;
	Sat, 21 Oct 2023 09:04:57 +0000
Date: Sat, 21 Oct 2023 17:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 08/17] drm/colorop: Add TYPE property
Message-ID: <202310211641.cAHqHQqU-lkp@intel.com>
References: <20231019212133.245155-9-harry.wentland@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019212133.245155-9-harry.wentland@amd.com>

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
patch link:    https://lore.kernel.org/r/20231019212133.245155-9-harry.wentland%40amd.com
patch subject: [RFC PATCH v2 08/17] drm/colorop: Add TYPE property
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231021/202310211641.cAHqHQqU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211641.cAHqHQqU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211641.cAHqHQqU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_colorop.c:205: warning: Function parameter or member 'type' not described in 'drm_get_colorop_type_name'
>> drivers/gpu/drm/drm_colorop.c:205: warning: Excess function parameter 'range' description in 'drm_get_colorop_type_name'


vim +205 drivers/gpu/drm/drm_colorop.c

   196	
   197	/**
   198	 * drm_get_colorop_type_name - return a string for colorop type
   199	 * @range: colorop type to compute name of
   200	 *
   201	 * In contrast to the other drm_get_*_name functions this one here returns a
   202	 * const pointer and hence is threadsafe.
   203	 */
   204	const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 > 205	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
