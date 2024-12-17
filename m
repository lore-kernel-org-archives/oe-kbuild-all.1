Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC9013D891
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 18:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734461355; cv=none; b=MDcwj+oRAE9V7750N+v37AoymiaVkBUBQuWWZpKujgdCQ+zBCuwz02sP+FTO0vEiJKARVjZZ/i8GQZIJBzjmeIMgk9sGCFvx5NWj1YNDX0zPKXrPdKv2H/6r9/XGHC6JDl2S7GVz7LBSuTN1lO+D5p1+XsGU+xSWR4ljDpJh+lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734461355; c=relaxed/simple;
	bh=fEk4NxewXXRxoa3kK9GRwmRF7zJM5vOctP/2ONAbGmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVMm9WSLAEHc65Esn20XJcc+GdPF6TAcQFMOyyawYSGh2tvW6e0ny9VZNJqSIJxvWKH4C5N3jojf8ZZl3hqPXGe02pmSRnACgQUXH7Sp5Rp0gVCk+FosWrQE8GIADnoBBbR0qg67lLlU+qBgQCB6H9OXZ4cOHtbjDG2Q0d0omaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1q+nr1x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1q+nr1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734461353; x=1765997353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fEk4NxewXXRxoa3kK9GRwmRF7zJM5vOctP/2ONAbGmQ=;
  b=b1q+nr1xyw5JMwTuWnMqZmAA+Q4qBXjv1UIiCNiwZuzcFbpI5gDVvTOF
   g2khAYtYdQqxtKJLVlCJghCR1wEumcgl7zFuz+6lqDj7JP4Ffur+5h+lh
   cKSoOfyLd1OR6M3Zw/3X7AMYz44pcytOYH0p8g8iRmVpT2nzv/V+hHioT
   ytsBDzEt2bFPySM7f71eRvc4oXdzNNptM+48TJCj8+RDao3a/iKJRvcx8
   JhQcFhLvDOaxsbKZcs6ONus14Zl+M/MaTrztLd5EFZ4HVHByF7jsSywIj
   LNqJvWgiP7jad9T/ea6bToB7p+bjmeSwEdeVY3GH1dWttr+kHUaVXe70C
   w==;
X-CSE-ConnectionGUID: 2/aNnLZPTYu8JHXYBRqdGg==
X-CSE-MsgGUID: Q6EOsi83TMyNzrZQhEXoOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45387762"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45387762"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 10:49:11 -0800
X-CSE-ConnectionGUID: EWPZ0RBnQSSmHBz3nJd97g==
X-CSE-MsgGUID: 5Wh1zmZ9T0StAgl5FNoxpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102213813"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2024 10:49:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNcd1-000Fjm-3A;
	Tue, 17 Dec 2024 18:49:07 +0000
Date: Wed, 18 Dec 2024 02:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.14/io_uring 40/43] io_uring/rw.c:215:26: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202412180253.YML3qN4d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.14/io_uring
head:   7b7bf14f00521ce9adcc7df4df66bc6d4f31a054
commit: 8cf0c459993ee2911f4f01fba21b1987b102c887 [40/43] io_uring/rw: Allocate async data through helper
config: mips-randconfig-r131-20241217 (https://download.01.org/0day-ci/archive/20241218/202412180253.YML3qN4d-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20241218/202412180253.YML3qN4d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412180253.YML3qN4d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/rw.c:215:26: sparse: sparse: Using plain integer as NULL pointer
   io_uring/rw.c: note: in included file (through include/linux/thread_info.h, include/asm-generic/preempt.h, arch/mips/include/generated/asm/preempt.h, ...):
   arch/mips/include/asm/thread_info.h:69:16: sparse: sparse: self-comparison always evaluates to false

vim +215 io_uring/rw.c

   210	
   211	static void io_rw_async_data_init(void *obj)
   212	{
   213		struct io_async_rw *rw = (struct io_async_rw *)obj;
   214	
 > 215		rw->free_iovec = 0;
   216		rw->bytes_done = 0;
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
