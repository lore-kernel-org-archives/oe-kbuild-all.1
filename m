Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF18AD48
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720349210; cv=none; b=BSYGA8VUxZLoJRdw3q41Kn7vRNditrLBbNJhch0dLEVn7k/r/AAvOVs+LpnGxhMTQQrhI26sapTOjXMWi7v1fq22Mqz5yVABi7WPlxsB6rk9Az5bsaEijGLWkqkC21fb1xyi+G4R9ZtT/+sLuYSbzloLg7YkcaDI1TIaquwaTcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720349210; c=relaxed/simple;
	bh=exK+VozV3qpdIp3ksSqUWp1g/rSfLwup3F8ZjkTwvXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQxnU7KtZ6POD8oNkoA4zskIza1U4kaRe4KZbyyi/jldSRRid6Z3FWFNY7sHnJT2iaAquv7Hpsd7clZyf8ayFj6tWYfOf9bnRYYRFd6refdWCskWInqY0OLGaqdQyASDvzCDJoPj0HFDwlaYsFSUOwc8Bh0JyxFJVX9Xzafz6U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5YZMtw+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5YZMtw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720349209; x=1751885209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=exK+VozV3qpdIp3ksSqUWp1g/rSfLwup3F8ZjkTwvXo=;
  b=k5YZMtw+dDdsLy6noa+RUgL6DWOQvqoP3Lck4T+S0LuBeLR4nSJWE9un
   LseYAMUCWPImdQlDOuvV2mJKvkLYibJglZ/7P7V06ic80Z9clrozi3Oku
   u1EfG6OABEejqGqBZY3gR1Q9tHJiqS5PTvxQEgqBB77WLb4fTFOrU4KXn
   W3E3dKDEg4EC0gEFkfhsKmDfahkxV+k/tDcHHQ/lYx7/zVVOacxf4FHee
   iaFdU3WuRBio3kWdSho1OxixNRCt8PSER6/suHA89Rk+B9vEEtcoSSO+v
   clqWVD7rR7QTGF2XceCO4FOGs0H5FhXN4nHoTctbYS0Ks3Zi88xgqI77o
   A==;
X-CSE-ConnectionGUID: D3pU33nBT0mpkJDUxSz++A==
X-CSE-MsgGUID: BHq+gaHPSW63iikqrv38Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="21332430"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="21332430"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 03:46:49 -0700
X-CSE-ConnectionGUID: Mzm2CI5lRlCUQnQM4PeaaQ==
X-CSE-MsgGUID: Jck35UM7Q8mSjOI0uEke9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="70445012"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jul 2024 03:46:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQPPo-000UrO-30;
	Sun, 07 Jul 2024 10:46:44 +0000
Date: Sun, 7 Jul 2024 18:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/5] drm/i915/display: Add support for histogram
Message-ID: <202407071817.Z3qAXXBn-lkp@intel.com>
References: <20240705095551.1244154-2-arun.r.murthy@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705095551.1244154-2-arun.r.murthy@intel.com>

Hi Arun,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-tip/drm-tip drm-xe/drm-xe-next linus/master v6.10-rc6 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-R-Murthy/drm-i915-display-Add-support-for-histogram/20240705-233245
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240705095551.1244154-2-arun.r.murthy%40intel.com
patch subject: [PATCH 1/5] drm/i915/display: Add support for histogram
config: i386-buildonly-randconfig-004-20240707 (https://download.01.org/0day-ci/archive/20240707/202407071817.Z3qAXXBn-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071817.Z3qAXXBn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407071817.Z3qAXXBn-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/display/intel_histogram.o: in function `intel_histogram_update':
>> intel_histogram.c:(.text+0x2b3): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
