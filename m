Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C5715A864
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754566702; cv=none; b=I1YCSj0HWU06Jct+wtENlBS7J7b8rHFDinwgszQxN87YW3eAIk9g6eCaFiq2Rd3yG9E9AZvUQXTkKFhatchXhv4Zd2iLi+5xXVC9n279hs+xHLxh77PJOHejEOwJjl0AsqjtamzP0BDpkAYWd1oNAR0r/y6dYzGJZRwLO5Dy6aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754566702; c=relaxed/simple;
	bh=OnpuHxcRP0MqRNhkIVoUCARNsxKdoBdpO7WmC9x8uC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DTK4RJxNTSeOaOTcAl8iwk0sCYv/N968DPBU56ERIhsmpPBKAoWH+Z4CGVI2gsFkzkNa/WQv3B8dUPYM+d2+ickbu6c6EzOV+XHSi5Yx6SwtHv+H+ytTnUsxWSoQ6PCrKHWAOSkmzPmaC8tfJH/jNkD/hVY9OABD7QWtMNmKIEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkzCEH+h; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkzCEH+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754566701; x=1786102701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OnpuHxcRP0MqRNhkIVoUCARNsxKdoBdpO7WmC9x8uC4=;
  b=jkzCEH+hwFP1D4O7MNaKyz+VKYZaFyBAa7WmUoj5PRF5mVBgaTFXsqEt
   RvmDttr35X0lqiiALQnZSxK5pjRVKGxZolP5hQaKK/RRrR/PA+evvsCQQ
   k7toeKKiZaD7SpeZE9FOvVG3Tr4t/nhNkt4Xjnvo/ycF1wfyOpyFTf4vA
   1BzeOajqMaY8sJnrFkTGuCLU1vWc9VP0PMJZnw0QVYgWV7YWBSVjsGWLC
   WxT6RWPQBeS2+1fmJoSDYd+ugajjfiNI0AOlq+8B5sO8B43FEwEWU5zA+
   yqHBolQkjfq6+BwDgoEb/45sEgzSgcDL/hnzBZ+/i+4XrDObXXBv23w6U
   A==;
X-CSE-ConnectionGUID: O456CcUFTgKWBVzzhlWnDg==
X-CSE-MsgGUID: g7wYDDB2SteDbCNN8YTPFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56980007"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56980007"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 04:38:21 -0700
X-CSE-ConnectionGUID: mywK3cxEQuCLQOoePbFgpw==
X-CSE-MsgGUID: VFrFxdL3TcSy4BZTd3GzLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="170298312"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 07 Aug 2025 04:38:19 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujywr-0002RT-0a;
	Thu, 07 Aug 2025 11:38:17 +0000
Date: Thu, 7 Aug 2025 13:37:36 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 93/801] htmldocs: Warning:
 Documentation/devicetree/bindings/clock/ti/ti,dra7-apll-clock.yaml
 references a file that doesn't exist:
 Documentation/devicetree/bindings/clock/ti/dpll.txt
Message-ID: <202508071323.bhhfvuoN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 49e69d839ca051f7cce4e3fc36dd12abf908e537 [93/801] dt-bindings: clock: Convert ti/ti,omap3-dpll-clock to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071323.bhhfvuoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071323.bhhfvuoN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,quadfs.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,flexgen.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen.txt
>> Warning: Documentation/devicetree/bindings/clock/ti/ti,dra7-apll-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/dpll.txt
   Warning: Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt
   Warning: Documentation/devicetree/bindings/thermal/armada-thermal.txt references a file that doesn't exist: Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
