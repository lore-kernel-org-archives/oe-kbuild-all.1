Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782D52848B2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 11:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550522; cv=none; b=ZkeJiBF3vosy6a5yFh48AGZTdKY1ka5EIMQPFzVX2cMJkpPaFPy9tLSmUQ3ttCfM5H/Wo2BgQxsBb4n/WeRAFw8ANdyVrBu05Kr32w5NID6XfrGiQt8/vJIw4dkCb3pSOoSVJjdHWJgjrXlZSNmjpdgA7UFzqJyQV4CQLhLQ1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550522; c=relaxed/simple;
	bh=33zwpNi6XzjkCqOQjlwIkfkdf++z0VmtxXkUijvj4IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEN+CUVhAfiev5QUDh0KuDmnPlKIvQeSaC0FAn3ONdzULBShtIdRaMr1fHQ32kQQu/oJdpGxkbIrRd0FFkNJyrPwzESNrqR3Z3/skYShIw8ER8YCT9KKCAUuuEyxuOzA6r5AtnziPYH4n3gXeTj/WjGsmED7aIs6GuT+8mNWDR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWdTxQ8e; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWdTxQ8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763550520; x=1795086520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=33zwpNi6XzjkCqOQjlwIkfkdf++z0VmtxXkUijvj4IU=;
  b=FWdTxQ8ejTHStXsj+Ss0R/sZEhHoX0H7UzMUiHuaYFkC0x7pGW+mAj9V
   PvgjuyvgosnWWTh+akofhWmPPiDPnLOqtsBl69nYz1LFldXpPaihQvBj+
   wkJRq12QYnsHrVlJ3lVPfgbgEwLa7wsfdOTp+ETe+rpdhk36fqiEhJjdv
   f567rjACopRvupodt28bwyAxgI1IQeYVXtyUN8be+TD2m1rbhHNCAv4kY
   R3J1duTZR6A7aDOeFbHKQAQ8EgdhnJ7ie+gQehoAuaHt1veOELS4MA7+r
   yJ1z/NNPYc7mfIphBsgaIrw3E48uNMIgEpwrxwi7ZW8dYm55YMerXiJoF
   g==;
X-CSE-ConnectionGUID: dQlVenPTQ0Co5pv96An5PA==
X-CSE-MsgGUID: UZX/ZBMeT6mlle/M+chiMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65485174"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65485174"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 03:08:40 -0800
X-CSE-ConnectionGUID: Q5ONK/MkRaSTdDukuG83uQ==
X-CSE-MsgGUID: ypQgQaPSQtuJxlxDy4P8Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="195976288"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Nov 2025 03:08:37 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLg38-0002nf-01;
	Wed, 19 Nov 2025 11:08:34 +0000
Date: Wed, 19 Nov 2025 19:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	linux-cxl@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, Gregory Price <gourry@gourry.net>,
	Robert Richter <rrichter@amd.com>,
	Cheatham Benjamin <benjamin.cheatham@amd.com>,
	"Fabio M . De Francesco" <fabio.m.de.francesco@linux.intel.com>
Subject: Re: [PATCH 4/4 v6] cxl/test: Simulate an x86 Low Memory Hole for
 tests
Message-ID: <202511191844.tffZI1tp-lkp@intel.com>
References: <20251118194321.1773484-5-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118194321.1773484-5-fabio.m.de.francesco@linux.intel.com>

Hi Fabio,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7ec9db66cc552f2f8a6779c16d01a2a01eccedde]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/cxl-core-Change-match_-_by_range-signatures/20251119-034652
base:   7ec9db66cc552f2f8a6779c16d01a2a01eccedde
patch link:    https://lore.kernel.org/r/20251118194321.1773484-5-fabio.m.de.francesco%40linux.intel.com
patch subject: [PATCH 4/4 v6] cxl/test: Simulate an x86 Low Memory Hole for tests
config: x86_64-randconfig-161-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191844.tffZI1tp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191844.tffZI1tp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191844.tffZI1tp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cxl/core/region.c:17:
   drivers/cxl/core/region.c: In function 'spa_maps_hpa':
>> drivers/cxl/core/platform_quirks.h:46:29: error: implicit declaration of function '__platform_region_matches_cxld'; did you mean 'platform_region_matches_cxld'? [-Wimplicit-function-declaration]
      46 | #define DECLARE_TESTABLE(x) __##x
         |                             ^~
   drivers/cxl/core/platform_quirks.h:48:38: note: in expansion of macro 'DECLARE_TESTABLE'
      48 | #define platform_region_matches_cxld DECLARE_TESTABLE(platform_region_matches_cxld)
         |                                      ^~~~~~~~~~~~~~~~
   drivers/cxl/core/region.c:892:16: note: in expansion of macro 'platform_region_matches_cxld'
     892 |         return platform_region_matches_cxld(p, cxld);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/region.c: In function 'match_cxlsd_to_cxled_by_range':
>> drivers/cxl/core/platform_quirks.h:46:29: error: implicit declaration of function '__platform_cxlrd_matches_cxled'; did you mean 'platform_cxlrd_matches_cxled'? [-Wimplicit-function-declaration]
      46 | #define DECLARE_TESTABLE(x) __##x
         |                             ^~
   drivers/cxl/core/platform_quirks.h:47:38: note: in expansion of macro 'DECLARE_TESTABLE'
      47 | #define platform_cxlrd_matches_cxled DECLARE_TESTABLE(platform_cxlrd_matches_cxled)
         |                                      ^~~~~~~~~~~~~~~~
   drivers/cxl/core/region.c:1837:21: note: in expansion of macro 'platform_cxlrd_matches_cxled'
    1837 |                 if (platform_cxlrd_matches_cxled(cxlrd, cxled))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +46 drivers/cxl/core/platform_quirks.h

    44	
    45	#ifndef CXL_TEST_ENABLE
  > 46	#define DECLARE_TESTABLE(x) __##x
    47	#define platform_cxlrd_matches_cxled DECLARE_TESTABLE(platform_cxlrd_matches_cxled)
  > 48	#define platform_region_matches_cxld DECLARE_TESTABLE(platform_region_matches_cxld)
    49	#endif
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
