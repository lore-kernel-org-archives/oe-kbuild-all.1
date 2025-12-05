Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A83431AA92
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 19:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764963318; cv=none; b=R18yKkf2Pn+qGR5AF/o3C2xWiJkpR4KPFpsJ8oerSX91yvMaAHBJ9wl/KBbdqmwlrEn0pPjbAmGBNLssAuWLq/BKGmvOECFSoVztaIestECRMpjFCNkJ+kVE93iL3sYF8t7cqN3QEjI+nMDsAclJw1FyRj4Td2Jrun9gEpQZmcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764963318; c=relaxed/simple;
	bh=SwdpO4Mhn7kkTDirZ17Ou7RTs+inrGHQkutwhnyE7WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HjAnlIH8MAj1/J1Vf/3At/tedqCMtCmTXVmzIY0aJJlCudlSr1kb3Ltdca/oqzHBuhhFBnFYDZoD9/EdU43pD/OBodbllj7OAHjwFH0dmfjXdV9uP+1d5Ct8sqBM7BMrYGS60XLVSswXn7BiG0WUc25WO+AGduJJUmySxDh/1gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cmk6AXtG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cmk6AXtG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764963317; x=1796499317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SwdpO4Mhn7kkTDirZ17Ou7RTs+inrGHQkutwhnyE7WQ=;
  b=Cmk6AXtGgLjvZVPVcS0Em4YBrksPH3QK3ShWi3F/Uy6x1TNJ0lwsmP7C
   BMckE8tISbmwB8t1hcU6bHJnYtbleBo7yGcPPw/MYMPMf/zadpMgey6m5
   Y/zeh3iAuYRgvcKgTDFo6qzntGpLQtBltNtI5cfaC8UUNOxnm4m0zee9D
   Ep+nnsmegcZCSbUUzGXT9OHdzXGXlWh5q8/08UWbIwANyQ7DxsMqJJDae
   jCvSiM5xQ5vEnjp1oMOf23CprrHpnikK+1M1MbFWet5PLkKHWOZeaLyeX
   jjbVII/lhH3K7Nm+5Cb9C//kIIWdoXIr3IQacyAoVyI+BXn0Q21/JLEFV
   A==;
X-CSE-ConnectionGUID: Sy7z8O+eT5WkAPOswi3AiQ==
X-CSE-MsgGUID: ajb3nbxYRNKryeqQlKb4VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66190418"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="66190418"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:35:17 -0800
X-CSE-ConnectionGUID: G/KBtbKLTnyAYy4gfuZyQA==
X-CSE-MsgGUID: OKN/nsTLQS+vqZ/rWFv+Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="218717431"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Dec 2025 11:35:15 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRbaD-00000000FSg-1XWx;
	Fri, 05 Dec 2025 19:35:13 +0000
Date: Sat, 6 Dec 2025 03:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3382/3382] include/linux/uaccess.h:232:16:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202512060317.8FXM9zSz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   06a8b520851290347ca458d4335bebc607fe3b58
commit: 8a9bc410e7ccf0bcddb6a6f6ccc526bae11d0311 [3382/3382] arm64: add support for machine check error safe
config: arm64-randconfig-r122-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060317.8FXM9zSz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060317.8FXM9zSz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060317.8FXM9zSz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/iov_iter.c: note: in included file (through include/linux/sched/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
>> include/linux/uaccess.h:232:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got void *dst @@
   include/linux/uaccess.h:232:16: sparse:     expected void const [noderef] __user *ptr
   include/linux/uaccess.h:232:16: sparse:     got void *dst
   lib/iov_iter.c: note: in included file:
   include/net/checksum.h:31:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:31:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:31:39: sparse:     got unsigned int
   include/net/checksum.h:31:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:31:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:31:39: sparse:     got unsigned int
   include/net/checksum.h:31:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:31:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:31:39: sparse:     got unsigned int
   include/net/checksum.h:31:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:31:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:31:39: sparse:     got unsigned int
   include/net/checksum.h:39:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:39:45: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:39:45: sparse:     got unsigned int
   include/net/checksum.h:39:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:39:45: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:39:45: sparse:     got unsigned int

vim +232 include/linux/uaccess.h

ec6347bb43395c Dan Williams 2020-10-05  226  
406637c11f9a83 Tong Tiangen 2022-11-18  227  #ifndef copy_mc_to_user
406637c11f9a83 Tong Tiangen 2022-11-18  228  static inline unsigned long __must_check
406637c11f9a83 Tong Tiangen 2022-11-18  229  copy_mc_to_user(void *dst, const void *src, size_t cnt)
406637c11f9a83 Tong Tiangen 2022-11-18  230  {
406637c11f9a83 Tong Tiangen 2022-11-18  231  	check_object_size(src, cnt, true);
406637c11f9a83 Tong Tiangen 2022-11-18 @232  	return raw_copy_to_user(dst, src, cnt);
406637c11f9a83 Tong Tiangen 2022-11-18  233  }
406637c11f9a83 Tong Tiangen 2022-11-18  234  #endif
406637c11f9a83 Tong Tiangen 2022-11-18  235  

:::::: The code at line 232 was first introduced by commit
:::::: 406637c11f9a834ac362d9fcf9073fb381167428 uaccess: add generic fallback version of copy_mc_to_user()

:::::: TO: Tong Tiangen <tongtiangen@huawei.com>
:::::: CC: Ma Wupeng <mawupeng1@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
