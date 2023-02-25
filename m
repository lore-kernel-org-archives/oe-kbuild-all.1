Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88217C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677315641; x=1708851641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N9jhrY5gIQpfxiSF+T+nOZL7yNeI8a74CZhPjBSicyk=;
  b=Njo+vyEpwdPKAGs5cxEkCyA/UuNWsubOySzph3R6Dxy9J/fEwmPFUCIA
   5GCle1jrk0FYaBHpAZ2HnufOOZy1fizcDq3IUa5k63+9Bqu+P0TroJXp8
   hmWBhEcToi/OSMd9DuK/CU2eQk7UMBQ+C5GhGba3VIpc3E0jVBZsufVW/
   C4TUBIMvpFDYlf/oszxTDd4eiNnLvkaycN8S5foE5qjVc22MbQ+B5gagc
   bq/aGlxvlPXAhq0siTfro+N3rCs01xolesyB1PzJCP0qdNKxKKWwGy4+q
   YGucD44t5MRk5lN7xhQey3II8zl57ABJlyQBfzz4Q7BCbuV3dzx9iOJIg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313282917"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="313282917"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 01:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="650618590"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="650618590"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Feb 2023 01:00:25 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVqPo-00034l-15;
	Sat, 25 Feb 2023 09:00:24 +0000
Date: Sat, 25 Feb 2023 16:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Ott <sebott@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: s390-linux-ld: arc-rimi.c:undefined reference to `iounmap'
Message-ID: <202302251622.fFIHvPR0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   489fa31ea873282b41046d412ec741f93946fc2d
commit: 71ba41c9b1d91042960e9d92a5c8f52dc8531eda s390/pci: provide support for MIO instructions
date:   3 years, 10 months ago
config: s390-randconfig-r015-20230225 (https://download.01.org/0day-ci/archive/20230225/202302251622.fFIHvPR0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=71ba41c9b1d91042960e9d92a5c8f52dc8531eda
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 71ba41c9b1d91042960e9d92a5c8f52dc8531eda
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251622.fFIHvPR0-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/tty/ipwireless/main.o: in function `ipwireless_detach':
   main.c:(.text+0x8a): undefined reference to `iounmap'
   s390-linux-ld: main.c:(.text+0xce): undefined reference to `iounmap'
   s390-linux-ld: drivers/tty/ipwireless/main.o: in function `config_ipwireless':
   main.c:(.text+0x25e): undefined reference to `iounmap'
   s390-linux-ld: main.c:(.text+0x29c): undefined reference to `iounmap'
   s390-linux-ld: drivers/tty/ipwireless/main.o: in function `ipwireless_probe.part.0':
   main.c:(.text+0x528): undefined reference to `ioremap'
   s390-linux-ld: main.c:(.text+0x5e4): undefined reference to `iounmap'
   s390-linux-ld: main.c:(.text+0x61a): undefined reference to `ioremap'
   s390-linux-ld: main.c:(.text+0x664): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/com90xx.o: in function `com90xx_exit':
   com90xx.c:(.exit.text+0x5a): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/com90xx.o: in function `check_mirror':
   com90xx.c:(.init.text+0x4c): undefined reference to `ioremap'
   s390-linux-ld: com90xx.c:(.init.text+0x6e): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/com90xx.o: in function `com90xx_found':
   com90xx.c:(.init.text+0xe6): undefined reference to `iounmap'
   s390-linux-ld: com90xx.c:(.init.text+0x1ba): undefined reference to `iounmap'
   s390-linux-ld: com90xx.c:(.init.text+0x2d4): undefined reference to `ioremap'
   s390-linux-ld: com90xx.c:(.init.text+0x3a2): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/com90xx.o: in function `com90xx_probe':
   com90xx.c:(.init.text+0x64c): undefined reference to `ioremap'
   s390-linux-ld: com90xx.c:(.init.text+0x6a8): undefined reference to `iounmap'
   s390-linux-ld: com90xx.c:(.init.text+0x8d6): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/arc-rimi.o: in function `arc_rimi_exit':
   arc-rimi.c:(.exit.text+0x2e): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/arc-rimi.o: in function `arcrimi_found':
   arc-rimi.c:(.init.text+0xb6): undefined reference to `ioremap'
>> s390-linux-ld: arc-rimi.c:(.init.text+0x132): undefined reference to `iounmap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x29a): undefined reference to `iounmap'
>> s390-linux-ld: arc-rimi.c:(.init.text+0x322): undefined reference to `ioremap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x3e0): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/arc-rimi.o: in function `check_mirror':
>> arc-rimi.c:(.text.unlikely+0x4c): undefined reference to `ioremap'
>> s390-linux-ld: arc-rimi.c:(.text.unlikely+0x6e): undefined reference to `iounmap'
   s390-linux-ld: drivers/pcmcia/cistpl.o: in function `set_cis_map':
   cistpl.c:(.text+0x210): undefined reference to `iounmap'
   s390-linux-ld: cistpl.c:(.text+0x222): undefined reference to `ioremap'
   s390-linux-ld: cistpl.c:(.text+0x278): undefined reference to `ioremap'
   s390-linux-ld: cistpl.c:(.text+0x28e): undefined reference to `iounmap'
   s390-linux-ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem':
   cistpl.c:(.text+0xd34): undefined reference to `iounmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
