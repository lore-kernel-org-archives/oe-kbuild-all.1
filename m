Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB67B7F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 00:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688604972; x=1720140972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EKE2RU8SZJXIYqz33ncYvzCk/G4XxGFNosZfIzrf9uQ=;
  b=fASt5ue2C6bUS0xBQPcvI/T8J1hFAINgM/C1qCKaPPDpB2ELZnumUfvT
   Yo8zAesmudhGQ0jQXiQ51E/N9hXHLaqIfifTkNHYpP4avS0RHwJemISSt
   dtY2nbrDxhOBegYKkUMhagqYJa3qBTURPS4Ogackc8yhUTNfLFEjwB6ax
   BT+tv6bC4nZ5tQ+Q1PocyR1LtPijXA6HNuefZh+6+OgU80p/Ei51ngEOY
   QZgW3z0S9xdXt2v/RiqYPpn0U+cRXoAE8nswixeN+AarUJ2QRwQUw+gj+
   kcYAbaR2mXMUrhRJVLfvE88VFe6us0pa6khotBYzLy7aUoGalXFXJpzBc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="343803458"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="343803458"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 17:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="754562942"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="754562942"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Jul 2023 17:56:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHDI1-0000v5-1X;
	Thu, 06 Jul 2023 00:56:09 +0000
Date: Thu, 6 Jul 2023 08:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 6273/6356]
 arch/mips/alchemy/common/dbdma.c:33:10: fatal error: linux/dma-map-ops.h: No
 such file or directory
Message-ID: <202307060839.L8sMOxrw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: a16419bae292d768546bcd6e0bfbf8a722756fee [6273/6356] MIPS: Alchemy: fix dbdma2
config: mips-db1xxx_defconfig (https://download.01.org/0day-ci/archive/20230706/202307060839.L8sMOxrw-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060839.L8sMOxrw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307060839.L8sMOxrw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/alchemy/common/dbdma.c:33:10: fatal error: linux/dma-map-ops.h: No such file or directory
      33 | #include <linux/dma-map-ops.h> /* for dma_default_coherent */
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +33 arch/mips/alchemy/common/dbdma.c

  > 33	#include <linux/dma-map-ops.h> /* for dma_default_coherent */
    34	#include <linux/init.h>
    35	#include <linux/kernel.h>
    36	#include <linux/slab.h>
    37	#include <linux/spinlock.h>
    38	#include <linux/interrupt.h>
    39	#include <linux/export.h>
    40	#include <linux/syscore_ops.h>
    41	#include <asm/mach-au1x00/au1000.h>
    42	#include <asm/mach-au1x00/au1xxx_dbdma.h>
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
