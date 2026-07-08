Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6233E16A9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 21:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546873; cv=none; b=TijjwxfW2vjZ842uOaAfEh3IqUZee0MsFd4n7rzvgDRHCc2X1w6OGLuTsvrY2w5P1GX3A6WDChKNl06tJFKBWmyMYxMNJBLkDZ5khJvgciziiqw/B3jUv2qddZulWfzxC8XU+g9x8NDOzL++sGhfn6mbIDwjVBDngfSzmPOI/78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546873; c=relaxed/simple;
	bh=GnIJCVQ1Y2YShRBehpB5iXMu+ygY2z7seRg67MBiXu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K32jqqrNojwKlGkStKTixTPxg/uzxvR2qS7zwBYYbUDccapVvpyKwJ5dzZabThfmrvLOWlAKoQBo9KUp0LVOyjeHvySC0ng4SO/yYXPhJgr5qfEHE+8REzsW1nhQGudOm22I8HuHo8c22+wgt6u7/sF9SOQ/V1JTgi/zw8VV5Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6hqmPLo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6hqmPLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783546872; x=1815082872;
  h=date:from:to:cc:subject:message-id;
  bh=GnIJCVQ1Y2YShRBehpB5iXMu+ygY2z7seRg67MBiXu4=;
  b=g6hqmPLowqvD2aZ0/coD0lIfqwGlc8jlgY1AM4nyNIfH3iYaTCG7PDsP
   1RFxtZHKmoXC1olZR3qpZzG7qCpEamKHePQhA3gCZpHjWPH0hPbUPUCIA
   3vuh92NL9R5lqDxs5P7C5xY9LvHzaE6q7mqICeHcibHoBXxvKIh3qBe8q
   n2y6ju7c3Ji70OUTMRyLKtcrjs6t+z7Np9y/43sEDI6yrRjujs8hvu0KA
   zhL4N9XvNwOmK5eRTSGwB7xoxzsgjobgFppd9oPio9XOrzpSO51urctJc
   Y2CDgImWRNswOBz0+Tp+saMtmJXE/RmkUGZRN0YCM9PD2XoalpM3Fsj6H
   Q==;
X-CSE-ConnectionGUID: 6t7YufDnTWqnpKiOIa94Fg==
X-CSE-MsgGUID: ztaW/UfsQg6NieWXFMjvKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84001821"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84001821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 14:41:12 -0700
X-CSE-ConnectionGUID: aXHheGHSTy2naONgsoEIGQ==
X-CSE-MsgGUID: ECKY+WCKQyK8W7DQwR/NFw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jul 2026 14:41:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wha0v-00000000Gu9-3BVa;
	Wed, 08 Jul 2026 21:41:06 +0000
Date: Thu, 09 Jul 2026 05:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-10 1/1]
 fs/binfmt_elf.c:2162:19: error: 'struct linux_binfmt' has no member named
 'min_coredump'
Message-ID: <202607090538.SCjxfRgL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-10
head:   a03fb833a7fa2cc2276b3c45eb0672ecb2ca3234
commit: f4f03e72ea6da725b2c00ac08216872566dbff49 [1/1] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: i386-randconfig-002-20260708 (https://download.01.org/0day-ci/archive/20260709/202607090538.SCjxfRgL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090538.SCjxfRgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090538.SCjxfRgL-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/binfmt_elf.c: In function 'init_elf_binfmt':
>> fs/binfmt_elf.c:2162:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^


vim +2162 fs/binfmt_elf.c

  2159	
  2160	static int __init init_elf_binfmt(void)
  2161	{
> 2162		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2163		register_binfmt(&elf_format);
  2164		return 0;
  2165	}
  2166	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
