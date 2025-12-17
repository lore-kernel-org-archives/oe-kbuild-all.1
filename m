Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC751BC41
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981368; cv=none; b=mcJDPgt5BegMKbpdLwzzVUE7KtoOm9rfutkwqJ8D73hr13pbHSDj4Pfo+6ROZ8vzAjxd/OQUzeBI4T1lkBwaNq3ebVTLYf0JqMM2I5OpLUoBNBcconmOmiJf/tI/FaK5R51whRW4mikhbrtDmPgRD2TCS8cU2wNU3McsXvCesJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981368; c=relaxed/simple;
	bh=+/WTk8TKTYzrbTKtGmIMaui/GfT/BVnboimvm/iMNi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sShOgQySpu8Oivb+YpEx98CcBMZRpZV+StQsyM6pFEX8eU+8ndPMNTXQNiXaFSSt1ubEBOy07yLJ2uPGuebDba0SpD0csK0QKjw2+WS/RazDvF/PISeSx1HJj+ujeozRAnkHf2yTPFzPDgMtjt9/YBFuuZQRU8eLHWLSZ5INgFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzFdSAw9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzFdSAw9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765981367; x=1797517367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+/WTk8TKTYzrbTKtGmIMaui/GfT/BVnboimvm/iMNi0=;
  b=GzFdSAw9Z6eeH4nkJUAWNH37uJjnnVBwUYJrTVFj9D5mrFKLGHlahcts
   4Aom/PRQA+VxTIB9yG1qxWzPJE87CzsEonh3ly5eFljG44APjeNA6ni5p
   1bMAp72bbU6FyM4k4/TsdzNUUv0f/HX40z9LM8NFvWjMFA4HBuqshwJM9
   xJfhMX3emTkvB1N/CRqMc6b7AYnnZJb17Ftww8dddolILKly9q0Gh38w3
   NARKI5ucuu8dZJd7WqQ8ShqcTfrpzSOpt50xH6Li3lsxsYw7P/EDCWTKT
   vB8pnzdj/qsAMsxAb/TBfOiLqStrL2MRlIM+k4R1ylaXtYDFBIhWgup6T
   g==;
X-CSE-ConnectionGUID: Axa/yPi3T+2k375y2sI++w==
X-CSE-MsgGUID: x0Q6F5QbRIGf5AnNkKFdxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67885393"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67885393"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 06:22:46 -0800
X-CSE-ConnectionGUID: 9joYNCBSSGSEjAEd8bDZIg==
X-CSE-MsgGUID: W6deyEcXRQK9R4t6JvjHCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="202506182"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Dec 2025 06:22:45 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVsQM-000000000hx-3RuT;
	Wed, 17 Dec 2025 14:22:42 +0000
Date: Wed, 17 Dec 2025 22:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 33/87]
 fs/fuse/file_iomap.c:112:10-13: Unneeded variable: "ret". Return "0" on line
 126
Message-ID: <202512172229.s772GZJh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   2e08cf085a3a45dfa83afdef3bfcc69b7e4a6684
commit: b12a7ff891210a972a6ccd32ec1d16e954d45b81 [33/87] fuse: implement the basic iomap mechanisms
config: arm-randconfig-r054-20251217 (https://download.01.org/0day-ci/archive/20251217/202512172229.s772GZJh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172229.s772GZJh-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/fuse/file_iomap.c:112:10-13: Unneeded variable: "ret". Return "0" on line 126
   fs/fuse/file_iomap.c:140:10-13: Unneeded variable: "ret". Return "0" on line 151
   fs/fuse/file_iomap.c:162:10-13: Unneeded variable: "ret". Return "0" on line 176

vim +112 fs/fuse/file_iomap.c

   102	
   103	/* Convert IOMAP_F_* mapping state flags to FUSE_IOMAP_F_* */
   104	#define XMAP(word) \
   105		if (iomap_f_flags & IOMAP_F_##word) \
   106			ret |= FUSE_IOMAP_F_##word
   107	#define YMAP(iword, oword) \
   108		if (iomap_f_flags & IOMAP_F_##iword) \
   109			ret |= FUSE_IOMAP_F_##oword
   110	static inline uint16_t fuse_iomap_flags_to_server(uint16_t iomap_f_flags)
   111	{
 > 112		uint16_t ret = 0;
   113	
   114		XMAP(NEW);
   115		XMAP(DIRTY);
   116		XMAP(SHARED);
   117		XMAP(MERGED);
   118		XMAP(BOUNDARY);
   119		XMAP(ANON_WRITE);
   120		XMAP(ATOMIC_BIO);
   121		YMAP(PRIVATE, WANT_IOMAP_END);
   122	
   123		XMAP(SIZE_CHANGED);
   124		XMAP(STALE);
   125	
 > 126		return ret;
   127	}
   128	#undef YMAP
   129	#undef XMAP
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
