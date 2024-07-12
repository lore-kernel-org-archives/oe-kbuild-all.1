Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17032E3E5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772478; cv=none; b=iCiRdULFZRGOpiMA5R8LVibOL4QVU31MgipJuNVewuqKckwNPLYoH1e6fBnfBvFBRQTvz77TDN0fshw8wFbMNeqQovwX5CEgj2TBVgMU7CecZdvVtJYBSI/+d2SnjsmWRaEWIxMVVg0HKBhx5eOCBL0D30FIC4VUwuTThxl6fYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772478; c=relaxed/simple;
	bh=RIaGVT6ur29bXRyn4Lb1OBIQcBF9J8UCksJiz693FlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e7lRJRYMKjbIFLBPBLOjyPG+GKFwLd4dSWw80Bz9UqZ2YtkOvJWoMXUk/Rn3AbNWLyiRncCCGLibyphP59ZRFmM8M/qBSXt9qiC4h+oucypm08by+hAqnSzvifMMSsNXWjVQRIUcoUcwjVfTTjaAPAg54b1CLEjvtG0KQRgZIDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a94Q4oOm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a94Q4oOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720772477; x=1752308477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RIaGVT6ur29bXRyn4Lb1OBIQcBF9J8UCksJiz693FlM=;
  b=a94Q4oOmx68WXSB9DBpo38jeAr/LPjmfCk1xkkoqzYO/8237hPSMu6h8
   Xnf05PQOxLkzVpGVKr+Ca9lB0MuAEJlYKd/N444uBjmedr5NUpKDQucSz
   0vUaRVR9XRQSTXLYdijuDSSnpK1vJ8c+2+D+Ke3TsBNCYTzaRR/V+a0ex
   ivzVoDBLHZ2GhUX+9EQ67gFBMNTJysPmlvEcU2RJ629qwSUpM/MpBxTwQ
   XbfAZfhxR/581Qbfbk3CyuwbFrlWBx/CbwXggmIWY0dX5y5vEJKZXeJZH
   51BLKd9zzwpHhChVg7MTINyeV3iCausTbKB5zqJS9bolOfdwN+mDXYSVE
   A==;
X-CSE-ConnectionGUID: r3hUcfrmSRaeAmenQxSF5w==
X-CSE-MsgGUID: 4rQvymjgQDWXObHHDhWhjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="22018807"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="22018807"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 01:21:16 -0700
X-CSE-ConnectionGUID: cLl0d0+PTpaBfUo8cP/QQw==
X-CSE-MsgGUID: 4sbqSBeNTymLuz/zoxwmnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="48941739"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jul 2024 01:21:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSBWi-000aXM-2t;
	Fri, 12 Jul 2024 08:21:12 +0000
Date: Fri, 12 Jul 2024 16:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 29/29] fs/locks.c:1533:39: error: 'struct
 file_lock_core' has no member named 'fl_file'; did you mean 'flc_file'?
Message-ID: <202407121659.Mn4FGP4P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   1a45dc4f22747fa6674e3d7d4056900a712a88fd
commit: 1a45dc4f22747fa6674e3d7d4056900a712a88fd [29/29] fs: add support for ignoring deleg breaks for dir change events
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240712/202407121659.Mn4FGP4P-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121659.Mn4FGP4P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121659.Mn4FGP4P-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/stat.h:7,
                    from include/linux/fs.h:10,
                    from include/linux/fdtable.h:16,
                    from fs/locks.c:53:
   fs/locks.c: In function 'ignore_dir_deleg_break':
>> fs/locks.c:1533:39: error: 'struct file_lock_core' has no member named 'fl_file'; did you mean 'flc_file'?
    1533 |         if (!S_ISDIR(file_inode(fl->c.fl_file)->i_mode))
         |                                       ^~~~~~~
   include/uapi/linux/stat.h:23:28: note: in definition of macro 'S_ISDIR'
      23 | #define S_ISDIR(m)      (((m) & S_IFMT) == S_IFDIR)
         |                            ^
>> fs/locks.c:1536:56: error: 'struct file_lock_core' has no member named 'fl_flags'; did you mean 'flc_flags'?
    1536 |         if ((flags & LEASE_BREAK_DIR_CREATE) && (fl->c.fl_flags & FL_IGN_DIR_CREATE))
         |                                                        ^~~~~~~~
         |                                                        flc_flags
   fs/locks.c:1538:56: error: 'struct file_lock_core' has no member named 'fl_flags'; did you mean 'flc_flags'?
    1538 |         if ((flags & LEASE_BREAK_DIR_DELETE) && (fl->c.fl_flags & FL_IGN_DIR_DELETE))
         |                                                        ^~~~~~~~
         |                                                        flc_flags
   fs/locks.c:1540:56: error: 'struct file_lock_core' has no member named 'fl_flags'; did you mean 'flc_flags'?
    1540 |         if ((flags & LEASE_BREAK_DIR_RENAME) && (fl->c.fl_flags & FL_IGN_DIR_RENAME))
         |                                                        ^~~~~~~~
         |                                                        flc_flags


vim +1533 fs/locks.c

  1528	
  1529	static bool
  1530	ignore_dir_deleg_break(struct file_lease *fl, unsigned int flags)
  1531	{
  1532		/* Not a directory inode? */
> 1533		if (!S_ISDIR(file_inode(fl->c.fl_file)->i_mode))
  1534			return false;
  1535	
> 1536		if ((flags & LEASE_BREAK_DIR_CREATE) && (fl->c.fl_flags & FL_IGN_DIR_CREATE))
  1537			return true;
  1538		if ((flags & LEASE_BREAK_DIR_DELETE) && (fl->c.fl_flags & FL_IGN_DIR_DELETE))
  1539			return true;
  1540		if ((flags & LEASE_BREAK_DIR_RENAME) && (fl->c.fl_flags & FL_IGN_DIR_RENAME))
  1541			return true;
  1542	
  1543		return false;
  1544	}
  1545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
