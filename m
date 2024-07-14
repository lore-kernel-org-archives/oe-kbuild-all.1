Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8289328F3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 01:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720921379; cv=none; b=qR3Z6wwqyCHwVulsReltuCvwUz9fSB8UjYgxEsOQfmm4JuSD+Ab49yH1zvKzKJjoTLbdSBXUFZS5iZDKl7CtG/Hm6dV/xdzBWjyjp/YQDUH9LhV5f23e3hpZzblnK0sqguU/ObFytOWlfpZZNSJ/6HVQXd51lD9yeUS9qmHQN0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720921379; c=relaxed/simple;
	bh=rtP+mS0uP9del62NZ2mr5ZJ6IeQJSfcJeWJB4tg13RA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cafP3MnuMZ+hOs4svGotbgGKSahhDdj6Z28omJyb02zR+/wXlMn8rTGHNQo2xS58yBhDg3M+Wp3o6Idj8zTAn8sa+yBwTi4kHMbp0twOvV1qgFPPOCAdML47cw1dHH7fo408iSxzJlORQbkNFt2Z+8mcgt/rKZOTgKsJq9G8nG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nuxs1JlR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nuxs1JlR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720921377; x=1752457377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rtP+mS0uP9del62NZ2mr5ZJ6IeQJSfcJeWJB4tg13RA=;
  b=Nuxs1JlRyseXzE8bsiFY3JxS6mNLkk0GNzKOmqLtSiiLg6XriLzhNV3s
   WWoXd2bs7VC89PvdqJNeaTPOVw7xCxzXZnAsJWcTMRCd90ZLZ3lLsR15d
   DqXq/rWUvKBGm+fCTkx1NI/h93oCcF7V4vGjVI3T12LNSt/oho4QIhtId
   4bvUwaGQpzU/JmbDvYrSq+QG3uvRjLutSIl5szwVxXvju0BlkpHO9jmmB
   54/L286QQg5XTSdCBPqyCXxKtXZX6mKTGNYqJ1GHWnPC6TWOlGwTPus2P
   yGQRSpbX1mKpHjVgNiFAznzVc0LIjOq3WlYGxGg3XoFkyaTamTlSYV5oZ
   Q==;
X-CSE-ConnectionGUID: mHi5r4RTSOWptnrqYiUkMg==
X-CSE-MsgGUID: T1hElHigT9eVzNM+TwEEHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="21244938"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="21244938"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 18:42:56 -0700
X-CSE-ConnectionGUID: 70mvJWK/SmCif9fgwECEvA==
X-CSE-MsgGUID: AT8ouSspRQqdQ6AvX2Ow6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="79958051"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jul 2024 18:42:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSoGK-000cvc-0V;
	Sun, 14 Jul 2024 01:42:52 +0000
Date: Sun, 14 Jul 2024 09:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:numa/memblks/v0.1 15/19] virtio_pmem.c:undefined reference to
 `memory_add_physaddr_to_nid'
Message-ID: <202407140959.BJ9pFoC8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git numa/memblks/v0.1
head:   d024f77faa6fa51163d89871f2a255229097a1be
commit: b167986837bb5d004f2dc131c553d1d267a8279d [15/19] mm: make range-to-target_node lookup facility a part of numa_memblks
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240714/202407140959.BJ9pFoC8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407140959.BJ9pFoC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407140959.BJ9pFoC8-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/nvdimm/virtio_pmem.o: in function `virtio_pmem_probe':
>> virtio_pmem.c:(.text+0x958): undefined reference to `memory_add_physaddr_to_nid'
>> s390-linux-ld: virtio_pmem.c:(.text+0x984): undefined reference to `phys_to_target_node'
   s390-linux-ld: drivers/dax/cxl.o: in function `cxl_dax_region_probe':
>> cxl.c:(.text+0x58): undefined reference to `phys_to_target_node'
>> s390-linux-ld: cxl.c:(.text+0xc4): undefined reference to `memory_add_physaddr_to_nid'
   s390-linux-ld: drivers/cxl/core/region.o: in function `cxl_region_perf_attrs_callback':
>> region.c:(.text+0x1e30): undefined reference to `phys_to_target_node'
   s390-linux-ld: drivers/cxl/pmem.o: in function `cxl_pmem_region_probe':
>> pmem.c:(.text+0x12da): undefined reference to `memory_add_physaddr_to_nid'
>> s390-linux-ld: pmem.c:(.text+0x1306): undefined reference to `phys_to_target_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
