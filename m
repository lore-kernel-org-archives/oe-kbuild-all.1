Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D2F22CBF1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 00:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771462579; cv=none; b=WvrPNrT204yrv6r2hSAElMJLd1nEFrUzMscWY63zR6HG8CIxTK3gKm/o2nTF0+xVoBAlP1KCU8+Q20ppZ/zga1IAHFQtLPvxGPpWf20xfNn7EwobHIQGOe+YvO8NhLc5bY1fWSClVg/G3Tv695JtfQI2xb8JtjR7iTY8hEqQDX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771462579; c=relaxed/simple;
	bh=Kkta6q1NPdS+f8/+hjixo1fW+HfKIUnUAlcLmBweuxs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DXfhzHmB4frBF+TqEBakYglEgSOwNeUTa70HhreSRGkhcCxaItHshXj9K7DA0sbbTkMvCqmBUeL9YY341TwrWL2niS4P3Px1pnxO03khv2HMIWvnJUOcSwMDlDJ/aje+cxRw/Kf/TPWHt1rJAdKnVWfR4KQJNaCHeE0lgwKsZuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ak1wq4h8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ak1wq4h8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771462577; x=1802998577;
  h=date:from:to:cc:subject:message-id;
  bh=Kkta6q1NPdS+f8/+hjixo1fW+HfKIUnUAlcLmBweuxs=;
  b=Ak1wq4h8j2XyQEYkvgfwx8h14PlhIgdfKSJarJx+P9oWxnRwY+Olp+4f
   tDH5GY2H9WvuogpoNk6nfnldQ4zd2NV8zj1EDYzbD3enciNvPCEgf/0To
   vjl2mY2ED6fo8bsN8xPHYZLAzrjNLybSDWlRLa9b39i3ZbA9zbggBJ8gk
   ubTaUXcwIa6muX9itk/OT6Rlw0kIm5ga5huvqae2EGsapqhRrCk+j67bH
   MkKCtgv0FeZSlsisagETBV0yOI+m8Pj1XBVWrC3km6dnjwzUuy59TUAhi
   vLgDIM/N8s81XiflqweBFHukyOCvQLirq/4EEwe4FCDqOhSqD0yHsIg09
   Q==;
X-CSE-ConnectionGUID: 8pLfxetnSR6IE656s1Kn2g==
X-CSE-MsgGUID: hk2ADDLESVm2fRWsl1Zzzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="89958285"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="89958285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 16:56:17 -0800
X-CSE-ConnectionGUID: fYF1tNoRQlGefYZ2o93LJA==
X-CSE-MsgGUID: QyH7B/jWShqM9A7UQM1lPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="213085991"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Feb 2026 16:56:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vssKz-000000012qu-0OC1;
	Thu, 19 Feb 2026 00:56:13 +0000
Date: Thu, 19 Feb 2026 08:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:prtpbf 8/12]
 drivers/hwtracing/coresight/coresight-cti-sysfs.c:835:13: warning: unused
 variable 'size'
Message-ID: <202602190852.CLoIo642-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux prtpbf
head:   183ff67aea429409014d667994833a8a6523f3d3
commit: 93bc7d516822048f98184aa69a13bad5921eb580 [8/12] coresight: don't use bitmap_print_to_pagebuf()
config: arm-randconfig-001-20260219 (https://download.01.org/0day-ci/archive/20260219/202602190852.CLoIo642-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190852.CLoIo642-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190852.CLoIo642-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/coresight/coresight-cti-sysfs.c: In function 'print_chan_list':
>> drivers/hwtracing/coresight/coresight-cti-sysfs.c:835:13: warning: unused variable 'size' [-Wunused-variable]
     835 |         int size, i;
         |             ^~~~


vim +/size +835 drivers/hwtracing/coresight/coresight-cti-sysfs.c

1bf82857b42b8b Mike Leach  2020-03-20  829  
1bf82857b42b8b Mike Leach  2020-03-20  830  static ssize_t print_chan_list(struct device *dev,
1bf82857b42b8b Mike Leach  2020-03-20  831  			       char *buf, bool inuse)
1bf82857b42b8b Mike Leach  2020-03-20  832  {
1bf82857b42b8b Mike Leach  2020-03-20  833  	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
1bf82857b42b8b Mike Leach  2020-03-20  834  	struct cti_config *config = &drvdata->config;
1bf82857b42b8b Mike Leach  2020-03-20 @835  	int size, i;
1bf82857b42b8b Mike Leach  2020-03-20  836  	unsigned long inuse_bits = 0, chan_mask;
1bf82857b42b8b Mike Leach  2020-03-20  837  
1bf82857b42b8b Mike Leach  2020-03-20  838  	/* scan regs to get bitmap of channels in use. */
e3044065fc2cf1 Yeoreum Yun 2025-03-06  839  	raw_spin_lock(&drvdata->spinlock);
1bf82857b42b8b Mike Leach  2020-03-20  840  	for (i = 0; i < config->nr_trig_max; i++) {
1bf82857b42b8b Mike Leach  2020-03-20  841  		inuse_bits |= config->ctiinen[i];
1bf82857b42b8b Mike Leach  2020-03-20  842  		inuse_bits |= config->ctiouten[i];
1bf82857b42b8b Mike Leach  2020-03-20  843  	}
e3044065fc2cf1 Yeoreum Yun 2025-03-06  844  	raw_spin_unlock(&drvdata->spinlock);
1bf82857b42b8b Mike Leach  2020-03-20  845  
1bf82857b42b8b Mike Leach  2020-03-20  846  	/* inverse bits if printing free channels */
1bf82857b42b8b Mike Leach  2020-03-20  847  	if (!inuse)
1bf82857b42b8b Mike Leach  2020-03-20  848  		inuse_bits = ~inuse_bits;
1bf82857b42b8b Mike Leach  2020-03-20  849  
1bf82857b42b8b Mike Leach  2020-03-20  850  	/* list of channels, or 'none' */
1bf82857b42b8b Mike Leach  2020-03-20  851  	chan_mask = GENMASK(config->nr_ctm_channels - 1, 0);
1bf82857b42b8b Mike Leach  2020-03-20  852  	if (inuse_bits & chan_mask)
93bc7d51682204 Yury Norov  2026-01-14  853  		return scnprintf(buf, rest_of_page(buf), "%*pbl\n",
93bc7d51682204 Yury Norov  2026-01-14  854  				 config->nr_ctm_channels, &inuse_bits);
93bc7d51682204 Yury Norov  2026-01-14  855  
93bc7d51682204 Yury Norov  2026-01-14  856  	return sprintf(buf, "\n");
1bf82857b42b8b Mike Leach  2020-03-20  857  }
1bf82857b42b8b Mike Leach  2020-03-20  858  

:::::: The code at line 835 was first introduced by commit
:::::: 1bf82857b42b8b5eb0e5c64db09529b2df477367 coresight: cti: Add sysfs trigger / channel programming API

:::::: TO: Mike Leach <mike.leach@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
