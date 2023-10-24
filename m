Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB533E469
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 21:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVTON2vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698182669; x=1729718669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JQppcVbjOH4Ybnsvo4ft/htRCDCZHObMqPgUEuAWhGs=;
  b=SVTON2vukGVZqxFq1hb1WUhvd+Bh9PI3pTPW/kkJ3BTDuVzPzDuYMC3L
   6W1y6IMfN4pUKcZSBzrJZm5x6wg5HOusA4o7fRPy4v5AZV8eP/y3ZMTJy
   me+B6nk2pqnLc617R3Gntpm9MY0mlQ5RFQ4CJiDDl7zLm0UovsWCadB6P
   9Ql9b8RuiEIzGKKtwHWrwKaK3+DzEdZNZ1dm6Z3NUe8pOwUyIsz0w4Cqx
   GKzyS7/BB0I/oV0B6s/echifRV0EzOa1edalQ/mBe7eNMrivwVYlbDH2v
   zEjW3DfsjtW569a8qWa4l9e7W138HsbANvcEWI8oOVkAbCVTgmHK75u+K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="391042341"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="391042341"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 14:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="932169466"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="932169466"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Oct 2023 14:24:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvOsz-0008Ik-1e;
	Tue, 24 Oct 2023 21:24:25 +0000
Date: Wed, 25 Oct 2023 05:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3823/15770]
 drivers/mtd/spi-nor/macronix.c:50:27: warning: 'op' is used uninitialized
Message-ID: <202310250517.xGrz2s6V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: e1fe90a0261a650ff54812ee934e0f6167069a6b [3823/15770] mtd: spi-nor: macronix: add support for Macronix octaflash
config: um-randconfig-001-20231025 (https://download.01.org/0day-ci/archive/20231025/202310250517.xGrz2s6V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250517.xGrz2s6V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250517.xGrz2s6V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/macronix.c: In function 'spi_nor_macronix_octal_dtr_enable':
>> drivers/mtd/spi-nor/macronix.c:50:27: warning: 'op' is used uninitialized [-Wuninitialized]
      50 |         struct spi_mem_op op;
         |                           ^~
   drivers/mtd/spi-nor/macronix.c:50:27: note: 'op' declared here
      50 |         struct spi_mem_op op;
         |                           ^~


vim +/op +50 drivers/mtd/spi-nor/macronix.c

    40	
    41	/**
    42	 * spi_nor_macronix_octal_dtr_enable() - Enable octal DTR on Macronix flashes.
    43	 * @nor:		pointer to a 'struct spi_nor'
    44	 * @enable:		whether to enable Octal DTR or switch back to SPI
    45	 *
    46	 * Return: 0 on success, -errno otherwise.
    47	 */
    48	static int spi_nor_macronix_octal_dtr_enable(struct spi_nor *nor, bool enable)
    49	{
  > 50		struct spi_mem_op op;
    51		u8 *buf = nor->bouncebuf, i;
    52		int ret;
    53	
    54		/* Set/unset the octal and DTR enable bits. */
    55		ret = spi_nor_write_enable(nor);
    56		if (ret)
    57			return ret;
    58	
    59		if (enable) {
    60			buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
    61		} else {
    62			/*
    63			 * The register is 1-byte wide, but 1-byte transactions are not
    64			 * allowed in 8D-8D-8D mode. Since there is no register at the
    65			 * next location, just initialize the value to 0 and let the
    66			 * transaction go on.
    67			 */
    68			buf[0] = SPINOR_REG_MXIC_SPI_EN;
    69			buf[1] = 0x0;
    70		}
    71	
    72		op = (struct spi_mem_op)
    73			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_CR2, 1),
    74				   SPI_MEM_OP_ADDR(4, SPINOR_REG_MXIC_CR2_MODE, 1),
    75				   SPI_MEM_OP_NO_DUMMY,
    76				   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
    77	
    78		if (!enable)
    79			spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
    80	
    81		ret = spi_mem_exec_op(nor->spimem, &op);
    82		if (ret)
    83			return ret;
    84	
    85		/* Read flash ID to make sure the switch was successful. */
    86		op = (struct spi_mem_op)
    87			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
    88				   SPI_MEM_OP_ADDR(enable ? 4 : 0, 0, 1),
    89				   SPI_MEM_OP_DUMMY(enable ? 4 : 0, 1),
    90				   SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, buf, 1));
    91	
    92		if (enable)
    93			spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
    94	
    95		ret = spi_mem_exec_op(nor->spimem, &op);
    96		if (ret)
    97			return ret;
    98	
    99		if (enable) {
   100			for (i = 0; i < nor->info->id_len; i++)
   101				if (buf[i * 2] != nor->info->id[i])
   102					return -EINVAL;
   103		} else {
   104			if (memcmp(buf, nor->info->id, nor->info->id_len))
   105				return -EINVAL;
   106		}
   107	
   108		return 0;
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
