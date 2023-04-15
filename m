Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D1BA21
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 04:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681531816; x=1713067816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vgjfuBtLZcabY80oQ16tvaNRtgMuOAGlU/+2nIqaxOs=;
  b=O/+nLrBzvW+MJqKtPCsvgxyxBhBWe8KH05wZrvtCd2mwNjn2PZjl1lxm
   gHFOr554Ba1yd/YrCmIVe8i7Jgv7E2UyW1GyrXApYWzE20MCBZiWVxquS
   qQDm0QIOwvXc0mqld1FsN3okwJkiRxmwZuOShXfszqh8Ghw8lCZVoNaDM
   3YY+irM7y6XBHoulqBLoCa8eM2f5Y0HRWn/6wfMDm0z88475ydYcSTtNH
   r3+/2yO7JO+2hr8gugAkRXV4nivdk9fqsL/bEfXf73krv1tNMCKGSLnq8
   yX7nroqRhtco0P657huhCZhDQ5UCtVlKVazHCjaNULOiWoiN6FMzyiJW/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="328768832"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="328768832"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 21:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779414403"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="779414403"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2023 21:10:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnXEn-000aPZ-2N;
	Sat, 15 Apr 2023 04:10:09 +0000
Date: Sat, 15 Apr 2023 12:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 7608/9838]
 drivers/staging/fsl_qbman/bman_config.c:155: warning: expecting prototype
 for bm_err_isr_<reg>_<verb>(). Prototype was for bm_err_isr_status_read()
 instead
Message-ID: <202304151228.96z0R9SQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: cbe7fceb95a9bfb0770b58ff5f7c101abdf3106c [7608/9838] fsl_qbman: fix various errors when building with W=1
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230415/202304151228.96z0R9SQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/cbe7fceb95a9bfb0770b58ff5f7c101abdf3106c
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout cbe7fceb95a9bfb0770b58ff5f7c101abdf3106c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/staging/fsl_qbman/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151228.96z0R9SQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/fsl_qbman/bman_config.c:155: warning: Function parameter or member 'bm' not described in 'bm_err_isr_status_read'
>> drivers/staging/fsl_qbman/bman_config.c:155: warning: expecting prototype for bm_err_isr_<reg>_<verb>(). Prototype was for bm_err_isr_status_read() instead


vim +155 drivers/staging/fsl_qbman/bman_config.c

4c43588a2cdb7e Madalin Bucur 2020-02-27  144  
4c43588a2cdb7e Madalin Bucur 2020-02-27  145  /**
4c43588a2cdb7e Madalin Bucur 2020-02-27  146   * bm_err_isr_<reg>_<verb> - Manipulate global interrupt registers
4c43588a2cdb7e Madalin Bucur 2020-02-27  147   * @v: for accessors that write values, this is the 32-bit value
4c43588a2cdb7e Madalin Bucur 2020-02-27  148   *
4c43588a2cdb7e Madalin Bucur 2020-02-27  149   * Manipulates BMAN_ERR_ISR, BMAN_ERR_IER, BMAN_ERR_ISDR, BMAN_ERR_IIR. All
4c43588a2cdb7e Madalin Bucur 2020-02-27  150   * manipulations except bm_err_isr_[un]inhibit() use 32-bit masks composed of
4c43588a2cdb7e Madalin Bucur 2020-02-27  151   * the BM_EIRQ_*** definitions. Note that "bm_err_isr_enable_write" means
4c43588a2cdb7e Madalin Bucur 2020-02-27  152   * "write the enable register" rather than "enable the write register"!
4c43588a2cdb7e Madalin Bucur 2020-02-27  153   */
4c43588a2cdb7e Madalin Bucur 2020-02-27  154  #define bm_err_isr_status_read(bm)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27 @155  		__bm_err_isr_read(bm, bm_isr_status)
4c43588a2cdb7e Madalin Bucur 2020-02-27  156  #define bm_err_isr_status_clear(bm, m)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27  157  		__bm_err_isr_write(bm, bm_isr_status, m)
4c43588a2cdb7e Madalin Bucur 2020-02-27  158  #define bm_err_isr_enable_read(bm)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27  159  		__bm_err_isr_read(bm, bm_isr_enable)
4c43588a2cdb7e Madalin Bucur 2020-02-27  160  #define bm_err_isr_enable_write(bm, v)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27  161  		__bm_err_isr_write(bm, bm_isr_enable, v)
4c43588a2cdb7e Madalin Bucur 2020-02-27  162  #define bm_err_isr_disable_read(bm)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27  163  		__bm_err_isr_read(bm, bm_isr_disable)
4c43588a2cdb7e Madalin Bucur 2020-02-27  164  #define bm_err_isr_disable_write(bm, v)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27  165  		__bm_err_isr_write(bm, bm_isr_disable, v)
4c43588a2cdb7e Madalin Bucur 2020-02-27  166  #define bm_err_isr_inhibit(bm)		\
4c43588a2cdb7e Madalin Bucur 2020-02-27  167  		__bm_err_isr_write(bm, bm_isr_inhibit, 1)
4c43588a2cdb7e Madalin Bucur 2020-02-27  168  #define bm_err_isr_uninhibit(bm)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27  169  		__bm_err_isr_write(bm, bm_isr_inhibit, 0)
4c43588a2cdb7e Madalin Bucur 2020-02-27  170  

:::::: The code at line 155 was first introduced by commit
:::::: 4c43588a2cdb7e8b01447a8a1d523cc6886e0e4c staging/fsl_qbman: add LSDK-19.09-V4.14 SDK DPAA QBMan files

:::::: TO: Madalin Bucur <madalin.bucur@oss.nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
