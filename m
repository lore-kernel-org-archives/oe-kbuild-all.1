Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4528465
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695981543; x=1727517543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eLMmBjje9vxDsaBsE0ccKa43Wknd5cRHCpJaYOwfTzA=;
  b=ioBw9a7U0oMFMFtQL8Lb0FQkS29r7lAmNFEuilJXFxJ5QDhhIum9oop3
   SG60b93plOVUFParqQg0Wktl8j/6oV9VWatt0s9gBCr3Bnnp3j6h1cYZc
   G0Nns7ILkL1WyAmbnvmViOFwagMkuS3Wc6cwuQCaOyD+1tWgiacFOnXrr
   8QO+7Sy7uU79Ja1OBsjxs9DpUtKezAG8InlefO19o8caO5Ed8fc0qDm86
   +5fnPCywWl95dlc+8yg/J/mzhSIn4YYsAmezmYo+AmQSmpN2PciLD8LrO
   jMw+SK5zPi5sz/oKKTvoDPkUrXIOr5PvqebFW1n7HEoHLRr+ZC9gdL8fl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468547359"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="468547359"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 02:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="810037"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2023 02:59:00 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmAGv-0002j7-1K;
	Fri, 29 Sep 2023 09:58:57 +0000
Date: Fri, 29 Sep 2023 17:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de, airlied@redhat.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
Cc: oe-kbuild-all@lists.linux.dev, gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v3 2/3] drm/panic: Add a drm panic handler
Message-ID: <202309291753.8XAivqN0-lkp@intel.com>
References: <20230927172849.193996-3-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927172849.193996-3-jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2dde18cd1d8fac735875f2e4987f11817cc0bc2c]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Export-drm_fb_xrgb8888_to_rgb565_line/20230928-013030
base:   2dde18cd1d8fac735875f2e4987f11817cc0bc2c
patch link:    https://lore.kernel.org/r/20230927172849.193996-3-jfalempe%40redhat.com
patch subject: [PATCH v3 2/3] drm/panic: Add a drm panic handler
config: arc-randconfig-002-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291753.8XAivqN0-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291753.8XAivqN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291753.8XAivqN0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_panic.c:363: warning: expecting prototype for drm_log_exit(). Prototype was for drm_panic_exit() instead


vim +363 drivers/gpu/drm/drm_panic.c

   358	
   359	/**
   360	 * drm_log_exit() - Shutdown drm-panic subsystem
   361	 */
   362	void drm_panic_exit(void)
 > 363	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
