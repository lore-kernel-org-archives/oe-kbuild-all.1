Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AA9EED8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 22:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770158759; cv=none; b=IBy/SaBXgwwDqI1K8Q2TeZ7sUcs6rOCfUhjQYN3MpIt/xmjcgIASbuGG5shJqa0oomZ2Y/cN5WgPOVebQfiREmKFFSks9+mp+ZX+K0aZvMGtgVwdaVZtfGgzbM/OUaUj1VG62vT1Manx+qdOdokc8PTOcgd96V5FZUAw4tPkpJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770158759; c=relaxed/simple;
	bh=Sf03Lbxd5v8By87FZKoEzMeaMBfKQnVFDPp5/2hJNi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pPrK5pwzWog+JdbfelQQ5zLqi3RRE1gJqezKRua/14rI+xMo0/ViZ0jySktJbaLTdx5bBgYGx/a8B4db5AB/sXg4eBjdy7bJF8uinbQFNqbKgWWN0IQeGaA3h3ydfxmokbSCSeXBH3H7oXbfjdASH0PDONPEMlf8cvOBIrv+yWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I90SKfpP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I90SKfpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770158757; x=1801694757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sf03Lbxd5v8By87FZKoEzMeaMBfKQnVFDPp5/2hJNi0=;
  b=I90SKfpPsVMbet3NC26fl3KzioEFuKEj76mvb3VNk0012hRNWwHAZfKo
   TTkPpBtO63cbCOCFX+EXPQ/mkcc2jcwmZNbS3Dnb59sReDVdBf7xH0NEH
   KDucDb8s6zkH6xmMjxQS4cGMSqsuq3Q2GemBfMjuuxS36kj/cMFNk2tMW
   wu9WtqfCf7TCVbWc3qn76apis/QXjyltUYwQ2weQPnbcQC70ATVtXaHLX
   huNme4QG/0Kd0UJcAmO2rYLEG9fQ9QuN/oa+LKGsF+7xBqllVKlSJcQsr
   CwWE99XK0juC4TjEMoYM8aNqZ+e7ywrmS/TkoV/1Kz+2VFPrT9jxO4M/Y
   Q==;
X-CSE-ConnectionGUID: nSnD/oG/TB2+/qnYtLR2Tw==
X-CSE-MsgGUID: icAR0vsqQGWnRSigYwVnZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82711493"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="82711493"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 14:45:56 -0800
X-CSE-ConnectionGUID: R4M2dlF/QeqCbDJLC53MqQ==
X-CSE-MsgGUID: wwilkwGARBme2MWwq2hbUg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Feb 2026 14:45:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnP9c-00000000hEu-3Q7u;
	Tue, 03 Feb 2026 22:45:52 +0000
Date: Wed, 04 Feb 2026 06:44:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 57/60] include/drm/drm_print.h:580:9:
 error: implicit declaration of function '_dynamic_func_call_cls'
Message-ID: <202602040620.v2vASkep-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   38ba873402d9f1555e9286434e6f6527ae186eee
commit: 72bacda9f889ff05c7c5cff29c02b7bb393c9f3e [57/60] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: csky-randconfig-r134-20260203 (https://download.01.org/0day-ci/archive/20260204/202602040620.v2vASkep-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040620.v2vASkep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040620.v2vASkep-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accel/rocket/rocket_gem.c:5:
   drivers/accel/rocket/rocket_gem.c: In function 'rocket_ioctl_prep_bo':
>> include/drm/drm_print.h:580:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:665:9: note: in expansion of macro 'drm_dev_dbg'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:683:33: note: in expansion of macro 'drm_dbg_driver'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/accel/rocket/rocket_gem.c:137:17: note: in expansion of macro 'drm_dbg'
     137 |                 drm_dbg(dev, "Reserved field in drm_rocket_prep_bo struct should be 0.\n");
         |                 ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/accel/rocket/rocket_job.c:6:
   drivers/accel/rocket/rocket_job.c: In function 'rocket_copy_tasks':
>> include/drm/drm_print.h:580:9: error: implicit declaration of function '_dynamic_func_call_cls' [-Werror=implicit-function-declaration]
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:665:9: note: in expansion of macro 'drm_dev_dbg'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:683:33: note: in expansion of macro 'drm_dbg_driver'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/accel/rocket/rocket_job.c:76:17: note: in expansion of macro 'drm_dbg'
      76 |                 drm_dbg(dev, "Failed to allocate task array\n");
         |                 ^~~~~~~
   cc1: some warnings being treated as errors


vim +/_dynamic_func_call_cls +580 include/drm/drm_print.h

02c9656b2f0d69 Haneen Mohammed 2017-10-17  574  
84ec67288c10fb Jim Cromie      2022-09-11  575  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
e820f52577b14c Jim Cromie      2022-09-11  576  #define drm_dev_dbg(dev, cat, fmt, ...)				\
16deeb8e18cafd Jim Cromie      2022-09-11  577  	__drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
84ec67288c10fb Jim Cromie      2022-09-11  578  #else
84ec67288c10fb Jim Cromie      2022-09-11  579  #define drm_dev_dbg(dev, cat, fmt, ...)				\
16deeb8e18cafd Jim Cromie      2022-09-11 @580  	_dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,		\
84ec67288c10fb Jim Cromie      2022-09-11  581  			       dev, cat, fmt, ##__VA_ARGS__)
84ec67288c10fb Jim Cromie      2022-09-11  582  #endif
e820f52577b14c Jim Cromie      2022-09-11  583  

:::::: The code at line 580 was first introduced by commit
:::::: 16deeb8e18cafd30e70d8dc2b12a753b28298d8a drm_print: add _ddebug descriptor to drm_*dbg prototypes

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
