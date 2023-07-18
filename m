Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9CE125D8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689696105; x=1721232105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mUwkx+Z+OnBhUQnTeyRwIWiZ6PuW3K2DI61uIPt6feY=;
  b=JTL8pVIsmt5ukZcaL2YK2nywgGAGsGSY0SagC+8bocbM6e3/fGytSNjC
   2iEKVQKcQNHZBGWYyMw16YFIIukfI/JrVGUzko/1TpX1nijru2vVQBhzN
   ZmOoVA+z1z0m1GxoNtJnlGxp+o0awJ5O2cgsAncBqBnGUK2gQPvVPQMcY
   YiMaeGSLslZ9DQn4IgtY+dmLGwrycMnkyLfsLlJQBKs4+Ve1cWXLgK8Vp
   OqMYD1InFJbh6YA6LPEUXsH5wE3961oYne6yyt1AyWZDYtv9v7+4Dqzxt
   IYPH/RzQBmQmgPPXPa1j4LLOtOGNqQ/UN0b8KlA6juaRHurKk1BWsHR+Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="366285338"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="366285338"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 09:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="837330266"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="837330266"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2023 09:00:46 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLn82-0000hd-0g;
	Tue, 18 Jul 2023 16:00:46 +0000
Date: Wed, 19 Jul 2023 00:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] Revert "nvmem: add new config option"
Message-ID: <202307182316.AVNL1wNs-lkp@intel.com>
References: <20230718084804.20139-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230718084804.20139-1-zajec5@gmail.com>

Hi Rafał,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes linus/master v6.5-rc2 next-20230718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rafa-Mi-ecki/Revert-nvmem-add-new-config-option/20230718-170441
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
patch link:    https://lore.kernel.org/r/20230718084804.20139-1-zajec5%40gmail.com
patch subject: [PATCH] Revert "nvmem: add new config option"
config: i386-randconfig-i002-20230718 (https://download.01.org/0day-ci/archive/20230718/202307182316.AVNL1wNs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307182316.AVNL1wNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307182316.AVNL1wNs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/mtdcore.c: In function 'mtd_nvmem_add':
>> drivers/mtd/mtdcore.c:542:29: warning: unused variable 'node' [-Wunused-variable]
     542 |         struct device_node *node = mtd_get_of_node(mtd);
         |                             ^~~~


vim +/node +542 drivers/mtd/mtdcore.c

c4dfa25ab307a2 Alban Bedel        2018-11-13  539  
c4dfa25ab307a2 Alban Bedel        2018-11-13  540  static int mtd_nvmem_add(struct mtd_info *mtd)
c4dfa25ab307a2 Alban Bedel        2018-11-13  541  {
658c4448bbbf02 Christian Marangi  2021-03-12 @542  	struct device_node *node = mtd_get_of_node(mtd);
c4dfa25ab307a2 Alban Bedel        2018-11-13  543  	struct nvmem_config config = {};
c4dfa25ab307a2 Alban Bedel        2018-11-13  544  
75f32f4b9d5263 Miquel Raynal      2023-03-07  545  	config.id = NVMEM_DEVID_NONE;
c4dfa25ab307a2 Alban Bedel        2018-11-13  546  	config.dev = &mtd->dev;
7b01b7239d0dc9 Ricardo Ribalda    2020-04-30  547  	config.name = dev_name(&mtd->dev);
c4dfa25ab307a2 Alban Bedel        2018-11-13  548  	config.owner = THIS_MODULE;
c4dfa25ab307a2 Alban Bedel        2018-11-13  549  	config.reg_read = mtd_nvmem_reg_read;
c4dfa25ab307a2 Alban Bedel        2018-11-13  550  	config.size = mtd->size;
c4dfa25ab307a2 Alban Bedel        2018-11-13  551  	config.word_size = 1;
c4dfa25ab307a2 Alban Bedel        2018-11-13  552  	config.stride = 1;
c4dfa25ab307a2 Alban Bedel        2018-11-13  553  	config.read_only = true;
c4dfa25ab307a2 Alban Bedel        2018-11-13  554  	config.root_only = true;
6c7621890995d0 Christophe Kerello 2022-02-20  555  	config.ignore_wp = true;
c4dfa25ab307a2 Alban Bedel        2018-11-13  556  	config.priv = mtd;
c4dfa25ab307a2 Alban Bedel        2018-11-13  557  
c4dfa25ab307a2 Alban Bedel        2018-11-13  558  	mtd->nvmem = nvmem_register(&config);
c4dfa25ab307a2 Alban Bedel        2018-11-13  559  	if (IS_ERR(mtd->nvmem)) {
c4dfa25ab307a2 Alban Bedel        2018-11-13  560  		/* Just ignore if there is no NVMEM support in the kernel */
5cab06156aade1 Miquel Raynal      2023-03-07  561  		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP)
c4dfa25ab307a2 Alban Bedel        2018-11-13  562  			mtd->nvmem = NULL;
5cab06156aade1 Miquel Raynal      2023-03-07  563  		else
5cab06156aade1 Miquel Raynal      2023-03-07  564  			return dev_err_probe(&mtd->dev, PTR_ERR(mtd->nvmem),
5cab06156aade1 Miquel Raynal      2023-03-07  565  					     "Failed to register NVMEM device\n");
c4dfa25ab307a2 Alban Bedel        2018-11-13  566  	}
c4dfa25ab307a2 Alban Bedel        2018-11-13  567  
c4dfa25ab307a2 Alban Bedel        2018-11-13  568  	return 0;
c4dfa25ab307a2 Alban Bedel        2018-11-13  569  }
c4dfa25ab307a2 Alban Bedel        2018-11-13  570  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
