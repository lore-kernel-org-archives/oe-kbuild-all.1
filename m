Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC5A8175F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 21:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706909472; cv=none; b=uJ3YIXQCX0NhmrCIlZ47IzDIwiQysy8cVzhcbtv0Tp6kZOoQwlW5vbGTouydPrGzpb2B2zm8aGTTaj3uBU+oudBjMlSLC3RxirX+eSHkuU95/0ILioStM7Tg5/844eh5LP0m01YXFYXOUJUp6HIQOEaShdKaTyV7nst7deS0jGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706909472; c=relaxed/simple;
	bh=wN2rzMgn+iJjgN4+LMt4pdQHnxkBZthLEK0/yPKCKfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fSMjzuq4LLgkhGrwa/xBH1XCUVbMkEp04ujuq9SlOAHFae607ZZtC0m0GEAaewN9MlgZfXxS/4FFiwb+8XLKUJHiW3xAnJy5lh5coN8PbeTh89Bz0acjZRkFN/gjI2cmR345IgKe9zfUABbLkQSiwpGm65JC/xFLJZgoDiZ/cmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibUho1Q/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibUho1Q/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706909470; x=1738445470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wN2rzMgn+iJjgN4+LMt4pdQHnxkBZthLEK0/yPKCKfA=;
  b=ibUho1Q/ljCedjVNhNRx7weHD10u5mk6EOA/OJshz00Y2z9Rn/+tYL9D
   QEdRPaVJKWgNXvQetRpPu4Wgym0Q+E6xBZ/Iha2svQbqoc8JISVrVtfKy
   GLaNm/uzV/+bsLMUzHJqBucwq4SxlFBktUUCthZqqSe+4ue4Ygt2sBh1z
   hKlatGs6TeFu66D77jIYqNSLSWFmsEmAn4SytpV4ow5cmosyulO88wRia
   DrF7ONIjVeLNBFU4jshr4WAhdmXjxjI/CLFm59ebF3xsUWZa6tD4a7wbh
   peF/CESmXGSF1TpBIQwY/PutXr9w9nqm4zZVP5RKuzy19JAkd2LAp7oP/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17659905"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="17659905"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 13:31:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="185997"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Feb 2024 13:31:06 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW17n-0004HE-1v;
	Fri, 02 Feb 2024 21:31:03 +0000
Date: Sat, 3 Feb 2024 05:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.8-rc2-esp32 21/44]
 include/linux/device.h:381:23: sparse: sparse: incorrect type in return
 expression (different address spaces)
Message-ID: <202402030503.M7AdbycV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.8-rc2-esp32
head:   b25ff15921c2ce0b8abd0f2797f4942a28866d9e
commit: 1d4c0e9d617182a90eb506db56bff1b70f01c2ed [21/44] drivers/mtd: add esp32 MTD support
config: s390-randconfig-r133-20240202 (https://download.01.org/0day-ci/archive/20240203/202402030503.M7AdbycV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce: (https://download.01.org/0day-ci/archive/20240203/202402030503.M7AdbycV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030503.M7AdbycV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/misc/esp32-ipc.c: note: in included file (through include/linux/platform_device.h):
>> include/linux/device.h:381:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   include/linux/device.h:381:23: sparse:     expected void [noderef] __iomem *
   include/linux/device.h:381:23: sparse:     got void *
>> include/linux/device.h:381:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   include/linux/device.h:381:23: sparse:     expected void [noderef] __iomem *
   include/linux/device.h:381:23: sparse:     got void *

vim +381 include/linux/device.h

da7c07b1083809 Mark Brown 2023-07-18  375  
da7c07b1083809 Mark Brown 2023-07-18  376  static inline
da7c07b1083809 Mark Brown 2023-07-18  377  void __iomem *devm_of_iomap(struct device *dev,
da7c07b1083809 Mark Brown 2023-07-18  378  			    struct device_node *node, int index,
da7c07b1083809 Mark Brown 2023-07-18  379  			    resource_size_t *size)
da7c07b1083809 Mark Brown 2023-07-18  380  {
da7c07b1083809 Mark Brown 2023-07-18 @381  	return ERR_PTR(-EINVAL);
da7c07b1083809 Mark Brown 2023-07-18  382  }
da7c07b1083809 Mark Brown 2023-07-18  383  

:::::: The code at line 381 was first introduced by commit
:::::: da7c07b1083809888c82522e74370f962fb7685e driver core: Provide stubs for !IOMEM builds

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
