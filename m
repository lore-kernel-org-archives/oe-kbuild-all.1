Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5496A30C168
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 02:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786847675; cv=none; b=MqwkaNdm1Kysr1HQctYkadWX4Mbh4RafYmwI78opUXFzKRrFEOLBEGIBC2bKiqoKXmCE/kmClZdDzG1xwm/aiQix7wajvhOZHgq1SMYwq9HkCv3HEsuSw5srKS+r/AenX9MxsZSpVvnCtmySdoUIIlNX7/+8vnypH34iPnW31PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786847675; c=relaxed/simple;
	bh=aWMprau9E1JTMZxSXZEil3Kg0rLOZ+ml78UzAUfGLLI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R2hIpj5YsJl1k050QHn+IlrTvEhdeI/5EA4bYl/nQ76D3oZkY5ODdDXbmseRZu1xNtN2QMhcAqnq824CBrhU/A9GFnXM1VzGQ5NdM84GTGgyb2WPzdmTUQzTBeTD0WSYBrG2OWv/ZsKrgXaLxXLoLNK7ph1lyGfZtrOABADyOC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldvDHIzZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldvDHIzZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786847673; x=1818383673;
  h=date:from:to:cc:subject:message-id;
  bh=aWMprau9E1JTMZxSXZEil3Kg0rLOZ+ml78UzAUfGLLI=;
  b=ldvDHIzZQJS8S0CA6kXhcoY+w0d0bcONOFZwYZA183dvyAZdB3laN8Ls
   gLdBjJon7J7Li++FgYy4Ut6ztfMmtoKoKuBcbGbrmcI09keTBUZB1WLza
   ifJFg7h4pDTkcTsi0vhxjQaMFxfu3l5AKiW4XTj1EVum2NUGVKrlpUAYc
   62PfvURgXT+xkeen9UJbLcsWP80X/nr+/Bk2NIl4aSIry+c+3NzDL/NCZ
   X1DLBZpw9e/tc6ejkukAh17KX5o2cNic3kxNDRrwPvyHM0+kfDVVrNHPL
   6/r1qlDonl0tr3vmNxWmK5ONCE07cTuoQTkMxUBl1YtKzTfATaRP6l9yr
   g==;
X-CSE-ConnectionGUID: Gq7aWwZJT9mzvCdeun4k8A==
X-CSE-MsgGUID: saqECnOjTnmLrBgDEelo5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87129523"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87129523"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 19:34:32 -0700
X-CSE-ConnectionGUID: fdGLr7gVSii6hbQCvrVxbA==
X-CSE-MsgGUID: HihxDhMPS3a1fqoB9d4ZGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="268838618"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Aug 2026 19:34:31 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvQhg-00000000ch7-0oDV;
	Sun, 16 Aug 2026 02:34:28 +0000
Date: Sun, 16 Aug 2026 10:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 136/217] Warning:
 drivers/regulator/lp872x.c:58 cannot understand function prototype: 'struct
 lp872x_dvs'
Message-ID: <202608161036.Aj9u7pLN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 1bfa9e891050872a9b1e1b4840d6a92bdc2d2502 [136/217] regulator: remove obsolete platform_data probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260816/202608161036.Aj9u7pLN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161036.Aj9u7pLN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161036.Aj9u7pLN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/regulator/lp872x.c:58 cannot understand function prototype: 'struct lp872x_dvs'
>> Warning: drivers/regulator/lp872x.c:69 cannot understand function prototype: 'struct lp872x_regulator_data'
>> Warning: drivers/regulator/lp872x.c:82 cannot understand function prototype: 'struct lp872x_platform_data'
--
>> Warning: drivers/regulator/max1586.c:30 cannot understand function prototype: 'struct max1586_subdev_data'
>> Warning: drivers/regulator/max1586.c:46 cannot understand function prototype: 'struct max1586_platform_data'
--
>> Warning: drivers/regulator/max8660.c:52 cannot understand function prototype: 'struct max8660_subdev_data'
>> Warning: drivers/regulator/max8660.c:63 cannot understand function prototype: 'struct max8660_platform_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
