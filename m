Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5887D288E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692882912; x=1724418912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HLtSQzorvekjVAi0PvIJApzeCXrGB+ljwyl3KphrlBI=;
  b=FqRWAUd9T0h6YHQF0XQSDaJhfo/wbwJ/ZDy9s0uKtUbzUFP/tqvIrnuO
   CPBcb+tIfRmbcMltmm4elU2ofrrH92B2PlTg2CZtVhbFbwCy7noZL9Jjt
   RJ67U51tTMEQM0d8KYBwOzY1RTXi4rq6A0SBb6cjTbro2G8eo2RmA0qkM
   GUuzob4ThcaEi6zVrP+G1R9xmZQOsVyvebA+bBYr37vWJp/R3kYmAiDy1
   KZ32S9yBUzBUZPEodyroE6G9+fCjDbio1blNtNNSEjv59e01iGMgED+lp
   oEl9zaNXVtKsGLPSMFv9dfV0MuG8HcrrBeDcgfs91lLPtpn/D3J8e1mAd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="460792020"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="460792020"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="1067815186"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="1067815186"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2023 06:15:10 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZAB2-0002hG-32;
	Thu, 24 Aug 2023 13:15:08 +0000
Date: Thu, 24 Aug 2023 21:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/base/regmap/regmap-raw-ram.c:24:24: sparse: sparse: cast to
 restricted __be16
Message-ID: <202308242106.UpZawCLc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   93f5de5f648d2b1ce3540a4ac71756d4a852dc23
commit: 65dd2f671875b1d97b6fa9bcf7677f5e1c55f776 regmap: Provide a ram backed regmap with raw support
date:   2 months ago
config: i386-randconfig-061-20230823 (https://download.01.org/0day-ci/archive/20230824/202308242106.UpZawCLc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308242106.UpZawCLc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308242106.UpZawCLc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/regmap/regmap-raw-ram.c:24:24: sparse: sparse: cast to restricted __be16
>> drivers/base/regmap/regmap-raw-ram.c:26:24: sparse: sparse: cast to restricted __le16

vim +24 drivers/base/regmap/regmap-raw-ram.c

    18	
    19	static unsigned int decode_reg(enum regmap_endian endian, const void *reg)
    20	{
    21		const u16 *r = reg;
    22	
    23		if (endian == REGMAP_ENDIAN_BIG)
  > 24			return be16_to_cpu(*r);
    25		else
  > 26			return le16_to_cpu(*r);
    27	}
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
