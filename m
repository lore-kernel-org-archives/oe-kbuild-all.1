Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5163469FC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259372; cv=none; b=O2ORmNaFA458llhvLP1t51hzFf2vrmKwbGOB4GWE6rVvQMRjBw6p7G5FPYv9wnXg44xdLYbd8CKeZuqy8FVYVtJE5ZLNWTyRZlp13tVk1N1jnNN8v+Lfr+FdN8LIeOe4CY8QF9USBpocEfznVl8jddCHXw2Gj5vDkjUrUiVeNcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259372; c=relaxed/simple;
	bh=1zlNcYj9XEGmVGkEpnSVBVmejH3SSiwB4BBt3de/3EY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HrK3cQcsgmb6tx7/kZGqvkA8yIsYIqT6yRpAu9L92bp9mibMUP4mLtmPVkWm9Xa/t9nMBXGooQtiso61fpLBE03QaDgtbzuXgRejWgkGv5kqaWZWsVdRYyghcv1LFZ8WhKD4DyBzxuWo3P4mN9+CAqalrfELgTIuYBp1+Q1piLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heoVyUfG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heoVyUfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779259370; x=1810795370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1zlNcYj9XEGmVGkEpnSVBVmejH3SSiwB4BBt3de/3EY=;
  b=heoVyUfGRj7wpw883VDqA3yK0e4GW7cGD49mrbhGRa71dW7uB4HhiUGk
   un8ButwMxUgHrpKSMfVYXENU/nYgSXpX0AxJZZeXUF5G8WB3IuD6hg9+s
   FsofoIZBAg64T8RROJFkWRMdoT+4PZRRg4M7F3wfiPBDjgnT1H2Cby9XE
   o5s4b1gjOK8X+qtGerrZd3QftLw728NP1+PXVJQj10e25XT4iqqISpUnE
   Jro3T4GJk7V5HLr36Q515oKx9TtDPMkEvciKZw70uYcLSCruxGwu0+IpB
   eKsnBeByBTsTxv+UdqGZzaOtdP+rETxbMVAkaqsTJ8C1ypnqKZAsEnNy4
   w==;
X-CSE-ConnectionGUID: hamqgg6XQy6T3JQv/tSEvA==
X-CSE-MsgGUID: hUqhOcIFT9mq86cZc6loyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="105608335"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="105608335"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 23:42:50 -0700
X-CSE-ConnectionGUID: lFvVLmmVTRSrF64WgpiLrA==
X-CSE-MsgGUID: zeucWLe1Sp67bg+0KWvJog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239902235"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 May 2026 23:42:48 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPadh-000000002fH-2bNT;
	Wed, 20 May 2026 06:42:45 +0000
Date: Wed, 20 May 2026 14:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix 40/40] include/drm/drm_print.h:566:9:
 error: implicit declaration of function '_dynamic_func_call_cls'
Message-ID: <202605201408.x1sHT6fx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-classmap-fix
head:   747914d1d51200efff2706de4b876006d1b7af8d
commit: 747914d1d51200efff2706de4b876006d1b7af8d [40/40] drm: mark CONFIG_DRM_USE_DYNAMIC_DEBUG unBROKEN
config: xtensa-randconfig-r131-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201408.x1sHT6fx-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201408.x1sHT6fx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201408.x1sHT6fx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_atomic.c:43:
   drivers/gpu/drm/drm_atomic.c: In function 'drm_atomic_state_init':
>> include/drm/drm_print.h:566:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     566 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:657:9: note: in expansion of macro 'drm_dev_dbg'
     657 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_atomic.c:155:9: note: in expansion of macro 'drm_dbg_atomic'
     155 |         drm_dbg_atomic(dev, "Allocated atomic state %p\n", state);
         |         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_atomic_uapi.c:34:
   drivers/gpu/drm/drm_atomic_uapi.c: In function 'drm_atomic_set_mode_for_crtc':
>> include/drm/drm_print.h:566:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     566 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:657:9: note: in expansion of macro 'drm_dev_dbg'
     657 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:95:17: note: in expansion of macro 'drm_dbg_atomic'
      95 |                 drm_dbg_atomic(crtc->dev,
         |                 ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_auth.c:38:
   drivers/gpu/drm/drm_auth.c: In function 'drm_getmagic':
>> include/drm/drm_print.h:566:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     566 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:649:9: note: in expansion of macro 'drm_dev_dbg'
     649 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_auth.c:108:9: note: in expansion of macro 'drm_dbg_core'
     108 |         drm_dbg_core(dev, "%u\n", auth->magic);
         |         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_blend.c:34:
   drivers/gpu/drm/drm_blend.c: In function 'drm_atomic_helper_crtc_normalize_zpos':
>> include/drm/drm_print.h:566:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     566 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:657:9: note: in expansion of macro 'drm_dev_dbg'
     657 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_blend.c:474:9: note: in expansion of macro 'drm_dbg_atomic'
     474 |         drm_dbg_atomic(dev, "[CRTC:%d:%s] calculating normalized zpos values\n",
         |         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_crtc.c:49:
   drivers/gpu/drm/drm_crtc.c: In function 'drm_mode_setcrtc':
>> include/drm/drm_print.h:566:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     566 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:653:9: note: in expansion of macro 'drm_dev_dbg'
     653 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_crtc.c:736:17: note: in expansion of macro 'drm_dbg_kms'
     736 |                 drm_dbg_kms(dev, "Unknown CRTC ID %d\n", crtc_req->crtc_id);
         |                 ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_file.c:48:
   drivers/gpu/drm/drm_file.c: In function 'drm_file_free':
>> include/drm/drm_print.h:566:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     566 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:649:9: note: in expansion of macro 'drm_dev_dbg'
     649 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:242:9: note: in expansion of macro 'drm_dbg_core'
     242 |         drm_dbg_core(dev, "comm=\"%s\", pid=%d, dev=0x%lx, open_count=%d\n",
         |         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_framebuffer.c:35:
   drivers/gpu/drm/drm_framebuffer.c: In function 'drm_framebuffer_check_src_coords':
>> include/drm/drm_print.h:566:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     566 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:653:9: note: in expansion of macro 'drm_dev_dbg'
     653 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_framebuffer.c:90:17: note: in expansion of macro 'drm_dbg_kms'
      90 |                 drm_dbg_kms(fb->dev, "Invalid source coordinates "
         |                 ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_gem.c:55:
   drivers/gpu/drm/drm_gem.c: In function 'drm_gem_dma_resv_wait':
>> include/drm/drm_print.h:566:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     566 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:649:9: note: in expansion of macro 'drm_dev_dbg'
     649 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_gem.c:913:17: note: in expansion of macro 'drm_dbg_core'
     913 |                 drm_dbg_core(dev, "Failed to look up GEM BO %d\n", handle);
         |                 ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_ioctl.c:41:
   drivers/gpu/drm/drm_ioctl.c: In function 'drm_noop':
>> include/drm/drm_print.h:566:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     566 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:649:9: note: in expansion of macro 'drm_dev_dbg'
     649 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:461:9: note: in expansion of macro 'drm_dbg_core'
     461 |         drm_dbg_core(dev, "\n");
         |         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_lease.c:13:
   drivers/gpu/drm/drm_lease.c: In function 'drm_lease_create':
>> include/drm/drm_print.h:566:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     566 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:663:9: note: in expansion of macro 'drm_dev_dbg'
     663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_lease.c:216:9: note: in expansion of macro 'drm_dbg_lease'
     216 |         drm_dbg_lease(dev, "lessor %d\n", lessor->lessee_id);
         |         ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_managed.c:17:
   drivers/gpu/drm/drm_managed.c: In function 'drm_managed_release':
>> include/drm/drm_print.h:566:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     566 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:667:9: note: in expansion of macro 'drm_dev_dbg'
     667 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_managed.c:69:9: note: in expansion of macro 'drm_dbg_drmres'
      69 |         drm_dbg_drmres(dev, "drmres release begin\n");
         |         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +/_dynamic_func_call_cls +566 include/drm/drm_print.h

02c9656b2f0d6997 Haneen Mohammed 2017-10-17  560  
84ec67288c10fbf1 Jim Cromie      2022-09-11  561  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
e820f52577b14c63 Jim Cromie      2022-09-11  562  #define drm_dev_dbg(dev, cat, fmt, ...)				\
16deeb8e18cafd30 Jim Cromie      2022-09-11  563  	__drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
84ec67288c10fbf1 Jim Cromie      2022-09-11  564  #else
84ec67288c10fbf1 Jim Cromie      2022-09-11  565  #define drm_dev_dbg(dev, cat, fmt, ...)				\
16deeb8e18cafd30 Jim Cromie      2022-09-11 @566  	_dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,		\
84ec67288c10fbf1 Jim Cromie      2022-09-11  567  			       dev, cat, fmt, ##__VA_ARGS__)
84ec67288c10fbf1 Jim Cromie      2022-09-11  568  #endif
e820f52577b14c63 Jim Cromie      2022-09-11  569  

:::::: The code at line 566 was first introduced by commit
:::::: 16deeb8e18cafd30e70d8dc2b12a753b28298d8a drm_print: add _ddebug descriptor to drm_*dbg prototypes

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
