Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF308483
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676145744; x=1707681744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N1MJBEPBIsq7t+/ITA/cqlpc97UCTGtvFAM4pxPM0BA=;
  b=XrYttIs6hjo9gmsQdirA1HYW1+CLSmQCECS7rRBKnqfDr7VVZqM3FYza
   YI+EiS7+uKN2KkUMt/dVkqzFUDn9mWI2I+UnH5FgsCL5upUbzWmX1YZZH
   UsnH8L7U2L5UKUecUnuLhm4uszMW1cfBhH5svCjJyXlawyKX/bW/WyWHN
   wNBszXWxEaC+WSqpNBVKgBw7YXFmI9hxyg9DI6BifawVEsLwco0Gjd1iP
   7wpYvVInSb4+xmL/FENKYBGWHSSofEnBRJf/IXkTUTRxgAkj+p7qd2yby
   WpbgjJ4jwhr4il/s3Fg/cYy4d/SWk5UEPnFe5y+c+E4bumPiuCbT9GqTL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="310280086"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="310280086"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 12:02:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="811173617"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="811173617"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2023 12:02:23 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQw4k-0006li-2b;
	Sat, 11 Feb 2023 20:02:22 +0000
Date: Sun, 12 Feb 2023 04:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 2/3] nvmem: stm32: add OP-TEE support for STM32MP13x
Message-ID: <202302120351.KiGnjRPb-lkp@intel.com>
References: <20230118182856.v6.2.Ibc43aa73f865090affeb1751af0cc260c7f1dd07@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118182856.v6.2.Ibc43aa73f865090affeb1751af0cc260c7f1dd07@changeid>

Hi Patrick,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on atorgue-stm32/stm32-next]
[also build test ERROR on linus/master v6.2-rc7]
[cannot apply to next-20230210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Patrick-Delaunay/nvmem-stm32-add-OP-TEE-support-for-STM32MP13x/20230119-013050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20230118182856.v6.2.Ibc43aa73f865090affeb1751af0cc260c7f1dd07%40changeid
patch subject: [PATCH v6 2/3] nvmem: stm32: add OP-TEE support for STM32MP13x
config: arm64-buildonly-randconfig-r005-20230210 (https://download.01.org/0day-ci/archive/20230212/202302120351.KiGnjRPb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/00de14c665e21da015508971e3ec66740788c7a9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Patrick-Delaunay/nvmem-stm32-add-OP-TEE-support-for-STM32MP13x/20230119-013050
        git checkout 00de14c665e21da015508971e3ec66740788c7a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302120351.KiGnjRPb-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.o: in function `stm32_bsec_ta_open_session':
   drivers/nvmem/stm32-bsec-optee-ta.c:81: undefined reference to `tee_client_open_session'
   aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.o: in function `stm32_bsec_optee_ta_open':
   drivers/nvmem/stm32-bsec-optee-ta.c:108: undefined reference to `tee_client_open_context'
>> aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.c:121: undefined reference to `tee_client_close_context'
>> aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.c:97: undefined reference to `tee_client_close_session'
   aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.o: in function `stm32_bsec_optee_ta_close':
   drivers/nvmem/stm32-bsec-optee-ta.c:135: undefined reference to `tee_client_close_context'
   aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.o: in function `stm32_bsec_optee_ta_read':
   drivers/nvmem/stm32-bsec-optee-ta.c:168: undefined reference to `tee_shm_alloc_kernel_buf'
>> aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.c:178: undefined reference to `tee_client_invoke_func'
>> aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.c:186: undefined reference to `tee_shm_get_va'
>> aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.c:196: undefined reference to `tee_shm_free'
>> aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.c:97: undefined reference to `tee_client_close_session'
   aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.o: in function `stm32_bsec_optee_ta_write':
   drivers/nvmem/stm32-bsec-optee-ta.c:233: undefined reference to `tee_shm_alloc_kernel_buf'
   aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.c:243: undefined reference to `tee_shm_get_va'
   aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.c:247: undefined reference to `tee_shm_free'
   aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.c:254: undefined reference to `tee_client_invoke_func'
   aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.c:282: undefined reference to `tee_client_invoke_func'
   aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.c:292: undefined reference to `tee_shm_free'
>> aarch64-linux-ld: drivers/nvmem/stm32-bsec-optee-ta.c:97: undefined reference to `tee_client_close_session'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
