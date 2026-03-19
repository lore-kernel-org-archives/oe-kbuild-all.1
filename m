Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51132D9499
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932049; cv=none; b=Kqajg3eqvfpZQkfE57aWaGi6maZQxJvLSHRcwlyVnoH7mLaan24d3Gcz/v0a7Ya5eSQIYTByLmroUzvo4+lwaLqiOyyrmyGhyxmCVJw1iUrL1WxEZNA+2OegclpWewlbpgwDxkQcRyrUhen2E5hjh6zpgyRgOGh1zpf7qu3kTe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932049; c=relaxed/simple;
	bh=ZdXys+GsHEU02ZqwwzrCK0OohXvfKe2awdPIZnBADKM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q/YYqpGKnTYZkd58QTYj34QmMCOYZwVUoKPNFMBJlMpYeNuGlRzHcGVPhjAGctP8qpvJyZjpZFj8hRy8BZAEyZoq/4S2djhcmHYNil8VxePMHC6XDen2++j8RPU0/DPbb+tSAChA0uj86bOb4k6kM8WCPH8tng0WcqLg2Sbv7SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyoxW2SK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyoxW2SK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773932048; x=1805468048;
  h=date:from:to:cc:subject:message-id;
  bh=ZdXys+GsHEU02ZqwwzrCK0OohXvfKe2awdPIZnBADKM=;
  b=MyoxW2SKLAew4ud5nRT8rEGiMC9/5aIJPSNLP1u6rEvvzlZuv/rcBWq1
   Y1yJWxOJ9Y+ihYVSU/7MZhmQjE7Rgm7zK8Er/HAnmM2mJ7YkY3OXOMusY
   X0sgGSHjZ920zugO7hYNb46a6wqVhPXSdAzBTHgr15Mn87l2c/jxpUDHF
   g0GxjZxpySqKHgvDRhyWIAEbW2TMJEKamO1/QiGPdhsE6x1Z9w0OBgduQ
   HSqQ4xx3uj4lWRO7U68UOvqYlAVVcJynvzKLFZXG6agegjlCHxj1tF3U3
   8QTVwIYfPUz0PdcCudeTzvRyfrF5vLelJeVEg22a7mQgfHeTKfi5/dB50
   A==;
X-CSE-ConnectionGUID: PkrFnN+nSpmqLLg8EIwL4Q==
X-CSE-MsgGUID: Z4Vbr1bMRI6THLNEcb5+NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75121187"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="75121187"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 07:54:07 -0700
X-CSE-ConnectionGUID: eIWTeEV1T2iIUgzLBLlwOg==
X-CSE-MsgGUID: cFOQHz6HSsWm2KW8mnVEFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="223015038"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Mar 2026 07:54:05 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3El9-000000001BJ-0tbK;
	Thu, 19 Mar 2026 14:54:03 +0000
Date: Thu, 19 Mar 2026 22:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Johannes Berg <johannes.berg@intel.com>
Subject: [iwlwifi-next:nan_mac80211_phase2 20/58] xtensa-linux-ld:
 mac80211_hwsim_main.c:undefined reference to `__umoddi3'
Message-ID: <202603192225.LZDPU8VK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git nan_mac80211_phase2
head:   8a7956fb02f984ce9f2e0d7787407d3d8e8eef55
commit: 7dcfa1e028ca06e781a13f1bf1b6c77bb287dc47 [20/58] wifi: mac80211_hwsim: refactor NAN timer handling
config: xtensa-randconfig-002-20260319 (https://download.01.org/0day-ci/archive/20260319/202603192225.LZDPU8VK-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603192225.LZDPU8VK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603192225.LZDPU8VK-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/net/wireless/virtual/mac80211_hwsim_main.o: in function `hwsim_virtio_probe':
   mac80211_hwsim_main.c:(.text+0x4ce8): undefined reference to `__umoddi3'
>> xtensa-linux-ld: mac80211_hwsim_main.c:(.text+0x4d66): undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
