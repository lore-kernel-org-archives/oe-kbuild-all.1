Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63AC3C02
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Mar 2023 20:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678046622; x=1709582622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XwY+ROf8r2XV+a3CIsquw961T1PTKEIUtFb8uYfSlew=;
  b=IQ9fN0qUrbuzLm14B87Avz85kzaksJ/QAr5w7DjSZiMIj6/PxKNCIkCW
   iI3ALCillQDp7bTTn5dW1CEAsjd22gR7Zqq7FsDZNN8XEqjdOEjlwF2+2
   RzgLeserXNZRJ2qgX4rOmeTI1oCBSlLVWjY80pu5ELjEAnnpNUfUb4SVA
   EElwEdLh5nZXgI/I1nZZ5OFKDDjFWfgFi2x77WXdps7BRtl7noOYtJW3f
   /c3HL2nEuveAF2gKUfQmhC/NOANOlZ/Jf3NkF/yKrOPacrHnUdGhWK7cQ
   BjIzQm3XyqMOAs1H/dGvq1+47YHaRNEq5HP6puv1cu5EbdXFuSDlbKzKy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="363027758"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="363027758"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 12:03:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="678266021"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="678266021"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Mar 2023 12:03:41 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYua4-00030y-2W;
	Sun, 05 Mar 2023 20:03:40 +0000
Date: Mon, 6 Mar 2023 04:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/030-misc 18/23]
 drivers/soc/apple/rtkit-crashlog.c:6:10: fatal error: asm/esr.h: No such
 file or directory
Message-ID: <202303060326.QIFQ4pLq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   145b9109791b453f0fb63003c3f10ab49b0ea48e
commit: cbd6c6353366562ef7256d1d8deed3e85492f439 [18/23] soc: apple: rtkit: Add register dump decoding to crashlog
config: openrisc-buildonly-randconfig-r001-20230305 (https://download.01.org/0day-ci/archive/20230306/202303060326.QIFQ4pLq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/cbd6c6353366562ef7256d1d8deed3e85492f439
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/030-misc
        git checkout cbd6c6353366562ef7256d1d8deed3e85492f439
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303060326.QIFQ4pLq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/apple/rtkit-crashlog.c:6:10: fatal error: asm/esr.h: No such file or directory
       6 | #include <asm/esr.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +6 drivers/soc/apple/rtkit-crashlog.c

   > 6	#include <asm/esr.h>
     7	#include "rtkit-internal.h"
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
