Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B746C846
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 17:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727364; cv=none; b=Q2y5Dy0X+QZHY/UeldKYxLiORC6AJ3HPN75Y6xxQdRHXjuaPqJ2+B8ARtegUT1f6q1hCqQt+mFfTB2btiVmWaftsuH7gz/qzFRAqO1lru9ufmH4wu5jrNHjvqtqTJJMpegJUIvcwsDF0pYCjP07IZQRUZ8wPP4IRaYCNTMybw9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727364; c=relaxed/simple;
	bh=nQIlEoNmSqwzYleCAmAKAw0CgUJJ8ZgvtXwv95njAMQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PhAPzVMnppdyrc7vDMl8YPHImQj6D1IbtDjmC7hbTUCnVb+kZYy1V8/pmZpUOwTf6TYAqfdA8h0FNGIbotBRdd9E6Oxju9ZaAUmBExv2O7NcIxQQLGs//4zNZMjgTwzbWtQK56gLXSLwMPKF635YZBU6dMM0UsQmh/7SH1DYd6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atkGj7/C; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atkGj7/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786727362; x=1818263362;
  h=date:from:to:cc:subject:message-id;
  bh=nQIlEoNmSqwzYleCAmAKAw0CgUJJ8ZgvtXwv95njAMQ=;
  b=atkGj7/Cgj1vxt0qoXfW1AXXPKR0O5t7j4Lwbo3ut9NW9xLI24OxgWvu
   W8U6I5Por7jD36m+wKZJJP3OldnjFaz6h5KUvtAUnEkw4X4/dWFnHxAmR
   CojFwupOD9YJc3xXrmmKJJJrw2yghymND2I4cCWh5IZdgVmVy2ZADhtry
   cg5Sb3vixotV2IF5twY1SU6xVhAKn2eAZ54sivbCHGWL7G8hb52WIipZT
   HDCvPKhSYXCj7yiAjbBMGcKxk+KwUxcMidGCfKOrX4b6GuWRooDmEPPRS
   0gI4s+Ogi8lZJQp2EwT62tmk650JpNzbzoboDeoxE/nCbID6cofSvfgMo
   w==;
X-CSE-ConnectionGUID: G8nDU+PLRxGmWDm5xRocqw==
X-CSE-MsgGUID: AEMG3GRpRQWzqihp9GcOrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98666659"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="98666659"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 10:09:22 -0700
X-CSE-ConnectionGUID: /edhRFiAT/eDU/ReD5FwdA==
X-CSE-MsgGUID: cvmDjAKtQeeFHQpPrY7uWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="268127780"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2026 10:09:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuvPB-00000000Zes-1K3o;
	Fri, 14 Aug 2026 17:09:17 +0000
Date: Sat, 15 Aug 2026 01:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: chenhuguanshen <chenhgs@chinatelecom.cn>
Cc: oe-kbuild-all@lists.linux.dev,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jun Miao <jun.miao@intel.com>, Fan Du <fan.du@intel.com>,
 Michael Kelley <mhklinux@outlook.com>
Subject: [linux-next:master 14865/15183] kernel/dma/swiotlb.c:1393
 mem_used() warn: inconsistent indenting
Message-ID: <202608150003.3CvGdtWA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2697ef8943c9985c14708a6429e21812693857b2
commit: 121f9fd1c3083312055126205f3e40b8ee999fe6 [14865/15183] dma/swiotlb: decouple high watermark tracking from CONFIG_DEBUG_FS
config: x86_64-randconfig-161-20260814 (https://download.01.org/0day-ci/archive/20260815/202608150003.3CvGdtWA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150003.3CvGdtWA-lkp@intel.com/

smatch warnings:
kernel/dma/swiotlb.c:1393 mem_used() warn: inconsistent indenting

vim +1393 kernel/dma/swiotlb.c

121f9fd1c30833 kernel/dma/swiotlb.c    chenhuguanshen 2026-08-12  1381  
1aaa736815eb04 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01  1382  #ifdef CONFIG_SWIOTLB_DYNAMIC
1aaa736815eb04 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01  1383  	struct io_tlb_pool *pool;
1aaa736815eb04 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01  1384  	unsigned long used = 0;
1aaa736815eb04 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01  1385  
1aaa736815eb04 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01  1386  	rcu_read_lock();
1aaa736815eb04 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01  1387  	list_for_each_entry_rcu(pool, &mem->pools, node)
1aaa736815eb04 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01  1388  		used += mem_pool_used(pool);
1aaa736815eb04 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01  1389  	rcu_read_unlock();
1aaa736815eb04 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01  1390  
1aaa736815eb04 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01  1391  	return used;
1aaa736815eb04 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01  1392  #else
158dbe9c9a3d36 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01 @1393  	return mem_pool_used(&mem->defpool);
1aaa736815eb04 kernel/dma/swiotlb.c    Petr Tesarik   2023-08-01  1394  #endif
^1da177e4c3f41 arch/ia64/lib/swiotlb.c Linus Torvalds 2005-04-16  1395  }
^1da177e4c3f41 arch/ia64/lib/swiotlb.c Linus Torvalds 2005-04-16  1396  

:::::: The code at line 1393 was first introduced by commit
:::::: 158dbe9c9a3d36da824139e5304169326550c6c9 swiotlb: separate memory pool data from other allocator data

:::::: TO: Petr Tesarik <petr.tesarik.ext@huawei.com>
:::::: CC: Christoph Hellwig <hch@lst.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
