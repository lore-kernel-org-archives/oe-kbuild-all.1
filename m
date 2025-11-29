Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298EB1DE8AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764420245; cv=none; b=CnPnh25zBQ4fyFPfKZrrq0HChGmHRODnunEdU4Wx0tS/qfB+XBxbOaeedHyUIr+K/z3tjzsp9vNQ2e8ftMBdwhj5REl4LsoXQrZYEzGvpqaQYSyaZ25EWEtFmCAOKYZ+TNL5qwEONvzV9sRUuXb33OBzxGCVH+uVj4gJh8acpcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764420245; c=relaxed/simple;
	bh=AWzkHo8AVvM9I8ovQjJdmxd1/aHS/M7XJZIn1q6Ou5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HEeLdyO6x3inoxJySzURGlq1Qv6jfhZVaXh31wTJ8pYS364Yl/KreXhw6HyRM2YUlwpasgtztUdGHEKKsbvxGc1CGkDGkAK6zu7JX9IJne71aJnW3lj0o2rHI0qPSHKPSKNFxIq96aZn4ON2+eJxSq9xLL0zvJVhLOlZiiLvXQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R53YlJ6s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R53YlJ6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764420243; x=1795956243;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AWzkHo8AVvM9I8ovQjJdmxd1/aHS/M7XJZIn1q6Ou5c=;
  b=R53YlJ6sJtUtp+SRcMBK7YBbilz/Gb3t2rt5Pu7DpzMQmDrnn9zACyQu
   5QSu6I1iCUGoa2yO8mykSEM8M1j/V04uM2QNdieXsMGfeTuVl87Ia4e2p
   N16fcqTJQ5IT/Ss4s3AwAcNQfM5pTnQPPqpeo4TU6zMnX8mYoCtvVFR/Q
   8Wu6iM+zqQtTxEnH5lj1kYrJp87JGmAfn3F0HVH1xC7ewgsDXN/r+rYQ7
   3HjzgXFX65LHmrsxJeQYJtnI3N+mB9We59Yc3zIFXbzqRAzjS3HDU9jEM
   BHCQ1wkWwTfOv433LtVtojni26eucrl9LJaDE3P6CpS/NQDyyP6EIkxAy
   w==;
X-CSE-ConnectionGUID: U2KZP978QluW9EcWBtUaaw==
X-CSE-MsgGUID: yAGGG0DOSly3DKpQ8RH4tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77050214"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="77050214"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 04:44:01 -0800
X-CSE-ConnectionGUID: aoONmJKjQoq50dUEWlC+KQ==
X-CSE-MsgGUID: NMZ+9TjkQpae2R/sL8yARw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="198125554"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Nov 2025 04:44:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPKIv-000000007AT-4AJq;
	Sat, 29 Nov 2025 12:43:58 +0000
Date: Sat, 29 Nov 2025 20:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/46]
 drivers/platform/x86/dell/dell-pc.c:247:25: warning: assignment to 'struct
 platform_profile_handler *' from 'int' makes pointer from integer without a
 cast
Message-ID: <202511292008.hldmhgRq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   b6f9c712b4dc25b00af4208e59b4ee8f344e0ab8
commit: 82c3c913af0c82e7da403f126de414662b19d5ab [0/46] UPSTREAM: ACPI: platform_profile: Move platform_profile_handler
config: x86_64-randconfig-015-20251129 (https://download.01.org/0day-ci/archive/20251129/202511292008.hldmhgRq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511292008.hldmhgRq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511292008.hldmhgRq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from include/linux/radix-tree.h:16,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/dmi.h:6,
                    from drivers/platform/x86/dell/dell-pc.c:15:
   drivers/platform/x86/dell/dell-pc.c: In function 'thermal_init':
   drivers/platform/x86/dell/dell-pc.c:247:41: error: invalid application of 'sizeof' to incomplete type 'struct platform_profile_handler'
     247 |         thermal_handler = kzalloc(sizeof(*thermal_handler), GFP_KERNEL);
         |                                         ^
   include/linux/alloc_tag.h:227:16: note: in definition of macro 'alloc_hooks_tag'
     227 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:1019:49: note: in expansion of macro 'alloc_hooks'
    1019 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/platform/x86/dell/dell-pc.c:247:27: note: in expansion of macro 'kzalloc'
     247 |         thermal_handler = kzalloc(sizeof(*thermal_handler), GFP_KERNEL);
         |                           ^~~~~~~
   drivers/platform/x86/dell/dell-pc.c:247:41: error: invalid application of 'sizeof' to incomplete type 'struct platform_profile_handler'
     247 |         thermal_handler = kzalloc(sizeof(*thermal_handler), GFP_KERNEL);
         |                                         ^
   include/linux/alloc_tag.h:231:24: note: in definition of macro 'alloc_hooks_tag'
     231 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1019:49: note: in expansion of macro 'alloc_hooks'
    1019 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/platform/x86/dell/dell-pc.c:247:27: note: in expansion of macro 'kzalloc'
     247 |         thermal_handler = kzalloc(sizeof(*thermal_handler), GFP_KERNEL);
         |                           ^~~~~~~
   drivers/platform/x86/dell/dell-pc.c:247:41: error: invalid application of 'sizeof' to incomplete type 'struct platform_profile_handler'
     247 |         thermal_handler = kzalloc(sizeof(*thermal_handler), GFP_KERNEL);
         |                                         ^
   include/linux/alloc_tag.h:234:24: note: in definition of macro 'alloc_hooks_tag'
     234 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1019:49: note: in expansion of macro 'alloc_hooks'
    1019 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/platform/x86/dell/dell-pc.c:247:27: note: in expansion of macro 'kzalloc'
     247 |         thermal_handler = kzalloc(sizeof(*thermal_handler), GFP_KERNEL);
         |                           ^~~~~~~
>> drivers/platform/x86/dell/dell-pc.c:247:25: warning: assignment to 'struct platform_profile_handler *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     247 |         thermal_handler = kzalloc(sizeof(*thermal_handler), GFP_KERNEL);
         |                         ^
   drivers/platform/x86/dell/dell-pc.c:250:24: error: invalid use of undefined type 'struct platform_profile_handler'
     250 |         thermal_handler->profile_get = thermal_platform_profile_get;
         |                        ^~
   drivers/platform/x86/dell/dell-pc.c:251:24: error: invalid use of undefined type 'struct platform_profile_handler'
     251 |         thermal_handler->profile_set = thermal_platform_profile_set;
         |                        ^~
   drivers/platform/x86/dell/dell-pc.c:254:64: error: invalid use of undefined type 'struct platform_profile_handler'
     254 |                 set_bit(PLATFORM_PROFILE_QUIET, thermal_handler->choices);
         |                                                                ^~
   drivers/platform/x86/dell/dell-pc.c:256:63: error: invalid use of undefined type 'struct platform_profile_handler'
     256 |                 set_bit(PLATFORM_PROFILE_COOL, thermal_handler->choices);
         |                                                               ^~
   drivers/platform/x86/dell/dell-pc.c:258:67: error: invalid use of undefined type 'struct platform_profile_handler'
     258 |                 set_bit(PLATFORM_PROFILE_BALANCED, thermal_handler->choices);
         |                                                                   ^~
   drivers/platform/x86/dell/dell-pc.c:260:70: error: invalid use of undefined type 'struct platform_profile_handler'
     260 |                 set_bit(PLATFORM_PROFILE_PERFORMANCE, thermal_handler->choices);
         |                                                                      ^~
   drivers/platform/x86/dell/dell-pc.c:263:41: error: passing argument 1 of 'platform_profile_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
     263 |         ret = platform_profile_register(thermal_handler);
         |                                         ^~~~~~~~~~~~~~~
         |                                         |
         |                                         struct platform_profile_handler *
   In file included from drivers/platform/x86/dell/dell-pc.c:20:
   include/linux/platform_profile.h:37:57: note: expected 'struct device *' but argument is of type 'struct platform_profile_handler *'
      37 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                                          ~~~~~~~~~~~~~~~^~~
   drivers/platform/x86/dell/dell-pc.c:263:15: error: too few arguments to function 'platform_profile_register'
     263 |         ret = platform_profile_register(thermal_handler);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:37:16: note: declared here
      37 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-pc.c: In function 'thermal_cleanup':
   drivers/platform/x86/dell/dell-pc.c:275:17: error: too few arguments to function 'platform_profile_remove'
     275 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct device *dev);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +247 drivers/platform/x86/dell/dell-pc.c

996ad412981024 Lyndon Sanche    2024-05-29  230  
996ad412981024 Lyndon Sanche    2024-05-29  231  static int thermal_init(void)
996ad412981024 Lyndon Sanche    2024-05-29  232  {
996ad412981024 Lyndon Sanche    2024-05-29  233  	int ret;
996ad412981024 Lyndon Sanche    2024-05-29  234  	int supported_modes;
996ad412981024 Lyndon Sanche    2024-05-29  235  
996ad412981024 Lyndon Sanche    2024-05-29  236  	/* If thermal commands are not supported, exit without error */
996ad412981024 Lyndon Sanche    2024-05-29  237  	if (!dell_smbios_class_is_supported(CLASS_INFO))
996ad412981024 Lyndon Sanche    2024-05-29  238  		return 0;
996ad412981024 Lyndon Sanche    2024-05-29  239  
996ad412981024 Lyndon Sanche    2024-05-29  240  	/* If thermal modes are not supported, exit without error */
996ad412981024 Lyndon Sanche    2024-05-29  241  	ret = thermal_get_supported_modes(&supported_modes);
996ad412981024 Lyndon Sanche    2024-05-29  242  	if (ret < 0)
996ad412981024 Lyndon Sanche    2024-05-29  243  		return ret;
996ad412981024 Lyndon Sanche    2024-05-29  244  	if (!supported_modes)
996ad412981024 Lyndon Sanche    2024-05-29  245  		return 0;
996ad412981024 Lyndon Sanche    2024-05-29  246  
996ad412981024 Lyndon Sanche    2024-05-29 @247  	thermal_handler = kzalloc(sizeof(*thermal_handler), GFP_KERNEL);
996ad412981024 Lyndon Sanche    2024-05-29  248  	if (!thermal_handler)
996ad412981024 Lyndon Sanche    2024-05-29  249  		return -ENOMEM;
996ad412981024 Lyndon Sanche    2024-05-29  250  	thermal_handler->profile_get = thermal_platform_profile_get;
996ad412981024 Lyndon Sanche    2024-05-29  251  	thermal_handler->profile_set = thermal_platform_profile_set;
996ad412981024 Lyndon Sanche    2024-05-29  252  
996ad412981024 Lyndon Sanche    2024-05-29  253  	if (supported_modes & DELL_QUIET)
996ad412981024 Lyndon Sanche    2024-05-29  254  		set_bit(PLATFORM_PROFILE_QUIET, thermal_handler->choices);
996ad412981024 Lyndon Sanche    2024-05-29  255  	if (supported_modes & DELL_COOL_BOTTOM)
996ad412981024 Lyndon Sanche    2024-05-29  256  		set_bit(PLATFORM_PROFILE_COOL, thermal_handler->choices);
996ad412981024 Lyndon Sanche    2024-05-29  257  	if (supported_modes & DELL_BALANCED)
996ad412981024 Lyndon Sanche    2024-05-29  258  		set_bit(PLATFORM_PROFILE_BALANCED, thermal_handler->choices);
996ad412981024 Lyndon Sanche    2024-05-29  259  	if (supported_modes & DELL_PERFORMANCE)
996ad412981024 Lyndon Sanche    2024-05-29  260  		set_bit(PLATFORM_PROFILE_PERFORMANCE, thermal_handler->choices);
996ad412981024 Lyndon Sanche    2024-05-29  261  
996ad412981024 Lyndon Sanche    2024-05-29  262  	/* Clean up if failed */
996ad412981024 Lyndon Sanche    2024-05-29  263  	ret = platform_profile_register(thermal_handler);
dd637f5cd5f334 Thomas Weiﬂschuh 2024-06-04  264  	if (ret) {
996ad412981024 Lyndon Sanche    2024-05-29  265  		kfree(thermal_handler);
dd637f5cd5f334 Thomas Weiﬂschuh 2024-06-04  266  		thermal_handler = NULL;
dd637f5cd5f334 Thomas Weiﬂschuh 2024-06-04  267  	}
996ad412981024 Lyndon Sanche    2024-05-29  268  
996ad412981024 Lyndon Sanche    2024-05-29  269  	return ret;
996ad412981024 Lyndon Sanche    2024-05-29  270  }
996ad412981024 Lyndon Sanche    2024-05-29  271  

:::::: The code at line 247 was first introduced by commit
:::::: 996ad412981024a9bb90991ab195685d37187bbd platform/x86: dell-pc: Implement platform_profile

:::::: TO: Lyndon Sanche <lsanche@lyndeno.ca>
:::::: CC: Ilpo J‰rvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
