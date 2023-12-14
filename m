Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C006E60B83
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 18:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLB9w1v0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702578610; x=1734114610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ZYYxqWx1kmoxG6ngi71Mbzy6N3XKyw4oew+xYOcWSU=;
  b=kLB9w1v0W+qE/TmiEQyGeFPcNUb6HX+OgwG1NKU/4rGlCyiFLz0H4R4h
   /pxUZfDnAPrnNAUVOL9ctJeQqHrYUB17pgVb2geYkP4mxFgQmauYKXmkU
   5wSe3x59prIMaG/ooNlI4wG69Zh54OLE8903frnHu9wKVLessYhDqYJdG
   IVVWSbftmLKYYRFBC8Fe9TUw39UiCtUeKqyU1VcmZ6nHjZzhY1Nuz6kj+
   Sug/ddT3eHKUwBu6DRIKPQHGYKpOvWoVtuS3jfXPMGGjBy7aNyqDa6NnN
   /A1dohZasOfrD3ABC4ubJaalMQrGFUBd1wQPWZFPwf/uEMxJk7TdiGJSI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459487343"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="459487343"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 10:30:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021640500"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="1021640500"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Dec 2023 10:30:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDqTB-000MT6-1O;
	Thu, 14 Dec 2023 18:30:01 +0000
Date: Fri, 15 Dec 2023 02:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Cc: oe-kbuild-all@lists.linux.dev, James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2] coresight: Make current W=1 warnings default
Message-ID: <202312150201.EizBBCDr-lkp@intel.com>
References: <20231115162834.355598-1-james.clark@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115162834.355598-1-james.clark@arm.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on soc/for-next linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Clark/coresight-Make-current-W-1-warnings-default/20231116-004818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20231115162834.355598-1-james.clark%40arm.com
patch subject: [PATCH v2] coresight: Make current W=1 warnings default
config: arm-randconfig-r131-20231117 (https://download.01.org/0day-ci/archive/20231215/202312150201.EizBBCDr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312150201.EizBBCDr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150201.EizBBCDr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwtracing/coresight/coresight-tpdm.c:242:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/hwtracing/coresight/coresight-tpdm.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/hwtracing/coresight/coresight-etb10.c:840:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/hwtracing/coresight/coresight-etb10.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/hwtracing/coresight/coresight-funnel.c:395:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/hwtracing/coresight/coresight-funnel.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +242 drivers/hwtracing/coresight/coresight-tpdm.c

   232	
   233	/*
   234	 * Different TPDM has different periph id.
   235	 * The difference is 0-7 bits' value. So ignore 0-7 bits.
   236	 */
   237	static struct amba_id tpdm_ids[] = {
   238		{
   239			.id = 0x000f0e00,
   240			.mask = 0x000fff00,
   241		},
 > 242		{ 0, 0, 0 },
   243	};
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
