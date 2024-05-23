Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120DC13C9CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 10:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716460398; cv=none; b=XQsbGH3Z6LR6ZgJL2uCR9bi9NIysPGOpglR/aA3ww53r+2DCTHbFXzYHVSASO00krSqq+RsKvQamVQ1bZC9rUFko3dlvE6cXM2YW2Ek+l/Rxt9kS5HrJ6jFx/ySZs/JCR6wSf60H5cGR4KAfybEOWsyRl3aFkFUS74iElks/IQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716460398; c=relaxed/simple;
	bh=Ps0q/y4RssemCu/MaZvRg2hxyArpNOVBZ5N7s0PMipY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvsqnb1IxQz56vamTDAoPme3mQO1xf3HV+ks1V700f3i5E5l29157YqIFjKPGSY00ploLe94PtfjhJc/9EJ4M8nHgGv8qe5k96Kt/ddoTlTMlYWTBquhg7pKROXuOX6wzxACmfN9ZssAavytyahJuDCyQoJdDRjEdDRmrH4LHHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKS/1UIF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKS/1UIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716460397; x=1747996397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ps0q/y4RssemCu/MaZvRg2hxyArpNOVBZ5N7s0PMipY=;
  b=NKS/1UIF62I29qff+/cLn8XpUhKwtJsamsPLx82B3Wim10oY2OE5L38V
   zGVlMUNX98Eoc32dtyyvfS2owNWRPPQ4TdU38HUtHXNL04+VMbZ0z0Lqe
   06/rJAgd0Np++MQiK2gVjgDFPDMFqlkDEQqGUTUP6W9LnrPROFRRKzwem
   2vF6/dBdOdt9kvnu48jLk66LRvAkjlsiD5wxDSlx+RlaRvEgBJY0dwJIB
   G8PIV2+WaoeMWRdfedvdu4bI0GkDIWKjFzvQ76PUTkUwZkKv8b9Y6Vhbo
   fcbyTjiCTkJaqPNIs66cW/cepliHiKSXW0jIxPynMRFx7iONeUVVMO5TR
   Q==;
X-CSE-ConnectionGUID: PnpCTjBfQKuW330FYthdmA==
X-CSE-MsgGUID: vBEVsnkqSsKoQUYHRcYN/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12888569"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="12888569"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 03:33:17 -0700
X-CSE-ConnectionGUID: 9lK3u4N7QJ2qt/CoNZHGiw==
X-CSE-MsgGUID: LBQBnYnATuib2tQe66q97Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="33520461"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 May 2024 03:33:14 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA5l0-0002jy-2r;
	Thu, 23 May 2024 10:33:11 +0000
Date: Thu, 23 May 2024 18:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 44/68] devmem.c:undefined reference to
 `__traceiter_page_pool_state_hold'
Message-ID: <202405231849.sI0NXCsr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   9b5718278c90658985f5d335dff91dd589b3d4c7
commit: 4c610b57b76d4755266b022b1cf0aa55e728ae0a [44/68] memory-provider: dmabuf devmem memory provider
config: powerpc-cell_defconfig (https://download.01.org/0day-ci/archive/20240523/202405231849.sI0NXCsr-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231849.sI0NXCsr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231849.sI0NXCsr-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `__traceiter_page_pool_state_hold'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: net/core/devmem.o: in function `mp_dmabuf_devmem_alloc_pages':
>> devmem.c:(.text+0x4ec): undefined reference to `__traceiter_page_pool_state_hold'
>> powerpc64-linux-ld: net/core/devmem.o:(.toc+0x0): undefined reference to `__tracepoint_page_pool_state_hold'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
