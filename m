Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16082F58
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 20:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682369642; x=1713905642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XPKa/Z4mrYLblsRh8gcNKRyyE0c4TU45xzcnx5GN1Do=;
  b=VrYyBuQQBgTBbxJD/58g7lCtQYhpm9N5xJou5Xe+6atevRJoQfncWqsT
   vgq/LZPp4FpQeBSNnnXMF039lhaOUvY4oVuv3VlyVmvvnnurwzeCjFfVL
   +dTyntjsUcX2KgPaslCOKsd7Fj3SATxl0oSfwy5Iot9fVVQ1hJ8N7UU3X
   Yc9y/3qAL/tYLy+MDuztx+bMfoqzQcIcUZ34l7O3iX4rp1nEBs4mRr7qF
   rYXL8Wuksv0KUIhJWUVLsgknI15Y+laOVFXnKO2pXyhiCBWAk2CCr/J6g
   TY9wi7AFLtHTrcqGZCh8v6WOeYTw/nk/E7sFFd5RuEeRgnraVU9FKf+x1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330766942"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="330766942"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 13:54:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="723729440"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="723729440"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Apr 2023 13:54:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr3CC-000ieS-00;
	Mon, 24 Apr 2023 20:54:00 +0000
Date: Tue, 25 Apr 2023 04:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Richard Weinberger <richard@nod.at>
Subject: [linux-next:master 12780/13853] arch/um/drivers/harddog_user.c:6:10:
 fatal error: stdio.h: No such file or directory
Message-ID: <202304250419.YtCLtUhG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3b85b9b39960c08f29fa91b8d984d055dde6017e
commit: fc54a4f15988e228cf88f888483e985c5f35031e [12780/13853] um: prevent user code in modules
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20230425/202304250419.YtCLtUhG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fc54a4f15988e228cf88f888483e985c5f35031e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout fc54a4f15988e228cf88f888483e985c5f35031e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um olddefconfig
        make W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250419.YtCLtUhG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/um/drivers/harddog_user.c:6:10: fatal error: stdio.h: No such file or directory
       6 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.


vim +6 arch/um/drivers/harddog_user.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  @6  #include <stdio.h>
^1da177e4c3f41 Linus Torvalds 2005-04-16   7  #include <unistd.h>
^1da177e4c3f41 Linus Torvalds 2005-04-16   8  #include <errno.h>
37185b33240870 Al Viro        2012-10-08   9  #include <os.h>
^1da177e4c3f41 Linus Torvalds 2005-04-16  10  

:::::: The code at line 6 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
