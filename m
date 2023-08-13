Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2DA15BF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Aug 2023 06:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691907274; x=1723443274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fwEyT6bEJQzj4HXVE3kxJ4I2wpm/x6DJ6MvI9P+vuGY=;
  b=eqe6j6zy57HGeNgpeWKD+H2lQg0T0nOImERK5bQ/z5UoccT3rnm6sE0H
   US9/rGON7dKb9Mo9DpogN5AHCTrkbCKJ0yxYw7hkrQJzGsLwaZkKIlUns
   D/iP+SNGXFKgwa466mG8nlWn3HiDZ7uCwRQkCfN9VGyuZmx/p534Cdc4V
   r4lDACt1CDvkZltXHP/dwHggW1l1JCMYFRm9OaMFz2PpnRAPkb5esDKku
   148sB9HDP5iedSTiHyLPtnUF09Lftvi9F7VWwzcxbZaGBOFhC9uVC91nF
   tdY/6l9FHG2vhMtujWZwY8UjrkkOf1G4fFLg8eaVj715Jgegjy8f+LvQ6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="375576667"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="375576667"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 23:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="847226999"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="847226999"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Aug 2023 23:14:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qV4My-0008yy-0E;
	Sun, 13 Aug 2023 06:14:32 +0000
Date: Sun, 13 Aug 2023 14:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 6443/6709]
 arch/arm/mach-ep93xx/timer-ep93xx.c:12:10: fatal error: platform.h: No such
 file or directory
Message-ID: <202308131447.n3Ic8zaM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   fbbeed723bc5560108f32c8cf5df5a9a0b19519e
commit: 6c52a55fc41eebeb76138d3db0704b1cb4d5299e [6443/6709] ARM: ep93xx: fix missing-prototype warnings
config: arm-ep93xx_defconfig (https://download.01.org/0day-ci/archive/20230813/202308131447.n3Ic8zaM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308131447.n3Ic8zaM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308131447.n3Ic8zaM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mach-ep93xx/timer-ep93xx.c:12:10: fatal error: platform.h: No such file or directory
      12 | #include "platform.h"
         |          ^~~~~~~~~~~~
   compilation terminated.


vim +12 arch/arm/mach-ep93xx/timer-ep93xx.c

  > 12	#include "platform.h"
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
