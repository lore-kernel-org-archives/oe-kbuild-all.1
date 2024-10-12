Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E02A38DF9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728736749; cv=none; b=NLy8KY85NHsWLBHOQbRgDS6mD74tKVWMIkm1m95n9m0yxMPQkn/LKXSltHOcs7JdRAf4LKjAaHHUzo1kJAk+BUb17+VuzZ6FvlWLOZZW8AAOCkGmKy7zEM5j3Uykq4479RD0KJCixYFb+bu+r9ZVxf77/7VDRbQkT+M6r0lany4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728736749; c=relaxed/simple;
	bh=eN2yDUuj4JWZhBr36IhHFp2jzBHOoq0J4c/NCUQuveU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=stMlrPU5SeDkNMpSvvFyc8Qu/SMuaPNVq/p2J3Q4ladvio2XcffqnMD3Ozms3pb14usjCMIYLcexHMr8dkWeiWlKnTFzZzF+W2vmFQ67twvVPw3/nilWQKzNair7l7YfZhdi0mUTqU/NjnaH/c4eaxYfkErcqlemQzR1bAW7Jbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTuIHdyN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTuIHdyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728736745; x=1760272745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eN2yDUuj4JWZhBr36IhHFp2jzBHOoq0J4c/NCUQuveU=;
  b=XTuIHdyNN5ymc5eJnwk5M7J13oN+K/7k4ilG8j4+hc9eHr7f4Uz8vxM0
   /P9nklGi/sv9gI2c/T/IK7qQSGQT9AECnNV8Ld3LfI1eFSqjaED0sb1kI
   fCHeffvIUZjtk5W/TajkHgv8FWiMpR3TcdgOd32L/R0ba67sKbX4g90p2
   BsjEUoMqJYgnN92jkp+WfpQPryDhCVjMusedOr0hk46h1qgHi3UPsaI9H
   lHo840NUwQEJVOqqSjiNA03op3dgrbe0hDfMeYXFpNIDG/YAqCx9wy0Q7
   m3UqoABzt88Laq2zkxFf8QcvbfhVfwhr2khA7R/mO3q2N7TBDv1NTvguK
   Q==;
X-CSE-ConnectionGUID: 2dzyP4p5TOGWaMjdbzlwQA==
X-CSE-MsgGUID: c8Wo83l5R8uVy31knMqT7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53556850"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="53556850"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 05:39:04 -0700
X-CSE-ConnectionGUID: zySOcSm6SJuJBmm8lartrA==
X-CSE-MsgGUID: bCLXuOFhRCeh3eUR0mr4TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77623045"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Oct 2024 05:39:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szbOe-000DMJ-38;
	Sat, 12 Oct 2024 12:39:00 +0000
Date: Sat, 12 Oct 2024 20:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 1467/30000] ld.lld: error: duplicate symbol:
 debug
Message-ID: <202410122048.jVj2RUuh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qi,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   caaf346be46cf898a60d036ab7717cead0e3c264
commit: 8e695222e0638bf3867561a1e7342d20fd9683a1 [1467/30000] Huawei BMA: Adding Huawei BMA driver: cdev_veth_drv
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241012/202410122048.jVj2RUuh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410122048.jVj2RUuh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410122048.jVj2RUuh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: debug
   >>> defined at bma_pci.c
   >>>            net/ethernet/huawei/bma/edma_drv/bma_pci.o:(debug) in archive drivers/built-in.a
   >>> defined at virtual_cdev_eth_net.c
   >>>            net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.o:(.bss+0x0) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
