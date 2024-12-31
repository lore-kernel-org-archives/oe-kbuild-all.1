Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E497A19CC1F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 13:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651812; cv=none; b=Pqb1fllrHQt1L0jRUq34niMWf4H4CtxlBGxvXqgn7iZnUK305RKJWSG+s9JVXaQ/O3n9othWxOScwQ9Ex0AFrYViT2A9CQqO+m0BDD9zdnoRiVAR/N6ioWvLcr8oiz1y90F0zRpOLWK3zLR+q2sB558FNHr/CYj1mhCc0yD1E6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651812; c=relaxed/simple;
	bh=F7IWlmHStt02YDfpquijsAzZH1+QASQoZZgG4OyEwc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FiD1Zgo22IinYUFEwkb+IZ+J4w8t4JVLNkEAQwE0VeICRj5qt2ZZVO9xStonCijuxDVVYkNeAsMU7BTpNo9xaJYMT4iesdNvjaQtPgqPjN9zcxmmqC+31Iic2rjbeX6PsHqlvHdslPFOaqJOBA0aXUd+LlOfjtMAX5pb9G65dYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6yvEvb9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6yvEvb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735651810; x=1767187810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F7IWlmHStt02YDfpquijsAzZH1+QASQoZZgG4OyEwc0=;
  b=P6yvEvb9R4NW2m+ea6uwySSP3PqEG1Tg1Ib8GCIK+QjLCF9kL38mvnqE
   vRp1eNwA1No4ZpfdAbtOLo+zG366WEJfa/E7+EEOMjFI6w7hGK8DqNEsK
   3z6BVOTI7fl1B9HSCOtGOQLxvU96cO+FfF2GyHf3cvGsJBd4cDe+fAJ1d
   kR/ck2blkdI0aB4hlzay9prhRHbmkQI/Rw9LZYsvcm71tj5t0TcOhi8Ak
   mWuVHXZoffTKFME2aeszogTSbkmu69uNirSkot3+4mk9r4KEHJ1x7VGgS
   1VALz2Vqoo5dFmbzxqJemjS4qcuSgZWbA0Hz9yis6sFlENIewVj7Xpi53
   w==;
X-CSE-ConnectionGUID: jP2rLDUlSImUHyAlpRz8IQ==
X-CSE-MsgGUID: hOna387hRaOt2FGGSz3FsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35240969"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="35240969"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 05:30:09 -0800
X-CSE-ConnectionGUID: 5Oxe2eVdRjiX22TCPQpz7A==
X-CSE-MsgGUID: WlpDKd3PSrG+bD83YtChtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="100910969"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Dec 2024 05:30:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tScJs-00078d-0t;
	Tue, 31 Dec 2024 13:30:00 +0000
Date: Tue, 31 Dec 2024 21:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2602/2602] mm/mmap_lock.o: warning: objtool:
 local_lock_acquire()+0x113: unreachable instruction
Message-ID: <202412312133.jFxSqSa3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   55bf638d3d29c53ddd64ed89efda8b70b47ccbbc
commit: 5dfa8607b07495ea25ff57217c60aebbf69ebaf5 [2602/2602] mm: mmap_lock: use local locks instead of disabling preemption
config: x86_64-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241231/202412312133.jFxSqSa3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412312133.jFxSqSa3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412312133.jFxSqSa3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mmap_lock.o: warning: objtool: local_lock_acquire()+0x113: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
