Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8B34C81
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 06:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728195232; cv=none; b=G/jcMzny9DokjjcW9D6I/6/wIbacHCz6Wau9If/ycS/muRAp7QggiRomtPep+ByYJEy4Y+kjatbGUvTXk19mnURSDua4uUgtzIgRWHhjXqiDMwoghWhl8cXT/ezc7olSN7iQL17R7lYX2iRP2HzChG3gNaPRQ1YgjTTdFF/UCmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728195232; c=relaxed/simple;
	bh=oYwM8nPHCWDrKPpUVKPE87IeunH92PJKiU+97aTQ0pE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oaYp0dP0iK4txi6H1JwgkEFROhx/Y0/EUH00mEaXymX0NGRkPxzhvoX6kL6ZydEZcH/ygiHGZUhAf7mp8+LZ4c/yLPB5cAo3KRlbavckiUkaa1KmbyU4qCwnEWJkmsV4aS9N/Ro3WH/jsY+pHrl3UxAqRdP0tN/CDe5r1/p6+d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUQ83c3k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUQ83c3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728195230; x=1759731230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oYwM8nPHCWDrKPpUVKPE87IeunH92PJKiU+97aTQ0pE=;
  b=jUQ83c3kk64MJVEX80/R92ToUDkJZnlHLhXyfVLWCZ6c+YZssbyKkq7P
   CiGt1TwnIiEY5WPW7YovPmCzl3vVzGyqO5dDT0BI+qgtKYZIJUllHaFlR
   fZUQvmbqp1f/AHSlV5ov2nb3Y6oAbPIJk8zXe7BcJVgnRdqPYIVs8FCun
   Hn08F1l8YZeKBFxlQjPTeXb/MHBbwpzz+kKt8/2NIthlrTVLFpWIVQZkQ
   KKGVWBp0wvtokSa5/+E/Ps1GJsSpW9JDUUis0o4EDp4JHgDQ58g4rx3VA
   oqpvOHQgG0nF5yFQn4a88rpOqjKpVzK7mZpSA0cLOyZ0Kwy4UopPhuGqM
   g==;
X-CSE-ConnectionGUID: mXZtu9kqR5G8oQNzaFtSkQ==
X-CSE-MsgGUID: MdVqFnwYQiqQ55cwBxhmMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27312651"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="27312651"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 23:13:50 -0700
X-CSE-ConnectionGUID: 0Q0NNahQQ82iGiSmNKftjw==
X-CSE-MsgGUID: AwFg+7m2QOW+uyAZ9MwGlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="75134367"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Oct 2024 23:13:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxKWX-0003eW-1T;
	Sun, 06 Oct 2024 06:13:45 +0000
Date: Sun, 6 Oct 2024 14:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 657/1001]
 drivers/mtd/spi-nor/core.c:632:5: warning: no previous prototype for
 'spi_nor_write_ear'
Message-ID: <202410061432.7HH27lV0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: b10b20c017a3db2753231cea00a8f3ae15dd5112 [657/1001] mtd: spi-nor: Add EAR support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241006/202410061432.7HH27lV0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061432.7HH27lV0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061432.7HH27lV0-lkp@intel.com/

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
