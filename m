Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042A322F75C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 19:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655205; cv=none; b=Tr/OpmKiam+eTg4YkgfJXL19UIh5JyR6dt5ILRtc8OFiHuMmGi5YLWQVZ80LJN7DOSSrIkYGx4aLUsoZUHI0UWJ+eDoSE+tm+uk/Ow4WsokyFDMl0s1Doqai8Nsqb5Rlsv7xxX9nf/+7bAt7im/jcmoHzL+i3JLlIMk8CBgqm5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655205; c=relaxed/simple;
	bh=/finrrae9Fo6nXcsS0kkVL4BdXNaG/EanEsf090BoqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXn3C+Y/e1Hwx8IfqHHEWVOBkpH7Ilp7CbNKDtNJO2MHTI43RboOmaKohxIkXoJ7r3yQKFncHE1nKP7ukjCgta+OYrEIXDh5H5Sy8wTiu39z6SpkO0FUviI8h3MdeXwKwCCYKvWy2wNZgfFSQFKpjycPoFqWivOk1xSBp/avFbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INCsF3XK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INCsF3XK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758655203; x=1790191203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/finrrae9Fo6nXcsS0kkVL4BdXNaG/EanEsf090BoqE=;
  b=INCsF3XKKl3vmXLEPmpNHftUOY/s9XApq8vF8U83tuJ2w1loAHQ54GCT
   TIR+SdMiawWdptrsc4fXNPszuZTnDtQtO6/1IMM3w61bUPF2pl6Wktmbl
   Ir8T4B7jWp5FOFL85qIOpCBSibcB+xh6viTkG84ykGLep+NFBnPFdsKgQ
   KHtAqcDT4rsj1jciQkiEKeoawk9az6j9OwcouM7lo3J6EWRzus2Vj7HTQ
   KHcxWgyXKsa149bZpx2ylmBPFkhPYDtNGm0T5JdkTDgrF5+gXz0vyyM41
   8xWzoMT68WMOj9kRALD48CSFKGJ3t92Vhd6+N/89VuHOjAEcTW51e12Xg
   w==;
X-CSE-ConnectionGUID: A+UpmwKjRcOKWUWZ5ikOVw==
X-CSE-MsgGUID: Qm3bYPW+RaGnOJmTa8olFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86386222"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="86386222"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 12:20:02 -0700
X-CSE-ConnectionGUID: ttCrLzP8Rhqp0ErVANHTgw==
X-CSE-MsgGUID: 4t5awXD9QHS8xrZO/HiZhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="176783125"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2025 12:20:01 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v18YR-0003SX-0j;
	Tue, 23 Sep 2025 19:19:59 +0000
Date: Wed, 24 Sep 2025 03:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:ethos-v3 3/3] drivers/accel/ethosu/ethosu_drv.c:210:16: error:
 implicit declaration of function 'FIELD_GET'
Message-ID: <202509240358.NklelJx2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v3
head:   6bafb6b0701a741e75c9f159f3b6e8cf07d48b55
commit: 6bafb6b0701a741e75c9f159f3b6e8cf07d48b55 [3/3] accel: Add Arm Ethos-U NPU driver
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250924/202509240358.NklelJx2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240358.NklelJx2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240358.NklelJx2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/ethosu/ethosu_drv.c: In function 'ethosu_is_u65':
>> drivers/accel/ethosu/ethosu_drv.c:210:16: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     210 |         return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosudev->npu_info.id) == 1;
         |                ^~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/accel/ethosu/ethosu_drv.c:10:
   drivers/accel/ethosu/ethosu_drv.c: In function 'ethosu_init':
   drivers/accel/ethosu/ethosu_drv.c:339:17: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
     339 |                 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:338:9: note: in expansion of macro 'dev_info'
     338 |         dev_info(ethosudev->base.dev,
         |         ^~~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:339:39: note: format string is defined here
     339 |                 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                     ~~^
         |                                       |
         |                                       long int
         |                                     %d
   drivers/accel/ethosu/ethosu_drv.c:339:17: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'int' [-Wformat=]
     339 |                 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:338:9: note: in expansion of macro 'dev_info'
     338 |         dev_info(ethosudev->base.dev,
         |         ^~~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:339:43: note: format string is defined here
     339 |                 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                         ~~^
         |                                           |
         |                                           long int
         |                                         %d
   drivers/accel/ethosu/ethosu_drv.c:339:17: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'int' [-Wformat=]
     339 |                 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:338:9: note: in expansion of macro 'dev_info'
     338 |         dev_info(ethosudev->base.dev,
         |         ^~~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:339:47: note: format string is defined here
     339 |                 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                             ~~^
         |                                               |
         |                                               long int
         |                                             %d
   drivers/accel/ethosu/ethosu_drv.c:339:17: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'int' [-Wformat=]
     339 |                 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:338:9: note: in expansion of macro 'dev_info'
     338 |         dev_info(ethosudev->base.dev,
         |         ^~~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:339:57: note: format string is defined here
     339 |                 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                                       ~~^
         |                                                         |
         |                                                         long int
         |                                                       %d
   drivers/accel/ethosu/ethosu_drv.c:339:17: warning: format '%ld' expects argument of type 'long int', but argument 7 has type 'int' [-Wformat=]
     339 |                 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:338:9: note: in expansion of macro 'dev_info'
     338 |         dev_info(ethosudev->base.dev,
         |         ^~~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:339:61: note: format string is defined here
     339 |                 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                                           ~~^
         |                                                             |
         |                                                             long int
         |                                                           %d
   drivers/accel/ethosu/ethosu_drv.c:339:17: warning: format '%ld' expects argument of type 'long int', but argument 8 has type 'int' [-Wformat=]
     339 |                 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'


vim +/FIELD_GET +210 drivers/accel/ethosu/ethosu_drv.c

   207	
   208	static bool ethosu_is_u65(const struct ethosu_device *ethosudev)
   209	{
 > 210		return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosudev->npu_info.id) == 1;
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
