Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3AAC297
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 21:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678395642; x=1709931642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ctAw6A8FMzHTujj3qB4QPKH/FiLFrATeJVwQJgEbeA=;
  b=VdF6ySNjtl2mdPbzfEfVa7Or4a0HLrAEMS9R4xKSzWq6WVATYbSap5Ct
   nCKDl0qsFPeZk7K+VF6czM+2gBl7cSPLJ7otZ0rBisHcsAPz1PFyRONwb
   qskqMdvgkEZiZ9HCVxwMavjyDE8OiLXE74ayCzT+fY/oOIDX+9kJsKrDH
   PDecCiNnK67XdcCCl3K0E0He/gkHng+O4+VzHtH6JnHMCiBHCFzR+D7g9
   pFA4ZdImDk8RZC9hBJ6bcsjJwkxLRkfwrLsArjTgnIog0G8/6Ro3xshc6
   tqql/159kCAc1iymGA+7/DmOT6u3NLiKTekyUlKblzx6QjSSTWAF9tXqO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422837857"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="422837857"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 13:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677545758"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="677545758"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Mar 2023 13:00:40 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paNNP-0003Db-1n;
	Thu, 09 Mar 2023 21:00:39 +0000
Date: Fri, 10 Mar 2023 04:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:alexghiti_test 70/74] make[4]: *** No rule to make target
 'arch/riscv/lib/memset.S', needed by 'arch/riscv/purgatory/memset.o'.
Message-ID: <202303100426.gMPXVvYU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git alexghiti_test
head:   a66ce4f614559da376cae340d6012bf9a02e3c08
commit: c5085db87004fce3da1674500ecf74bb341e561d [70/74] riscv: optimized memset
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230310/202303100426.gMPXVvYU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/avpatel/linux/commit/c5085db87004fce3da1674500ecf74bb341e561d
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel alexghiti_test
        git checkout c5085db87004fce3da1674500ecf74bb341e561d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100426.gMPXVvYU-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[4]: *** No rule to make target 'arch/riscv/lib/memcpy.S', needed by 'arch/riscv/purgatory/memcpy.o'.
>> make[4]: *** No rule to make target 'arch/riscv/lib/memset.S', needed by 'arch/riscv/purgatory/memset.o'.
   make[4]: Target 'arch/riscv/purgatory/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
