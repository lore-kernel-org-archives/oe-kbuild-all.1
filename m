Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AACC1DDCC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 18:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692730369; x=1724266369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uE59dn1vKcS1Dc94KjLiR97iCxxqnH7rE2TfHoHeLus=;
  b=JwnMT3UP3rZ5/1a6FQmDHQtvrrJSe4//YU7Hmjd0P4wlyz5Oa7DuH3sK
   3r71C6ouRag7CFrfg9ufQHrNQKD1bkBd4KuYO5KXDaTHJ32ig6YGVaviT
   wXbxjW5PEehvEZy9yxrFHvxvZPB+yiCejGWByiVoB3I+WE13/ywVJ45iG
   uRFav0lNAhK9gS5zVXHcmGKpmo00EDzCtj9m/5vZcrRagHX6nvZq24JVG
   bt7TIxgjDi/7jXhhVnTY2ojkqcG9DfpUW/Ij2Qy3aa8NHPb80LMaMnT3N
   aLq/9rKBJkkneHKQjNRL5xjuPDb547avUsKxg2dtXbOVjg2FE0kV36y7Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358953624"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="358953624"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 11:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="739442184"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="739442184"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2023 11:52:44 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYWUa-0000SE-1w;
	Tue, 22 Aug 2023 18:52:41 +0000
Date: Wed, 23 Aug 2023 02:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jiansheng Wu <jiansheng.wu@unisoc.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, yongzhi.chen@unisoc.com,
	xiaoqing.wu@unisoc.com, jinfeng.lin1@unisoc.com,
	jianshengwu16@gmail.com
Subject: Re: [PATCH 2/2] mfd: sprd-sc27xx-spi: Add PMICs support for UMS9621
 SoC
Message-ID: <202308230247.XxIH8PLy-lkp@intel.com>
References: <20230822075113.25506-3-jiansheng.wu@unisoc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822075113.25506-3-jiansheng.wu@unisoc.com>

Hi Jiansheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on robh/for-next lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v6.5-rc7 next-20230822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiansheng-Wu/dt-bindings-spi-Convert-sprd-spi-bindings-to-yaml/20230822-155400
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20230822075113.25506-3-jiansheng.wu%40unisoc.com
patch subject: [PATCH 2/2] mfd: sprd-sc27xx-spi: Add PMICs support for UMS9621 SoC
config: i386-buildonly-randconfig-004-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230247.XxIH8PLy-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230247.XxIH8PLy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230247.XxIH8PLy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/sprd-sc27xx-spi.c: In function 'sprd_pmic_spi_write':
>> drivers/mfd/sprd-sc27xx-spi.c:133:12: warning: 'pdata' is used uninitialized in this function [-Wuninitialized]
     133 |  if (!pdata->slave_id) {
         |       ~~~~~^~~~~~~~~~


vim +/pdata +133 drivers/mfd/sprd-sc27xx-spi.c

   124	
   125	static int sprd_pmic_spi_write(void *context, const void *data, size_t count)
   126	{
   127		struct device *dev = context;
   128		struct spi_device *spi = to_spi_device(dev);
   129		const struct sprd_pmic_data *pdata;
   130		int ret;
   131		u32 *pmdata;
   132	
 > 133		if (!pdata->slave_id) {
   134			ret = spi_write(spi, data, count);
   135		} else {
   136			pdata = ((struct sprd_pmic *)spi_get_drvdata(spi))->pdata;
   137	
   138			pmdata = kzalloc(count, GFP_KERNEL);
   139			if (!pmdata)
   140				return -ENOMEM;
   141			memcpy(pmdata, data, count);
   142			*pmdata += pdata->slave_id;
   143			ret = spi_write(spi, (const void *)pmdata, count);
   144			kfree(pmdata);
   145		}
   146		if (ret)
   147			pr_err("pmic mfd write failed!\n");
   148	
   149		return ret;
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
