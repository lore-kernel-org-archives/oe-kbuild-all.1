Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D689659
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 09:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691485498; x=1723021498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dRwKRnc0pAlIZ3Hy9o9z180pyWvTYpsms8EmAZLR4Bo=;
  b=oHv6436SNtGnLJ2sMX+sJq00QJ34zrmIx4G6vpSn7sogVXnaQD2eNJX+
   eIdHS3nflFndGurnIzSY322lsvV/DpdQvPuNBrYt4A/GlrJDlS1Ksdehc
   bS8K7uudWFKnqgFLeTe8zifSuVu2OB73/l4RC1irzc3GlkFmpwi48ggAE
   Hv5z2ERhsFML08sq5RDUuS+5B55NTkaY4oqMVOadlWtkJrPnXQ9TVJ+Nw
   Bt5fyyrn+5SFw7RJRnJ0HJON7Hn5r59TpQbHVxD0EdPSq8i9Ib26zOu6t
   nWIBIKc1KAyaHdn+7u6M8tPA4Bhjv2cpRN1bd8BihzMaF7LDuf/OfV0fq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370757089"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="370757089"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 02:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766300747"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="766300747"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Aug 2023 02:04:54 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTIe5-0005FI-1h;
	Tue, 08 Aug 2023 09:04:53 +0000
Date: Tue, 8 Aug 2023 17:04:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <mwalle@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 02/41] mtd: spi-nor: remove Fujitsu MB85RS1MT support
Message-ID: <202308081613.cFbUU2bQ-lkp@intel.com>
References: <20230807-mtd-flash-info-db-rework-v1-2-3d3d5bef4ba4@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-2-3d3d5bef4ba4@kernel.org>

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on f7dc24b3413851109c4047b22997bd0d95ed52a2]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Walle/mtd-spi-nor-remove-catalyst-flashes/20230807-213321
base:   f7dc24b3413851109c4047b22997bd0d95ed52a2
patch link:    https://lore.kernel.org/r/20230807-mtd-flash-info-db-rework-v1-2-3d3d5bef4ba4%40kernel.org
patch subject: [PATCH 02/41] mtd: spi-nor: remove Fujitsu MB85RS1MT support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230808/202308081613.cFbUU2bQ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081613.cFbUU2bQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081613.cFbUU2bQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/mtd/spi-nor/fujitsu.o', needed by 'drivers/mtd/spi-nor/spi-nor.o'.
   make[6]: Target 'drivers/mtd/spi-nor/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
