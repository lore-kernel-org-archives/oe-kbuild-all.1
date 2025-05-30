Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406151DE8A6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 04:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748580040; cv=none; b=jKrIP1Zf2ENoyopHop/nK+qQbhQ6OSF6UIdQc+tBEIAQRW+5CABEHvjiY7z7J2lErW9SyrksN0FuXHL0cypnsYLeM5UG0wRmArHs9zIbuWYv5m39domltKZNlqj/CjR5GnRMCnToSec68R2uNAUdN1Snfr84CAfdMuLZ/5VsODY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748580040; c=relaxed/simple;
	bh=ZnMRKAcuaAD1rxpeXbjaOqFS9Omdp1aqc5Y0HvQwzHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kl46S2593XWW47OILFGtaBRFtCAehZHHU/mMmkuv1cPDN1L8KTN6KiiRqMv1mIwcAecIiJfRsjBjtj7K6xtEm/Qbx+u1/jfA/145KwUMTpD6dn0pY8I6x1msHDz+USav1bSRVI+iMWahNcXU1o9VyNkDnCetX000ltT3Ax7M650=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPjeCs4t; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPjeCs4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748580038; x=1780116038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZnMRKAcuaAD1rxpeXbjaOqFS9Omdp1aqc5Y0HvQwzHY=;
  b=gPjeCs4ttLOngKHMCOOUsfrMLX0RC+hWps7ufx1fBV614nOOG2jeU8f9
   zg4ts8J8309YjrPuF5z+G4UhleNgj8JROKg1+joKXeq0mVhCrsDzHr/hB
   VNh85S6WiQApJ3LSuz+1z53PaBztADyOpveAA8AFTdUMPwytZRhKgxf5w
   r7Tk9lv6H+ybVS8eY7kd4vA0lODvjoCkgMS8BLjehdsG/Dj2pUI2jsQTo
   3g6Sq6LzxnEHdL0E8C2CMFriPQWdJLeAym8gA4mFR4OuAxQdw8solRDb2
   YAWxnKUGeQOGAr2//9wdslrQCeE/q+ZeO+vHLMibYf974V/pBn+E1PqZh
   A==;
X-CSE-ConnectionGUID: d9hpvI7GRd2y3zrm90SqMw==
X-CSE-MsgGUID: f5rgx6KaSp+e+vsQgDykDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="49908000"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="49908000"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 21:40:38 -0700
X-CSE-ConnectionGUID: g09oUuRoQEW0E6yFOep4yA==
X-CSE-MsgGUID: hRzTB1UPRx+E/ZQgolDxcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="144747777"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2025 21:40:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKrXk-000XLA-0y;
	Fri, 30 May 2025 04:40:32 +0000
Date: Fri, 30 May 2025 12:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: victor.duicu@microchip.com, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, marius.cristea@microchip.com,
	victor.duicu@microchip.com, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: temperature: add support for MCP998X
Message-ID: <202505301210.l4ZriiEX-lkp@intel.com>
References: <20250529093628.15042-3-victor.duicu@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529093628.15042-3-victor.duicu@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0c86e33819785fe50616b6ee3fb35c1e4be406d5]

url:    https://github.com/intel-lab-lkp/linux/commits/victor-duicu-microchip-com/dt-bindings-iio-temperature-add-support-for-MCP998X/20250529-173844
base:   0c86e33819785fe50616b6ee3fb35c1e4be406d5
patch link:    https://lore.kernel.org/r/20250529093628.15042-3-victor.duicu%40microchip.com
patch subject: [PATCH v2 2/2] iio: temperature: add support for MCP998X
config: m68k-randconfig-r111-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301210.l4ZriiEX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250530/202505301210.l4ZriiEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301210.l4ZriiEX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/temperature/mcp9982.c:200:14: sparse: sparse: symbol 'mcp9982_3db_values_map_tbl' was not declared. Should it be static?

vim +/mcp9982_3db_values_map_tbl +200 drivers/iio/temperature/mcp9982.c

   199	
 > 200	unsigned int mcp9982_3db_values_map_tbl[11][3][2];
   201	static const int mcp9982_sampl_fr[][2] = {
   202		{ 1, 16 },
   203		{ 1, 8 },
   204		{ 1, 4 },
   205		{ 1, 2 },
   206		{ 1, 1 },
   207		{ 2, 1 },
   208		{ 4, 1 },
   209		{ 8, 1 },
   210		{ 16, 1 },
   211		{ 32, 1 },
   212		{ 64, 1 },
   213	};
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
