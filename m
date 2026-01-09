Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D13164A9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950365; cv=none; b=HOkAzEcZ4rlorbyuBXBv+yJmu6MpFM2JDfZzkMzOGetgwtIAOvRh5rj0exPxQKa7ZfpEe2F5V/+J2l1Vl0Udwn7/I3AYUXEYcQbNu2b+t0ek1nHhE/7qfKl+2pHicURo96Kyt6wCJwzXgHOmcyAJ7aBIsKmRlWULrZjTf9akeTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950365; c=relaxed/simple;
	bh=aGsibReEfrTjInWCppzH1T+0JAy/6C+Y5cgbfsPb4Wk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=efiLubnLqTDDviQD/LkaZnX4jGojEoVrgDguRkGMgzhQGNbkWn3rtLZEWhTZfRR/BjsQ/9xMeywH+84sYkyvyRUx83fUvJak1c8CWRMAWr5R21imC6gHfxnK9ADLrdSvUr8LxL/YjWYKeaAgBbsFTbBVYwH144q8whqRBG84XYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lws+UH0m; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lws+UH0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767950364; x=1799486364;
  h=date:from:to:cc:subject:message-id;
  bh=aGsibReEfrTjInWCppzH1T+0JAy/6C+Y5cgbfsPb4Wk=;
  b=lws+UH0m4BF90R5FBw1SOm7eS6zUe2nTAAQVGz2aqNq28OHMmaguh3Hi
   MrQAd8RzJMB3ofYtXsvy3BtqmghiJAySapdgaTbC2wOKtLH8sHJlA58NI
   JM3/B9X2kcgeeCnZu1/S1cb6hKvlYrBwBxDnifLQ1Oam9g1CIbNxY4UKw
   PZhHTbdrAAbdSPmQ6K4VK8ZuTivn+KaZ0UxqPi8XKjZuZMojjWjzc4Nd/
   Sm8fVw+275IBWsvWtBOcLysiADzhYGtlbEQoG3DPe0kZ1XcHuK3PQITm/
   90ja1TOhrk+bnvhg1AnLnDQY8Av5LWlhmfgkCstUIFfy6W7Kac/RrG3LT
   g==;
X-CSE-ConnectionGUID: q5VRW3DQRgG8p+kQAFUxDQ==
X-CSE-MsgGUID: M5nt8jE1QpeBgHQzDERrwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79970837"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="79970837"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:19:23 -0800
X-CSE-ConnectionGUID: JZd3yQa4Twml8K2x4SroFQ==
X-CSE-MsgGUID: iO9xzzR5S0+Zc65eD5uPXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203503515"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2026 01:19:22 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve8eN-0000000022e-156Y;
	Fri, 09 Jan 2026 09:19:19 +0000
Date: Fri, 09 Jan 2026 10:19:11 +0100
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [linux-next:master 4781/5095] Warning:
 drivers/gpu/drm/drm_gpuvm.c:1836 expecting prototype for
 drm_gpuvm_bo_obtain(). Prototype was for drm_gpuvm_bo_obtain_locked() instead
Message-ID: <202601091040.lPSKlbaO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: 9bf4ca1e699c272defe9636f9812ff33a448d650 [4781/5095] drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260109/202601091040.lPSKlbaO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091040.lPSKlbaO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091040.lPSKlbaO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gpuvm.c:1836 expecting prototype for drm_gpuvm_bo_obtain(). Prototype was for drm_gpuvm_bo_obtain_locked() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
