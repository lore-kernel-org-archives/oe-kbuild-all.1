Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A3A2ED154
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 06:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774421824; cv=none; b=c3t9d5LnXr64KrzmPW/Olv2YUyraeEZ6jZCK5NhmR+rXJbDVKGqMnLaLSJ/3G440EREWORt9l4vUPh2qCyxJhat8jIg4u2T5egD6FPs24vsD4Myho+Bp0CnJmTMSSVKj6Ta9i126MesC4uI5gscPqn14IYJClSZgmbcE9yFH5v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774421824; c=relaxed/simple;
	bh=CVFMRPTAK0hGO4MujQKu9Ef2pPzO/KsQ0RZwATi55XY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ROrvVH/Ly9Sjo3dSrwN88HVGjSuqH2xfB65ENEdurWsu9GEzGLngvJoD1H0u/h7VtS9PmmJ68g4hS8a2+TQemLYhPsIsbvjJzcpYLCLaTx5UGeiKpz8MMMPwcTD88m8xuw4Sf/pZdDMQHJW6iTyeXlL/1bfg4+WRZwuDC0WPD5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHFVQuWa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHFVQuWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774421822; x=1805957822;
  h=date:from:to:cc:subject:message-id;
  bh=CVFMRPTAK0hGO4MujQKu9Ef2pPzO/KsQ0RZwATi55XY=;
  b=OHFVQuWaSjgHls8QcTDPeCKGo8gWsscPM5ta8dJoD3vLSAdb/xme7Qeo
   eLNS6czFyA4uMmOf7TK/3UFRtkp+2c8EqTY9x7UhKgxrNu4YOvVUFeSH/
   kGC+4X+72j2NLnJpNOOnb0xxk8ybX13tHqJmiJiQHOUtMBmaMutDKt6Rb
   ys4X7VCFwVYqWBfdxAVYrqPgU+9PoY6MI1U1Ch7OW+69e1DZvw6wU9DLt
   hXMpohEwde/twXZh037/sTZU8eKg3NJSJggVlwzpC/MDxKhQJyiUQQRWo
   mj0ySlbOrejBnVLEN530bqnYyi9PSmRTFSYKgflyueX7yY5lsZVt3wqT0
   g==;
X-CSE-ConnectionGUID: 51XJ0HN3RLaVsgdR85z6Lg==
X-CSE-MsgGUID: WYJieaalSxW9gceDLQybvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75169932"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75169932"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 23:57:02 -0700
X-CSE-ConnectionGUID: w9QJbjYSSqSrduGO3u1Z7Q==
X-CSE-MsgGUID: C1QiigXURYO4CWDANz8+ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="226227728"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Mar 2026 23:57:00 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5IAk-000000006NJ-0TpC;
	Wed, 25 Mar 2026 06:56:58 +0000
Date: Wed, 25 Mar 2026 14:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/44]
 drivers/power/supply/power_supply_core.c:580:13: warning: variable 'ret' set
 but not used
Message-ID: <202603251408.4x28wITg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Badhri,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   bb47b925bb600e95cd776d4ab19d2b6c2ae342c7
commit: dea1a925f6a164bc2b21ac2484983ae40347f012 [0/44] ANDROID: power_supply: Add a helper function to retrieve psy array from phandle
config: i386-randconfig-003-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251408.4x28wITg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251408.4x28wITg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251408.4x28wITg-lkp@intel.com/

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
