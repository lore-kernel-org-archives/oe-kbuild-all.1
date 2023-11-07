Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2132B2D039
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5CP5dQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699355462; x=1730891462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MW39yUjBNGhNoctv5S2R/SE473KXE+aT3edI8v27y9I=;
  b=j5CP5dQmitfafZoKczRnmmstJ0SciqVt1xjDaWsZIAMvoLadt9+GF/7L
   6f9AV4gqoIXiJePHfffMsQrCL/5sjvs4RMgdSPPqHXWHXxi2JlpWXPrFp
   ZqslL62s2WPYx0wsJv3zxzhA736Qs9NyJxLlBX93LJ5ZYWBIJLN9TUaBW
   wqjAyt8lG1JpnodIXxC7TVBT1+a+VPnZoc4MjfejJzMXLEkssiPZUfC4S
   UlkbZm78+Zo5kt8pkNe8nIoUv8TqeQFnuccZER7w60zElYpHtPJYuMmcm
   3eQsMUxIetYLjvK4I2MxzrNHAVRZxBEhwfcH4JST3vB8UHE+3VHzRxrCz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="374513932"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="374513932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 03:11:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="10378378"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Nov 2023 03:11:01 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Jz0-000748-0D;
	Tue, 07 Nov 2023 11:10:58 +0000
Date: Tue, 7 Nov 2023 19:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Masahisa Kojima <masahisa.kojima@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 3/5] efi: Add tee-based EFI variable driver
Message-ID: <202311071839.N3jmcrIB-lkp@intel.com>
References: <20231107054057.1893-4-masahisa.kojima@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107054057.1893-4-masahisa.kojima@linaro.org>

Hi Masahisa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5329aa5101f73c451bcd48deaf3f296685849d9c]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahisa-Kojima/efi-expose-efivar-generic-ops-register-function/20231107-134624
base:   5329aa5101f73c451bcd48deaf3f296685849d9c
patch link:    https://lore.kernel.org/r/20231107054057.1893-4-masahisa.kojima%40linaro.org
patch subject: [PATCH v10 3/5] efi: Add tee-based EFI variable driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231107/202311071839.N3jmcrIB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311071839.N3jmcrIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311071839.N3jmcrIB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/stmm/tee_stmm_efi.c:524:6: warning: no previous prototype for 'tee_stmm_restore_efivars_generic_ops' [-Wmissing-prototypes]
     524 | void tee_stmm_restore_efivars_generic_ops(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/tee_stmm_restore_efivars_generic_ops +524 drivers/firmware/efi/stmm/tee_stmm_efi.c

   523	
 > 524	void tee_stmm_restore_efivars_generic_ops(void)
   525	{
   526		efivars_unregister(&tee_efivars);
   527		efivars_generic_ops_register();
   528	}
   529	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
