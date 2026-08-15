Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DB22F5313
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 04:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786767205; cv=none; b=XD+uPPmJmewfwgH8VqcPc+8cI9dF9z2RIepY/DHrbyRV3H3cJpfNOaAYMJ/v41rqH17bSrRGXrFNLDxV1lemC7skx2Iznrrj7xY4VWyaMciwNwMp/oLDBILuib73YNXMzDlkcV6uLY7/lG8Ckv5YD3Pgqg+IXj2OplwBhrKlsTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786767205; c=relaxed/simple;
	bh=q0IMlX55DM75dfpUgO/pYE3hs4RFSj7CSuYjoCVrx1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHmBITUsBI0jWDtoUmsHDwW4o9258SrybCUYOnbZJ0iHGUYBC48swdAUAoVehgGCiN8m/QlxuHwjgCmwDxlflETQT5jds2Qvp2UNdDb3WkgegXVf4PZPMLKR6u5XrhUjxl5MAEoNSQuMJ4+wwh3N73Fm+4SJ9/Md3CN0JJhEOg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmLactf/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmLactf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786767204; x=1818303204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q0IMlX55DM75dfpUgO/pYE3hs4RFSj7CSuYjoCVrx1Y=;
  b=MmLactf/3ta9AgnxLSt6R1dP2U+8ZZ4H875odZuJOawd577tTeRl9Bna
   gOh0z+qAhNk0IcvE3xKIqcNpH+ZJzW7hv4KKXsvoEOsqIv0ADxo6vIIlr
   iD4vN5JjF/bBFpw3PpgW+lW7DpH0iOv7/dbyeK2KaT6YatwYSsiVXZhtF
   ztrlrW0sJ2Iml34CnXzS6ZWIZboK9rmW7AThKZoFhzNeVVShsccv4jlzK
   ULoUi1gxiMqTQkk2hCQCFa+zrl07WyYNaN3g/L1JWemqP8muyb+m2zD8u
   bHBxU92bp46g2CGByjoCaKrETj4CnVuZGwk3xlDeOEmAhrq2u7lygxoMs
   w==;
X-CSE-ConnectionGUID: gD6BohGTT8i9ZjgnH5IFTw==
X-CSE-MsgGUID: OvazizCUQVOpB1jA1sWweg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87553201"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="87553201"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 21:13:23 -0700
X-CSE-ConnectionGUID: zFuW32z+QSi794qZCben9A==
X-CSE-MsgGUID: mHVR9Ge+TN+lK61vJ9JZuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="287868667"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2026 21:13:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv5ll-00000000b4w-3Tpb;
	Sat, 15 Aug 2026 04:13:17 +0000
Date: Sat, 15 Aug 2026 12:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Zhou <zhoulol888@gmail.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, linux-kernel@vger.kernel.org,
	Andrew Zhou <zhoulol888@gmail.com>
Subject: Re: [PATCH] drm: make panel orientation quirks optional
Message-ID: <202608151239.Mo46Llie-lkp@intel.com>
References: <20260716065106.150760-1-zhoulol888@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716065106.150760-1-zhoulol888@gmail.com>

Hi Andrew,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.2-rc7 next-20260813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Zhou/drm-make-panel-orientation-quirks-optional/20260815-090825
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260716065106.150760-1-zhoulol888%40gmail.com
patch subject: [PATCH] drm: make panel orientation quirks optional
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260815/202608151239.Mo46Llie-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608151239.Mo46Llie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151239.Mo46Llie-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_panel_orientation_quirks.c:593:5: error: redefinition of 'drm_get_panel_orientation_quirk'
     593 | int drm_get_panel_orientation_quirk(int width, int height)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/drm_panel_orientation_quirks.c:15:
   include/drm/drm_utils.h:21:19: note: previous definition of 'drm_get_panel_orientation_quirk' with type 'int(int,  int)'
      21 | static inline int drm_get_panel_orientation_quirk(int width, int height)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_get_panel_orientation_quirk +593 drivers/gpu/drm/drm_panel_orientation_quirks.c

404d1a3edc3873 Hans de Goede 2017-11-25  591  
8a445de79eeaed Andrew Zhou   2026-07-16  592  /* Fallback stub when DMI or the entire quirk module is disabled. */
404d1a3edc3873 Hans de Goede 2017-11-25 @593  int drm_get_panel_orientation_quirk(int width, int height)
404d1a3edc3873 Hans de Goede 2017-11-25  594  {
404d1a3edc3873 Hans de Goede 2017-11-25  595  	return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
404d1a3edc3873 Hans de Goede 2017-11-25  596  }
404d1a3edc3873 Hans de Goede 2017-11-25  597  EXPORT_SYMBOL(drm_get_panel_orientation_quirk);
404d1a3edc3873 Hans de Goede 2017-11-25  598  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
