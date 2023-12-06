Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5336AB9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 02:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0LSifBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701830844; x=1733366844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aSxt+++CLWx+nm0tAUdy+OiEswQmQLTty30155VefQM=;
  b=J0LSifBq1HDlUrkF10zWydu0YZbTSmF6ShjGkIUL1M1Up5oIjq1XxGzH
   1MQHxhDroud+s1kp5lB2iIKKWbjD83Lape4oGLCTsP4JPLqQmtfBehr3F
   8lwnk/pVIxW+W8OD7SCRridwOSVWdQkW+lZo3rulvqJl7e2QwhO7ieoUV
   lSCXoKUpr3KxERxKT2Wl2mnTddXvNXgyuv+YorDgbzKSS0V4g9+kvte0e
   f7NonPmQfsodBUwxPRcOVsLQ3Vsct8jifKZOqJox8IljHXXRp9B6WdpG6
   +6QaUjyXEIl3vwXb0pgFY7Yfir7ubVG5w0O0C0TiMDWiGiMIt39SamccU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1060120"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1060120"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 18:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102665129"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1102665129"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 18:47:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAhwS-000A76-15;
	Wed, 06 Dec 2023 02:47:16 +0000
Date: Wed, 6 Dec 2023 10:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 14/42] drivers/mtd/spi-nor/core.c:632:5:
 warning: no previous prototype for 'spi_nor_write_ear'
Message-ID: <202312061054.BAc7WKDW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   414b0dc753ec961cf8e532b86412522e78a00169
commit: c29562880a8dec6ead1ec39e25e91840bad9da62 [14/42] mtd: spi-nor: Add EAR support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231206/202312061054.BAc7WKDW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061054.BAc7WKDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061054.BAc7WKDW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/core.c:632:5: warning: no previous prototype for 'spi_nor_write_ear' [-Wmissing-prototypes]
     632 | int spi_nor_write_ear(struct spi_nor *nor, u32 addr)
         |     ^~~~~~~~~~~~~~~~~


vim +/spi_nor_write_ear +632 drivers/mtd/spi-nor/core.c

   624	
   625	/**
   626	 * spi_nor_write_ear() - Write Extended Address Register.
   627	 * @nor:	pointer to 'struct spi_nor'.
   628	 * @addr:	value to write to the Extended Address Register.
   629	 *
   630	 * Return: 0 on success, -errno otherwise.
   631	 */
 > 632	int spi_nor_write_ear(struct spi_nor *nor, u32 addr)
   633	{
   634		u8 code = SPINOR_OP_WREAR;
   635		u32 ear;
   636		int ret;
   637		struct mtd_info *mtd = &nor->mtd;
   638	
   639		/* Wait until finished previous write command. */
   640		if (spi_nor_wait_till_ready(nor))
   641			return 1;
   642	
   643		ret = spi_nor_write_enable(nor);
   644		if (ret)
   645			return ret;
   646	
   647		if (!(nor->flags & SNOR_F_HAS_PARALLEL) && mtd->size <= 0x1000000)
   648			return 0;
   649		else if (mtd->size <= 0x2000000)
   650			return 0;
   651	
   652		if (!(nor->flags & SNOR_F_HAS_PARALLEL) || !(nor->flags & SNOR_F_HAS_STACKED))
   653			addr = addr % (u32)mtd->size;
   654		else
   655			addr = addr % (u32)(mtd->size >> 0x1);
   656	
   657		ear = addr >> 24;
   658	
   659		if (!(nor->flags & SNOR_F_HAS_STACKED) && ear == nor->curbank)
   660			return 0;
   661	
   662		if ((nor->flags & SNOR_F_HAS_STACKED) && mtd->size <= 0x2000000)
   663			return 0;
   664	
   665		if (nor->jedec_id == CFI_MFR_AMD)
   666			code = SPINOR_OP_BRWR;
   667		if (nor->jedec_id == CFI_MFR_ST ||
   668		    nor->jedec_id == CFI_MFR_MACRONIX ||
   669		    nor->jedec_id == CFI_MFR_PMC) {
   670			spi_nor_write_enable(nor);
   671			code = SPINOR_OP_WREAR;
   672		}
   673		nor->bouncebuf[0] = ear;
   674	
   675		if (nor->spimem) {
   676			struct spi_mem_op op =
   677				SPI_MEM_OP(SPI_MEM_OP_CMD(code, 0),
   678					   SPI_MEM_OP_NO_ADDR,
   679					   SPI_MEM_OP_NO_DUMMY,
   680					   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 0));
   681	
   682			spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
   683	
   684			ret = spi_mem_exec_op(nor->spimem, &op);
   685		} else {
   686			ret = spi_nor_controller_ops_write_reg(nor, code, nor->bouncebuf, 1);
   687			if (ret < 0)
   688				return ret;
   689		}
   690	
   691		nor->curbank = ear;
   692	
   693		return ret;
   694	}
   695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
