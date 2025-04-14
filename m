Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CCF191F84
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 18:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653701; cv=none; b=B7M0n7HArCf4XiFGdLIrokZ2yqlPkMsNNlPsUd6/gKkfx+I0nEZjKUS9vfDwvk2zXt5/nTBKHf3Xs6X1l2JDVrRA2pctKAvGtHXOIiT3Vsbid+y+hxmVjHJy8eFKUJXEU9jDkjuW+HKWU0j0xYNVRjcwcBgtzoVdARWxENfbpeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653701; c=relaxed/simple;
	bh=RRcGodvs3VSfwJxKODhdNcG0n1Om26c9Gz74fiFV1hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHFjg3Wsxp/yWDMj+6Jx7WzQDpUeUEli9ZktfGkola4LzLOjd9wJNRSDhsX85QTrvuRuc9N983Kw2JmdeSKfnuFvUGST5d5JTzCQWqJEghMyw39j1BuSI8RIh0uOn76ULtqp/lhcsoZ1g3tVtvq6UMWNn5rgywL6UU78QlswqdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbF+FRUx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbF+FRUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744653699; x=1776189699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RRcGodvs3VSfwJxKODhdNcG0n1Om26c9Gz74fiFV1hw=;
  b=XbF+FRUx6A7t7ab9mfyULpOEIlcyvQspigiEgazBVmMFBQP91ktktxlA
   PpvP6YTXIdSZInwN1WA9p0tauWZFsnMI/YQE8a6By9NgdAi+iCWmM9stw
   mvHrB5N4wFouxpq2ThnOc5qjlGkxJFey6dGQ9vFGu3svA9wtnj2zk5Jqe
   QJm2jFNLltQIUWqKCrerOP1vTOhzOwt/ML/DeRVKNU/pGT13JhRElPmJx
   rLSsEwnXNr6bQ7jVOO0Fpar0wMD9NkXvubGSWmoa4u+GgNGSaDy3A754r
   igm+CpKb6a7yCqnic6IsnpBFwm22OZshwSCBYrfZvfQKXFRKSwiOrWgZw
   Q==;
X-CSE-ConnectionGUID: YDU+A5z/R42H1MhsbTLF8A==
X-CSE-MsgGUID: ShILh4ZjQoiDMlGTViwmWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46047516"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="46047516"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 11:01:38 -0700
X-CSE-ConnectionGUID: qac4oAgtTdOmF2KACWW9kQ==
X-CSE-MsgGUID: ig9Pf+BLS7eW5K72VynHgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129728309"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2025 11:01:37 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4O7j-000EXw-0Q;
	Mon, 14 Apr 2025 18:01:35 +0000
Date: Tue, 15 Apr 2025 02:00:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2861/2861] llvm-objcopy: error:
 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory
Message-ID: <202504150150.pd024mOU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1afd05e282420aba2d2fc2132a8c2e52d4d9b253
commit: 5476cb89ef2297bd36f8b38e27b54617b6f63236 [2861/2861] x86/vdso: Implement a vDSO for Intel SGX enclave call
config: x86_64-buildonly-randconfig-003-20250414 (https://download.01.org/0day-ci/archive/20250415/202504150150.pd024mOU-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504150150.pd024mOU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504150150.pd024mOU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> llvm-objcopy: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
