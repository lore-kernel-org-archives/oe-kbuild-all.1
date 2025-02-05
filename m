Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AFD10E3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 01:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718128; cv=none; b=ulExfZ5W5f7VEUuR8ZZV8uWDeIQTfO/uODbKnBUcmhhpnIw9TYW9xSEjzMxtMVLVHmmySZWpTlWKFBFP33u/HPxarcLlWnj/14zNZhIJTcGyOfD9bfUJsbWOweePm0pAt9tTVuLmrRJRJNQebn6TDHie+K+sAjsKq9OJdk7IXqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718128; c=relaxed/simple;
	bh=RF6yB5ByqWKsYIIyY89cfczV+P2dUE2XW6l23Vn3VyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DaE7YYfl7U2bk7LZMVJcJTMWDU7v3IDq6VnYLAC/mNnf/TGEumwlU87k1iELa3PH/SbWpacuPGVYAmmkDKHk6cTq/ZPzaGgbAbwABtg8Vm+bc948RQCKL/MHSiAnYXQk9xyxMrvt9ML02MD8oYVqdwuibpfGldp5x+K/li6Xe5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3fueGIm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3fueGIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738718126; x=1770254126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RF6yB5ByqWKsYIIyY89cfczV+P2dUE2XW6l23Vn3VyI=;
  b=D3fueGImfo+sYG4/zAb24TpnLfeSX57Bpv0c3ceZ3V7u9Er9Xx3yqk+m
   ijoIQJ7PK3vYsfxBVjeUt6C5DPQBf7KZCXbbomvUDUTPGgDZ4HIDgi8co
   U0EGjJXycOgMrmQWezAIUVeJeYO9SPcZ3eJyXpA//Mvka554/HWG7BlZ2
   1lqAWABIVps0ZvWx6RT0GG+z3ft0Cw6S7PYa4KFnAUL/JwK31UVe0EQJf
   ISZIDszEUvMIx4Byrp+GMH2AhL4EtOuF7ggbSDdJgh1sfSUf6qJYPoKU+
   ALXKNxFLIUbpurwDoUmslx1gwevHxQG/blKiKV1zU197NnV1V+JnA8x9K
   A==;
X-CSE-ConnectionGUID: eFavP7CXQPWdnZmY5MgN9w==
X-CSE-MsgGUID: lm2q9KzDTwaGikBElvj+2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39532099"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="39532099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 17:15:25 -0800
X-CSE-ConnectionGUID: FY+9Fyg7T5iDS8RivG+rNg==
X-CSE-MsgGUID: zesj+olETwW7wN+e7wTqtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111195527"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Feb 2025 17:15:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfU0f-000tHR-1m;
	Wed, 05 Feb 2025 01:15:21 +0000
Date: Wed, 5 Feb 2025 09:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 57/57]
 drivers/regulator/mt6363-regulator.c:254:34: warning: unused variable
 'mt_volt_range3'
Message-ID: <202502050931.B3vsennc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   214a5686718f4ddf23fe02a3df2a4b37b05d1ed4
commit: 11792abed5949b15f434d0a53e21e51d5c56e28c [57/57] CHROMIUM: pmic: Add MT8196 SPMI and PMIC driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250205/202502050931.B3vsennc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050931.B3vsennc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050931.B3vsennc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/regulator/mt6363-regulator.c:11:
   In file included from include/linux/regulator/driver.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/mt6363-regulator.c:254:34: warning: unused variable 'mt_volt_range3' [-Wunused-const-variable]
     254 | static const struct linear_range mt_volt_range3[] = {
         |                                  ^~~~~~~~~~~~~~
   5 warnings generated.
--
   In file included from drivers/regulator/mt6373-regulator.c:11:
   In file included from include/linux/regulator/driver.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/mt6373-regulator.c:165:34: warning: unused variable 'mt_volt_range0' [-Wunused-const-variable]
     165 | static const struct linear_range mt_volt_range0[] = {
         |                                  ^~~~~~~~~~~~~~
>> drivers/regulator/mt6373-regulator.c:169:34: warning: unused variable 'mt_volt_range1' [-Wunused-const-variable]
     169 | static const struct linear_range mt_volt_range1[] = {
         |                                  ^~~~~~~~~~~~~~
>> drivers/regulator/mt6373-regulator.c:173:34: warning: unused variable 'mt_volt_range2' [-Wunused-const-variable]
     173 | static const struct linear_range mt_volt_range2[] = {
         |                                  ^~~~~~~~~~~~~~
   7 warnings generated.
--
>> drivers/spmi/spmi-mtk-pmif.c:460:20: warning: no previous prototype for function 'get_current_time_ms' [-Wmissing-prototypes]
     460 | unsigned long long get_current_time_ms(void)
         |                    ^
   drivers/spmi/spmi-mtk-pmif.c:460:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     460 | unsigned long long get_current_time_ms(void)
         | ^
         | static 
   1 warning generated.


vim +/mt_volt_range3 +254 drivers/regulator/mt6363-regulator.c

   253	
 > 254	static const struct linear_range mt_volt_range3[] = {
   255		REGULATOR_LINEAR_RANGE(400000, 0, 127, 6250),
   256	};
   257	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
