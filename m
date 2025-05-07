Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ECF1FFC48
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 06:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598811; cv=none; b=QFk3svdX/NxZJW+gk9sF7rN+nqqpUuggGcoZRiMn4foa9HnhYh8byzXClUF6B5upfXH2UVdf6Isk6dtALg3i4hFf61YR0tHxJl+nQZuvhMXWCW4btNLJbaqGrZ2XS19dz6gMD7sC8BcEzauw6vLMtVkl8HySa3qNecCLJZwTlPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598811; c=relaxed/simple;
	bh=3W/buHVG12RZxIjaLK1vZXLfVnz2PfFaN+4EiK3Yz4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvAZEoHGhsNE3ynBPHDFCAatbM1S6t5X7sqoO8SQYstd5PDtBx341mWs0tT5cm5DT/3Sp6NUkGYussuxtgMKJpF4FPXqrJv9zaBpibnZllIHwD4KgVI6LF10KV9ccmv521Bk+IOMw4CuwPPnnb8i+IH5pwpHGZxkuIuQuCJucKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTpl1IhI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTpl1IhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746598810; x=1778134810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3W/buHVG12RZxIjaLK1vZXLfVnz2PfFaN+4EiK3Yz4k=;
  b=cTpl1IhInCsCPQg4PjUM9wKdkO2ydhgWF4Ju9oMKYl0CFbrhlvZZolQm
   uwLENW6iKL7JD2UKblEWNuJTSNOjUmwUTnx59DE4Dc3Uq/BUyIWA9MCIk
   MGfcC3DvJdx+4D/2XcwY6/kWN5bbSGaJJMJPY3UvfPLIShnwJ8/8sXuaf
   LW2yARAIaS4CrCui5I1Iw1kjXKwcARx4qjEwzo0KUzYHaGi+DpVvlM3bV
   y1gTjKBItGSnKs9tg1HMBvuqfJd7XlCfl3pE5mEVJoQ9tDpPoajYIZ57r
   rgibIA+pFALrvk1luxDAuDGKTnjfAnImeymdZ07LqRObI4GpMjnJC6RmS
   w==;
X-CSE-ConnectionGUID: 37hnjjDsTie9jF8gpUZwnQ==
X-CSE-MsgGUID: G/xDvlMnQIO7kBl84ord/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65717035"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="65717035"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:20:09 -0700
X-CSE-ConnectionGUID: HtEcEBjRSwSDZnY1U3271Q==
X-CSE-MsgGUID: ceyEZVgWRaqz/dVmmWz1gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="173044891"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 May 2025 23:20:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCY8T-0007BT-2X;
	Wed, 07 May 2025 06:20:05 +0000
Date: Wed, 7 May 2025 14:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx-dmabuf 5/5] ld.lld: error: undefined symbol:
 dma_buf_get
Message-ID: <202505071437.IYbKHwem-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx-dmabuf
head:   472d8fb34f0651bf981165606769a5c73f41ce7f
commit: 472d8fb34f0651bf981165606769a5c73f41ce7f [5/5] io_uring/zcrx: dmabuf backed zerocopy receive
config: mips-eyeq6_defconfig (https://download.01.org/0day-ci/archive/20250507/202505071437.IYbKHwem-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071437.IYbKHwem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071437.IYbKHwem-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dma_buf_get
   >>> referenced by zcrx.c
   >>>               io_uring/zcrx.o:(io_import_area) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_attach
   >>> referenced by zcrx.c
   >>>               io_uring/zcrx.o:(io_import_area) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_map_attachment_unlocked
   >>> referenced by zcrx.c
   >>>               io_uring/zcrx.o:(io_import_area) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_unmap_attachment_unlocked
   >>> referenced by zcrx.c
   >>>               io_uring/zcrx.o:(io_import_area) in archive vmlinux.a
   >>> referenced by zcrx.c
   >>>               io_uring/zcrx.o:(io_zcrx_free_area) in archive vmlinux.a
   >>> referenced by zcrx.c
   >>>               io_uring/zcrx.o:(__io_zcrx_unmap_area) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_detach
   >>> referenced by zcrx.c
   >>>               io_uring/zcrx.o:(io_import_area) in archive vmlinux.a
   >>> referenced by zcrx.c
   >>>               io_uring/zcrx.o:(io_zcrx_free_area) in archive vmlinux.a
   >>> referenced by zcrx.c
   >>>               io_uring/zcrx.o:(__io_zcrx_unmap_area) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
