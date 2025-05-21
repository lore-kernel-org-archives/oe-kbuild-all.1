Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16541134AC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 22:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747867855; cv=none; b=Gwa6Y/EDIaoo765sTZm8f9T4T78K/yVLxTn2mpzdmfI3ypDUFrOoJ3cn7GbVsBopSogjAXQ+2VIoSAw/HhdN4omZOOIHHhsCPSuAX+J7C7vD+XecExIo9cIK/MlpcnY6QfBbwqb2UEA7z+RpHeueOAKdcF5kc8Keaohbl13UoiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747867855; c=relaxed/simple;
	bh=CQsh+OoyYiMPXVY0UkDKGT2pUr6P/bOoxymH4+OWQQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhXb9NPGFB84vtohH+m8MQmxehzzdFzkDdRZx0LAaKG3tcduUZxt275tSEsY+Zeh9DkEU7tevwzZNunxKglNUOkNAr/taOcxn9cr5DTwBUwENK54/7T1N6CEsTTvIbPaMBPHbatiiSl6OJEYM0FcKWFg31A0G+q2Ptz3Abian58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ob601ZqC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ob601ZqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747867854; x=1779403854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CQsh+OoyYiMPXVY0UkDKGT2pUr6P/bOoxymH4+OWQQQ=;
  b=Ob601ZqCOFbZQ5jYCrfyYXFLVOYq70cw30opM5kV1yJwP6+i9jGS6nry
   RCcVpR7iIvEbHaH3DOG3b1yrF52Jrqvj/5X8rcfVU9uQIMbchp+h8cco7
   Q9I8Pt4Ap5YmFik402McAQHkb8v72uI6LYtzFk/4THgHWHESFDrhN8o34
   uBqlOm/BkRUVPg0nxCzOMf1kW7tpEzvMypju0fABv2fJTriwWyF0Tvcpx
   4h1weJ/AnZvi2Kn0OUmRbm5dtINTW3VRIOKfVTivVLNLh95DJh+QDHYee
   hSTeERqcQPwSGEh9LwBzM77+4/YIWq8hh84mHgmNdmMyhYZ7ygxgOFUK9
   g==;
X-CSE-ConnectionGUID: 52spRjMmQPmA0Kige1fTiA==
X-CSE-MsgGUID: hW4sGmOpRIabPDghxwwfSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="48992429"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="48992429"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:50:53 -0700
X-CSE-ConnectionGUID: qeIaHMKBTfqWqtxHhlEZ6g==
X-CSE-MsgGUID: kP2frW83Tga+L15+YQLbqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="171159688"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2025 15:50:52 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHsGv-0001Bz-1h;
	Wed, 21 May 2025 22:50:49 +0000
Date: Thu, 22 May 2025 06:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-05-exp 1/1]
 Documentation/devicetree/bindings/iommu/pkvm,pviommu.yaml: ignoring, error
 parsing file
Message-ID: <202505220620.eypKwHBp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-05-exp
head:   318fd288f5897bd4bfdde5ba64cd16619c9f2c3a
commit: 9dd94d09198e8d8d739541714a405a730ac6e70f [1/1] ANDROID: drivers: iommu: pviommu: Add basic driver structure
config: arm-randconfig-2053-20250519 (https://download.01.org/0day-ci/archive/20250522/202505220620.eypKwHBp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220620.eypKwHBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220620.eypKwHBp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iommu/pkvm,pviommu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/firmware/gunyah-cma-mem.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml: fsl,liodn: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml: fsl,liodn: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml: fsl,liodn: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml: fsl,liodn: multiple incompatible types: uint32

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
