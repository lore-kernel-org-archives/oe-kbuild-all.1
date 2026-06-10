Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0430B228CB0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 01:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781053437; cv=none; b=CRZUWV+Zv/rGTwUhwVnHHH7Bi9CLnci7VgVsY3Q8mCBMXxYepIZF4qJKJwZzBqiD5D1idthmLMKMmen9vWK2puaFOViD0j0cMEo+0cfGIlWX+bjO6b7v7srLjcD99PhpbfUOaoLUN1UX0TIfMcby/hV9IM6YrVt8EmYJe7nV4N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781053437; c=relaxed/simple;
	bh=LhQP71HqfWw9aySOn7bAy/tNklTZqPnFgZUz/+FPph0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aI+3sylA2hTp7bSGVu1cRAuMe9RmgRFZAPxTPkNdQZuCCXuwk8kW6WgejLLWviL4EJ/Est3DECCyT/eTuAuDCYQC+p5giY6eGQqk9x5dDUgNFOthLgNsDOvv/F9ZFJuE+/2DIRH7IcT+w41wSzj92Uamx0WgE4sUzIilBe4koxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bi+6xuet; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bi+6xuet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781053435; x=1812589435;
  h=date:from:to:cc:subject:message-id;
  bh=LhQP71HqfWw9aySOn7bAy/tNklTZqPnFgZUz/+FPph0=;
  b=bi+6xuetOakr1HuupJPS0jfMkXeaMcL+xI0N0OzAvMiX9VdBl+CPtJrA
   68RiiMeQeLREfk7ihsNqyEZ1cQo810ffD5qTbvAeVQE9c6eg8mn9ELm82
   yZaer0fk7D6s/NCapRRaHYAEl9dvWjfgWUTdhdHmvTTvwf5J9yzQH0XzX
   jti795RkmYyb1YXmPddbFTe6rGmEWsEJgxUGrdHRt8UFuICwqLuUE4iHJ
   OXEezB6Y47q8FDl/deQ41y3O7xFjyH3Xn1xjJ1y70WYzUN8NSrcqBddm4
   +lSkfcw+xThdB/GblikJS6qRA5XLKSshT6ckwgp5OEwipmMUFmXQrmjlk
   g==;
X-CSE-ConnectionGUID: JUkPUZX0Sv6JqMuY3rFzrA==
X-CSE-MsgGUID: 7b6feUNYSmu6+XwKMwvDEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85685456"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="85685456"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 18:03:54 -0700
X-CSE-ConnectionGUID: hbd92WooSuaXq98iepDF4g==
X-CSE-MsgGUID: +pC5dO9oTGSG8UDW7BGrVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="276209151"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jun 2026 18:03:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX7MD-00000000Kl0-497f;
	Wed, 10 Jun 2026 01:03:49 +0000
Date: Wed, 10 Jun 2026 09:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [linux-next:master 10310/12670]
 drivers/vdpa/vdpa_user/vduse_dev.c:1647:3: sparse: sparse: symbol
 '__uapi_arch_align' was not declared. Should it be static?
Message-ID: <202606100814.IGp0yqEO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   49e02880ec0a8c378e811bc9d85da188d7c6204c
commit: 6664d88b2c941956ee2fe09c0d09b102b9398109 [10310/12670] vduse: fix compat handling for VDUSE_IOTLB_GET_FD/VDUSE_VQ_GET_INFO
config: x86_64-randconfig-123-20260610 (https://download.01.org/0day-ci/archive/20260610/202606100814.IGp0yqEO-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100814.IGp0yqEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100814.IGp0yqEO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vdpa/vdpa_user/vduse_dev.c:1647:3: sparse: sparse: symbol '__uapi_arch_align' was not declared. Should it be static?

vim +/__uapi_arch_align +1647 drivers/vdpa/vdpa_user/vduse_dev.c

  1634	
  1635	struct compat_vduse_vq_info {
  1636		__u32 index;
  1637		__u32 num;
  1638		compat_u64 desc_addr;
  1639		compat_u64 driver_addr;
  1640		compat_u64 device_addr;
  1641		union {
  1642			struct vduse_vq_state_split split;
  1643			struct vduse_vq_state_packed packed;
  1644		};
  1645		__u8 ready;
  1646		__u8 padding[3];
> 1647	} __uapi_arch_align;
  1648	#define COMPAT_VDUSE_VQ_GET_INFO	_IOWR(VDUSE_BASE, 0x15, struct compat_vduse_vq_info)
  1649	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
