Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A917B28374
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 03:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708484402; cv=none; b=a6r2b3EHRpjdHDT2VEvPhDELyrsI/UMzKW4ojDg/ox1JQuFc8FRqecqzaGu4Y+jHqnavQd6RU1RA3TNSCyM3dJWI2jL+MQcizc1YkibRtt6L49ccjpr7eyrHvKZ91VeZnyCCDfafxgBuUlWlBrPhe2ftmHC0vLnLhP3hOnSgNPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708484402; c=relaxed/simple;
	bh=4W/JdCM5vs89rRnxouGwyeWSpgY7NwYJRL8SmfvRR1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BzX6cFqnQck0QDGknsI7PuJpdjjT3RECpP/S4EAiR26ZLxhsisTaumuq5VXQVf6vuV+G7/zpEqOfJlPhJF9mjq6EqInNWOqvbtYK3PUJM9HkL4+Z6VjBohQDA3nzphL1GqAbMkXe2z/dHFr9UVXUrxEPtpUGR/CXoAZ/n9E1c+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUdIwkGW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUdIwkGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708484401; x=1740020401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4W/JdCM5vs89rRnxouGwyeWSpgY7NwYJRL8SmfvRR1A=;
  b=FUdIwkGWnrw858gEC8oxR98+W6/eTNbCOG/n6mftlzPiHKbFvdZvsRJP
   zz9l1Sn2SN6HQLu/w1Z4FtpyI7AePr/s6LsqPeMFhXHM9v8XUWa05QNnI
   aoZBqkD7T+tGg/dgKEDgBkJr8oK7Db1DeVDZwbIdt07yG5I69ieqhL34n
   0KPeZWltFlSACevECENmF1YEz3HkgQxDXCHnK/ladyiuFd4zwWpHpKbcJ
   izJiE115m1bSy2lu0wPfOLj26jp8QTObvOSw8QGEQlF9UwE2gniKv5uTu
   S3pWDN4b4IrjLLuKZizIIkvELUy/7y8JVaYP1u+6O9ZEfX28Fbo9PgunM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2495398"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2495398"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 19:00:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9633968"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Feb 2024 18:59:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rccpD-0004xY-1n;
	Wed, 21 Feb 2024 02:59:28 +0000
Date: Wed, 21 Feb 2024 10:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v5 16/16] mm/zsmalloc.c:223:28: error:
 variably modified 'size_class' at file scope
Message-ID: <202402211005.jOOBuUGc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v5
head:   0cc3d2ea8faa59cc6406f95460e42ae5987ee35b
commit: 0cc3d2ea8faa59cc6406f95460e42ae5987ee35b [16/16] x86/startup_64: Drop global variables keeping track of LA57 state
config: x86_64-buildonly-randconfig-003-20240220 (https://download.01.org/0day-ci/archive/20240221/202402211005.jOOBuUGc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402211005.jOOBuUGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402211005.jOOBuUGc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/zsmalloc.c:223:28: error: variably modified 'size_class' at file scope
     223 |         struct size_class *size_class[ZS_SIZE_CLASSES];
         |                            ^~~~~~~~~~


vim +/size_class +223 mm/zsmalloc.c

0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  219  
0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  220  struct zs_pool {
6f3526d6db7cbe mm/zsmalloc.c                            Sergey SENOZHATSKY 2015-11-06  221  	const char *name;
0f050d997e275c mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  222  
cf8e0fedf0784e mm/zsmalloc.c                            Jerome Marchand    2017-07-10 @223  	struct size_class *size_class[ZS_SIZE_CLASSES];
2e40e163a25af3 mm/zsmalloc.c                            Minchan Kim        2015-04-15  224  	struct kmem_cache *handle_cachep;
3783689a1aa82e mm/zsmalloc.c                            Minchan Kim        2016-07-26  225  	struct kmem_cache *zspage_cachep;
0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  226  
13de8933c96b45 mm/zsmalloc.c                            Minchan Kim        2014-10-09  227  	atomic_long_t pages_allocated;
0f050d997e275c mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  228  
7d3f3938236b4b mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  229  	struct zs_pool_stats stats;
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  230  
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  231  	/* Compact classes */
c19b548b493455 mm/zsmalloc.c                            Qi Zheng           2023-09-11  232  	struct shrinker *shrinker;
93144ca35041b0 mm/zsmalloc.c                            Aliaksei Karaliou  2018-01-31  233  

:::::: The code at line 223 was first introduced by commit
:::::: cf8e0fedf0784ef4bc1889380b09eda295e3d109 mm/zsmalloc: simplify zs_max_alloc_size handling

:::::: TO: Jerome Marchand <jmarchan@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
