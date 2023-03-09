Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C737628
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 01:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678324626; x=1709860626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zpz7TPGJbGE7JDwYB+s8AoiLSmA1oxcnzJ4Ck+jYNG8=;
  b=CcwMZV6yXiurWkVjpISjVDG7lDW9opTSiNuymwJGm/YPwWIIasdnF7hl
   u3gb2jOg+3gJBm3qWyt21roIJzM6KNaI57IBIdMDQBFwUpEOxLNr8DOK1
   ATzjzzwsP6vi31Lz7SBPcUJwvprLnBom36KFWQLuva6yCbR/yDds6Z0v8
   QyXVwbjVBQyEKLkM50GvUakT3i0iq9Xkc+/6ZTR+9Fm6P50Gp9LogQTkh
   RuiwTaQ6+a8D0lADbduOyjThqu0lg4M74bWLN03M8DWcaXkfqwWB/E53r
   yTjSYnPnF9AFHbILLxMKKI0QuGAnuCXxmqVRvTMq4Mw087Lx+FhrGNEf+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335026983"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="335026983"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 17:17:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="923027072"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="923027072"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 17:17:05 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa4u0-0002XF-1w;
	Thu, 09 Mar 2023 01:17:04 +0000
Date: Thu, 9 Mar 2023 09:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_2 1/11]
 target_core_fabric_configfs.c:(.text+0xd96): multiple definition of
 `bpf_uprobe_multi_link_attach';
 drivers/target/target_core_configfs.o:target_core_configfs.c:(.text+0x3cba):
 first defined here
Message-ID: <202303090902.SZfVLxsK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi_2
head:   10c9ee1a8d9260b0588aa9afde019a886ac8a9fe
commit: 86797164e5e9eb54802e4a3a3d1a5648958a2a0f [1/11] bpf: Add multi uprobe link
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230309/202303090902.SZfVLxsK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=86797164e5e9eb54802e4a3a3d1a5648958a2a0f
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_2
        git checkout 86797164e5e9eb54802e4a3a3d1a5648958a2a0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090902.SZfVLxsK-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/target/target_core_fabric_configfs.o: in function `bpf_uprobe_multi_link_attach':
>> target_core_fabric_configfs.c:(.text+0xd96): multiple definition of `bpf_uprobe_multi_link_attach'; drivers/target/target_core_configfs.o:target_core_configfs.c:(.text+0x3cba): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
