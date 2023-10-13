Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898BB28697
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 23:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGxCD0sm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697238924; x=1728774924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=69A9STjnlVxwrX5obbrEykRYAyr1Jp0gIeS+4E3tZVM=;
  b=WGxCD0sm4DJsTcQ3KO4ldP5PTkVoh+ioSk2yj8D1goe04cwBCI0t0gL6
   xBTj0Kpf6rry7+c2QHyi0KsSbKVUChyjEpq263pKqm2dSp7PyqTYxumsn
   jYVsd//GOeBrXzIUpUPvD9gD/ySSt5yUrxsFOqY7Abbw+7dvyKnDVqem8
   paeS52D7D8R3Hcwbaa09VI+rJTk8omyIXf2gHpwHgcW3Gh3S0nkd8nr8q
   E2/2PJOk++57IYqNT5RXS+sLoJnCn1wYl8rzmLmeF2rS1aN90rPkRvdPX
   BPqVbrUQw0gzLCTsda3FJCzotKohhbAxT1b6QnHE3mxXinRY38gDLvYhQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370352507"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="370352507"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 16:13:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="748527543"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="748527543"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Oct 2023 16:13:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrRLF-0005VD-1M;
	Fri, 13 Oct 2023 23:13:13 +0000
Date: Sat, 14 Oct 2023 07:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 7608/15768]
 drivers/staging/fsl_qbman/bman_config.c:155: warning: Function parameter or
 member 'bm' not described in 'bm_err_isr_status_read'
Message-ID: <202310140723.n0V1cqll-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: cbe7fceb95a9bfb0770b58ff5f7c101abdf3106c [7608/15768] fsl_qbman: fix various errors when building with W=1
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20231014/202310140723.n0V1cqll-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140723.n0V1cqll-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140723.n0V1cqll-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/fsl_qbman/bman_config.c:155: warning: Function parameter or member 'bm' not described in 'bm_err_isr_status_read'
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
