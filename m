Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8884832274D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285848; cv=none; b=eRQ9Y6f0GStRW3yLnlayOfT7L1KG2TkVn9Iz7tCgoc1/bHOc+6Tf29l+qsmE1y1ZjNUvCmhsA4xTDIjLiBGnIDOZS+sQfmR8uT1NEcNKa2XwcXbpiuhyX1aAYkm5niVU2OtefmLQQ306oSTLhvVnb98kPQAKM7u2VMYC0jQ1Yo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285848; c=relaxed/simple;
	bh=yZkyQLZjtWEKT1ZQDf8dPJkHs4IN6TfyWyGvu2J7naw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CvCgeHVRPTLNdjDptaf5ngSDYZdr+fn/N1MzDy5Q4U7jf5C0yQ//41+QsCrtbrE3B4wRuF1zV3t9vsOTvMhAEPmyoKzYHkSKWIvNVFrGvhCK7HRXgRubO6OnuwqAWXsotmK9RKmgEOxe6filSZ2FpaJ81NO/72rRpDWFuglXqSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=js8YDSVc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="js8YDSVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756285847; x=1787821847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yZkyQLZjtWEKT1ZQDf8dPJkHs4IN6TfyWyGvu2J7naw=;
  b=js8YDSVcWC0NkaTGCem0LlMrfvzT4WafqF2yY3NKhiSZM0xRazQ7cTz+
   l7XaR+8Aty29EOTCpyXWOwf2FHr4xJpSX3Vk2HK4ObbEMmc3FPTfPYvxu
   pAvsHG1gvVejHwgH3q4ZVpCyKScy0YCKitfo9ukCgCDLK/4rOG0U50vo+
   eeTHw8tJbfcAI2RBlG0Pv8Ty9fcxbkWV7AAB72S9aglXOZk4Cr9js2ctC
   lO8gNWWmLO7vOIpcpVsDOL1I50iZRs3Xqgr7P6rCLhJtTyIw/ESHNEW6+
   EVmN+AfZN1BFP66W82STqQNw89PHaDPNZRUhbq59lBDAozrYI7qEGE0dB
   g==;
X-CSE-ConnectionGUID: Prxi+jjTT8aYVr6dCK2DiQ==
X-CSE-MsgGUID: 9vzbTtp6Soe8I6pT2j4W8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="62348588"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="62348588"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 02:10:35 -0700
X-CSE-ConnectionGUID: nJ0DJumPRAqedLQi3E5BwA==
X-CSE-MsgGUID: S6KtWNOCS8Gw+oZH86tLXA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 27 Aug 2025 02:10:34 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urCAq-0002cl-1S;
	Wed, 27 Aug 2025 09:10:32 +0000
Date: Wed, 27 Aug 2025 11:10:17 +0200
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3555/4761]
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: syscon@26034000
 (rockchip,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 492]]
Message-ID: <202508271156.z3wDB6bX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c642997252eef4449cb6b6e02af3dc22515d817
commit: 21bc1a7fcea4635a49f6b2eff3e4c661e80e8f43 [3555/4761] arm64: dts: rockchip: add mipi-dcphy to rk3576
config: arm64-randconfig-2051-20250826 (https://download.01.org/0day-ci/archive/20250827/202508271156.z3wDB6bX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271156.z3wDB6bX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271156.z3wDB6bX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: syscon@26034000 (rockchip,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 492]]
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: syscon@26034000 (rockchip,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 492]]
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: syscon@26034000 (rockchip,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 492]]
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: syscon@26034000 (rockchip,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 492]]
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
