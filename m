Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29EDEA8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 18:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687199639; x=1718735639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HtKbxmRTpLv51zTQZZU+UZM5OJOntPrvEoPwAn2CEYk=;
  b=hTibGgTDU8w+QahFFuB9hszo5f/kTzqiHtw9mutyvxdAHqsfBZKQZus5
   qORJE55mpH421TC+rJD31DQO31hEsa8+Sxcs2tHGX3v0w/nAC8mA07FE7
   ZXSS1SxfJYlQFt3g8PhDiLIzx6td2blsBHy1z1YILFsTHxI7ukfmufWBc
   WZ2ixQ/OwdhL3nm+vonCf+uJE4+0Lt8AsA8mO8k+GDTvHhmjoIyM1OAzE
   ql1JGSJ6eihqc4UDZN97KLoEl3f72+chbNeNoQxOIGZY2dkeHy4ewxhAn
   xb4keYj13SqXa3B2/n44PI9dJ/o6pTOZi8kcggbiKqvxseCjLjFEXiJsK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="423357824"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="423357824"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 11:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="837955132"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="837955132"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jun 2023 11:33:57 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBJhM-00050B-2T;
	Mon, 19 Jun 2023 18:33:56 +0000
Date: Tue, 20 Jun 2023 02:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-4.14.y 4843/4869]
 arch/mips/alchemy/common/dbdma.c:33:10: fatal error: linux/dma-map-ops.h: No
 such file or directory
Message-ID: <202306200203.up0Emmlj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
head:   30c57b30b667852569dfc303f0bbd69d595134e6
commit: d8fde2f17a046d5901fee0579b4dfa7f0b092bd7 [4843/4869] MIPS: Alchemy: fix dbdma2
config: mips-gpr_defconfig (https://download.01.org/0day-ci/archive/20230620/202306200203.up0Emmlj-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306200203.up0Emmlj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306200203.up0Emmlj-lkp@intel.com/

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
