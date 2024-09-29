Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3918B224F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 16:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727628164; cv=none; b=Yr80wgYuF44sat0B9dNe+Zp2bZTFUKzp/utBLKOeANBvPQYT/azzfjjOfNjw+QeQmYoUsUzwXZbkI9rplbFQtWywdzsv5+sKHNJTYqNJy7m36rTLeT9lcwqAbU+g2GUDZr3JhgNENsIaWwlJZU4k7rDuZ7Zv18mlcYLAnf5Bq6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727628164; c=relaxed/simple;
	bh=13CCw1YGr4dfNCeCRd4tN5uCAlTXv87NeP+SOqiJH0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SG4K4W6pP4R7EjBcbesGPBGUnIqdk58ubVPpH4gNoQRG+ysIChC32dX3ZTHypRY1zZ2iC8x8YwAmF+U1mrSYeQ5ikrbYN9ehSRzCfrMayaP08ZbQpowTLCpCl23jqZMER7fkFmsHdVIJEnyKcpxd54fAE7p/IUAu4tnHRZOzh+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/uIW8b1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/uIW8b1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727628161; x=1759164161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=13CCw1YGr4dfNCeCRd4tN5uCAlTXv87NeP+SOqiJH0M=;
  b=N/uIW8b1FpbXiXEcjkfVOsBce3AvxOkGmsg9Y8pAMStk6+v09fIbejOw
   39i5iCfIJRvdvlc/onq9w6ccJFLWgYH6ayMRypI2aFK9pwtKtWUSStZGW
   aBADE4uJI5jdKuBTGSr4U6VAfBJhwPy+kCl0vDL/IjHPq1i4CRW9istaN
   fW+t6Lw/jNl8PE+Ww+XfDwQDjgCoEF7wMWzOQdf9wCozlPBYnNwA6FfPI
   Ce6+yKN/iYRiZZruXzpBgfRqF9G1jQSO/9pE8BMBNLm9WcntZKIMtdQLV
   RNGIEg7VckSp99Maa+FljXnI2BXc/ScaUJOUFr7j5NhsQwirqENn+/Wzj
   A==;
X-CSE-ConnectionGUID: kzXmLiUwQMqMecAhei4CPg==
X-CSE-MsgGUID: Ecz0xEEuQFGCzFZ3mC4RRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26591715"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26591715"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 09:42:41 -0700
X-CSE-ConnectionGUID: iwqrSg0aQvOqmsqr48+NIg==
X-CSE-MsgGUID: KZIgsf8PRC+3eLKWXdvM1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="72923221"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Sep 2024 09:42:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sux0H-000OTH-0P;
	Sun, 29 Sep 2024 16:42:37 +0000
Date: Mon, 30 Sep 2024 00:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3741/16788]
 drivers/mtd/spi-nor/macronix.c:50: warning: expecting prototype for
 spi_nor_macronix_octal_dtr_enable(). Prototype was for
 spi_nor_macronix_set_octal_dtr() instead
Message-ID: <202409300029.fxXgsWxE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Han,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 1bf849437a44122ddac30714bcbf9d0e70feec42 [3741/16788] LF-9906 spi-nor: macronix: fix the macronix octal dtr function
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240930/202409300029.fxXgsWxE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300029.fxXgsWxE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300029.fxXgsWxE-lkp@intel.com/

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
