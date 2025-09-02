Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE5C35962
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 03:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756784795; cv=none; b=i9/bTAfhhM85RGEYvSWGBdGXugJvWhGq3rkny/ehYUixdEIWc/yxPn608wdvxvnXL4+S0QwgtAgWsl7GqiLZ9bSdPOaHgmJJTUYeo0X0Pmi33Q186xBzbhjJ7AZYgn8HQRWDFyyM9bIJQIZi4F8JFnzjSz0BXnxW5MZyV5laK9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756784795; c=relaxed/simple;
	bh=L8EB3nmIfDiHPj/bP+qPk4F85Ij7sdL+Lye9sbTmZUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sx9O7an27B0hdMoLUn1k6CqCbuCrzh2we4WXf50OFGRWiGTEEDVaxMkeMvpmA2Ogbk3ZN9GDvsr6+HBuyRhxjftTSzYrFBxXBV+nbLRAOIewgRqKPaiFK4QMrrZ0/L/LVvcYL5cVbLfJZ1bP5HrwIDf/xLzCyFvVEOAfQx6rP70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGkUWy6x; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGkUWy6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756784793; x=1788320793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L8EB3nmIfDiHPj/bP+qPk4F85Ij7sdL+Lye9sbTmZUw=;
  b=IGkUWy6xvBEiz28k1OYqupmRoAFrn9NNGbpmY/Lg4/9UDSwIhs3SonUh
   FtyF0uwveteeLSDJe8ZyWu/e1Xv6q3zpvAMNeL/eci0zKXqTcf2eINWuV
   ff12dHd6l4HKx7hDUQkfRdMb1kFrFnlTUE4zeSf9oqe8aKlm7NebsXSBJ
   hOWhND/Wh1DsMye2udag0IN+NWU6OgF+1Zx3Z5POT14dybhLriltDbR5U
   9P/wd3hNtVfHkAVuDrpWWpZo1xaptdQTMyH65TzT68LHQ5BvYZ8E8SDgD
   X5P6Nhk3j5RbtKCc96D4NTPsbIpNamVftkW67mX4K5RYQ40eTo/QvNrsh
   w==;
X-CSE-ConnectionGUID: cMR3hvmeQZeHjbWlrP0PKw==
X-CSE-MsgGUID: KkDyLYW4R5CEBzzJNMo1wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="61676236"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="61676236"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 20:46:33 -0700
X-CSE-ConnectionGUID: qdKvuiqVT/WXOQ+pLx2OpA==
X-CSE-MsgGUID: en9ASGD/RQynrSOKC6k+/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170713454"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Sep 2025 20:46:32 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utHyY-0001P8-0L;
	Tue, 02 Sep 2025 03:46:30 +0000
Date: Tue, 2 Sep 2025 11:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 302/349] fs/bcachefs/bcachefs.h:310:29:
 warning: '%s' directive argument is null
Message-ID: <202509021146.bcXRHpxU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ea00c2fe19d282d2563fb11b6548b484ee21d55a
commit: e0bb6ebddb807c9998b963408b7a59c3d3736428 [302/349] bcachefs: v2 versions of subvolume ioctls
config: arc-randconfig-002-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021146.bcXRHpxU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021146.bcXRHpxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021146.bcXRHpxU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/fs-ioctl.c:4:
   fs/bcachefs/fs-ioctl.c: In function 'bch2_ioctl_subvolume_destroy.isra.0':
>> fs/bcachefs/bcachefs.h:310:29: warning: '%s' directive argument is null [-Wformat-overflow=]
     310 | #define bch2_print(_c, ...) __bch2_print(maybe_dev_to_fs(_c), __VA_ARGS__)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs.h:333:2: note: in expansion of macro 'bch2_print'
     333 |  bch2_print(c, loglevel bch2_fmt(c, fmt), ##__VA_ARGS__)
         |  ^~~~~~~~~~
   fs/bcachefs/bcachefs.h:337:27: note: in expansion of macro 'bch_log'
     337 | #define bch_err(c, ...)   bch_log(c, KERN_ERR, __VA_ARGS__)
         |                           ^~~~~~~
   fs/bcachefs/bcachefs.h:385:3: note: in expansion of macro 'bch_err'
     385 |   bch_err(_c, "%s(): error " _msg " %s", __func__, \
         |   ^~~~~~~
   fs/bcachefs/fs-ioctl.c:402:3: note: in expansion of macro 'bch_err_msg'
     402 |   bch_err_msg(c, ret, "%s", err.buf);
         |   ^~~~~~~~~~~
   fs/bcachefs/fs-ioctl.c:402:24: note: format string is defined here
     402 |   bch_err_msg(c, ret, "%s", err.buf);
         |                        ^~


vim +310 fs/bcachefs/bcachefs.h

2b41226d7f4b3b Kent Overstreet 2023-12-04  305  
2b41226d7f4b3b Kent Overstreet 2023-12-04  306  #define maybe_dev_to_fs(_c)	_Generic((_c),				\
2b41226d7f4b3b Kent Overstreet 2023-12-04  307  	struct bch_dev *:	((struct bch_dev *) (_c))->fs,		\
2b41226d7f4b3b Kent Overstreet 2023-12-04  308  	struct bch_fs *:	(_c))
2b41226d7f4b3b Kent Overstreet 2023-12-04  309  
2b41226d7f4b3b Kent Overstreet 2023-12-04 @310  #define bch2_print(_c, ...) __bch2_print(maybe_dev_to_fs(_c), __VA_ARGS__)
2b41226d7f4b3b Kent Overstreet 2023-12-04  311  

:::::: The code at line 310 was first introduced by commit
:::::: 2b41226d7f4b3b836a2a3e4ce08ab18ba03f0cd0 bcachefs: Add ability to redirect log output

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
