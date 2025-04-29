Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D2610F2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 18:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951989; cv=none; b=qjmcTx4RSThy8pNN3X9n+5D1OOFAvlaNrbnHevWxeoVTnFo0PqDWlusUXBQBlBYpI9iOr2/dzHu/xyDjY87i1Co7iGDy47w85EHqfQ1acplTIup8pSCaBrmKjUejdDRRUTsuUe2vED9bDX9AzLmM4kwF8lWXOdxMHrTBnAFBPys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951989; c=relaxed/simple;
	bh=WnWGSbw4F+GMQDNdEUxP9ml1XZv+NSEXpWQFlkIVM6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DJ8sz0AmxjAI8xaZtV1T+pIF865IQVdrOiwnOovFV8l57B/LQToEQs5Q9Rklv+qTIQC2/COLW8oU339ZbSYVNTtzPNk37l8sRZyKohV5YdFTSTiPd7C2WjYAdtXw1vMlfR8A/C6t8emfmBrOm1Mb0iccjFvp4Y1L2JrNOwmAueA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfh+ucXD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfh+ucXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745951987; x=1777487987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WnWGSbw4F+GMQDNdEUxP9ml1XZv+NSEXpWQFlkIVM6g=;
  b=gfh+ucXD3aVM/G4x+SDO8eRu63d/PC9kcv/AWDvmGuQ2P3AQeCYZlBOC
   o7E/sXiVwix/puaj9jc4BBBF7oUc5HG9v40ApvxVfCo9eb/zMUQbTnbYE
   gd8gZwpm6wbDj3ayqGvb3k4dwIXrQBeByxPfRJ6YzH1W1NSJcQ80rDVlB
   FsTsimRZT5TEEvLUmnv8hV3+Tachv2LXo1BU33qhsFBb5AJzlEXcqnC3J
   lOAMR55BUKw0zUc680X0aosgjeDXD7vqEpxbslSuzvOyV/50H5WRa0oDd
   E8AZ/OwoXzJ0sQzTCvM/UQkSh0moGbkYl3JU49vX/F6nEO/a6zdqEnucw
   w==;
X-CSE-ConnectionGUID: jYc4BUSKQWCd39A1m7Y6Rg==
X-CSE-MsgGUID: S/0WJEBUT5CtBh8dFb5pdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="72974051"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="72974051"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 11:39:47 -0700
X-CSE-ConnectionGUID: T6EJ4spOQiOJjY52ByhGlg==
X-CSE-MsgGUID: nRuLpEW/S7SeLWOJlGuqPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="138714760"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Apr 2025 11:39:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9prq-0002qe-33;
	Tue, 29 Apr 2025 18:39:42 +0000
Date: Wed, 30 Apr 2025 02:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko.stuebner@cherry.de>
Cc: oe-kbuild-all@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>
Subject: [linux-next:master 6416/7105]
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb:
 panel@0 (leadtek,ltk050h3148w): 'port' does not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202504300218.VDqQqGTT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d9096722447b77662d4237a09909bde7774f22e
commit: 777055e02f739b5df943366323f58eeb68d90e67 [6416/7105] arm64: dts: rockchip: add overlay for tiger-haikou video-demo adapter
config: arm64-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300218.VDqQqGTT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300218.VDqQqGTT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300218.VDqQqGTT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: panel@0 (leadtek,ltk050h3148w): 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: /edp@fdec0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
