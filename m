Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A6AD23
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 02:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733018508; cv=none; b=jaFmOlKjYy5uRc+Fw9ryr6BK70wD/Akowb4wslGt9D8grYQGTBHoxO89ZTldvTqu6hhcSOAdw5LR4+lRbX/mV/zCgJFki/xoMWz3IZh5QM6EF7l4zdRDCKiMZWPHwA2a+MTo7TBARGjhZkNkoTXe0zeT9zNLGDh68Jad5Ta46S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733018508; c=relaxed/simple;
	bh=3C2jU3oafWCffi1CIVU/bhZ4LIFwlexh1pPiVDn1EZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cTP7L8zDxeEToofwnt55kFGr4DLle83LZzdbslrC7HjDiiyotXeACZu6eHCqHxnG6BR30GX3MAbQB+9rdLXOnqMrmYY1Ff/ufKNwyfRNwxHN73+DLUcf7EnARgGs3Uv0BAp2xvtvX4oWxOUrk9JCNgvKeIiBk7e8OQfGr9iPBxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WasVBEud; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WasVBEud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733018507; x=1764554507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3C2jU3oafWCffi1CIVU/bhZ4LIFwlexh1pPiVDn1EZU=;
  b=WasVBEudko1UFDJUvhN597/7+hT8W8Ipr2RjmWL2WRZy2JEfo2xV6nfp
   plciP8OJVImiKr3quASA8e4ve/az2OjB6Qehnyu2DWjL77hu7s6HNfr54
   ZS7NOzhWLIkZdghnNga2NUcQfoQaNwJhO3ZDUKiT0NNZ3SuZD5++V5fg/
   5BdMPHLnqrqqDIzTPHhpmIOJAPnvWPNcjABD10sOCNUZmh8cB0rz+6wk5
   vkt1Ni6X+Ol5Ywzw2BaIiRxAZO8TwgNlNtNG8yyHkCPPVlEPleNi1aS81
   ZrsQTIamFClLsA6CdRbo8c6wjdZKf3F8HzItCrSFEZmEGf0L9wW5xHe3H
   Q==;
X-CSE-ConnectionGUID: Bd0+aHfETZueXbFEyBLjHg==
X-CSE-MsgGUID: uOdgPOJMSnmz92uQ+xG7MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="36065163"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="36065163"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 18:01:46 -0800
X-CSE-ConnectionGUID: YlfCK7/YSnGHJnULaGvP6g==
X-CSE-MsgGUID: 3t7jccnnRq2W+oC8jO32Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="123726556"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Nov 2024 18:01:45 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHZHK-00018P-2g;
	Sun, 01 Dec 2024 02:01:42 +0000
Date: Sun, 1 Dec 2024 10:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-attr 69/71]
 include/linux/sysfs.h:239:21: error: initialized field overwritten
Message-ID: <202412010926.0Xksa2jx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-attr
head:   aed513ca2679dc1dac28c9fc5e230c9102c73a72
commit: a0965582e0a49944224cef0b8ea6dd3f961630fd [69/71] _Generic
config: x86_64-randconfig-161-20241201 (https://download.01.org/0day-ci/archive/20241201/202412010926.0Xksa2jx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010926.0Xksa2jx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010926.0Xksa2jx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/acpi.h:14,
                    from drivers/gpu/drm/drm_sysfs.c:13:
>> include/linux/sysfs.h:239:21: error: initialized field overwritten [-Werror=override-init]
     239 |         .show_new = _Generic(_show,                                     \
         |                     ^~~~~~~~
   include/linux/sysfs.h:254:9: note: in expansion of macro '__ATTR_SHOW'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~
   include/linux/device/class.h:217:11: note: in expansion of macro '__ATTR'
     217 |         { __ATTR(_name, _mode, show_class_attr_string, NULL), _str }
         |           ^~~~~~
   include/linux/device/class.h:220:17: note: in expansion of macro '_CLASS_ATTR_STRING'
     220 |                 _CLASS_ATTR_STRING(_name, _mode, _str)
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_sysfs.c:129:8: note: in expansion of macro 'CLASS_ATTR_STRING'
     129 | static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
         |        ^~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:21: note: (near initialization for 'class_attr_version.attr.<anonymous>.show_new')
     239 |         .show_new = _Generic(_show,                                     \
         |                     ^~~~~~~~
   include/linux/sysfs.h:254:9: note: in expansion of macro '__ATTR_SHOW'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~
   include/linux/device/class.h:217:11: note: in expansion of macro '__ATTR'
     217 |         { __ATTR(_name, _mode, show_class_attr_string, NULL), _str }
         |           ^~~~~~
   include/linux/device/class.h:220:17: note: in expansion of macro '_CLASS_ATTR_STRING'
     220 |                 _CLASS_ATTR_STRING(_name, _mode, _str)
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_sysfs.c:129:8: note: in expansion of macro 'CLASS_ATTR_STRING'
     129 | static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
         |        ^~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:247:22: error: initialized field overwritten [-Werror=override-init]
     247 |         .store_new = _Generic(_store,                                   \
         |                      ^~~~~~~~
   include/linux/sysfs.h:255:9: note: in expansion of macro '__ATTR_STORE'
     255 |         __ATTR_STORE(_store),                                           \
         |         ^~~~~~~~~~~~
   include/linux/device/class.h:217:11: note: in expansion of macro '__ATTR'
     217 |         { __ATTR(_name, _mode, show_class_attr_string, NULL), _str }
         |           ^~~~~~
   include/linux/device/class.h:220:17: note: in expansion of macro '_CLASS_ATTR_STRING'
     220 |                 _CLASS_ATTR_STRING(_name, _mode, _str)
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_sysfs.c:129:8: note: in expansion of macro 'CLASS_ATTR_STRING'
     129 | static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
         |        ^~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:247:22: note: (near initialization for 'class_attr_version.attr.<anonymous>.store_new')
     247 |         .store_new = _Generic(_store,                                   \
         |                      ^~~~~~~~
   include/linux/sysfs.h:255:9: note: in expansion of macro '__ATTR_STORE'
     255 |         __ATTR_STORE(_store),                                           \
         |         ^~~~~~~~~~~~
   include/linux/device/class.h:217:11: note: in expansion of macro '__ATTR'
     217 |         { __ATTR(_name, _mode, show_class_attr_string, NULL), _str }
         |           ^~~~~~
   include/linux/device/class.h:220:17: note: in expansion of macro '_CLASS_ATTR_STRING'
     220 |                 _CLASS_ATTR_STRING(_name, _mode, _str)
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_sysfs.c:129:8: note: in expansion of macro 'CLASS_ATTR_STRING'
     129 | static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
         |        ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +239 include/linux/sysfs.h

   229	
   230	/*
   231	 * Use these macros to make defining attributes easier.
   232	 * See include/linux/device.h for examples..
   233	 */
   234	
   235	#define __ATTR_SHOW(_show)						\
   236		.show	= _Generic(_show,					\
   237			default : _show						\
   238		),								\
 > 239		.show_new = _Generic(_show,					\
   240			default : NULL						\
   241		)
   242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
