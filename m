Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BC415B547
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718802; cv=none; b=mGtPsvXPAl8RRxm/ld2pZ3/KIfuexKHbmeTXsLZuE+81WFPQoiAJOq2d64SO9giVoYItVnxNk3qH/sI76gvFy9sRD5HmLUkqIvX7xqUsuCyl6TyyborhxxDjO+PEfjHJ9tBee8D3Ud8IQAn48Kp25J1tf7FQFmUb/ZAjpTfVr2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718802; c=relaxed/simple;
	bh=dKnr/ZqDuIX79oSh3UEyoEg7NKtXGnAPGcbQpk/pIj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OLzqvfcKQBJxLpNPqxRbbU8iZV69aTr+lCBejK0Q1p7zJkiBP4RSDiOaHA5MVFkK9ZvneUl60N3Xrfw3xEF/YAIYP4M1Ummc9s+L/1ADjXAfQj4uZyGdJ7rkusnUtlPThpioEI0cfPbWIcdLApIXDFeNca/JVL9XLKGPRLo5J0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=assBcj6k; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="assBcj6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718800; x=1765254800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dKnr/ZqDuIX79oSh3UEyoEg7NKtXGnAPGcbQpk/pIj8=;
  b=assBcj6kLZZUV7pb8CiyF5+5/AAmjZGPJrOssXHqqWmC8LuhusQ88oxa
   CZ6fAKBR8JnqUAa1/m7hwKCvAXaq8Ewi83UTkvwgdoO4wuxzBN+OOpG1w
   eqEooNQmO+5bTTIRg0Vgx0BJ91WT72Y1gJoGO8d6I9PpUaGxZoCnOsus0
   9IHoMYW0NCQcxn+Mux6goO49WRAdxtmNc3zJmjACkiPyvS+wvjzOmBgSs
   LIIwPuv6VnsTrnB2aTszY7lMNLKr0GF645Jl6+Ywm/GjmCojoCu7ctJAO
   nC57ibNiUpr5sNLHrfkf4216da7aE5/y1gBq9wnNxLy7IJxqnC7tcyB90
   A==;
X-CSE-ConnectionGUID: jdOtUXaoQCen/oA3qJT02w==
X-CSE-MsgGUID: rtjdYd1WQGGfNRis4hoFZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33348347"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33348347"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:33:20 -0800
X-CSE-ConnectionGUID: op9EvNaGRQSiatcHh8Y9wg==
X-CSE-MsgGUID: MVp2pXkWS3ag3m5V+zFnRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125798994"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 20:33:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVSO-0003sL-1F;
	Mon, 09 Dec 2024 04:33:16 +0000
Date: Mon, 9 Dec 2024 12:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 166/172] powerpc64-linux-ld:
 mm/mmap.o:(.opd+0x510): multiple definition of `memfd_check_seals_mmap';
 mm/gup.o:(.opd+0x5b8): first defined here
Message-ID: <202412080848.k2HQ5mlJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   6e165f54437931f329d09dca6c19d99af08a36e1
commit: 6b72648c4e2b94fc7df65cab28a59b185a37c997 [166/172] mm: perform all memfd seal checks in a single place
config: powerpc64-randconfig-003-20241208 (https://download.01.org/0day-ci/archive/20241208/202412080848.k2HQ5mlJ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080848.k2HQ5mlJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080848.k2HQ5mlJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc64-linux-ld: mm/mmap.o:(.opd+0x510): multiple definition of `memfd_check_seals_mmap'; mm/gup.o:(.opd+0x5b8): first defined here
   powerpc64-linux-ld: mm/mmap.o: in function `.memfd_check_seals_mmap':
   mmap.c:(.text+0x292c): multiple definition of `.memfd_check_seals_mmap'; mm/gup.o:include/linux/memfd.h:28: first defined here
   powerpc64-linux-ld: fs/fcntl.o:(.opd+0x150): multiple definition of `memfd_check_seals_mmap'; mm/gup.o:(.opd+0x5b8): first defined here
   powerpc64-linux-ld: fs/fcntl.o: in function `.memfd_check_seals_mmap':
   fcntl.c:(.text+0x127c): multiple definition of `.memfd_check_seals_mmap'; mm/gup.o:include/linux/memfd.h:28: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
