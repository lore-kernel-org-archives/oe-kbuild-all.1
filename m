Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340AF3D72
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 00:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIZwq/Id"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701389704; x=1732925704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F45eBiwVykne8RrSCsrvX+aJ+5zGswwLedZbIjpG3S0=;
  b=JIZwq/IdCVlPQf+ON9QRMVQCugz0uIN3i/YOhhhAuh8qIRilOdD4Nn7E
   J0G0t1wxPyk5ar0xZhE1/BZkydxgCvJx15QbfgQyGb9sp0+VGRVj2BvhO
   p3Js2MP0FiSRWn/fwtEDIc188zGjAHn/1zgb9S+SkJr0r4LUlfgtDcIFU
   XYfxGouiyIoqy34FWENVk3078Jb+SXSBV8AtiEV0988sqHMf4dLqZwWxF
   5feG3hoZw1TAhfgUyREnDri6dBoMlV34NB/3u5jxYXioH6+oYJQV/8Fj+
   gdYDKHxBYhqGEAhZALVuTc0jfFFXW2blB2eMtl25CadsSrQXDD2+tZGOj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="390576505"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="390576505"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 16:15:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="803862186"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="803862186"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Nov 2023 16:15:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8rBL-0002qG-09;
	Fri, 01 Dec 2023 00:14:59 +0000
Date: Fri, 1 Dec 2023 08:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: ppc476.c:undefined reference to `i2c_register_driver'
Message-ID: <202312010820.cmdwF5X9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 799c43415442414b1032580c47684cb709dfed6d kbuild: thin archives make default for all archs
date:   6 years ago
config: powerpc-randconfig-r026-20220819 (https://download.01.org/0day-ci/archive/20231201/202312010820.cmdwF5X9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312010820.cmdwF5X9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312010820.cmdwF5X9-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: warning: drivers/of/unittest-data/overlay_base.dtb.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: drivers/of/unittest-data/overlay_base.dtb.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: arch/powerpc/platforms/44x/ppc476.o: in function `avr_halt_system':
   ppc476.c:(.text+0x50): undefined reference to `i2c_smbus_write_byte_data'
   powerpc-linux-ld: arch/powerpc/platforms/44x/ppc476.o: in function `__machine_initcall_ppc47x_ppc47x_device_probe':
>> ppc476.c:(.init.text+0x88): undefined reference to `i2c_register_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
