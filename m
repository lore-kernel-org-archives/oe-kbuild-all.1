Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D51817C7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691479316; x=1723015316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SdSpbmHPdrm055MWG/kqx48iO85LrvM6GgzHFX9aRDc=;
  b=azCmKvnxyvieP0DeH7SN7EqV9CfPBV91gstXWSXFs6j0t6I+LnOwZXzw
   aS5HrxamZE+bnqpcyF+aytmruQe6KJQakfPDZxrmuoDm3fkQ76xNW2OHT
   7H+XoKk3OYe5FnncBLt/u09wTTZMupTNhLbkslF0BXGJMIKGYhikmADHo
   bB1hOayujtzV2cjw5xKxWyFtgVxzwgrHu3MWH2X5UDjRphVP4SrdjU4AM
   bYGXjIJQFv7a9sJg9cOlnevhQEuhFltsV03qemQGMdZRSPT6L6fAvKP2f
   5iUXN5wHL4zK54+MsdoR+6yRjIIwnqmlo82T+o94xw9O5KvOSVlmI0pu9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="360834609"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="360834609"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681140892"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="681140892"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 00:21:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTH2M-0005CU-2H;
	Tue, 08 Aug 2023 07:21:50 +0000
Date: Tue, 8 Aug 2023 15:21:30 +0800
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
Subject: Re: [PATCH 01/41] mtd: spi-nor: remove catalyst 'flashes'
Message-ID: <202308081547.u3Nmtq1F-lkp@intel.com>
References: <20230807-mtd-flash-info-db-rework-v1-1-3d3d5bef4ba4@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-1-3d3d5bef4ba4@kernel.org>

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on f7dc24b3413851109c4047b22997bd0d95ed52a2]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Walle/mtd-spi-nor-remove-catalyst-flashes/20230807-213321
base:   f7dc24b3413851109c4047b22997bd0d95ed52a2
patch link:    https://lore.kernel.org/r/20230807-mtd-flash-info-db-rework-v1-1-3d3d5bef4ba4%40kernel.org
patch subject: [PATCH 01/41] mtd: spi-nor: remove catalyst 'flashes'
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230808/202308081547.u3Nmtq1F-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081547.u3Nmtq1F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081547.u3Nmtq1F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/mtd/spi-nor/catalyst.o', needed by 'drivers/mtd/spi-nor/spi-nor.o'.
   make[6]: Target 'drivers/mtd/spi-nor/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
