Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D49C1C57B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 21:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723844538; cv=none; b=b0/S3encldgaJJW8QWcAp1eY6jN6N6B0J4aIEXUiy83CpLkx5srZtUKe63MQUtYF4+tSlblvOtYGtuwQXZu2+z8C5LlOmxOx92+Ki35i27aJ9KV3i9wx/JhZmB8L9dKMnvKPSALVqBoyxCBB+NAlZdJpO0hDs5Wyxk0LSEdhVYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723844538; c=relaxed/simple;
	bh=HYiO0KROz8rPbNxdthfz2rU8ZLqMEbpXJ1zta6TFf5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qGwiKvHmbdMqK20/gUioWZSjJV7x4lr151YmeqwGDIww1PjE7rlQLURXqnEIZTUadyKZ7HKXl4n22UKrlQQaVG8QBLp7EDVo6Q5ubv6J300TysWShXQKJi+dBRHhV8RnIWJAUscdQFGeJmqTRjBij6fnme7AQYcFLE3TpYsf4R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ef/y+2bW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ef/y+2bW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723844537; x=1755380537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HYiO0KROz8rPbNxdthfz2rU8ZLqMEbpXJ1zta6TFf5g=;
  b=Ef/y+2bWx5nXtf/uLucSZfd5j9f1Gd/cBD9pd/O4vS5KcgDLDferIeah
   qTCaHQv4ndm3epCexqZeBgwrz2zaJuKzrTWYCqyo/S0dt2BudEz/VzJKS
   wqSQ0zunA5Hsha6RT293RHZQECj4Y8rGrvT615RSKUsdDbWwTF2PDGzwb
   jrc/MmEZZ30MZjQiqxvxOWVRy6/StMw33rT4IfIC7C3GomG4MZHu3XvXB
   5FBs8zWqShsusPdbmQ6veA+vpT4gPHR4yh7ZQH4FB6Bky5FSnok80XSEN
   SKHfAc5XHwLVsn8bI9RjgMAdM8QnbKcOf2qmhFmrMI1YcFNm2gjJ83Z7J
   Q==;
X-CSE-ConnectionGUID: 5+LPAhZySDKsnut8roEBlA==
X-CSE-MsgGUID: 32lpUDsIQPCLaX1CqTi6eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32786009"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="32786009"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 14:42:16 -0700
X-CSE-ConnectionGUID: ycnJj4A0T0iXu3hvkjc+UQ==
X-CSE-MsgGUID: 4hVRGEkpRf+Dt56D3DHnqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59433664"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Aug 2024 14:42:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf4i5-0006wy-2p;
	Fri, 16 Aug 2024 21:42:13 +0000
Date: Sat, 17 Aug 2024 05:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 146/253] fs/xfs/scrub/common.h:149:57: error:
 expected expression before 'do'
Message-ID: <202408170546.yCkwtg4d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git hch-wtf
head:   69e65efda7ca3f0b4a7fbf15a350611261769077
commit: 68a3fc8e96db234ec427301f9208643279a3fb71 [146/253] xfs: allow queued realtime intents to drain before scrubbing
config: i386-randconfig-002-20240817 (https://download.01.org/0day-ci/archive/20240817/202408170546.yCkwtg4d-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170546.yCkwtg4d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170546.yCkwtg4d-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/bmap.c: In function 'xchk_bmap_rt_iextent_xref':
   fs/xfs/scrub/bmap.c:320:17: error: implicit declaration of function 'xchk_rtgroup_init_existing'; did you mean 'xchk_ag_init_existing'? [-Werror=implicit-function-declaration]
     320 |         error = xchk_rtgroup_init_existing(info->sc,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 xchk_ag_init_existing
   In file included from fs/xfs/scrub/bmap.c:25:
>> fs/xfs/scrub/common.h:149:57: error: expected expression before 'do'
     149 | # define xchk_rtgroup_lock(sc, sr, lockflags)           do { } while (0)
         |                                                         ^~
   fs/xfs/scrub/bmap.c:327:17: note: in expansion of macro 'xchk_rtgroup_lock'
     327 |         error = xchk_rtgroup_lock(info->sc, &info->sc->sr, XCHK_RTGLOCK_ALL);
         |                 ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/do +149 fs/xfs/scrub/common.h

   143	
   144	int xchk_rtgroup_lock(struct xfs_scrub *sc, struct xchk_rt *sr,
   145			unsigned int rtglock_flags);
   146	void xchk_rtgroup_free(struct xfs_scrub *sc, struct xchk_rt *sr);
   147	#else
   148	# define xchk_rtgroup_init(sc, rgno, sr)		(-ENOSYS)
 > 149	# define xchk_rtgroup_lock(sc, sr, lockflags)		do { } while (0)
   150	# define xchk_rtgroup_free(sc, sr)			do { } while (0)
   151	#endif /* CONFIG_XFS_RT */
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
