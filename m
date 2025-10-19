Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584F219F121
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Oct 2025 03:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760843175; cv=none; b=E/g8SwZCWz70NHVqnzv+xBke9drzk4YFh/IDnM5BFibPHjPxbLdQ/Jo+vmRvG1nfw6PZyhrQ3n1WqAKQzX/CygQum57ifoOC9oA8CPKyPqUEvW48+jxqYYdOjRbpaskAWfwGyR1O0L2NE1pg+imBodt8eX0WNyegBLAlemNwios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760843175; c=relaxed/simple;
	bh=8ej+KJglb5khYjbqP5C7tRTFOFEsRaAn9t5aR1EF6m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbqYU4pRiEiwEAbLQfQuBiDHWJ+7yLLM7M1nIrkOn20rnJB0X6Bm7X6nimoUTUXNhnmC+S6MDdF2MKQfilaglyqmCZmCwsKHPWsVk0VHufpu+uyVdl0AAou75dsvaLFV88VKH4d6A3POLCA739e8lA4PiAg1X0jIyUe+4FoPjI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/zcSdUR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/zcSdUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760843174; x=1792379174;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ej+KJglb5khYjbqP5C7tRTFOFEsRaAn9t5aR1EF6m8=;
  b=E/zcSdURnGlP8PFO3Ueo+UObPePlwUzSpvrMEVznKPVeDAiqifq1GZFb
   CxY92J0JZ6DRkVUgTSt99KKxq7Ll8Lnbvh3PNb9nqByXrOvnnpDy5aLt/
   E4mO9mMJxjtJkowvjn3F4qdroUu+8jXKJWunH8eb9T0gCMfohd0Ey/fDT
   EyYI64dds1iqwjuBdp+mpCvcX3UrNgJQZ1Cnl41s03QCcchb4PNc7kCmN
   NsfMGC+26ZtNqTJHNoRHwDFPeIVWUMZ5nh6cUoImNOxrOZcZiy/EUxZoq
   v9dBOHqUHm/dnQA+gkRb/E9D7XM8rk1gaXG3rhIfhK0zBItux46Q3fdk/
   Q==;
X-CSE-ConnectionGUID: +DMXugLxSGKw0bHSlmC9gw==
X-CSE-MsgGUID: jBOjRQZlQWuS/DBd/jwOIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73610823"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="73610823"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 20:06:12 -0700
X-CSE-ConnectionGUID: kdNHyOOVTrCYk+hH58VCTQ==
X-CSE-MsgGUID: uI4To4eRRzurTtZURO6C6g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Oct 2025 20:06:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAJkG-0008nT-2t;
	Sun, 19 Oct 2025 03:06:08 +0000
Date: Sun, 19 Oct 2025 11:05:56 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/4] PM: hibernate: export hibernation_in_progress()
Message-ID: <202510191001.Ayv4cqZ6-lkp@intel.com>
References: <20251018142114.897445-2-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018142114.897445-2-usama.anjum@collabora.com>

Hi Muhammad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge dtor-input/next dtor-input/for-linus tip/smp/core linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Usama-Anjum/PM-hibernate-export-hibernation_in_progress/20251018-222539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20251018142114.897445-2-usama.anjum%40collabora.com
patch subject: [RFC 1/4] PM: hibernate: export hibernation_in_progress()
config: arc-randconfig-001-20251019 (https://download.01.org/0day-ci/archive/20251019/202510191001.Ayv4cqZ6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191001.Ayv4cqZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510191001.Ayv4cqZ6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/power/main.c:22:
>> kernel/power/power.h:85:20: error: redefinition of 'hibernation_in_progress'
    static inline bool hibernation_in_progress(void) { return false; }
                       ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/power/main.c:18:
   include/linux/suspend.h:416:20: note: previous definition of 'hibernation_in_progress' was here
    static inline bool hibernation_in_progress(void) { return false; }
                       ^~~~~~~~~~~~~~~~~~~~~~~


vim +/hibernation_in_progress +85 kernel/power/power.h

1b17d4525bca391 Rafael J. Wysocki 2025-05-09  84  
1b17d4525bca391 Rafael J. Wysocki 2025-05-09 @85  static inline bool hibernation_in_progress(void) { return false; }
ac5c24ec1e98331 Rafael J. Wysocki 2010-09-20  86  #endif /* !CONFIG_HIBERNATION */
a6d70980602e6f1 Stephen Hemminger 2006-12-06  87  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
