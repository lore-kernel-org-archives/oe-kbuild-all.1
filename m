Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989E1256D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 03:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735876082; cv=none; b=gIajmS3sr2OD6KLhA4jd8HZTymjlQbgzJpzH5b+fwkxlfGRU+1YBwNRFxUDrDWxcTm30VAlIO/Ln06quGF9Z3i06kfWzefvUjgc5+8N64nbCjkBqiyhTwhpnYPY32ZCVsFYReh4IGQ/SkOABfMqxclM3A/9WMYZJqcFSkVZzL+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735876082; c=relaxed/simple;
	bh=ScRBBHdZkEkSJYCiYq3VMvuQYUmGUoHdieP2kEoXT5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AUfQGv5RZWSHJ7oCNOf8J19/vYW4L3QVA/9pfHSY8AMlLoA0oLmwFOr4oiZ+7Ehvl7B2E6TWPvjffb8s6iwVNE2QjGmsJHSj/yS2BsYlD/+jJLl+9JPfd8AyrfudqyHdA1ohsmIMQReuepuXeVZd5rjGycOw3sRRqKwuWm+a4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wtg1icgn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wtg1icgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735876081; x=1767412081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ScRBBHdZkEkSJYCiYq3VMvuQYUmGUoHdieP2kEoXT5o=;
  b=Wtg1icgndT7pCZ7Alio67do08Eszf1qzLpBgXICfwvrXS9LzLq4/a2Lk
   yhGd3M/neWQBKv6gH5HX8VECAKXuL1Rcp6/cNmEQAHBbB4zf3cuGkk1g/
   goU5V0eAat4oDYkoLY/DKX4kzZW0FfGWX1KHExguWVR3pRb94TrXxFPSR
   KFMnZ3WEFnt/JRqJqEoPHIjqkegV65P7Dx9qDwsr2DoXD9TsqnU41telN
   kHfYsTWJTIN3HBnaPp5VXDnuAunh6t0TA7DOc+xjlNdzjiQgNMBqXc0WV
   0FnO6ercMwPKWUIzCh1gzkRfebMbpuyQPAuk6oXjdChxJ/cfx9T1h/gOW
   Q==;
X-CSE-ConnectionGUID: JTIH32sUQL25b8zdP3gAqQ==
X-CSE-MsgGUID: bP/SnnL9TICh7J5wojVKJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36235644"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36235644"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 19:48:00 -0800
X-CSE-ConnectionGUID: hQoHyC4HQ3+L7iVwRz3Q/A==
X-CSE-MsgGUID: KqoRkHC1QSGg9btchGs8zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101758291"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jan 2025 19:47:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTYfE-0009A8-1r;
	Fri, 03 Jan 2025 03:47:56 +0000
Date: Fri, 3 Jan 2025 11:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: undefined reference to `gen_pool_size'
Message-ID: <202501031144.RFxwIwZf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 99f629718272974405e8d180d2fa70c03c06d61f net: ethernet: ti: cpsw: drop TI_DAVINCI_CPDMA config option
date:   6 years ago
config: alpha-randconfig-r004-20230123 (https://download.01.org/0day-ci/archive/20250103/202501031144.RFxwIwZf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031144.RFxwIwZf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031144.RFxwIwZf-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: warning: arch/alpha/lib/styncpy.o: missing .note.GNU-stack section implies executable stack
   alpha-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   alpha-linux-ld: warning: arch/alpha/lib/styncpy.o: missing .note.GNU-stack section implies executable stack
   alpha-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   alpha-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `cpdma_desc_pool_destroy':
>> (.text+0x34): undefined reference to `gen_pool_size'
>> alpha-linux-ld: (.text+0x38): undefined reference to `gen_pool_size'
>> alpha-linux-ld: (.text+0x48): undefined reference to `gen_pool_avail'
   alpha-linux-ld: (.text+0x50): undefined reference to `gen_pool_avail'
   alpha-linux-ld: (.text+0xb4): undefined reference to `gen_pool_size'
   alpha-linux-ld: (.text+0xb8): undefined reference to `gen_pool_size'
   alpha-linux-ld: (.text+0xc8): undefined reference to `gen_pool_avail'
   alpha-linux-ld: (.text+0xd0): undefined reference to `gen_pool_avail'
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `cpdma_desc_pool_create.constprop.0':
>> (.text+0x3f4): undefined reference to `devm_gen_pool_create'
>> alpha-linux-ld: (.text+0x428): undefined reference to `devm_gen_pool_create'
   alpha-linux-ld: (.text+0x4a4): undefined reference to `gen_pool_add_virt'
   alpha-linux-ld: (.text+0x4ac): undefined reference to `gen_pool_add_virt'
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `__cpdma_chan_free':
>> (.text+0x714): undefined reference to `gen_pool_free'
   alpha-linux-ld: (.text+0x71c): undefined reference to `gen_pool_free'
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `cpdma_chan_submit':
>> (.text+0x1bcc): undefined reference to `gen_pool_alloc'
   alpha-linux-ld: (.text+0x1bd8): undefined reference to `gen_pool_alloc'
   alpha-linux-ld: (.text+0x205c): undefined reference to `gen_pool_free'
   alpha-linux-ld: (.text+0x206c): undefined reference to `gen_pool_free'
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `cpdma_check_free_tx_desc':
>> (.text+0x20f4): undefined reference to `gen_pool_avail'
   alpha-linux-ld: (.text+0x20f8): undefined reference to `gen_pool_avail'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
