Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBC02B9DD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726237502; cv=none; b=biIOFYzAHcr82UMTBF7wDdiVhaOmYR4X+LQPMfStTaUzdo1csWB0UEAUWG0zL5NfGh8ZYXXJpRJyVB04P8SPn2irKADk6JgE44I5oS8DTlWLvInW+X7Lv/mjtDFFcjbn8dsqClmo6IxYq+c3pNK4rLrgFoYu8FzcLvQaiCJ9tNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726237502; c=relaxed/simple;
	bh=A7gJQW+ZPalgR9IoLMUerYEq6hGLsdNp59DAYpqkc5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4D+Wski91oGjEdHGGGxcuckAKUkqziGXwCpNb8qMU5iAU1hUgY/7P8lCVaQUxvFuFDbmdzIB01QE44uolYAWHACFPKVnHvauw0tp0w9WRxaWUL8EFxGSxT6mzjndvQCF2Ih/GUSERa+aej0h/zkZlrSr2lpZnlen1sQWjxLlKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kB3Kmk/P; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kB3Kmk/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726237500; x=1757773500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A7gJQW+ZPalgR9IoLMUerYEq6hGLsdNp59DAYpqkc5I=;
  b=kB3Kmk/PjDHux67y8a4a+mPOU1e41tDKwyVPe14wlsbj2JJVAiOaxTEi
   UHu1ifOR8VWXkB4UYe2KgTD/jnZU56k7quPr5/sSStdIymifnBRLaFpNI
   6nBLmFJBOXx4w9RLq9HRXu+76FFxDXUx/woQ9SSAS/QP8ywJXieTqFMUG
   KouXcwbUFXFJil1fJ//AbtXJJ05cR+H9vaoqIuh09gG4sF/y++92hAbLu
   OSa3sT7k7gBzDwqrbkoryO05FAZm3BXXDwTpGu8J5QaipiqJh86FBc/bA
   kQAvG08z/hNWC2I6Cw0+y2IrwwL5AFPvzBLYSLBozYy1+lrHG50f7D8gj
   w==;
X-CSE-ConnectionGUID: lN8U1qAnSd+F43lVcSEmzQ==
X-CSE-MsgGUID: ceEYeiq/RICPG+ZaPQc/PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25018612"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25018612"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:24:59 -0700
X-CSE-ConnectionGUID: XEd+FM9yQhms0UysG0d1RA==
X-CSE-MsgGUID: vZI4QjXiQ/+RpWcrVs5Fnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="91331721"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Sep 2024 07:24:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp7EG-0006aE-1P;
	Fri, 13 Sep 2024 14:24:56 +0000
Date: Fri, 13 Sep 2024 22:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <202409132211.2wgNymJ2-lkp@intel.com>
References: <20240911072751.365361-10-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-10-wenst@chromium.org>

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on next-20240913]
[cannot apply to robh/for-next wsa/i2c/for-next linus/master v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/of-dynamic-Add-of_changeset_update_prop_string/20240911-153237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20240911072751.365361-10-wenst%40chromium.org
patch subject: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware prober
config: i386-buildonly-randconfig-002-20240913 (https://download.01.org/0day-ci/archive/20240913/202409132211.2wgNymJ2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409132211.2wgNymJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409132211.2wgNymJ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/chrome/chromeos_of_hw_prober.c: In function 'chromeos_of_hw_prober_probe':
>> drivers/platform/chrome/chromeos_of_hw_prober.c:66:22: error: implicit declaration of function 'of_machine_is_compatible' [-Werror=implicit-function-declaration]
      66 |                 if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_machine_is_compatible +66 drivers/platform/chrome/chromeos_of_hw_prober.c

    60	
    61	static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
    62	{
    63		for (size_t i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
    64			int ret;
    65	
  > 66			if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
    67				continue;
    68	
    69			ret = hw_prober_platforms[i].prober(&pdev->dev, hw_prober_platforms[i].data);
    70			/* Ignore unrecoverable errors and keep going through other probers */
    71			if (ret == -EPROBE_DEFER)
    72				return ret;
    73		}
    74	
    75		return 0;
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
