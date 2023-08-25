Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92B6322B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 19:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692992827; x=1724528827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NnTF+jRylX6pqFhPQQzonaRAuTlvz5MKVdA6jmYJrOw=;
  b=PBZkBm9sZHnOD2ZfATZVJLddzZxJDxZtfUN07tBpd/C2cSsTT9PDB/wN
   vCTlU79XEhimdcehaagPIAFuZ8rHhe00/aZWJZCFV5qgN1oUPGL+a8Llz
   qMm+byxzJ2h2PuVTYiGhO8KwBI3uQ9Aa4n73RCFJcmTKn7swh7ClmJgAt
   jylrQyQv4OwquXrHe2hfZxibrjNfkD4rarOLwYJ6mufATuMa9O0pQBED1
   MjxAewDDAo7xA1E2wmoZUXRmD23uhZyqfHyLiJIiFd+YgP5Kx5ArcJ1vg
   GRDO6BY+5K2PgPyjk5l6+ZpCcy/iF1mgvav3K+/+ECScINP3CJLEbP8Wg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="461153549"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="461153549"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 12:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="807637391"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="807637391"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 25 Aug 2023 12:47:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZclq-0003xd-0U;
	Fri, 25 Aug 2023 19:47:02 +0000
Date: Sat, 26 Aug 2023 03:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Liam Beguin <liambeguin@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	Liam Beguin <liambeguin@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: add ltc2309 support
Message-ID: <202308260324.RYZ1IVWw-lkp@intel.com>
References: <20230825-ltc2309-v2-2-6d75f2b3fb50@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825-ltc2309-v2-2-6d75f2b3fb50@gmail.com>

Hi Liam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a5e505a99ca748583dbe558b691be1b26f05d678]

url:    https://github.com/intel-lab-lkp/linux/commits/Liam-Beguin/dt-bindings-iio-adc-add-lltc-ltc2309-bindings/20230826-022412
base:   a5e505a99ca748583dbe558b691be1b26f05d678
patch link:    https://lore.kernel.org/r/20230825-ltc2309-v2-2-6d75f2b3fb50%40gmail.com
patch subject: [PATCH v2 2/2] iio: adc: add ltc2309 support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230826/202308260324.RYZ1IVWw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260324.RYZ1IVWw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260324.RYZ1IVWw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/ltc2309.c:163:6: warning: no previous prototype for 'ltc2309_regulator_disable' [-Wmissing-prototypes]
     163 | void ltc2309_regulator_disable(void *regulator)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ltc2309_regulator_disable +163 drivers/iio/adc/ltc2309.c

   162	
 > 163	void ltc2309_regulator_disable(void *regulator)
   164	{
   165		struct regulator *r = (struct regulator *)regulator;
   166	
   167		regulator_disable(r);
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
