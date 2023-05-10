Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7763168CC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 16:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683734936; x=1715270936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZeSL7kEalpA5EjZZCduMFGYT1hA97waLf2+HwMK4SI0=;
  b=FnUJqRl48Ls9//lhhFZS+oaIUZgDbDuEgw3N4ogAtHe4NWlySCTDj1zI
   hTOXU0Knf0xPtwZ2hqP+o3ZyCiaYBa1iOQeoOuwoWmIMpZytaFT1UakNY
   r2UBut0xp/mq0pAxx2ZWEtNdvAKcTQyX5GtIxZUvBtuOb95VErKzdon+U
   agQlAese34+ld65ddQOoX/9FZJAmYi74xM0SrVw9rGJOZbvfwFjUD2R0y
   btmj4/CFXDyyh9k+l/mru7Ny9jSV9KXEHlFKcnC+C0NC4PYOutKKDRo+e
   UpMGTv1n0EC6Vdi/O5iI0AfILChzuEyjhJm8rLN4h46tg0/GcI4NRj+Xt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436578346"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="436578346"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 09:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="873627087"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="873627087"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 May 2023 09:08:39 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwmMo-0003Pr-1A;
	Wed, 10 May 2023 16:08:38 +0000
Date: Thu, 11 May 2023 00:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 24047/27339]
 drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such
 file or directory
Message-ID: <202305110006.Mzsa51lk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   38c9505e848341b872cc86bab96f3f746a5c7e5d
commit: d9a579535cd0f4623e627c3375781fb29c78692b [24047/27339] BACKPORT: arm/arm64: Probe for the presence of KVM hypervisor
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230511/202305110006.Mzsa51lk-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110006.Mzsa51lk-lkp@intel.com/

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
https://github.com/intel/lkp-tests
