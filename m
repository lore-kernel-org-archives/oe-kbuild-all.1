Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BABE2E1722
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765596237; cv=none; b=fV2VB1wTkOQXRwgBvwg1OtdTMlkgdeaCmmunRg/+KZ0NHZye4fDQ4YvWzFISi5/finRgu9FX/j6ATOBsStOUI1zSC5JV+cVAU0Y5KSAtxIyOG45cSEM3+7mLzvjzoJXp5XEQ+29NP7H4i6Hy79msD6aeOo5/3XZOiTPgu5n9Os0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765596237; c=relaxed/simple;
	bh=tM3Z//bg7k5VTwLpX/reNbLrVCbdSqpSD36kioJZKS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eAzeG9qtp/lvhd80DKh24nApjQXTOVerGFEd3zpcVrKF9eRI0HjV4Fo0VvUTWsPPfrTlnAatQAsziznjAeJalWipbWXDqnaimlWe4h5eCwTqNgzZ5Qo7wV0QO2EV0afZxSC28myvPQPZawP9xGyKa/qfwB+JSz4rFihy3ug1YWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWWsCbyF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWWsCbyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765596236; x=1797132236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tM3Z//bg7k5VTwLpX/reNbLrVCbdSqpSD36kioJZKS8=;
  b=PWWsCbyFbY4smpZrV22oSFDM9h7fDOilc+1qSHtiQ2PxX7DXJar2o89e
   5Ea9T8dlY11R7eYuXkw2uiO0bK7RBPVzbMKALoUQlnbWP+bEivT5jfhaO
   kr/pXp1F27bDxNl5+Ak4Tus2RTAH1pgZ/3arQeJADHKdkzWJADdH7todn
   kEyFdVA/Ud/zMfXsVKfJwCxJYP8PHgRyOGrJb5FBzlydVWMcmg6l/6xlr
   djxB7xQoz3phnOQXcU65Dxw3kZxYACJ6dmQflQ3ELLBujhlIut6j3naej
   WaVaQOA0f4BYdc1BYQ8+Glo65ig2v/HIwR/fwHsUlvc4XxM3v/vFmaVpO
   g==;
X-CSE-ConnectionGUID: HYhZc95ARJ+SPa7t4VpJwA==
X-CSE-MsgGUID: hLArnyazTpW0vmtPc+YXYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78713285"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78713285"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:23:56 -0800
X-CSE-ConnectionGUID: tfgbXdAuRWKy4NytQkdGSQ==
X-CSE-MsgGUID: ayxZw2cJSFq/VKmH3ATpow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="227901251"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2025 19:23:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUGEZ-000000006zF-3RvM;
	Sat, 13 Dec 2025 03:23:51 +0000
Date: Sat, 13 Dec 2025 11:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 drivers/power/supply/power_supply_core.c:580:13: warning: variable 'ret' set
 but not used
Message-ID: <202512131141.yOpiuoVP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Badhri,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17fd67ddf0cddeb7325b49d3ca2f7db7824dfccd
commit: dea1a925f6a164bc2b21ac2484983ae40347f012 [0/1] ANDROID: power_supply: Add a helper function to retrieve psy array from phandle
config: i386-randconfig-003-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131141.yOpiuoVP-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131141.yOpiuoVP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131141.yOpiuoVP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from drivers/power/supply/power_supply_core.c:12:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1224:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1224 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1210:27: note: 'mem_section' declared here
    1210 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/power/supply/power_supply_core.c: In function 'power_supply_get_by_phandle_array':
>> drivers/power/supply/power_supply_core.c:580:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     580 |         int ret;
         |             ^~~


vim +/ret +580 drivers/power/supply/power_supply_core.c

   553	
   554	/**
   555	 * power_supply_get_by_phandle_array() - Similar to
   556	 * power_supply_get_by_phandle but returns an array of power supply
   557	 * objects which are associated with the phandle.
   558	 * @np: Pointer to device node holding phandle property.
   559	 * @property: Name of property holding a power supply name.
   560	 * @psy: Array of power_supply pointers provided by the client which is
   561	 * filled by power_supply_get_by_phandle_array.
   562	 * @size: size of power_supply pointer array.
   563	 *
   564	 * If power supply was found, it increases reference count for the
   565	 * internal power supply's device. The user should power_supply_put()
   566	 * after usage.
   567	 *
   568	 * Return: On success returns the number of power supply objects filled
   569	 * in the @psy array.
   570	 * -EOVERFLOW when size of @psy array is not suffice.
   571	 * -EINVAL when @psy is NULL or @size is 0.
   572	 * -ENODEV when matching device_node is not found.
   573	 */
   574	int power_supply_get_by_phandle_array(struct device_node *np,
   575					      const char *property,
   576					      struct power_supply **psy,
   577					      ssize_t size)
   578	{
   579		struct device_node *power_supply_np;
 > 580		int ret;
   581		struct match_device_node_array_param param;
   582	
   583		if (!psy || !size)
   584			return -EINVAL;
   585	
   586		power_supply_np = of_parse_phandle(np, property, 0);
   587		if (!power_supply_np)
   588			return -ENODEV;
   589	
   590		param.parent_of_node = power_supply_np;
   591		param.psy = psy;
   592		param.psy_size = size;
   593		param.psy_count = 0;
   594		ret = class_for_each_device(power_supply_class, NULL, &param,
   595					    power_supply_match_device_node_array);
   596	
   597		of_node_put(power_supply_np);
   598	
   599		return param.psy_count;
   600	}
   601	EXPORT_SYMBOL_GPL(power_supply_get_by_phandle_array);
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
