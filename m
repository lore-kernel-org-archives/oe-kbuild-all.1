Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692CD17C8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 02:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674182204; x=1705718204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QV25VNy+PUHs1NMmO++fLDLrHvbJf7SwvJQYpXhsmaE=;
  b=Td7Ux2tDMTAB+pbDEL2fXgHUe7sKI8rwP2NbCShwxauBkG3uwouKefuf
   fh3lICF1zuaOaY9nqhVT7V7KjwrBuCv1QBnVQm+5Ucf2qZPC+u34FrRWF
   NwIj3Nruno33M2o2tTR3C8B+dRhn2vGH/u73uEoIAY0bwjl9UiLdEp7cP
   gd8v7tHH/+PMJq8Ysn+T4y/piaNt98bBKbIXzGhdmzOasntj7xrw/4TIl
   rHp99VfOUhO1aN8wTe0QAHUNYs9ddjhNOILhU0Z68Zy23rkXCRYj67rzZ
   4RIOYgR01B5sK+S8qClElzOFeqGVxNAIuBVRmdWat70hkM+PWloLxmeJd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323183438"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="323183438"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 18:36:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="802919919"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="802919919"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2023 18:36:36 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIhGd-00026S-0e;
	Fri, 20 Jan 2023 02:36:35 +0000
Date: Fri, 20 Jan 2023 10:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, broonie@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	jic23@kernel.org, tudor.ambarus@microchip.com, pratyush@kernel.org,
	sanju.mehta@amd.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org,
	kdasu.kdev@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com,
	sbranden@broadcom.com, eajames@linux.ibm.com, olteanv@gmail.com,
	han.xu@nxp.com, john.garry@huawei.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, narmstrong@baylibre.com,
	khilman@baylibre.com, matthias.bgg@gmail.com, haibo.chen@nxp.com,
	linus.walleij@linaro.org, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr, agross@kernel.org,
	bjorn.andersson@linaro.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 13/13] spi: spi-zynqmp-gqspi: Add parallel memories
 support in GQSPI driver
Message-ID: <202301201055.lAt5dcXk-lkp@intel.com>
References: <20230119185342.2093323-14-amit.kumar-mahapatra@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119185342.2093323-14-amit.kumar-mahapatra@amd.com>

Hi Amit,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.2-rc4]
[cannot apply to broonie-spi/for-next mtd/spi-nor/next next-20230119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Kumar-Mahapatra/spi-Add-APIs-in-spi-core-to-set-get-spi-chip_select-and-spi-cs_gpiod/20230120-031122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230119185342.2093323-14-amit.kumar-mahapatra%40amd.com
patch subject: [PATCH v2 13/13] spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230120/202301201055.lAt5dcXk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fa597297af8ca9a48050a3907eb5e7541d88f1bd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Amit-Kumar-Mahapatra/spi-Add-APIs-in-spi-core-to-set-get-spi-chip_select-and-spi-cs_gpiod/20230120-031122
        git checkout fa597297af8ca9a48050a3907eb5e7541d88f1bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-zynqmp-gqspi.c:229:6: warning: no previous prototype for 'zynqmp_gqspi_update_stripe' [-Wmissing-prototypes]
     229 | bool zynqmp_gqspi_update_stripe(const struct spi_mem_op *op)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/zynqmp_gqspi_update_stripe +229 drivers/spi/spi-zynqmp-gqspi.c

   221	
   222	/**
   223	 * zynqmp_gqspi_update_stripe - For GQSPI controller data stripe capabilities
   224	 * @op:	Pointer to mem ops
   225	 * Return:      Status of the data stripe
   226	 *
   227	 * Returns true if data stripe need to be enabled, else returns false
   228	 */
 > 229	bool zynqmp_gqspi_update_stripe(const struct spi_mem_op *op)
   230	{
   231		if (op->cmd.opcode ==  SPINOR_OP_BE_4K ||
   232		    op->cmd.opcode ==  SPINOR_OP_BE_32K ||
   233		    op->cmd.opcode ==  SPINOR_OP_CHIP_ERASE ||
   234		    op->cmd.opcode ==  SPINOR_OP_SE ||
   235		    op->cmd.opcode ==  SPINOR_OP_BE_32K_4B ||
   236		    op->cmd.opcode ==  SPINOR_OP_SE_4B ||
   237		    op->cmd.opcode == SPINOR_OP_BE_4K_4B ||
   238		    op->cmd.opcode ==  SPINOR_OP_WRSR ||
   239		    op->cmd.opcode ==  SPINOR_OP_BRWR ||
   240		    (op->cmd.opcode ==  SPINOR_OP_WRSR2 && !op->addr.nbytes))
   241			return false;
   242	
   243		return true;
   244	}
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
