Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B406D2D784
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjRBBmJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699355567; x=1730891567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/gV8kK3cacjX8nzd6/bTiLhr/ZaxSPpdGq1KwLGhoqI=;
  b=cjRBBmJIx92WpBplpBkp+OkYCwkXPaUlEbCbLev4U+YWPXMjQtnEPMqM
   Vrv8O7ZphNw9BzsWeGlgTej57iIASmOcHa0h41eYdUgWKT1jfARKd6DaN
   Jr2o8SxM2l8mxqResZK+vMI/jPRB0sddwGXkp+yQDHX8lJvvtE80D87jv
   TtdtrBGST9Nqc6HeRHyKSwpP5QS9BIp8wZZuRBHHHzF0jMBG17zR3KT9f
   /qfvGLOPeZjnODUbFRs4k5n0HgWgjCW1MeKfrDp/dVNkREo7y9Icv813n
   VLay6xWmfcHWRsG9c1TDXFL5yZ7Y7mn4afELkKP5POxZd71PUKOKv3BkG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="11025217"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="11025217"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 03:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="833055945"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="833055945"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Nov 2023 03:12:45 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0K0h-00074G-06;
	Tue, 07 Nov 2023 11:12:43 +0000
Date: Tue, 7 Nov 2023 19:11:01 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 6/9] x86: kdump: use generic interface to simplify
 crashkernel reservation code
Message-ID: <202311071923.uYbShjYE-lkp@intel.com>
References: <20230914033142.676708-7-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914033142.676708-7-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes v6.6]
[cannot apply to arm64/for-next/core tip/x86/core linus/master next-20231107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/crash_core-c-remove-unnecessary-parameter-of-function/20230914-113546
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20230914033142.676708-7-bhe%40redhat.com
patch subject: [PATCH v3 6/9] x86: kdump: use generic interface to simplify crashkernel reservation code
config: i386-randconfig-011-20230914 (https://download.01.org/0day-ci/archive/20231107/202311071923.uYbShjYE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311071923.uYbShjYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311071923.uYbShjYE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/setup.c:476:15: warning: no previous prototype for 'crash_low_size_default' [-Wmissing-prototypes]
     476 | unsigned long crash_low_size_default(void)
         |               ^~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_OV2640
   Depends on [n]: MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [m]:
   - VIDEO_EM28XX_V4L2 [=m] && USB [=m] && MEDIA_SUPPORT [=m] && MEDIA_USB_SUPPORT [=y] && (MEDIA_CAMERA_SUPPORT [=y] || MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n]) && VIDEO_EM28XX [=m] && MEDIA_SUBDRV_AUTOSELECT [=y] && MEDIA_CAMERA_SUPPORT [=y]
   WARNING: unmet direct dependencies detected for VIDEO_MT9V011
   Depends on [n]: MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [m]:
   - VIDEO_EM28XX_V4L2 [=m] && USB [=m] && MEDIA_SUPPORT [=m] && MEDIA_USB_SUPPORT [=y] && (MEDIA_CAMERA_SUPPORT [=y] || MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n]) && VIDEO_EM28XX [=m] && MEDIA_SUBDRV_AUTOSELECT [=y] && MEDIA_CAMERA_SUPPORT [=y]


vim +/crash_low_size_default +476 arch/x86/kernel/setup.c

   472	
   473	/*
   474	 * --------- Crashkernel reservation ------------------------------
   475	 */
 > 476	unsigned long crash_low_size_default(void)
   477	{
   478	#ifdef CONFIG_X86_64
   479		return max(swiotlb_size_or_default() + (8UL << 20), 256UL << 20);
   480	#else
   481		return 0;
   482	#endif
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
