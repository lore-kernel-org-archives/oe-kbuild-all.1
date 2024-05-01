Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D75C60253
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714564154; cv=none; b=jBXSzB/G7y6I45MdRng/Z4qK0d8bfkiAAe3FIJad0MPM5C6Y0hTZrK90SaOzokx+6ak2EXRxKWsKvtF5t1YG4jB7UUoxuS1DOGFnOo4DkBlO/xzIzJrgQlqKabVZgai4b7bHNqIZrpLr5i3Ramcoh/HEeM324FNJ+QHf9j8dkuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714564154; c=relaxed/simple;
	bh=q6ktdVT2Cc6N5TMU/zYrpTSqLUV405cQ5cX+QM8oUOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UA0EedSazxYT+ZOh1HMufMU3cH/CeFQLpg7Bx4GpLkC3QRDi44lDfl03HBFKOJzPkXK84vXkJ5nmgDTgWLnP/5JcSh5sOuiXgyWv6iHqWRatLSCzmglH+hVUEtcDniG7WXjIknnLoe3pt4hbyoQhguI+KULjBrZBmXOVuH6Xwu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuZBI+Bi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuZBI+Bi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714564152; x=1746100152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q6ktdVT2Cc6N5TMU/zYrpTSqLUV405cQ5cX+QM8oUOQ=;
  b=cuZBI+Bi/vV8iq0V1ZHQnyK0oJ+BstWCwDMgfNBaXtyg8J+cs50Q5p9t
   4Sxlp0qPcBdKtJV/1czaCWH7z829GV30qPwZqgnCpSGNHjt2H6wVNlpAb
   iK4vWPW2vMTNoSIfr6W2mhst9j7IT6UdJN1JwLfkEYRYrGOoLKaGqMahn
   OjsSGPki9XBiDAYUluiyz91suAjUmYcenzYSflHXgn+lxjuS/O7eaWAb/
   TWaLtnh1Jg7VWBowWaXmIOw6fzo/sC0zr5Tjc3v1xiP57xABiqkoN4c2W
   qjJiMCi7xx6KNGOp1SV+VXoznlkYkdpxl/1U7p2TQsYFdVRVk/OgAjch6
   g==;
X-CSE-ConnectionGUID: w7uWSLzdRU+c1O3O0HjVRQ==
X-CSE-MsgGUID: tR9dRAxFQTm7oDKc0bJrAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="21706765"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="21706765"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 04:49:11 -0700
X-CSE-ConnectionGUID: u+vCprAZRGKN7RKEv+mSUQ==
X-CSE-MsgGUID: zKpmqKRdSEm6BelDuPpz9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="31478702"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 May 2024 04:49:11 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s28SS-0009UM-2m;
	Wed, 01 May 2024 11:49:08 +0000
Date: Wed, 1 May 2024 19:48:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 334/438]
 arch/arm/common/bL_switcher_dummy_if.c:30:35: error: use of undeclared
 identifier 'fro'; did you mean 'from'?
Message-ID: <202405011959.KP1taYPo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   b158fdfcda0d55075803aa1a7cd4eb1bff2f5753
commit: d1c0d7a0f4560be00aae7fdfcc581711f1df7ddb [334/438] arch/arm: convert to read/write iterators
config: arm-randconfig-r061-20240501 (https://download.01.org/0day-ci/archive/20240501/202405011959.KP1taYPo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405011959.KP1taYPo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405011959.KP1taYPo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/common/bL_switcher_dummy_if.c:30:35: error: use of undeclared identifier 'fro'; did you mean 'from'?
           if (!copy_from_iter_full(val, 3, fro))
                                            ^~~
                                            from
   arch/arm/common/bL_switcher_dummy_if.c:18:71: note: 'from' declared here
   static ssize_t bL_switcher_write(struct kiocb *iocb, struct iov_iter *from)
                                                                         ^
   1 error generated.


vim +30 arch/arm/common/bL_switcher_dummy_if.c

    17	
    18	static ssize_t bL_switcher_write(struct kiocb *iocb, struct iov_iter *from)
    19	{
    20		size_t len = iov_iter_count(from);
    21		unsigned char val[3];
    22		unsigned int cpu, cluster;
    23		int ret;
    24	
    25		pr_debug("%s\n", __func__);
    26	
    27		if (len < 3)
    28			return -EINVAL;
    29	
  > 30		if (!copy_from_iter_full(val, 3, fro))
    31			return -EFAULT;
    32	
    33		/* format: <cpu#>,<cluster#> */
    34		if (val[0] < '0' || val[0] > '9' ||
    35		    val[1] != ',' ||
    36		    val[2] < '0' || val[2] > '1')
    37			return -EINVAL;
    38	
    39		cpu = val[0] - '0';
    40		cluster = val[2] - '0';
    41		ret = bL_switch_request(cpu, cluster);
    42	
    43		return ret ? : len;
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
