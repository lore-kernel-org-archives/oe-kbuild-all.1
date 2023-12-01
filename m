Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03264AF85
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KnbmRCd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701445640; x=1732981640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJv2ok5Y90tj2s8aajhqZcpk8sReuEbZkNry8SMHtBo=;
  b=KnbmRCd8OdpUA5DI4Ss3zhD/Rh2Q0jzCmMLSUf2jyr7/6gOnO9oncvqf
   JCyxSrskNBYBK+NRWrT4gSH6GDFLyr4TJ09el2vzVgV2RMhtRH2tY/wSV
   DgegDz5oMlv8IyDTXUKwx1FT5IDo4mFsrtItxfLuQLW7Nz2EeuJMc/Ibh
   JJYYkLJ1hlgvrg9ZD/vHyL1Wxk/flU5BP//8gK0Ar/AlZzBUTBo2xzF1Y
   hqipWIrqTV/F1bGbEMzU2Kq3aU1Cmhh/a6pH040I+I582gR9kNz8pnfPY
   TXkyD9y2/ycRXKlcd5M0+CajV8nM9KfP4wK5eDggKp1V97d1lqoeo1dgJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="527364"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="527364"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:46:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="804111657"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="804111657"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 01 Dec 2023 07:46:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r95ie-0003su-0Z;
	Fri, 01 Dec 2023 15:46:20 +0000
Date: Fri, 1 Dec 2023 23:46:04 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: ppc476.c:(.text.avr_halt_system+0x20): undefined reference to
 `i2c_smbus_write_byte_data'
Message-ID: <202312012338.BNlHA8Mr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: 4c1d9bb0b5d3c0b3468ac8e68a05972eb957630f powerpc: Allow LD_DEAD_CODE_DATA_ELIMINATION to be selected
date:   6 years ago
config: powerpc-randconfig-r026-20220819 (https://download.01.org/0day-ci/archive/20231201/202312012338.BNlHA8Mr-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312012338.BNlHA8Mr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312012338.BNlHA8Mr-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: warning: drivers/of/unittest-data/overlay_base.dtb.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: orphan section `.gnu.hash' from `arch/powerpc/kernel/head_44x.o' being placed in section `.gnu.hash'
   powerpc-linux-ld: warning: orphan section `.branch_lt' from `arch/powerpc/kernel/head_44x.o' being placed in section `.branch_lt'
   powerpc-linux-ld: warning: drivers/of/unittest-data/overlay_base.dtb.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: arch/powerpc/platforms/44x/ppc476.o: in function `__machine_initcall_ppc47x_ppc47x_device_probe':
   ppc476.c:(.init.text+0x88): undefined reference to `i2c_register_driver'
   powerpc-linux-ld: arch/powerpc/platforms/44x/ppc476.o: in function `avr_halt_system':
>> ppc476.c:(.text.avr_halt_system+0x20): undefined reference to `i2c_smbus_write_byte_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
