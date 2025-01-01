Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B65DDBE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 17:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735752121; cv=none; b=sdetfAra4UULyBKfI0hOYWOM54rsWDnhXPvV1jiCmDlWRarKQWUfV3c+d0QTkwaMsdwWXH5XooSP2UTCFwXp8K/AwHZol4DfTfUDj6GPna3bu2EABILk7fa1FZU+RNr67lZmF1klpA+mMxdUlR60LN7XrUWF5g4ZOB9RRRKx7XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735752121; c=relaxed/simple;
	bh=x27b0xxy975+l8qj1vM4cRwScQDmRa5ihFvNCnRVC6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FYEH+aw5zVW6o3Q/6JhCo+tY+iPgkPaTcxib3WImwRn7PEMl4myfTZ+GxfHL2b643K5W7W4/EXI+dbMai2oSx2G3ML4s6v6bARqjgRK/hA0lijzSW2tm+qe+4ZbhwIh7qwjHGTIfV/t4IxKKtBdbdQqnspeqnIVt9VZvVRXn8co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcJYxhIV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcJYxhIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735752118; x=1767288118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x27b0xxy975+l8qj1vM4cRwScQDmRa5ihFvNCnRVC6k=;
  b=JcJYxhIVofoOdR5SqGAaJRghHup5vpFGuJ5AgOUuf6uAsqJYNz2SkIdP
   diYZMuhuggJ8qXP2i/WJnK5o0g0Bd+WXBlMuNuY70t9mrHcKak7EZbBbT
   /LnGFAhpVslUo0CZBn4t+jpawC6gZam0ldkP2lryBWHahoDOaGuKOVAh4
   YqxMlgoKpWQX48KTguZ72PaCAGZ/H4OsDYYVJL+uBFJYcVVay7hBR5ooy
   gwYiXhY4GS/mUnfY/B3ufuTWS3Gn7aZyqJLYSJDUB06ln7YamW+vwWT60
   POYnuuR/G9iM0e4AJ4QqYODitOUzMXuaAAIn/KFmQaqIxGHT+Tpa0v1KT
   A==;
X-CSE-ConnectionGUID: mPc3bKATS5SmarZ6iySe0Q==
X-CSE-MsgGUID: vCG5qwyMQkegD5h1O5UQ+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35901085"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; 
   d="scan'208";a="35901085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 09:21:57 -0800
X-CSE-ConnectionGUID: y4wx6J2uRoekVYI+hb8FKw==
X-CSE-MsgGUID: /PAZE2HrRWKhcUVAiENbCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102149917"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Jan 2025 09:21:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tT2Pp-0007yN-3D;
	Wed, 01 Jan 2025 17:21:53 +0000
Date: Thu, 2 Jan 2025 01:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/misc/dw-xdata-pcie.c:20:41: warning: 'snprintf' output may
 be truncated before the last format character
Message-ID: <202501020112.gtxIZgvD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gustavo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: e8a30eef6ef6da4998fcdaaffaaf8d29777c5d7d misc: Add Synopsys DesignWare xData IP driver
date:   3 years, 9 months ago
config: csky-randconfig-r053-20231127 (https://download.01.org/0day-ci/archive/20250102/202501020112.gtxIZgvD-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501020112.gtxIZgvD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501020112.gtxIZgvD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/dw-xdata-pcie.c: In function 'dw_xdata_pcie_probe':
>> drivers/misc/dw-xdata-pcie.c:20:41: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
      20 | #define DW_XDATA_DRIVER_NAME            "dw-xdata-pcie"
         |                                         ^~~~~~~~~~~~~~~
   drivers/misc/dw-xdata-pcie.c:342:38: note: in expansion of macro 'DW_XDATA_DRIVER_NAME'
     342 |         snprintf(name, sizeof(name), DW_XDATA_DRIVER_NAME ".%d", id);
         |                                      ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/dw-xdata-pcie.c:390:64: note: format string is defined here
     390 |         if (sscanf(dw->misc_dev.name, DW_XDATA_DRIVER_NAME ".%d", &id) != 1)
         |                                                                ^
   drivers/misc/dw-xdata-pcie.c:342:9: note: 'snprintf' output between 16 and 25 bytes into a destination of size 24
     342 |         snprintf(name, sizeof(name), DW_XDATA_DRIVER_NAME ".%d", id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +20 drivers/misc/dw-xdata-pcie.c

    19	
  > 20	#define DW_XDATA_DRIVER_NAME		"dw-xdata-pcie"
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
