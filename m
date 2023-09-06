Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EEC6AB1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 19:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694028902; x=1725564902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bThXP9udiT2K0k0/PBjbCzwlo+2gcgoQZIlWb5VyksI=;
  b=FRvfc051l9+G1RBfJKmoBKV3/CP1exfCMdk886IJ3XaFUD5d/C+3l1A/
   8iUIJi7iLSmGpXkI48inGxVePz34FGHHgfhTRlBvZwoKmg4h9RcP1K26S
   wGN+QEvzLW+Acs9Of0DkZr6Az1ramO35NFH0/JWm39r4psHRlSAv8hhcz
   aIeKFmKhR1RW9KsTYEbOIjFdakAjzp6qKPU5c/YwxuenQ0BJuEdwav9xd
   lt6KW+1eyXFJhBOzg0FNJjyJaUO74gZv7DzjzUmwiOsBywbswGB524j+z
   PzS/E+HuylOY1Q0U6XxSEbXSisvpoQSZ6EV3ccniTI5wWSn/VlNoHgJN5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379872672"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="379872672"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 12:34:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="884862746"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="884862746"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2023 12:34:45 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdyIh-0000XL-0J;
	Wed, 06 Sep 2023 19:34:55 +0000
Date: Thu, 7 Sep 2023 03:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: Liam Beguin <liambeguin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 50/62] drivers/iio/adc/ltc2309.c:160:6: sparse:
 sparse: symbol 'ltc2309_regulator_disable' was not declared. Should it be
 static?
Message-ID: <202309070324.csMEOclK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   184d37294d1b4f21a2a625be10133aafb270d591
commit: ca4c617015ff7803b72a2afc1bd45c9c5b570492 [50/62] iio: adc: add ltc2309 support
config: i386-randconfig-061-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070324.csMEOclK-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070324.csMEOclK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070324.csMEOclK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iio/adc/ltc2309.c:127:16: sparse: sparse: cast to restricted __be16
>> drivers/iio/adc/ltc2309.c:160:6: sparse: sparse: symbol 'ltc2309_regulator_disable' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
