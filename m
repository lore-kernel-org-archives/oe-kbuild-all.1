Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEE72597
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682863108; x=1714399108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fhdm1ZPKlNIX+D4Z1AZ4VZ8sk5nkHNtbXHaGCAJemec=;
  b=CLbrT9d3MjE/Ulvivl0JlsL6O3zWCv/P3uEZ00150EPmkUmg69dDAL+1
   t103gAUc5Wugo1DCF+Uah95Rp6JHg/P4jeEyGOv7gIBlV72y0RxAmbrLZ
   nEjNmT32pxucBCxDFyrGk4RGq04wP+AgJuYUTKCNpD2Fzf6ews2OtWi/n
   2cC0cG1c/AIbVl2cdMDuLLydyvgE4KioCkV1bUPJSDo1VYOkyn8LkLgJG
   2DSe1T6FM6CQ86JsHSyFtGiKnXmiF7zxgVwubLE9ueTqAAg61iUo0hSXV
   GE/zihQhZ9N89cg9t4TAeQfMLLlM/Wuelplf/hmSUMWtoGx/uZoi7usDH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="413447330"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="413447330"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 06:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="765008008"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="765008008"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2023 06:58:26 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt7ZJ-0001fR-1s;
	Sun, 30 Apr 2023 13:58:25 +0000
Date: Sun, 30 Apr 2023 21:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: xtensa-linux-ld: section .start VMA
 [00000000d1000000,00000000d1000007] overlaps section .image VMA
 [00000000d0003000,00000000d104b197]
Message-ID: <202304302137.linFJUfK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   825a0714d2b3883d4f8ff64f6933fb73ee3f1834
commit: 60443c88f3a89fd303a9e8c0e84895910675c316 kallsyms: Improve the performance of kallsyms_lookup_name()
date:   6 months ago
config: xtensa-randconfig-r021-20230430 (https://download.01.org/0day-ci/archive/20230430/202304302137.linFJUfK-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60443c88f3a89fd303a9e8c0e84895910675c316
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 60443c88f3a89fd303a9e8c0e84895910675c316
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304302137.linFJUfK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: section .start VMA [00000000d1000000,00000000d1000007] overlaps section .image VMA [00000000d0003000,00000000d104b197]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
