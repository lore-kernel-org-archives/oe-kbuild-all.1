Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A951A0730
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735545953; cv=none; b=iv2cNTocNACA5H/QX4h/95eHynM/LL9P0oPI2yZRWpFuGB269ge6ldv3CjZWJDGxDM1cx4q6YnAfQfTx+0aIj8UUTu6adDjh76lqVwgbGFSGWBnoArXfEyqsiIeYW6BXszV9BQHNnYkYngbrBBzuhH5I3FgNGIpYld01cY+eI44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735545953; c=relaxed/simple;
	bh=VmXkMrZcC4jdRc5WTyRgMH3SKFg/pwzhldvRy3fFln0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=duTbghzc3nAnxaP6DjCNjeBEWpmE/mKxkhkXlLu+TWpNPb59WL0CvTv4/31ymzEFSLftgARDQV2g5cGnOeYpT4NIruDl3XW3OpHpKrqZYI/dXukUhQlcBHFmomiu0viLI9hYO4l+1tIdXUNk59O54PTGy/w/hc7wxqYfRf3tgS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwX/TnIG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwX/TnIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735545951; x=1767081951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VmXkMrZcC4jdRc5WTyRgMH3SKFg/pwzhldvRy3fFln0=;
  b=GwX/TnIG/xHthcGbmedHdm1IYj94RFOdxi245qSRuxzWqgqWKkEsuEg6
   ho+gCA0V3w8x1z8OCeuhWjTS8NZXjmu8rqdpHx/7s+IVL0m4s64lyMsit
   d1OJkHRidljqwjSFrpUDuAgbdxK7fQNi2vEXkbgxvt8cx7OVFMnUWPp+/
   PAvl3vX4SvODTrCgLPPWXBenHpovBRPlJ/8jpIeWR8rH3zJF4rcRuu2wN
   BFswc5FKfU1tpiooxIXbdTPRK+kUGywkI7Udi2k4xn9tOqLJpm9/P/4oK
   IWKXaXkW/Cfbe1zCltj9MnTtVy8sEeUoOaI8C+p8EHsToi02ZVKI6ds2C
   w==;
X-CSE-ConnectionGUID: fJwe/OYKTbSkZCn5o6q3kg==
X-CSE-MsgGUID: +HjvlJ8BSMyLeiB+dzZDyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="61202572"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="61202572"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 00:05:50 -0800
X-CSE-ConnectionGUID: RaSyaqXOQ2iMx3RLHL029A==
X-CSE-MsgGUID: 7jNuBcOrRv+U5TCDdCcqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="100585072"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Dec 2024 00:05:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSAmY-0005YK-2T;
	Mon, 30 Dec 2024 08:05:46 +0000
Date: Mon, 30 Dec 2024 16:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1356/1356] drivers/mfd/rohm-bd718x7.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202412301525.GctcPXAM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matti,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: 30107fa6908b6c2747ee9100b40af813f99483c3 [1356/1356] mfd: bd71837: Core driver for ROHM BD71837 PMIC
config: x86_64-buildonly-randconfig-003-20241228 (https://download.01.org/0day-ci/archive/20241230/202412301525.GctcPXAM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412301525.GctcPXAM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412301525.GctcPXAM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mfd/rohm-bd718x7.c:15:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'bd71837_i2c_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/mfd/rohm-bd718x7.c:207:1: note: in expansion of macro 'module_exit'
     207 | module_exit(bd71837_i2c_exit);
         | ^~~~~~~~~~~
   drivers/mfd/rohm-bd718x7.c:203:20: note: 'cleanup_module' target declared here
     203 | static void __exit bd71837_i2c_exit(void)
         |                    ^~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'bd71837_i2c_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/module.h:115:41: note: in expansion of macro 'module_init'
     115 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/mfd/rohm-bd718x7.c:201:1: note: in expansion of macro 'subsys_initcall'
     201 | subsys_initcall(bd71837_i2c_init);
         | ^~~~~~~~~~~~~~~
   drivers/mfd/rohm-bd718x7.c:195:19: note: 'init_module' target declared here
     195 | static int __init bd71837_i2c_init(void)
         |                   ^~~~~~~~~~~~~~~~
>> drivers/mfd/rohm-bd718x7.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
