Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4F719BA2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689869673; x=1721405673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tIMOuqo0GWBSiD7NXjRW+iFeQKszlTenQxOiSP319Tk=;
  b=M1/uNfAhLPSCh8hKswzo+BuYlE97o3fzCRghZbyLdbxxGGaNj31Vh996
   cljBV/LpOk2J6fvdFhf6d7mS8Gz8DtdtbU5BMNvciYARvoSgkb3qVHT2m
   thjzzSATEz0Z7fPUtt/XzQf+XhOpP4LjQ1kKxdao16X2IVUqiTg5CpXSw
   lsOZgYgcdK2vXFyFkjqP88TFiIrs5vPcfM+OdVCXOskosBjSBqHI0Mo27
   cokvuyAb2vuTag6e4G4x+6LC8r5C3WHo94VaJ6gUBb+1zJIiEgJZwX/bl
   Z05NbyPhVj2s+/lJ/ewo0PEVLJOctNkoeq0E4ZeOqOXqQtsjU5SJh9nBY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="430578710"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="430578710"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 09:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814591665"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="814591665"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2023 09:12:57 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMWGu-0006FB-1R;
	Thu, 20 Jul 2023 16:12:56 +0000
Date: Fri, 21 Jul 2023 00:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [linux-next:master 2315/3762] drivers/iio/adc/max14001.c:81:29:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202307210041.jT6femhS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c58c49dd89324b18a812762a2bfa5a0458e4f252
commit: ba2c3e63b681b624e0158775620ee2f89cc7e266 [2315/3762] iio: adc: max14001: New driver
config: arc-randconfig-r093-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210041.jT6femhS-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210041.jT6femhS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210041.jT6femhS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/max14001.c:81:29: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] __x @@     got restricted __be16 [usertype] @@
   drivers/iio/adc/max14001.c:81:29: sparse:     expected unsigned short [usertype] __x
   drivers/iio/adc/max14001.c:81:29: sparse:     got restricted __be16 [usertype]
>> drivers/iio/adc/max14001.c:81:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] spi_tx_buffer @@     got int @@
   drivers/iio/adc/max14001.c:81:27: sparse:     expected restricted __be16 [usertype] spi_tx_buffer
   drivers/iio/adc/max14001.c:81:27: sparse:     got int
   drivers/iio/adc/max14001.c:97:29: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] __x @@     got restricted __be16 [usertype] @@
   drivers/iio/adc/max14001.c:97:29: sparse:     expected unsigned short [usertype] __x
   drivers/iio/adc/max14001.c:97:29: sparse:     got restricted __be16 [usertype]
   drivers/iio/adc/max14001.c:97:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] spi_tx_buffer @@     got int @@
   drivers/iio/adc/max14001.c:97:27: sparse:     expected restricted __be16 [usertype] spi_tx_buffer
   drivers/iio/adc/max14001.c:97:27: sparse:     got int

vim +81 drivers/iio/adc/max14001.c

    64	
    65	static int max14001_read(void *context, unsigned int reg_addr, unsigned int *data)
    66	{
    67		struct max14001_state *st = context;
    68		int ret;
    69	
    70		struct spi_transfer xfers[] = {
    71			{
    72				.tx_buf = &st->spi_tx_buffer,
    73				.len = sizeof(st->spi_tx_buffer),
    74				.cs_change = 1,
    75			}, {
    76				.rx_buf = &st->spi_rx_buffer,
    77				.len = sizeof(st->spi_rx_buffer),
    78			},
    79		};
    80	
  > 81		st->spi_tx_buffer = bitrev16(cpu_to_be16(FIELD_PREP(MAX14001_ADDR_MASK,
    82									reg_addr)));
    83	
    84		ret = spi_sync_transfer(st->spi, xfers, ARRAY_SIZE(xfers));
    85		if (ret)
    86			return ret;
    87	
    88		*data = bitrev16(be16_to_cpu(st->spi_rx_buffer)) & MAX14001_DATA_MASK;
    89	
    90		return 0;
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
