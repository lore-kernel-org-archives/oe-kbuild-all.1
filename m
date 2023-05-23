Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3791D1F19E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 May 2023 16:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684859123; x=1716395123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+jkSx+GwiUoivVP/QjFoSpoM0ScxhT1SkvmzZJJYwlk=;
  b=NbOO67TSzRKVozksQ6aqaA2hbYSbw+/DTiFx2jUcPt1YnR6YYYPJ0RnJ
   JQ9xIVQCbGdpTos9mfs3+eGWTehQnF7ZJD4rQjlGJzQ1H18yd8tEkHAI4
   /anvlB9yJy+UJR1fisw5q2BvVeuV/rU/CtcVhEGvey7OLfzmu40K5dErk
   YXJa2WIUa1x78+VcT1/aCOwe2gffIn7qJGUyinpykPzPbreqga+RSAtim
   jG42UblzsgtLYvwfMquvCcx+yJUSU8QEMmXl5m+q3r8MDLYVIV0g9OAiH
   Pwqh0kEUfOiyMuM88ewC12eN+wF8uzV+EF7DscheDvo09qG8imgW4KxW8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="352133748"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="352133748"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 09:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="1034124322"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="1034124322"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 May 2023 09:25:21 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1Up7-000Dv7-02;
	Tue, 23 May 2023 16:25:21 +0000
Date: Wed, 24 May 2023 00:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 24047/27646]
 drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such
 file or directory
Message-ID: <202305240039.LtpMKNdY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   3ecad7fb1197e30c71f05716a77341888aad8001
commit: d9a579535cd0f4623e627c3375781fb29c78692b [24047/27646] BACKPORT: arm/arm64: Probe for the presence of KVM hypervisor
config: arm-randconfig-r046-20230522 (https://download.01.org/0day-ci/archive/20230524/202305240039.LtpMKNdY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common mirror-chromeos-5.10-arcvm
        git checkout d9a579535cd0f4623e627c3375781fb29c78692b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mm/ drivers/firmware/smccc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305240039.LtpMKNdY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such file or directory
      11 | #include <asm/archrandom.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 drivers/firmware/smccc/smccc.c

     7	
     8	#include <linux/init.h>
     9	#include <linux/arm-smccc.h>
    10	#include <linux/kernel.h>
  > 11	#include <asm/archrandom.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
