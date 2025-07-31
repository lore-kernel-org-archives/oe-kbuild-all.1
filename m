Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C2D26C3A3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 22:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754000981; cv=none; b=oq0QUL+fAT0CTp8kV5BfURSQAM00AeBCZtiff98ycp4vhQ3L5kHEm0SAIT7uClfMFT9X/AAKmj7ViJ11i305gxi/4JcEJomjFblQ1NrQHH56LKBTb+u9hwrYbeJC7mx/L0XgtJRd4hWezLeVFGo2eGiqasFNFqQqxnVUOV0rlbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754000981; c=relaxed/simple;
	bh=ODJld3oHjVxPuOQ/NNNGjZqYJmYN198WdM58Y5+RMN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=icGWgFsCONTCht7EbH+9YSoxjrbTNbMOdgooytiwLg/Wp/etQV43CellwEnzbYYRArCe5p/Szz2mpQkFBqldTP+lt5NOkNh6aDwVt9fhpgpDvJMESW69MKdTeLix6Kxbdw/uEBa+FjNQT7KTqpHwjT5n/eG4EI69Joeg94lmt1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrOoRkAi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrOoRkAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754000980; x=1785536980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ODJld3oHjVxPuOQ/NNNGjZqYJmYN198WdM58Y5+RMN0=;
  b=nrOoRkAicLFHCMqW4r5VNRahNgbI8iTeCiaeIqafZQnWFk2iuM3ggZk5
   3ayxgn9StgyI5y+CcdUqPr28Ty/frSc1I5bebcrajYjduEsFdT+39TL77
   qbekE8KlrXOW4H+He0DDeLJHMRK1I8d0cletVmfGqwGF2V/lxESiNtic1
   rLLAUGTKSVT7Lr6CcdET5U2qZbtj6nkhNdKCC+lDqD+F55g3xTDbzrzPq
   agEmD/7pQT6e1I0ErO5IWLbS5G3T6wrPc5PfIovEs+ZXajKCPCJZ3E1Hs
   3MrPLlTN57T3eny2vqkjOsnKtJ0WDwJBLOQMSWoXOCD+N12PJk2On0Lm+
   Q==;
X-CSE-ConnectionGUID: U4FWsn+pRpGrdr/7sytvIw==
X-CSE-MsgGUID: UG6ginXPT+aPCm3eLl57Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56489710"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56489710"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 15:29:40 -0700
X-CSE-ConnectionGUID: kwNqtnKITPGUfve7bxdrXw==
X-CSE-MsgGUID: XQY10cgUQCeZNEuehVhwTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="167864292"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2025 15:29:38 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhbmK-00049I-0E;
	Thu, 31 Jul 2025 22:29:36 +0000
Date: Fri, 1 Aug 2025 06:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: flash@0 (jedec,spi-nor):
 Unevaluated properties are not allowed ('vcc-supply' was unexpected)
Message-ID: <202508010838.JIQ1T8qJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   bf0fb8bb181b86adf67dcc60b8269d60814de5a1
commit: 4fd50f6980e2a491ab9b21b42db5f474e85badfa [1/1] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c
config: arm64-randconfig-051-20250726 (https://download.01.org/0day-ci/archive/20250801/202508010838.JIQ1T8qJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010838.JIQ1T8qJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010838.JIQ1T8qJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
