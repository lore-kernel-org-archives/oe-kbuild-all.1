Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7B4D512
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 03:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720668369; cv=none; b=VnUzmz3dXz43i7ykBlYH2K/pHqAE73pbL9v9JnPH4z8HMdfPkHpRDgArAOMRDIENtrS+STMpRc9xA/9XFCD02Fm81pLGFlRKvIPXMr6tiKmUTTzEmasz9cxgrx1rQDIheEvHKw1GG1QMAk/jIWlXEyZ2km1A1EnKlI4OkZbEk38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720668369; c=relaxed/simple;
	bh=NljvAmktfFx3Su1RoM7PteF0M5CeOZH4J8FdmtHl43Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QoNnAOLaWkFz2kc67inCZFZXm2CCgef9wz51OMLwaCdiPzMjRvJ7bGYmkhCz0vKoR3ATXNJaTyMEVfOzLd0AhIUHFbq8miVOpUBR1jM9SR/7VqN3rzmPoMgmjfKA9Xcd2VjgHmg0tZzOYOySPobXAXvTz1JaFmtiX6ybirrziKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWE2uHso; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWE2uHso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720668367; x=1752204367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NljvAmktfFx3Su1RoM7PteF0M5CeOZH4J8FdmtHl43Y=;
  b=JWE2uHso/glihY4keeF9cCj59hF6S6phP9oGKxhWwUl7Sw0U1LVXpmQP
   URe83FuiOyUHyDNal4WD3YNvLp6gMIT+cPqJmSG0+kvVroIVpeWZ57ExA
   qOXOQCNBhkX4pkK2c6yShUaeGOa1+3OBVvQAtw4ZHqTyC+QY+ZdWNDUOw
   cCYt8YScYzKhKAQ9B0xxUqrtbQjVWY8ASSlH9rTo21qgKjzVvmqGt1WJI
   fwz9PYdutsv/twEtzYPF54GUIa+VRaxtAqPbGKvwaO4leniiYjsApbmAt
   cyavg+dApa7XUAsAGG+twKEbR19hvCCldNNhv3lsnXFOyYhVmE+o1FDh3
   g==;
X-CSE-ConnectionGUID: BwajNwv6RMGAi+oaDpc8cw==
X-CSE-MsgGUID: p6Q2w6mEQsqsAHaJQVJg/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17843584"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17843584"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:26:02 -0700
X-CSE-ConnectionGUID: 3sG2l/+0RCulGvrkwPWOgA==
X-CSE-MsgGUID: PlD5ily+TnKyBz2j53PQCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48315242"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jul 2024 20:26:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRkRS-000Yh0-2V;
	Thu, 11 Jul 2024 03:25:58 +0000
Date: Thu, 11 Jul 2024 11:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-cip 6848/9999] drivers/cpufreq/ti-cpufreq.c:250:24:
 warning: passing argument 1 of 'PTR_ERR_OR_ZERO' makes pointer from integer
 without a cast
Message-ID: <202407111136.4e7BGX0u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-cip
head:   66bc7bd5b1c1d589edc9f96367624555b4684837
commit: d856d3f81d80f5aa336acb55575ab242fc3ca0b4 [6848/9999] cpufreq: ti: Add cpufreq driver to determine available OPPs at runtime
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240711/202407111136.4e7BGX0u-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111136.4e7BGX0u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111136.4e7BGX0u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:11:0,
                    from include/linux/rcupdate.h:40,
                    from include/linux/idr.h:18,
                    from include/linux/kernfs.h:14,
                    from include/linux/sysfs.h:15,
                    from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from include/linux/node.h:17,
                    from include/linux/cpu.h:16,
                    from drivers/cpufreq/ti-cpufreq.c:17:
   include/linux/bitmap.h: In function 'bitmap_empty':
   include/linux/bitmap.h:300:36: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return find_first_bit(src, nbits) == nbits;
                                       ^~
   include/linux/bitmap.h: In function 'bitmap_full':
   include/linux/bitmap.h:308:41: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return find_first_zero_bit(src, nbits) == nbits;
                                            ^~
   In file included from arch/arm/include/asm/bug.h:62:0,
                    from arch/arm/include/asm/div64.h:63,
                    from include/linux/kernel.h:136,
                    from include/linux/list.h:8,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from include/linux/node.h:17,
                    from include/linux/cpu.h:16,
                    from drivers/cpufreq/ti-cpufreq.c:17:
   include/linux/cpumask.h: In function 'cpumask_check':
   include/linux/cpumask.h:117:19: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     WARN_ON_ONCE(cpu >= nr_cpumask_bits);
                      ^
   include/asm-generic/bug.h:112:27: note: in definition of macro 'WARN_ON_ONCE'
     int __ret_warn_once = !!(condition);   \
                              ^~~~~~~~~
   drivers/cpufreq/ti-cpufreq.c: In function 'ti_cpufreq_init':
>> drivers/cpufreq/ti-cpufreq.c:250:24: warning: passing argument 1 of 'PTR_ERR_OR_ZERO' makes pointer from integer without a cast [-Wint-conversion]
     ret = PTR_ERR_OR_ZERO(dev_pm_opp_set_supported_hw(opp_data->cpu_dev,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernfs.h:11:0,
                    from include/linux/sysfs.h:15,
                    from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from include/linux/node.h:17,
                    from include/linux/cpu.h:16,
                    from drivers/cpufreq/ti-cpufreq.c:17:
   include/linux/err.h:56:32: note: expected 'const void *' but argument is of type 'int'
    static inline int __must_check PTR_ERR_OR_ZERO(__force const void *ptr)
                                   ^~~~~~~~~~~~~~~
   drivers/cpufreq/ti-cpufreq.c: In function 'dra7_efuse_xlate':
   drivers/cpufreq/ti-cpufreq.c:84:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
      calculated_efuse |= DRA7_EFUSE_HIGH_MPU_OPP;
   drivers/cpufreq/ti-cpufreq.c:85:2: note: here
     case DRA7_EFUSE_HAS_OD_MPU_OPP:
     ^~~~


vim +/PTR_ERR_OR_ZERO +250 drivers/cpufreq/ti-cpufreq.c

   197	
   198	static int ti_cpufreq_init(void)
   199	{
   200		u32 version[VERSION_COUNT];
   201		struct device_node *np;
   202		const struct of_device_id *match;
   203		struct ti_cpufreq_data *opp_data;
   204		int ret;
   205	
   206		np = of_find_node_by_path("/");
   207		match = of_match_node(ti_cpufreq_of_match, np);
   208		if (!match)
   209			return -ENODEV;
   210	
   211		opp_data = kzalloc(sizeof(*opp_data), GFP_KERNEL);
   212		if (!opp_data)
   213			return -ENOMEM;
   214	
   215		opp_data->soc_data = match->data;
   216	
   217		opp_data->cpu_dev = get_cpu_device(0);
   218		if (!opp_data->cpu_dev) {
   219			pr_err("%s: Failed to get device for CPU0\n", __func__);
   220			return -ENODEV;
   221		}
   222	
   223		opp_data->opp_node = dev_pm_opp_of_get_opp_desc_node(opp_data->cpu_dev);
   224		if (!opp_data->opp_node) {
   225			dev_info(opp_data->cpu_dev,
   226				 "OPP-v2 not supported, cpufreq-dt will attempt to use legacy tables.\n");
   227			goto register_cpufreq_dt;
   228		}
   229	
   230		ret = ti_cpufreq_setup_syscon_register(opp_data);
   231		if (ret)
   232			goto fail_put_node;
   233	
   234		/*
   235		 * OPPs determine whether or not they are supported based on
   236		 * two metrics:
   237		 *	0 - SoC Revision
   238		 *	1 - eFuse value
   239		 */
   240		ret = ti_cpufreq_get_rev(opp_data, &version[0]);
   241		if (ret)
   242			goto fail_put_node;
   243	
   244		ret = ti_cpufreq_get_efuse(opp_data, &version[1]);
   245		if (ret)
   246			goto fail_put_node;
   247	
   248		of_node_put(opp_data->opp_node);
   249	
 > 250		ret = PTR_ERR_OR_ZERO(dev_pm_opp_set_supported_hw(opp_data->cpu_dev,
   251								  version, VERSION_COUNT));
   252		if (ret) {
   253			dev_err(opp_data->cpu_dev,
   254				"Failed to set supported hardware\n");
   255			goto fail_put_node;
   256		}
   257	
   258	register_cpufreq_dt:
   259		platform_device_register_simple("cpufreq-dt", -1, NULL, 0);
   260	
   261		return 0;
   262	
   263	fail_put_node:
   264		of_node_put(opp_data->opp_node);
   265	
   266		return ret;
   267	}
   268	module_init(ti_cpufreq_init);
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
