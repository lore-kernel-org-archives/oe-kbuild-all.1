Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11A8459AE4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293405; cv=none; b=Whq3V8BczluIhSi/VP4XjeuSg0sQagGr5ikDpaKarQx+rNKHFFEj1mKCc8ylcv1pO0L4CduzEt9CK4U1PSDD0+2NZQi0hyNiCH4dOj0KZ7DZMOaLgXDRk6okzN/6CTEPWoj6+71bmEs7k1mMuXCUra3YMQKprNpg7Q5rMJZvdVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293405; c=relaxed/simple;
	bh=sWF3g/grwwVgcSkSozEQOT9Ld0JwaprL9iEpJD571Lg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QOI4/dJeAPVX+60cr06Vs62Wg9Vl3YNNzpGnmUQHMuNKC+s/NrYrDSTS5YCLZoQWZhJQVttXeBmd1Lwvc1EuhZhrIVSocEGXnnqUPC79+wVUhe12y/4ysFNMnCjMx0BwJn4OpbdHmbJinqrzibhDnMWM633BzXJYejvB938MJXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1QG2c1h; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1QG2c1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791293404; x=1822829404;
  h=date:from:to:cc:subject:message-id;
  bh=sWF3g/grwwVgcSkSozEQOT9Ld0JwaprL9iEpJD571Lg=;
  b=Y1QG2c1hZbP4UzFNjZBbZErUYc989zrg1mBZV4b63+DYWGJ1nGkg/lbT
   43u93tqx44RQFz5y+f3+EvEVMnGYcYsRDYBpBsYuJhhhmwugJT+MO5b2d
   z5pESjI05G4JiBlICiIQKbEhcEfcYDgC/YksnUeYaqJdD16r4o+cODGRW
   sacH+vcEJhIgkDdoTblNLQ6KOwl0oEJdVMvOTUECgLaEP4/uL0ulOvFVv
   f4APwY8dfMYAP5V9otVftzv1l87xagDH8r+4iXoLkinvuI7QG3Z9DyGwt
   11E1xOmO3UiK9man/McwceE9oj0ShCo0MgiVj81MmM/XgzmEvMmASqBpG
   w==;
X-CSE-ConnectionGUID: DxoyiusVRQyCYyaX6y/i2g==
X-CSE-MsgGUID: Z+2TzEewQiiA2x96+iPixw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94854409"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="94854409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 06:30:03 -0700
X-CSE-ConnectionGUID: 4b3k8IjPQR2Djvs3b7aXww==
X-CSE-MsgGUID: fdEOQIyTSwKRZkCciKUhNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="277285331"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2026 06:30:01 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE5F1-000000001JH-0qkN;
	Tue, 06 Oct 2026 13:29:59 +0000
Date: Tue, 06 Oct 2026 15:29:16 +0200
From: kernel test robot <lkp@intel.com>
To: Hermes Wu <Hermes.wu@ite.com.tw>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/media/i2c/it6625.c:335:2: error: initialization of
 non-aggregate type '__u32' (aka 'unsigned int') with a designated initializer
 list
Message-ID: <202610061520.Bh5yCwm8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Hermes-Wu-via-B4-Relay/dt-bindings-media-ite-it6625-document-the-default-CSI-2-bus-type/20260930-144119
head:   0bcefb21172150e5326fc884b3d6d2179cb34e35
commit: e9b907baeb43c0f6b14fa35026de7b0ae2111cc5 media: i2c: it6625: drop stale GCC < 4.4.6 workaround
date:   6 days ago
config: x86_64-randconfig-2200-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061520.Bh5yCwm8-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061520.Bh5yCwm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061520.Bh5yCwm8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/it6625.c:335:2: error: initialization of non-aggregate type '__u32' (aka 'unsigned int') with a designated initializer list
     335 |         V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 27000000, 300000000,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     336 |                              V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     337 |                              V4L2_DV_BT_STD_GTF | V4L2_DV_BT_STD_CVT,
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     338 |                              V4L2_DV_BT_CAP_PROGRESSIVE | V4L2_DV_BT_CAP_INTERLACED |
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     339 |                              V4L2_DV_BT_CAP_REDUCED_BLANKING | V4L2_DV_BT_CAP_CUSTOM)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/v4l2-dv-timings.h:17:2: note: expanded from macro 'V4L2_INIT_BT_TIMINGS'
      17 |         { .bt = { _width , ## args } }
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/it6625.c:349:2: error: initialization of non-aggregate type '__u32' (aka 'unsigned int') with a designated initializer list
     349 |         V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 27000000, 594000000,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     350 |                              V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     351 |                              V4L2_DV_BT_STD_GTF | V4L2_DV_BT_STD_CVT,
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     352 |                              V4L2_DV_BT_CAP_PROGRESSIVE | V4L2_DV_BT_CAP_INTERLACED |
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     353 |                              V4L2_DV_BT_CAP_REDUCED_BLANKING | V4L2_DV_BT_CAP_CUSTOM)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/v4l2-dv-timings.h:17:2: note: expanded from macro 'V4L2_INIT_BT_TIMINGS'
      17 |         { .bt = { _width , ## args } }
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +335 drivers/media/i2c/it6625.c

142e5f00bd57ff Hermes Wu 2026-08-11  324  
142e5f00bd57ff Hermes Wu 2026-08-11  325  /*
142e5f00bd57ff Hermes Wu 2026-08-11  326   * Shared cap for every topology except the reference exception below:
142e5f00bd57ff Hermes Wu 2026-08-11  327   * IT6625 (no C-PHY support at all), IT6626 running D-PHY, and IT6626
142e5f00bd57ff Hermes Wu 2026-08-11  328   * running C-PHY with fewer than three trios. This is conservative
142e5f00bd57ff Hermes Wu 2026-08-11  329   * scoping, not a claim that one-/two-trio C-PHY can't also support a
142e5f00bd57ff Hermes Wu 2026-08-11  330   * higher rate -- they're simply unvalidated.
142e5f00bd57ff Hermes Wu 2026-08-11  331   */
142e5f00bd57ff Hermes Wu 2026-08-11  332  static const struct v4l2_dv_timings_cap it6625_timings_cap = {
142e5f00bd57ff Hermes Wu 2026-08-11  333  	.type = V4L2_DV_BT_656_1120,
142e5f00bd57ff Hermes Wu 2026-08-11  334  
142e5f00bd57ff Hermes Wu 2026-08-11 @335  	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 27000000, 300000000,
142e5f00bd57ff Hermes Wu 2026-08-11  336  			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
142e5f00bd57ff Hermes Wu 2026-08-11  337  			     V4L2_DV_BT_STD_GTF | V4L2_DV_BT_STD_CVT,
142e5f00bd57ff Hermes Wu 2026-08-11  338  			     V4L2_DV_BT_CAP_PROGRESSIVE | V4L2_DV_BT_CAP_INTERLACED |
142e5f00bd57ff Hermes Wu 2026-08-11  339  			     V4L2_DV_BT_CAP_REDUCED_BLANKING | V4L2_DV_BT_CAP_CUSTOM)
142e5f00bd57ff Hermes Wu 2026-08-11  340  };
142e5f00bd57ff Hermes Wu 2026-08-11  341  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
