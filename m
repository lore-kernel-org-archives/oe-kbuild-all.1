Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE1120183
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 21:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692741337; x=1724277337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1XiNWfJBN+3ai0b4J4rL8ll+FV9nSOq+DRqCAx2HFFo=;
  b=bNLI7y7Sfd+FctKDL5Gs4bV3T84Wq3EA8oa42CXlm0vt55qj6aXhPcmM
   FpyObFS5DNfyP1np6JdbTNpovUIo1I4a58Xg0igy9ipycLgmP89OeON96
   NXQdES5NqthsV5jo+wAnX6GhpcmBZ+AfGLdeY9PIdp4C+FBEEHOmph80y
   K7eG8on9QTlxQDexOaoQMeERNDhSSJUiNyB667wVLTKodKi4ePYUuj2P6
   RRkgW8dCEcR13SD2IflN1/8MsPRtIbjWSkfFtBGE9D2HrMpVBGI0wWtJJ
   l1zLhZnioMAIeN+U34u6GqOM89Ax5M7YB/vblX36SRMVbp0LvCCJnBEt6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="354337079"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="354337079"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 14:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="713328564"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="713328564"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 22 Aug 2023 14:55:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYZLJ-0000Ye-0W;
	Tue, 22 Aug 2023 21:55:17 +0000
Date: Wed, 23 Aug 2023 05:54:29 +0800
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
Message-ID: <202308230504.UYqC6CLk-lkp@intel.com>
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
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20230823/202308230504.UYqC6CLk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230504.UYqC6CLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230504.UYqC6CLk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/sprd-sc27xx-spi.c: In function 'sprd_pmic_spi_write':
>> drivers/mfd/sprd-sc27xx-spi.c:133:19: warning: 'pdata' is used uninitialized [-Wuninitialized]
     133 |         if (!pdata->slave_id) {
         |              ~~~~~^~~~~~~~~~
   drivers/mfd/sprd-sc27xx-spi.c:129:38: note: 'pdata' was declared here
     129 |         const struct sprd_pmic_data *pdata;
         |                                      ^~~~~


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
