Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F816FD7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 21:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682111785; x=1713647785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bodovovegsa4rOqT9ees1T9YY4PCXnhLtrQbnJ888XQ=;
  b=f5rhk7/86OC7vl+Cyiar/YSxsVfHXvMzwqXNkMwJZCghoGSPEPXnTbg2
   i0zB54TzeKNETvHaAlks9fwVOZjUTZgqEUqLHtUHtJOgVXRPVCvG26tlb
   WZOQuRdMSYTpH+YJPKl4FWqRR+spobyhHAB5/ETXzElczQdAq5C+X2e6U
   u4aZmYmCbsM+IngXJ8RLjVGhJusyGav8bHaaE++tDocImD/MAswn9tNP7
   +sa8vGXP73B6KSjwM0QONX1pSNktu0bYpMbNsMPQOOpGHOJB/UKxVRnsZ
   FEa25HfYX0TX8nVMjp9e0oljDcbgqKDWMfOLXTO/0PBT3YY4Mt4xJiZnL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="348878775"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="348878775"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 14:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="695068262"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="695068262"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2023 14:16:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppy7D-000gou-0N;
	Fri, 21 Apr 2023 21:16:23 +0000
Date: Sat, 22 Apr 2023 05:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-5.15.y 4230/9999] ERROR: modpost: "__divsi3_table"
 [lib/lz4/lz4_compress.ko] undefined!
Message-ID: <202304220538.ZNdx5JX9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   3299fb36854fdc288bddc2c4d265f8a2e5105944
commit: a2cafe242874338c4d9d2a23fb9130c9ae4221d0 [4230/9999] kbuild: fix the modules order between drivers and libs
config: nios2-randconfig-r034-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220538.ZNdx5JX9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=a2cafe242874338c4d9d2a23fb9130c9ae4221d0
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout a2cafe242874338c4d9d2a23fb9130c9ae4221d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220538.ZNdx5JX9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__mulsi3" [lib/objagg.ko] undefined!
ERROR: modpost: "__mulsi3" [lib/asn1_encoder.ko] undefined!
ERROR: modpost: "__mulsi3" [lib/bch.ko] undefined!
ERROR: modpost: "__mulsi3" [lib/reed_solomon/reed_solomon.ko] undefined!
ERROR: modpost: "__mulsi3" [lib/lz4/lz4hc_compress.ko] undefined!
>> ERROR: modpost: "__divsi3_table" [lib/lz4/lz4_compress.ko] undefined!
ERROR: modpost: "__mulsi3" [lib/lz4/lz4_compress.ko] undefined!
ERROR: modpost: "__mulsi3" [drivers/counter/counter.ko] undefined!
ERROR: modpost: "__mulsi3" [drivers/fpga/fpga-mgr.ko] undefined!
ERROR: modpost: "__mulsi3" [drivers/hwtracing/stm/stm_core.ko] undefined!
WARNING: modpost: suppressed 455 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
