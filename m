Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857922C15A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761599869; cv=none; b=bCcKTwF9fjH10OsFc79BPsmIL91g4kLT7rJOUwPecmTWySNscJiT9pm/aA3SqoUILBfFIMfG4cvwsbpOpRgGo6wa+JNiV/PTyLzBTwqBjuEKYAWZS3PFVqR3f6C4pSYOX8Twfp3VHWJBuzklUvCBsdGWanv7Z+JiHzjoNubjuA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761599869; c=relaxed/simple;
	bh=qXpaOLGEiUvs9KLXF8FRKehPncyzdJpe/anUUoqjWKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A03LAtW30nh3xoS4abDveqNQCYubey/CGaUJv+BBqjOFMGvD7HxD7sPPju6Dt6oLXU/1sTODzDdRHuD+3F/Un+kYW4ADJWktPlrAIL883vfgw42Ee+/HGCpZ6rd3NIqVPw385mq9Wa36iY/3UfGv/2zjlAmHtWYkV4/IHoievSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gm6ZQgqw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gm6ZQgqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761599868; x=1793135868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qXpaOLGEiUvs9KLXF8FRKehPncyzdJpe/anUUoqjWKU=;
  b=gm6ZQgqw+JXV0ZLfTdmNqY1cGnOpsMzfQ+NTdF5tHrmUgpTmb8ttpJ1N
   fPoHfb3Sj+Kbl03oVjHcJmt+xkKZWFcQjuR0kuVKlSRKlfUnePn/8V42T
   IiTiyaL5fmgwqhVhtiANn/v1lpo/pG6JNvPy7839Rsf0rrJisvWMkbqmM
   kTj2sf3a7Nf/Csygg6nl8QZQz/qvJrX3RkusXNy+LkWvjNxFazB7gAYlH
   sHEIWHt150KaONzJx6ST1LwXRQDWJNEq42UYiJEPBwFkk6zy2rTjeuhud
   73fZQifdZK5dWOCb1qD23iz1OGvsKo55xR3aT/E4/jY/rQNqCg7GRBdJU
   g==;
X-CSE-ConnectionGUID: KXPZtcNLR92qavQ0EQK7kg==
X-CSE-MsgGUID: AWiq5S9NS3KlT6cpcU3IVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63730392"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63730392"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 14:17:47 -0700
X-CSE-ConnectionGUID: ciqqjuzkT62c6o9B6djiMA==
X-CSE-MsgGUID: UEFTFFfYRPi8FRODEmEKHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="185500241"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Oct 2025 14:17:46 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDUb1-000000000Od-3AhJ;
	Mon, 27 Oct 2025 21:17:43 +0000
Date: Mon, 27 Oct 2025 22:16:49 +0100
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [linux-next:master 3615/4376]
 arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: gpu@fd000000
 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202510272226.SsGfYQ9e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
commit: 0eb6f5143b1daede692ee143df604197f9922164 [3615/4376] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
config: arm64-randconfig-2053-20251025 (https://download.01.org/0day-ci/archive/20251027/202510272226.SsGfYQ9e-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dfbe84da278126ac8017618af885ffc8581a728)
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510272226.SsGfYQ9e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510272226.SsGfYQ9e-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
