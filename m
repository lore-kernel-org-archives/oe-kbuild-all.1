Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF35121FF2E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 03:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769312149; cv=none; b=FW/NUafmSSPQdsNoFrU8vNZuxC7pbE7Os2H9jdGjqB1XxYvewW0Gm8mI5qqFbzjKqSIMWRrP/1R64CEpYm+NwKYz8AFP/pmfo0xD19SpHDlru79Rqiuee3Z6irR0wE/mZEs8SZ7wCi2hRcMOAl5HVNI8XhpGKaEOVPo3g+bK7d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769312149; c=relaxed/simple;
	bh=JQsEoEhcC6Fa65vcPyk1EB2QxzTkYGIcCTd96/um7l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyFTLADDgg7jeTbvuY3tsNv5M9+GIqI43RarLFexs6fLHYS558g3y0ti+6bcCy/9fYgFJwpYEfYiQmBrBChQdRV0gAQera5FvNWfoEPi3Eq2KNnSH/9OYyaVnHIysf0nf0g94X/MtTRItGDKIIdgcwZMfITsyHGmJ+t9A4gl9mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9/47vQh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9/47vQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769312147; x=1800848147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JQsEoEhcC6Fa65vcPyk1EB2QxzTkYGIcCTd96/um7l8=;
  b=E9/47vQhlT1c+s7AMA+alIfFozQ5ocT2jBdg1BMAD2d18XxYqdygI8+d
   ORYZRx504u3IZSZsQRphUFZslu1KBb4zcmefNj564ieE6n5WaqfB+wAuD
   xQCvj0XPxdTIAOqTLmLj70sJFJYe9XogDnF1kPWGBwc6CDtPb1Jn89LHa
   PTMuSLQpvJ9n/G+6wXNgiyFaw2wiyT9mVQX/KSOedCXJFxOS6vKpMhQF8
   sxHKxJZA5H4cO6nc3KjYa05jYfDPM7OtW2jtg/Cx3Nz/tEI0l8lBq9Hel
   uzvrjjeJe1nhmqBxStSq1u9bjQ9Jg4/rGwISGH2UcL/FWd5TiSoHGUA8u
   A==;
X-CSE-ConnectionGUID: SIwkne4zRbqopbQaLmXRcA==
X-CSE-MsgGUID: /A9R5xs2R92D2/OGQUOp4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="81887380"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="81887380"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 19:35:46 -0800
X-CSE-ConnectionGUID: p9J6Em+ARi27w2zGUpiipw==
X-CSE-MsgGUID: BcSlIp6QRVyQADtTe9wmkA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jan 2026 19:35:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjqud-00000000Vis-0UMk;
	Sun, 25 Jan 2026 03:35:43 +0000
Date: Sun, 25 Jan 2026 11:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yuhao Huang <nekowong743@gmail.com>, linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-kernel@vger.kernel.org, Yuhao Huang <nekowong743@gmail.com>
Subject: Re: [PATCH] gpio: virtuser: fix UAF in configfs release path
Message-ID: <202601251126.ywFiWrat-lkp@intel.com>
References: <20260124162111.3945666-1-nekowong743@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124162111.3945666-1-nekowong743@gmail.com>

Hi Yuhao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.19-rc6 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuhao-Huang/gpio-virtuser-fix-UAF-in-configfs-release-path/20260125-002359
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260124162111.3945666-1-nekowong743%40gmail.com
patch subject: [PATCH] gpio: virtuser: fix UAF in configfs release path
config: m68k-randconfig-r073-20260125 (https://download.01.org/0day-ci/archive/20260125/202601251126.ywFiWrat-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251126.ywFiWrat-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-virtuser.c:1685 gpio_virtuser_device_config_group_release() warn: inconsistent indenting

vim +1685 drivers/gpio/gpio-virtuser.c

  1680	
  1681	static void gpio_virtuser_device_config_group_release(struct config_item *item)
  1682	{
  1683		struct gpio_virtuser_device *dev = to_gpio_virtuser_device(item);
  1684	
> 1685	    scoped_guard(mutex, &dev->lock) {
  1686	        if (gpio_virtuser_device_is_live(dev))
  1687	            gpio_virtuser_device_deactivate(dev);
  1688	    }
  1689	
  1690		mutex_destroy(&dev->lock);
  1691		ida_free(&gpio_virtuser_ida, dev->id);
  1692		kfree(dev);
  1693	}
  1694	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
