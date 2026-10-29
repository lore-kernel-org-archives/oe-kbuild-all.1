Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299870;
	b=QJ6Jsh091NRd9Peo9X6zxHZSBsOOLLc1REWgf2EqDla3YOgZJduC7BBzkjRCUM/xQqkw
	 ZdZo1LvVUQGpvOP+kD0+wB3H9NXYjicIpNXwmeLKV2RkAvCSq6sCNhQhQIurl6c10YSrz
	 LS5ATarKUDaCSYIeR/hSSNvD5qEfmrYfEUziKuUQnQ3/BaHCJuXRCX3xRp25bbpOVCBfq
	 BPsANlTtxorvA9+8bkw99e67ZypQCHWlk8+eG2CobkaucfK5Q5jS8OhtMInY+eUFwhzq8
	 K2tczzm3bZukJAHWKJIGz5guhGJpaBOac4XNV436DZV0LJ69QvXJ2Dnfu4XyRwnwKvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299870;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zK+Pc60f/vCFaNiI+/6ZugtTyuRKKM2JpoL+xPgvN+k=;
	b=LHUKl8Dfu80WcrFiM1+7TYtrFgfUmHcWxIv0M12qXNnaLbukBSE33PkhnBOTP2VHe0wy
	 bDL9kr/04penXRizWo9k8PrLlV0F10/w17XhQZxZmPi7VxgSpzXv1qUwzxsOth7K+Ge3b
	 ZH4EKpsE23nYIBmDG3/jEhcvyPdzgAvMVVSTN8sbgcvcwftjc6dzRZA6UrlXOvcdnFRrq
	 nR2y1T6TA2pZDdsSYxq0QvRYPu2Wt4xraADBwgGkKBWhjrVpk9X9lIIHLyMjJYZ36ySbk
	 WqCx7HuQqZ+6UhLaMj6Go3Nl/bNclynVuW4tuXwN9cMx/y5iTyILs+BdZEuBR/ad9ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="UPk341/W";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9015606A31F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 18:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9015606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UPk341/W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793299869; x=1824835869;
  h=date:from:to:cc:subject:message-id;
  bh=uTHALUyykAeURXlcewCCEM1G1FkN1KKJjeLXJmcYW18=;
  b=UPk341/WWdmG80rRE58Xpvq9jWyKIFXbuzHnqQHKD4LECJZ+7OkmwNJS
   axfojIgZNPTJtja+LApriJ0DD6ozpfJz7NiPdvpG4s5sK7jZt4jZQQwc+
   NAURmRUjedP/Yr1nzA/RwnLDwimKq10ooIeTY1WX8qzsw7vtLMxUZXjYc
   rblPs2zXCQMVf/GMVSou/lz8tP1BqmmUEol1enY0Ox7i9IKchSpFD6aWr
   gyNjJ84UsE2FpoLQ1P69qHJQfEevy1QJgM8XNZmfBspYcLOXqY/8oxYzH
   G4zYvfLTWGpd0rN/Dpvr6wmrvflBpK1LS0B/k3l0q1BH8EvIjb4w6rDqw
   g==;
X-CSE-ConnectionGUID: Y7hnFOl0RiKnsGGZI6lgAg==
X-CSE-MsgGUID: 3JAAWxw/QGqsErPH3h9fQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2060673"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2060673"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 11:51:08 -0700
X-CSE-ConnectionGUID: 050A28sBQMWmhOQeyjYNPA==
X-CSE-MsgGUID: W9m+Oq7fTNONUmhxEABU5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5616539"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2026 11:51:08 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMVDN-000000005Jf-1aOd;
	Thu, 29 Oct 2026 18:51:05 +0000
Date: Thu, 29 Oct 2026 19:50:57 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android18-7.3 1/1] ld.lld: error: undefined
 symbol: ashmem_memfd_ioctl
Message-ID: <202610291910.EweEb54T-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   c3c384d4d5fd887a90e4061229522d9547a54ea4
commit: 398bbc0409f7586f909b17195dc4a1268d855277 [1/1] ANDROID: mm/memfd-ashmem-shim: Align ioctl handler name with Rust version
config: i386-randconfig-r2109-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291910.EweEb54T-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291910.EweEb54T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291910.EweEb54T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ashmem_memfd_ioctl
   >>> referenced by shmem.c
   >>>               mm/shmem.o:(shmem_file_operations) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
