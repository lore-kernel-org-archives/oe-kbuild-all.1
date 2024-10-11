Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65DA1CF7C5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728679542; cv=none; b=gSV0VNkyWWKiiEFfKDDveYrNxGBQKqNcxsEiFA1llhhDQNX3biz5mrsGjUiF8CUkgGgycS91aFLav53VVs9cH2pGi8wvInDZ4n11QCnOSmYcussUzYyx2bfb4KlEc4YQkbFrBjhiPJzSQGvUZTf3LkZO2CS2L/IQex0Z61hflR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728679542; c=relaxed/simple;
	bh=DbfuCXE8KGlKURproBC7m8gPtPj5HzXFypbBlCmfzco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YXwMuosJApQUh6FUAlYFS8C76WBGhJ+X4b8J1jYU136/wDt7NTx3opGHxro59fRTgsY4pDJ5bpsq/HUALowIYaF2iGNQrAf3EF98z3uV1akgGn3b1/R5jpXVD2y/YKHgP7pkl0FY168c7Wkccbs50p2Dm8X3b4DTDrwMua9peAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvtqBJIR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvtqBJIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728679540; x=1760215540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbfuCXE8KGlKURproBC7m8gPtPj5HzXFypbBlCmfzco=;
  b=hvtqBJIRSkZVWwFaR7uCu3Gsnrc/x2P8/Ck2z6QCjv38tqQKgBJDEx+b
   I9mX9OhRNrn3FIUpsnpqdYYkEyiSKIDAlvlGq3aGMG39CzysPdfBOBBIb
   HrAnQA1LIcYOrr5AmLQpNuBfWAkVjkbX5a3d1uRVCVK0n3moYA52vsTT8
   M5hrw3YlWlF96VaK5yZj77xdr8yPN7Wfhco+N/UPdAJH9MBm01Zor6UJb
   pc4kqdaHeYW4pG7hEdMxK53K5+8oItJZJYlK69k/o/P3ur/7EuBuoOHPk
   D/U6XUpPRQe+sRlA98FZAT3G7BGlr3ExDaSfBGieqP7BBuoJeEskFH7sC
   w==;
X-CSE-ConnectionGUID: kBFFoYRQQKaOOlqhqJDR8A==
X-CSE-MsgGUID: jQZMs6/nTc2jWB9M3FUWgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27896883"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="27896883"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 13:45:39 -0700
X-CSE-ConnectionGUID: LJ7wsCz4Qr6JEdW/T1vQ0w==
X-CSE-MsgGUID: YOpVm7h3RiGmW61794++BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="81572315"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Oct 2024 13:45:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szMW0-000CjH-18;
	Fri, 11 Oct 2024 20:45:36 +0000
Date: Sat, 12 Oct 2024 04:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17755/23827] drivers/dax/kmem.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202410120614.DTc2PtdL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9b2f1457c730cd7915663ac5d9ccb849f2657714
commit: be13c6c633412a576f1a666c07dbaae19331b0fc [17755/23827] Intel: device-dax: "Hotplug" persistent memory for use like normal RAM
config: x86_64-buildonly-randconfig-003-20241010 (https://download.01.org/0day-ci/archive/20241012/202410120614.DTc2PtdL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120614.DTc2PtdL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120614.DTc2PtdL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/dax/kmem.c:4:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/kmem.c:17:5: warning: no previous prototype for function 'dev_dax_kmem_probe' [-Wmissing-prototypes]
      17 | int dev_dax_kmem_probe(struct device *dev)
         |     ^
   drivers/dax/kmem.c:17:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      17 | int dev_dax_kmem_probe(struct device *dev)
         | ^
         | static 
   2 warnings generated.
>> drivers/dax/kmem.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
