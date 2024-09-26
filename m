Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2C4153BF7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 16:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366791; cv=none; b=QNSjO89qcvTMNC7zMXryTBsGwRgGVG5zU8w5VHDxym2pZdjWgguQDkywWQJUneFn3UVa70aKdzd6gXfdnwBj9Lh9tNeRBzMwMi4j6ajKH24DOdOzqi1hLXpyVHl4+WjZEAD+14iqeN2Lg0MVr+/tp1Yva8PFFYV29gsu5WHFTLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366791; c=relaxed/simple;
	bh=cAMdUe2pF9mtK87OeqL8PgkuUwdF9Y/98r36nra6ml0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RdSkzIhLYAO9PL6GjFGFlfhy/j70JGii1ZHgM2qXLBxu63vEFFYZcLNgndNngEk0NU4/e3syz5a3jUy3jUxOa1gjgLM3HJG3D0weKnWmx7lNh1N1bbowrRWgw53kNcm1qg0X5imfpBv8ALKyyz6BgRDk/aIXOWHe6OiArAvCzrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvgQnr2W; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvgQnr2W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727366789; x=1758902789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cAMdUe2pF9mtK87OeqL8PgkuUwdF9Y/98r36nra6ml0=;
  b=hvgQnr2WiEGjACPQ4OQ0UwWN+aJA5rQ5A7JnKtWTiDHtM8S3GcGRw3zY
   2WManlS39Yc1bdDkKD+tVK52FpVz9OIDt//4E+Oea0AgeRtWKWXJ3RcqZ
   Yo+qfIN/Y641y0NiPhmgOdVgGlRrFdoYRAqADXXKXyBsylqe7UCZfstDf
   vs+fmBKl5Bb5+CsDhlAxSUsRj/lpkCOkwBj26+5psY/vRIguLMYSNgrLx
   94wmAzpJDrFcyLxFEAmsl/nnyVr+nEX327vFa7GVIrIiv0kOwrEppw6d4
   I67wtcFClnnn7rprrVi2glTesIFa3VD68TVlKS7xjnwtBeDbrEKxxxgW2
   g==;
X-CSE-ConnectionGUID: mQ/UnwbKR7epsTKDilFXNw==
X-CSE-MsgGUID: /Zjfe9h1SLaDpv85PXqR7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37058997"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="37058997"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 09:06:29 -0700
X-CSE-ConnectionGUID: mMoWO9o3TfmGP5KoLfsuBQ==
X-CSE-MsgGUID: rQ73T50mQ0yaki6ZdxYWYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="77138568"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Sep 2024 09:06:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1str0b-000Kut-0N;
	Thu, 26 Sep 2024 16:06:25 +0000
Date: Fri, 27 Sep 2024 00:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1336/14122] include/linux/uaccess.h:213:16:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202409270023.ToC1weNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   81a41d2ac1de43215c014bc71d907a026042e55b
commit: 975e216e36aa3f7aba9d8e1e1d6cbba7cf692ad7 [1336/14122] arm64: add support for machine check error safe
config: arm64-randconfig-r123-20240926 (https://download.01.org/0day-ci/archive/20240927/202409270023.ToC1weNo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20240927/202409270023.ToC1weNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270023.ToC1weNo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/iov_iter.c: note: in included file (through include/linux/sched/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
>> include/linux/uaccess.h:213:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got void *dst @@
   include/linux/uaccess.h:213:16: sparse:     expected void const [noderef] __user *ptr
   include/linux/uaccess.h:213:16: sparse:     got void *dst
   lib/iov_iter.c: note: in included file:
   include/net/checksum.h:33:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:33:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:33:39: sparse:     got unsigned int
   include/net/checksum.h:33:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:33:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:33:39: sparse:     got unsigned int
   include/net/checksum.h:41:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:41:45: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:41:45: sparse:     got unsigned int
   include/net/checksum.h:41:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:41:45: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:41:45: sparse:     got unsigned int

vim +213 include/linux/uaccess.h

ec6347bb43395c Dan Williams 2020-10-05  207  
59feaaa04e929c Tong Tiangen 2023-12-07  208  #ifndef copy_mc_to_user
59feaaa04e929c Tong Tiangen 2023-12-07  209  static inline unsigned long __must_check
59feaaa04e929c Tong Tiangen 2023-12-07  210  copy_mc_to_user(void *dst, const void *src, size_t cnt)
59feaaa04e929c Tong Tiangen 2023-12-07  211  {
59feaaa04e929c Tong Tiangen 2023-12-07  212  	check_object_size(src, cnt, true);
59feaaa04e929c Tong Tiangen 2023-12-07 @213  	return raw_copy_to_user(dst, src, cnt);
59feaaa04e929c Tong Tiangen 2023-12-07  214  }
59feaaa04e929c Tong Tiangen 2023-12-07  215  #endif
59feaaa04e929c Tong Tiangen 2023-12-07  216  

:::::: The code at line 213 was first introduced by commit
:::::: 59feaaa04e929cf051c9b29e28fb9e1299785280 uaccess: add generic fallback version of copy_mc_to_user()

:::::: TO: Tong Tiangen <tongtiangen@huawei.com>
:::::: CC: Tong Tiangen <tongtiangen@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
