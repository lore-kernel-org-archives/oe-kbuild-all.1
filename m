Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812214400
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443470; cv=none; b=jbkpx2VLaHBSXLjGtI6g/EPIeSvgwJnGiWsLCZM/Q+5UIGQvA5xJ8q4/cBdF+5LgD4HWyavAcOcpuVbn2pM7O9xAT6it7p3CJdieZqFbpVYAIi8+9XbXW7dqbdN1gLiWkF/MIvRbup8R18TDv/RvtxptntN7ETBfOGoiuYU+oEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443470; c=relaxed/simple;
	bh=PRrRS6udJGFeFV4/U2+28NNLTw3pd+F/50vSe5N9WVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=auXScI9h5Vhiv+EiXH6A3ffPt9JIJMCrlQ/LRnvSrUSY63XpVnQMdq5wzs5vOOD+LynjZQSEKNbsuMRg7+WGvwNpqIQIgS5zA8da0Ffyi38Vu4Dcs6HefRb3wTfu6tmA66HjmqvKUASLK4cC5KFn8OUH7RmNeQkJyxFz3VHyeRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTDBoM0s; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTDBoM0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772443468; x=1803979468;
  h=date:from:to:cc:subject:message-id;
  bh=PRrRS6udJGFeFV4/U2+28NNLTw3pd+F/50vSe5N9WVs=;
  b=MTDBoM0sIlpM4Vod3+Ayg6OKdoDzt+4VPyFphHPaJZu2Cea6s0JJSm0W
   S/tZFPcm6UWBSKM5spxbe7tFXYutmg/CMJiveaz4gEBgU72tws6JT5B4I
   hiZSwdOGqQt/3NTfQ15o8qlI8j0szNIaeyXN7bHEINYuwAdI8xgN6Dl6E
   w4z3foG6vlJSaixt2/SuOmSKJP5DPCSHn/qdY+xQVd5/PWF6sUHPQ9/aW
   +oCzeJjh2gAvamFPqnG1DNBZPJBk4pFNfZ0hGgvab6ansbEkDtY5w7NsY
   uEyr7oe9zm4urCpmI96Ns4Rm42/yG9INXbPCn47S2uo61ysxBCLWY1w2e
   Q==;
X-CSE-ConnectionGUID: RC6OYNT7ScycrbCpNQQA3g==
X-CSE-MsgGUID: ApRhnMtDTQi5+UHrJIX5xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73557301"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73557301"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:24:24 -0800
X-CSE-ConnectionGUID: MXX/bqS2RRW/JQh0HuGMtQ==
X-CSE-MsgGUID: B7F+aWaCTEKnHs0vK7zcQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="255450560"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Mar 2026 01:24:23 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwzVj-000000000g3-3vb7;
	Mon, 02 Mar 2026 09:24:19 +0000
Date: Mon, 02 Mar 2026 17:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Theodore Ts'o" <tytso@mit.edu>, Zhang Yi <yi.zhang@huawei.com>,
 Jan Kara <jack@suse.cz>
Subject: fs/ext4/extents-test.c:59:3: sparse: sparse: symbol 'k_ctx'
 was not declared. Should it be static?
Message-ID: <202603021708.wwwXBbbO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11439c4635edd669ae435eec308f4ab8a0804808
commit: cb1e0c1d1fad5bfad90d80c74ebdb53796d8a2db ext4: kunit tests for extent splitting and conversion
date:   5 weeks ago
config: arc-randconfig-r131-20260302 (https://download.01.org/0day-ci/archive/20260302/202603021708.wwwXBbbO-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021708.wwwXBbbO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021708.wwwXBbbO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/ext4/extents.c: note: in included file:
>> fs/ext4/extents-test.c:59:3: sparse: sparse: symbol 'k_ctx' was not declared. Should it be static?

vim +/k_ctx +59 fs/ext4/extents-test.c

    49	
    50	struct kunit_ctx {
    51		/*
    52		 * Ext4 inode which has only 1 unwrit extent
    53		 */
    54		struct ext4_inode_info *k_ei;
    55		/*
    56		 * Represents the underlying data area (used for zeroout testing)
    57		 */
    58		char *k_data;
  > 59	} k_ctx;
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
