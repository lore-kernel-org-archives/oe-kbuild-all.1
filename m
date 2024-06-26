Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB9BBE6C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 02:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719367398; cv=none; b=LlTpa0yw2jXkxm5qZETrQrW82D999m8dCmartAdiK743+IjR3kHCcmBC0QSAqy8V3CLvx5/7hZaPE7jFyKuMQ/Tls9VlxmxaUptfAIzF+sWRw7JLheJ2Rj6JBIBslVOfzzfAoPXQmUx6ynAPZjRzTWPTMWIc1Z7ulGImDCApo1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719367398; c=relaxed/simple;
	bh=J0aD7YCc1Jhoxv9unXapOg8Wf2bMogG65eVyJTRweqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VdtW4FRvBiAOGvwKU99OByPu4fzn9D3Xg9z9WC9No0miJc71HuEd2j6XUIdOSIE3BNKpbpLdCRHHEqubm5Jh1M4T57xf43RBNr2V8uHo6xmdvBauRJ/QUG++QfL2n1WNuso1iYoSOBIMHQEvwMFgD4E0Ak8fHwo1yRAxTWoeGjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKmCTsF7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKmCTsF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719367396; x=1750903396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J0aD7YCc1Jhoxv9unXapOg8Wf2bMogG65eVyJTRweqs=;
  b=kKmCTsF70o+rpivBdFeevx/tDSe+kbGcsEI/Z3We/3oSK0snovyVj6Ax
   FL8HFnG5ApjuqxL1dmlrtOuMe3sS8MmAxT9gmdzDf4aQ9IS9XsP1TP1Us
   hRGR2H4WARDtDqsKFGPbJr/NSyNukIBdeAvSCi5kCQenWrLZsA4IyHHiD
   Bne3+7T+t3xG6lf5SZ8lOSBxZj/0GZDw9z5ZfbuLtH0E/+/iy+Dlxkt8w
   JYiuOTng9UdSwOZECVMrTvlQKNQKyZtV6wqSTlL2+eS3r7xxgZFV3oYM8
   qwglM8QQNAiYmYjNBwS+08T7Kp5Cdl4Rfoyyz9hBFisd3HZyARmiMszJ5
   A==;
X-CSE-ConnectionGUID: YNhv0BNtRomDAirCGq5sIQ==
X-CSE-MsgGUID: yE3Y4qFtRp2mA/XX84fyvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="41834958"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="41834958"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 19:03:14 -0700
X-CSE-ConnectionGUID: 0w6ogvcYTP6CYu5YWcMhcA==
X-CSE-MsgGUID: DB3/tgjRT3CfSH+Whj7YDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="43814842"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jun 2024 19:03:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMI07-000EtS-0s;
	Wed, 26 Jun 2024 02:03:11 +0000
Date: Wed, 26 Jun 2024 10:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [linux-next:master 3392/8232]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb:
 /soc@107c000000/timer@7c003000: failed to match any schema with compatible:
 ['brcm,bcm2835-system-timer']
Message-ID: <202406260927.CS1A5Ugr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: cbda7c3ffe6d78933ee8c2d5e71de60ff4f4847b [3392/8232] arm64: dts: broadcom: Add minimal support for Raspberry Pi 5
config: arm64-randconfig-051-20240626 (https://download.01.org/0day-ci/archive/20240626/202406260927.CS1A5Ugr-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260927.CS1A5Ugr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260927.CS1A5Ugr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /: failed to match any schema with compatible: ['raspberrypi,5-model-b', 'brcm,bcm2712']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /: failed to match any schema with compatible: ['raspberrypi,5-model-b', 'brcm,bcm2712']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/mmc@fff000: failed to match any schema with compatible: ['brcm,bcm2712-sdhci', 'brcm,sdhci-brcmstb']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/timer@7c003000: failed to match any schema with compatible: ['brcm,bcm2835-system-timer']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/local-intc@7cd00000: failed to match any schema with compatible: ['brcm,bcm2836-l1-intc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
