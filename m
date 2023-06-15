Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5304C651
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 06:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686808849; x=1718344849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MPZGn6hY/4cbra9oawhNo0qTl7i8RIyCE97RI+GHDMk=;
  b=eBJlHfLQzpLjDHc7euHCbtdFJdNqsaYnystmndyabhvaO5UQ1DDR1g2+
   meSaVT3TRv4RcT/S1OSev6SoWO1h6nzaAIyGTiJ8Er91m7YSRFv3zU9sk
   750Px1afS60uuT3IG3Esl56K5+mx7JaHSXwF3ZfDQa4n21/LWExAxb3SI
   z50/3LUFHTysMcExEg/g54k4DUo7LCox/MNwwIgOpx7+NYJtJiVIlspf4
   DExGg6b5AKg/re5sF/xTLFDhGkChUn5DKopXeT+AAYHbKH919Zzu8LYh1
   YZKMHHzkqXjG06YweMW2MB9SyjdOSyeVKE3EZDIjlkP5qgSkhw4sBqL/y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343521586"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="343521586"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 23:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="706511793"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="706511793"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Jun 2023 23:00:46 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9g2H-0001X1-2L;
	Thu, 15 Jun 2023 06:00:45 +0000
Date: Thu, 15 Jun 2023 14:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [mkp-scsi:for-next 70/83] ./usr/include/linux/ioprio.h:107:8: error:
 unknown type name '__always_inline'
Message-ID: <202306151347.WblKhRwQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   aca416ac0b1fbe89d563f88cdb9884f986863d34
commit: bfaaaa3d9d09974828dc5c5d44eb2657a65d6b60 [70/83] scsi: block: Improve ioprio value validity checks
config: i386-randconfig-i012-20230614 (https://download.01.org/0day-ci/archive/20230615/202306151347.WblKhRwQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/commit/?id=bfaaaa3d9d09974828dc5c5d44eb2657a65d6b60
        git remote add mkp-scsi https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git
        git fetch --no-tags mkp-scsi for-next
        git checkout bfaaaa3d9d09974828dc5c5d44eb2657a65d6b60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151347.WblKhRwQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/ioprio.h:107:8: error: unknown type name '__always_inline'
     107 | static __always_inline __u16 ioprio_value(int class, int level, int hint)
         |        ^~~~~~~~~~~~~~~
>> ./usr/include/linux/ioprio.h:107:30: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ioprio_value'
     107 | static __always_inline __u16 ioprio_value(int class, int level, int hint)
         |                              ^~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
