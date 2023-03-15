Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1EA3C02
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 11:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678879989; x=1710415989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cJhUqjEWmkNGGKMVQovPMs7PcwrOqfCWPMMO6zJlYuA=;
  b=khKnmplGAdEmT/wu5ulr/fUTDW552U1IUXI9I2wzkx+leakZUaccWhuf
   zf2M0fCSfuqEH/rILg3aNjuUa2OT5V/LT4uW8ahj2jpCkxw4mmpQG5HGi
   yO+GjC7hF1m375tlLApE5efVAOTd3dKhHau5XxkKNMzyyqzwAKMoKutv0
   TFwKLCgP7hDLgxaFMRdNiNfcdsGVaEcpu3OA3ACGyyRAM395JNZcxa28g
   JXsv1VKUfrCTFOov9kC5xBjRpioC4LklKu4dJQlBxjsxERZo01xtLdJ9r
   AtcNtDYFpN2/e/sHo45IXAd1ExIbr6pPJuV2xo5hsyx7pjffwMiqeVmD+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="336365052"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="336365052"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 04:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="672704575"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="672704575"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Mar 2023 04:32:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcPN6-0007dd-18;
	Wed, 15 Mar 2023 11:32:44 +0000
Date: Wed, 15 Mar 2023 19:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linux-stable-rc:queue/5.4 63/70] include/soc/fsl/qe/qe_ic.h:82:28:
 error: 'NO_IRQ' undeclared; did you mean 'do_IRQ'?
Message-ID: <202303151945.bVB4rE2Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   8e41af25e14abe2785f28321b91cb8d535c25943
commit: b549c1718e706c55a9c808be0ebc93845d7e4c18 [63/70] powerpc: Check !irq instead of irq == NO_IRQ and remove NO_IRQ
config: powerpc-buildonly-randconfig-r004-20230313 (https://download.01.org/0day-ci/archive/20230315/202303151945.bVB4rE2Z-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=b549c1718e706c55a9c808be0ebc93845d7e4c18
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout b549c1718e706c55a9c808be0ebc93845d7e4c18
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/platforms/83xx/ drivers/soc/fsl/qe/ drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151945.bVB4rE2Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/platforms/83xx/misc.c:17:
   include/soc/fsl/qe/qe_ic.h: In function 'qe_ic_cascade_low_ipic':
>> include/soc/fsl/qe/qe_ic.h:82:28: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
      82 |         if (cascade_irq != NO_IRQ)
         |                            ^~~~~~
         |                            do_IRQ
   include/soc/fsl/qe/qe_ic.h:82:28: note: each undeclared identifier is reported only once for each function it appears in
   include/soc/fsl/qe/qe_ic.h: In function 'qe_ic_cascade_high_ipic':
   include/soc/fsl/qe/qe_ic.h:91:28: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
      91 |         if (cascade_irq != NO_IRQ)
         |                            ^~~~~~
         |                            do_IRQ
   include/soc/fsl/qe/qe_ic.h: In function 'qe_ic_cascade_low_mpic':
   include/soc/fsl/qe/qe_ic.h:101:28: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     101 |         if (cascade_irq != NO_IRQ)
         |                            ^~~~~~
         |                            do_IRQ
   include/soc/fsl/qe/qe_ic.h: In function 'qe_ic_cascade_high_mpic':
   include/soc/fsl/qe/qe_ic.h:113:28: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     113 |         if (cascade_irq != NO_IRQ)
         |                            ^~~~~~
         |                            do_IRQ
   include/soc/fsl/qe/qe_ic.h: In function 'qe_ic_cascade_muxed_mpic':
   include/soc/fsl/qe/qe_ic.h:126:28: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     126 |         if (cascade_irq == NO_IRQ)
         |                            ^~~~~~
         |                            do_IRQ
--
   drivers/spi/spi-mpc52xx.c: In function 'mpc52xx_spi_fsmstate_idle':
>> drivers/spi/spi-mpc52xx.c:149:31: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     149 |         if (status && (irq != NO_IRQ))
         |                               ^~~~~~
         |                               do_IRQ
   drivers/spi/spi-mpc52xx.c:149:31: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from drivers/soc/fsl/qe/qe_ic.c:27:
   include/soc/fsl/qe/qe_ic.h: In function 'qe_ic_cascade_low_ipic':
>> include/soc/fsl/qe/qe_ic.h:82:28: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
      82 |         if (cascade_irq != NO_IRQ)
         |                            ^~~~~~
         |                            do_IRQ
   include/soc/fsl/qe/qe_ic.h:82:28: note: each undeclared identifier is reported only once for each function it appears in
   include/soc/fsl/qe/qe_ic.h: In function 'qe_ic_cascade_high_ipic':
   include/soc/fsl/qe/qe_ic.h:91:28: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
      91 |         if (cascade_irq != NO_IRQ)
         |                            ^~~~~~
         |                            do_IRQ
   include/soc/fsl/qe/qe_ic.h: In function 'qe_ic_cascade_low_mpic':
   include/soc/fsl/qe/qe_ic.h:101:28: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     101 |         if (cascade_irq != NO_IRQ)
         |                            ^~~~~~
         |                            do_IRQ
   include/soc/fsl/qe/qe_ic.h: In function 'qe_ic_cascade_high_mpic':
   include/soc/fsl/qe/qe_ic.h:113:28: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     113 |         if (cascade_irq != NO_IRQ)
         |                            ^~~~~~
         |                            do_IRQ
   include/soc/fsl/qe/qe_ic.h: In function 'qe_ic_cascade_muxed_mpic':
   include/soc/fsl/qe/qe_ic.h:126:28: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     126 |         if (cascade_irq == NO_IRQ)
         |                            ^~~~~~
         |                            do_IRQ
   drivers/soc/fsl/qe/qe_ic.c: In function 'qe_ic_get_low_irq':
>> drivers/soc/fsl/qe/qe_ic.c:295:24: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     295 |                 return NO_IRQ;
         |                        ^~~~~~
         |                        do_IRQ
   drivers/soc/fsl/qe/qe_ic.c: In function 'qe_ic_get_high_irq':
   drivers/soc/fsl/qe/qe_ic.c:311:24: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     311 |                 return NO_IRQ;
         |                        ^~~~~~
         |                        do_IRQ
   drivers/soc/fsl/qe/qe_ic.c: In function 'qe_ic_init':
   drivers/soc/fsl/qe/qe_ic.c:346:32: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     346 |         if (qe_ic->virq_low == NO_IRQ) {
         |                                ^~~~~~
         |                                do_IRQ
   drivers/soc/fsl/qe/qe_ic.c:322:28: warning: variable 'high_active' set but not used [-Wunused-but-set-variable]
     322 |         u32 temp = 0, ret, high_active = 0;
         |                            ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
   Depends on [n]: SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
   Selected by [m]:
   - SND_MPC52xx_SOC_PCM030 [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC5200_SIMPLE [=y]
   - SND_MPC52xx_SOC_EFIKA [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_EFIKA [=y]


vim +82 include/soc/fsl/qe/qe_ic.h

9865853851313e include/asm-powerpc/qe_ic.h      Li Yang         2006-10-03  76  
bd0b9ac405e179 arch/powerpc/include/asm/qe_ic.h Thomas Gleixner 2015-09-14  77  static inline void qe_ic_cascade_low_ipic(struct irq_desc *desc)
cccd21027c17c2 include/asm-powerpc/qe_ic.h      Anton Vorontsov 2007-10-05  78  {
eead4d5c63ff92 arch/powerpc/include/asm/qe_ic.h Richard Cochran 2011-03-30  79  	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
cccd21027c17c2 include/asm-powerpc/qe_ic.h      Anton Vorontsov 2007-10-05  80  	unsigned int cascade_irq = qe_ic_get_low_irq(qe_ic);
cccd21027c17c2 include/asm-powerpc/qe_ic.h      Anton Vorontsov 2007-10-05  81  
cccd21027c17c2 include/asm-powerpc/qe_ic.h      Anton Vorontsov 2007-10-05 @82  	if (cascade_irq != NO_IRQ)
cccd21027c17c2 include/asm-powerpc/qe_ic.h      Anton Vorontsov 2007-10-05  83  		generic_handle_irq(cascade_irq);
cccd21027c17c2 include/asm-powerpc/qe_ic.h      Anton Vorontsov 2007-10-05  84  }
cccd21027c17c2 include/asm-powerpc/qe_ic.h      Anton Vorontsov 2007-10-05  85  

:::::: The code at line 82 was first introduced by commit
:::::: cccd21027c17c27ad275093c22475354b4495814 [POWERPC] QEIC: Implement pluggable handlers, fix MPIC cascading

:::::: TO: Anton Vorontsov <avorontsov@ru.mvista.com>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
