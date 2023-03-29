Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95202F30
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 15:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680104466; x=1711640466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IkmXfmfWhUp4kDd36r9McA2vmIMVovRXyeC0eJjm04o=;
  b=TPXJDQXx16E6SaCgCLmz9P+QuZ4NhtGan8FFQQcfc2chOJkoTGEjc1gv
   T7d8VQ7IZ3SKM7XZYYhXoqwuql+UNHoj5yTUZdE9nd/V97e30NyN3+lVu
   c17O0M5cGWWDH3kW8uqTwKyDPWnQc9tzQSaXAPu9ay0V7JvEP/GOVwgAX
   QiLFzoiTV3yfKtwV8nuQBqmtJTHPagYQ4XU6fPkxDzuUKmgUjKpBN0WCo
   xTfLuwLSkeGquaNlmu+TUFnBmenwG+o9ogohrif5KTIv9278BSfAxRRIx
   DHG2GiCLqJ7BoiTAyIIl+yk0nouy0A0l65GNkuVw0iWvEgAtZqvagJ6PT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="338417239"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="338417239"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 08:41:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="716921322"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="716921322"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Mar 2023 08:40:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phXv0-000Jfw-1J;
	Wed, 29 Mar 2023 15:40:58 +0000
Date: Wed, 29 Mar 2023 23:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1/1] ERROR: modpost:
 "kthread_set_per_cpu" [drivers/trusty/trusty-core.ko] undefined!
Message-ID: <202303292338.aGlErOEy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   993014e4433829d09f2664c6d8576041bf9914ea
commit: 993014e4433829d09f2664c6d8576041bf9914ea [1/1] ANDROID: trusty: Call kthread_set_per_cpu
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230329/202303292338.aGlErOEy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-trusty-5.10
        git checkout 993014e4433829d09f2664c6d8576041bf9914ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303292338.aGlErOEy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "trusty_dma_buf_get_ffa_tag" [drivers/trusty/trusty-ipc.ko] undefined!
ERROR: modpost: "trusty_dma_buf_get_shared_mem_id" [drivers/trusty/trusty-ipc.ko] undefined!
ERROR: modpost: "kthread_create_on_cpu" [drivers/trusty/trusty-core.ko] undefined!
>> ERROR: modpost: "kthread_set_per_cpu" [drivers/trusty/trusty-core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
