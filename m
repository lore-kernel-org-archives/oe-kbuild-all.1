Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250CA2627E2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233461; cv=none; b=CJYNnP4Rg074D2hofX9djcMTvfCl57rdTsStEQ3zmZO79LIYR5rbr1bfBzKaFTZnzoGiq4riqAiy7wybFWDgrZIJBES67OJt2gmqzE8tH3NTPiYg60lMmiTYhwj5/Unrx0Z4BBkw7afJaCkdQOHE5n6/FyUoysHO/dOKna2Inww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233461; c=relaxed/simple;
	bh=jQrfcg7YeIUfEcWw8JqnyZF7N70AQhzquuoxZIddlsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e4KHJbXkY8FRlo9aLSGP9+3iJbGPj5h3rD6nkRz2b6jwZBlJUpMb0W3lWE/dyg5j2iiUv0DnntC0Jz9CV+RSj1TkoyR5ibMo2EbCchXOfR3mXN89G/oswQTilE4r8lDsFSk3AS+5GeNtx92etKgq/RbYeNPJm+DWZ1WU+vz5Fho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcu+zYBm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcu+zYBm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745233460; x=1776769460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jQrfcg7YeIUfEcWw8JqnyZF7N70AQhzquuoxZIddlsI=;
  b=bcu+zYBmTFdMF+7qsCmp+DgU2B7K9RGCHWr0FQHXsvaApXJBJQCQpOMX
   /yh5gyENWSj8vVpeNR2oHZZcIxzA7Jl+nlq87eCoUB+j3wEY3Ob92FECx
   hIYPRZ5xkZCQRe1AwFhPW57xw2t5XMfRLtvhEuesHCK4M33Uat02Z0XU7
   KR5062i15b30oJ1K08V4VjtLsq9X8W/SgpaV4SX/MREmKheBnY9zmtgcq
   cr3+26QYDLOAafnW+OZfW1+V094/1eAg9qHCsMLpw3lq5QwD9mSxqJVHR
   4uIRwCfxAicGCUH/7LQAgAXr0uP4kn83c6ZirP8kr7TW6rCB3JOuWgxmG
   A==;
X-CSE-ConnectionGUID: MNikIkVdS3ygCmGtfdIjTw==
X-CSE-MsgGUID: vzCObZOuT+mYHoQPZRgSsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46864175"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="46864175"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 04:04:19 -0700
X-CSE-ConnectionGUID: Zzoud9PgQDeQ2UY0swq0Ow==
X-CSE-MsgGUID: vc3OS+f5TSupI9mj36fETA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="154864218"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Apr 2025 04:04:17 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6owh-00004C-07;
	Mon, 21 Apr 2025 11:04:15 +0000
Date: Mon, 21 Apr 2025 19:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs-6.16.misc 18/18] mm/readahead.c:703:37: error:
 'fd_file' undeclared
Message-ID: <202504211926.NueGiuPM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.16.misc
head:   ac6355451deea7f96f5ca40a226fb0685b0475af
commit: ac6355451deea7f96f5ca40a226fb0685b0475af [18/18] fs: add S_ANON_INODE
config: arc-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211926.NueGiuPM-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504211926.NueGiuPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211926.NueGiuPM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from mm/readahead.c:116:
   mm/readahead.c: In function 'ksys_readahead':
>> mm/readahead.c:703:37: error: 'fd_file' undeclared (first use in this function)
     703 |         if (IS_ANON_FILE(file_inode(fd_file)))
         |                                     ^~~~~~~
   include/linux/fs.h:2404:35: note: in definition of macro 'IS_ANON_FILE'
    2404 | #define IS_ANON_FILE(inode)     ((inode)->i_flags & S_ANON_INODE)
         |                                   ^~~~~
   mm/readahead.c:703:37: note: each undeclared identifier is reported only once for each function it appears in
     703 |         if (IS_ANON_FILE(file_inode(fd_file)))
         |                                     ^~~~~~~
   include/linux/fs.h:2404:35: note: in definition of macro 'IS_ANON_FILE'
    2404 | #define IS_ANON_FILE(inode)     ((inode)->i_flags & S_ANON_INODE)
         |                                   ^~~~~


vim +/fd_file +703 mm/readahead.c

   690	
   691	ssize_t ksys_readahead(int fd, loff_t offset, size_t count)
   692	{
   693		CLASS(fd, f)(fd);
   694	
   695		if (fd_empty(f) || !(fd_file(f)->f_mode & FMODE_READ))
   696			return -EBADF;
   697	
   698		/*
   699		 * The readahead() syscall is intended to run only on files
   700		 * that can execute readahead. If readahead is not possible
   701		 * on this file, then we must return -EINVAL.
   702		 */
 > 703		if (IS_ANON_FILE(file_inode(fd_file)))
   704			return -EINVAL;
   705		if (!fd_file(f)->f_mapping || !fd_file(f)->f_mapping->a_ops ||
   706		    (!S_ISREG(file_inode(fd_file(f))->i_mode) &&
   707		    !S_ISBLK(file_inode(fd_file(f))->i_mode)))
   708			return -EINVAL;
   709	
   710		return vfs_fadvise(fd_file(f), offset, count, POSIX_FADV_WILLNEED);
   711	}
   712	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
