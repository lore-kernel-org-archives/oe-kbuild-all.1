Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60341376
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 03:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730173243; cv=none; b=BZE31imqo9ioy5NPTrnmJwLucLN9gUFXXBEYK0f8j6Q/j5zlH/9DUPbTAmJEZuOy65jjgQBgdjo46HOelgItTXOpZOOCcE3747rizaRyD9rZd0YyV89B/58Ia5W0jshSk5fkBiy+oG5j3L9d+eYNfjiGnEo6Blg+6vygukbzW98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730173243; c=relaxed/simple;
	bh=efVKEsf4Z0M/5raq1MjPQAo6rV3r/p+5qdt+IbdmscA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CTgGcLewz/dRKu2Rsgkm4LuD0M53t2jl7ODMNeDChXKnOrnP1TZq7lI78YC3D4kSB8rdcbFZHUye9PY5d/tUh1/D+u7F8C1DR13iBf2R49EOE8PGcCd231fUGNVf7wWbjmqXWD8C+BdHdU+EEHLwhAKGmdeul94Ei7BFkEbCrP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzqSL4Do; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzqSL4Do"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730173241; x=1761709241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efVKEsf4Z0M/5raq1MjPQAo6rV3r/p+5qdt+IbdmscA=;
  b=lzqSL4DoVmb2BatnE8tIdUwPs+WajCy3xhdM8rW/nj138BTjUV8CaW4w
   /PMg3H2FI6hkX2cl1La+EbMVt+NB/fPxdqdglIA9+pP9v5FhvggzIwske
   S2FtSrw61LkvmvLKrJI9unZblhoUnCK/7TPLNBN8IBPhGQe63DLyN1tAl
   5Saire22ZltZ3Q3kN4Bbj5E8uPXe/xvDnGfg6fj5kNb4X+UllU2u8rkLP
   WHgYJFo/Op5oVcDgTsFK0PS77c5O7UhXFjWNnHdR/XQ9ZWK8PWx1/xUEQ
   E7omIuqwgr8X/zXyLSElJrwI6uHF9jh4yW6XhwV5aecHm3AbdXH002hhd
   w==;
X-CSE-ConnectionGUID: ujS0ZaJwTHGp0/fg67Umlw==
X-CSE-MsgGUID: hfvMu8UoQt+JI+mzz9nenw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47257843"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47257843"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 20:40:41 -0700
X-CSE-ConnectionGUID: ensMhn5gTLO1deBdBOLpbA==
X-CSE-MsgGUID: enT4F1S1Ttq5GTeeYI82+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="86956286"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Oct 2024 20:40:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5d5x-000dCy-2Y;
	Tue, 29 Oct 2024 03:40:37 +0000
Date: Tue, 29 Oct 2024 11:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7038/15358] bma_cdev.c:(.bss+0x0): multiple
 definition of `debug';
 drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o:bma_pci.c:(.bss+0x0):
 first defined here
Message-ID: <202410291139.y46hXQik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   27e5d43e49e85d816bd05ffe8672ceea631a07e4
commit: 0b6609ecfba8575f870350666ab13e25accc8d14 [7038/15358] Huawei BMA: Adding Huawei BMA driver: host_cdev_drv
config: loongarch-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291139.y46hXQik-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291139.y46hXQik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291139.y46hXQik-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.o: in function `.LANCHOR1':
>> bma_cdev.c:(.bss+0x0): multiple definition of `debug'; drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o:bma_pci.c:(.bss+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
