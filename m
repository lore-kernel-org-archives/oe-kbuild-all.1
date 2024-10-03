Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD7F1ABED4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 19:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727983851; cv=none; b=u5m5vuTqwWiBaUoJXsfm0FA8dE5X8gTNcyrGgt/tbLSqzWctI/WNDp0PCdKnjqqduuDQJgUEzYwbCUFHjUXJfUWERDWlTgG6sbXgVALl53KDcwUfjpPF7fa7aVI6isUwY7jWQADXCsnNfMrcEK+Zj5nYxudTuByoueMDR00zDyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727983851; c=relaxed/simple;
	bh=NQEsZUNEgTKnplHEBpMy7v8ois6KIk1lYcLsnwvkNUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpn5uQ7YuehlNFb1u8+6lbWw8OCBA4RmFyoDmJKHqFXpd05uX9Tx6uOi+yWS8i8LHmKdtnrIs6NYeEbprEewtlG8rVhA1QrIghP8IqhqdXjJ1F4goSGi9fWUk3KbWD6Wcw/HYEzkby/K3VgnB1truux83mxaJhI46R6vjxh0XzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkzybk1s; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkzybk1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727983849; x=1759519849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NQEsZUNEgTKnplHEBpMy7v8ois6KIk1lYcLsnwvkNUE=;
  b=bkzybk1sFvUM/Fm3d4lD1CVy4S0Do+DAFxnvYXzD0j9z+Nxz7L3EHnNZ
   +X2vYQ3q8cFGLU7XmWnP2OPD89R149MS2FjWf4NuJ33WT5ETVg+Jd8XgJ
   8M5mjPcGilgRWhnfNX/0eEB3fjNfeje8clHxU8bThdybTxEsGX81FCpI8
   eHTaWFJwEeT7vtKKhS/+y1p41PxORAWI8Auan960eIl69jq4zuoFUp2yH
   UUi9Bf+TIka6bjEKytN3vVrvwJXRw7tA7/Vau3VzsFQfOU2ekcJFaw1ua
   T7ACxTZRjjgmqxzok6wTr+TpOC0+KwfZDuau8jgb2cK/3T5HjtDgvhJXE
   w==;
X-CSE-ConnectionGUID: b8QfkERIQvuod5IrVGqlfA==
X-CSE-MsgGUID: 4vpGo3VeQW6/kXvypVXk9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44663570"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="44663570"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 12:30:48 -0700
X-CSE-ConnectionGUID: XJtKINuWStyIWEr9pHN8ag==
X-CSE-MsgGUID: qecjWM/vTzCEPirXtKjf2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="111919094"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2024 12:30:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swRXB-0000pe-1c;
	Thu, 03 Oct 2024 19:30:45 +0000
Date: Fri, 4 Oct 2024 03:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rc 2538/2707]
 drivers/macintosh/therm_windtunnel.c:521:3: error: implicit declaration of
 function 'of_platform_device_destroy'; did you mean
 'of_platform_device_create'?
Message-ID: <202410040304.IYbY3Bqc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
head:   aea4aaf86b7212944b7bf66d6becb8c7bb51093e
commit: 3c12b5f08da32ea740efeb35a6b55304399467a8 [2538/2707] macintosh/therm_windtunnel: fix module unload.
config: powerpc-randconfig-003-20241003 (https://download.01.org/0day-ci/archive/20241004/202410040304.IYbY3Bqc-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040304.IYbY3Bqc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040304.IYbY3Bqc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/scatterlist.h:7:0,
                    from include/linux/dma-mapping.h:10,
                    from arch/powerpc/include/asm/machdep.h:14,
                    from drivers/macintosh/therm_windtunnel.c:42:
   include/linux/mm.h: In function 'is_vmalloc_addr':
   include/linux/mm.h:386:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return addr >= VMALLOC_START && addr < VMALLOC_END;
                 ^~
   drivers/macintosh/therm_windtunnel.c: In function 'g4fan_exit':
>> drivers/macintosh/therm_windtunnel.c:521:3: error: implicit declaration of function 'of_platform_device_destroy'; did you mean 'of_platform_device_create'? [-Werror=implicit-function-declaration]
      of_platform_device_destroy(&x.of_dev->dev, NULL);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~
      of_platform_device_create
   cc1: some warnings being treated as errors


vim +521 drivers/macintosh/therm_windtunnel.c

   514	
   515	static void __exit
   516	g4fan_exit( void )
   517	{
   518		platform_driver_unregister( &therm_of_driver );
   519	
   520		if( x.of_dev )
 > 521			of_platform_device_destroy(&x.of_dev->dev, NULL);
   522	}
   523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
