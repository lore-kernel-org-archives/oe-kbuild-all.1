Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE91F2135D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 20:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695500389; x=1727036389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vIpfrGGc46VPMpyFTCjorJ08Xd0uayCnMCN/hCYCdmQ=;
  b=ciUUZsHQJF6G5XcxmIJ/zJ4U7mtdstjQukz/NR/Aw/Lu94rPrjRuTDiO
   2EEdHT4HoLKBx6sqU8z0ngiL+DqScRT66wYt2wefPnzm66kl4u6yCQqMq
   HriWHLPzjouazx+72vqYdx9cPDbyrZK5gwV8VKSebmmcLMk8Az0xOUVuy
   kDpJIlSPzFiyFJAqoNDp2YkRcyj67wI4vTP+zGFRgp9D7i3PGEu/5g5yX
   DjmWJG8re0jEOsh7BH81nT1nGbMz2Ky2m5dZyRjNr93CTsmRIOHf9vOoV
   PK3gajqMsPLNtsvE1p5K/d864bw1Jt2/JtPpOPYHF9q04k8hbPF0Glm3L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="371371871"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="371371871"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 13:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="697570701"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="697570701"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 23 Sep 2023 13:19:48 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk96P-0002nj-2x;
	Sat, 23 Sep 2023 20:19:45 +0000
Date: Sun, 24 Sep 2023 04:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 24047/29449]
 drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such
 file or directory
Message-ID: <202309240451.C65rrek3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   833db5ec53f6ad1606b5363338fb455e6bd7bd01
commit: d9a579535cd0f4623e627c3375781fb29c78692b [24047/29449] BACKPORT: arm/arm64: Probe for the presence of KVM hypervisor
config: arm-randconfig-001-20230924 (https://download.01.org/0day-ci/archive/20230924/202309240451.C65rrek3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240451.C65rrek3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240451.C65rrek3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such file or directory
      11 | #include <asm/archrandom.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 drivers/firmware/smccc/smccc.c

     7	
     8	#include <linux/init.h>
     9	#include <linux/arm-smccc.h>
    10	#include <linux/kernel.h>
  > 11	#include <asm/archrandom.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
