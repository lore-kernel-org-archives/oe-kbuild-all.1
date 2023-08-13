Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF43B9446
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Aug 2023 21:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691963026; x=1723499026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wbyB6w7t1AuN0Ne0pXcqxpz+CXxmntH+/mWGwqqVoIE=;
  b=lVEYf1akMdq4QNJOnD8ySAYktNuT/LM8vHJmj93B+WzW6UZhKoi13RMA
   wGRY+2097zFwliUWL/fBK0DTdSBErP089aq5GLDZs2iXF4B1P4tJtBu5T
   wgZvn728elVzwXrTvSf+Wtm6/vciMONvq94dDmNNwJcIlqdUirztGuIkN
   aJYxU4bseZgGoyWRM/W4AHz00MdZMUxPzSCVrivU8QGO5TCxWSRf83kLS
   mGddx9eA8y2hFyHDhN4ZeqKdeRr40mWkA25MYAdMfqL3D7kJECHcA1Oop
   8eT+ImStD97/CWenlWS/VHPcUNpdY4SjE+9/FZqCmPAB417BC5vQTzNfy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="375628146"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="375628146"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 14:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="803248753"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="803248753"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Aug 2023 14:43:42 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVIsA-0009Du-0g;
	Sun, 13 Aug 2023 21:43:42 +0000
Date: Mon, 14 Aug 2023 05:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, suzuki.poulose@arm.com
Cc: oe-kbuild-all@lists.linux.dev,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@arm.com>, coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 4/4] coresight: trbe: Enable ACPI based TRBE devices
Message-ID: <202308140529.wEpy3fPK-lkp@intel.com>
References: <20230803055652.1322801-5-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803055652.1322801-5-anshuman.khandual@arm.com>

Hi Anshuman,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on arm/for-next soc/for-next linus/master arm/fixes v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/arm_pmu-acpi-Refactor-arm_spe_acpi_register_device/20230803-135907
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230803055652.1322801-5-anshuman.khandual%40arm.com
patch subject: [PATCH V3 4/4] coresight: trbe: Enable ACPI based TRBE devices
config: arm64-randconfig-r071-20230813 (https://download.01.org/0day-ci/archive/20230814/202308140529.wEpy3fPK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308140529.wEpy3fPK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308140529.wEpy3fPK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-trbe.c:1549:21: error: 'arm_trbe_acpi_match' undeclared here (not in a function); did you mean 'arm_trbe_of_match'?
    1549 |         .id_table = arm_trbe_acpi_match,
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     arm_trbe_of_match


vim +1549 drivers/hwtracing/coresight/coresight-trbe.c

  1547	
  1548	static struct platform_driver arm_trbe_driver = {
> 1549		.id_table = arm_trbe_acpi_match,
  1550		.driver	= {
  1551			.name = DRVNAME,
  1552			.of_match_table = of_match_ptr(arm_trbe_of_match),
  1553			.suppress_bind_attrs = true,
  1554		},
  1555		.probe	= arm_trbe_device_probe,
  1556		.remove	= arm_trbe_device_remove,
  1557	};
  1558	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
