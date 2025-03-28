Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1391E0E1A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 21:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743197043; cv=none; b=pUmJniPUL9ZvAXFqBNFQ/LCGSob2t4cLoi5slz8ccLWVePjvh/r9VM2iA8WNjE9t5IhxpDzHOuPKJ1XlmJUdBDEf4/p3X05M9CnnSJ4ZzS8MQTcIgi+tXRQtHt1SIc9f1u7el++43176Vo9skX04LqrUDI/EifE++iQ2K+ZlI/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743197043; c=relaxed/simple;
	bh=FH0RNzT5nqMH9MOIFQhc4jt+m2sZCYOEhTbhtSwveB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mOSu1IshT7pXFRhc64TLOqEdIiI9MFBK2AvrbhiR6sXfWQYtAQyTd+WiiAxt3qZ6rsIFE3+gbZmL3z2DcsMsx2IQrVnj/ZtRGxpkBrggTtNSx+iQGHx2ujEIfhC5o9+Q7dFWQJXBNEasqv+w3RpPTTfLOhUzMZDS4o4MXON2vMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZcOjQaa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZcOjQaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743197042; x=1774733042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FH0RNzT5nqMH9MOIFQhc4jt+m2sZCYOEhTbhtSwveB0=;
  b=bZcOjQaabXZk/TNQwgvu8qkDzecNbXATWC4oCbs9Lfdd/fXwhOyNAhgj
   uZLd9UYwvW2lfXqN0MCN8VbJXf60Z1cG88kkX0m1VO6EzX5gd2b9SJExc
   YMTpudDoHtUtVi17xZqY86rTt4YB/LTMLyKwo34stshSbF5xM4znSKjnU
   w9EEVAKtfs3a7RSdaAy6TndUpwQIeRyxPHnGy4hOu7HLhUC935PuzfPj1
   mcTaLent5imUYPQ97KTKI7ENVRLCccjheNL5KC/2TRvvqNMkrZyC73Kmo
   VfDUCoYEg1UVqkI15a6e1ZlVZRaXrCFCeTJaF9menenl9BjuP4v9UFvaR
   w==;
X-CSE-ConnectionGUID: KJLXs3dtTQmJipxLO86FdQ==
X-CSE-MsgGUID: kynZMllrQ0mZu9ptTquL/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="54768464"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="54768464"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 14:24:01 -0700
X-CSE-ConnectionGUID: a86ZcqlsRfWoLEUbfpQItA==
X-CSE-MsgGUID: GTBGizRkQh2uPxMIHwVgSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="129682089"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 Mar 2025 14:23:59 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyHBF-0007iO-2H;
	Fri, 28 Mar 2025 21:23:57 +0000
Date: Sat, 29 Mar 2025 05:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] fs/nfs/read.c:51:2-7: WARNING:
 NULL check before some freeing functions is not needed.
Message-ID: <202503290544.oB6bJzHH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b62ea68f41a901d5f07f48bd6f1d3a117d801411
commit: 303a78052091c81e9003915c521fdca1c7e117af [2/2] NFSv4.2: Rework scratch handling for READ_PLUS (again)
config: x86_64-randconfig-103-20250326 (https://download.01.org/0day-ci/archive/20250329/202503290544.oB6bJzHH-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290544.oB6bJzHH-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/nfs/read.c:51:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +51 fs/nfs/read.c

    47	
    48	static void nfs_readhdr_free(struct nfs_pgio_header *rhdr)
    49	{
    50		if (rhdr->res.scratch != NULL)
  > 51			kfree(rhdr->res.scratch);
    52		kmem_cache_free(nfs_rdata_cachep, rhdr);
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
