Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52971285C91
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 18:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756233649; cv=none; b=EoAQuJuDouI39QgWyGoemiscr16j2udqI/QLeJcGmJVRjpf3W45Vv8BV2Cg1O5RC5NivnhhllnaR6SeJy8rN5ZSqyyAcWM2GmWgthIV+KFpWwlSp8zeonxCoJmJyo3WghqjtHeqvY+xWlTCGknbNc9jNRnnFpxPkiK65HyrRHGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756233649; c=relaxed/simple;
	bh=pywoL4AWlFd15abbMdOs6Rh2neoV2NZNPPYWRnBy5fM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OhqrvMirMmh52hO0RPaNma5Nw9LmsN7EDcVg9Bp7pU1rUPI+PHKP5XQE+BjFpcwwZEaV8PvFSBG+GxjGQuK4a11F2TpL5sINuw/fmcNae6w8tV6WyCl/+wsAeOuF9yntmfbCRvF9VDOeCf18wDT8ma+iFhU5dOztu90sZYUX6rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fgzuidto; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fgzuidto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756233648; x=1787769648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pywoL4AWlFd15abbMdOs6Rh2neoV2NZNPPYWRnBy5fM=;
  b=FgzuidtocVdfb3xnPG9ldoY8xFnjzp5Dcul8zqDhuENqb+vXEz08PyQV
   eOKbZsIBeDCq9CCc1xCdr+ExfxV0WH9CvEy8WC6jeqffnRysGh1qKxb/q
   +pKU4E4UcG2FemPt5CfUXTKH16jDfv8sZxWW2TmPkb8EIgQAtdtbAV8SA
   usNCNEfpOZ6uXED/bFQWaoJCxU1RGU+tFV/vpzIryszf+2gdlso2c18UL
   yZNP+7doRHtoqII3ei9UBRD1CSmkmQrZ2wyZgLwNtpSY8GFYrZKD4reLk
   2iv9d7I1HLk+u2Eqlqoqvx/6QJXWdWlQxPcg4ceubtvjBNC77EDfSesGv
   w==;
X-CSE-ConnectionGUID: XcS3r7X1TXGzs3HNmGQH9w==
X-CSE-MsgGUID: Hm/CeEocS9iCYmV0M/4dJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="46061629"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="46061629"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 11:40:46 -0700
X-CSE-ConnectionGUID: c3897RH7S5ORR6ryI0S99w==
X-CSE-MsgGUID: Bkbldq3TSPWgsQIi0OIqaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="173972451"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Aug 2025 11:40:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqyb5-000SIx-2x;
	Tue, 26 Aug 2025 18:40:43 +0000
Date: Wed, 27 Aug 2025 02:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:iomap-pi 10/23] ERROR: modpost: "bio_integrity_prep"
 [drivers/nvdimm/nd_btt.ko] undefined!
Message-ID: <202508270227.OonZJDA3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git iomap-pi
head:   98fff771924bacb44d3e7923273796c8666e0eb0
commit: a802255b182b364357b5ea835a423ec38f12f0b1 [10/23] block: factor out a bio_integrity_action helper
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250827/202508270227.OonZJDA3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508270227.OonZJDA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508270227.OonZJDA3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__bio_integrity_action" [drivers/nvdimm/nd_btt.ko] undefined!
>> ERROR: modpost: "bio_integrity_prep" [drivers/nvdimm/nd_btt.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
