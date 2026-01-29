Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D0837FF57
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769695799; cv=none; b=iA6dmDp+FYoMCcDG2lG3zoNE5PwegOlBb5urmS8ZOH190jpnBDTEphsRv3tXF7KYpoPslRu/qphX0EKJXVfnC/LLhI4lWZgELd1OoqbUL0SQgtjgVDDFjItMMO/ZiTBjvFqd2FlNBz0fGPkE/hSqEtpnTFn5GrZW8SXxYL1n+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769695799; c=relaxed/simple;
	bh=yLeAGeBRzgLm2e+0W7uInR1+5qNQheCkSJM1TmmouBc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CB6sfga+en9j3aaDSThJDAqB3sdvmayVlx8tvJkre/Ksyj7mG4pl+LZ0w22El8WP8qFrsT6PEbRS11csPpYCZ8KpWO0x4NkWYXokoY3iVClJQ1PHVPM8kknfLfH4Ralbj12yiOLMKqFl6YUYYy2UPWfkHmqirUCokGHtxq1XyUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B86NvfDh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B86NvfDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769695798; x=1801231798;
  h=date:from:to:cc:subject:message-id;
  bh=yLeAGeBRzgLm2e+0W7uInR1+5qNQheCkSJM1TmmouBc=;
  b=B86NvfDh5ZsKyyzMmSIK5x6dt5zhSPSehETNLUT9T1gveJLLQM6yooJt
   8NR+rt9utLRpTw/JeqpmIH4VcZfW+/Cjx5st48frNpIT4UIja8l8Ww27n
   IzDxpJrbB2BaxIQGq2fh4TRhMd0Gce7Op6qoRdfPm8UtK6zGfutHVyjNS
   NHtkLA86tj5S2dajzj6HcVm3/0bt/IJvJRkUgnBJA/bDl0AxTIPWo+IXL
   0K736dwaMX3ar8KkILIPwjv84uCVKak7kZ1rhIjPVMb37NYmGJmqZOOBw
   4jdrL0y6F3nzOPqPp/j1l9WZV8TvP4MpYzxsE5XRuJop8tno3xyvjZ/mB
   Q==;
X-CSE-ConnectionGUID: K/agsoTlTMeDPXdnHy0Cdw==
X-CSE-MsgGUID: PANSYZNhQV+EDepI3eLmtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81255057"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="81255057"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 06:09:58 -0800
X-CSE-ConnectionGUID: JCZPEBnjTp2jvhEjTuB2pQ==
X-CSE-MsgGUID: TrGNkaxERyKmXdUMGArNOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="246215125"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jan 2026 06:09:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlSiX-00000000bWi-3vA2;
	Thu, 29 Jan 2026 14:09:53 +0000
Date: Thu, 29 Jan 2026 22:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:vcam 5/5] ERROR: modpost: module vcam uses
 symbol dma_buf_put from namespace DMA_BUF, but does not import it.
Message-ID: <202601292118.Gb1q8XnZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   f29b36ecc2e18e1d170008dd2401fea768fac4f0
commit: af5e226e9c3ff4706a684902f7ffbf1caf78a375 [5/5] media: Virtual camera driver
config: um-randconfig-r132-20260129 (https://download.01.org/0day-ci/archive/20260129/202601292118.Gb1q8XnZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601292118.Gb1q8XnZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601292118.Gb1q8XnZ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module vcam uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module vcam uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module vcam uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
