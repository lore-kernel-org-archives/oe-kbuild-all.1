Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC0FD2FF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 03:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735703493; cv=none; b=nyVpP2mwkWty8bWK6xZWqy+nGlfQw15LY2nEuJmZX4cx73ukzzxThFXR+5W7Erz5+sUn0bFtUb77lGVy50fpiza2f3oPq8i1nZOwGpoNb5yDaEfocqf77N0mceqKx9Ws3F/Q/ty12He2mU4mSm7HMFQJRU0TZiLhjyO/R9W7dfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735703493; c=relaxed/simple;
	bh=LtI0ypqL6zF4YJfLG12pfzOiNSJ6adww86IyBq4i34o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3tu9OVNCdYCJfq+M0XCO9JcBryVkxE9GArMS/n5nFEcxzSnTLT44QwyhVJmkOq6hy01teEgt5bvcOwGaAMxoaaNXq7IT68rs7DHxlzafdJmFmPx513ER+WuLeKRH04mdqxRmbaHlmF3EgXV3i2q9ITE2kfV4jOiUIoKsVSlO8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJTFeEEw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJTFeEEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735703492; x=1767239492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LtI0ypqL6zF4YJfLG12pfzOiNSJ6adww86IyBq4i34o=;
  b=jJTFeEEwBCpMa8kwQxRMBhyPva0O/WwgV4abq0CkdReeQ6pNTdwfVrbd
   3mLrwId6C9EeJj5TTZUVQFfMW90t/S1cJ6d/Uyuw/0wZEU5W/je6Tl/RV
   YnAftdDYuLoJKCmKU9x6HDc+OhmCiqOm9TLKY5M15iYfdzyG2eqrdTTUD
   pHZrpwdz2NDBPBN9ivat4mWlXg8UK7QH7Y9IFcf1D/4uCKQWyMTVbhgub
   WrK6zP+wr3NeAj9WNd4L1aCcVv8Uom2dQcZZw6aRTCVt7GTOfkgTXCH/u
   Lk0W1P3WBbTa+5Yf6pQO8HfRiGVFtE7Xq7wyRKHYsfSFUNEnTvyyDDm/u
   w==;
X-CSE-ConnectionGUID: nGswG3T7R7OrVSgVRQ1LMg==
X-CSE-MsgGUID: WGq3SV2GTsKLd+9laPa9wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35216454"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="35216454"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 19:51:30 -0800
X-CSE-ConnectionGUID: xlw1xF4lR76zKtlGMUOeOQ==
X-CSE-MsgGUID: 2t6qKKvpT4KlKzJOMsPaJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="101358438"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Dec 2024 19:51:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSplW-0007c1-04;
	Wed, 01 Jan 2025 03:51:26 +0000
Date: Wed, 1 Jan 2025 11:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@suse.de>, Tony Luck <tony.luck@intel.com>
Subject: drivers/edac/skx_common.c:309:79: warning: '_DIMM#' directive output
 may be truncated writing 6 bytes into a region of size between 0 and 9
Message-ID: <202501011159.P6GIMpIk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: 98f2fc829e3b55a0ff1b82753fc1e10941535cb9 EDAC, skx_edac: Delete duplicated code
date:   6 years ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20250101/202501011159.P6GIMpIk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011159.P6GIMpIk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011159.P6GIMpIk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/edac/skx_common.c: In function 'skx_mce_output_error':
   drivers/edac/skx_common.c:470:15: warning: variable 'type' set but not used [-Wunused-but-set-variable]
     470 |         char *type, *optype;
         |               ^~~~
   drivers/edac/skx_common.c: In function 'skx_get_dimm_info':
>> drivers/edac/skx_common.c:309:79: warning: '_DIMM#' directive output may be truncated writing 6 bytes into a region of size between 0 and 9 [-Wformat-truncation=]
     309 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                                               ^~~~~~
   drivers/edac/skx_common.c:309:52: note: using the range [0, 4294967295] for directive argument
     309 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/skx_common.c:309:9: note: 'snprintf' output between 31 and 53 bytes into a destination of size 32
     309 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                  imc->src_id, imc->lmc, chan, dimmno);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/skx_common.c: In function 'skx_get_nvdimm_info':
   drivers/edac/skx_common.c:357:79: warning: '_DIMM#' directive output may be truncated writing 6 bytes into a region of size between 0 and 9 [-Wformat-truncation=]
     357 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                                               ^~~~~~
   drivers/edac/skx_common.c:357:52: note: using the range [0, 4294967295] for directive argument
     357 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/skx_common.c:357:9: note: 'snprintf' output between 31 and 53 bytes into a destination of size 32
     357 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     358 |                  imc->src_id, imc->lmc, chan, dimmno);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +309 drivers/edac/skx_common.c

88a242c9874044 Qiuxu Zhuo 2019-01-30  277  
88a242c9874044 Qiuxu Zhuo 2019-01-30  278  int skx_get_dimm_info(u32 mtr, u32 amap, struct dimm_info *dimm,
88a242c9874044 Qiuxu Zhuo 2019-01-30  279  		      struct skx_imc *imc, int chan, int dimmno)
88a242c9874044 Qiuxu Zhuo 2019-01-30  280  {
88a242c9874044 Qiuxu Zhuo 2019-01-30  281  	int  banks = 16, ranks, rows, cols, npages;
88a242c9874044 Qiuxu Zhuo 2019-01-30  282  	u64 size;
88a242c9874044 Qiuxu Zhuo 2019-01-30  283  
88a242c9874044 Qiuxu Zhuo 2019-01-30  284  	ranks = numrank(mtr);
88a242c9874044 Qiuxu Zhuo 2019-01-30  285  	rows = numrow(mtr);
88a242c9874044 Qiuxu Zhuo 2019-01-30  286  	cols = numcol(mtr);
88a242c9874044 Qiuxu Zhuo 2019-01-30  287  
88a242c9874044 Qiuxu Zhuo 2019-01-30  288  	/*
88a242c9874044 Qiuxu Zhuo 2019-01-30  289  	 * Compute size in 8-byte (2^3) words, then shift to MiB (2^20)
88a242c9874044 Qiuxu Zhuo 2019-01-30  290  	 */
88a242c9874044 Qiuxu Zhuo 2019-01-30  291  	size = ((1ull << (rows + cols + ranks)) * banks) >> (20 - 3);
88a242c9874044 Qiuxu Zhuo 2019-01-30  292  	npages = MiB_TO_PAGES(size);
88a242c9874044 Qiuxu Zhuo 2019-01-30  293  
88a242c9874044 Qiuxu Zhuo 2019-01-30  294  	edac_dbg(0, "mc#%d: channel %d, dimm %d, %lld MiB (%d pages) bank: %d, rank: %d, row: 0x%x, col: 0x%x\n",
88a242c9874044 Qiuxu Zhuo 2019-01-30  295  		 imc->mc, chan, dimmno, size, npages,
88a242c9874044 Qiuxu Zhuo 2019-01-30  296  		 banks, 1 << ranks, rows, cols);
88a242c9874044 Qiuxu Zhuo 2019-01-30  297  
88a242c9874044 Qiuxu Zhuo 2019-01-30  298  	imc->chan[chan].dimms[dimmno].close_pg = GET_BITFIELD(mtr, 0, 0);
88a242c9874044 Qiuxu Zhuo 2019-01-30  299  	imc->chan[chan].dimms[dimmno].bank_xor_enable = GET_BITFIELD(mtr, 9, 9);
88a242c9874044 Qiuxu Zhuo 2019-01-30  300  	imc->chan[chan].dimms[dimmno].fine_grain_bank = GET_BITFIELD(amap, 0, 0);
88a242c9874044 Qiuxu Zhuo 2019-01-30  301  	imc->chan[chan].dimms[dimmno].rowbits = rows;
88a242c9874044 Qiuxu Zhuo 2019-01-30  302  	imc->chan[chan].dimms[dimmno].colbits = cols;
88a242c9874044 Qiuxu Zhuo 2019-01-30  303  
88a242c9874044 Qiuxu Zhuo 2019-01-30  304  	dimm->nr_pages = npages;
88a242c9874044 Qiuxu Zhuo 2019-01-30  305  	dimm->grain = 32;
88a242c9874044 Qiuxu Zhuo 2019-01-30  306  	dimm->dtype = get_width(mtr);
88a242c9874044 Qiuxu Zhuo 2019-01-30  307  	dimm->mtype = MEM_DDR4;
88a242c9874044 Qiuxu Zhuo 2019-01-30  308  	dimm->edac_mode = EDAC_SECDED; /* likely better than this */
88a242c9874044 Qiuxu Zhuo 2019-01-30 @309  	snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
88a242c9874044 Qiuxu Zhuo 2019-01-30  310  		 imc->src_id, imc->lmc, chan, dimmno);
88a242c9874044 Qiuxu Zhuo 2019-01-30  311  
88a242c9874044 Qiuxu Zhuo 2019-01-30  312  	return 1;
88a242c9874044 Qiuxu Zhuo 2019-01-30  313  }
88a242c9874044 Qiuxu Zhuo 2019-01-30  314  

:::::: The code at line 309 was first introduced by commit
:::::: 88a242c9874044740ab990d4fccba8bb90cb924b EDAC, skx_common: Separate common code out from skx_edac

:::::: TO: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
