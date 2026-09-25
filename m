Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E44AC14D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 14:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346693; cv=none; b=WTAMiDQjyjM/zwtZr+ytfufEbYZ8gOlVdNh7n9Pyrcu5kWFEGCkVf1kSHMV1VBgeSgUOHQOzhr+cC9Hv4UBoZt6ONLrCmKrJ55ACcoS1teyqAyJsiaxQDOg+FbnIaWRa/7Rb1kUTKAzPjWEAuSALox117ZQ16enffe7kvg5/6DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346693; c=relaxed/simple;
	bh=ZLxrbKWS8cFhmgTnXegqJTnUGfGRbmyVp45+smndAO0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F69yhsPADq3vXgxdRV4aYcVjBOyVACRa+rVCGbOQf6mJGIbmyodskVlTGLML9CzOsdxz3qMS+Qvi6MN5s93hFxlRO93J5vOuAvgwqb8MPXMJ9xBH7lglbH05gyMLlUfrVEEv+VCtMI53GJgaLp12yVXWmZSO6ZNqMCj7h0S43j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRtbr2bs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRtbr2bs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790346690; x=1821882690;
  h=date:from:to:cc:subject:message-id;
  bh=ZLxrbKWS8cFhmgTnXegqJTnUGfGRbmyVp45+smndAO0=;
  b=JRtbr2bs1AYgf1t/2GZPLtzA5GlwIm1RLJuiYXVOn0mPy37weaAcGO/B
   a4WO2ctnxwjtIbJ/j+JM6tDLlO9a2zidnY7Ahbj0WRRnwx6WmuufxdqhG
   3hZeV4pjmhUQy1A0sM2U3vrVO2Xazn0EdHdLQG+fSRcARC+L9y1ECA4MH
   8MRGvABdWoV2U29gMU5xd837x0egB/nm6z3UK3DX/Dl6ZY4laKkF81o7q
   quu39Qwe/IbtC+RhjuMPNnStfCE/CVjkEh/4jeRhNms8aRdK5ziQQE3JY
   QrM84ohhIOMZ2VZWSdafztbN3onf8MuBPVIJuOVNvTI61jqZ49hx+JPVd
   A==;
X-CSE-ConnectionGUID: nShHibv0SGWHq7NSJrEMhQ==
X-CSE-MsgGUID: JwktMjRbSN+oCzPOqaC5Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116661572"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="116661572"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:31:26 -0700
X-CSE-ConnectionGUID: zT7cdOwuQ4mTxS8COEIo0w==
X-CSE-MsgGUID: /+9apZ1QT8GLvFn1kSW0mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273442317"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Sep 2026 07:31:24 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA6xO-00000000Kko-2NLc;
	Fri, 25 Sep 2026 14:31:22 +0000
Date: Fri, 25 Sep 2026 22:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 610/673]
 arch/sparc/include/asm/page_32.h:127:9: warning: 'virt_to_phys' redefined
Message-ID: <202609252258.3Zc17438-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: d217cdb672619041e213243f6f352cb6422d3a59 [610/673] Revert "simplify asm/io.h"
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20260925/202609252258.3Zc17438-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252258.3Zc17438-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252258.3Zc17438-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/io_32.h:21,
                    from arch/sparc/include/asm/io.h:7,
                    from include/linux/io.h:12,
                    from lib/iomem_copy.c:8:
   include/asm-generic/io.h: In function 'virt_to_phys':
   include/asm-generic/io.h:1099:16: error: implicit declaration of function '__pa' [-Wimplicit-function-declaration]
    1099 |         return __pa((unsigned long)address);
         |                ^~~~
   include/asm-generic/io.h: In function 'phys_to_virt':
   include/asm-generic/io.h:1107:16: error: implicit declaration of function '__va' [-Wimplicit-function-declaration]
    1107 |         return __va(address);
         |                ^~~~
   include/asm-generic/io.h:1107:16: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
    1107 |         return __va(address);
         |                ^~~~~~~~~~~~~
   In file included from arch/sparc/include/asm/page.h:8,
                    from include/linux/io.h:13:
   arch/sparc/include/asm/page_32.h: At top level:
>> arch/sparc/include/asm/page_32.h:127:9: warning: 'virt_to_phys' redefined
     127 | #define virt_to_phys            __pa
         |         ^~~~~~~~~~~~
   include/asm-generic/io.h:1096:9: note: this is the location of the previous definition
    1096 | #define virt_to_phys virt_to_phys
         |         ^~~~~~~~~~~~
>> arch/sparc/include/asm/page_32.h:128:9: warning: 'phys_to_virt' redefined
     128 | #define phys_to_virt            __va
         |         ^~~~~~~~~~~~
   include/asm-generic/io.h:1104:9: note: this is the location of the previous definition
    1104 | #define phys_to_virt phys_to_virt
         |         ^~~~~~~~~~~~


vim +/virt_to_phys +127 arch/sparc/include/asm/page_32.h

f5e706ad886b6a include/asm-sparc/page_32.h Sam Ravnborg 2008-07-17  126  
f5e706ad886b6a include/asm-sparc/page_32.h Sam Ravnborg 2008-07-17 @127  #define virt_to_phys		__pa
f5e706ad886b6a include/asm-sparc/page_32.h Sam Ravnborg 2008-07-17 @128  #define phys_to_virt		__va
f5e706ad886b6a include/asm-sparc/page_32.h Sam Ravnborg 2008-07-17  129  

:::::: The code at line 127 was first introduced by commit
:::::: f5e706ad886b6a5eb59637830110b09ccebf01c5 sparc: join the remaining header files

:::::: TO: Sam Ravnborg <sam@ravnborg.org>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
