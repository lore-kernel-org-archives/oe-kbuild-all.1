Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5383328851A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 05:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753162819; cv=none; b=SEFhjBLJKIwhtuyq2vvFIvzF1LVQiTDBfpd6zk5l16TKYYM4ATGjvGmYjhnDj83Nc85QLda3R519ZvGubMyt1h0LJ8lmh519CfaBZfTrKXTI0QsVGUhggeT8Scsr9PkRVq520Ey/EN3LusuwgzfQDm3DOvJ8T8SxIkLGNqCl1Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753162819; c=relaxed/simple;
	bh=+Uh9V0nrl5UjBABFaVJ+I1suceuDcGNbiYV6A7vR8rc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iKW1YNYLdTRxU9s0gK+/Jnuthkzxj4B12v+5XaiJDiiJWZfbRuTeby0Gkz3A+h/w6dUXKOQSFI+BnoPow7wQJPdFaERK2W3Vcm7wPcOD9cUXgTzWVo8lN9IeXpC7KC9g9fe5uhaSw7K/YRwn6VZD4TJKIZF/oBvlERYYV8MrbIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWA1V6f3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWA1V6f3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753162817; x=1784698817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Uh9V0nrl5UjBABFaVJ+I1suceuDcGNbiYV6A7vR8rc=;
  b=UWA1V6f32yUXt064WNr8Q7gS89Hw4LkIeZImiFSZlWIdwuU372CzpOrL
   dL3LQmw4UMTJlxITqMH2Wp04ONETH9YGI4qbSQDum9l6+THJ5kp5VUPTv
   Zn1RZgooBNzOSyMsKn1qWumHhCW9YLe4PunTkOk9W7GDMIrjYSxWyD0ra
   UI/GZIw9IoHTJqBJpKfAZYOBGP+kw5JOwdtPDnxCL501pFhXaDfskfNl2
   PfC3zQtaOX5Q6qONGUQcS/xuJO6zug1QwVTz33A62Y8dsJj4y4rDiTEuh
   NAM8dcy7NHW3BCjKb+dN6hWT4PevL87K8Neq3HxWBv070P7y+PsaAraG9
   w==;
X-CSE-ConnectionGUID: U3/FMNfhQgm/kHgKXYZ9Hg==
X-CSE-MsgGUID: eTQV+5wER3CiEs3ALpI28A==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="72966060"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="72966060"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 22:40:16 -0700
X-CSE-ConnectionGUID: HqOAy5JOTgGU7CD5qXi/Bg==
X-CSE-MsgGUID: zHS4TysJRySaInweTtFldQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="159594595"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2025 22:40:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue5jX-000HUm-25;
	Tue, 22 Jul 2025 05:40:11 +0000
Date: Tue, 22 Jul 2025 13:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.16.y 8/44]
 drivers/power/reset/odroid-reboot.c:63:6: warning: no previous prototype for
 'odroid_card_reset'
Message-ID: <202507221540.cr2qBpel-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.16.y
head:   ac46a60ec2fb958f1dc2e5871e122abb98ac0da9
commit: ae8f39e1d572c4a923777ad79a242261a2dc6fe2 [8/44] ODROID-COMMON: power:reset: Add odroid support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250722/202507221540.cr2qBpel-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221540.cr2qBpel-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221540.cr2qBpel-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/reset/odroid-reboot.c:63:6: warning: no previous prototype for 'odroid_card_reset' [-Wmissing-prototypes]
      63 | void odroid_card_reset(void)
         |      ^~~~~~~~~~~~~~~~~
   drivers/power/reset/odroid-reboot.c: In function 'odroid_restart_probe':
   drivers/power/reset/odroid-reboot.c:141:17: error: 'arm_pm_restart' undeclared (first use in this function)
     141 |                 arm_pm_restart = do_odroid_restart;
         |                 ^~~~~~~~~~~~~~
   drivers/power/reset/odroid-reboot.c:141:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/odroid_card_reset +63 drivers/power/reset/odroid-reboot.c

    62	
  > 63	void odroid_card_reset(void)
    64	{
    65		int ret = 0;
    66	
    67		if ((sd_vqsw == 0) && (sd_vmmc == 0))
    68			return;
    69	
    70		if (sd_vqen == 0) {
    71			gpio_free(sd_vqsw);
    72			gpio_free(sd_vmmc);
    73			ret = gpio_request_one(sd_vqsw,
    74					GPIOF_OUT_INIT_LOW, "REBOOT");
    75			CHECK_RET(ret);
    76			mdelay(10);
    77			ret = gpio_direction_output(sd_vqsw, 1);
    78			CHECK_RET(ret);
    79			ret = gpio_request_one(sd_vmmc,
    80					GPIOF_OUT_INIT_LOW, "REBOOT");
    81			CHECK_RET(ret);
    82			mdelay(10);
    83			ret = gpio_direction_output(sd_vqsw, 0);
    84			CHECK_RET(ret);
    85			ret = gpio_direction_output(sd_vmmc, 1);
    86			CHECK_RET(ret);
    87			mdelay(5);
    88			gpio_free(sd_vqsw);
    89			gpio_free(sd_vmmc);
    90		} else {
    91			gpio_free(sd_vqsw);
    92			gpio_free(sd_vqen);
    93			gpio_free(sd_vmmc);
    94	
    95			ret = gpio_request_one(sd_vqsw,
    96					GPIOF_OUT_INIT_LOW, "REBOOT");
    97			CHECK_RET(ret);
    98			ret = gpio_request_one(sd_vqen,
    99					GPIOF_OUT_INIT_LOW, "REBOOT");
   100			CHECK_RET(ret);
   101			ret = gpio_request_one(sd_vmmc,
   102					GPIOF_OUT_INIT_LOW, "REBOOT");
   103			CHECK_RET(ret);
   104			mdelay(100);
   105			ret = gpio_direction_input(sd_vqen);
   106			CHECK_RET(ret);
   107			ret = gpio_direction_input(sd_vmmc);
   108			CHECK_RET(ret);
   109			ret = gpio_direction_input(sd_vqsw);
   110			CHECK_RET(ret);
   111			mdelay(5);
   112			gpio_free(sd_vqen);
   113			gpio_free(sd_vmmc);
   114			gpio_free(sd_vqsw);
   115		}
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
