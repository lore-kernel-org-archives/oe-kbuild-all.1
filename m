Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294193FD4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 18:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749926722; cv=none; b=LtV2L00xCwe3iWQGR+i2Elms74ZZuKLd1UHnV2NdgJM4V5OZsii7WKCYejaWqkBdoXO3oGoi+ZhBhM82S5Dwta9BtUrUYGt3irsBpISr/81BAKRt9tOixcqaOfLSfyEmtQLU3UZXX584qlD3e5e94jMU/HbF+tlvy5RyG7A0pyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749926722; c=relaxed/simple;
	bh=bS7Bf/kZeiT9irwDkLnqUyxkx68VrjyuQlYTuTXXvJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akNZLrVKLH8w7oTmSOblyHVFpEDGQrPZLP8KCfXux4YwDJavJaMJ20UCwglroAAH1N5IHuILCyyhmWAW0voym6X8Ov+7nRTeWG4wtN2WEhp8/vsEDcFD8SylRkSXmKwQJ1Nk4XAxT5WML/2DyasBRjQW0wnuMBbse5Md3qNZ3Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwzHe2iO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwzHe2iO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749926721; x=1781462721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bS7Bf/kZeiT9irwDkLnqUyxkx68VrjyuQlYTuTXXvJc=;
  b=GwzHe2iOa/oibDx9S+MAJQaeUL+Pz16NbIU66qenbDRHV782lTuRDxSB
   6xmdYnFeFBocu6D9dOz5Zd/6tPwPVLTwA9I5oC2BelowEM4J8GmPqIHt6
   ToUhLspGaEQHzAKFdOjht0D7lXjOItVEpipHnk26R8bNlUjUEz99C4vvK
   dHLJ4Ah+t2z6JnzyjrVKLMyWoFbLKiogLqjuiZ+3v4Ih3NdUmFba5rAxI
   iLFelwD6Csu93tfvDhbW5HZebCy3RIsF7wg6rB40ezwXtJDY7v2INxyMI
   etBoC1mpSk7PZQ/nxPYKCzPnYY6fhMxWju2sRjhx2E6t3G1xhkNwFd3UC
   Q==;
X-CSE-ConnectionGUID: p70s/Ws4QjWhEuwFMa14/w==
X-CSE-MsgGUID: 4db1a5Y2Si2L57MqH52nEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="69696111"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="69696111"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 11:45:20 -0700
X-CSE-ConnectionGUID: BTyypEntR+uxYpxhedL9TQ==
X-CSE-MsgGUID: 3alDmkCzQIWO0Jd+9Wa4eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="153389444"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Jun 2025 11:45:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQVsT-000DmC-0S;
	Sat, 14 Jun 2025 18:45:17 +0000
Date: Sun, 15 Jun 2025 02:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] drm/i915/writeback: Init writeback connector
Message-ID: <202506150219.aATMI0sh-lkp@intel.com>
References: <20250613061550.2893526-5-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613061550.2893526-5-suraj.kandpal@intel.com>

Hi Suraj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc1 next-20250613]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-writeback-Add-function-that-takes-preallocated-connector/20250613-142752
base:   linus/master
patch link:    https://lore.kernel.org/r/20250613061550.2893526-5-suraj.kandpal%40intel.com
patch subject: [RFC PATCH 4/4] drm/i915/writeback: Init writeback connector
config: i386-randconfig-061-20250614 (https://download.01.org/0day-ci/archive/20250615/202506150219.aATMI0sh-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150219.aATMI0sh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150219.aATMI0sh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_writeback.c:72:34: sparse: sparse: symbol 'conn_funcs' was not declared. Should it be static?

vim +/conn_funcs +72 drivers/gpu/drm/i915/display/intel_writeback.c

    71	
  > 72	const struct drm_connector_funcs conn_funcs = {
    73		.fill_modes = drm_helper_probe_single_connector_modes,
    74		.reset = drm_atomic_helper_connector_reset,
    75		.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
    76		.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
    77	};
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
