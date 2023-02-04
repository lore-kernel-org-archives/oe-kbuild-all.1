Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA41FD0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675515766; x=1707051766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZiB2+a9QBuZ/x+d9bUiTNpbMipihsxte+Dbzds1rSnQ=;
  b=GRQCxDD293iT0sTglK7XJ42oJuSAjyRskE+xPH2rV9A3ZGTj8iTRNrsH
   WALxynqw45j+3TolmBNO9gEC30iCnS2SIh89ZomsirIkukXtC5O29FxWH
   TXNlqVJShSNbCJYzmG1VhtSlLN90JmP0tDtZRXOjnE6FMqlMoJMTNibu0
   aIhFTRKHNhlHdb+9MKMMMQSjVxF/rnMx6Pfqt3Nqf9Jaujz5hKItdWOON
   hepGw8mPv3oP4uZSqiLElSoz9IXTABP5ibgdSUk88H4+KTnRXfGwj2xGH
   +ptZZNtOgo0aUlNXV/C+it5P/OrGhLTxK8IXh33zMC58EkYYyhvJvdLMA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312598438"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="312598438"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 05:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729546942"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="729546942"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Feb 2023 05:02:44 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOIBo-0001Jc-0D;
	Sat, 04 Feb 2023 13:02:44 +0000
Date: Sat, 4 Feb 2023 21:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 6175/20208] m68k-linux-gcc: error:
 unrecognized argument in option '-march=armv7-a'
Message-ID: <202302042021.2rogBoxi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: b83a99edcb3eb46360f4b4470a51e0f0749bd73e [6175/20208] Merge branch 'mxc/next' into next
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230204/202302042021.2rogBoxi-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/b83a99edcb3eb46360f4b4470a51e0f0749bd73e
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout b83a99edcb3eb46360f4b4470a51e0f0749bd73e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> m68k-linux-gcc: error: unrecognized argument in option '-march=armv7-a'
   m68k-linux-gcc: note: valid arguments to '-march=' are: 68000 68010 68020 68030 68040 68060 cpu32 isaa isaaplus isab isac
>> m68k-linux-gcc: error: unrecognized argument in option '-mtune=cortex-a9'
   m68k-linux-gcc: note: valid arguments to '-mtune=' are: 68000 68010 68020 68020-40 68020-60 68030 68040 68060 cfv1 cfv2 cfv3 cfv4 cfv4e cpu32
>> m68k-linux-gcc: error: unrecognized command-line option '-mfpu=neon'
>> m68k-linux-gcc: error: unrecognized command-line option '-mfloat-abi=softfp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
