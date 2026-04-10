Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CFB37FF7A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819013; cv=none; b=pJEL0SoYGNvl+/uznt98w9nVMvi+5BB/Jl72R8ll8safPyxci+tdH9VgBBxZ432R4tX6yraPY9qwlLC8IosSrnKHr/7fG3BP6f00Nlh6hiuiG+dmZ64Jol4pG86goT7/oyiXseLCxRpkTU7ioc9JNPH3nZ4kvrgTRX6XgMpwwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819013; c=relaxed/simple;
	bh=2RFdXCSOQ+F4/um4sODgrouaHlK+Kkupg/h87T9SkvY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M/XnpTy7jcBnoTSRuKe1+h5k1+cOwVLb5k/6GvfYeOK+92dtRG6Wb2enJQkZlpApW16feTenYOL+NPmijPvb8yHkufgBI4s+tdQBtw8AbovaoJk6HG9VT4t5EBHBVVrTxZUESv/Ol/EUVhyhpxGqaM3igBKx0RFgy0m2LQuBR/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBuace0A; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBuace0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775819012; x=1807355012;
  h=date:from:to:cc:subject:message-id;
  bh=2RFdXCSOQ+F4/um4sODgrouaHlK+Kkupg/h87T9SkvY=;
  b=hBuace0A2yocjbX4g1epC195wMcB5107CLjPDnSTek7wjrgbOrYLuPOk
   dn5BLj6CrryXNXZjXi8ErYk/3QDy17D3RvNieTT91CNr1X293HxK7/i+o
   SlI0v91MLzl27nCUiRl3VerbWxYOPu2i4gASLl//xjs7acyVj9FieYERm
   G25VX5gl6pQpU6ZSUgs8ff3oZDVtG7kynyqJnm4OLgPegCzbFEcJRTmh3
   fzJlPOt05eET15s6q/vM264ax75spjT/WZ+1AipXZisB3aDlnohtn4AJk
   jKpKkcCAG458/XV73dOTBMA043p5EPnVrosEeYlgy2jlV4wdxdcfit6JZ
   g==;
X-CSE-ConnectionGUID: EMwO55HeTY2uLN311xskQg==
X-CSE-MsgGUID: xP7QC3/dRyqqmEz/qHSTvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76743967"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76743967"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:03:31 -0700
X-CSE-ConnectionGUID: Yj7gKerVRwagU4rpV/rq5Q==
X-CSE-MsgGUID: Admg+QdySNmtNIHfUM+5qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="222566692"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2026 04:03:30 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB9e3-000000003dP-3VA0;
	Fri, 10 Apr 2026 11:03:27 +0000
Date: Fri, 10 Apr 2026 19:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 drivers/iommu/apple-dart.c:975:1: sparse: sparse: symbol 'apple_dart_pm_ops'
 was not declared. Should it be static?
Message-ID: <202604101848.sBh2CQWr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b1e92db6a41f5a59fc3788105c016330d4b6bc46
commit: 1ad8b31653e2af6ff7b3938249d7c9cfafd257f0 [1/1] iommu: dart: Add suspend/resume support
config: arm64-randconfig-r111-20260408 (https://download.01.org/0day-ci/archive/20260410/202604101848.sBh2CQWr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101848.sBh2CQWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101848.sBh2CQWr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/apple-dart.c:975:1: sparse: sparse: symbol 'apple_dart_pm_ops' was not declared. Should it be static?
   drivers/iommu/apple-dart.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32

vim +/apple_dart_pm_ops +975 drivers/iommu/apple-dart.c

   974	
 > 975	DEFINE_SIMPLE_DEV_PM_OPS(apple_dart_pm_ops, apple_dart_suspend, apple_dart_resume);
   976	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
