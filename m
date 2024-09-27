Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A14EEAA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 04:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727411819; cv=none; b=oNc8k0vJszjVkVYw6rF8Vf/xh6B46ydZlR6yUggMEk/N9mK/EGVosvzinwpi+joJt/MmxFVrjN6BEUxBFd65NzctA1V7snFTuuIr4+RvBkoxTM5Ro8xxjjnRBx5+rSgNoX+IUf+N6Y4A1zQjle3QySRaWBQKWOMHNr3uwps/aeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727411819; c=relaxed/simple;
	bh=gTtFEX0iZCxkO+vX5Cd7wU5OwzjCLHW/VMCV1WegFEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eW4XUd86fh0yNEk1a7RYwuxgzvfRzkwUnTpJRmbRoP92igQE5b7sTi8YU1RsCOAnDUkjrXopJY6dHrtGso5ZJiXeofFrMYZo1yAKjy/spQIhIYhOWp1j2XB4VSr+2cVtMBynQt7peasHQqsGh4+KkyhJdVqZVnbbvPT9DXdh3p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCVJapmu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCVJapmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727411817; x=1758947817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gTtFEX0iZCxkO+vX5Cd7wU5OwzjCLHW/VMCV1WegFEw=;
  b=eCVJapmuHsxeE8yO3UkJOP/ggs/PcpBTj5zsKuzk30txST9jL2QhT5Tb
   37k+HxtWEj/Uo2Kskl6Q77n2kIJaWjHNCVRb+dIUDGkrE6AV7Y0k1Rotc
   yq4gX2J0/VZmaiUwHXOk8OsBVbySMVCj0iEWwJtGplUTefksruwsxkpjM
   ccMXJ/0e9M3DIMTzZ0it9Dwsds20LJfUttsoLpar8/NYUQxmnEpxgV/3R
   RhDByMY3li6KyEY9nv65cGi3B0aVNaF5KntvaexyDnMADrv6nc07mGN+i
   XZjxEQ73o4TUtd/3lh8Zcit8JFiurWGfy5TG7H9skniK4Xrd03jYS58Gx
   w==;
X-CSE-ConnectionGUID: T3iLxuEKSxORdnKs/y1rQg==
X-CSE-MsgGUID: PchIo5dhRV2sYNawne19eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26416258"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26416258"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 21:36:57 -0700
X-CSE-ConnectionGUID: JDFhv+LwRnWfqlz+SeSgXA==
X-CSE-MsgGUID: rz30uHZOQ7CvYvlk7JwDgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="76462056"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2024 21:36:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su2ir-000LTz-1c;
	Fri, 27 Sep 2024 04:36:53 +0000
Date: Fri, 27 Sep 2024 12:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [clk-meson:clk-meson-next 11/11]
 drivers/clk/meson/meson8b.c:3700:23: warning: unused variable 'flags'
Message-ID: <202409271243.xjYHZS7H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/BayLibre/clk-meson.git clk-meson-next
head:   e736da1956cf0880a02ec5023f3487eea7611b5f
commit: e736da1956cf0880a02ec5023f3487eea7611b5f [11/11] clk: meson: meson8b: remove spinlock
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409271243.xjYHZS7H-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271243.xjYHZS7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271243.xjYHZS7H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/meson/meson8b.c: In function 'meson8b_clk_reset_update':
>> drivers/clk/meson/meson8b.c:3700:23: warning: unused variable 'flags' [-Wunused-variable]
    3700 |         unsigned long flags;
         |                       ^~~~~


vim +/flags +3700 drivers/clk/meson/meson8b.c

189621726bc2f6 Martin Blumenstingl 2017-07-28  3692  
189621726bc2f6 Martin Blumenstingl 2017-07-28  3693  static int meson8b_clk_reset_update(struct reset_controller_dev *rcdev,
189621726bc2f6 Martin Blumenstingl 2017-07-28  3694  				    unsigned long id, bool assert)
189621726bc2f6 Martin Blumenstingl 2017-07-28  3695  {
189621726bc2f6 Martin Blumenstingl 2017-07-28  3696  	struct meson8b_clk_reset *meson8b_clk_reset =
189621726bc2f6 Martin Blumenstingl 2017-07-28  3697  		container_of(rcdev, struct meson8b_clk_reset, reset);
189621726bc2f6 Martin Blumenstingl 2017-07-28  3698  	const struct meson8b_clk_reset_line *reset;
0d3051c790ed2e Martin Blumenstingl 2020-04-17  3699  	unsigned int value = 0;
0d3051c790ed2e Martin Blumenstingl 2020-04-17 @3700  	unsigned long flags;
189621726bc2f6 Martin Blumenstingl 2017-07-28  3701  
189621726bc2f6 Martin Blumenstingl 2017-07-28  3702  	if (id >= ARRAY_SIZE(meson8b_clk_reset_bits))
189621726bc2f6 Martin Blumenstingl 2017-07-28  3703  		return -EINVAL;
189621726bc2f6 Martin Blumenstingl 2017-07-28  3704  
189621726bc2f6 Martin Blumenstingl 2017-07-28  3705  	reset = &meson8b_clk_reset_bits[id];
189621726bc2f6 Martin Blumenstingl 2017-07-28  3706  
0d3051c790ed2e Martin Blumenstingl 2020-04-17  3707  	if (assert != reset->active_low)
0d3051c790ed2e Martin Blumenstingl 2020-04-17  3708  		value = BIT(reset->bit_idx);
0d3051c790ed2e Martin Blumenstingl 2020-04-17  3709  
93c873d6864616 Martin Blumenstingl 2018-07-21  3710  	regmap_update_bits(meson8b_clk_reset->regmap, reset->reg,
0d3051c790ed2e Martin Blumenstingl 2020-04-17  3711  			   BIT(reset->bit_idx), value);
189621726bc2f6 Martin Blumenstingl 2017-07-28  3712  
189621726bc2f6 Martin Blumenstingl 2017-07-28  3713  	return 0;
189621726bc2f6 Martin Blumenstingl 2017-07-28  3714  }
189621726bc2f6 Martin Blumenstingl 2017-07-28  3715  

:::::: The code at line 3700 was first introduced by commit
:::::: 0d3051c790ed2ef6bd91b92b07220313f06b95b3 clk: meson: meson8b: Fix the polarity of the RESET_N lines

:::::: TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
:::::: CC: Jerome Brunet <jbrunet@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
