Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9451A2C1BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EN5Zkg96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700059332; x=1731595332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GOd8brVgrcyzV87kIfZ0CKvFJZubqUN4ZgVoBmKvJPk=;
  b=EN5Zkg96v7u8OfnuHWXxP8BVgr59nx82BJpTtEm3Pksk00rXwCsdU8eK
   kXtgftowZCj8Z/xGlzheCqp2RACc0C1l3C675oKohAoccymuQg8vFoxDd
   sai6eSWQBCybAOm0GeG3mc3mNMZ5yBEVjhNsj6L5AntqqNNbYnbh75FxE
   1ytcA06JRIuwiFz4RKDibDnkPCdD9fdS71mFllLZT4zcB0yZxeHcJG6HS
   EAeUTsD4ExX5RUjMLQOaaT4Tfl0gAD57FPXqEFppReeprILP2LiTWsTKf
   hFgnGj16URIm/LHc9tSuKEXVi9Bj2ghr0pZadbaLa0KQFN2fUt/0Sl+mA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="371073847"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="371073847"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 06:38:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908797967"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="908797967"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 06:38:55 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3H2b-0000PU-1p;
	Wed, 15 Nov 2023 14:38:53 +0000
Date: Wed, 15 Nov 2023 22:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	rafael@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, daniel.lezcano@linaro.org,
	rui.zhang@intel.com, lukasz.luba@arm.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] thermal: Add support for device tree thermal zones
 consumers
Message-ID: <202311152230.nzJVHaeG-lkp@intel.com>
References: <20231114131514.89031-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114131514.89031-1-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/thermal]
[also build test ERROR on linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/thermal-Add-support-for-device-tree-thermal-zones-consumers/20231114-211656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20231114131514.89031-1-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH] thermal: Add support for device tree thermal zones consumers
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20231115/202311152230.nzJVHaeG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152230.nzJVHaeG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152230.nzJVHaeG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/acpi/cppc.o: in function `thermal_of_get_zone_by_index':
>> include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: arch/x86/kernel/acpi/cppc.o: in function `thermal_of_get_zone':
>> include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: arch/x86/kernel/acpi/cstate.o: in function `thermal_of_get_zone_by_index':
>> include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: arch/x86/kernel/acpi/cstate.o: in function `thermal_of_get_zone':
>> include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/idle/intel_idle.o: in function `thermal_of_get_zone_by_index':
>> include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/idle/intel_idle.o: in function `thermal_of_get_zone':
>> include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/acpi/acpi_processor.o: in function `thermal_of_get_zone_by_index':
>> include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/acpi/acpi_processor.o: in function `thermal_of_get_zone':
>> include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/acpi/processor_core.o: in function `thermal_of_get_zone_by_index':
>> include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/acpi/processor_core.o: in function `thermal_of_get_zone':
>> include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/acpi/processor_pdc.o: in function `thermal_of_get_zone_by_index':
>> include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/acpi/processor_pdc.o: in function `thermal_of_get_zone':
>> include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/acpi/fan_core.o: in function `thermal_of_get_zone_by_index':
>> include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/acpi/fan_core.o: in function `thermal_of_get_zone':
>> include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/acpi/processor_driver.o: in function `thermal_of_get_zone_by_index':
>> include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/acpi/processor_driver.o: in function `thermal_of_get_zone':
>> include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/acpi/processor_thermal.o: in function `thermal_of_get_zone_by_index':
>> include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/acpi/processor_thermal.o: in function `thermal_of_get_zone':
>> include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/acpi/processor_idle.o: in function `thermal_of_get_zone_by_index':
>> include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/acpi/processor_idle.o: in function `thermal_of_get_zone':
>> include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/acpi/processor_throttling.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/acpi/processor_throttling.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/acpi/processor_perflib.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/acpi/processor_perflib.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/acpi/thermal.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/acpi/thermal.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/acpi/cppc_acpi.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/acpi/cppc_acpi.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/power/supply/power_supply_core.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/power/supply/power_supply_core.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/hwmon/hwmon.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/hwmon/hwmon.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/thermal/thermal_core.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/thermal/thermal_core.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/thermal/thermal_sysfs.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/thermal/thermal_sysfs.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/thermal/thermal_trip.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/thermal/thermal_trip.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/thermal/thermal_helpers.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/thermal/thermal_helpers.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/thermal/thermal_hwmon.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/thermal/thermal_hwmon.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/thermal/thermal_acpi.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/thermal/thermal_acpi.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/thermal/gov_fair_share.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/thermal/gov_fair_share.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/thermal/gov_bang_bang.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/thermal/gov_bang_bang.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/thermal/gov_step_wise.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/thermal/gov_step_wise.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/thermal/gov_user_space.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/thermal/gov_user_space.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/cpufreq/cpufreq.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/cpufreq/cpufreq.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here
   ld: drivers/cpufreq/intel_pstate.o: in function `thermal_of_get_zone_by_index':
   include/linux/thermal.h:282: multiple definition of `thermal_of_get_zone_by_index'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:282: first defined here
   ld: drivers/cpufreq/intel_pstate.o: in function `thermal_of_get_zone':
   include/linux/thermal.h:287: multiple definition of `thermal_of_get_zone'; arch/x86/kernel/acpi/boot.o:include/linux/thermal.h:287: first defined here


vim +282 include/linux/thermal.h

   280	
   281	struct thermal_zone_device *thermal_of_get_zone_by_index(struct device *dev, int index)
 > 282	{
   283		return ERR_PTR(-EOPNOTSUPP);
   284	}
   285	
   286	struct thermal_zone_device *thermal_of_get_zone(struct device *dev, const char *name)
 > 287	{
   288		return ERR_PTR(-EOPNOTSUPP);
   289	}
   290	#endif
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
