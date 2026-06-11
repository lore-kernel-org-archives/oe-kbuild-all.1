Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8FC3D8122
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175067; cv=none; b=ja14BXK1nKdKw4RqdysYg19ZD2i4LIOl8ScQQuzdeTIom6yoeCFftZeMPO3UenFPMAFZzq5xTB8S1LrK+I27YWc1jgOJEYu4+loHeS4o9kl7bQtadLvSOYc/H7I0amftTKPwZbtbgejqHJu3tozJ0bcJURSwDZMSW4i7PlNKS4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175067; c=relaxed/simple;
	bh=LrGXYsktu/PMfFx+8O9rwTaFqGn/8GHysMCIUghQpI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QRiDAICadpB78MQo0e02hi++EwDmlw8Ar47VRpN0r6ehgMsjbjf8Ul4RgpWPKOu6Ur2TWiFvA1BJJuE+HAWN8hGIzSSbnfSSMDiI1gL83ZxYngialB20tyyRVYduYvlPhGtsbNoNUfNlhJ/uArBQtT26YUyXnWYAfEizDkRADnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+JTzCVw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+JTzCVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781175066; x=1812711066;
  h=date:from:to:cc:subject:message-id;
  bh=LrGXYsktu/PMfFx+8O9rwTaFqGn/8GHysMCIUghQpI4=;
  b=n+JTzCVwxgHj9uDVlwDXvvn75iU6IwVc+ehGdI0mPX3CFqeU193syeu5
   YFANuGxviw1KhWygcJqJyIcR5ZHlYniM7wPU1mNX1jTfkHzVeDorFZUiK
   nt8O0fYc87q5fXGY3VIlEnoLZ5VczaemP6MZg0m0Q3tqjob4k35ubar+7
   jBLP49qZicA2aEPsk2mJVFXDTtBLFnjSlQKsqu9EPAUyQSBkEPdHsL7tD
   cHmWbZrZzJORCTiDgZvxJLuvBh6mWemaLf/PgMx9p9CHdVz33xTIYExxg
   vucUu0+l16M2leiVnqYamt6EaF23siyRg9UGfVRSj0LQk8dWg9zUjN5B1
   A==;
X-CSE-ConnectionGUID: 6WZDtQ7fSYy26X4ICV4hog==
X-CSE-MsgGUID: jyngZS55RzCNmoIkEbbaXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85883007"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="85883007"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 03:51:05 -0700
X-CSE-ConnectionGUID: iQTBERzlTwyWGcncxhFQ7w==
X-CSE-MsgGUID: nVEr4N8gTqi6yFAgi4YuGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251541589"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2026 03:51:02 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXczz-00000000MoW-3VUP;
	Thu, 11 Jun 2026 10:50:59 +0000
Date: Thu, 11 Jun 2026 18:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Christoph Hellwig <hch@lst.de>
Subject: arch/nios2/include/asm/checksum.h:30:24: sparse: sparse:
 restricted __wsum degrades to integer
Message-ID: <202606111818.O5tEL43L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 203247c5cb972af5d46bdb7d41ef40078048810b blk-integrity: support arbitrary buffer alignment
date:   3 months ago
config: nios2-randconfig-r134-20260611 (https://download.01.org/0day-ci/archive/20260611/202606111818.O5tEL43L-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111818.O5tEL43L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 203247c5cb97 ("blk-integrity: support arbitrary buffer alignment")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111818.O5tEL43L-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/t10-pi.c: note: in included file (through include/net/checksum.h):
>> arch/nios2/include/asm/checksum.h:30:24: sparse: sparse: restricted __wsum degrades to integer

vim +30 arch/nios2/include/asm/checksum.h

eea9507a69d637d Ley Foon Tan 2014-11-06  17  
eea9507a69d637d Ley Foon Tan 2014-11-06  18  /*
eea9507a69d637d Ley Foon Tan 2014-11-06  19   * Fold a partial checksum
eea9507a69d637d Ley Foon Tan 2014-11-06  20   */
eea9507a69d637d Ley Foon Tan 2014-11-06  21  static inline __sum16 csum_fold(__wsum sum)
eea9507a69d637d Ley Foon Tan 2014-11-06  22  {
eea9507a69d637d Ley Foon Tan 2014-11-06  23  	__asm__ __volatile__(
eea9507a69d637d Ley Foon Tan 2014-11-06  24  		"add	%0, %1, %0\n"
eea9507a69d637d Ley Foon Tan 2014-11-06  25  		"cmpltu	r8, %0, %1\n"
eea9507a69d637d Ley Foon Tan 2014-11-06  26  		"srli	%0, %0, 16\n"
eea9507a69d637d Ley Foon Tan 2014-11-06  27  		"add	%0, %0, r8\n"
eea9507a69d637d Ley Foon Tan 2014-11-06  28  		"nor	%0, %0, %0\n"
eea9507a69d637d Ley Foon Tan 2014-11-06  29  		: "=r" (sum)
eea9507a69d637d Ley Foon Tan 2014-11-06 @30  		: "r" (sum << 16), "0" (sum)
eea9507a69d637d Ley Foon Tan 2014-11-06  31  		: "r8");
eea9507a69d637d Ley Foon Tan 2014-11-06  32  	return (__force __sum16) sum;
eea9507a69d637d Ley Foon Tan 2014-11-06  33  }
eea9507a69d637d Ley Foon Tan 2014-11-06  34  

:::::: The code at line 30 was first introduced by commit
:::::: eea9507a69d637d52705de8703b168bf6bfe5643 nios2: Library functions

:::::: TO: Ley Foon Tan <lftan@altera.com>
:::::: CC: Ley Foon Tan <lftan@altera.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
