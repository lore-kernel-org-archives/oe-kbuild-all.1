Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8227417582
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 05:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714455434; cv=none; b=ZojAFCMcvh6632shCUcQXh9fv21il354pqbwNN13F+1W8pvtkSq0hsKLYkjb6qFwL1O6WLGvppWETQuOGMykngMdDms6tvUYlw7OrFGiOn1C64y6ABl0x5UTDLGR8ssiN4oX18gzPoSYz6a3YiAEaW2zXaIUUcZSDtCi2U5jbL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714455434; c=relaxed/simple;
	bh=FJ9WC7w65gwCC1b40GJWqdoZdaJwxh/7JE7LmnTE7K0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hDllZQ9RwpOuxKCQvlKx+CQHSZH21yaam76GIcbySBeQlcaUzKibzy+fhVDKG+uJU7GAk5qrB089Z87wHqPmUJJyeL882Yi3/Pt7cv5UkQQ2OSGhfzbJKAqqMrwoD8TaZF0jAq2JhBOU10HM8WMIKTZIt5GJFs1G8BO0148UVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mA3Tqnmz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mA3Tqnmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714455433; x=1745991433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FJ9WC7w65gwCC1b40GJWqdoZdaJwxh/7JE7LmnTE7K0=;
  b=mA3Tqnmz+NrDVoDwqIKplBWcBosCjLz9LKp1yVgE5J8zTwmm6OfJTVon
   iJPteEQZfMSB4ijI2WNIi3oCumIIS1fgMCndU6tXLvwhLuXvkZ1KXkPVj
   1RRXrzOvwxBMTLWGYIuIYdskm+kb52bxsy6oTsJv4JTRwenP7KUedoKnP
   jiJI+4i1/cuUPb8XBhXvPsjIU3qjJI0ZSXQcDNt0lnn/uPaGCYkmzOgTC
   Gf9D7yEE3NuZ4NI0holya5WPgBZFuo0DnlvCvEr6E/xLPLtGEZQIyWO/J
   l3+LlHMqngkrpluePVya0Dv3JPooeo4D/v2/mbfZNUZoZN4Ly0P1UAfJg
   g==;
X-CSE-ConnectionGUID: I/nF0WobQKWUoVHqAelaDg==
X-CSE-MsgGUID: hahD5S2ZSCGdWMTqiad3/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13937005"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="13937005"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 22:37:12 -0700
X-CSE-ConnectionGUID: 7Un1zZTFTMeVq5wbzYgGLA==
X-CSE-MsgGUID: ZR9TT+t0SvuaoZ5ITjByYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="30795574"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2024 22:37:11 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1gAu-0007mC-2f;
	Tue, 30 Apr 2024 05:37:08 +0000
Date: Tue, 30 Apr 2024 13:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3741/11728]
 drivers/mtd/spi-nor/macronix.c:50: warning: expecting prototype for
 spi_nor_macronix_octal_dtr_enable(). Prototype was for
 spi_nor_macronix_set_octal_dtr() instead
Message-ID: <202404301303.P8pK7Jmn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 1bf849437a44122ddac30714bcbf9d0e70feec42 [3741/11728] LF-9906 spi-nor: macronix: fix the macronix octal dtr function
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240430/202404301303.P8pK7Jmn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301303.P8pK7Jmn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301303.P8pK7Jmn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/macronix.c:50: warning: expecting prototype for spi_nor_macronix_octal_dtr_enable(). Prototype was for spi_nor_macronix_set_octal_dtr() instead


vim +50 drivers/mtd/spi-nor/macronix.c

10526d85e4c6cb Boris Brezillon 2020-03-13   41  
4914f17cd6de25 Haibo Chen      2021-06-04   42  /**
4914f17cd6de25 Haibo Chen      2021-06-04   43   * spi_nor_macronix_octal_dtr_enable() - Enable octal DTR on Macronix flashes.
4914f17cd6de25 Haibo Chen      2021-06-04   44   * @nor:		pointer to a 'struct spi_nor'
4914f17cd6de25 Haibo Chen      2021-06-04   45   * @enable:		whether to enable Octal DTR or switch back to SPI
4914f17cd6de25 Haibo Chen      2021-06-04   46   *
4914f17cd6de25 Haibo Chen      2021-06-04   47   * Return: 0 on success, -errno otherwise.
4914f17cd6de25 Haibo Chen      2021-06-04   48   */
1bf849437a4412 Han Xu          2023-08-22   49  static int spi_nor_macronix_set_octal_dtr(struct spi_nor *nor, bool enable)
4914f17cd6de25 Haibo Chen      2021-06-04  @50  {
4914f17cd6de25 Haibo Chen      2021-06-04   51  	struct spi_mem_op op;
4914f17cd6de25 Haibo Chen      2021-06-04   52  	u8 *buf = nor->bouncebuf, i;
4914f17cd6de25 Haibo Chen      2021-06-04   53  	int ret;
4914f17cd6de25 Haibo Chen      2021-06-04   54  
4914f17cd6de25 Haibo Chen      2021-06-04   55  	/* Set/unset the octal and DTR enable bits. */
4914f17cd6de25 Haibo Chen      2021-06-04   56  	ret = spi_nor_write_enable(nor);
4914f17cd6de25 Haibo Chen      2021-06-04   57  	if (ret)
4914f17cd6de25 Haibo Chen      2021-06-04   58  		return ret;
4914f17cd6de25 Haibo Chen      2021-06-04   59  
4914f17cd6de25 Haibo Chen      2021-06-04   60  	if (enable) {
4914f17cd6de25 Haibo Chen      2021-06-04   61  		buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
4914f17cd6de25 Haibo Chen      2021-06-04   62  	} else {
4914f17cd6de25 Haibo Chen      2021-06-04   63  		/*
4914f17cd6de25 Haibo Chen      2021-06-04   64  		 * The register is 1-byte wide, but 1-byte transactions are not
4914f17cd6de25 Haibo Chen      2021-06-04   65  		 * allowed in 8D-8D-8D mode. Since there is no register at the
4914f17cd6de25 Haibo Chen      2021-06-04   66  		 * next location, just initialize the value to 0 and let the
4914f17cd6de25 Haibo Chen      2021-06-04   67  		 * transaction go on.
4914f17cd6de25 Haibo Chen      2021-06-04   68  		 */
4914f17cd6de25 Haibo Chen      2021-06-04   69  		buf[0] = SPINOR_REG_MXIC_SPI_EN;
4914f17cd6de25 Haibo Chen      2021-06-04   70  		buf[1] = 0x0;
4914f17cd6de25 Haibo Chen      2021-06-04   71  	}
4914f17cd6de25 Haibo Chen      2021-06-04   72  
4914f17cd6de25 Haibo Chen      2021-06-04   73  	op = (struct spi_mem_op)
4914f17cd6de25 Haibo Chen      2021-06-04   74  		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_CR2, 1),
4914f17cd6de25 Haibo Chen      2021-06-04   75  			   SPI_MEM_OP_ADDR(4, SPINOR_REG_MXIC_CR2_MODE, 1),
4914f17cd6de25 Haibo Chen      2021-06-04   76  			   SPI_MEM_OP_NO_DUMMY,
4914f17cd6de25 Haibo Chen      2021-06-04   77  			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
4914f17cd6de25 Haibo Chen      2021-06-04   78  
4914f17cd6de25 Haibo Chen      2021-06-04   79  	if (!enable)
4914f17cd6de25 Haibo Chen      2021-06-04   80  		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
4914f17cd6de25 Haibo Chen      2021-06-04   81  
4914f17cd6de25 Haibo Chen      2021-06-04   82  	ret = spi_mem_exec_op(nor->spimem, &op);
4914f17cd6de25 Haibo Chen      2021-06-04   83  	if (ret)
4914f17cd6de25 Haibo Chen      2021-06-04   84  		return ret;
4914f17cd6de25 Haibo Chen      2021-06-04   85  
4914f17cd6de25 Haibo Chen      2021-06-04   86  	/* Read flash ID to make sure the switch was successful. */
4914f17cd6de25 Haibo Chen      2021-06-04   87  	op = (struct spi_mem_op)
4914f17cd6de25 Haibo Chen      2021-06-04   88  		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
4914f17cd6de25 Haibo Chen      2021-06-04   89  			   SPI_MEM_OP_ADDR(enable ? 4 : 0, 0, 1),
4914f17cd6de25 Haibo Chen      2021-06-04   90  			   SPI_MEM_OP_DUMMY(enable ? 4 : 0, 1),
4914f17cd6de25 Haibo Chen      2021-06-04   91  			   SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, buf, 1));
4914f17cd6de25 Haibo Chen      2021-06-04   92  
4914f17cd6de25 Haibo Chen      2021-06-04   93  	if (enable)
4914f17cd6de25 Haibo Chen      2021-06-04   94  		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
4914f17cd6de25 Haibo Chen      2021-06-04   95  
4914f17cd6de25 Haibo Chen      2021-06-04   96  	ret = spi_mem_exec_op(nor->spimem, &op);
4914f17cd6de25 Haibo Chen      2021-06-04   97  	if (ret)
4914f17cd6de25 Haibo Chen      2021-06-04   98  		return ret;
4914f17cd6de25 Haibo Chen      2021-06-04   99  
4914f17cd6de25 Haibo Chen      2021-06-04  100  	if (enable) {
4914f17cd6de25 Haibo Chen      2021-06-04  101  		for (i = 0; i < nor->info->id_len; i++)
4914f17cd6de25 Haibo Chen      2021-06-04  102  			if (buf[i * 2] != nor->info->id[i])
4914f17cd6de25 Haibo Chen      2021-06-04  103  				return -EINVAL;
4914f17cd6de25 Haibo Chen      2021-06-04  104  	} else {
4914f17cd6de25 Haibo Chen      2021-06-04  105  		if (memcmp(buf, nor->info->id, nor->info->id_len))
4914f17cd6de25 Haibo Chen      2021-06-04  106  			return -EINVAL;
4914f17cd6de25 Haibo Chen      2021-06-04  107  	}
4914f17cd6de25 Haibo Chen      2021-06-04  108  
4914f17cd6de25 Haibo Chen      2021-06-04  109  	return 0;
4914f17cd6de25 Haibo Chen      2021-06-04  110  }
4914f17cd6de25 Haibo Chen      2021-06-04  111  

:::::: The code at line 50 was first introduced by commit
:::::: 4914f17cd6de259793e4a2c27061c147331571d0 mtd: spi-nor: macronix: add support for Macronix octaflash

:::::: TO: Haibo Chen <haibo.chen@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
