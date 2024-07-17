Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74CF6FB6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 19:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721244750; cv=none; b=dNFysjZcifWcP3uuZZvqFWcH8ujcuho4oCyav1omL4HbTh7kNFGH+Yfzw8buxsoGkn7XVGE+Zf0ctL7pNkeU/zcTGiRKIyS77VC201n0Rdyi1Y/XbvEK35REGwK7bNYkiWZfyRfS/zPWaUFyHM47hudNK4mdUby779Gq+990tF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721244750; c=relaxed/simple;
	bh=+yXGsvy03qtPnHLaZhDC2IYsfV9dLf9DiWYZWbPPUKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b5ZviyFd4adC292b8umTMKz92o/hlmoY6sweaLXKDdJw/ZzHkRYsNeewVqdQ8F0w8vRdQqdkis6wV324YW69tgH7Gt4BFT/apwvbOsqoXAppi/5ueQyATWEUXFsaYznxb/dBBhFMIyyspfwm1K4pe1Zn7bsDHn+OZljUvfzYncY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jL5cPwfL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jL5cPwfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721244748; x=1752780748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+yXGsvy03qtPnHLaZhDC2IYsfV9dLf9DiWYZWbPPUKs=;
  b=jL5cPwfL8V0R3hXIu95BhfS5PwoEK1lwEynaGsnGA0WHHWdkzbjMzt36
   ZLxkk3hm6yooky+ZsbT1MyESASRXJnBRbbOkXY1UHai6xZlMR7VX/C6JF
   eKmAY/Mm1/LUQ9ojA1Q8PVQcxEDf2fZAFJQ9ctA2ZGBJYMVnp9azETwkw
   PawzwBpafVXAlRtDwDJEQRUEDwMSo3nzUy6l1uYwxsnhLR4IH4LVMHONO
   eC7t5oNJdGH6X/+W+y9I3gfbbCYB0RJx5rg6d/t9EY/w/ZvQfwJf/miRl
   pPQoYJpexbMc7HeN1kfG0Ke1aemj4lUilgoN1CNlzinHxieflbp0JWK+1
   Q==;
X-CSE-ConnectionGUID: EYof0uG2TJaWXjWLZt9y+w==
X-CSE-MsgGUID: XOp6qj7IQoOXE66HppXaEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29385560"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="29385560"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 12:32:27 -0700
X-CSE-ConnectionGUID: EOa9vTGAQgyOpQtknU3CFw==
X-CSE-MsgGUID: u0jQ6THSQt20Cwi2P8ggdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="55636527"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jul 2024 12:32:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUANz-000gdc-2d;
	Wed, 17 Jul 2024 19:32:23 +0000
Date: Thu, 18 Jul 2024 03:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-static-calls-v2 2/2] mapping.c:undefined reference to
 `dma_common_alloc_pages'
Message-ID: <202407180307.Ri3xkCJY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-static-calls-v2
head:   dd34bf3ecef252b4910d70aa21ff5273b5e8b19b
commit: dd34bf3ecef252b4910d70aa21ff5273b5e8b19b [2/2] dma: add IOMMU static calls with clear default ops
config: i386-buildonly-randconfig-003-20240718 (https://download.01.org/0day-ci/archive/20240718/202407180307.Ri3xkCJY-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180307.Ri3xkCJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407180307.Ri3xkCJY-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/dma/mapping.o: in function `__dma_alloc_pages':
>> mapping.c:(.text+0x5dc): undefined reference to `dma_common_alloc_pages'
   ld: kernel/dma/mapping.o: in function `dma_free_pages':
>> mapping.c:(.text+0x9de): undefined reference to `dma_common_free_pages'
   ld: kernel/dma/mapping.o: in function `dma_alloc_pages':
   mapping.c:(.text+0xe60): undefined reference to `dma_common_alloc_pages'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
