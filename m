Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374222ED872
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 04:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784350078; cv=none; b=Je9jFg58CYH+rgRKhkmiAJghAfuRTIoQUHe41beFFHAf2BaYfV5rZHJ6B1DyMxaSwP861LeDvklry3mj85E25eX8dav9YIXdFR5wAtnE+7bzn6vPcNQC/VApapGPxkPGVP6joobkv8DCqDNdiXs6InoqD3uVJOmSCLybtxFl9AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784350078; c=relaxed/simple;
	bh=Ybt/BIoALXePVQH/SDIS8yLonHqMXbWIWtH48Rw/9oE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NEr//uq2D4uVBIwC6ZhCNGGmr5usuLiXAfy+pq0n7OomOUYwfG2pDf3jnHdIqL/I5g1uIRP/sBTKXmB8cXGVLJ3arpcmx1vIp9GwItC/tE+d0F60QqEEurnogIQxIy79jQjQK7kQB9osAbvEe/VNB8IrhYcS/pJLUBTKiKYpMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKhZNI5E; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKhZNI5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784350076; x=1815886076;
  h=date:from:to:cc:subject:message-id;
  bh=Ybt/BIoALXePVQH/SDIS8yLonHqMXbWIWtH48Rw/9oE=;
  b=SKhZNI5Edl+0jtKyBkXgHFgg7a1709NWEXfqAbAEeeSV/VTutCaGJxQ0
   JnEoAyjljbHG6erShkvg2OrRa41XyE4j73pOpd53iPt1wDwZvv/VAdKf7
   8JRwtZfK3m+sswYi0VYVe5VMve9m1yEUP0V9Arv3kHMY5wf7CPQlVeKN1
   O06UQRZl+lQmSMjE31NFxa9M7XzUB5zt71zD6B+uE1FnUYi4bZbUZtwEp
   qHPHdKw2KXyM6XcCPiUbui70ZMPEmczv8wTZLtpwGQiIjnaUWWKJdz/r8
   5ZbuyKxWCOPSAMYzwFiyaIUzKwBKf4J/J+Fx3TlFBARGxrB1IezmlWSKN
   Q==;
X-CSE-ConnectionGUID: m4Kal5/7R9uoa44XsykRaQ==
X-CSE-MsgGUID: 0GKmWjM7RTWIwE6ztNQsDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85106923"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85106923"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 21:47:56 -0700
X-CSE-ConnectionGUID: 6GjfSOqATCyK5x22pdC2Dg==
X-CSE-MsgGUID: xq6GIMShTheJh3KS+AevMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="260522821"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 17 Jul 2026 21:47:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkwxs-00000000TSZ-0GEm;
	Sat, 18 Jul 2026 04:47:52 +0000
Date: Sat, 18 Jul 2026 12:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 27/51] ERROR: modpost:
 "fs_bio_integrity_generate" [fs/xfs/xfs.ko] undefined!
Message-ID: <202607181237.pqxBGjj8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   ef3d55d014b3a800421b9dae3ac182577bfe2bd7
commit: 060cd4fc3e0ee8658637b42ee0399c773887a251 [27/51] xfs: move PI generation into xfs_zone_alloc_and_submit
config: um-randconfig-001-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181237.pqxBGjj8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181237.pqxBGjj8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181237.pqxBGjj8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fs_bio_integrity_generate" [fs/xfs/xfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
