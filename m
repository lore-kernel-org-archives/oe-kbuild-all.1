Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1F28E10
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nq9VH7yg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703671176; x=1735207176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ex7wbMV27z5oO/tMMgGJLApwi/xukUuJRj/sAlORrNY=;
  b=Nq9VH7ygOaPh0ymVY7dPsfCa5R5Hf8HKcsVS/4Bm1kAFiLisrKAjrzoP
   uL2v5eM6Uepb7W5HcO2dEPyVUKfOipGB1HXidwkfVcjZT2mdZYrjUdaf3
   vCBfEmySMxr82BXzamNaXbq8CjhJxH5wPDNL1fEDeKfAmMfO5tLaoFZRj
   a0rggGuKkPQBA/b7wQbCYtw4X7sokRLuZ60qn8C5mJxbiHc6LOEo2FU9r
   +8yiWumLyzVZF7CODt8XdUUPIzCVBWnI1JGkx9+VD910M6jU8IlSdjrCc
   xgNfw0JTLI5lsK37K/Fz82LFH4x9zchJV3AhVoJj7V8+82YROgrqpEb9c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="17993042"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="17993042"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 01:59:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="20250675"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Dec 2023 01:59:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIQhI-000FI5-1P;
	Wed, 27 Dec 2023 09:59:32 +0000
Date: Wed, 27 Dec 2023 17:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v3.0 20/24] lib/dynamic_debug.c:621:7: warning: no
 previous prototype for 'skip_spaces_and_coma'
Message-ID: <202312271717.fCLDTyf9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v3.0
head:   1f42080421213a7819e069d5b6d22cef0b6c9c61
commit: 34cd8a2374f70a56e599ee3e5d786c989d3cb096 [20/24] dyndbg: add skip_spaces_and_coma()
config: arc-randconfig-001-20231227 (https://download.01.org/0day-ci/archive/20231227/202312271717.fCLDTyf9-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312271717.fCLDTyf9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312271717.fCLDTyf9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:621:7: warning: no previous prototype for 'skip_spaces_and_coma' [-Wmissing-prototypes]
     621 | char *skip_spaces_and_coma(const char *str)
         |       ^~~~~~~~~~~~~~~~~~~~


vim +/skip_spaces_and_coma +621 lib/dynamic_debug.c

   620	
 > 621	char *skip_spaces_and_coma(const char *str)
   622	{
   623		str = skip_spaces(str);
   624		if (*str == ',')
   625			str = skip_spaces(++str);
   626		return (char *)str;
   627	}
   628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
