Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2FF129E9C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723193787; cv=none; b=rE+RYqMxEkYEN+FcS1SLlnntKwRlHY7FwcenULriPoLlsDpxCFOmpHRRA89cQR2fiUZih9YqoJE9110mk1tNGtRPjr4gEKF8nGAnt/mDB1BGHRYAQM4BXwzaNrFsDEunmmn4FFt9AYdbuyVoveRd5Aac+qKfgBnhwn+vYJRGlt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723193787; c=relaxed/simple;
	bh=HMAdrLUy0LmAe2ehyMaLPR3GZURAfsek8hN/s/GdU6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4NO9O6s+alg7q4UUuNVc8nSe4RHwq3mq5xLn0OJZpHyxa29Uxm1H0xjHtINvx7xqZUEQa1ewDEP3WJECE9sCTKIwHVCzouHGlWYIyGLT5dvyPjdmTgEHtjUD5HUJ69jlE7+eGS0vy0w4ed/QP+ELI77UTs/OtWtnsHX0/eTCbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdQD9cGD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdQD9cGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723193786; x=1754729786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HMAdrLUy0LmAe2ehyMaLPR3GZURAfsek8hN/s/GdU6c=;
  b=CdQD9cGDdRQMqgKw8ZaNbXlzv8G9Fw/fxl/leHFrTUjCiWwN466MNoQB
   yN0Io0N5Z6+PnDuIvp8nShfBEZyMa4veXkSQqmXaWCUjCSD6tuyPJmWwJ
   GLsGsteW/zULJtDS3y6Vlr1O4XipIGZ01CyDAaMKiVSNbHGANOV3w9YCA
   aJ7c4M0yf6kGtO0G6p/PfQURLhDvf5LoCJkNsZfHFSB2PSaILUI5jLHc1
   bPsfc652gJOqOH7xpnTngghT4xFTeU7mC6ppkbGiodiFUh0Xwy450ir7b
   72zgm/eN5jBkj83QIY6AKtpLZdCaVqMP0N59b1n2ztty6Aqh932vZ7WH3
   w==;
X-CSE-ConnectionGUID: xP8v9Qj9T/KNbU9reiiZig==
X-CSE-MsgGUID: 7Bb6o6kETqyFDBWM5GdOsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32507062"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="32507062"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 01:56:24 -0700
X-CSE-ConnectionGUID: sVVLTz5TSOyPjZyOTh6puQ==
X-CSE-MsgGUID: Sf8YWyDES66z3js0qQxtHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="57163869"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 09 Aug 2024 01:56:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scLQ4-0007iC-30;
	Fri, 09 Aug 2024 08:56:20 +0000
Date: Fri, 9 Aug 2024 16:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 5/6] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <202408091602.lbNPJAzJ-lkp@intel.com>
References: <20240808095931.2649657-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808095931.2649657-6-wenst@chromium.org>

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on broonie-regulator/for-next wsa/i2c/for-next linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/of-dynamic-Add-of_changeset_update_prop_string/20240808-181544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240808095931.2649657-6-wenst%40chromium.org
patch subject: [PATCH v4 5/6] platform/chrome: Introduce device tree hardware prober
config: sh-randconfig-002-20240809 (https://download.01.org/0day-ci/archive/20240809/202408091602.lbNPJAzJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408091602.lbNPJAzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408091602.lbNPJAzJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/platform/chrome/chromeos_of_hw_prober.o: in function `chromeos_i2c_component_prober':
>> chromeos_of_hw_prober.c:(.text+0x2c): undefined reference to `i2c_of_probe_component'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
