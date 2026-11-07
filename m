Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026330;
	b=2Ze8vQTZ+D5FTlP4p2UV+HSzLzeVpn2qU3Omy7LNQWpHl2R6nKwiSMTNxoNhCEHY9dNF
	 6aSDPEairrUaOCkwJnlfEtXV7N5iXqRpojabKkmELLjp4sg9PzUuDwLusCzM3ti0Qw8mg
	 yPhC8KM59QaJ4ODlVJHtZH1FxLkDjb43EYS1S8zqyP+986yDKAGy36mmHZbKLgDwIoKvb
	 8/N7PIzdNtm7sb2WoE/IEkOXP7O4JvZcd8reaN+MqABecv0bJmkrAueeBb2G/I8Lc2N/K
	 e43kwUrxaX7kxK9alxX7pNLn48JR6Godm7Gy+QkKjMMLFuSRr1fJFTqS695QqqAlxKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026330;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DFX3OTPsYRuMyyjrbY8vYdk8CZ7EXSmrdu0gx3RqTrY=;
	b=LmAFAGfF4cCW+g5rD0O+3bszg8V1QEXtk/7i2tJTdvhZs3B59Grm42KBGaBWw6ueArTp
	 EaBUzZYmTf2d9Xkw0LlfLjRDvA687+2J3V19kKhDPDPvs76dbi7Qe1Ajt1HFvYWCJu89S
	 LgdFB2AgrFyUkUa9FIXQSokWGeBdWAxBg2Pv0o2erFH5ikNQuUiuV2DQt6WoQ0tqWbMSL
	 1n1acJCG3QzN8dNIWxSt3YCrurXQ1NGAsp2RqHCUwu/gsRQ0oBHS75eCAavr0CrgxSplk
	 Ai+Mj1RZ2NLMGC5vTSZ1agxYGxNu0fj+IOifbp6pgrYUOHb7Vh+L5aj/KriuMb28z0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DkAxTaf5;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D24E606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 04:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D24E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DkAxTaf5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794026329; x=1825562329;
  h=date:from:to:cc:subject:message-id;
  bh=e5lf75mWCi7BtT0x42XaPZHQJI0+7CnruX2CbRhxn6k=;
  b=DkAxTaf5/BD3fHLjyEBY/NSFZddMjQbq3B4IqYpqxbuXyxYrxi7e5SdR
   x+BPVJNXAnzM5KdJERrGeS4w7w1r4OLjl1mP74cV6oW/D5FFA34QxTN1X
   wvKiH/eYDBsw5aZO3wInRbLbKSxF7qJsQY7Obv5JxHRM/bG5stv+i5VDc
   uWftm/Vxh0f4O8xu3Hl3INxcwwt/BD6rtjD8rq4g18yQWbutHVEoXQRDI
   yl5ETO9mRFbTlGFo8dbozGn/eQqSp9eQnN41VpLuEWnbP7pqNJSuNY4dp
   xYv02EKXAtEoveBLUNzwN9CV1AQaS53KinT2WnazT4W6RwB56cL4cHmi/
   A==;
X-CSE-ConnectionGUID: hL9YsBztTQa71mKeyUSRbQ==
X-CSE-MsgGUID: 8kzLmBD5QOG9uCBournqFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2853866"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2853866"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 20:38:49 -0800
X-CSE-ConnectionGUID: Pw2ww39aRbSuSnorvIxtEg==
X-CSE-MsgGUID: FsQjxhxLQI6q1eJe74oBxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7319099"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2026 20:38:48 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPYCT-00000000AY3-04FQ;
	Sat, 07 Nov 2026 04:38:45 +0000
Date: Sat, 07 Nov 2026 05:38:10 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-09 1/1]
 drivers/vfio/platform/vfio_platform_common.c:778:31: sparse: sparse:
 incorrect type in return expression (different address spaces)
Message-ID: <202611070532.90M8GCcp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-09
head:   c0f000c5d6675d24f3ac8c0aa429fe8fad9e5d7a
commit: 47f17fcb3a7828602729e173d05778d160df4026 [1/1] ANDROID: vfio/platform: Expose reset handler registration
config: arm64-randconfig-r2310-20261107 (https://download.01.org/0day-ci/archive/20261107/202611070532.90M8GCcp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070532.90M8GCcp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070532.90M8GCcp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/platform/vfio_platform_common.c:778:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/vfio/platform/vfio_platform_common.c:778:31: sparse:     expected void [noderef] __iomem *
   drivers/vfio/platform/vfio_platform_common.c:778:31: sparse:     got void *
   drivers/vfio/platform/vfio_platform_common.c:782:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/vfio/platform/vfio_platform_common.c:782:31: sparse:     expected void [noderef] __iomem *
   drivers/vfio/platform/vfio_platform_common.c:782:31: sparse:     got void *
   drivers/vfio/platform/vfio_platform_common.c:787:39: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/vfio/platform/vfio_platform_common.c:787:39: sparse:     expected void [noderef] __iomem *
   drivers/vfio/platform/vfio_platform_common.c:787:39: sparse:     got void *

vim +778 drivers/vfio/platform/vfio_platform_common.c

   769	
   770	void __iomem *vfio_platform_region_ioaddr(struct device *dev,
   771						  unsigned int index,
   772						  resource_size_t *size)
   773	{
   774		struct vfio_platform_device *vdev = dev_get_drvdata(dev);
   775		struct vfio_platform_region *reg;
   776	
   777		if (!vdev || index >= vdev->num_regions)
 > 778			return ERR_PTR(-EINVAL);
   779	
   780		reg = &vdev->regions[index];
   781		if (!(reg->type & VFIO_PLATFORM_REGION_TYPE_MMIO))
   782			return ERR_PTR(-EINVAL);
   783	
   784		if (!reg->ioaddr) {
   785			reg->ioaddr = ioremap(reg->addr, reg->size);
   786			if (!reg->ioaddr)
   787				return ERR_PTR(-ENOMEM);
   788		}
   789	
   790		if (size)
   791			*size = reg->size;
   792	
   793		return reg->ioaddr;
   794	}
   795	EXPORT_SYMBOL_GPL(vfio_platform_region_ioaddr);
   796	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
