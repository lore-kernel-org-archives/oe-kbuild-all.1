Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B937F4FB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 12:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723378687; cv=none; b=sO02Nq64PvBULXQPTOaWg5H1ZLZGEhVwY1L4htbFDhAQtt1vM2u/uWX/ryzqAGngpxw7l7dhuXO34oNnLWQa+7pA+lyUoptEZCHnbPAvo3iRblqB1ZSZLXqiv2bjA1/7RTjD0RBI3rzccLvsVpKLhwGdmok8ashndkskl9Cy0sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723378687; c=relaxed/simple;
	bh=Ew3UyXtXc4fx15KVTk+lb09KkWUsv8WTmtHQi7NY558=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qb0zAp7Wcn9hDfTqNrSfKj9YBeYFk7L327Rq1PdzbVzcUngmWZaXNTLiYhnO/ZynkQj0YDcAV/Fv0euSwAfELzfGO7HK669+dy40X6W+w27vg+O0W/DHXodS/CNwM9+T3Jb0OuscD3gSqLyRoVx/CTXS3Hn3JZQoa238GxU8mj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7povl5l; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7povl5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723378686; x=1754914686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ew3UyXtXc4fx15KVTk+lb09KkWUsv8WTmtHQi7NY558=;
  b=E7povl5l9uaGJ4SwpEP2EaeaZGG0NtFvvblpDXEWkItHExO1gKm+iDPN
   HbmSVJQlzAEJEzPPdKNWinvlr+1sRza54Vud/gMzRfzd7cSOG+GBElwP7
   qBU+Igr6dFEspyPFMTnn4mCJLdXao69Akq2BwbAOqHbsNWituKqAIxFY3
   KxHANTAHjmmulRyM3+szuwavud0usZv1PWvf1tPpfhlvTWrBO5zsAN18D
   i2jQ5WnQRSYla0JD65nsmVDzPmEN2Kv43ZRqTsORLsWsop+WPvyOO6zyJ
   JIkyphjldYYsAg8ZewSXX0U49Tr7erH9D0eF404Li3e5K8JXXFOoe1kih
   g==;
X-CSE-ConnectionGUID: AYuhljtfT3q4E8jeJFvs2A==
X-CSE-MsgGUID: r0ACpAZTQ52AJik4UvFYSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21636593"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21636593"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 05:18:05 -0700
X-CSE-ConnectionGUID: LdQIQw7wRVaG9cNPoVPg+Q==
X-CSE-MsgGUID: ROjoBwsyRACPJBUvrk1ACQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="62851897"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 11 Aug 2024 05:18:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd7WL-000AoX-1I;
	Sun, 11 Aug 2024 12:18:01 +0000
Date: Sun, 11 Aug 2024 20:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.10.y 92/104]
 drivers/thermal/imx_thermal.c:376:26: error: initialization of 'int
 (*)(struct thermal_zone_device *, const struct thermal_trip *, int)' from
 incompatible pointer type 'int (*)(struct thermal_zone_device *, int,  int)'
Message-ID: <202408112022.Vn6oofT4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.10.y
head:   bc327c57c8cf8f309b5edbb8959cc81d8b29daba
commit: 3ce435c79c12d2f413fc10231b8943af12135c69 [92/104] thermal: trip: Pass trip pointer to .set_trip_temp() thermal zone callback
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240811/202408112022.Vn6oofT4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408112022.Vn6oofT4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408112022.Vn6oofT4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thermal/imx_thermal.c:376:26: error: initialization of 'int (*)(struct thermal_zone_device *, const struct thermal_trip *, int)' from incompatible pointer type 'int (*)(struct thermal_zone_device *, int,  int)' [-Werror=incompatible-pointer-types]
     376 |         .set_trip_temp = imx_set_trip_temp,
         |                          ^~~~~~~~~~~~~~~~~
   drivers/thermal/imx_thermal.c:376:26: note: (near initialization for 'imx_tz_ops.set_trip_temp')
   cc1: some warnings being treated as errors
--
   drivers/thermal/intel/intel_quark_dts_thermal.c: In function 'sys_set_trip_temp':
>> drivers/thermal/intel/intel_quark_dts_thermal.c:258:16: error: expected ':' before 'return'
     258 |         default
         |                ^
         |                :
     259 |                 return -EINVAL;
         |                 ~~~~~~
   drivers/thermal/intel/intel_quark_dts_thermal.c:251:9: warning: enumeration value 'THERMAL_TRIP_ACTIVE' not handled in switch [-Wswitch]
     251 |         switch (trip->type) {
         |         ^~~~~~
   drivers/thermal/intel/intel_quark_dts_thermal.c:251:9: warning: enumeration value 'THERMAL_TRIP_PASSIVE' not handled in switch [-Wswitch]


vim +376 drivers/thermal/imx_thermal.c

ca3de46b508090 Shawn Guo             2013-06-24  370  
cbb07bb35de6eb Eduardo Valentin      2014-01-06  371  static struct thermal_zone_device_ops imx_tz_ops = {
ca3de46b508090 Shawn Guo             2013-06-24  372  	.bind = imx_bind,
ca3de46b508090 Shawn Guo             2013-06-24  373  	.unbind = imx_unbind,
ca3de46b508090 Shawn Guo             2013-06-24  374  	.get_temp = imx_get_temp,
f5e50bf4d3ef0a Andrzej Pietrasiewicz 2020-06-29  375  	.change_mode = imx_change_mode,
017e51420cc440 Philipp Zabel         2013-08-01 @376  	.set_trip_temp = imx_set_trip_temp,
ca3de46b508090 Shawn Guo             2013-06-24  377  };
ca3de46b508090 Shawn Guo             2013-06-24  378  

:::::: The code at line 376 was first introduced by commit
:::::: 017e51420cc44098308b00dffd9d4e514ddf40f3 thermal: imx: dynamic passive and SoC specific critical trip points

:::::: TO: Philipp Zabel <p.zabel@pengutronix.de>
:::::: CC: Zhang Rui <rui.zhang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
