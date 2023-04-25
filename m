Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49678A944
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 21:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682458509; x=1713994509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qpj7KttovTMIQPOyWBEnDy6HxETw8PBKSVdP2RuLBkw=;
  b=jB6wJ8ufb+Ll4n1BRtJQMmj3iAg0dQDL9PKD+kL/aeD+cZUlfhZDErEO
   xnnv98565dmZwn03/rKyu83+Ii4WptDjOk7J684eDyAVash1Viq3lLF6m
   Jci/+uAXQu/0HlHJbNfTCBewnKM67znX+5p7LT3Yv/RJRGMFX/aXQsHUu
   rH3ySYM56lQYJ3HBLsuShP1AsiInCdCN5B+MVOJrCzIKX11iBipN90x/v
   ggVeA5huHYyDhhTPv71IpzjZGOCsFgJS/OQVh7I2DM9YxTqV/Y/mf66Ye
   34olQBng3924ldUN0lgr57BA6S/W7cdEb5K2pmTVBBy7M2j7uH1OgV3lT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="326510264"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="326510264"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 14:35:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="726269224"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="726269224"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Apr 2023 14:35:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prQJQ-000jnE-31;
	Tue, 25 Apr 2023 21:35:00 +0000
Date: Wed, 26 Apr 2023 05:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3963/14039] s390-linux-ld: arc-rimi.c:undefined
 reference to `iounmap'
Message-ID: <202304260503.EVDTG0PJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiko,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f600e0bbde8562a06bee31b3eb1b69d49acac4c5
commit: 6ef55060a1cc29dd54ff390f22cb3de266dab2b0 [3963/14039] s390: make use of CONFIG_FUNCTION_ALIGNMENT
config: s390-randconfig-r022-20230424 (https://download.01.org/0day-ci/archive/20230426/202304260503.EVDTG0PJ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6ef55060a1cc29dd54ff390f22cb3de266dab2b0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6ef55060a1cc29dd54ff390f22cb3de266dab2b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304260503.EVDTG0PJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/net/arcnet/arc-rimi.o: in function `check_mirror':
   arc-rimi.c:(.text+0x16a): undefined reference to `ioremap'
>> s390-linux-ld: arc-rimi.c:(.text+0x18c): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/arc-rimi.o: in function `arc_rimi_exit':
   arc-rimi.c:(.exit.text+0x2e): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/arc-rimi.o: in function `arcrimi_found':
   arc-rimi.c:(.init.text+0xd4): undefined reference to `ioremap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x158): undefined reference to `iounmap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x278): undefined reference to `iounmap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x352): undefined reference to `ioremap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x43a): undefined reference to `iounmap'
   s390-linux-ld: drivers/pcmcia/cistpl.o: in function `set_cis_map':
   cistpl.c:(.text+0x454): undefined reference to `ioremap'
   s390-linux-ld: cistpl.c:(.text+0x48a): undefined reference to `iounmap'
   s390-linux-ld: cistpl.c:(.text+0x4fa): undefined reference to `iounmap'
   s390-linux-ld: cistpl.c:(.text+0x50c): undefined reference to `ioremap'
   s390-linux-ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem':
   cistpl.c:(.text+0xd26): undefined reference to `iounmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
