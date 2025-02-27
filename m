Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E9276D15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 23:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740699302; cv=none; b=M0Y/6p+RXeJTv2tW1G3g+jGlKWoUzulDcwDQ6b1dKrBUiasL/XlKEfxHvoutMtixpDewPVqrTo52IMaXhxI4PknpgK6/I52p/yyyoiUuPJebc7FIDlwDBUwzcSMW0SRoNE6VxotzB3VrPXptNWZi9+y8UCcCOjBxxu0fXf+k0Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740699302; c=relaxed/simple;
	bh=2X1NNQiDDaupRjfzP0w0mgQOyZKzwPTz8VQHUP9B2Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dKQcYvVj4+PGk0bjwdDwNSjs1xSDw4+gJsmrxa909baNtd+sLNWVYOvT4zcz3hXFdzKvhCCcRy2UWu93qfCBT9PtQ3K6zP84uL03O/IAnzXNL9/1+Os7YGwbpGdFrLcnwgypPjlyzK42vJraxh9fNv0J+5F4Zt1zKrBYFQWTiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acPbgrgl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acPbgrgl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740699300; x=1772235300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2X1NNQiDDaupRjfzP0w0mgQOyZKzwPTz8VQHUP9B2Cs=;
  b=acPbgrglvYhFCnp5PiHtW4BSLsnI314TlRV+cvPYwaxBGct6chji71x+
   ft5zAPtkJHZv5dLVp6Anf2zncei7z4dJSUNDvcwr1Rgp/SMqk6J2D8zHB
   s7HyWDyiYIuTIDBhPIdePs75YbsPNuRmwJmwBjQoPG83yok/Vlpc0GWkt
   RHVLAu5PkqQfge2GJxc/aoVp3UHM0IDFKc7IgDHj9dUiGhKxBoPFDCr22
   QW7pySRvNGbRM/PvZT4Z8dmPMn7W+T6WrajFpFYdMwlYJ+MbXQsqEGWSJ
   Ui4pWUce5A3imkxWm0VQxRsdx8cL5v7FizC5s356WzOhzLFKHylDTNKwi
   Q==;
X-CSE-ConnectionGUID: UTp8pp7LR1qCDxJ9BYXq/w==
X-CSE-MsgGUID: n2EbgXUMSyqNX3cFIoFeKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="66985281"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="66985281"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 15:35:00 -0800
X-CSE-ConnectionGUID: UHBmX95wSeKu6tSBIkfuMA==
X-CSE-MsgGUID: 9H5LXUReRcOIEXTacOuTLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="147995453"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Feb 2025 15:34:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnnP6-000EBA-1j;
	Thu, 27 Feb 2025 23:34:56 +0000
Date: Fri, 28 Feb 2025 07:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/2] htmldocs: Warning:
 anolis/rpm/kernel.spec.template references a file that doesn't exist:
 linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202502280723.MH4d1QAx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   3f4a1c56702ff1c8fc29efeaf5b07b6e9821f19a
commit: f51d5db54f719746163afd5bb0475d1444642c35 [0/2] anolis: spec: add basic framework to generate rpm tree
reproduce: (https://download.01.org/0day-ci/archive/20250228/202502280723.MH4d1QAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280723.MH4d1QAx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
