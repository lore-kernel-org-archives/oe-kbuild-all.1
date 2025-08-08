Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1C22B8C2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754645518; cv=none; b=fY4ItwJefnPBBKjawDX/M1qqjyF6bQliDaqa2n3rZJlW+VMadXnX2h42l1OwaLDPr5RFUC77tPV5ex+IYiGk9NEnzbaoGg64LWiheKunXqzz9UYYfRoyS0bkjJ6SbSWKtYesOp4goIt4kauhbvh2LYsaAP6aouMZsZdiu3Sh9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754645518; c=relaxed/simple;
	bh=lDllMP+m/RiG5oMGLCjQmdOQbwdh6dJhxzDD5PUSP4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFu+nIzapVHFEV2hMit3JYlMDJxNYBWiMv1Po4gOMjix/RkegZTgzunZHgIS65xSDB3WGm/MGzDdUW2UK3XMANH9aY/3MAR8ZVs0mUM2H9vWc31esxii0fIhzUn4UWB4L3tECnkurJ0FSE+aCuOobnfc62BrK/ffC6jvkpmUFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOBRLNyI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOBRLNyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754645516; x=1786181516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lDllMP+m/RiG5oMGLCjQmdOQbwdh6dJhxzDD5PUSP4o=;
  b=eOBRLNyI7EjXRWV/KkH7trgtW50GVUf7GFvb4rQHbk58IwMyDZ0h16Yx
   fqdXtjTuv0Xg9DmFGenl5FYTRiJiuMnq7X/gA8ydQymCdH7Mumb3O5eL9
   nqKI+dUov2i1QCuxjPLVCBJGk3putB6SmNgdz3pUd7tuKAPqEYeYYLOaY
   J2AtM8TmjbtO07c6JvyDpJp767oIreJiyDmOBLsKqa206fUnSFfWt6Bs0
   4Qk5yotusRZo3SGDQIyVAZr17GTgOPMYb89VkxCgiQjoMTZap2ehRzJjQ
   FJMrDhb57vPGh1TYvqwA/7OVIItrnJ1tg/AlTZ93qIpnNEAQhvjQL518v
   w==;
X-CSE-ConnectionGUID: L6+mHI+/SoWwIjtIhZ7RLg==
X-CSE-MsgGUID: 9P6CXqYWQeyVilBXjwkc7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60835158"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="60835158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 02:31:56 -0700
X-CSE-ConnectionGUID: jByCP4F9T+uQz3ePcetYSQ==
X-CSE-MsgGUID: da9ed4sOQuOl9obbI/pE2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="196112755"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Aug 2025 02:31:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukJRl-0003ko-2z;
	Fri, 08 Aug 2025 09:31:43 +0000
Date: Fri, 8 Aug 2025 17:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [RFC PATCH v4] ethtool: add FEC bins
 histogramm report
Message-ID: <202508081713.5ytoW3xo-lkp@intel.com>
References: <20250807155924.2272507-1-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807155924.2272507-1-vadfed@meta.com>

Hi Vadim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]
[also build test WARNING on tnguy-net-queue/dev-queue net/main net-next/main linus/master v6.16 next-20250808]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/ethtool-add-FEC-bins-histogramm-report/20250808-000418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20250807155924.2272507-1-vadfed%40meta.com
patch subject: [Intel-wired-lan] [RFC PATCH v4] ethtool: add FEC bins histogramm report
config: sparc-randconfig-002-20250808 (https://download.01.org/0day-ci/archive/20250808/202508081713.5ytoW3xo-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081713.5ytoW3xo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508081713.5ytoW3xo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/intel/ice/ice_ethtool.c:4627 function parameter 'hist' not described in 'ice_get_fec_stats'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
