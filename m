Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC61FEC5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 05:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892468; cv=none; b=stFa2bTSnT3WGpXqA5iy3kiZVmaQMkouHyZB7j1bjP3K1rTJVBumF6N0TKsZ3xm0BE8PKBi/C5UKcMckHNmCr9CjYSVNTpVUqPZrAFnV+ffib0zqstHoFn7mQd9fadcQ5vsSjlHCuKRD6APZOlBWiGcsf0ea77IvtBwvH0iXmLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892468; c=relaxed/simple;
	bh=uG9XMpUDeIpqSA2H5uqVUQ+Y6bmQehAySFUIG/gc3Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tPhVIzlP2Bdp13fTChncx9GZBbdZ4B5Mmdu88rR6yCHHb2HhVzUjb1/ovbgg5vlJ7B9KcpQDNIdslEDC3AApRhvxivCRRsJnuQpWcSUOuH2mqak92nsbQCWy1ERRALJ6+ismqcmapE4GgUkBE2qnR1BhMUabOt5kOOB+OcX2nJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lU9VjAZl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lU9VjAZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747892467; x=1779428467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uG9XMpUDeIpqSA2H5uqVUQ+Y6bmQehAySFUIG/gc3Mo=;
  b=lU9VjAZlMDhdZPsjcHrkaW7MZoU6IkRD5+Luf8p/wrmZ7WDe3njXtWQU
   Fv9EXMzwNs/5fUPjWqIRkOgJj2Bl1aBqqCdKikE60iFgMKN0UKY6yiJN6
   g3kghujq0lOLY5LK3j+PnlNUN87Q+VmpRFsYNgGOYDqzAnxdB09ASrD2a
   1HxbDFbWFZAG54F4dUQQjN0wVb98rjSN0RnWOs3RkckKrLhnjuST6XP/O
   KG+pFFHIeo/raYksrpeDZ6Thcpwlxh8NZl8IqW1RiXtOFgeVrKm+Z85M3
   ral04f+SHKKJAblTKyx8fSgLHnpAQs9TtJcStW2h8y/LHicWVFn16vRV9
   g==;
X-CSE-ConnectionGUID: Z/Et/vHXQdK44NEP7r9CeA==
X-CSE-MsgGUID: q7gFSOjiQeCA8n6cszSBmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61243487"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="61243487"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 22:41:05 -0700
X-CSE-ConnectionGUID: xMtLU5OoSCeVWcG5SsLftQ==
X-CSE-MsgGUID: UjgfsdaJTnS6zaxLdoBQuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="145681069"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 May 2025 22:41:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHyft-000OxA-39;
	Thu, 22 May 2025 05:41:01 +0000
Date: Thu, 22 May 2025 13:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap 40/43] aarch64-linux-ld:
 fs/fuse/file_iomap.c:894: undefined reference to `iomap_ioend_try_merge'
Message-ID: <202505221345.c8YT7bQx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap
head:   5b397601da90a62bdc9e22c480dee2381a16ec90
commit: a5943cfcd1cd6371b483c2a22bfd8276e0d07895 [40/43] fuse: implement buffered IO with iomap
config: arm64-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221345.c8YT7bQx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221345.c8YT7bQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221345.c8YT7bQx-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_readahead':
   fs/fuse/file_iomap.c:1051: undefined reference to `iomap_readahead'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_writepages':
   fs/fuse/file_iomap.c:1032: undefined reference to `iomap_writepages'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_submit_ioend':
   fs/fuse/file_iomap.c:981: undefined reference to `submit_bio'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_read_folio':
   fs/fuse/file_iomap.c:1042: undefined reference to `iomap_read_folio'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_bdev.isra.51':
   fs/fuse/file_iomap.c:164: undefined reference to `I_BDEV'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_page_mkwrite':
   fs/fuse/file_iomap.c:1118: undefined reference to `iomap_page_mkwrite'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_write_checks':
   fs/fuse/file_iomap.c:669: undefined reference to `iomap_zero_range'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_end_io':
   fs/fuse/file_iomap.c:890: undefined reference to `iomap_sort_ioends'
>> aarch64-linux-ld: fs/fuse/file_iomap.c:894: undefined reference to `iomap_ioend_try_merge'
>> aarch64-linux-ld: fs/fuse/file_iomap.c:838: undefined reference to `blk_status_to_errno'
>> aarch64-linux-ld: fs/fuse/file_iomap.c:860: undefined reference to `iomap_finish_ioends'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_fiemap':
   fs/fuse/file_iomap.c:486: undefined reference to `iomap_fiemap'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_bmap':
   fs/fuse/file_iomap.c:497: undefined reference to `iomap_bmap'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_lseek':
   fs/fuse/file_iomap.c:517: undefined reference to `iomap_seek_hole'
   aarch64-linux-ld: fs/fuse/file_iomap.c:520: undefined reference to `iomap_seek_data'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_direct_read':
   fs/fuse/file_iomap.c:593: undefined reference to `iomap_dio_rw'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_direct_write':
   fs/fuse/file_iomap.c:809: undefined reference to `iomap_dio_rw'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_buffered_write':
   fs/fuse/file_iomap.c:1188: undefined reference to `iomap_file_buffered_write'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_setsize':
   fs/fuse/file_iomap.c:669: undefined reference to `iomap_zero_range'
>> aarch64-linux-ld: fs/fuse/file_iomap.c:1211: undefined reference to `iomap_truncate_page'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_fallocate':
   fs/fuse/file_iomap.c:669: undefined reference to `iomap_zero_range'
>> aarch64-linux-ld: fs/fuse/file_iomap.o:(.rodata+0x60): undefined reference to `iomap_dirty_folio'
>> aarch64-linux-ld: fs/fuse/file_iomap.o:(.rodata+0x88): undefined reference to `iomap_invalidate_folio'
>> aarch64-linux-ld: fs/fuse/file_iomap.o:(.rodata+0x90): undefined reference to `iomap_release_folio'
>> aarch64-linux-ld: fs/fuse/file_iomap.o:(.rodata+0xb8): undefined reference to `iomap_is_partially_uptodate'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
