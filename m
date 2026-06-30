Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E9334AB1D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 14:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831325; cv=none; b=gbXUcLc2HFGjK8C36Dl6ZN04akIj/RkWERYHJvxtBlNQYD18LZbwaFcv2HR/lkHmFx9qVXnKpfHtOtPbElvDFTnCN0KhvUqhDUJNzfvDwLwRLHCufFXIR7GYH/AB/2xHzs3FdCCwguaifPDiB4pTUWknh6naI1PFunMKEzsJ/ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831325; c=relaxed/simple;
	bh=mE0oP/y4xpBWzm4e6XW0yF0v0kXReRGF5Bham+rh2N4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rniUarsOVtagNWoybh0CihrsDk0hNEdxLWLEVJDVjYN0mHQLtZXuienib5HjYKhiZKdbXmL47bTR+yzpb6AL3DL/5YL7++q0qG9WZpRyXJByxAE+rQkEWl1mdaZ51DkCvOmDoYhqSxMAqGHTufszVlcIIdcgHx2ZqUZXHgyTKQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7mi3MnX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7mi3MnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782831324; x=1814367324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mE0oP/y4xpBWzm4e6XW0yF0v0kXReRGF5Bham+rh2N4=;
  b=F7mi3MnXUsmxuD7Rt2Wn/zlhsbTJU8Qt3db7W8OhHq4NHxznQEzYDVdf
   RHg+POYxoeVDSo42sar/QWOUUpxy2pQdlxKWEWSfdD3doET3WwKB4Gkh5
   7HZo7yujUBzZPS2m/Gh+NxCAZZ6IMXl7yfj7gqz6XUQhQYcbWBbtyqi+2
   Tf/cmiofTDyEYRL/gOrescWEoizdbboFMlUAOgYJvPmpIHx0e+WUwVZ+x
   qtHnW4uMaV48f2fI2pIxytT0uWSWB5T90Or9fx9t9acq6DDF2pw7we5M5
   9w83ts6kbqoN4WRTYDcYLiPrssnTgQAlwDht2DfDastI+1PA7wUf1idQs
   Q==;
X-CSE-ConnectionGUID: qZmTOifWS9Kc0SPyN9yhaQ==
X-CSE-MsgGUID: hh9Itx3vS+Gt67e1rMkgLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="71070938"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="71070938"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 07:55:23 -0700
X-CSE-ConnectionGUID: N1akEuQzRl26rLVefZZ3ig==
X-CSE-MsgGUID: MEaakkqxTeG2ZPIYLKDY2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="251227563"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Jun 2026 07:55:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weZrm-000000008R2-1D2R;
	Tue, 30 Jun 2026 14:55:17 +0000
Date: Tue, 30 Jun 2026 22:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-attr-device_attr 7/12]
 drivers/perf/nvidia_t410_cmem_latency_pmu.c:447:25: error: initialization of
 'ssize_t (*)(struct device *, struct device_attribute *, char *)' {aka 'long
 int (*)(struct device *, struct device_attribute *, char *)'} from
 incompatible pointer type 'ssize_t...
Message-ID: <202606302225.46YfF2f1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-attr-device_attr
head:   7509ac6ef406a6f342fe4fd8a535be9040c0a6b4
commit: f0e3526d7effb670e09f41beb6ed08d9d08a2f87 [7/12] device_string
config: arm64-randconfig-004-20260630 (https://download.01.org/0day-ci/archive/20260630/202606302225.46YfF2f1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606302225.46YfF2f1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606302225.46YfF2f1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/acpi.h:15,
                    from drivers/perf/nvidia_t410_cmem_latency_pmu.c:8:
>> drivers/perf/nvidia_t410_cmem_latency_pmu.c:447:25: error: initialization of 'ssize_t (*)(struct device *, struct device_attribute *, char *)' {aka 'long int (*)(struct device *, struct device_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct device *, const struct device_attribute *, char *)' {aka 'long int (*)(struct device *, const struct device_attribute *, char *)'} [-Werror=incompatible-pointer-types]
     447 |  NV_PMU_EXT_ATTR(event, device_show_string, "config:0-1"),
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:243:10: note: in definition of macro '__ATTR'
     243 |  .show = _show,      \
         |          ^~~~~
   drivers/perf/nvidia_t410_cmem_latency_pmu.c:447:2: note: in expansion of macro 'NV_PMU_EXT_ATTR'
     447 |  NV_PMU_EXT_ATTR(event, device_show_string, "config:0-1"),
         |  ^~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_cmem_latency_pmu.c:447:25: note: (near initialization for '(anonymous)[0].attr.<anonymous>.show')
     447 |  NV_PMU_EXT_ATTR(event, device_show_string, "config:0-1"),
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:243:10: note: in definition of macro '__ATTR'
     243 |  .show = _show,      \
         |          ^~~~~
   drivers/perf/nvidia_t410_cmem_latency_pmu.c:447:2: note: in expansion of macro 'NV_PMU_EXT_ATTR'
     447 |  NV_PMU_EXT_ATTR(event, device_show_string, "config:0-1"),
         |  ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/acpi.h:15,
                    from drivers/perf/nvidia_t410_c2c_pmu.c:8:
>> drivers/perf/nvidia_t410_c2c_pmu.c:554:29: error: initialization of 'ssize_t (*)(struct device *, struct device_attribute *, char *)' {aka 'long int (*)(struct device *, struct device_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct device *, const struct device_attribute *, char *)' {aka 'long int (*)(struct device *, const struct device_attribute *, char *)'} [-Werror=incompatible-pointer-types]
     554 |  NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:243:10: note: in definition of macro '__ATTR'
     243 |  .show = _show,      \
         |          ^~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:554:2: note: in expansion of macro 'NV_C2C_PMU_EXT_ATTR'
     554 |  NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:557:2: note: in expansion of macro 'NV_C2C_PMU_FORMAT_ATTR'
     557 |  NV_C2C_PMU_FORMAT_ATTR(event, "config:0-3")
         |  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:560:2: note: in expansion of macro 'NV_C2C_PMU_FORMAT_EVENT_ATTR'
     560 |  NV_C2C_PMU_FORMAT_EVENT_ATTR,
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:554:29: note: (near initialization for '(anonymous)[0].attr.<anonymous>.show')
     554 |  NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:243:10: note: in definition of macro '__ATTR'
     243 |  .show = _show,      \
         |          ^~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:554:2: note: in expansion of macro 'NV_C2C_PMU_EXT_ATTR'
     554 |  NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:557:2: note: in expansion of macro 'NV_C2C_PMU_FORMAT_ATTR'
     557 |  NV_C2C_PMU_FORMAT_ATTR(event, "config:0-3")
         |  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:560:2: note: in expansion of macro 'NV_C2C_PMU_FORMAT_EVENT_ATTR'
     560 |  NV_C2C_PMU_FORMAT_EVENT_ATTR,
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/perf/nvidia_t410_c2c_pmu.c:554:29: error: initialization of 'ssize_t (*)(struct device *, struct device_attribute *, char *)' {aka 'long int (*)(struct device *, struct device_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct device *, const struct device_attribute *, char *)' {aka 'long int (*)(struct device *, const struct device_attribute *, char *)'} [-Werror=incompatible-pointer-types]
     554 |  NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:243:10: note: in definition of macro '__ATTR'
     243 |  .show = _show,      \
         |          ^~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:554:2: note: in expansion of macro 'NV_C2C_PMU_EXT_ATTR'
     554 |  NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:561:2: note: in expansion of macro 'NV_C2C_PMU_FORMAT_ATTR'
     561 |  NV_C2C_PMU_FORMAT_ATTR(gpu_mask, "config1:0-1"),
         |  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:554:29: note: (near initialization for '(anonymous)[0].attr.<anonymous>.show')
     554 |  NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:243:10: note: in definition of macro '__ATTR'
     243 |  .show = _show,      \
         |          ^~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:554:2: note: in expansion of macro 'NV_C2C_PMU_EXT_ATTR'
     554 |  NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:561:2: note: in expansion of macro 'NV_C2C_PMU_FORMAT_ATTR'
     561 |  NV_C2C_PMU_FORMAT_ATTR(gpu_mask, "config1:0-1"),
         |  ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/perf/nvidia_t410_c2c_pmu.c:554:29: error: initialization of 'ssize_t (*)(struct device *, struct device_attribute *, char *)' {aka 'long int (*)(struct device *, struct device_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct device *, const struct device_attribute *, char *)' {aka 'long int (*)(struct device *, const struct device_attribute *, char *)'} [-Werror=incompatible-pointer-types]
     554 |  NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:243:10: note: in definition of macro '__ATTR'
     243 |  .show = _show,      \
         |          ^~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:554:2: note: in expansion of macro 'NV_C2C_PMU_EXT_ATTR'
     554 |  NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:557:2: note: in expansion of macro 'NV_C2C_PMU_FORMAT_ATTR'
     557 |  NV_C2C_PMU_FORMAT_ATTR(event, "config:0-3")
         |  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:571:2: note: in expansion of macro 'NV_C2C_PMU_FORMAT_EVENT_ATTR'
     571 |  NV_C2C_PMU_FORMAT_EVENT_ATTR,
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:554:29: note: (near initialization for '(anonymous)[0].attr.<anonymous>.show')
     554 |  NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:243:10: note: in definition of macro '__ATTR'
     243 |  .show = _show,      \
         |          ^~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:554:2: note: in expansion of macro 'NV_C2C_PMU_EXT_ATTR'
     554 |  NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:557:2: note: in expansion of macro 'NV_C2C_PMU_FORMAT_ATTR'
     557 |  NV_C2C_PMU_FORMAT_ATTR(event, "config:0-3")
         |  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:571:2: note: in expansion of macro 'NV_C2C_PMU_FORMAT_EVENT_ATTR'
     571 |  NV_C2C_PMU_FORMAT_EVENT_ATTR,
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +447 drivers/perf/nvidia_t410_cmem_latency_pmu.c

429b7638b2df55 Besar Wicaksono 2026-03-24  437  
429b7638b2df55 Besar Wicaksono 2026-03-24  438  #define NV_PMU_EXT_ATTR(_name, _func, _config)			\
429b7638b2df55 Besar Wicaksono 2026-03-24  439  	(&((struct dev_ext_attribute[]){				\
429b7638b2df55 Besar Wicaksono 2026-03-24  440  		{							\
429b7638b2df55 Besar Wicaksono 2026-03-24  441  			.attr = __ATTR(_name, 0444, _func, NULL),	\
429b7638b2df55 Besar Wicaksono 2026-03-24  442  			.var = (void *)_config				\
429b7638b2df55 Besar Wicaksono 2026-03-24  443  		}							\
429b7638b2df55 Besar Wicaksono 2026-03-24  444  	})[0].attr.attr)
429b7638b2df55 Besar Wicaksono 2026-03-24  445  
429b7638b2df55 Besar Wicaksono 2026-03-24  446  static struct attribute *cmem_lat_pmu_formats[] = {
429b7638b2df55 Besar Wicaksono 2026-03-24 @447  	NV_PMU_EXT_ATTR(event, device_show_string, "config:0-1"),
429b7638b2df55 Besar Wicaksono 2026-03-24  448  	NULL
429b7638b2df55 Besar Wicaksono 2026-03-24  449  };
429b7638b2df55 Besar Wicaksono 2026-03-24  450  

:::::: The code at line 447 was first introduced by commit
:::::: 429b7638b2df5538e945aaa2cc189cf0d6e8fb3a perf: add NVIDIA Tegra410 CPU Memory Latency PMU

:::::: TO: Besar Wicaksono <bwicaksono@nvidia.com>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
