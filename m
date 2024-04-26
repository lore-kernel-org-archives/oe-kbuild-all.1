Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D243AD5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 21:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714167014; cv=none; b=kSHVg9jz5vaBQ5HxzxKhfL/wGHWsMFIb4JBI6tq44zAQ9cbC2InSQL0BEmk5jV7QBm6GS0MNY5r7wBIM3URJkMx6EAMXHzAv6T5kPjw9avUaIX5v7e0/mHOMk6Hg+kcZZxJrxksW3haKZ69xN/GrpVSCRugpEEn9UGkpuhEblJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714167014; c=relaxed/simple;
	bh=wC74tshWGLTUeVBpucXpy9DIBfIZGtEoeli67Go9AG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JPr14/9ZMKCY1RElKFlEv6ePFn1F6yNZsO9TG67FRRPspzuDxGd8S8MbIGl9B8Fd2OtSpizALMZNyQ9WLZaQqRhDoAO4pCeGwykDZxT/x9p1JXqT24kwbr93n+NlOGQZrEN6OS2KW+Ema29yusym3FsXVxf0Y23Q+SIUSCSNQYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRvtsOZN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRvtsOZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714167013; x=1745703013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wC74tshWGLTUeVBpucXpy9DIBfIZGtEoeli67Go9AG4=;
  b=IRvtsOZN1ufqFCh00rPeZhtgknvn+zrTwYS3z4cO3BOaZWQXjEPwTObP
   FN2F5RBiCG6gZAy8qgQSsEmMi0ZBDcOMeNqftVsU2gfJZiUWE0qgHPdw6
   NOKylbcjP/Lz2uSC/j/zVmYhIlBVaT2le/4/Gvg3ERJSvrhezOO7r2oBm
   E9+gjHUzfsqLlMf6BzV53EbiLP27jvZJ1Fu8kDtumw4tEHMF7Hc5iM8f+
   0YRIqgQrgO1XXrrdhSgYnXepIbayhOVRsI1wA5oKLkbdOBBN/bqQKSDUN
   fZ9cmP5UzO270Mns2ATiAmcjT+CCeX7pYoyz33UL5l8hK90mDnMUTeand
   g==;
X-CSE-ConnectionGUID: XPnzo23WTZyEI9nkNlASIw==
X-CSE-MsgGUID: RYNRunrzT4aM3IoJ5nUhvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="20601982"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="20601982"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 14:30:12 -0700
X-CSE-ConnectionGUID: bYbYvjHcR0CyKDwc0575Rg==
X-CSE-MsgGUID: sej++kDXQtuzUeQc9XqULQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="56715082"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Apr 2024 14:30:11 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0T8y-0004J8-2t;
	Fri, 26 Apr 2024 21:30:08 +0000
Date: Sat, 27 Apr 2024 05:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3066/11728] htmldocs: Warning:
 Documentation/dma-buf-test-exporter.txt references a file that doesn't
 exist: Documentation/dma-buf-sharing.txt
Message-ID: <202404270520.43AG7HKI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 2526990f17d5ceac745910b95b83973586a6a455 [3066/11728] MGS-7263 VX504X08X-SW-99002-r31p0-01eac0
reproduce: (https://download.01.org/0day-ci/archive/20240427/202404270520.43AG7HKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404270520.43AG7HKI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
>> Warning: Documentation/dma-buf-test-exporter.txt references a file that doesn't exist: Documentation/dma-buf-sharing.txt
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: drivers/gpu/arm/midgard/debug/mali_kbase_debug_ktrace.c references a file that doesn't exist: Documentation/filesystems/seq_file.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Warning: tools/power/cpupower/man/cpupower-powercap-info.1 references a file that doesn't exist: Documentation/power/powercap/powercap.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
