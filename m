Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1FB7483
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 14:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762610813; cv=none; b=UGO4LBtVBhphytrKJ5JpWw7Kqwwn+UkWsG+bXL8VOmix/iZg0oHhO4wQH8L43mvjrRzfBub/55b7z+FhxLFiLrPLdkvfdzp5CurgpOl9IjFWPgq6w0GMN/ja7VY5JYOZV7fLoS6IJcYrb61+YK8Z4EVCUpWZmv5heAl6eZxdhqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762610813; c=relaxed/simple;
	bh=cp6I7Fd/7mA3PcYDcqqcXl3KdkBBVDmNSIJv7niEPLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCH21kCnMuBBs2p4FjNRHDG/xwK8ZuH8ndW7H+01SENmtITPYPXE0HXxsiDSewI+UM4gbvnBZeII56PnErqolQcLv3C/PSWh4rljBXUOW5dBkcyTPgM5j3KOQLgduJa0S5lcsEvmHuszmtPjwn/D437OK3ZMnyf3INjxensQPOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g65fWVfZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g65fWVfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762610812; x=1794146812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cp6I7Fd/7mA3PcYDcqqcXl3KdkBBVDmNSIJv7niEPLg=;
  b=g65fWVfZExv49FbNFCnJaj/FeFvtZp2CyD8QKoALEXUS584YinEJHLsu
   Z/7WfKTY9eZ9jaHaxVb1dgrXTllfuafhY9v8rnCCDVvW2z/Dkwjbmu+fM
   AZeDjExzKLgsjhB7d6dSh2fsyT/Uzqh4T0VfWiZBYvSLDuqKhbH2Sbqwd
   dIzGSvT+X5Pu4n/8Ic7fDhdY9IusIWPqqd0tRGa4yuoIwskxecuwoRvAW
   JfTPDqM/CegKBkudooVlEwN/3L6P9UMKjL80TS2GCyrYRqD5EXDSx3zmr
   nuBy/jVMgn70l+W6KI41GfKPZ17Jtg6Jw/ycDdasbp/Ss8lSYqpk8qczw
   g==;
X-CSE-ConnectionGUID: 41m2GbNgS3uJaaM7lTutHw==
X-CSE-MsgGUID: KAU+cIraQS+RYFm3E6um3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64651092"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="64651092"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 06:06:52 -0800
X-CSE-ConnectionGUID: 1TDiHwMOTlWNjUjd4sonHw==
X-CSE-MsgGUID: sPsPNV7UR4iUkB4Xhd0Oug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="219021053"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Nov 2025 06:06:50 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHjaa-0000vz-1p;
	Sat, 08 Nov 2025 14:06:48 +0000
Date: Sat, 8 Nov 2025 22:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/of-match-machine-data 22/30]
 drivers/cpufreq/ti-cpufreq.c:558:57: warning: variable 'match' is
 uninitialized when used here
Message-ID: <202511082225.u683lvQW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/of-match-machine-data
head:   def3927311facbb1fdc3718044aa36fdae71fd5e
commit: 75388fe67f2ecd0bfcf603417b8fdede84d3d6b3 [22/30] cpufreq: ti: Simplify with of_machine_device_match()
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20251108/202511082225.u683lvQW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d78e0ded5215824a63ac04fb87effd9eacf875eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511082225.u683lvQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511082225.u683lvQW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/ti-cpufreq.c:558:57: warning: variable 'match' is uninitialized when used here [-Wuninitialized]
     558 |                 platform_device_register_data(NULL, "ti-cpufreq", -1, match,
         |                                                                       ^~~~~
   drivers/cpufreq/ti-cpufreq.c:554:34: note: initialize the variable 'match' to silence this warning
     554 |         const struct of_device_id *match;
         |                                         ^
         |                                          = NULL
   1 warning generated.


vim +/match +558 drivers/cpufreq/ti-cpufreq.c

db410b2b3839e9 Dave Gerlach        2017-12-14  551  
f7968c22bd427f Xiu Jianfeng        2022-09-24  552  static int __init ti_cpufreq_init(void)
db410b2b3839e9 Dave Gerlach        2017-12-14  553  {
d98ccfc3948ab6 Dave Gerlach        2018-11-13  554  	const struct of_device_id *match;
d98ccfc3948ab6 Dave Gerlach        2018-11-13  555  
d98ccfc3948ab6 Dave Gerlach        2018-11-13  556  	/* Check to ensure we are on a compatible platform */
75388fe67f2ecd Krzysztof Kozlowski 2025-11-06  557  	if (of_machine_device_match(ti_cpufreq_of_match))
d98ccfc3948ab6 Dave Gerlach        2018-11-13 @558  		platform_device_register_data(NULL, "ti-cpufreq", -1, match,
d98ccfc3948ab6 Dave Gerlach        2018-11-13  559  					      sizeof(*match));
d98ccfc3948ab6 Dave Gerlach        2018-11-13  560  
db410b2b3839e9 Dave Gerlach        2017-12-14  561  	return 0;
db410b2b3839e9 Dave Gerlach        2017-12-14  562  }
db410b2b3839e9 Dave Gerlach        2017-12-14  563  module_init(ti_cpufreq_init);
db410b2b3839e9 Dave Gerlach        2017-12-14  564  

:::::: The code at line 558 was first introduced by commit
:::::: d98ccfc3948ab63152494bb6b9c17e15295c0310 cpufreq: ti-cpufreq: Only register platform_device when supported

:::::: TO: Dave Gerlach <d-gerlach@ti.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
