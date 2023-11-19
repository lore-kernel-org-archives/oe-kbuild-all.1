Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684C479FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eB9MzaCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700413547; x=1731949547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E1U/gQflmsw99DNKfasX3Bet2pCG3XvfEbcIg8BGrsc=;
  b=eB9MzaCItqihLj4q6NHgCxlk3O6tdV5jvyQtXuqJ2Kxdq+E+E/RsPeL/
   uUCYw8We2EcOe0AmYZd47qp03ETU7+82kYJHcm7rojhM0Yt21/MAb0djE
   4UQs/FGciMJ8g6uZtUzSqssRcqDD3RBh6xo7B1CUHVInaZ00kjMkvcfmz
   Gc1zNmAH+EwmDIsghWK1PfIutNerTnpHwwlR7N/g9T0ZHaDkWxfYTfT4X
   QxK23BqnNx20+rh9hl0nOpe4Gb8j3DpvagKiqyoJRNLW6a3cDZP1MlHjk
   Clai4DAptlsGnFdSHCqaZAqE7rCMSJlH1z07h6WMGq8DqgvItTfd+nL4M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="391293437"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="391293437"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 09:05:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="7486272"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Nov 2023 09:05:43 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4lEU-0005Kv-1e;
	Sun, 19 Nov 2023 17:05:22 +0000
Date: Mon, 20 Nov 2023 01:04:51 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Xiaoxu <zhangxiaoxu@huawecloud.com>, zhangxiaoxu5@huawei.com,
	weiyongjun1@huawei.com, linux-kernel@vger.kernel.org,
	broonie@kernel.org, rostedt@goodmis.org, mingo@redhat.com,
	frowand.list@gmail.com, linux-spi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 -next 2/4] spi: mockup: Add register spi device support
Message-ID: <202311200018.xB4hEnZx-lkp@intel.com>
References: <20231118104442.861759-3-zhangxiaoxu@huawecloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118104442.861759-3-zhangxiaoxu@huawecloud.com>

Hi Zhang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231117]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Xiaoxu/spi-mockup-Add-SPI-controller-testing-driver/20231118-184747
base:   next-20231117
patch link:    https://lore.kernel.org/r/20231118104442.861759-3-zhangxiaoxu%40huawecloud.com
patch subject: [PATCH v4 -next 2/4] spi: mockup: Add register spi device support
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311200018.xB4hEnZx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200018.xB4hEnZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200018.xB4hEnZx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function '__target_online',
       inlined from 'spi_mockup_target_live_store' at drivers/spi/spi-mockup.c:161:9:
>> drivers/spi/spi-mockup.c:108:9: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
     108 |         strncpy(info.modalias, target->device_id,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     109 |                 strlen(target->device_id));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-mockup.c:108:9: note: length computed here
     108 |         strncpy(info.modalias, target->device_id,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     109 |                 strlen(target->device_id));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +108 drivers/spi/spi-mockup.c

    87	
    88	static int __target_online(struct spi_mockup_target *target)
    89	{
    90		struct spi_board_info info = {0};
    91		struct device *dev;
    92	
    93		if (target->spi)
    94			return -EBUSY;
    95	
    96		if (!target->host->pdev)
    97			return -ENODEV;
    98	
    99		target->chip = find_first_zero_bit(target->host->bitmap,
   100						   MOCKUP_CHIPSELECT_MAX);
   101		if (target->chip < 0)
   102			return target->chip;
   103	
   104		if (target->chip > target->host->num_cs)
   105			return -EBUSY;
   106	
   107		info.chip_select = target->chip;
 > 108		strncpy(info.modalias, target->device_id,
   109			strlen(target->device_id));
   110	
   111		target->spi = spi_new_device(target->host->ctrl, &info);
   112		if (!target->spi)
   113			return -ENOMEM;
   114	
   115		bitmap_set(target->host->bitmap, target->chip, 1);
   116	
   117		dev = &target->host->ctrl->dev;
   118		dev_info(dev, "Instantiated device %s at 0x%02x\n",
   119			 info.modalias, info.chip_select);
   120	
   121		return 0;
   122	}
   123	
   124	static int __target_offline(struct spi_mockup_target *target)
   125	{
   126		struct device *dev;
   127	
   128		if (!target->spi)
   129			return -ENODEV;
   130	
   131		dev = &target->host->ctrl->dev;
   132		dev_info(dev, "Deleting device %s at 0x%02hx\n",
   133			 dev_name(&target->spi->dev), target->chip);
   134	
   135		spi_unregister_device(target->spi);
   136		target->spi = NULL;
   137	
   138		bitmap_clear(target->host->bitmap, target->chip, 1);
   139	
   140	
   141		return 0;
   142	}
   143	
   144	static ssize_t
   145	spi_mockup_target_live_store(struct config_item *item,
   146				     const char *buf, size_t len)
   147	{
   148		struct spi_mockup_target *target = to_spi_mockup_target(item);
   149		int ret;
   150		bool res;
   151	
   152		ret = kstrtobool(buf, &res);
   153		if (ret)
   154			return -EINVAL;
   155	
   156		if (!strlen(target->device_id))
   157			return -EINVAL;
   158	
   159		mutex_lock(&target->host->lock);
   160		if (res)
 > 161			ret = __target_online(target);
   162		else
   163			ret = __target_offline(target);
   164		mutex_unlock(&target->host->lock);
   165	
   166		return ret ? ret : len;
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
