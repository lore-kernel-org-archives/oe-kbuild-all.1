Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE211EB36
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 05:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714971823; cv=none; b=eWe2kSDIcppa6T8258MlXPR3gGQhqqlS48G75zHlBqdUzrYKhJkMWXFY2l1drDB9Z+zHsUpmGC2+5pD6lKSyhXAr6YMFtMcM1r7hqtTjNF1HM5TO+94zSnw2oKrZJ3lWJWzRghjdKFJDAhVUiKw1kC9SmHPGimhbk+ZVuSwtkdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714971823; c=relaxed/simple;
	bh=ZJJIlAKamPYLzqHroDfCYJc4pa1iY9LLdMy64ia9XVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=len5hU4wkCgDB6f3CRr/2tOAblhxkgBeW18FRqlLOAx0iqDLLVcMAqCrnZ8OG0ztUvQaI2wQYOrRB6yOXUekkQHFIHAoJEZvOWRRGuLS4AA7g2EYX+0ZLuynMY2qkOUhrA7gshKeClYjcXh7W3mVUAdTRCaKSY8xmxjyQzw55x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k82oVh3N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k82oVh3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714971821; x=1746507821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZJJIlAKamPYLzqHroDfCYJc4pa1iY9LLdMy64ia9XVI=;
  b=k82oVh3NxhAhMbKN4pLAT+WbLqgR4qdzqQGBXR1DVPvzhBSDvmCBL8M8
   ldZZCJ4uyevHe6sH1Y8FBXgKyERLY+5k+ZIscWPhOr0c7RUjiYxocbgf+
   usRSgZDK2GkCIRICkVt7KaxQXvgVDUekHuLw+Zi0bj7QplQPxeRYLi1Dx
   BSYSnCm1aFI6tAoz5kJQI4maTly1u3cjao7nqet3rzWK37WENQumNOwUH
   PmXH9kjj948S31TvvqBYsIhSkGGT6fc1ur+whhCMEhL59YhDmJofCBMeE
   UlJly12V9hsdYngxNFGQmR5SltkxlFqYfUFiEmczCufySHAlDhULv/U4f
   g==;
X-CSE-ConnectionGUID: H1sgv/g8SXydcXrlm0c8OA==
X-CSE-MsgGUID: UvKEbWBjTvu3gKKjxp4VUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="22109823"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="22109823"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 22:03:40 -0700
X-CSE-ConnectionGUID: MiXy8seFT6+zGTUR0W4wmw==
X-CSE-MsgGUID: uhMhUfzcTXSjqlgL0N4yeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="32556389"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2024 22:03:39 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3qVk-0000Tz-1Q;
	Mon, 06 May 2024 05:03:36 +0000
Date: Mon, 6 May 2024 13:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3482/30000]
 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5234:1: warning: 'inline' is
 not at beginning of declaration
Message-ID: <202405061208.OUH9u7TK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   411c52448fdc0906f70c4585c7e05359c0b05c11
commit: 9aaa64d658b13f9f4ca06763dc79386e4ee90df3 [3482/30000] MGS-6425 [#imx-2711] use default list_head in linux
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240506/202405061208.OUH9u7TK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405061208.OUH9u7TK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405061208.OUH9u7TK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/arm/mm: No such file or directory [-Wmissing-include-dirs]
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:166:1: warning: no previous prototype for '_ClearPendingIntr' [-Wmissing-prototypes]
     166 | _ClearPendingIntr(
         | ^~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:208:1: warning: no previous prototype for '_MonitorTimerFunction' [-Wmissing-prototypes]
     208 | _MonitorTimerFunction(
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:391:1: warning: no previous prototype for '_DumpDriverConfigure' [-Wmissing-prototypes]
     391 | _DumpDriverConfigure(
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:406:1: warning: no previous prototype for '_DumpState' [-Wmissing-prototypes]
     406 | _DumpState(
         | ^~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:458:1: warning: no previous prototype for '_SetRecovery' [-Wmissing-prototypes]
     458 | _SetRecovery(
         | ^~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:1489:1: warning: no previous prototype for '_AllocateLinearMemory' [-Wmissing-prototypes]
    1489 | _AllocateLinearMemory(
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:1612:1: warning: no previous prototype for '_ReleaseVideoMemory' [-Wmissing-prototypes]
    1612 | _ReleaseVideoMemory(
         | ^~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:2130:1: warning: no previous prototype for '_SetVidMemMetadata' [-Wmissing-prototypes]
    2130 | _SetVidMemMetadata(
         | ^~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:2302:1: warning: no previous prototype for 'gckKERNEL_ConfigPowerManagement' [-Wmissing-prototypes]
    2302 | gckKERNEL_ConfigPowerManagement(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5234:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
    5234 | void inline
         | ^~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5242:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
    5242 | void inline
         | ^~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5251:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
    5251 | void inline
         | ^~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5260:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
    5260 | void inline
         | ^~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5667:1: warning: no previous prototype for 'gckDEVICE_ChipInfo' [-Wmissing-prototypes]
    5667 | gckDEVICE_ChipInfo(
         | ^~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5689:1: warning: no previous prototype for 'gckDEVICE_Version' [-Wmissing-prototypes]
    5689 | gckDEVICE_Version(
         | ^~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c: In function 'gckDEVICE_SetTimeOut':
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5751:19: warning: variable 'coreList' set but not used [-Wunused-but-set-variable]
    5751 |     gcsCORE_LIST *coreList;
         |                   ^~~~~~~~


vim +/inline +5234 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c

  5229	
  5230	/*******************************************************************************\
  5231	*************************** List Helper *****************************************
  5232	\*******************************************************************************/
  5233	#ifdef LINUX_VERSION_CODE
> 5234	void inline
  5235	gcsLIST_Init(
  5236	    gcsLISTHEAD_PTR Node
  5237	    )
  5238	{
  5239	    INIT_LIST_HEAD(Node);
  5240	}
  5241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
