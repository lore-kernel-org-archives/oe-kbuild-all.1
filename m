Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE15EA3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 07:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681544305; x=1713080305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rvob2EHC23zgd1zHsHIfgP/75ppHV7V+iCWRFWmxcek=;
  b=QvcZqmYJ53htQuo4o0RNTWHAgVkx5afCh8ZzDekrL+jAxv+diXkAxcb+
   R8dZlev10KTld9UqMzsjdq1dQLImvPZCGGtLjLdn+HDsbURIs7ZKvg7Ah
   pKuWDDYAi/fEpBbkvgu31kFOoxoqISR8PrbxCcsRz9ShR3fOmzKeYT9/g
   e3QTonBIhf55R/CB3TyOhJHAYnaX2ix9Jp9lEcF0lg3iSnXgPM4X8CgEz
   c+gyspDddEjJ/oxI4Zi9JtDvOK2i6Ag294S5uNubuLEoIbjHJHsO51mtu
   myakc/24SQP2c1m39rxIVNtZGDrH3J+Ai3P4XBbOHD2OaHOMEEtaunP1o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324973397"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="324973397"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 00:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="1019866316"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="1019866316"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Apr 2023 00:38:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnaUG-000ah1-2T;
	Sat, 15 Apr 2023 07:38:20 +0000
Date: Sat, 15 Apr 2023 15:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 7608/9838]
 drivers/staging/fsl_qbman/qman_config.c:283: warning: expecting prototype
 for qm_err_isr_<reg>_<verb>(). Prototype was for qm_err_isr_status_read()
 instead
Message-ID: <202304151538.NG2s0sMf-lkp@intel.com>
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
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230415/202304151538.NG2s0sMf-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/cbe7fceb95a9bfb0770b58ff5f7c101abdf3106c
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout cbe7fceb95a9bfb0770b58ff5f7c101abdf3106c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/staging/fsl_qbman/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151538.NG2s0sMf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/fsl_qbman/qman_config.c:283: warning: Function parameter or member 'qm' not described in 'qm_err_isr_status_read'
>> drivers/staging/fsl_qbman/qman_config.c:283: warning: expecting prototype for qm_err_isr_<reg>_<verb>(). Prototype was for qm_err_isr_status_read() instead


vim +283 drivers/staging/fsl_qbman/qman_config.c

4c43588a2cdb7e Madalin Bucur 2020-02-27  272  
4c43588a2cdb7e Madalin Bucur 2020-02-27  273  /**
4c43588a2cdb7e Madalin Bucur 2020-02-27  274   * qm_err_isr_<reg>_<verb> - Manipulate global interrupt registers
4c43588a2cdb7e Madalin Bucur 2020-02-27  275   * @v: for accessors that write values, this is the 32-bit value
4c43588a2cdb7e Madalin Bucur 2020-02-27  276   *
4c43588a2cdb7e Madalin Bucur 2020-02-27  277   * Manipulates QMAN_ERR_ISR, QMAN_ERR_IER, QMAN_ERR_ISDR, QMAN_ERR_IIR. All
4c43588a2cdb7e Madalin Bucur 2020-02-27  278   * manipulations except qm_err_isr_[un]inhibit() use 32-bit masks composed of
4c43588a2cdb7e Madalin Bucur 2020-02-27  279   * the QM_EIRQ_*** definitions. Note that "qm_err_isr_enable_write" means
4c43588a2cdb7e Madalin Bucur 2020-02-27  280   * "write the enable register" rather than "enable the write register"!
4c43588a2cdb7e Madalin Bucur 2020-02-27  281   */
4c43588a2cdb7e Madalin Bucur 2020-02-27  282  #define qm_err_isr_status_read(qm)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27 @283  		__qm_err_isr_read(qm, qm_isr_status)
4c43588a2cdb7e Madalin Bucur 2020-02-27  284  #define qm_err_isr_status_clear(qm, m)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27  285  		__qm_err_isr_write(qm, qm_isr_status, m)
4c43588a2cdb7e Madalin Bucur 2020-02-27  286  #define qm_err_isr_enable_read(qm)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27  287  		__qm_err_isr_read(qm, qm_isr_enable)
4c43588a2cdb7e Madalin Bucur 2020-02-27  288  #define qm_err_isr_enable_write(qm, v)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27  289  		__qm_err_isr_write(qm, qm_isr_enable, v)
4c43588a2cdb7e Madalin Bucur 2020-02-27  290  #define qm_err_isr_disable_read(qm)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27  291  		__qm_err_isr_read(qm, qm_isr_disable)
4c43588a2cdb7e Madalin Bucur 2020-02-27  292  #define qm_err_isr_disable_write(qm, v)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27  293  		__qm_err_isr_write(qm, qm_isr_disable, v)
4c43588a2cdb7e Madalin Bucur 2020-02-27  294  #define qm_err_isr_inhibit(qm)		\
4c43588a2cdb7e Madalin Bucur 2020-02-27  295  		__qm_err_isr_write(qm, qm_isr_inhibit, 1)
4c43588a2cdb7e Madalin Bucur 2020-02-27  296  #define qm_err_isr_uninhibit(qm)	\
4c43588a2cdb7e Madalin Bucur 2020-02-27  297  		__qm_err_isr_write(qm, qm_isr_inhibit, 0)
4c43588a2cdb7e Madalin Bucur 2020-02-27  298  

:::::: The code at line 283 was first introduced by commit
:::::: 4c43588a2cdb7e8b01447a8a1d523cc6886e0e4c staging/fsl_qbman: add LSDK-19.09-V4.14 SDK DPAA QBMan files

:::::: TO: Madalin Bucur <madalin.bucur@oss.nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
