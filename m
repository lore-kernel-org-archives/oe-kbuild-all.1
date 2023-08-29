Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60001EBF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 03:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693280817; x=1724816817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ninwmA3zMhf9RUq16DUTOFabf7QRtExygxEvVBZFNo=;
  b=GFYPdN2IodyCD4ogO0eXKwfYBHLIaiCZHB7tyy1BEurx4s65IZMSftZd
   cxAiGBtBprh/XCvv/FunKiDdqGfOjziPKvpvKpUYWErvv5IWr/Ma4wJg2
   D8AFdC8Vn5YhOioz8IGcyDVWmpv6Q3krlremJruWXSBLAkNi0bOaRO8JO
   49a0MRt6A/pweaEeDnv3+wh1DR0+RUOidZfQQ/tWbBwhw6oWPS8qndLgT
   xQTwnOltMEmB5SdZknVRJRgX8rMcRmdYkMHw8PDRR/xDAVlKvYIzkO/8w
   FZSjdU08zoce5Mnk9zm4sSu6xxX1drW6myCUWpikoAYynLZopFa+Se2E1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="355593221"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="355593221"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 20:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="803939188"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="803939188"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2023 20:46:54 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qapgs-0008M7-0F;
	Tue, 29 Aug 2023 03:46:54 +0000
Date: Tue, 29 Aug 2023 11:46:46 +0800
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
Subject: Re: [PATCH v3 2/2] iio: adc: add ltc2309 support
Message-ID: <202308291144.r2JZxP9a-lkp@intel.com>
References: <20230828-ltc2309-v3-2-338b3a8fab8b@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828-ltc2309-v3-2-338b3a8fab8b@gmail.com>

Hi Liam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a5e505a99ca748583dbe558b691be1b26f05d678]

url:    https://github.com/intel-lab-lkp/linux/commits/Liam-Beguin/dt-bindings-iio-adc-add-lltc-ltc2309-bindings/20230829-104615
base:   a5e505a99ca748583dbe558b691be1b26f05d678
patch link:    https://lore.kernel.org/r/20230828-ltc2309-v3-2-338b3a8fab8b%40gmail.com
patch subject: [PATCH v3 2/2] iio: adc: add ltc2309 support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230829/202308291144.r2JZxP9a-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291144.r2JZxP9a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291144.r2JZxP9a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/ltc2309.c:42: warning: Function parameter or member 'vref_mv' not described in 'ltc2309'


vim +42 drivers/iio/adc/ltc2309.c

    27	
    28	/**
    29	 * struct ltc2309 - internal device data structure
    30	 * @dev:	Device reference
    31	 * @client:	I2C reference
    32	 * @vref:	External reference source
    33	 * @lock:	Lock to serialize data access
    34	 * @vref_mv	Internal voltage reference
    35	 */
    36	struct ltc2309 {
    37		struct device		*dev;
    38		struct i2c_client	*client;
    39		struct regulator	*vref;
    40		struct mutex		lock; /* serialize data access */
    41		int			vref_mv;
  > 42	};
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
