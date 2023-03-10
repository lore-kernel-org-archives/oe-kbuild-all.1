Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDD923AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678441814; x=1709977814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HiWXKpwgAmXEw4KnGdtH3YLwn90vQiFkGYCILtlbO7U=;
  b=CRv0/iZJmDbIjsmECQgTR5IX2UUy6za8x//cvxWQQ2ty4d2TbXTSRviw
   wENi3C1jI4NTLcJTz3XmlC5CODP0IltpKzNF8hlpy75qvbxrZq24hANtJ
   Yp0n347UZ+Bp9OwU2iHNeL6muvdEht5IUnqkeJva/+V5QtjZd4PzHEeb5
   I310l+0y/YYDVL6v6T3x0Cf+Ynb3q4/0JgpBbC5xvQk45fMxzvShk6SHd
   10RmR/e15lwAfrxTZmZY6U5nIJCvOmiynnJdbT7vacB1rle2BGKz9hS8k
   gZd79GsjoqBw7FIZXUGDJNOKU+7OSo9lT49JmgBzvo1Oz1bUEz0GtiuBT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="401554354"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="401554354"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 01:50:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="766773075"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="766773075"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Mar 2023 01:50:12 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paZO8-0003j6-1A;
	Fri, 10 Mar 2023 09:50:12 +0000
Date: Fri, 10 Mar 2023 17:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-trusty-5.10
 2/2] ERROR: modpost: "kthread_create_on_cpu" [drivers/trusty/trusty-core.ko]
 undefined!
Message-ID: <202303101723.wD5KVvRe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-trusty-5.10
head:   de814afe14b14bf51d89ff8c1861b7a15ef2c3b2
commit: de814afe14b14bf51d89ff8c1861b7a15ef2c3b2 [2/2] ANDROID: trusty: park threads when cpu is offline
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230310/202303101723.wD5KVvRe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/de814afe14b14bf51d89ff8c1861b7a15ef2c3b2
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-trusty-5.10
        git checkout de814afe14b14bf51d89ff8c1861b7a15ef2c3b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101723.wD5KVvRe-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "trusty_dma_buf_get_ffa_tag" [drivers/trusty/trusty-ipc.ko] undefined!
ERROR: modpost: "trusty_dma_buf_get_shared_mem_id" [drivers/trusty/trusty-ipc.ko] undefined!
>> ERROR: modpost: "kthread_create_on_cpu" [drivers/trusty/trusty-core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
