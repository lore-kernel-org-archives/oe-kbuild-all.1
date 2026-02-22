Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6FC2080C1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771754236; cv=none; b=eFnotAho+MnIVfCFgLIBqpnATOzqnd1Myfej7bp5GD/bQeTnqJwuU1KnHYE+DB01E2ZJMWY+hJRPWpvTjGR4ZHRla0DULJOSkz9fIzlujplJ/GpvZhvswAaLBphKO83veLSFjBcv7LgpRn2tpByTIxdew7aRXd4GWSyG55ZYJ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771754236; c=relaxed/simple;
	bh=+dY0fRpXRSJ69H3p2QDNAci48mgdXANsuSfzFnWkOwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uPZfHpVVB39SdDL24JKqj1P4UjHDVHgWvc8PedFDjJvOypKSVA1gJodUfv2eF9poK1k9mkSNKD0jN+xzuYL1pKa+P5+AluxlZoAs/5L+7cI8YMMpBCb9y/PR538lZWEFCrnneoXuh8LZtcgDDNbhUnRFmUXbOZYdyoKOtMWXY8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrYdSf0Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrYdSf0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771754236; x=1803290236;
  h=date:from:to:cc:subject:message-id;
  bh=+dY0fRpXRSJ69H3p2QDNAci48mgdXANsuSfzFnWkOwE=;
  b=VrYdSf0ZgHrNO0+lVfszlVomBEc//h/ipvNVLxiHujA843/7OVc6nGJ/
   AhaXRtJ2ObnTnqsV837YwTeLEn7YEwsHOC7YQC1BH6BcKnM/HZDEDIwjp
   7Ud+KlcPsMYW9nuASCBIUKmEiq8upcRnAPstiLq7drbB6wV0HVhCCoCrZ
   QeyZN1HcyfEGFlnspZTJIDixUVXbp3EOtwA3d9nMOmiuPzuDyTA+FdY/w
   oW9Fy9Sb/7NLR8rDfjr0s2dJy4eQnpQ7Z9hnZc/RFhbyNNaCXR/OsAO7s
   tRa0Zd3YMPVFPCLSI4DBssgD87XRfUxl+vVB26JiUJyCGt6D/I8T+RfE4
   Q==;
X-CSE-ConnectionGUID: q38L0DECQZeyOS5/m/1AAQ==
X-CSE-MsgGUID: 0t5F4Ss6SBuqOU/SYZTs6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72657907"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="72657907"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 01:57:16 -0800
X-CSE-ConnectionGUID: 6aVYcBoeRPS1S6gWhuYGzQ==
X-CSE-MsgGUID: eZVz6Pn0QGmlrQ2J473a8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="245864293"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 22 Feb 2026 01:57:13 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu6D5-000000004bB-3AGd;
	Sun, 22 Feb 2026 09:57:07 +0000
Date: Sun, 22 Feb 2026 10:56:59 +0100
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [gourryinverse:private_compression 14/60] htmldocs:
 Documentation/core-api/mm-api:131: ./mm/memory_hotplug.c:1654: WARNING: Block
 quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202602221029.AVw83S5w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gregory,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: b7d5dc2d24cff71c32c00feeb78dd5ea1902520e [14/60] mm/memory_hotplug: add __add_memory_driver_managed() with online_type arg
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260222/202602221029.AVw83S5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221029.AVw83S5w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Using alabaster theme
   WARNING: ./include/linux/sched/mm.h:332 function parameter 'flags' not described in 'memalloc_flags_save'
   WARNING: ./include/linux/textsearch.h:49 struct member 'list' not described in 'ts_ops'
   WARNING: ./mm/vmalloc.c:4284 expecting prototype for vrealloc_node_align_noprof(). Prototype was for vrealloc_node_align() instead
   Documentation/core-api/mm-api:131: ./mm/memory_hotplug.c:1653: ERROR: Unexpected indentation. [docutils]
>> Documentation/core-api/mm-api:131: ./mm/memory_hotplug.c:1654: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: ./include/crypto/skcipher.h:166 struct member 'SKCIPHER_ALG_COMMON' not described in 'skcipher_alg'
   WARNING: ./include/linux/kfence.h:220 function parameter 'slab' not described in '__kfence_obj_info'
   WARNING: ./include/linux/virtio.h:183 struct member 'map' not described in 'virtio_device'
   WARNING: ./include/linux/virtio.h:183 struct member 'VIRTIO_DECLARE_FEATURES(features' not described in 'virtio_device'
   WARNING: ./include/linux/virtio.h:183 struct member 'vmap' not described in 'virtio_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
