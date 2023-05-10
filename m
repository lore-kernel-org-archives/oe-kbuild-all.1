Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4306AA8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683734259; x=1715270259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T5mu0XAshVvmiiaZj8DOnjWztJNZAYfGbv/JApj3vZc=;
  b=E3ZubITSZZ4QWS4kxsSzc0zzpCTbBLqi/bTqJIsAvwYgsWESrgg7MhyV
   WkfxuDGVO3AJGnaG0raefHAm9PRFGsVYsdWvlQhybpjZE5+32vhF333Hd
   27MxKa/pYVIOaJe2sSFcP5vrMWW7zzg6aZaY3n/f99NpowrcrGgyYXDi7
   lpNO+5Lqh1ibJqPRDjc3CIFkEvit3DSTHavwyNcpvl5eiy5QfbsHns1HZ
   3ChSqCqQlug/EbgC+r7cBWvVYCYGk6YCTXyJmf2LXBrsK4JK/FBEapDfq
   ezsrVfUo6xENvmQ5Rp7dMlVc3FjhrwGQQGURau5bWXCJi6Mg0e21WgSMt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="334716516"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="334716516"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 08:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="732192054"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="732192054"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 May 2023 08:57:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwmC9-0003PA-2d;
	Wed, 10 May 2023 15:57:37 +0000
Date: Wed, 10 May 2023 23:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:gpio-irq 3/8] drivers/irqchip/irq-mpfs-mux.c:59:9: sparse:
 sparse: cast truncates bits from constant value (3fffffc000 becomes
 ffffc000)
Message-ID: <202305102350.kaG3ks22-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq
head:   6ef4b8fad90b5bae682bd4b88b807f2a38822fe8
commit: f39a859cf7fec51e695de4544786f2b0fb566e75 [3/8] irqchip: add mpfs gpio interrupt mux
config: csky-randconfig-s041-20230510 (https://download.01.org/0day-ci/archive/20230510/202305102350.kaG3ks22-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?id=f39a859cf7fec51e695de4544786f2b0fb566e75
        git remote add conor https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
        git fetch --no-tags conor gpio-irq
        git checkout f39a859cf7fec51e695de4544786f2b0fb566e75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305102350.kaG3ks22-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-mpfs-mux.c:59:9: sparse: sparse: cast truncates bits from constant value (3fffffc000 becomes ffffc000)
   drivers/irqchip/irq-mpfs-mux.c: note: in included file (through arch/csky/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32

vim +59 drivers/irqchip/irq-mpfs-mux.c

    25	
    26	/*
    27	 * There are 3 GPIO controllers on this SoC, of which:
    28	 * - GPIO controller 0 has 14 GPIOs
    29	 * - GPIO controller 1 has 24 GPIOs
    30	 * - GPIO controller 2 has 32 GPIOs
    31	 *
    32	 * All GPIOs are capable of generating interrupts, for a total of 70.
    33	 * There are only 41 IRQs available however, so a configurable mux is used to
    34	 * ensure all GPIOs can be used for interrupt generation.
    35	 * 38 of the 41 interrupts are in what the documentation calls "direct mode",
    36	 * as they provide an exclusive connection from a GPIO to the PLIC.
    37	 * The 3 remaining interrupts are used to mux the interrupts which do not have
    38	 * a exclusive connection, one for each GPIO controller.
    39	 * A register is used to set this configuration of this mux, depending on how
    40	 * the "MSS Configurator" (FPGA configuration tool) has set things up.
    41	 * This is done by the platform's firmware, so access from Linux is read-only.
    42	 *
    43	 * Documentation also refers to GPIO controller 0 & 1 as "pad" GPIO controllers
    44	 * and GPIO controller 2 as the "fabric" GPIO controller. Despite that wording,
    45	 * all 3 are "hard" peripherals. If a bit is set in the mux's control register,
    46	 * the "pad" controller's interrupt will be put in "non-direct" mode. If
    47	 * cleared, the "fabric" controller's.
    48	 *
    49	 * Bits 0 to 13 mux between GPIO controller 1's 14 GPIOs and GPIO controller
    50	 * 2's first 14 GPIOs.
    51	 * The remaining bits mux between the first 18 GPIOs of controller 1 and the
    52	 * last 18 GPIOS of controller 2.
    53	 *
    54	 * That leaves 6 exclusive, or "direct", interrupts remaining. These are,
    55	 * according to documentation, used by GPIO controller 1's lines 19 to 24.
    56	 */
    57	static const unsigned long mpfs_irq_mux_masks[3] = {
    58		GENMASK_ULL(13, 0),
  > 59		GENMASK_ULL(37, 14),
    60		GENMASK_ULL(31, 0),
    61	};
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
