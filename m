Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3676E60F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712163969; cv=none; b=XaqVsWqcIsZu4IUggsSE40B2Cg2L/jKqqhPgIbPgW/fvGeM1okTph5z5z9KN5nFQin7Q+QcXfdKh1/IpovdnuTPBPssGEzTY7jWtve7dKTeseYA92M0wzbnJkr3rqfnfT3AqtVvmQ4g3S34T1p5AIbOZl9s1A9X2+lVYIZZjMOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712163969; c=relaxed/simple;
	bh=4CQL/TxHMePJD1ZTCsPXKKZJ8ilB9UkZf7mZW0VsfPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X+dVbsuPJjfGOyYZrQmdBa7O9CRwveYymcdCZYlrDKbjR3bezOGkGFVFj/PUFEtYh+ikvfO/BEwJxdJ6YtKX/wY5SiFQXSDcs4Hf4xeHCjzFeh5he6BsYVsQIUvkyBU/0Stk4lQ60KXkNkI0vlfj8AdnGmBsodkpPLSk/8/WfBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8LMR3E2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8LMR3E2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712163968; x=1743699968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4CQL/TxHMePJD1ZTCsPXKKZJ8ilB9UkZf7mZW0VsfPY=;
  b=Q8LMR3E24swEcVWck/BF8c0Wh1IaL6WS5Y6sJTbKsD7w8NO5zrX1V31c
   G51stJd9KJkwBFJBWAieN3J616KamUl0bNNMqjJaJCwKxbr4Co5SPETBW
   iqlW3RDXB78RDevBq3I4cw59BqiY8t0l+n6Gpnd4/CIIS34KrpiObogJn
   oIEzgs0l9AVxstnteShOjhD686GikyttIGKwDnjwSsh88kai+WliPji39
   z3PtMC87I1+5F3fkNXk8HZxCSmeQL5osv2TARmVK64PVaDrNOtE0Ew+rH
   Q6d5xbwHXJNdBQwgdGwiOmx/klkTaD+xat6UYWlNe6tXgRH993+I7TpBL
   g==;
X-CSE-ConnectionGUID: luaw6WHORM+3+HAGLUfnRw==
X-CSE-MsgGUID: FXT87ECWTbyxY4XgaxMlgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11237674"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="11237674"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 10:06:07 -0700
X-CSE-ConnectionGUID: AyDUef9WQZOSH4ELFsIoWA==
X-CSE-MsgGUID: T2w9WmsPTz+rSiMawHQiDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18613038"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Apr 2024 10:06:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs43m-00005S-2x;
	Wed, 03 Apr 2024 17:06:02 +0000
Date: Thu, 4 Apr 2024 01:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-sm8450-sm8550-on-next 21/21]
 sound/soc/codecs/wsa884x.c:1847:35: warning: variable 'sd_n' set but not
 used
Message-ID: <202404040026.Odz0rMuf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-sm8450-sm8550-on-next
head:   3ba68b9cfd2e22408df8721e01e8c114a01c1135
commit: 3ba68b9cfd2e22408df8721e01e8c114a01c1135 [21/21] DEBUG TESTING
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240404/202404040026.Odz0rMuf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040026.Odz0rMuf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040026.Odz0rMuf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/wsa884x.c: In function 'wsa884x_get_reset':
>> sound/soc/codecs/wsa884x.c:1847:35: warning: variable 'sd_n' set but not used [-Wunused-but-set-variable]
    1847 |                 struct gpio_desc *sd_n;
         |                                   ^~~~


vim +/sd_n +1847 sound/soc/codecs/wsa884x.c

  1826	
  1827	static int wsa884x_get_reset(struct device *dev, struct wsa884x_priv *wsa884x)
  1828	{
  1829		wsa884x->sd_reset = devm_reset_control_get_optional_shared(dev, NULL);
  1830		if (IS_ERR(wsa884x->sd_reset))
  1831			return dev_err_probe(dev, PTR_ERR(wsa884x->sd_reset),
  1832					     "Failed to get reset\n");
  1833		else if (wsa884x->sd_reset)
  1834			return 0;
  1835		dev_err(dev, "AAA %s:%d\n", __func__, __LINE__);
  1836		/*
  1837		 * else: NULL, so use the backwards compatible way for powerdown-gpios,
  1838		 * which does not handle sharing GPIO properly.
  1839		 */
  1840		wsa884x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
  1841							GPIOD_OUT_HIGH);
  1842		if (IS_ERR(wsa884x->sd_n))
  1843			return dev_err_probe(dev, PTR_ERR(wsa884x->sd_n),
  1844					     "Shutdown Control GPIO not found\n");
  1845		dev_err(dev, "AAA %s:%d\n", __func__, __LINE__);
  1846		{
> 1847			struct gpio_desc *sd_n;
  1848			sd_n = devm_gpiod_get_optional(dev, "powerdown2",
  1849							GPIOD_OUT_HIGH);
  1850			pr_err("AAA %s:%d\n", __func__, __LINE__);
  1851			if (IS_ERR(wsa884x->sd_n))
  1852				return dev_err_probe(dev, PTR_ERR(wsa884x->sd_n),
  1853						     "Shutdown Control GPIO not found\n");
  1854		}
  1855		dev_err(dev, "AAA %s:%d\n", __func__, __LINE__);
  1856	
  1857		return 0;
  1858	}
  1859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
