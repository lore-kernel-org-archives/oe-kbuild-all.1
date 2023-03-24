Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AA67E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679645588; x=1711181588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DZzmfjIINI3Ggf38WfahljjYjP7Tr3A2QcqGJu2CVgE=;
  b=jFjgS06bhr9tdTmt8O+WCSx0MCNm6fSQDXVyulqDyX4FPDkpAI2x4tpD
   NpwlprLQ5+D6qJOtcGOneHwLcXg6a62aDwBFh3FeOxqG5wXAX/NxZZtcW
   3eWvQ09nIuVByPGkUJUO9pO69iG2jE7t5DjYeTXr78+b+FNP8Ho9vKItR
   Gw0pLe40TAUtu57sboQZqaUwmpL6R31scOi64FC6+WoE7tPXBRLIAndIP
   tsmAxRCB4yt4eJq0jEWqxQACVkLd/+9S9c0/y60p3ktP51EhNZIuWu5Jx
   zsD29XaMNEhEJpLYlEtXC4gK3oU9z6Gn6Cw88WrxcCdxWhJ9hgh4dY+4F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367460243"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="367460243"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 01:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659975191"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="659975191"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Mar 2023 01:13:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfcXo-000F6O-2v;
	Fri, 24 Mar 2023 08:13:04 +0000
Date: Fri, 24 Mar 2023 16:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [niks:has_ioport_v4 4/39] drivers/char/tpm/tpm_infineon.c:57:31:
 error: 'TPM_INF_IO_PORT' undeclared; did you mean 'TPM_INF_IO_MEM'?
Message-ID: <202303241635.E6U9Zxu5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   53b49a3f5a95d058e0deb169b87e695d69033f5c
commit: 07c67f2075061c0893444807c2afa4de6e7d08f5 [4/39] char: impi, tpm: depend on HAS_IOPORT
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230324/202303241635.E6U9Zxu5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=07c67f2075061c0893444807c2afa4de6e7d08f5
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 07c67f2075061c0893444807c2afa4de6e7d08f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241635.E6U9Zxu5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/tpm/tpm_infineon.c: In function 'tpm_data_out':
>> drivers/char/tpm/tpm_infineon.c:57:31: error: 'TPM_INF_IO_PORT' undeclared (first use in this function); did you mean 'TPM_INF_IO_MEM'?
      57 |         if (tpm_dev.iotype == TPM_INF_IO_PORT)
         |                               ^~~~~~~~~~~~~~~
         |                               TPM_INF_IO_MEM
   drivers/char/tpm/tpm_infineon.c:57:31: note: each undeclared identifier is reported only once for each function it appears in
   drivers/char/tpm/tpm_infineon.c: In function 'tpm_data_in':
   drivers/char/tpm/tpm_infineon.c:67:31: error: 'TPM_INF_IO_PORT' undeclared (first use in this function); did you mean 'TPM_INF_IO_MEM'?
      67 |         if (tpm_dev.iotype == TPM_INF_IO_PORT)
         |                               ^~~~~~~~~~~~~~~
         |                               TPM_INF_IO_MEM
   drivers/char/tpm/tpm_infineon.c: In function 'tpm_config_out':
   drivers/char/tpm/tpm_infineon.c:76:31: error: 'TPM_INF_IO_PORT' undeclared (first use in this function); did you mean 'TPM_INF_IO_MEM'?
      76 |         if (tpm_dev.iotype == TPM_INF_IO_PORT)
         |                               ^~~~~~~~~~~~~~~
         |                               TPM_INF_IO_MEM
   drivers/char/tpm/tpm_infineon.c: In function 'tpm_config_in':
   drivers/char/tpm/tpm_infineon.c:86:31: error: 'TPM_INF_IO_PORT' undeclared (first use in this function); did you mean 'TPM_INF_IO_MEM'?
      86 |         if (tpm_dev.iotype == TPM_INF_IO_PORT)
         |                               ^~~~~~~~~~~~~~~
         |                               TPM_INF_IO_MEM
   drivers/char/tpm/tpm_infineon.c: In function 'tpm_inf_pnp_probe':
   drivers/char/tpm/tpm_infineon.c:411:34: error: 'TPM_INF_IO_PORT' undeclared (first use in this function); did you mean 'TPM_INF_IO_MEM'?
     411 |                 tpm_dev.iotype = TPM_INF_IO_PORT;
         |                                  ^~~~~~~~~~~~~~~
         |                                  TPM_INF_IO_MEM
   drivers/char/tpm/tpm_infineon.c: In function 'tpm_inf_pnp_remove':
   drivers/char/tpm/tpm_infineon.c:588:31: error: 'TPM_INF_IO_PORT' undeclared (first use in this function); did you mean 'TPM_INF_IO_MEM'?
     588 |         if (tpm_dev.iotype == TPM_INF_IO_PORT) {
         |                               ^~~~~~~~~~~~~~~
         |                               TPM_INF_IO_MEM


vim +57 drivers/char/tpm/tpm_infineon.c

d954e8edee5de9 Alex Williamson 2007-05-08  53  
d954e8edee5de9 Alex Williamson 2007-05-08  54  static inline void tpm_data_out(unsigned char data, unsigned char offset)
d954e8edee5de9 Alex Williamson 2007-05-08  55  {
07c67f2075061c Niklas Schnelle 2021-12-20  56  #ifdef CONFIG_HAS_IOPORT
d954e8edee5de9 Alex Williamson 2007-05-08 @57  	if (tpm_dev.iotype == TPM_INF_IO_PORT)
d954e8edee5de9 Alex Williamson 2007-05-08  58  		outb(data, tpm_dev.data_regs + offset);
d954e8edee5de9 Alex Williamson 2007-05-08  59  	else
07c67f2075061c Niklas Schnelle 2021-12-20  60  #endif
d954e8edee5de9 Alex Williamson 2007-05-08  61  		writeb(data, tpm_dev.mem_base + tpm_dev.data_regs + offset);
d954e8edee5de9 Alex Williamson 2007-05-08  62  }
d954e8edee5de9 Alex Williamson 2007-05-08  63  

:::::: The code at line 57 was first introduced by commit
:::::: d954e8edee5de90f8625c041ce177e04ae2c88fe tpm_infineon: add support for devices in mmio space

:::::: TO: Alex Williamson <alex.williamson@hp.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
