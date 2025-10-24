Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D01C1F02
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 01:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761270135; cv=none; b=p+j+UvMbVYOWRulGWH7bnKRdDlwzIppEGRYsYQc/Wm/61/834ogkbNVYqInWjT1YmeH6hurIcwCuzMUtfuPcLbH0NPySfNxLfXZ6AX6RmdPBI0tV/Rb7fowkdzjNF+XCm9KflHZ9/wtrIalmCFBOjq6MTkkVRr0ZT+AgoX1EG0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761270135; c=relaxed/simple;
	bh=+No2rJhOY0f5HqB1kZ9d1AeEEUQj5X3rtKR3BXER+q0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILj8XlczmELFAS4mPtWxnqVsvTu2b4n3jXk6Lst3WA7sUWRGckZlirpdl+D0k9yP8Wtf/idZmunDPru7oLnKZlx4n2fseyvkRidb1UaR6GrCMI2iT8TfBj9GzqAJX9ZJtUZXX8YoPoev4XGdXGd3g3NjKXmYoVAuYLrRPCwV+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksyhKrHk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksyhKrHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761270133; x=1792806133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+No2rJhOY0f5HqB1kZ9d1AeEEUQj5X3rtKR3BXER+q0=;
  b=ksyhKrHkQznK30a6FpAIf6P+qDh/rkUFLkIX8Y7y8ifxsQ20viNos15S
   WYkcmuH4q1vSbhjGzVX6VkuCaE8avnIuzG/vJC5VbEIzTyAa/6lthWlSw
   Ar/EJ8d+qP7OtQlqgI2T/L05W1LFA4AjlULKaqvyEcQr35Vg51B/37HYN
   BuNmF63lPgivAB/2bXBTU2qnFO2RctFIKyafMXh31MphYbwvcd7A2APCu
   PNXS/8hXGNU6NywRnhBPKz6+EXwoDvxdclI8CARRK5zkY9s3u0sbg1zmM
   t0zXIdGPAorzLbu9oZg4bD+DUdajWbdcuXBqYPO2Q6w7qJUPNH6Ui2hYO
   Q==;
X-CSE-ConnectionGUID: yjM85Qa8RoOBzU/bqyZoaA==
X-CSE-MsgGUID: /VFT83iYSE6LjDRXioO2FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63487889"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="63487889"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 18:42:12 -0700
X-CSE-ConnectionGUID: PUFi3N5nTDqgDIK6SlR2Rw==
X-CSE-MsgGUID: UUx7x87jS+ua1xtN0609TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="221505182"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Oct 2025 18:42:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vC6o9-000E4j-2B;
	Fri, 24 Oct 2025 01:41:40 +0000
Date: Fri, 24 Oct 2025 09:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 202/202] include/linux/math.h:25:55:
 warning: statement with no effect
Message-ID: <202510240912.GPmYplY9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   d6e365e8de4e085c0601fabcc823ecf8a6e223ad
commit: 7db4e2a06b322fdbe143eee233178c4f2e7d6f87 [202/202] CHROMIUM: drm/mediatek: Add cphy driver for mt8189
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251024/202510240912.GPmYplY9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240912.GPmYplY9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240912.GPmYplY9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:27,
                    from include/linux/clk.h:13,
                    from drivers/gpu/drm/mediatek/mtk_dsi.c:7:
   drivers/gpu/drm/mediatek/mtk_dsi.c: In function 'mtk_dsi_cphy_timconfig':
>> include/linux/math.h:25:55: warning: statement with no effect [-Wunused-value]
      25 | #define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/mediatek/mtk_dsi.c:350:9: note: in expansion of macro 'round_up'
     350 |         round_up(timing->lpx, 2);
         |         ^~~~~~~~
>> include/linux/math.h:25:55: warning: statement with no effect [-Wunused-value]
      25 | #define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/mediatek/mtk_dsi.c:353:9: note: in expansion of macro 'round_up'
     353 |         round_up(timing->da_hs_prepare, 2);
         |         ^~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dsi.c:341:21: warning: variable 'cycle_time' set but not used [-Wunused-but-set-variable]
     341 |         u32 ui = 0, cycle_time = 0;
         |                     ^~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dsi.c:341:13: warning: variable 'ui' set but not used [-Wunused-but-set-variable]
     341 |         u32 ui = 0, cycle_time = 0;
         |             ^~


vim +25 include/linux/math.h

aa6159ab99a9ab Andy Shevchenko 2020-12-15  16  
aa6159ab99a9ab Andy Shevchenko 2020-12-15  17  /**
aa6159ab99a9ab Andy Shevchenko 2020-12-15  18   * round_up - round up to next specified power of 2
aa6159ab99a9ab Andy Shevchenko 2020-12-15  19   * @x: the value to round
aa6159ab99a9ab Andy Shevchenko 2020-12-15  20   * @y: multiple to round up to (must be a power of 2)
aa6159ab99a9ab Andy Shevchenko 2020-12-15  21   *
aa6159ab99a9ab Andy Shevchenko 2020-12-15  22   * Rounds @x up to next multiple of @y (which must be a power of 2).
aa6159ab99a9ab Andy Shevchenko 2020-12-15  23   * To perform arbitrary rounding up, use roundup() below.
aa6159ab99a9ab Andy Shevchenko 2020-12-15  24   */
aa6159ab99a9ab Andy Shevchenko 2020-12-15 @25  #define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
aa6159ab99a9ab Andy Shevchenko 2020-12-15  26  

:::::: The code at line 25 was first introduced by commit
:::::: aa6159ab99a9ab5df835b4750b66cf132a5aa292 kernel.h: split out mathematical helpers

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
