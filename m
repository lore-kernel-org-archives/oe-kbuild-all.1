Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B101951A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 12:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687438075; x=1718974075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KzvkdeReDQb2oGbt7GQCmBkSEB/v8FcPxILEzoZlC6U=;
  b=OXtxfoxh7jA4Mx+l6qNYUiMI0K5dykiREir6+DXpOJiYvalo9R4RDiyZ
   jHpyC7fOB0mhhybQChUMKNN/FGg5aiRgMPyhxu10CNAz5wv5mWYYedbQM
   0Ix2fZU3ERKxQN3RS/Js7nEfiDwPLhs3d4vc72CPi2qFIqcKOALOb+Uba
   jI25y2lge3yb7SMBsBlIdttynNbSi1QfOQnAZCDGIF/L3O+FQkz4Fb8Ax
   a0UNVKwMNcWkGbgkeSsidcyzLPQWSIPnVrBTeuF1iKy6jiXOx6nVtYyji
   r4bQ5xoL92YX6LLvLLvAQ7tbuuLInXV/ssUNiJuMBQIfoOn/Adx8P07lc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340813392"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="340813392"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 05:46:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="961569663"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="961569663"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2023 05:46:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCJht-0007YD-2t;
	Thu, 22 Jun 2023 12:46:37 +0000
Date: Thu, 22 Jun 2023 20:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/634 7624/9880]
 drivers/staging/fsl_qbman/bman_config.c:155: warning: expecting prototype
 for bm_err_isr_<reg>_<verb>(). Prototype was for bm_err_isr_status_read()
 instead
Message-ID: <202306222054.3lqsCyXH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Camelia,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc pr/634
head:   386bab91e0ee054cb0fd7007a05f8ea3ed8c2c7d
commit: cbe7fceb95a9bfb0770b58ff5f7c101abdf3106c [7624/9880] fsl_qbman: fix various errors when building with W=1
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230622/202306222054.3lqsCyXH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306222054.3lqsCyXH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306222054.3lqsCyXH-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
