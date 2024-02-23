Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D57145B1B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 19:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708717872; cv=none; b=qc6U2k0JWvI9eh0ZS4LbfAdebum0i66sf3ODdRiddt/LTKXPBykhClAnrk/QhKsUS0rvsWZeu2XFBL0dkY8lWdo2u13l6nP/Ye4seyJyQoDcOgc81fB1vExTJC50sl6VefZc4MUkIG75SV6bjP1ctWlj7it3W59cuWB0rCZfzS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708717872; c=relaxed/simple;
	bh=SgpTvNlffmKmGm32iM2Vp1tyk4nibujYXBGJsKUHQTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y+XpukafVc7AooZ3XzsKyfUll1h3D3gkM8OueCvax7JECwktxY7o3eJ5gwTEu3m+QV//BbcnzXmsC/PxExKNugOAKrzxtNoIOPumJYFmc6jPD7vRcNKdvBCFXulttPs94No1KayenYdWAU0/IX4pBpS6axFacvzpZNjWOpUbDVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asAp3FPG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asAp3FPG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708717869; x=1740253869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SgpTvNlffmKmGm32iM2Vp1tyk4nibujYXBGJsKUHQTQ=;
  b=asAp3FPGlS4XAp+QAn3yo+iXas1hSC/XEaGFSmLlRcXc9bCIS0eOR4dB
   J/YQddaoo35KTATv+kKJt7YltlzfQRNzL41QwkoVHX1uZHUFHRntheRCN
   6x3Lw+xUuaDHmB1xw6UdRykctHIW6EhUm5cbpbvZ2O7DR5c9/j7ETglQU
   ynyHhuRZ6I2lY7/OHBcVPDa8WLwjIB2SV9HBpenb5cOKZcAjTKlttW3MT
   MV6lqEeQAlNp66TxwDpHcvKoKt+EVyY3kKM31e02j2RGZ56K1Py03ENqm
   4uPpeOUjGgGEvHMgtqwK0uoMVpSLMT+bcSX1rxru2e1B0uEduo+iVX1zI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="5997664"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5997664"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 11:51:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6421961"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Feb 2024 11:51:04 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdbZJ-0007qY-2U;
	Fri, 23 Feb 2024 19:50:52 +0000
Date: Sat, 24 Feb 2024 03:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 22/43] include/linux/stddef.h:8:14: warning:
 returning 'void *' from a function with return type 'netmem_ref' {aka 'long
 unsigned int'} makes integer from pointer without a cast
Message-ID: <202402240327.rSy6j9Lq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   422e699712a532c85e16c4e6afda9d4d4164bdf3
commit: 95496e256dcf9e2750a2704c03b0287ce341da88 [22/43] memory-provider: dmabuf devmem memory provider
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240224/202402240327.rSy6j9Lq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240327.rSy6j9Lq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240327.rSy6j9Lq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from net/core/page_pool.c:8:
   net/core/page_pool.c: In function 'mp_dmabuf_devmem_alloc_pages':
>> include/linux/stddef.h:8:14: warning: returning 'void *' from a function with return type 'netmem_ref' {aka 'long unsigned int'} makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   net/core/page_pool.c:1098:24: note: in expansion of macro 'NULL'
    1098 |                 return NULL;
         |                        ^~~~
>> include/linux/stddef.h:8:14: warning: returning 'void *' from a function with return type 'netmem_ref' {aka 'long unsigned int'} makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   net/core/page_pool.c:1115:16: note: in expansion of macro 'NULL'
    1115 |         return NULL;
         |                ^~~~


vim +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
