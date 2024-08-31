Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782D92D611
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725090414; cv=none; b=B4BjYtwYdDWpZwZ+UjVXyY7TrdJyoyinPT051TX0cHLg13/tfhtj3sXsn26EEni0YKbjZgrparIfpZOBZGCdDmRyh7i4sZqPqfQlujOGUMGqBRi4789FBfaj6nox+HLH5RDjEUgnmAoZpRqQZmrqR6fZhL4biPwedIPJ2PbEM94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725090414; c=relaxed/simple;
	bh=IDqfzBp2gycYx+6mJvbFQFhZuk0cMNvyjdQ0p55SfMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPsBdylYWjqNJ3hHpFRcArhO81kiIuMbzOy9x8325Cwe2ciK7xA3c2004RysTufCcP7sI94TaJZYt9DZFY3nlw+awcOLEDLGuWG9agaO5bSvX4Quv385uD1lv30/Tct5z715V2b4Jhq2a9gRdeoWBvEtbEwLrl6oMkyPzDRQjT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwEvxOmg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwEvxOmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725090412; x=1756626412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IDqfzBp2gycYx+6mJvbFQFhZuk0cMNvyjdQ0p55SfMc=;
  b=TwEvxOmgXyoE11UKLET7lejHQ3fgpy2n3mDB6PTYatWBmDYdKlvGIOvv
   zY9skcUkQKsncGcFK0s4XkBwb6ut/wYZCuiH0mZK571a+k91SNhTWdg/z
   6zL0eMMm7/YEYkzh0aVd6Phty7X4Vs4onLB1Lr/nExXHO4AYfS2+l34T3
   d7vsG3SUbhnTvt+ebcbDuMJDhOm4OkyGmGH+pkeW4js90szrpWU3Ibycz
   /gvqGEzbzd04vxCubmN0f7vc+/AfQzhp2ur5weKkxHFnpvZRjO2H52Fl8
   JpqOVNXELQPP53CxD8CjNV86/xUzGovJEv2Cn7ByJLs9Th7zntY+8FVsT
   Q==;
X-CSE-ConnectionGUID: pnErxuijT1++vH328KzvmQ==
X-CSE-MsgGUID: OcyAwIJ5TBO69nR/eWgvgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23316044"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23316044"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 00:46:52 -0700
X-CSE-ConnectionGUID: pozlq3CUTdCXKN+MP/oBPA==
X-CSE-MsgGUID: /IP0e+M8SLGfcZSNm2XKog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64471779"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Aug 2024 00:46:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skIoq-0002R8-21;
	Sat, 31 Aug 2024 07:46:48 +0000
Date: Sat, 31 Aug 2024 15:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 4/6] media: i2c: og01a1b: Add support of xvclk supply
 clock in power management
Message-ID: <202408311514.uiDhMWqI-lkp@intel.com>
References: <20240830063459.3088895-5-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830063459.3088895-5-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master linus/master sailus-media-tree/master v6.11-rc5 next-20240830]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Zapolskiy/media-dt-bindings-Add-OmniVision-OG01A1B-image-sensor/20240830-143737
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240830063459.3088895-5-vladimir.zapolskiy%40linaro.org
patch subject: [PATCH v4 4/6] media: i2c: og01a1b: Add support of xvclk supply clock in power management
config: i386-randconfig-002-20240831 (https://download.01.org/0day-ci/archive/20240831/202408311514.uiDhMWqI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311514.uiDhMWqI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311514.uiDhMWqI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/media/i2c/og01a1b.c:5:
   drivers/media/i2c/og01a1b.c: In function 'og01a1b_power_on':
>> drivers/media/i2c/og01a1b.c:981:49: warning: integer overflow in expression of type 'long int' results in '-397934592' [-Woverflow]
     981 |         unsigned long delay = DIV_ROUND_UP(8192 * USEC_PER_SEC, OG01A1B_MCLK);
         |                                                 ^
   include/uapi/linux/const.h:34:40: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   drivers/media/i2c/og01a1b.c:981:31: note: in expansion of macro 'DIV_ROUND_UP'
     981 |         unsigned long delay = DIV_ROUND_UP(8192 * USEC_PER_SEC, OG01A1B_MCLK);
         |                               ^~~~~~~~~~~~


vim +981 drivers/media/i2c/og01a1b.c

   977	
   978	/* Power/clock management functions */
   979	static int og01a1b_power_on(struct device *dev)
   980	{
 > 981		unsigned long delay = DIV_ROUND_UP(8192 * USEC_PER_SEC, OG01A1B_MCLK);
   982		struct v4l2_subdev *sd = dev_get_drvdata(dev);
   983		struct og01a1b *og01a1b = to_og01a1b(sd);
   984		int ret;
   985	
   986		ret = clk_prepare_enable(og01a1b->xvclk);
   987		if (ret)
   988			return ret;
   989	
   990		if (og01a1b->xvclk)
   991			usleep_range(delay, 2 * delay);
   992	
   993		return 0;
   994	}
   995	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
