Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959442;
	b=ygGTAebit7z+HOyO8RBQ6JwrPd71LUAKvnJazMB7TJRcZ9+5jM+9VYUCRs9WO1nLYBJA
	 rx2b46J05kkXgs8lrNF47vaRDU+FaXEi/lcQrAp+/wPjFnFEW9LOHCQW5kJoZievYvhrx
	 R/ZTclMYRRssOmKiXW7OqwovXMUfB9PEynEnwkhb4KDP8AoEx2g0tbXRpkOAgBcC1eRHd
	 z/4WAVxgT7T1qmNch4YBCf261KIea/MqqqQA/kLH8uLRHZJRsfC3AVtFQaAPcBXminpez
	 PYXdHqVaNEed3yi8ZTuknA9DNJ4HTvy8Fd0b8SsDP1NQPLHB+lpOLQAm2RYpEuEf7PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959442;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Z0FIXlqMRQs+vS5nUv4GIHlx7Bajf//7Xc6D4Hn01Ts=;
	b=XjNegyFHThP+D/nGIuHq+awNR18pOZRlVGjJoPeeQKHO7+9mSsNRFVPQUzPnZTHhxmrL
	 loQ852tFOXwACz7opCW+vIMsKKPSREs9beTRw68SlUowQVpUzDhJSqfgts+mHJ5LBaIqm
	 opCTsD0Bar6w7YLZoHV6J+cxoff5fAuphImaj4HpasZrCZ852wFX/T7VtX1mpL7eIikH4
	 3v0uZZk9Xf6HE4cc2nCgSNQssX9CacNYtH5rFxZfbeGfZgZQbfVY9cSisH17bemH1eUdH
	 FyeY/EF4ZBUA1Qme5IQLymd4nZrKn0RLwhc3kWtnwaWhj1KtyRWkpV5y7uKp4/JGqHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VXTqn1O7;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C83D606A330
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 10:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C83D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VXTqn1O7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793959440; x=1825495440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ydGc/ciFeSrGBUhHaXRVpLydMmqEpMcO/ogN/ZFt7qs=;
  b=VXTqn1O7eOGT3NBy4kSEgWjKjpF0rHx3z0qCbF9EkDnoKqGSpd9lYKRs
   venwCROeSJjB/7LzgqCJ3GCnqPV1LcoMUFfQv2vAtfY0Z4q0ynmyGzxPN
   /HrPtCdalv3Clm2+OFh6XbxKe8Acw3o34qBDCaUuzQJw/MVtEuHA0roUd
   LyZcHI0SiRFu06wgz9N/oVm9MRtjHvGZpVA3UvHxwMP6nUly8S1raqLii
   vvsRz1JsAQdPhgCdI6XvnMpMb6kXMdTYYwv15kQOnaHGDjzjxZqbG5QXZ
   t1QBW0nwhKHSjNrUerii47/PJkzCMhdfyfGWPNvoty6iPBbUaZERWyN8z
   w==;
X-CSE-ConnectionGUID: lQeleh/SRmu+H991JGe6Qg==
X-CSE-MsgGUID: rprFC6d4Rbq3IIJVL3wHDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2647643"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2647643"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 02:04:00 -0800
X-CSE-ConnectionGUID: 3M7nEJtlS7ezdGAXD/Plvg==
X-CSE-MsgGUID: CPIkRI4rQuikVH4p194/Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7565481"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Nov 2026 02:03:58 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPGnc-00000000owF-0fTt;
	Fri, 06 Nov 2026 10:03:56 +0000
Date: Fri, 6 Nov 2026 18:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 7/7] drm/xe/uapi: Wire up GEM_CREATE NUMA node placement
 handler
Message-ID: <202611061741.t8yeu4Mb-lkp@intel.com>
References: <20261102101803.455921-16-himal.prasad.ghimiray@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102101803.455921-16-himal.prasad.ghimiray@intel.com>

Hi Himal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm-tip/drm-tip next-20261105]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v7.4-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/drm-ttm-pool-Add-ttm_pool_alloc_node-for-caller-selected-NUMA-node/20261102-154805
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20261102101803.455921-16-himal.prasad.ghimiray%40intel.com
patch subject: [RFC 7/7] drm/xe/uapi: Wire up GEM_CREATE NUMA node placement handler
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20261106/202611061741.t8yeu4Mb-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061741.t8yeu4Mb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061741.t8yeu4Mb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/xe/xe_bo.c:2483 function parameter 'numa_node' not described in 'xe_bo_init_locked'
>> Warning: drivers/gpu/drm/xe/xe_bo.c:2971 function parameter 'numa_node' not described in 'xe_bo_create_user'
>> Warning: drivers/gpu/drm/xe/xe_bo.c:2483 function parameter 'numa_node' not described in 'xe_bo_init_locked'
>> Warning: drivers/gpu/drm/xe/xe_bo.c:2971 function parameter 'numa_node' not described in 'xe_bo_create_user'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
