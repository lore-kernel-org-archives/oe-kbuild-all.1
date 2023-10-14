Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA321FA5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUsEsOjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697288668; x=1728824668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W7kHswW9ep3XN1WWlBnJkpgxpjomcG5JrPEDsAuoJFE=;
  b=kUsEsOjfHWJbRuMX0ewY+NSNo+vq1bnAVox8mRhIR45wV3y/xEh5u+Bw
   Ihs8jCHFiGRJx8BDhOTvGRUjCAIaMahrNQpVSTjOlCQxcTlmsQfU19QML
   e3elBgV2x6r9+T64mi40ekovgt9T++gW43fipMUjLZej4SRFpd1UWYDUm
   IcOL9F4WlYSKybmzOvePG9pl3xr7ehoyM/Zjzn8LXRGLyn/mVc8TbtOZu
   BZUHHm8tvHm4P0qoXv37VBytsfMnC32Gsv9Xmtxc7bU7bLoSn+NuilSKN
   c6XG325y/K87Rq5Eoy4uWfH75Xffl2Tlv91XCEycIQlLRyBB1+OjTGD1e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="382553790"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="382553790"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 06:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825370946"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="825370946"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Oct 2023 06:04:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qreJc-0006Ax-23;
	Sat, 14 Oct 2023 13:04:24 +0000
Date: Sat, 14 Oct 2023 21:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:togreg 185/185] drivers/iio/resolver/ad2s1210.c:1498:34:
 warning: 'ad2s1210_of_match' defined but not used
Message-ID: <202310142018.yTjEtloR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
head:   291e45eeeb901b1d22b74ac5ea48cab3c407c705
commit: 291e45eeeb901b1d22b74ac5ea48cab3c407c705 [185/185] iio: resolver: ad2s1210: move out of staging
config: i386-randconfig-062-20231014 (https://download.01.org/0day-ci/archive/20231014/202310142018.yTjEtloR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142018.yTjEtloR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142018.yTjEtloR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/resolver/ad2s1210.c:1498:34: warning: 'ad2s1210_of_match' defined but not used [-Wunused-const-variable=]
    1498 | static const struct of_device_id ad2s1210_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~


vim +/ad2s1210_of_match +1498 drivers/iio/resolver/ad2s1210.c

817e5c65c511d4 drivers/staging/iio/resolver/ad2s1210.c Graf Yang     2010-10-27  1497  
382c7fce7005b5 drivers/staging/iio/resolver/ad2s1210.c Nishad Kamdar 2018-10-31 @1498  static const struct of_device_id ad2s1210_of_match[] = {
382c7fce7005b5 drivers/staging/iio/resolver/ad2s1210.c Nishad Kamdar 2018-10-31  1499  	{ .compatible = "adi,ad2s1210", },
382c7fce7005b5 drivers/staging/iio/resolver/ad2s1210.c Nishad Kamdar 2018-10-31  1500  	{ }
382c7fce7005b5 drivers/staging/iio/resolver/ad2s1210.c Nishad Kamdar 2018-10-31  1501  };
382c7fce7005b5 drivers/staging/iio/resolver/ad2s1210.c Nishad Kamdar 2018-10-31  1502  MODULE_DEVICE_TABLE(of, ad2s1210_of_match);
382c7fce7005b5 drivers/staging/iio/resolver/ad2s1210.c Nishad Kamdar 2018-10-31  1503  

:::::: The code at line 1498 was first introduced by commit
:::::: 382c7fce7005b55f0583cf5905758d2b8def803a staging: iio: ad2s1210: Add device tree table.

:::::: TO: Nishad Kamdar <nishadkamdar@gmail.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
