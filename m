Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E90B2586FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 19:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400632; cv=none; b=CLeYAK+qtO6gbjUUDPCu2gTTrAJxXXwxPly1v8lJVzrMA4g1XIYjS+eOpP7cmFolkDlYWNbak8u8H3rOEwodagJZ7zypGvmpZTyZRi37Tw4V3SwpGt1jJ/xF3fxYJHzgxNJkmf2ZjzahFXsZvEGPSFGXtI7CH0CjFHgVY0DB/nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400632; c=relaxed/simple;
	bh=fSASj3Q/XYt397A9PiMZBrABQ3ZoGu0VlW0Y8oMuGvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iq2JUd2Ft1Ap/acgQVX12G849ovXtThcp04EF9xoKRG7WSWDd/uRQAJVbRBFFX2iv6wJyvR0ziJ62GqOBVEePd+guMlewEXwm1tu3Vdx3myph67kyS2kNMdOEjAYbG6z4nfuXbirn+k/e6D+jDZloe82+WppCwICU8XWWoyH1YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuB0shb0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuB0shb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744400630; x=1775936630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fSASj3Q/XYt397A9PiMZBrABQ3ZoGu0VlW0Y8oMuGvo=;
  b=FuB0shb0xFg8t88SwKfIYI6j2ajDwRNqoxizzE5JsBI+BpIYDzn5SHqP
   e5ZSOPSu4qz0HItcZ+oXVXQAz0czCCvHq+IIIlq4QtVUp3H6rq5AMDoum
   LbLxM18zBG42+wsku1SzwBl6dEzcqWkq6idZkA2HvZ/K1CEooeGDj+75k
   IyOg2aBV9Y35hT62u6t+j3jBWagqPbjQCr1vYaeEu8z3ydwFpKrMG/k+4
   pX2nRH87w+4G24tEHB/52Q0XL7e6Qe0/0v8YOCpwq8Cr0YZ+jkd32n+ry
   eIQqQs9sMuaOvTaf5wLAsA7W1jghkev10Rv5tPUpnvdhJc/55+kcNkLBb
   A==;
X-CSE-ConnectionGUID: +lms03XDQfy5wteVT2SyfQ==
X-CSE-MsgGUID: LTmKM40UQH+jjhjB9gKLpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="56945528"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="56945528"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 12:43:49 -0700
X-CSE-ConnectionGUID: Kjo2lURxSlap/+84IZZmpA==
X-CSE-MsgGUID: 8Wc7DE9/RW2OxhSPemP2Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="133378797"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Apr 2025 12:43:48 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3KHy-000BLW-0L;
	Fri, 11 Apr 2025 19:43:46 +0000
Date: Sat, 12 Apr 2025 03:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.fixes 12/12] loongarch64-linux-ld:
 mm/readahead.c:704:undefined reference to `anon_inode_aops'
Message-ID: <202504120309.60y6TZwz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.fixes
head:   662342bfac7e9c924634ae390d3d97294b172773
commit: 662342bfac7e9c924634ae390d3d97294b172773 [12/12] anon_inode: retain EINVAL from readahead
config: loongarch-randconfig-002-20250412 (https://download.01.org/0day-ci/archive/20250412/202504120309.60y6TZwz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120309.60y6TZwz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120309.60y6TZwz-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: mm/readahead.o: in function `.LVL741':
   mm/readahead.c:704:(.text+0x1f90): undefined reference to `anon_inode_aops'
>> loongarch64-linux-ld: mm/readahead.c:704:(.text+0x1f94): undefined reference to `anon_inode_aops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
