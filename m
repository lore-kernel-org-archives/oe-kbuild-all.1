Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A9B15480
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690563290; x=1722099290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sx16xzcIw5y4D1uBqLamnRbQWSVacxlH0CZWuJxnxdU=;
  b=BNEANIS19rEuXqtag355LKgUKN8P6/O15ShpW2BPfYKGrVHzY7HuH+F9
   801Z6o4oFt1HOzueloQVbwlmTIYBOGn/iXp2qGDR1PpuUbgJ9ERYPNh3t
   HbOBRfm/VAJWGtVHdAp+/ykVNNGywZ1i54RbO3EEMzuwC5UXf3My0Fg3F
   IF6GR+ms3yBx67HmhHxwypISJdl2Is4m+9VEy+EKs2MxjfgGbC/4sUeDo
   ekJTyTKcp8ahY8IBBKyzpcW8+9fpogyMXZ5bduRoyV9BBXPNIg3v4/zyo
   Pv9XR2WUF5UI6mzK/meEo5YHvalrBGNYrFAyFPar820GgnNa3y0zltVEM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434921554"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="434921554"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 09:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797485342"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="797485342"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jul 2023 09:54:46 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPQjl-0003Ow-1v;
	Fri, 28 Jul 2023 16:54:45 +0000
Date: Sat, 29 Jul 2023 00:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.4.y 8803/9227]
 arch/mips/alchemy/common/dbdma.c:33:10: fatal error: linux/dma-map-ops.h: No
 such file or directory
Message-ID: <202307290005.yHoCk0YZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   887433e4bc9394676d22c038dba33a27405f94e8
commit: a365600bba27c35d0d93fd490b01919fbd7d4848 [8803/9227] MIPS: Alchemy: fix dbdma2
config: mips-gpr_defconfig (https://download.01.org/0day-ci/archive/20230729/202307290005.yHoCk0YZ-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290005.yHoCk0YZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290005.yHoCk0YZ-lkp@intel.com/

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
