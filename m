Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476FB1A2C0B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 02:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786069966; cv=none; b=RqlKp6ebUIwPMXI9RhHoMjiDa664ejpzA59PLL5s03OPYuAl1LpSxOxBNDcw3198afjZHbkOuc66lRKsatlzBGFBfP2lsHHOmKqmJM3Vv66CBxP7xcGVhtlquafL6B3aqM2SotIZqRCCDk6Ud08c9Uo/IiRnkS8Oq5cmMVoOYA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786069966; c=relaxed/simple;
	bh=kti/nyxPEBMVwwxDxmo7klV8QQOqi5h81zv/CMXDbDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iUz7gyAx4gzK34bcRLor5/HVPV/eSckEQRx31Icm0fdtTWtm7AHT7N0mSNSeQX6KnJQsJ1iswv/KTknvZTu0ax6rgixjIBCs15DRGR54PJD/NFIDSJOO6v8LJAGLMPyTt2+Gsv22AIa5zSCIB35dP8VGhyZfSnpBtRVvGDHkMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djyP+LPL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djyP+LPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786069964; x=1817605964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kti/nyxPEBMVwwxDxmo7klV8QQOqi5h81zv/CMXDbDk=;
  b=djyP+LPLDWF+0rztD23nb1Z/JMGlqrTEepeMTIMtmmedzg/J1SwI+FkK
   Up9mGH1md99ChTxcbqSpkT653gLnrzXorJesVxgmiunxh942oqka/v0/f
   No2/naKbgXP5hVR78fesqkyGC/m0oqZOyGqeCbGxkBo3sllEjxZFJddc9
   fMPAy1nU83UxKU0QLqMUj2RN4l31K+aTIhsdx2b+jG+WtrppXivdwRTAP
   PGF6eccvJ6mv8BbK6wiHRfCtoEnLhLYvqY5hWR+MwdcugVdtrD9TgRYgP
   SlDhlEd6ez398Kh05ZnrI/7Obkz67VgCqhRUfB7GdyRhX1eHBw/1seAf/
   Q==;
X-CSE-ConnectionGUID: IfWyboc/SYmBGUc3EsPI5g==
X-CSE-MsgGUID: GcpXmIRuTEGG8zmm/bqlaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97325152"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="97325152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 19:32:43 -0700
X-CSE-ConnectionGUID: xKmJk3YrRHmA53lIS9kW8Q==
X-CSE-MsgGUID: iHluSBVmSYmnEIDd6lapiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="300481594"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Aug 2026 19:32:43 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsANz-00000000GuL-32K9;
	Fri, 07 Aug 2026 02:32:39 +0000
Date: Fri, 07 Aug 2026 10:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:jump-batch-core-1 6/50] include/drm/drm_print.h:566:9:
 error: implicit declaration of function '_dynamic_func_call_cls'
Message-ID: <202608071053.W3sfgRxb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git jump-batch-core-1
head:   19767e24687af03cf51f7b108eda8f03b07bf876
commit: a69b6bd4c063068d4e532164aa4c7fe23a36b708 [6/50] drm: Mark CONFIG_DRM_USE_DYNAMIC_DEBUG as unBROKEN
config: arm-randconfig-002-20260807 (https://download.01.org/0day-ci/archive/20260807/202608071053.W3sfgRxb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071053.W3sfgRxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608071053.W3sfgRxb-lkp@intel.com/

Note: the jimc/jump-batch-core-1 HEAD 19767e24687af03cf51f7b108eda8f03b07bf876 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/accel/ethosu/ethosu_job.c:15:
   drivers/accel/ethosu/ethosu_job.c: In function 'ethosu_ioctl_submit':
>> include/drm/drm_print.h:566:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     566 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:651:9: note: in expansion of macro 'drm_dev_dbg'
     651 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:669:33: note: in expansion of macro 'drm_dbg_driver'
     669 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/accel/ethosu/ethosu_job.c:495:17: note: in expansion of macro 'drm_dbg'
     495 |                 drm_dbg(dev, "Reserved field in drm_ethosu_submit struct should be 0.\n");
         |                 ^~~~~~~
   cc1: some warnings being treated as errors


vim +/_dynamic_func_call_cls +566 include/drm/drm_print.h

02c9656b2f0d69 Haneen Mohammed 2017-10-17  560  
84ec67288c10fb Jim Cromie      2022-09-11  561  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
e820f52577b14c Jim Cromie      2022-09-11  562  #define drm_dev_dbg(dev, cat, fmt, ...)				\
16deeb8e18cafd Jim Cromie      2022-09-11  563  	__drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
84ec67288c10fb Jim Cromie      2022-09-11  564  #else
84ec67288c10fb Jim Cromie      2022-09-11  565  #define drm_dev_dbg(dev, cat, fmt, ...)				\
16deeb8e18cafd Jim Cromie      2022-09-11 @566  	_dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,		\
84ec67288c10fb Jim Cromie      2022-09-11  567  			       dev, cat, fmt, ##__VA_ARGS__)
84ec67288c10fb Jim Cromie      2022-09-11  568  #endif
e820f52577b14c Jim Cromie      2022-09-11  569  

:::::: The code at line 566 was first introduced by commit
:::::: 16deeb8e18cafd30e70d8dc2b12a753b28298d8a drm_print: add _ddebug descriptor to drm_*dbg prototypes

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
