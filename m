Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ABC3B0AC4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 16:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022204; cv=none; b=DgtTmWklzbZzLQdHoiwcZRNzaRbLtVPLT81YDzvIDVyh0G7+rf79pbnLh4U9BHcCcBcnaEhjkb1xDbKociHf9LCDmJ+l/Po2FNxcJcffn4opbNXloJ2rh1qep8d8V+Dnfrp6Jv4DrwNMVMVSpxoFlT0u0lW206xgwIXNyf7tvSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022204; c=relaxed/simple;
	bh=4Rh76SwmnDmAD/Q86RRDjEUdsE0kEl/n1hBiCLEO7KY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AnF5cObN4weyWBM4sG+qoTMu5elfYK68LcsaNs35AKBJ43CUOCRxXNOqRebS9CQfqeJCBhna5IMZfaH7W6ZM7Ye6q5zW9TR7pxTTUq4c76/MtcRpjXr2U9y78emwKMSkp3oX0SmzFamA/TujLCoQxkEzfw3KSyAOk+bFYPx/c7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuaRo4CI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuaRo4CI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781022202; x=1812558202;
  h=date:from:to:cc:subject:message-id;
  bh=4Rh76SwmnDmAD/Q86RRDjEUdsE0kEl/n1hBiCLEO7KY=;
  b=NuaRo4CIHsLN9tPQOGC6AnosUB4Hcd4mkhswk+pzlgNvbFU5cn/tsFO7
   nN6kFxFF+V3cBmwVfQ7n8jIEFqSvgF4HZYWUJKYjQZ2iWt4nnlupkgCTJ
   UyVuQjgnpYleGFzEUZhKfLWSxRo6CXgFmVDB1l+JAqHDTQJhqa7Qm0alK
   ZBSlEfKSrYyrtPMbsUkEZ5hCfFjJcKDi6D3MP2JFBriz1Rd2h4trXYmVj
   CkVkgt4D9yos37vKiUii/ZaCqm5bYG0g7VL7hVJvd6bxCulf2fmX3nbky
   ZQAK2LtzgjpM9kAVBfpGDdJXhe1MSODREgl8cUqQRFedQu22pjD0GXE0c
   w==;
X-CSE-ConnectionGUID: 3zk7KHhoSlyZTcXVXxL+DQ==
X-CSE-MsgGUID: YQa+S1oRRg2mMy53yjDXqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92355255"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="92355255"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 09:23:22 -0700
X-CSE-ConnectionGUID: /q+sjw7HQsiy+0wyO+7g5A==
X-CSE-MsgGUID: ZH7Djc5mQbqs2IZwgikEoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="250188499"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2026 09:23:21 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWzEU-000000003TZ-2fb0;
	Tue, 09 Jun 2026 16:23:18 +0000
Date: Tue, 09 Jun 2026 18:22:54 +0200
From: kernel test robot <lkp@intel.com>
To: Zhiping Zhang <zhipingz@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/driver-api/dma-buf:145:
 ./include/linux/dma-buf.h:121: WARNING: Block quote ends without a blank
 line; unexpected unindent. [docutils]
Message-ID: <202606091818.rizEWJZ8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Zhiping-Zhang/net-mlx5-free-mlx5_st_idx_data-on-final-dealloc/20260609-033856
head:   17018c9e3c4f48eeb0404a61fd0cf942eaaddbb8
commit: 90816fc011a0d8855056adba3208381d2129d29f dma-buf: add optional get_tph() callback
date:   21 hours ago
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260609/202606091818.rizEWJZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606091818.rizEWJZ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/dma-buf:145: ./include/linux/dma-buf.h:120: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/dma-buf:145: ./include/linux/dma-buf.h:121: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/driver-api/dma-buf:145: ./include/linux/dma-buf.h:123: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
