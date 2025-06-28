Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235CB21D3D9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 20:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751143389; cv=none; b=cREKUmE2hbXLv8ma/UoCsjQJnEAITSoQw6424IRGcSBDj+tVr8p6X/O4nhgH0A8Gg6dzULpidWyjBIwvsxz6XrBwTYKtQoAqMiOtvz3nZMVWqPk5il/Zlv9cLVMTMN0OQFt7e5DYYTAtyROi5VEnVaIxiz1dQZNfRxnQSZ2+rQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751143389; c=relaxed/simple;
	bh=Mc1uivMj6FIm2vMX5xs2uyKIhFKhB3l+qd+gQT+kvGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXfiP+M3WjmAONGxSA8pIUIlYi0khiagFdl985KJDB7XPEusB+Pe6VevzadvsJNBrkse98Kvfljy2r+OHXIhTFR7Z3oMw2SjWbQqQuRmwbbdJ0RitUWoFiqEyfy1jOJmZ0C8Z0lSjf+DdgVTCKD4czCoa/RaGHhJN0MqVxNE/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMibPX5h; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMibPX5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751143388; x=1782679388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mc1uivMj6FIm2vMX5xs2uyKIhFKhB3l+qd+gQT+kvGk=;
  b=PMibPX5hk3NHSbMXb1K+7pAlxkeeKbWj5dsH1Ou7F4IBD4uCwcba9ikC
   KBVFVozGlUUWHRuWr77fxIMadLuYoEJZsxPDAZ5rohTajTnk2QPXTpiEp
   jEt6IfzoDx1NzwYzLwAnRw2bE+oPs2AHe5WLQeFEJp33hndymxrHrTvOf
   pyeCEDU5UQ7k3fRk6if145LrPYMfVbsQECVcmxpJKRfFaP0cHjoGdL2As
   K1/NS/qW7zZ+E/jduB+fMd0ah6nzBp1FGGdX9bYIxLUH2uqGt6ASiDnrX
   D7Uou0h2zJBovfJG7ZHi9gKMiKwEK75EGb2JjGKNTDlafKHg7iL+0KKT3
   w==;
X-CSE-ConnectionGUID: 9bxVUmzBTVG5W5IS9jSiiQ==
X-CSE-MsgGUID: PWvM09/VRU+9Nk8Lh8rmnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53518363"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="53518363"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 13:43:07 -0700
X-CSE-ConnectionGUID: KB/m4uWmRNSrAUcjtmtp3g==
X-CSE-MsgGUID: Jpx4FdONQLq+rM4lVkAtEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="158808677"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Jun 2025 13:43:05 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVcO6-000XN8-1m;
	Sat, 28 Jun 2025 20:43:02 +0000
Date: Sun, 29 Jun 2025 04:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: Niranjan H Y <niranjan.hy@ti.com>, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andriy.shevchenko@linux.intel.com,
	tiwai@suse.de, alsa-devel@alsa-project.org, baojun.xu@ti.com,
	shenghao-ding@ti.com, liam.r.girdwood@intel.com, navada@ti.com,
	v-hampiholi@ti.com, niranjan.hy@ti.com
Subject: Re: [PATCH v2 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Message-ID: <202506290455.cgLfcmh1-lkp@intel.com>
References: <20250624153742.1507-2-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624153742.1507-2-niranjan.hy@ti.com>

Hi Niranjan,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niranjan-H-Y/ASoc-tac5x1x-add-codec-driver-tac5x1x-family/20250628-012714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250624153742.1507-2-niranjan.hy%40ti.com
patch subject: [PATCH v2 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
config: x86_64-rhel-9.4 (attached as .config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290455.cgLfcmh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290455.cgLfcmh1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: recursive dependency detected!
   symbol REGMAP_I2C is selected by SND_SOC_TAC5X1X_I2C
   symbol SND_SOC_TAC5X1X_I2C depends on REGMAP_I2C
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
