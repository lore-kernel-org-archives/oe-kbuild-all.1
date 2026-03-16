Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD2C533D6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 12:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665329; cv=none; b=rsq+dfxMekjROPQMrEfwkcDOfUDNNov8OruQcLHG9CK/vWWN3+0dUVmPkFj0rt3wv1MqOL+0AreGTXkSiENtq+pZGzoHd2pqd1xY4cwY2Tfm0tIhbML0JhIzFAn4xMfNOXNGG1ceusEwk+3h6s17qIAMIEFtpBAZD7+kV3AvnR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665329; c=relaxed/simple;
	bh=gfWOn0n6OT7quiKxl9iHQxQ1b3TvD/zpUXUC7R1pAIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lEr8gMXSdlXcgHCbvwBYEPh47YPRB0akJRRVq2t8P85zMjcIkOQaf0bqMjZ1p/XUUtwpUCyANm67og2yhmjH2BrJWrZQM/W26e6LySPco5ve+LriNJhOJm8Cn0WfX3Sar6mOsFGDJYou5MGeRndtOJ9EnZH73s83WivwtCOrsNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVI/S+bm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVI/S+bm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773665327; x=1805201327;
  h=date:from:to:cc:subject:message-id;
  bh=gfWOn0n6OT7quiKxl9iHQxQ1b3TvD/zpUXUC7R1pAIY=;
  b=mVI/S+bmdMOjznCNG772CzDidAVmA4La5TnBGyhy6KtMdlqrwvVcWQkJ
   6f6lK08uO7fDCIXGdbHkO6prbtKxJrzGR1uLItRSpZNmBh4vUU8vOnnIH
   Mch+wC5uGI8RXlu+/ZAbKGkvr6X7AurZBzuSk3M0FCPSs+n/poNCS3RXJ
   SkhjGX+3y8Bz6nHqvYOY6NKMqpT8gX1Tg/q2m/ojer3oRUOmLzYCeRY7a
   Dm3tIQ4bAVlDSgLheZ/E7fQDirxgktdxO5nfMep+5mrrNW5mlAt/blO0V
   55CN95haz3ZKmyn6Oi5ogt5t98Fm6z+r9eo6EV/aupUguFM26vd09AfdY
   A==;
X-CSE-ConnectionGUID: dSqI80eCSYiqvvYfAXgY9Q==
X-CSE-MsgGUID: fl/5RaFqSjqsWySpiGpnVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85379527"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85379527"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 05:48:47 -0700
X-CSE-ConnectionGUID: aZP8UO5BQZ6Ymd/qLfDEuQ==
X-CSE-MsgGUID: lZVTxbu+SOC5zF7krlzqeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226038945"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 Mar 2026 05:48:45 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w27ND-000000004EL-0lxF;
	Mon, 16 Mar 2026 12:48:43 +0000
Date: Mon, 16 Mar 2026 13:47:57 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 158/621] htmldocs: Warning:
 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
Message-ID: <202603161344.eE31aq7X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: 108f3a1c25d4e9fa74d574cd49670ac5faffc8fa [158/621] dt-bindings: input: Convert motorola,cpcap-pwrbutton to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260316/202603161344.eE31aq7X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603161344.eE31aq7X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/display/ti/ti,omap2-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
   Warning: Documentation/devicetree/bindings/display/ti/ti,omap3-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
   Warning: Documentation/devicetree/bindings/display/ti/ti,omap4-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
   Warning: Documentation/devicetree/bindings/display/ti/ti,omap5-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
>> Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
