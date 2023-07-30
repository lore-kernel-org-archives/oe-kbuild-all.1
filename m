Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864B9363
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 13:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690724066; x=1722260066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y3dz5uA2VWVjyOfQs+NqQIp9p/FGgGgzhIGNlYFIr3I=;
  b=kVHmiSBMvi8PNgPWu1/oU0QerY4XyvNgTJtSFz5nyAy+NR/nvisLEK1p
   s0I69+E3LHHT9qEo3tEk0W5obL0bGCeXNqgPIe1B5giEQ91UfNjGHOAlO
   JnXFepRgdUvjTCDpoEpC3+H7uSQx+ZmLybvhOHUwqhNk7gOkC7SFSBnLK
   NwhdOuIkNOI/WAYHMmDbey8MAb+Si151/n/etwdcFyLIN99swxAWZA7w4
   SlU5r/P21FxEZrEPBRPvnVg7E40I46z5oAGKgB32PoFgNrN7V7JdkL1w/
   H5IshJAduGWKKzyqi+6ydKB6pZ5orETBziIu5cWB+n6iiA8nIOpSIy+Ld
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="399794763"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="399794763"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 06:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="841893330"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="841893330"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2023 06:34:24 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQ6YX-0004bH-2H;
	Sun, 30 Jul 2023 13:34:10 +0000
Date: Sun, 30 Jul 2023 21:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Merello <andrea.merello@iit.it>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] IIO: MPU6050: fix level-triggered IRQ support caused crash
Message-ID: <202307302126.2umrKegl-lkp@intel.com>
References: <20230726090212.10641-1-andrea.merello@iit.it>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726090212.10641-1-andrea.merello@iit.it>

Hi Andrea,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.5-rc3]
[also build test WARNING on linus/master]
[cannot apply to jic23-iio/togreg next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-Merello/IIO-MPU6050-fix-level-triggered-IRQ-support-caused-crash/20230726-172345
base:   v6.5-rc3
patch link:    https://lore.kernel.org/r/20230726090212.10641-1-andrea.merello%40iit.it
patch subject: [RFC] IIO: MPU6050: fix level-triggered IRQ support caused crash
config: um-randconfig-r091-20230730 (https://download.01.org/0day-ci/archive/20230730/202307302126.2umrKegl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307302126.2umrKegl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307302126.2umrKegl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:220:13: sparse: sparse: symbol 'inv_mpu6050_trigger_irq' was not declared. Should it be static?
>> drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:228:13: sparse: sparse: symbol 'inv_mpu6050_trigger_thread_fn' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
