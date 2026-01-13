Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B456B2D6E78
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316301; cv=none; b=YKbEfhnwLsXcBiJAzMNCaS1oRHAHwvUttgDPXPa7eMmoJ7LyN4c0xRme1GdLEyKos5KlTAdMXk8rHP1bjEV/b4DTyo5uBUQrUaE37ccHriIL/AzpJG9uKalMIrSnsBPjEBuqN270NPbip2qqUd7u79uurzEC3dhr08BcPwECGTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316301; c=relaxed/simple;
	bh=OmnMtX662btR77iUa1zvEko68M1Ld3hW70qvg0CZLDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7jmNhW6TVS8/srXxu5szlzp0AF/cOiRe7nNnqhV/j20T6T63c1Df+DHWy4ODmm8GC2wQDxYMnu6+f+6EH6qWdWfls/8XnXS15WFLb8o0tZBBg2SoOV1UA5cEUqTzucuXCRLLw3kFo81jvBXCYytqMmYTONnDnwy2ihvOeLAcCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5ipTEwg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5ipTEwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768316300; x=1799852300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OmnMtX662btR77iUa1zvEko68M1Ld3hW70qvg0CZLDA=;
  b=l5ipTEwgA2WA33IXZSm5W+YIagykNKLM9SOPWJwOm9sbK4B/UnbnQJHd
   mWbhr+f555S1meH+s6t6rJr8rXsLbySGDxQtOgx7kN79GAHTANws7EYZd
   7/b5LsUphX3eBOGQCSC1W83+paqg9jqVmTLZjP2fZBAJkXl6y8gMBsMHv
   FZ7qW+sTWqdH/wxrL7ZU25eJupf6Y/6YXwF61nyRqKfOzAg6Df2z5C7oO
   GpQH3BsNNMTkswT39tSelSaYyiBn1FuFqxG3o5HV+7QzgMp491yt9ip6L
   /NljySMOQ/B9XTl2soCGVDAcF8gmMRAxWg+j1Y4+brHhN3p0jYY1DRzBU
   Q==;
X-CSE-ConnectionGUID: 2s7sfVd9SVCnTiJVTJa+sA==
X-CSE-MsgGUID: s88WT20tQa+LBKmQzRgh3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69334072"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69334072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:58:19 -0800
X-CSE-ConnectionGUID: fcm3ABW8Rv+veYV7VWgZ8Q==
X-CSE-MsgGUID: gRIUg2RQR+mQXCpFRRcBzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235658196"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2026 06:58:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vffqY-00000000ExU-3EgU;
	Tue, 13 Jan 2026 14:58:14 +0000
Date: Tue, 13 Jan 2026 22:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: Siratul Islam <email@sirat.me>, andy@kernel.org, geert@linux-m68k.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Siratul Islam <email@sirat.me>
Subject: Re: [PATCH 3/4] auxdisplay: tm1637: Add driver for TM1637
Message-ID: <202601132253.Up9189vT-lkp@intel.com>
References: <20260113040242.19156-4-email@sirat.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113040242.19156-4-email@sirat.me>

Hi Siratul,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.19-rc5 next-20260113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Siratul-Islam/dt-bindings-vendor-prefixes-Add-titanmec/20260113-161216
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260113040242.19156-4-email%40sirat.me
patch subject: [PATCH 3/4] auxdisplay: tm1637: Add driver for TM1637
config: riscv-randconfig-002-20260113 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132253.Up9189vT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132253.Up9189vT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: recursive dependency detected!
   symbol AUXDISPLAY is selected by TM1637
   symbol TM1637 depends on AUXDISPLAY
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
