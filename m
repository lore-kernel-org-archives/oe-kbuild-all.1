Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F6F101E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 02:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724725425; cv=none; b=nLg3frUsEZZGQE81Ql0kLr/fnfis26k6CCtfN0uDBGlzQseohoo4I/aoom2YPqfWyJrgFAwYLARDVM5Vn5xl79KqHI1gMp2QAdtt3qIg6Frsyb/VOUIjS2GJB00w3ir0PiIKCkcgXLR9r9K45YAmxNAmBLccgSOKwUsYjyNdjyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724725425; c=relaxed/simple;
	bh=so90xNcukuhfWxJBs4GUWJa9qzQ0Cx4X9RbaxW6zfvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MkP/AypGnnFJCqiFlgZ3GzXXPuC3c5CnruIgRyvf22Td6/DM8xEDXC6YbyS5CZA2vDFWIgnePyK30/IqTy0GIiHXciEQ/bAZrnIFI/JjbqEUC5pwcOCzx5oa9VxW8/48R8x9Q44nDqUH+m27jVbX89i5OHt9oXILey6509DPgBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wq+4tOuA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wq+4tOuA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724725423; x=1756261423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=so90xNcukuhfWxJBs4GUWJa9qzQ0Cx4X9RbaxW6zfvI=;
  b=Wq+4tOuA3s4jvZgISxb4hax1+5s4ydltCA1tzrUYq7DRZgw0fMv9vX59
   w/Rp1XY1bZ27L6D+Cy4cMQX2KNZWpJOPng4r6/Fc7NNwCv6Wjhxdf2LO9
   v1CVfatQfYZJr97uSGyOgifM3tGayZOq1NQvo3Crdlx/VJjPJ/qF4bba0
   UkdoGL/UyIt0mZq7+zZUeVkxzpPMN4bZFPvFd8wRiyrJ0pCGBCSvzy+se
   o94cpDrtIR1gwHJw7hHeKlda+RjkN6DlmPb7tFAz1T/VrlMY1oqOX93/4
   O+Sbbmld82g+2nkrmJBmxZ1/Z7wDfniRbMdyoqjAbNfhq94BLDGlFjIoK
   w==;
X-CSE-ConnectionGUID: I3l60DSsRnOhMfdYCA79Ug==
X-CSE-MsgGUID: buzxbP/ASZqDzZtLLaRXUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33842802"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="33842802"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 19:23:43 -0700
X-CSE-ConnectionGUID: lKlaVgZ6TZG5X2eG3pdndQ==
X-CSE-MsgGUID: T8PyWWdRTrepMkL9TPqviA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="62386320"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Aug 2024 19:23:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1silrw-000HnQ-0S;
	Tue, 27 Aug 2024 02:23:40 +0000
Date: Tue, 27 Aug 2024 10:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 122/132] mm/shrinker.c:832: warning:
 Function parameter or struct member 'out' not described in
 'shrinkers_to_text'
Message-ID: <202408271028.pPppfEiW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   fcd6549aad02f9abeb9184201c285e6b67b3f098
commit: a099a13d2092831668e30deba03a1c3438def1c8 [122/132] mm: shrinker: Add a .to_text() method for shrinkers
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240827/202408271028.pPppfEiW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271028.pPppfEiW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271028.pPppfEiW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:832: warning: Function parameter or struct member 'out' not described in 'shrinkers_to_text'


vim +832 mm/shrinker.c

   824	
   825	/**
   826	 * shrinkers_to_text - Report on shrinkers with highest usage
   827	 *
   828	 * This reports on the top 10 shrinkers, by object counts, in sorted order:
   829	 * intended to be used for OOM reporting.
   830	 */
   831	void shrinkers_to_text(struct seq_buf *out)
 > 832	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
