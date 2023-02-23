Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9497929AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677169460; x=1708705460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ko6L0C+BnrUAMploMHD/v7s2+KUaN7gHYjCVJVoOOZI=;
  b=l29OMBOgyNzPc4q3z0kO8G3nhUaJPwlqPT2709nI4t5hj6MGhXtjG/6+
   keRIK/+j/57xdJaawlR6Jjg7rUVbdyKSU3+g4v8J3UGjJsPUOLgdHTkNN
   QH0Fc8GBg5B2slu24pCCXCVvWpq4fMif42M+uCM43b/Ts/3LgK1+CJHWC
   h8+sSv7PiHPuNkncQCrAJ5/BpFBnwR3kn96Bd3SIgy6Vi6RFx3aBswQMq
   1jf/8R6qHky2YjTJeVU6/rG+RhnMZPF49RDauotGN1BrO0jTmsqUs+yet
   3e7P3Dwb90bvRgPlKnN6zrZxYfJjkdMXLHd14dKmhzJPvUPsuJK6wGI6a
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="419483286"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="419483286"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 08:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="741329312"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="741329312"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2023 08:24:08 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVEO7-0001U1-36;
	Thu, 23 Feb 2023 16:24:07 +0000
Date: Fri, 24 Feb 2023 00:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/030-misc 19/24]
 drivers/soc/apple/rtkit-crashlog.c:6:10: fatal error: asm/esr.h: No such
 file or directory
Message-ID: <202302240021.M6hSgL3z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Asahi,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   16b5bb2c2f8dacac332beb8584ce5cf66f32faa7
commit: a1521d50e71902d0c49980cbaaa669957bfedc6a [19/24] soc: apple: rtkit: Add register dump decoding to crashlog
config: powerpc-randconfig-r034-20230222 (https://download.01.org/0day-ci/archive/20230224/202302240021.M6hSgL3z-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/a1521d50e71902d0c49980cbaaa669957bfedc6a
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/030-misc
        git checkout a1521d50e71902d0c49980cbaaa669957bfedc6a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240021.M6hSgL3z-lkp@intel.com/

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
