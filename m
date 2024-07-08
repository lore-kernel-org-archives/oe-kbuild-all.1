Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A481514C3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720483123; cv=none; b=o0sucgOaakvUPRqgnpWjcWIAzrTrwQ95qxG/cPCWWqb4R701fR8tTg3barbjJDeITpHOLljNqLQWoLsZXAjwVfUgdMW3HvIbUAZ8Pg7Yf8xhvHDfa906Clqy5R0euNCMrhAY1q7p/APKF+DUGI0yfndoNwPtbmGeUbFAHLyPDBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720483123; c=relaxed/simple;
	bh=2TCn8fQ0aSpKFKwPnFZSKNe4i3sslkG6fdu5wkCW21M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7vkH7/QxYnCzMINXjh2hnaJyTBdSqBUE9d/ir1i3MQ+qViqWj/RqIizfoVyJ9cwJPh6m8XkkLZHgbfEU6IlhkGGNsNtaya1jqmPUPqIDhZVE/88JW7CdR7YzgmIMVokR+XfJl4RS7Q2KVG0zTR/IITCQNFsWliumZPh4QIke7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDzKDbre; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDzKDbre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720483122; x=1752019122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2TCn8fQ0aSpKFKwPnFZSKNe4i3sslkG6fdu5wkCW21M=;
  b=JDzKDbreXt9r+sk5gTJAhTDX8bXGARO/wTjL5HmLgnio8TLkauIxxfxT
   O/28e46qMPIkm8jsxTnkUqrwvEfAaddS+03ZghKfwP5LcwkfwWQmtwA9R
   cGKQ4p0nkyJw/tFXI99hKsEEDigusFVF2BaxTasVOuGw0t6jzs+Eak0ly
   8ElIL1V0Kl+HCDIYMgmta2AB7hddm9VOnMt5G7XqZOcje4OPEQnad9fK5
   X8hKWULw8ZYZnCPeJtM/rrBxmDBERJTXv3RW3ag9tLChj1L0M2SlWlU7Y
   PgPDjxLKYozcjiCriFd3BQway3g6PFVWQ6FBBNaRYtJwubqwp05bh+2il
   Q==;
X-CSE-ConnectionGUID: E6m8K11oSxeaEwi+s+jarg==
X-CSE-MsgGUID: Jhr6GHZ2S+6SNtbfnJv59A==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21523578"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="21523578"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 16:58:41 -0700
X-CSE-ConnectionGUID: F9V+XFLKTOWjV9Dcr1bz3Q==
X-CSE-MsgGUID: oOo0/W/3TEGycM9hGlmUtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="47754928"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2024 16:58:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQyFg-000W9K-2f;
	Mon, 08 Jul 2024 23:58:36 +0000
Date: Tue, 9 Jul 2024 07:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-iio-backend-add-debugfs 17/17]
 drivers/iio/adc/adi-axi-adc.c:93:22: warning: unused variable '__val'
Message-ID: <202407090700.tFpFNnTM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-iio-backend-add-debugfs
head:   4120536adfc0bc741c466d38ae50ffb9760576e3
commit: 4120536adfc0bc741c466d38ae50ffb9760576e3 [17/17] reset me
config: i386-buildonly-randconfig-001-20240709 (https://download.01.org/0day-ci/archive/20240709/202407090700.tFpFNnTM-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090700.tFpFNnTM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407090700.tFpFNnTM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/adc/adi-axi-adc.c: In function 'axi_adc_enable':
>> drivers/iio/adc/adi-axi-adc.c:93:22: warning: unused variable '__val' [-Wunused-variable]
      93 |         unsigned int __val;
         |                      ^~~~~


vim +/__val +93 drivers/iio/adc/adi-axi-adc.c

ef04070692a216 Michael Hennerich 2020-03-24   89  
794ef0e57854d7 Nuno Sa           2024-02-10   90  static int axi_adc_enable(struct iio_backend *back)
ef04070692a216 Michael Hennerich 2020-03-24   91  {
794ef0e57854d7 Nuno Sa           2024-02-10   92  	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
70a0e10f8ab62b Nuno Sa           2024-05-31  @93  	unsigned int __val;
21aa971d3e295c Nuno Sa           2023-12-07   94  	int ret;
ef04070692a216 Michael Hennerich 2020-03-24   95  
202b89f4b778d8 Nuno Sa           2024-05-31   96  	guard(mutex)(&st->lock);
794ef0e57854d7 Nuno Sa           2024-02-10   97  	ret = regmap_set_bits(st->regmap, ADI_AXI_REG_RSTN,
794ef0e57854d7 Nuno Sa           2024-02-10   98  			      ADI_AXI_REG_RSTN_MMCM_RSTN);
21aa971d3e295c Nuno Sa           2023-12-07   99  	if (ret)
21aa971d3e295c Nuno Sa           2023-12-07  100  		return ret;
ef04070692a216 Michael Hennerich 2020-03-24  101  
70a0e10f8ab62b Nuno Sa           2024-05-31  102  	/*
70a0e10f8ab62b Nuno Sa           2024-05-31  103  	 * Make sure the DRP (Dynamic Reconfiguration Port) is locked. Not all
70a0e10f8ab62b Nuno Sa           2024-05-31  104  	 * designs really use it but if they don't we still get the lock bit
70a0e10f8ab62b Nuno Sa           2024-05-31  105  	 * set. So let's do it all the time so the code is generic.
70a0e10f8ab62b Nuno Sa           2024-05-31  106  	 */
4120536adfc0bc Nuno Sa           2024-07-08  107  	//ret = regmap_read_poll_timeout(st->regmap, ADI_AXI_ADC_REG_DRP_STATUS,
4120536adfc0bc Nuno Sa           2024-07-08  108  	//			       __val, __val & ADI_AXI_ADC_DRP_LOCKED,
4120536adfc0bc Nuno Sa           2024-07-08  109  	//			       100, 1000);
4120536adfc0bc Nuno Sa           2024-07-08  110  	//if (ret)
4120536adfc0bc Nuno Sa           2024-07-08  111  	//	return ret;
70a0e10f8ab62b Nuno Sa           2024-05-31  112  
794ef0e57854d7 Nuno Sa           2024-02-10  113  	return regmap_set_bits(st->regmap, ADI_AXI_REG_RSTN,
794ef0e57854d7 Nuno Sa           2024-02-10  114  			       ADI_AXI_REG_RSTN_RSTN | ADI_AXI_REG_RSTN_MMCM_RSTN);
ef04070692a216 Michael Hennerich 2020-03-24  115  }
ef04070692a216 Michael Hennerich 2020-03-24  116  

:::::: The code at line 93 was first introduced by commit
:::::: 70a0e10f8ab62ba82b080347ca0a119e14e964c9 iio: adc: adi-axi-adc: make sure DRP is locked on enable

:::::: TO: Nuno Sa <nuno.sa@analog.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
