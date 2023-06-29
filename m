Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF5A17CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jun 2023 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688032042; x=1719568042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9gvYtK0V2d3FowGpGd8NVoIJaWfRluwVfox++sQFtyc=;
  b=fobPIlnt3NnlFLd+q1S1Azy3Ero4zkDMxRYiaij2NcwolsB0KiLL9CMx
   RPmgMcBgB9W/fqQe7VvTXvRxXxSzBvjOUvnYRqhWFITPQFz/WwcKECaYf
   VjZTnJ10e2C01ZXe0+ZMH8QH5j5hDpMvL95fAHFuAn8cc3mOjqRYoyOJv
   mibTuKAViEM05wZTl24uJsGORdkvuNXEf0PDlUHa7Cme617lK1deEd94n
   BQIIT/A+iuCYH7aUGbUdlGgH4esmUGffM3Ts5WQX4oClOyaSFiMi/zHCY
   n3ecRKg83rq5OX+jeAIJhnEpxpDdpPZJzPQGnwl549f41wahGx/cJ/gDy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="448447981"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="448447981"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 02:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="787318629"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="787318629"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jun 2023 02:47:20 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEoFE-000E1o-0V;
	Thu, 29 Jun 2023 09:47:20 +0000
Date: Thu, 29 Jun 2023 17:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] media: i2c: Select V4L2_FWNODE and
 VIDEO_V4L2_SUBDEV_API for sensors
Message-ID: <202306291740.p4CctOjR-lkp@intel.com>
References: <20230629081116.919253-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629081116.919253-1-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on sailus-media-tree/streams linus/master v6.4 next-20230629]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-i2c-Select-V4L2_FWNODE-and-VIDEO_V4L2_SUBDEV_API-for-sensors/20230629-162047
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230629081116.919253-1-sakari.ailus%40linux.intel.com
patch subject: [PATCH 1/1] media: i2c: Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for sensors
config: riscv-allnoconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306291740.p4CctOjR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306291740.p4CctOjR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/Kconfig:28:error: recursive dependency detected!
   drivers/media/i2c/Kconfig:28:	symbol VIDEO_CAMERA_SENSOR depends on MEDIA_CONTROLLER
   drivers/media/Kconfig:170:	symbol MEDIA_CONTROLLER is selected by VIDEO_AR0521
   drivers/media/i2c/Kconfig:44:	symbol VIDEO_AR0521 depends on VIDEO_CAMERA_SENSOR
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +28 drivers/media/i2c/Kconfig

    27	
  > 28	menuconfig VIDEO_CAMERA_SENSOR
    29		bool "Camera sensor devices"
    30		depends on MEDIA_CAMERA_SUPPORT
    31		depends on MEDIA_CONTROLLER
    32		select V4L2_FWNODE
    33		select VIDEO_V4L2_SUBDEV_API
    34		default y
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
