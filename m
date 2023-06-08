Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB624628
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 05:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686202170; x=1717738170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P6IeBoSJ/qlkLWwdk/qYbXDfSQ5Ov3/NCQOwa+v/uzg=;
  b=VrMBj3/WbceN7ZUrnejOLar03KV5pohT7ojx+m1gGzeDu3hrhQiM74Hr
   Q+5TQl1dJSA9pwB0cPUk10Esr9T2hrx4uUMhxcZtQVPvz/ESOOXvp8MB4
   y2yBFQRjh+91NyZYwvL+KX6/DsiRV/Q+JNaL+DXvfogsMuVejXx9v/1dc
   ej/vvy4IrXtbznW/2hm4RBjNwG0xB+AUEfbrIzmxiOXoyG3ZXh4VTZxTN
   giGKvS03QwN7ULHYgcshFTa+beCqQE0PBcbSkLx0fShRpa5/vt3ip5Jej
   0TbGdzcgHXLYNGG7m6KeKzC7oRr5Rf7VLbEiguFOOQHlNJof2tJVCLIMI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="385548646"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="385548646"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 22:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="712969491"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="712969491"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2023 22:29:28 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q78DA-0007KB-0E;
	Thu, 08 Jun 2023 05:29:28 +0000
Date: Thu, 8 Jun 2023 13:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH net-next v12 3/4] ice: add ability to
 read FW log data and configure the number of log buffers
Message-ID: <202306081332.iBSRrRh3-lkp@intel.com>
References: <20230607222443.119-4-paul.m.stillwell.jr@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607222443.119-4-paul.m.stillwell.jr@intel.com>

Hi Paul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-M-Stillwell-Jr/ice-remove-FW-logging-code/20230608-062658
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230607222443.119-4-paul.m.stillwell.jr%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v12 3/4] ice: add ability to read FW log data and configure the number of log buffers
config: parisc-randconfig-c003-20230608 (https://download.01.org/0day-ci/archive/20230608/202306081332.iBSRrRh3-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306081332.iBSRrRh3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ice/ice_fwlog.c:59:3-8: WARNING: NULL check before some freeing functions is not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
