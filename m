Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07115304BA3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 17:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827325; cv=none; b=sSEcvnQYIoDEzToT8ekOcmUYxpWYchhDTUqR3/1gAFZ6m8qCnlkj7aDhxo0g6Ga+fJdUM3+gWmoi3sKLYovtOBhKA39dMbZ5iOsvj4q5AWnfQ8f6of2jFvjXzruj5fLxRwvSZff/gxWLFlx1ORXDSxqVooVHgQLlQMuiRjxiW6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827325; c=relaxed/simple;
	bh=KzGXV20t2yVteuw4EG25j5SwKRiS4phn4A0FoPo7X8s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sgu6B5GYcXMmCkjS8gfSTIadDn8fHqEhwC1ZvyMotzdfvIGWfvnBJzWPSv/VixTyn612lSRBL4Vk0I4DzTBLIin3vPp5w0so859EtH++ZG7dEW8RBX2ddmPvIFtm/yE0HiAkcq0vCw1gnq2iaHmCqLI4aikjCyEyMsu225c+Y+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpD7bRMu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpD7bRMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784827324; x=1816363324;
  h=date:from:to:cc:subject:message-id;
  bh=KzGXV20t2yVteuw4EG25j5SwKRiS4phn4A0FoPo7X8s=;
  b=cpD7bRMuS/QTsJ1wciH0HW4i0LNTkt5kS4rnevqEzdKC+9pJRRiVEHHY
   l3yB/XwUk1ykY9/dMV14DoYGtBID1fGY7OWlCq6K5YDyptx6kjpzioZ03
   z7dXNUEJ1xULwg6F3hJ6LQ4M59EtP+lwL0gpuRYEV/B3Sv3RyYiO3rAbK
   JxbjzO43Ok1FW4suCuxh73WFIgLQ0m4+aoCAVTWzGzrx2PmqVxSy6VgMJ
   1PqrMEKOdLFen2wlhlfiqQIKTXIbpL6hcVBDJTTMU1o0z0V+O1EvWZlTZ
   wPWx/V5MiYKDqyvzLcegsI+sFz2YstTUeObJTybTyeIu0+AyP3fXhPoOY
   A==;
X-CSE-ConnectionGUID: 8mIwb1lmTqyBxnXRuvqEGA==
X-CSE-MsgGUID: /ryTk8/1SGaRtCGfISvvNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96080654"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96080654"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 10:21:29 -0700
X-CSE-ConnectionGUID: MyqDcYd0QHqwH485PCw1lw==
X-CSE-MsgGUID: C/KniIjKTmOH4G6qAJnuyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="260417037"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jul 2026 10:21:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmx6r-00000000Zwe-3yc1;
	Thu, 23 Jul 2026 17:21:25 +0000
Date: Fri, 24 Jul 2026 01:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap_param 26/26] lib/find_bit.c:309
 find_random_bit() warn: always true condition '(w <= (~0)) => (0-u32max <=
 u32max)'
Message-ID: <202607240007.bsuUdB89-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux bitmap_param
head:   7973e783d2679c9ea1219c4beca33564fea1b38d
commit: 7973e783d2679c9ea1219c4beca33564fea1b38d [26/26] bitmap: return unsigned long from weight operations
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260724/202607240007.bsuUdB89-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607240007.bsuUdB89-lkp@intel.com/

smatch warnings:
lib/find_bit.c:309 find_random_bit() warn: always true condition '(w <= (~0)) => (0-u32max <= u32max)'

vim +309 lib/find_bit.c

   288	
   289	/**
   290	 * find_random_bit - find a set bit at random position
   291	 * @addr: The address to base the search on
   292	 * @size: The bitmap size in bits
   293	 *
   294	 * Returns: a position of a random set bit; >= @size otherwise
   295	 */
   296	unsigned long find_random_bit(const unsigned long *addr, unsigned long size)
   297	{
   298		unsigned long w = bitmap_weight(addr, size);
   299	
   300		switch (w) {
   301		case 0:
   302			return size;
   303		case 1:
   304			/* Performance trick for single-bit bitmaps */
   305			return find_first_bit(addr, size);
   306		default: {
   307			unsigned long n, random;
   308	
 > 309			if (w <= U32_MAX) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
