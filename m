Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425DF111A8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 03:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733801677; cv=none; b=qui2IxRoGK9SLMoaPeoIlYZPyBHQ5GWOYLZ65ijhRtEMRGJa+0U3LDiGBvk5Hx8kJFyKdn2N87T5RlIve2jobBV+131x18QZkLNkgQHunNSG0/bmFJnQlclEvmmjkYYvOLjAdBkUdUipzqIQgJvRd94rAta50trikRV6iLCmy2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733801677; c=relaxed/simple;
	bh=tC5sfZkk4Drn7ar2VZmaMdGE6e5QEN5J+RQv5ssQKcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkZHw+8g/B3xHLC8dzuppR0kvM/NMN7pS2W0boOKeexQGmdCFoyIOiWLaCpOM8NkSAwCeqAEp2lQ2qcXn6pWbRZkkIxygnOiPfPsihvRyICjDXj0dnB4zXD2sbRR6+0/8fbsBasx5oBKMudmlRuZQwE/4RW1eyBr7blpidMVVMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAxt9/4k; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAxt9/4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733801675; x=1765337675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tC5sfZkk4Drn7ar2VZmaMdGE6e5QEN5J+RQv5ssQKcw=;
  b=TAxt9/4kIviiSohGkq75rpBPEs84ZRPmUucNGAgNHki6udvBIyft3/WC
   v8VMHJZY5MxrPWWzpGtcnl5HtTdVy9wVf4Aom5B3U0z1nv4CHvbGKVPHB
   qXQEnjo3NqjIvx9gCx5C1caFn9rs6ogRATqaAjwRofC1keBoSDy6S9VP+
   3Buese4MbHlFpp83UnxBcY2QjNJ34w9Euk6U8XmPNM5itz1UZnAMCB+WY
   yWyoOanRMCSXDZRFDJ6i+aTO2YZAl5Kge+lDceL0apw37wWhhg7Mnw3xb
   h1sRV7PuiyT3lze8PyVr2cCzBcxfDT4jILvOOI5RiXPk+bD9Ua7pqhcpJ
   A==;
X-CSE-ConnectionGUID: 8JO2deS/STeX7TdTAc/BkQ==
X-CSE-MsgGUID: itV64Bl+Rl2rgw3+z/zZAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="51662000"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="51662000"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 19:34:35 -0800
X-CSE-ConnectionGUID: gixyEk7mTTaeByWNsAwl/A==
X-CSE-MsgGUID: PO2Eow9wSEKTVqJsOGM6FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="94976880"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Dec 2024 19:34:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKr15-00054L-1M;
	Tue, 10 Dec 2024 03:34:31 +0000
Date: Tue, 10 Dec 2024 11:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 05/10] drm/xe: Add histogram support to Xe builds
Message-ID: <202412101133.WdDoP1Cm-lkp@intel.com>
References: <20241209162504.2146697-6-arun.r.murthy@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209162504.2146697-6-arun.r.murthy@intel.com>

Hi Arun,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-R-Murthy/drm-crtc-Add-histogram-properties/20241210-003717
base:   linus/master
patch link:    https://lore.kernel.org/r/20241209162504.2146697-6-arun.r.murthy%40intel.com
patch subject: [PATCH 05/10] drm/xe: Add histogram support to Xe builds
config: parisc-randconfig-001-20241210 (https://download.01.org/0day-ci/archive/20241210/202412101133.WdDoP1Cm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101133.WdDoP1Cm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101133.WdDoP1Cm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xe/xe.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
