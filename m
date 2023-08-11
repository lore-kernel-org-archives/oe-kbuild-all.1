Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFDC5690
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 09:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691747519; x=1723283519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z453GNYmMJDY4aCcWBHhUYvZPy4HUOOIDo+Dln4hDxA=;
  b=HytUntHz6ysX8E/HQn8ZNCvNjvjk0piVUgb2Jc4pmk6Un1acCKhyGqQF
   6kHWT4YM4rY2BrPCajhghzWJTgZWRrjx4ZS37/Uhhmy4aH7GBScRhj2aa
   uYG0QdaOwOXZyrFgHQd0Iv0eZnrthvODbB9rzaxT5XYbw0MBGIZWaJuw9
   j7hSRzoTlT+Z7FTgK4QwW0uQfeiC9/qqEwcTS7NFOmwtcvkHNQcdOTvmc
   6UrcTMUN9yJRThvg/QvJy9L3paq2fZ5EbcY3JNEYLBOU4rqVXA+q5EbMs
   l5H1636rP8N0HkRCdxaOelZDEDgZ1FBULmUtdNZXhFUHC1tZEuC9y+iJE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="371649175"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="371649175"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 02:51:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="822612343"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="822612343"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Aug 2023 02:51:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUOnx-0007ga-36;
	Fri, 11 Aug 2023 09:51:37 +0000
Date: Fri, 11 Aug 2023 17:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Mengqi <guomengqi3@huawei.com>, vkoul@kernel.org,
	dmaengine@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, guomengqi3@huawei.com,
	xuqiang36@huawei.com
Subject: Re: [PATCH 1/2] dmaengine: Add HiSilicon Ascend SDMA engine support
Message-ID: <202308111712.7M4TmcC2-lkp@intel.com>
References: <20230811034822.107229-2-guomengqi3@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811034822.107229-2-guomengqi3@huawei.com>

Hi Guo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guo-Mengqi/dmaengine-Add-HiSilicon-Ascend-SDMA-engine-support/20230811-115823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20230811034822.107229-2-guomengqi3%40huawei.com
patch subject: [PATCH 1/2] dmaengine: Add HiSilicon Ascend SDMA engine support
config: csky-randconfig-r003-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111712.7M4TmcC2-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111712.7M4TmcC2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111712.7M4TmcC2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/ascend_sdma.c:191:6: warning: no previous prototype for 'set_sdma_channel_info' [-Wmissing-prototypes]
     191 | void set_sdma_channel_info(struct dma_chan *c, int pasid)
         |      ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:30,
                    from drivers/dma/ascend_sdma.c:4:
   drivers/dma/ascend_sdma.c: In function 'of_sdma_collect_info':
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_WARNING'
     508 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/dma/ascend_sdma.c:234:17: note: in expansion of macro 'pr_warn'
     234 |                 pr_warn("reg size %#llx check failed, use %#x\n",
         |                 ^~~~~~~
   drivers/dma/ascend_sdma.c: At top level:
>> drivers/dma/ascend_sdma.c:490:33: warning: no previous prototype for 'sdma_prep_dma_memcpy' [-Wmissing-prototypes]
     490 | struct dma_async_tx_descriptor *sdma_prep_dma_memcpy(
         |                                 ^~~~~~~~~~~~~~~~~~~~
>> drivers/dma/ascend_sdma.c:520:5: warning: no previous prototype for 'sdma_terminate_all' [-Wmissing-prototypes]
     520 | int sdma_terminate_all(struct dma_chan *chan)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/dma/ascend_sdma.c:528:6: warning: no previous prototype for 'sdma_synchronize' [-Wmissing-prototypes]
     528 | void sdma_synchronize(struct dma_chan *chan)
         |      ^~~~~~~~~~~~~~~~
>> drivers/dma/ascend_sdma.c:535:17: warning: no previous prototype for 'sdma_tx_status' [-Wmissing-prototypes]
     535 | enum dma_status sdma_tx_status(struct dma_chan *chan,
         |                 ^~~~~~~~~~~~~~
   drivers/dma/ascend_sdma.c: In function 'sdma_tx_status':
   drivers/dma/ascend_sdma.c:545:9: error: implicit declaration of function 'dsb' [-Werror=implicit-function-declaration]
     545 |         dsb(sy);
         |         ^~~
   drivers/dma/ascend_sdma.c:545:13: error: 'sy' undeclared (first use in this function); did you mean 'sc'?
     545 |         dsb(sy);
         |             ^~
         |             sc
   drivers/dma/ascend_sdma.c:545:13: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/dma/ascend_sdma.c:540:22: warning: variable 'ch_ctrl_reg' set but not used [-Wunused-but-set-variable]
     540 |         u32 irq_reg, ch_ctrl_reg;
         |                      ^~~~~~~~~~~
   drivers/dma/ascend_sdma.c: In function 'sdma_start_transfer':
   drivers/dma/ascend_sdma.c:633:9: error: implicit declaration of function 'dmb'; did you mean 'rmb'? [-Werror=implicit-function-declaration]
     633 |         dmb(sy);
         |         ^~~
         |         rmb
   drivers/dma/ascend_sdma.c:633:13: error: 'sy' undeclared (first use in this function); did you mean 's8'?
     633 |         dmb(sy);
         |             ^~
         |             s8
   drivers/dma/ascend_sdma.c: At top level:
>> drivers/dma/ascend_sdma.c:638:6: warning: no previous prototype for 'sdma_issue_pending' [-Wmissing-prototypes]
     638 | void sdma_issue_pending(struct dma_chan *chan)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/dma/ascend_sdma.c:651:6: warning: no previous prototype for 'sdma_free_chan_resources' [-Wmissing-prototypes]
     651 | void sdma_free_chan_resources(struct dma_chan *chan)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/set_sdma_channel_info +191 drivers/dma/ascend_sdma.c

   187	
   188	/* sdma supports sva transfer via iommu.
   189	 * client must first set the pasid.
   190	 */
 > 191	void set_sdma_channel_info(struct dma_chan *c, int pasid)
   192	{
   193		struct sdma_chan *sc = to_sdma_chan(c);
   194	
   195		sc->pasid = pasid;
   196	}
   197	EXPORT_SYMBOL_GPL(set_sdma_channel_info);
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
