Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D6244CAD7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576387; cv=none; b=HeKMAYOsLCqOPpgocanY06WgKIyxHc9++n1/oMlWyQjhtUTuoEjwBr5X/0tX9pLAHNylaczwmSn/tVsqGjuqv01p3hCUhaUl02bF/o0VkrSk9O7bVF2Jo2NBVwUwDj2Xj/12AW6rB84iyVhPJzWqj7CqkuTmGCj7mNJnLOKYlL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576387; c=relaxed/simple;
	bh=3oDLHWgWijm7PCgygmfnju0GgO7doPT9vcU2EacVR0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FeRb2HkMalB7tDjRfK+z0C+msyUa0amwOJV23+RpLUTP/SSWyMAHaQczQlrUWGmY2zGtUHEqpHuALHtaGVZd0B2L76YsJ1f/HToObx+oQCs1gIeG1tSOzLBpLuQiJxGodx7k9EbgeUGuCEaKc13Wpg1RCIv43T32ZhmF9KuNDSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MoELNoVj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoELNoVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777576385; x=1809112385;
  h=date:from:to:cc:subject:message-id;
  bh=3oDLHWgWijm7PCgygmfnju0GgO7doPT9vcU2EacVR0g=;
  b=MoELNoVj3AglS1QS0N21Tajoosjw02kheigH4IPf8wzHuUUl+7UZI+WP
   FdODSWMgtmvFLemMeEzHoBR4fqho7PGt4wdPZBmowCgq/TyOgNMmerVaL
   Yedx27iUWIwrkRSNcCQwBcqdZxS8oZ/umG1hPJ1bqaSpR4vb5yFySaHmz
   8b3Zzuh4KgjbTkagvqo03s/E6iG6zKeqBn3LmbVI2fGxHhWwAwT2vWbEZ
   TrIk2u6QFJxFA07H/a2GUfA36S7UL1Ya7dZxhOR+zMFtSy/s42gmm0AC4
   K1EFyspkJyzpZgy+YSSe/XuvoP5SAjxtfY+X5ZHqS3zC/em1bHmNcdQoA
   A==;
X-CSE-ConnectionGUID: crPtp64eQOagF6R07++Mhw==
X-CSE-MsgGUID: NQGillUMT/W7hXlr+C7OTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78733351"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78733351"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 12:13:05 -0700
X-CSE-ConnectionGUID: pkrgZbppRxGeTmfCoKCXtw==
X-CSE-MsgGUID: MFgipqoNR6ylilOjhP851w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="258256758"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Apr 2026 12:13:04 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIWon-00000000Cps-21om;
	Thu, 30 Apr 2026 19:13:01 +0000
Date: Fri, 01 May 2026 03:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-mt7622 0/3] Warning:
 drivers/net/dsa/mxl862xx/mxl862xx.c:2631 function parameter 'ds' not
 described in 'mxl862xx_fdb_add_per_fid'
Message-ID: <202605010351.QCCdT47d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-mt7622
head:   d8b6134553d0f268ed594061eba808fcb51257f4
commit: d6a0b75e787f1f174335d4164d7ebce4c7e576ee [0/3] net: dsa: add 802.1Q VLAN-based tag driver for MxL862xx
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260501/202605010351.QCCdT47d-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010351.QCCdT47d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605010351.QCCdT47d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2631 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2631 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2631 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2631 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2631 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2650 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2650 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2650 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2650 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2631 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2631 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2631 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2631 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2631 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2650 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2650 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2650 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2650 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
