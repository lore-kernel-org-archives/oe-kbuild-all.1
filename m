Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AB418D63A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 05:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736744924; cv=none; b=s9r4AN2c5XDpiUNxENBGyd0vsVRjgEteizeYe2kKoiNgHn2UZuIZPjdK+5qy+b5JLsMG2+2tkoN68jS2Z7D/thE+m1I9xmPhtiGV+Ctvj0phU1w0+guOESaZXjPjQiIglnXIxOM20OB6ERQkTIwVfKB5fCGoFnFDfAyHqoI11FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736744924; c=relaxed/simple;
	bh=ArPy/548WidrUTR+84pfAh3tFxk7khSyvwWhHCUJ3y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O5Nc2v0AfqWYjYD2M0ZZj61quMnXJjJfOpJ92kGcuNPQM+jP3VHKXjqdF/BzZ4gsO21+bjKOLrPZCNHynfzDygzVRNw8qfvZg9rPorcXjwA6KxvdaRj/PVm0Om556zp+ueSP+x+FttnRpLs4GRI6ZS2NGE+rjsDTFEnWgqDzACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYvJK8cm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYvJK8cm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736744921; x=1768280921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ArPy/548WidrUTR+84pfAh3tFxk7khSyvwWhHCUJ3y4=;
  b=YYvJK8cmY3NXcm1r/0HKVRV8Liy3ocDTTXTY+WCALe+48wX0b2inB7/F
   eVCDVAEiAfFcGoWVW4M7LW6cJDCNrtfvp7UnhR+9k792aBsR3povQz1f3
   aX2aKpwU+AXOEQ0VNUdiHkf/uJ/PNysmvffC7YmoRC9oRPM+ec1tIUMKc
   GgUXtK2OgulssI9l7ttW+JU/1SGZErC78wmMQ5/j9/EhTSvYQV7QOk3em
   /Alwb+vXkxrVZhoOKiUbS/WrHElksfeFB/xHNpY1s5cCcz3a8qZ4OsTt/
   5Bgmf7SS361mm2TCsGAD0wTS12sW1vOVZpu8E6gWrOMzo4RrSd33Af0B3
   A==;
X-CSE-ConnectionGUID: /wT14ovcQDmj6uzS7HVPZA==
X-CSE-MsgGUID: bqmlLZXqSceLk8+Oc1BhcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="54403796"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="54403796"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 21:08:41 -0800
X-CSE-ConnectionGUID: UlzDzdlqRZuWlWflnO0arA==
X-CSE-MsgGUID: LpYH51kiTV+xhasnjZYYig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104148969"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jan 2025 21:08:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXCgm-000MjD-34;
	Mon, 13 Jan 2025 05:08:36 +0000
Date: Mon, 13 Jan 2025 13:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined
 but not used
Message-ID: <202501131220.hPs8onrh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andy,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bc55a333a2f7316b58edc7573e8e893f7acb532
commit: 879a52379704e479237d0b97822fd9302fed0675 iio: multiplexer: Make use of device properties
date:   2 years, 9 months ago
config: x86_64-randconfig-122-20240831 (https://download.01.org/0day-ci/archive/20250113/202501131220.hPs8onrh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501131220.hPs8onrh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501131220.hPs8onrh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined but not used [-Wunused-const-variable=]
     134 | static const struct of_device_id adg792a_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/adg792a_of_match +134 drivers/mux/adg792a.c

afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  133  
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14 @134  static const struct of_device_id adg792a_of_match[] = {
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  135  	{ .compatible = "adi,adg792a", },
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  136  	{ .compatible = "adi,adg792g", },
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  137  	{ }
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  138  };
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  139  MODULE_DEVICE_TABLE(of, adg792a_of_match);
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  140  

:::::: The code at line 134 was first introduced by commit
:::::: afda08c4caa9489511557def51e322a5f2142a2f mux: adg792a: add mux controller driver for ADG792A/G

:::::: TO: Peter Rosin <peda@axentia.se>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
