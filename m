Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA6C246BA9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 20:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848122; cv=none; b=cEMR3dZ1GqU5DFMgp3eqbdQY6WGxeTKuJb1yhhIBwUQCda4yDar/rXfuXf0LEhGqsUuSMhMvklAtnBAgR12MAnadbe8GPO+psMEV/ZXwlkAoVSebKLMN3aBe0vkj7ShUgNviVPT3mxgmexat1FxyXlzIbB0Enk2GaEY6bOQvWXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848122; c=relaxed/simple;
	bh=ljy+vFFThIuU1sTaYz0h0GPGQHxyvwFSg2txYg+5Ddo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pJhQT+IdLSXPOeE7jEoxXgytyCpOJXgFHL4w1sx6a8MzGcuHcXdlBpvLQf2HXnA2AvpnIr4tQRh80sptwS+58VpCkFPImUhotENZcpL8hDTebgSQNeeIwgFV+X0wASIMlIeGZA7bYTo33ZXczTY/pWjgJaykGoVfxwEkcYRB61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWF+kqJb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWF+kqJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749848120; x=1781384120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ljy+vFFThIuU1sTaYz0h0GPGQHxyvwFSg2txYg+5Ddo=;
  b=kWF+kqJbzgdMs1MCXbd3BnkqeqBUugkGgHkqlAC2DsjvDMHuPqLi7JsB
   5yc3JM2CI4r46EcLw+iJfNrsuoVo1W26eeIeGKEI9W8Y0bmk4CxyTPwBh
   R0Kir0fZvrNSN9DvtbziAkptri0WSdrSr48A7KcWW1QZzHe/0Gi4lScdr
   5/bhTb/FgnrJHjR0vkmDhvNx5xmWlHnjr3WQ1okK5+1eZGZn3ymhG1X/f
   wbYMg7y/uKqQA917gInunmiMD3kfbJk5114V03tKy0WB3bQWcIYOqwUxw
   C+yYkm0BZxjBB5nsHlMongAhbVkZ+KNAlWDMEdBC4q7hBu6Rcj/u+tiGu
   Q==;
X-CSE-ConnectionGUID: qa0Kw6SqRFqG0gc30q6n1Q==
X-CSE-MsgGUID: O/5589AhSYeisf8OlWlw1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="62723211"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="62723211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 13:55:18 -0700
X-CSE-ConnectionGUID: IeFVnbSOS1SVddjP11/sQA==
X-CSE-MsgGUID: kwpsIaW9SjC9/45X4n7FOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148463677"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2025 13:55:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQBQg-000Czw-1z;
	Fri, 13 Jun 2025 20:55:14 +0000
Date: Sat, 14 Jun 2025 04:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-cache 43/45] fs/fuse/file_iomap.c:1992:6:
 warning: variable 'map_end' is used uninitialized whenever '&&' condition is
 false
Message-ID: <202506140433.J1NCUuEI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-cache
head:   62857bad704590b8ed2cc579b4a859b953b93d5f
commit: 7954c15726a337e560ff0506896f2095e111cec9 [43/45] fuse: enable iomap cache management
config: i386-buildonly-randconfig-001-20250614 (https://download.01.org/0day-ci/archive/20250614/202506140433.J1NCUuEI-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140433.J1NCUuEI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140433.J1NCUuEI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/file_iomap.c:140:30: warning: expression result unused [-Wunused-value]
     140 |                 BAD_DATA(outarg->read_type == FUSE_IOMAP_TYPE_PURE_OVERWRITE);
         |                          ~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/iomap_cache.h:14:31: note: expanded from macro 'BAD_DATA'
      14 | # define BAD_DATA(condition)    (condition)
         |                                  ^~~~~~~~~
   fs/fuse/file_iomap.c:1664:16: warning: unused variable 'inode' [-Wunused-variable]
    1664 |         struct inode *inode = file_inode(file);
         |                       ^~~~~
>> fs/fuse/file_iomap.c:1992:6: warning: variable 'map_end' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    1992 |         if (map_addr != FUSE_IOMAP_NULL_ADDR &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/file_iomap.c:1997:15: note: uninitialized use occurs here
    1997 |         if (BAD_DATA(map_end > device_bytes))
         |                      ^~~~~~~
   fs/fuse/iomap_cache.h:14:31: note: expanded from macro 'BAD_DATA'
      14 | # define BAD_DATA(condition)    (condition)
         |                                  ^~~~~~~~~
   fs/fuse/file_iomap.c:1992:6: note: remove the '&&' if its condition is always true
    1992 |         if (map_addr != FUSE_IOMAP_NULL_ADDR &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/file_iomap.c:1986:20: note: initialize the variable 'map_end' to silence this warning
    1986 |         uint64_t                        map_end;
         |                                                ^
         |                                                 = 0
   fs/fuse/file_iomap.c:2039:30: warning: expression result unused [-Wunused-value]
    2039 |                 BAD_DATA(outarg->read_type == FUSE_IOMAP_TYPE_PURE_OVERWRITE);
         |                          ~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/iomap_cache.h:14:31: note: expanded from macro 'BAD_DATA'
      14 | # define BAD_DATA(condition)    (condition)
         |                                  ^~~~~~~~~
   4 warnings generated.


vim +1992 fs/fuse/file_iomap.c

  1978	
  1979	static inline int
  1980	fuse_iomap_upsert_validate_dev(
  1981		const struct fuse_iomap_dev	*fb,
  1982		uint16_t			map_type,
  1983		uint64_t			map_addr,
  1984		uint64_t			map_length)
  1985	{
  1986		uint64_t			map_end;
  1987		sector_t			device_bytes;
  1988	
  1989		if (!fb)
  1990			return 0;
  1991	
> 1992		if (map_addr != FUSE_IOMAP_NULL_ADDR &&
  1993		    BAD_DATA(check_add_overflow(map_addr, map_length, &map_end)))
  1994			return -EIO;
  1995	
  1996		device_bytes = bdev_nr_sectors(fb->bdev) << SECTOR_SHIFT;
  1997		if (BAD_DATA(map_end > device_bytes))
  1998			return -EIO;
  1999	
  2000		return 0;
  2001	}
  2002	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
