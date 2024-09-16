Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC74E2A1B2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 19:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726515568; cv=none; b=T1q55BME8mSEOYh4f8itrthyJMhpTVxhw015QoPSkO102wJrnYBPD0YkAfpc+ogRGAY2VAHnq3mzxTRp7XMU4nxYhfj090riBi4jgOHjlbbogq/9mHzQYWZOJwLZJbcNygOBtRiCYHqLxwsOx8dynm/OkQx283HjV99FUi7nrSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726515568; c=relaxed/simple;
	bh=YN2aIkma8sfwsj2OGe8w5VMEDrWRo4L8aeu0ICMsK8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=puaGNswxFb3/yG7SrFiElRdul2QFp8n6rZpDSImXIiUGptVP68eVxCpOSk6sw0l4Bv4qMNExLP172yYe5+0mej9RQjIo7tIm2HV2u0Yjr7FHWt83HFvxL8RuQDEMdYoUwbmVAFeLGAlt6c/1k0Xbx4Yr+3g1FRbnGnSxZ87pH34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkmcp6Ip; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkmcp6Ip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726515567; x=1758051567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YN2aIkma8sfwsj2OGe8w5VMEDrWRo4L8aeu0ICMsK8M=;
  b=dkmcp6Ipv3i6n5AgoYgIdeD9oPX26N1xnveyKPedmYVOHp70cvO8MdIw
   kbPzLe1t6nYCMQHfsbV8+ko7IX29y8s1CVUhIu+ld+TwEXNSx4lIW2oOC
   Rlrflejpc5AK4VfXMsnRmCq51v5WDWHbfwd2BPLkvHA8JwJtdL3qGGnOA
   wv+uMQLIMzp6WaXTub7fWxmHN1n0iVGs1NFYQg2jRU65djdM9aAHxi+Ao
   vW4U8VkiHHKSgebROP0i6woloZ7tOpV0moFt5CdIWm9l+70tPYSLbReIF
   vRGlh5qhZWT28tRRmkFMBhlCW0BE3O9ilEcZ1cDrnQHfpuwZN1zfpw3up
   w==;
X-CSE-ConnectionGUID: OTIsHFCVSwGMLTDiPGfc3Q==
X-CSE-MsgGUID: igSrMy2YRgiEJ5TNpKotVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="24892271"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24892271"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 12:39:26 -0700
X-CSE-ConnectionGUID: ubb9fK7QTkeiQmTo3U7B5g==
X-CSE-MsgGUID: vvik4d8SSjazSX275cA8Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="69065170"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2024 12:39:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqHZC-000ARg-2r;
	Mon, 16 Sep 2024 19:39:22 +0000
Date: Tue, 17 Sep 2024 03:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-doc@vger.kernel.org
Subject: [asahilinux:bits/005-maintainers 2/2] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/spi/apple,spi.yaml
Message-ID: <202409170331.5VgsTbM2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/005-maintainers
head:   52ddaee5e8b84a5469f2e1b4f91d1b5bbff433b2
commit: 52ddaee5e8b84a5469f2e1b4f91d1b5bbff433b2 [2/2] MAINTAINERS: Add apple-spi driver & binding files
reproduce: (https://download.01.org/0day-ci/archive/20240917/202409170331.5VgsTbM2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170331.5VgsTbM2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/spi/apple,spi.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/usb/apple,dwc3.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
