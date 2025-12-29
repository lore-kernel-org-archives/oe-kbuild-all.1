Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61C6281376
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766998810; cv=none; b=dFMv03ZuajkRATMhAY0XTrg7n2oHWT5JZHYSKjyC7ZhIUP82P+ixoPiqoMpubFCbZ+LsymNyPXMnPnhEm8BJvftfGOW3wQofv/x3Ps59oDwaxw0jcuhtNxhnX5Zp4bsXpluF3A3YP3FmioVXQnOUE5f0jww41rO5qhNZVF7N4Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766998810; c=relaxed/simple;
	bh=6PzvO1icrhRnvxs3gnLcwRAV1X6auXbn+yZ1fU8K5IQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rwvhsw21qtGQy1Tm+oMZOIecbfi0Ie3czyc9NaAvJ9/aINTdiPCHbpTrud5ByhQChEKD+9LNlq+GygOp14DsksxL8X7e1sd0EuI64lkYF8SVF7SNXysm9YbZ+pDhXj3jVnNRjt0q9a/UGNY66c7uXiFY3/yrtT371VcfLQ9/kWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLqwgYCM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLqwgYCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766998807; x=1798534807;
  h=date:from:to:cc:subject:message-id;
  bh=6PzvO1icrhRnvxs3gnLcwRAV1X6auXbn+yZ1fU8K5IQ=;
  b=BLqwgYCM7PtSKVQGxBrvBc8WmBtumTJaS6ha3moL8rbotzKksalcld9Y
   /pHY7bWIPyGKJJg40470CCoEXPbyCbm3HqxB3kz0vNZCmwDFN7FaM1L+u
   MMWviKUwmVkPGcEKbtM7E0AfAHt7bh4IrtBksPe69bS5xwf6JuZMXaqHG
   2zzY1QJw9erOG8D3oeII+/AaZ3dqSltJZRb+hNYcKMysVmbQYSrsuIG99
   xauLM0LQwq66y6KJxv/uHIjw17f4i0btGaGjdEMxmegGX9/5Ih4XVmDj3
   7/kF1ffKQ1vl410ICO8cMzWQqOPe/r1HBktwz18C1unYec5sgkuX0gBaR
   Q==;
X-CSE-ConnectionGUID: OUbdJNFaTnSz3b1VFeNyJA==
X-CSE-MsgGUID: KdHTV9waQN+Rh3FwbDYgMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68501284"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="68501284"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 01:00:05 -0800
X-CSE-ConnectionGUID: 6kFAvpyjT1a02+cE4jkQVA==
X-CSE-MsgGUID: hnk42vdmSZ+Pb4URinae8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="231542288"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Dec 2025 01:00:03 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1va96b-0000000076X-1F8q;
	Mon, 29 Dec 2025 08:59:58 +0000
Date: Mon, 29 Dec 2025 16:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>
Subject: powerpc64-linux-ld:
 drivers/media/platform/qcom/iris/iris_firmware.c:61:undefined reference to
 `.qcom_mdt_load'
Message-ID: <202512291605.TWgDhtTQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7839932417dd53bb09eb5a585a7a92781dfd7cb2
commit: 2df158047d532d0e2a6b39953656c738872151a3 ipa: fix compile-testing with qcom-mdt=m
date:   5 months ago
config: powerpc64-randconfig-r123-20251228 (https://download.01.org/0day-ci/archive/20251229/202512291605.TWgDhtTQ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251229/202512291605.TWgDhtTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512291605.TWgDhtTQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: orphan section `.stubs' from `drivers/net/ethernet/ti/davinci_cpdma.o' being placed in section `.stubs'
   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `qcom_mdt_get_size'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/media/platform/qcom/iris/iris_firmware.o: in function `.iris_load_fw_to_memory.isra.0':
   drivers/media/platform/qcom/iris/iris_firmware.c:49:(.text+0x1ec): undefined reference to `.qcom_mdt_get_size'
>> powerpc64-linux-ld: drivers/media/platform/qcom/iris/iris_firmware.c:61:(.text+0x2ec): undefined reference to `.qcom_mdt_load'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
