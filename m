Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6EB79ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686477303; x=1718013303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9xFoy8YY2bEQ2njjFFeAn0PsmVd441wz0nYBOh9GH98=;
  b=DdlykoeelbfjRg1uF6UPFxNjeEq+HSoiYIKiDQqcdqsEy8dOtq/e5v4o
   g2qmZvpvGfcTl9DH4oVtU/ZoneCsqLs6fHccCQzgxFG/n8E5XbXh/A+l8
   gFDPKu9UJwI/dy3haWl4z2KnhDanbAo3EvhuDc+LV1851d0rBPImqqfLT
   BBqteGtj8CpiWPpFyPivVBD3tchfHnxUiyztnXFvUE1Hf9iQVxGpNYv21
   ubIqI4iVQ3yjYbeMIJ+yN7aO0nwc/LarVlGpv5+KUbuNjnwytwPeAzrXD
   x6n9jfEqUKVbrJCr279vcdxxigyqkoRXwrXEaiLyv30SqTQMFneFIXal1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="444215440"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="444215440"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 02:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="1040991129"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="1040991129"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jun 2023 02:54:57 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8Hmi-000An6-2x;
	Sun, 11 Jun 2023 09:54:56 +0000
Date: Sun, 11 Jun 2023 17:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: William Zhang <william.zhang@broadcom.com>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, f.fainelli@gmail.com, rafal@milecki.pl,
	kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
	computersforpeace@gmail.com, anand.gore@broadcom.com,
	dregan@mail.com, kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/12] mtd: rawnand: brcmnand: Add BCMBCA read data bus
 interface
Message-ID: <202306111741.1Hs0TVE4-lkp@intel.com>
References: <20230606231252.94838-11-william.zhang@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606231252.94838-11-william.zhang@broadcom.com>

Hi William,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on mtd/mtd/next mtd/mtd/fixes linus/master v6.4-rc5 next-20230609]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Zhang/mtd-rawnand-brcmnand-Fix-ECC-level-field-setting-for-v7-2-controller/20230607-071834
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20230606231252.94838-11-william.zhang%40broadcom.com
patch subject: [PATCH 10/12] mtd: rawnand: brcmnand: Add BCMBCA read data bus interface
config: arm-randconfig-s052-20230611 (https://download.01.org/0day-ci/archive/20230611/202306111741.1Hs0TVE4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/2fce7300f3e21ad0cb55442e1acfeaf60f41bf7d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review William-Zhang/mtd-rawnand-brcmnand-Fix-ECC-level-field-setting-for-v7-2-controller/20230607-071834
        git checkout 2fce7300f3e21ad0cb55442e1acfeaf60f41bf7d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/mtd/nand/raw/brcmnand/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306111741.1Hs0TVE4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:83:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *flash_cache @@     got void [noderef] __iomem *flash_cache @@
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:83:48: sparse:     expected void *flash_cache
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:83:48: sparse:     got void [noderef] __iomem *flash_cache
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:84:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:84:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:84:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:86:25: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:86:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *from @@     got void * @@
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:86:25: sparse:     expected void const volatile [noderef] __iomem *from
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:86:25: sparse:     got void *

vim +86 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c

    70	
    71	static void bcmbca_read_data_bus(struct brcmnand_soc *soc,
    72					 void __iomem *flash_cache,  u32 *buffer,
    73					 int fc_words, bool is_param)
    74	{
    75		int i;
    76	
    77		if (!is_param) {
    78			/*
    79			 * memcpy can do unaligned aligned access depending on source
    80			 * and dest address, which is incompatible with nand cache. Fallback
    81			 * to the memcpy for io version
    82			 */
  > 83			if (bcmbca_nand_is_buf_aligned(flash_cache, buffer))
    84				memcpy((void *)buffer, (void *)flash_cache, fc_words * 4);
    85			else
  > 86				memcpy_fromio((void *)buffer, (void *)flash_cache, fc_words * 4);
    87		} else {
    88			/* Flash cache has same endian as the host for parameter pages */
    89			for (i = 0; i < fc_words; i++, buffer++)
    90				*buffer = __raw_readl(flash_cache + i * 4);
    91		}
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
