Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F2E353A9C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 04:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785471236; cv=none; b=gPlnV9bKRCSrMOLjHuJYemSPdJE35ECV2IUTY8dVrJX9s16XbHyYiHOYqAqGd2BsZxyp3w9PknS5VbNSwLB0iahbJU+Q5kcg37DNBgPiBGMqi7ZOxY2Z0jKr074pWLES1VmxQf+4qMzgRgCh5cWIK63llsHvXRGM6wifVwFbKQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785471236; c=relaxed/simple;
	bh=6kPNvssdarMdGoPrTkmFIHQYLEXy8WKQXPYpJ3xoNd8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J4TWw6ASR/JeW3GBoQjwkYK26AAJeDU3XSMGyTwjd+iyJdiqki0UdykxVXpKZfaQRI0O4/52AEhmO5vmIs41MVcJAb8NDAl8IjLkjKQprFs930VQFND2AC+WXsppde6srJM0r/VcPjdfC/EhY8jDKz3Ld/ZoXh5p9we/Kg5bNUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sbyqatu4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sbyqatu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785471233; x=1817007233;
  h=date:from:to:cc:subject:message-id;
  bh=6kPNvssdarMdGoPrTkmFIHQYLEXy8WKQXPYpJ3xoNd8=;
  b=Sbyqatu4pxK9HH2X1M+kCWVa/4aO8z5eYwVTMYSbTLBP3cuT8CA2YaVz
   3/i/QgMHjGcmZt2bbzMvMRnb1cklhCiluJVPVNJLt7zSWAjOciZ+q/pd5
   +Jbw5ke395khyp2ROm4yh8IkYTBaYOXOnH8D38brtYxfq/ow3YBMKdmLw
   fas7xU/3gL/mJpwVp3DN8pHLrnp9raemXTKheiciIkYLV5DuQcC8iwp0h
   tfMvKmjdKZN1fgIwVtAaHdI8UJHr0gWIKkjRXMVT7F8AYs/jxGTKcCCgK
   DvxuyqFBlQDhE6y+r9btSi4vz84ClOp54tZjOkoRf4qv/AZKOJo0Xms8L
   g==;
X-CSE-ConnectionGUID: sbrfppoyT22R64a5WBnZIA==
X-CSE-MsgGUID: RU82Aav3TOil0CPBskhDLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86131574"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86131574"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 21:13:53 -0700
X-CSE-ConnectionGUID: 8v3g3ZzRQ/O0OcV34+ySxA==
X-CSE-MsgGUID: +RWJ8GK2QGC67YkKlrhCgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="257801556"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jul 2026 21:13:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wped3-0000000004x-2tbi;
	Fri, 31 Jul 2026 04:13:49 +0000
Date: Fri, 31 Jul 2026 12:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: crypto/aes.c:12:1: sparse: sparse: static assertion failed:
 "__alignof__(struct aes_key) <= CRYPTO_MINALIGN"
Message-ID: <202607311226.LZ6GtJxN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ba098e6b6ff0db8edf28528d1552be261af30d4
commit: 0892c91b81cc889c95dc03b095b9f4a6fdf93106 lib/crypto: powerpc/aes: Migrate SPE optimized code into library
date:   7 months ago
config: powerpc-randconfig-r131-20260731 (https://download.01.org/0day-ci/archive/20260731/202607311226.LZ6GtJxN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311226.LZ6GtJxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0892c91b81cc ("lib/crypto: powerpc/aes: Migrate SPE optimized code into library")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311226.LZ6GtJxN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/aes.c:12:1: sparse: sparse: static assertion failed: "__alignof__(struct aes_key) <= CRYPTO_MINALIGN"

vim +12 crypto/aes.c

a2484474272ef9 Eric Biggers 2026-01-12  11  
a2484474272ef9 Eric Biggers 2026-01-12 @12  static_assert(__alignof__(struct aes_key) <= CRYPTO_MINALIGN);
a2484474272ef9 Eric Biggers 2026-01-12  13  

:::::: The code at line 12 was first introduced by commit
:::::: a2484474272ef98d9580d8c610b0f7c6ed2f146c crypto: aes - Replace aes-generic with wrapper around lib

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
