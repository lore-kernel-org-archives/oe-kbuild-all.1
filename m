Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A005818C0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 23:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695945061; x=1727481061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XYDugT0VeocD4HFPwUA7we9H8vQyisM/+OF+o9u/v6o=;
  b=eAXTnE7G5MtCL7Gb3oekb+63ZqRvLwRanVFkhuK6IBvSfqcUGz3pK+3c
   4XTMySXig7HnWH5neeq+28LGXHZkRmaj3KsDaltM0Db6SxMV1VVUIG9Fr
   P8G5zHh65W5MK73nnEo5f5X+PCaJ2zqLEju2CCWTrybiyNM4r8MGDfv9q
   bshiQ4tpBnL+sZ+A4o/eyOOhozAp5HYZkkjbrKOKZEA++2VVeIdq+bxnS
   z3BdSXX0JU+fZBw+YbaiTe+5IO10uCgqBnzT3RE3Qj4DXTuIxY+sTXZAc
   rYsX5VK/rXUYMvxHWZEyIMPDzOs8vM6C2OtjOgXYswuHyrhEN44x6etnq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468482394"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="468482394"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 16:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="840099287"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="840099287"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2023 16:50:59 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm0mX-0002AN-0F;
	Thu, 28 Sep 2023 23:50:57 +0000
Date: Fri, 29 Sep 2023 07:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-dmaengine:next 83/89] file.c:undefined reference to
 `ioread64be'
Message-ID: <202309290701.SlXGDSsX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   10c060edf581fdd0d8f23cab84e6c8546c2df8fc
commit: 09289d0ad1226c4735f8d9f68c9c3e54cbaba3d4 [83/89] debugfs_create_regset32() support 8/16/64 bit width registers
config: powerpc64-randconfig-001-20230929 (https://download.01.org/0day-ci/archive/20230929/202309290701.SlXGDSsX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290701.SlXGDSsX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290701.SlXGDSsX-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `ioread64be'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: fs/debugfs/file.o: in function `debugfs_print_regs':
>> file.c:(.text+0x1558): undefined reference to `ioread64be'
>> powerpc64-linux-ld: file.c:(.text+0x1570): undefined reference to `ioread64'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
