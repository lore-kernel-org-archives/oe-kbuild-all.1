Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EE66CDAF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 05:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661011; cv=none; b=X1q48j1TChMoJXUdGA7sdgB21LkLveQN3KQvjt/Rp/U2aZ2kbHbUn6ObPJPyD7nSuyKP+9+ZVWJz1S6WJOG9wpd9fIXxpTM/xz+0TOW7Tp9i6D08yhFph4yU7qx1i6gyJaT12QpB8nPv1qyqlvQ8ks9Q9ChfbF2fwKVA8ftklpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661011; c=relaxed/simple;
	bh=pN391+JonUCxcMXPYyAVsfy93wsx9QbnfkQfwPOArG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pk5kyyeULfbKZywHxPxvtrS3ObVK8JA+aI7kR5yMLItCNwxp5L2XUcpsMKRslTMxo5oqZRJQ8kZLt1jJ7e4bEsJuWwRQNTosO2nQF3rXT0ZhNJDpkqNCanwsVejNJShmu6yZp0O5Sldvg9IYAJ7LkKvKc0A3BFn+SmJhqTmgdhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAIKgZvt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAIKgZvt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729661009; x=1761197009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pN391+JonUCxcMXPYyAVsfy93wsx9QbnfkQfwPOArG4=;
  b=ZAIKgZvt6SmOacY7siDSEyBvxZyFHg8W6w73tglcpR7KEGhpg/9FbEvl
   X6P1jMzPTJsFiR0lLrO4uU5gjTlYQyDI/9UauEv3P3HtEySv1u86N6JZQ
   qzA40NW9zr/l1tsfNyPUUVhTqemLOs8yH5atCGBwqVZLJGA8moJi0hZRB
   5+G1NetuCrBzWzyq3rnq4H7ylf1D/F/I4dXbYIKGN/MD9y99vg3Y/pPP/
   SZR3b2r0sAGFF+j5og3sc07PWd23xYqVShL/EgrMAzwiJUze5Og2nxGyt
   XMBKRnlRQTk0UuyFqxfD33AH8TnmJ2i0WDSq4tt7euHivfzZ33Bij/hWt
   w==;
X-CSE-ConnectionGUID: tgODsUdETEOQ/oMSgAHeVQ==
X-CSE-MsgGUID: UMbTddbpRDGuYGzi+LLHsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39774817"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39774817"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 22:23:28 -0700
X-CSE-ConnectionGUID: +6idtGGgTMeDnottOBiR+A==
X-CSE-MsgGUID: 5TMMweIuTESDRFyG9zu8RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="110882529"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2024 22:23:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Tq7-000UTV-2z;
	Wed, 23 Oct 2024 05:23:23 +0000
Date: Wed, 23 Oct 2024 13:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH nand/next 3/4] include: mtd: spinand: Add CASN page
 related macros and flags.
Message-ID: <202410231223.S7qRiG54-lkp@intel.com>
References: <20241020132722.20565-4-SkyLake.Huang@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020132722.20565-4-SkyLake.Huang@mediatek.com>

Hi Sky,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes linus/master v6.12-rc4 next-20241022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/mtd-nand-Create-param-c-to-do-CRC-check-and-bitwise-majority-for-Parameter-CASN-page/20241020-212938
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20241020132722.20565-4-SkyLake.Huang%40mediatek.com
patch subject: [RFC PATCH nand/next 3/4] include: mtd: spinand: Add CASN page related macros and flags.
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241023/202410231223.S7qRiG54-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231223.S7qRiG54-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231223.S7qRiG54-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/nand/spi/core.c: In function 'spinand_read_from_cache_op':
>> drivers/mtd/nand/spi/core.c:411:30: error: 'SPINAND_HAS_READ_PLANE_SELECT_BIT' undeclared (first use in this function)
     411 |         if (spinand->flags & SPINAND_HAS_READ_PLANE_SELECT_BIT)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:411:30: note: each undeclared identifier is reported only once for each function it appears in
   drivers/mtd/nand/spi/core.c: In function 'spinand_write_to_cache_op':
>> drivers/mtd/nand/spi/core.c:495:30: error: 'SPINAND_HAS_PROG_PLANE_SELECT_BIT' undeclared (first use in this function)
     495 |         if (spinand->flags & SPINAND_HAS_PROG_PLANE_SELECT_BIT)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/mtd/nand/spi/macronix.c:11:
>> drivers/mtd/nand/spi/macronix.c:158:22: error: 'SPINAND_HAS_PROG_PLANE_SELECT_BIT' undeclared here (not in a function)
     158 |                      SPINAND_HAS_PROG_PLANE_SELECT_BIT |
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:454:26: note: in definition of macro 'SPINAND_INFO'
     454 |                 .flags = __flags,                                       \
         |                          ^~~~~~~
>> drivers/mtd/nand/spi/macronix.c:159:22: error: 'SPINAND_HAS_READ_PLANE_SELECT_BIT' undeclared here (not in a function)
     159 |                      SPINAND_HAS_READ_PLANE_SELECT_BIT,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:454:26: note: in definition of macro 'SPINAND_INFO'
     454 |                 .flags = __flags,                                       \
         |                          ^~~~~~~


vim +/SPINAND_HAS_READ_PLANE_SELECT_BIT +411 drivers/mtd/nand/spi/core.c

7529df4652482c Peter Pan       2018-06-22  376  
7529df4652482c Peter Pan       2018-06-22  377  static int spinand_read_from_cache_op(struct spinand_device *spinand,
7529df4652482c Peter Pan       2018-06-22  378  				      const struct nand_page_io_req *req)
7529df4652482c Peter Pan       2018-06-22  379  {
7529df4652482c Peter Pan       2018-06-22  380  	struct nand_device *nand = spinand_to_nand(spinand);
e708789c4a8798 Miquel Raynal   2021-01-07  381  	struct mtd_info *mtd = spinand_to_mtd(spinand);
981d1aa0697ce1 Boris Brezillon 2019-01-24  382  	struct spi_mem_dirmap_desc *rdesc;
7529df4652482c Peter Pan       2018-06-22  383  	unsigned int nbytes = 0;
7529df4652482c Peter Pan       2018-06-22  384  	void *buf = NULL;
7529df4652482c Peter Pan       2018-06-22  385  	u16 column = 0;
981d1aa0697ce1 Boris Brezillon 2019-01-24  386  	ssize_t ret;
7529df4652482c Peter Pan       2018-06-22  387  
7529df4652482c Peter Pan       2018-06-22  388  	if (req->datalen) {
7529df4652482c Peter Pan       2018-06-22  389  		buf = spinand->databuf;
631cfdd0520d19 Miquel Raynal   2024-08-26  390  		if (!req->continuous)
981d1aa0697ce1 Boris Brezillon 2019-01-24  391  			nbytes = nanddev_page_size(nand);
631cfdd0520d19 Miquel Raynal   2024-08-26  392  		else
631cfdd0520d19 Miquel Raynal   2024-08-26  393  			nbytes = round_up(req->dataoffs + req->datalen,
631cfdd0520d19 Miquel Raynal   2024-08-26  394  					  nanddev_page_size(nand));
981d1aa0697ce1 Boris Brezillon 2019-01-24  395  		column = 0;
7529df4652482c Peter Pan       2018-06-22  396  	}
7529df4652482c Peter Pan       2018-06-22  397  
7529df4652482c Peter Pan       2018-06-22  398  	if (req->ooblen) {
7529df4652482c Peter Pan       2018-06-22  399  		nbytes += nanddev_per_page_oobsize(nand);
7529df4652482c Peter Pan       2018-06-22  400  		if (!buf) {
7529df4652482c Peter Pan       2018-06-22  401  			buf = spinand->oobbuf;
7529df4652482c Peter Pan       2018-06-22  402  			column = nanddev_page_size(nand);
7529df4652482c Peter Pan       2018-06-22  403  		}
7529df4652482c Peter Pan       2018-06-22  404  	}
7529df4652482c Peter Pan       2018-06-22  405  
f9d7c7265bcff7 Miquel Raynal   2022-01-27  406  	if (req->mode == MTD_OPS_RAW)
981d1aa0697ce1 Boris Brezillon 2019-01-24  407  		rdesc = spinand->dirmaps[req->pos.plane].rdesc;
f9d7c7265bcff7 Miquel Raynal   2022-01-27  408  	else
f9d7c7265bcff7 Miquel Raynal   2022-01-27  409  		rdesc = spinand->dirmaps[req->pos.plane].rdesc_ecc;
7529df4652482c Peter Pan       2018-06-22  410  
ca229bdbef29be Cheng Ming Lin  2024-09-09 @411  	if (spinand->flags & SPINAND_HAS_READ_PLANE_SELECT_BIT)
ca229bdbef29be Cheng Ming Lin  2024-09-09  412  		column |= req->pos.plane << fls(nanddev_page_size(nand));
ca229bdbef29be Cheng Ming Lin  2024-09-09  413  
7529df4652482c Peter Pan       2018-06-22  414  	while (nbytes) {
981d1aa0697ce1 Boris Brezillon 2019-01-24  415  		ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
981d1aa0697ce1 Boris Brezillon 2019-01-24  416  		if (ret < 0)
7529df4652482c Peter Pan       2018-06-22  417  			return ret;
7529df4652482c Peter Pan       2018-06-22  418  
981d1aa0697ce1 Boris Brezillon 2019-01-24  419  		if (!ret || ret > nbytes)
981d1aa0697ce1 Boris Brezillon 2019-01-24  420  			return -EIO;
7529df4652482c Peter Pan       2018-06-22  421  
981d1aa0697ce1 Boris Brezillon 2019-01-24  422  		nbytes -= ret;
981d1aa0697ce1 Boris Brezillon 2019-01-24  423  		column += ret;
981d1aa0697ce1 Boris Brezillon 2019-01-24  424  		buf += ret;
631cfdd0520d19 Miquel Raynal   2024-08-26  425  
631cfdd0520d19 Miquel Raynal   2024-08-26  426  		/*
631cfdd0520d19 Miquel Raynal   2024-08-26  427  		 * Dirmap accesses are allowed to toggle the CS.
631cfdd0520d19 Miquel Raynal   2024-08-26  428  		 * Toggling the CS during a continuous read is forbidden.
631cfdd0520d19 Miquel Raynal   2024-08-26  429  		 */
631cfdd0520d19 Miquel Raynal   2024-08-26  430  		if (nbytes && req->continuous)
631cfdd0520d19 Miquel Raynal   2024-08-26  431  			return -EIO;
7529df4652482c Peter Pan       2018-06-22  432  	}
7529df4652482c Peter Pan       2018-06-22  433  
7529df4652482c Peter Pan       2018-06-22  434  	if (req->datalen)
7529df4652482c Peter Pan       2018-06-22  435  		memcpy(req->databuf.in, spinand->databuf + req->dataoffs,
7529df4652482c Peter Pan       2018-06-22  436  		       req->datalen);
7529df4652482c Peter Pan       2018-06-22  437  
e708789c4a8798 Miquel Raynal   2021-01-07  438  	if (req->ooblen) {
e708789c4a8798 Miquel Raynal   2021-01-07  439  		if (req->mode == MTD_OPS_AUTO_OOB)
e708789c4a8798 Miquel Raynal   2021-01-07  440  			mtd_ooblayout_get_databytes(mtd, req->oobbuf.in,
e708789c4a8798 Miquel Raynal   2021-01-07  441  						    spinand->oobbuf,
e708789c4a8798 Miquel Raynal   2021-01-07  442  						    req->ooboffs,
e708789c4a8798 Miquel Raynal   2021-01-07  443  						    req->ooblen);
e708789c4a8798 Miquel Raynal   2021-01-07  444  		else
868cbe2a6dcee4 Miquel Raynal   2020-10-01  445  			memcpy(req->oobbuf.in, spinand->oobbuf + req->ooboffs,
868cbe2a6dcee4 Miquel Raynal   2020-10-01  446  			       req->ooblen);
e708789c4a8798 Miquel Raynal   2021-01-07  447  	}
868cbe2a6dcee4 Miquel Raynal   2020-10-01  448  
7529df4652482c Peter Pan       2018-06-22  449  	return 0;
7529df4652482c Peter Pan       2018-06-22  450  }
7529df4652482c Peter Pan       2018-06-22  451  
7529df4652482c Peter Pan       2018-06-22  452  static int spinand_write_to_cache_op(struct spinand_device *spinand,
7529df4652482c Peter Pan       2018-06-22  453  				     const struct nand_page_io_req *req)
7529df4652482c Peter Pan       2018-06-22  454  {
7529df4652482c Peter Pan       2018-06-22  455  	struct nand_device *nand = spinand_to_nand(spinand);
3d1f08b032dc4e Miquel Raynal   2020-10-01  456  	struct mtd_info *mtd = spinand_to_mtd(spinand);
981d1aa0697ce1 Boris Brezillon 2019-01-24  457  	struct spi_mem_dirmap_desc *wdesc;
981d1aa0697ce1 Boris Brezillon 2019-01-24  458  	unsigned int nbytes, column = 0;
13c15e07eedf26 Boris Brezillon 2019-01-24  459  	void *buf = spinand->databuf;
981d1aa0697ce1 Boris Brezillon 2019-01-24  460  	ssize_t ret;
7529df4652482c Peter Pan       2018-06-22  461  
13c15e07eedf26 Boris Brezillon 2019-01-24  462  	/*
13c15e07eedf26 Boris Brezillon 2019-01-24  463  	 * Looks like PROGRAM LOAD (AKA write cache) does not necessarily reset
13c15e07eedf26 Boris Brezillon 2019-01-24  464  	 * the cache content to 0xFF (depends on vendor implementation), so we
13c15e07eedf26 Boris Brezillon 2019-01-24  465  	 * must fill the page cache entirely even if we only want to program
13c15e07eedf26 Boris Brezillon 2019-01-24  466  	 * the data portion of the page, otherwise we might corrupt the BBM or
13c15e07eedf26 Boris Brezillon 2019-01-24  467  	 * user data previously programmed in OOB area.
3d1f08b032dc4e Miquel Raynal   2020-10-01  468  	 *
3d1f08b032dc4e Miquel Raynal   2020-10-01  469  	 * Only reset the data buffer manually, the OOB buffer is prepared by
3d1f08b032dc4e Miquel Raynal   2020-10-01  470  	 * ECC engines ->prepare_io_req() callback.
13c15e07eedf26 Boris Brezillon 2019-01-24  471  	 */
13c15e07eedf26 Boris Brezillon 2019-01-24  472  	nbytes = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
3d1f08b032dc4e Miquel Raynal   2020-10-01  473  	memset(spinand->databuf, 0xff, nanddev_page_size(nand));
13c15e07eedf26 Boris Brezillon 2019-01-24  474  
13c15e07eedf26 Boris Brezillon 2019-01-24  475  	if (req->datalen)
13c15e07eedf26 Boris Brezillon 2019-01-24  476  		memcpy(spinand->databuf + req->dataoffs, req->databuf.out,
13c15e07eedf26 Boris Brezillon 2019-01-24  477  		       req->datalen);
7529df4652482c Peter Pan       2018-06-22  478  
7529df4652482c Peter Pan       2018-06-22  479  	if (req->ooblen) {
7529df4652482c Peter Pan       2018-06-22  480  		if (req->mode == MTD_OPS_AUTO_OOB)
7529df4652482c Peter Pan       2018-06-22  481  			mtd_ooblayout_set_databytes(mtd, req->oobbuf.out,
7529df4652482c Peter Pan       2018-06-22  482  						    spinand->oobbuf,
7529df4652482c Peter Pan       2018-06-22  483  						    req->ooboffs,
7529df4652482c Peter Pan       2018-06-22  484  						    req->ooblen);
7529df4652482c Peter Pan       2018-06-22  485  		else
7529df4652482c Peter Pan       2018-06-22  486  			memcpy(spinand->oobbuf + req->ooboffs, req->oobbuf.out,
7529df4652482c Peter Pan       2018-06-22  487  			       req->ooblen);
7529df4652482c Peter Pan       2018-06-22  488  	}
7529df4652482c Peter Pan       2018-06-22  489  
f9d7c7265bcff7 Miquel Raynal   2022-01-27  490  	if (req->mode == MTD_OPS_RAW)
981d1aa0697ce1 Boris Brezillon 2019-01-24  491  		wdesc = spinand->dirmaps[req->pos.plane].wdesc;
f9d7c7265bcff7 Miquel Raynal   2022-01-27  492  	else
f9d7c7265bcff7 Miquel Raynal   2022-01-27  493  		wdesc = spinand->dirmaps[req->pos.plane].wdesc_ecc;
7529df4652482c Peter Pan       2018-06-22  494  
ca229bdbef29be Cheng Ming Lin  2024-09-09 @495  	if (spinand->flags & SPINAND_HAS_PROG_PLANE_SELECT_BIT)
ca229bdbef29be Cheng Ming Lin  2024-09-09  496  		column |= req->pos.plane << fls(nanddev_page_size(nand));
ca229bdbef29be Cheng Ming Lin  2024-09-09  497  
7529df4652482c Peter Pan       2018-06-22  498  	while (nbytes) {
981d1aa0697ce1 Boris Brezillon 2019-01-24  499  		ret = spi_mem_dirmap_write(wdesc, column, nbytes, buf);
981d1aa0697ce1 Boris Brezillon 2019-01-24  500  		if (ret < 0)
7529df4652482c Peter Pan       2018-06-22  501  			return ret;
7529df4652482c Peter Pan       2018-06-22  502  
981d1aa0697ce1 Boris Brezillon 2019-01-24  503  		if (!ret || ret > nbytes)
981d1aa0697ce1 Boris Brezillon 2019-01-24  504  			return -EIO;
7529df4652482c Peter Pan       2018-06-22  505  
981d1aa0697ce1 Boris Brezillon 2019-01-24  506  		nbytes -= ret;
981d1aa0697ce1 Boris Brezillon 2019-01-24  507  		column += ret;
981d1aa0697ce1 Boris Brezillon 2019-01-24  508  		buf += ret;
7529df4652482c Peter Pan       2018-06-22  509  	}
7529df4652482c Peter Pan       2018-06-22  510  
7529df4652482c Peter Pan       2018-06-22  511  	return 0;
7529df4652482c Peter Pan       2018-06-22  512  }
7529df4652482c Peter Pan       2018-06-22  513  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
