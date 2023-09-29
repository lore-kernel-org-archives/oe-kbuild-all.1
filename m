Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74CF1A5BB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695993620; x=1727529620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4mOAQtO7qWckhm1BptDApCPMi9PDM2ZDVUhH73vjxtI=;
  b=MbgMYkwqGb+KGT5rRu37rxClKMTTHloirTg+vW+bjABNtVj+SqM5G+AE
   YxC2IBp1upWKEIhmkmLaRuKGoPaNL9xcUAnhbsoSQbIlWnINHmXdwNiik
   xEEM6xYnXCVskILd8wVNp9IQDHrsktG+kkFn9oD3rtI8pSW5vQqdxNQuI
   lY9sG1NVncbrByR/bjgGdg5N3807q8FAE/WrysafN+5fpIGsJpIn+EEEu
   8Ymfue6+YtmGTdql/aUxoUUHo+KgSiUtTCIQKT0lfEubvZhYsfMadk/WX
   FVlUOlOvJvmuQfTh8zb3x/Mb3QRWC6oJN7AfMlnmw/X40NFF/edFeD/ig
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="898354"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="898354"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 06:20:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="815601771"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="815601771"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2023 06:20:07 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmDPZ-0002sl-1r;
	Fri, 29 Sep 2023 13:20:05 +0000
Date: Fri, 29 Sep 2023 21:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 1332/1370]
 drivers/mtd/spi-nor/winbond.c:45:5: sparse: sparse: symbol
 'spi_nor_multi_die_sr_ready' was not declared. Should it be static?
Message-ID: <202309292119.2yXbHD0v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 7342243138c02416497c48547572f560c8364f87 [1332/1370] mtd: spi-nor: For Winbond flashes with multiple die check WIP of each die
config: i386-randconfig-063-20230929 (https://download.01.org/0day-ci/archive/20230929/202309292119.2yXbHD0v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309292119.2yXbHD0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309292119.2yXbHD0v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/spi-nor/winbond.c:45:5: sparse: sparse: symbol 'spi_nor_multi_die_sr_ready' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
