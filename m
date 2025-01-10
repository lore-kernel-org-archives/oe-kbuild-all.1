Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3833B1A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516216; cv=none; b=aj6ecbmxtQwYSuiGnxwo/OkulRIfj8KfNb5Q2t4JSzjKo1vZI89fafqRq1vQ9ZCPMh4HUXvWKGLLZKnxfydpmKgEaK8R1cmos7lg7jjyNCaGsuJ3h0iX6UHsvZLf1ZzL6A4m9qIeoB7onq8x9sbJJOLAEv1PgQip5XXA7IHB1iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516216; c=relaxed/simple;
	bh=kbz4InWBPBUsfSlL4o//L1hAZKupgN5ZkxP3sIt70zM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ooRmnLyibl6YxjPRRMSdlNUAt7StYyi+bit039o6TqGnTyBuDAvCyphWH6TLfuR+xwTRc1HepfKWcIfVnmhvnJYFgVpo355Dt9DiE5ABDhxHlCGZkpAuYt5e15HKNgGfVpLNmYKmvYMfnu3hqLKYR7qKRcr/JFVKGQbnTUIE2Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sj9/500v; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sj9/500v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736516214; x=1768052214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kbz4InWBPBUsfSlL4o//L1hAZKupgN5ZkxP3sIt70zM=;
  b=Sj9/500vqrQYrlST07/fKqOn19g02+j1dqOiiSQ/sKnpFy2xgQfruzSK
   Kkuo1IOH+ZifcP6P3H4QegB9MuH7CY7onvtOBvxty/n3BrjXzT3wG4jVC
   bvjZIkAnECJyJImSOgbSgP9KvPz2nEap08hvrB3LwlWHX1xpGXCwE/Y/x
   NTrPWGcxFM3I7hNzrk6gYMsgevzl8hLX8L6m0u/zvV8nzOaz5zfwJqW02
   S0zSJz62RnSYkuvjFVb63WT271ojK1QZuhRdqm1BNb7hE+1qyYH5me2hb
   xqp7AF17ffsVhE4ezD1bnEKYcetiTHRSTbU4KAFbb7VkM+VphHXHVyXcC
   w==;
X-CSE-ConnectionGUID: UySKA+/zQq+PlP9NrY0FVQ==
X-CSE-MsgGUID: byRY12I4RAapE61UCLoooQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="40750739"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="40750739"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 05:36:53 -0800
X-CSE-ConnectionGUID: 2kk6tj5wRbmqcWCWIVr4mg==
X-CSE-MsgGUID: sEUleNyKSde0he8ySHr9qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108837058"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jan 2025 05:36:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWFBy-000JGx-17;
	Fri, 10 Jan 2025 13:36:50 +0000
Date: Fri, 10 Jan 2025 21:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1]
 drivers/dma-buf/heaps/cma_heap.o: warning: objtool:
 cma_heap_dma_buf_release()+0xaa: unreachable instruction
Message-ID: <202501102128.OrUBFHoI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   c6c375c99eb5a2435e39f3c3a3416a838cfd1637
commit: ec0437c0c80b584b517dba4586dcf20de8e3258e [0/1] BACKPORT: dma-buf: heaps: Move heap-helper logic into the cma_heap implementation
config: x86_64-buildonly-randconfig-003-20250110 (https://download.01.org/0day-ci/archive/20250110/202501102128.OrUBFHoI-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501102128.OrUBFHoI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501102128.OrUBFHoI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/heaps/cma_heap.o: warning: objtool: cma_heap_dma_buf_release()+0xaa: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
