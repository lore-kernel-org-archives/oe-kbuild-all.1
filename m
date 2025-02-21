Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254AF1FA16B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 04:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740111972; cv=none; b=YO5AAJfAA/1pTGsywCTqcIfdHNdjBXsPBkhTbvtw6I6TcA1bGsX1PT4Jg0V24LXLxulT1xEcr1+g0cTJSPOe4Ynwja1DoYi3pRu6FpR9O9ZTkWbhW2GF1sj9pdsrwXkIjtxHNTJIqjIZPQezX4d1SbLMs6UYGtca34VETRvQ7iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740111972; c=relaxed/simple;
	bh=syo3d7bvXoQZ1Do7oJJt+kB47y3Omr8QxkTUMYzdx68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7IsmOuKNfatTjI0m26DYeuAbCZeAXnpV6iNY37X5t+Nrh3R/5tJqN4WZ/b8JTi+EyVyqH/NP8VSEdaSxxQwrgeaahxDr9xUna7h+n8/HjCt76K33GGuwJopiXDp0h2E2jmmT+l2S5E8Tb1JGzKgkuL86qCis8O4MmZDZRyNzRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHVXNymu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHVXNymu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740111970; x=1771647970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=syo3d7bvXoQZ1Do7oJJt+kB47y3Omr8QxkTUMYzdx68=;
  b=YHVXNymu01tVM3IrdxVK2mPnL3KGRn0bGj8PY73MXdqfeOQhqUeJwKeo
   f8bAzeYKy36C+3otZzEjxkA+hIlXVigkEF8qBREdSDDSFZ/p99Cgh7zo6
   YP0g8T8PeU4YrNbw0+FbsixR48/BY/rghYZJGUJ1Gq6pCoEuOugXM8HSv
   lFIuXXDdnBcpl2qiusiYiNVlXoZW8rlQm5c3SW0dZLuzK1io9xXc6ifJ1
   zkb4k0shlN5VvNHK9cn95MMsxJuotdrMiIsHw9hfmr0+/f1n0FQX+LC3f
   94nTEw0Vbba2Lqclqb7hpp4Wcqv2BnrmVa5JNruXX3kBftHJ/U+KxPWes
   w==;
X-CSE-ConnectionGUID: nm3MsO7cTA6zs/4XJtqHGA==
X-CSE-MsgGUID: Mi2v70rATAmfokww9/FMbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="43751870"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="43751870"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 20:26:09 -0800
X-CSE-ConnectionGUID: hs3wJB+dRrC4cKIlmbbA/Q==
X-CSE-MsgGUID: KRLS4/NLRca3eS1l1QkBuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="114973185"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Feb 2025 20:26:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlKc1-00056j-1X;
	Fri, 21 Feb 2025 04:26:05 +0000
Date: Fri, 21 Feb 2025 12:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, matthew.d.roper@intel.com
Subject: Re: [PATCH 3/4] drm/xe: Drop usage of TIMESTAMP_OVERRIDE
Message-ID: <202502211245.wEClyBRb-lkp@intel.com>
References: <20250221003843.443559-9-matthew.d.roper@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221003843.443559-9-matthew.d.roper@intel.com>

Hi Matt,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250220]
[cannot apply to drm-xe/drm-xe-next v6.14-rc3 v6.14-rc2 v6.14-rc1 linus/master v6.14-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Roper/drm-i915-display-Make-refclk-fetching-logic-reusable/20250221-084058
base:   next-20250220
patch link:    https://lore.kernel.org/r/20250221003843.443559-9-matthew.d.roper%40intel.com
patch subject: [PATCH 3/4] drm/xe: Drop usage of TIMESTAMP_OVERRIDE
config: i386-buildonly-randconfig-003-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211245.wEClyBRb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211245.wEClyBRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211245.wEClyBRb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_irq.c:12:
>> drivers/gpu/drm/xe/display/xe_display.h:77:12: warning: 'xe_display_get_refclk' defined but not used [-Wunused-function]
      77 | static u32 xe_display_get_refclk(struct xe_device *xe) { return 38400; }
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/xe_display_get_refclk +77 drivers/gpu/drm/xe/display/xe_display.h

    76	
  > 77	static u32 xe_display_get_refclk(struct xe_device *xe) { return 38400; }
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
