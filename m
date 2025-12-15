Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA421CA03
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 01:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765761235; cv=none; b=LSJn8APHExKF5Sj41txp3qCDj2LpVh22UPIP5+koDwJwB4w1o6Ip/4v+mcuwGzCZqXBzhXW45ixSGU4kD20LSI6qXaZmxiVQIL3ylWloOqo/wD5gUI42pDYrcIrgTYnAEywvTBipopyKPSvxg680QimL80HZE3NEeE14v0ROh8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765761235; c=relaxed/simple;
	bh=gCbw87rs+txf2uf5c+W8HQEz5jl10HgNLa9gSZdWpvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HwoO+oA/mcj8ol3iepall8NKA6ltlMuJLXIZWCsOpE9nT3R92olVgQ2Nc7BF4Zk60gFPwFAPhAi+0xrm20IyGuG6Ni+b0P9vE9FJ7Jj1m76kdM37q79QFU8z/rEUgt/nbhXoo9/1yTX901LEIYp0D9i4pvtQO0c/8yK4T195gEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcl95Sgy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcl95Sgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765761233; x=1797297233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gCbw87rs+txf2uf5c+W8HQEz5jl10HgNLa9gSZdWpvw=;
  b=dcl95Sgy+2RovHdk+68qT4WU9D7RH7bQEcLikpf1o/qlkJUYWuG63/bG
   gCW+zKcOuMjAKzsuThKJv3zn+gL+H+hmGTxgdnJYAD5cpLW4Q2pTnQdi7
   FM2SsmtEHNO/Ks4amIVxq1FCJsPN+lYNuetdLcKXhNWlBNriH1goAH3Qh
   56Zp9QLI2MtXuLVkpAjt0aNflprO3Sm+Yoi/N/lX6+6/Wwxf7XsOx/tkT
   VAwcf5knvOxzEAHvYSrUxiiEHbcmcJX7N4fSRMfhB0jpLICX43o/pmnvP
   dEeTC8FOzL1fzHcfBqSjvQnzhqDNlj8w3/J9LAn74qWmzxQkuKE+MuSx3
   g==;
X-CSE-ConnectionGUID: 0HKbMhLBSX6Kfcf/xZnqSA==
X-CSE-MsgGUID: GZUnAy4UTpaYeZ/t3E9z+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="77976145"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="77976145"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 17:13:53 -0800
X-CSE-ConnectionGUID: aiBBS3/EQfie+i1k0GVXpA==
X-CSE-MsgGUID: ZWTUtu93SziDedRd1IwH5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197644976"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 14 Dec 2025 17:13:51 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUx9p-000000002Wy-1hSe;
	Mon, 15 Dec 2025 01:13:49 +0000
Date: Mon, 15 Dec 2025 02:13:44 +0100
From: kernel test robot <lkp@intel.com>
To: "Kooran Paul, Princy" <princy.kooran.paul@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [intel-lts:6.12/emt 0/9] htmldocs: Documentation/gpu/i915:565:
 ./drivers/gpu/drm/i915/gt/iov/abi/iov_actions_abi.h:177: WARNING: Blank line
 required after table. [docutils]
Message-ID: <202512150213.ahUVZVai-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   aac28a88afc1d68448c7e5672fed4da83e10fe8b
commit: d1d592bf75f7753518169d36bcc2dd9d196e27e3 [0/9] drm/i915: SR-IOV Enabling and Support
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512150213.ahUVZVai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150213.ahUVZVai-lkp@intel.com/

All warnings (new ones prefixed by >>):

   +---+-------+--------------------------------------------------------------+
   | 4 |  31:0 | **PTE_LO** - lower 32 bits of GGTT PTE1                      |
   +---+-------+--------------------------------------------------------------+
   | 5 |  31:0 | **PTE_HI** - upper 32 bits of GGTT PTE1                      |
   +---+-------+--------------------------------------------------------------+ [docutils]
>> Documentation/gpu/i915:565: ./drivers/gpu/drm/i915/gt/iov/abi/iov_actions_abi.h:177: WARNING: Blank line required after table. [docutils]
   Documentation/gpu/i915:566: ./drivers/gpu/drm/i915/gt/iov/abi/iov_actions_mmio_abi.h:81: ERROR: Malformed table.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
