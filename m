Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3370A441F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 07:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709881845; cv=none; b=CguGLjyO2UvUCmKlyQc/YFnHKBkDlpRkJNpFw8rvXyB7wCuAflw9AM1Sa3guc3GBPIUOZAavnHsX7ynII7aa6p5UjucKYfilpof22GBZl3bfGyP2Ix7AKMSXTKTWvPapGgvLK+EcGZuQ8Z8QK1B2XCCy0TMM+KNz9neTMCkoq3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709881845; c=relaxed/simple;
	bh=SMTq/D3JyalrHDpUeYMVKb9A5mJ+m926CcQMF8jy/fA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hteF8+THRZiaOAh9VGR3REe4N2SkIRb5355wzxuGFz+jFfOIMsSnqS1iQjynl/gVUUuDhxeLIJqSe/4iH1NnRj90Vl5KPDd5ZdMEM22SegVvv4D7JiANQI4z13/7vCPFTmznbLvSRaK4WJWeyRh53omyxJWNOOvtrtO9UIBVLkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HF/5iKib; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HF/5iKib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709881843; x=1741417843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SMTq/D3JyalrHDpUeYMVKb9A5mJ+m926CcQMF8jy/fA=;
  b=HF/5iKibJuQtQi+cGhQUGzSS609U+7BeFhmH13iqD3t/jWvpJWWQMnoP
   hcvtVZQ2gs/2skxIdxNGfBBxbYXg1g+C74wsPz7fDX6i9o7Z9CXhD8uGj
   urDMmr+EXRnQYCevWdkeDAMfw97Ob20x2JHuifospnwPMS1TJPWqLDJx7
   i3pBcl61u5pBOGGsXgefVe0/zmUYhxUE0DuI/V/cmFeAF9HaX6gvR29eo
   BLg4Q/Fp47Vj5i3Hv29nLn4UQGmDtie0BAV+e8YAJMRMDoYnnt11rNAc0
   61syWG33iGQzothTnNYkcrua3WhiKMG8Sqxx5BE8qApyWJjK8n/ncrhcY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4715485"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4715485"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 23:10:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="10264717"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Mar 2024 23:10:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riUNL-00068X-27;
	Fri, 08 Mar 2024 07:10:39 +0000
Date: Fri, 8 Mar 2024 15:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:ext2-iomap-lsfmm-rfcv2 2/4] fs/ext2/inode.c:1000:39:
 sparse: sparse: symbol 'ext2_file_aops' was not declared. Should it be
 static?
Message-ID: <202403081521.KXt3OtcM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux ext2-iomap-lsfmm-rfcv2
head:   affbcaa016e8585df838f393aa80029b8f195e38
commit: 44544ffe4db115b2fbd8d029ff447daea860c2d1 [2/4] ext2: Convert ext2 regular file buffered I/O to use iomap
config: x86_64-randconfig-123-20240308 (https://download.01.org/0day-ci/archive/20240308/202403081521.KXt3OtcM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081521.KXt3OtcM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081521.KXt3OtcM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ext2/inode.c:1000:39: sparse: sparse: symbol 'ext2_file_aops' was not declared. Should it be static?

vim +/ext2_file_aops +1000 fs/ext2/inode.c

   999	
> 1000	const struct address_space_operations ext2_file_aops = {
  1001		.dirty_folio		= iomap_dirty_folio,
  1002		.release_folio 		= iomap_release_folio,
  1003		.invalidate_folio	= iomap_invalidate_folio,
  1004		.read_folio		= ext2_file_read_folio,
  1005		.readahead		= ext2_file_readahead,
  1006		.bmap			= ext2_file_bmap,
  1007		.direct_IO		= noop_direct_IO,
  1008		.writepages		= ext2_file_writepages,
  1009		.migrate_folio		= filemap_migrate_folio,
  1010		.is_partially_uptodate	= iomap_is_partially_uptodate,
  1011		.error_remove_folio	= generic_error_remove_folio,
  1012	};
  1013	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
