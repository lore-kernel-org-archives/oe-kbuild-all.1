Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761006;
	b=D9a0w+Q8s/jvTo46wmCYx60PJbngFitdgyixwXYZ1/+wOFbWHDPP/iHwCZac6a7hgBT2
	 4AT56+qmSLt/1z/pZpajanEITeFP5GoNEc6orWi9bSGlDazlr4VgAyi9ftJ/t0izLZ4kt
	 uC+sMrNEAAqDoYx9mYpvYkqU054s1RT/4gJZNr1EVflaFk3Om193QAWCqOiGId425A8sc
	 SzsF03f44qRR7V80o9uuYYW02bo/fgUo047APcQ19EzlIlyE3gqbEc4sU0uDxDC2gJqmV
	 Cft/yGLkkpc1xnKjTc8L+vgRcOzhuPemgBpvolkaLCgRQxL0OZ+9E4bSh4hZLu0GYtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761006;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=R2iRhcUKzpg09pMqFlUiTYBUGwuvAK5OxeIng30I8lM=;
	b=cOxLYMuWQODct2NDbKJkEffErqkOSJNyqsbCy44XFzXT19GN2B0QuvHE1z0H9fkGWqsa
	 P0r3OhS+TPshV0H2iM+CZmBimbsgrBQjWAHlp6yFdMPESPx1D6rBE6LYLF+7xVjRsICrR
	 fmtFUqgl7ae9jlvCJQiNcg4kmSH3NWUmyiNx6snlGSjHThvrVhxiqENaHwDBGM5ZQeLwx
	 ZG30zKmfQZalCPo6cAIgBLZJkqQuyg/HGvT79zWLJkXZFXmiGEFqK7hZ9kejcUdMBt2In
	 SdjyW73YPIsJtkg5HduUCxornFYyLqgLq0TwfQl572bdF0ND3xJ0gHa05tY8z5mfZBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PxibGQbk;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D2D606A31D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 13:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D2D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PxibGQbk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792761006; x=1824297006;
  h=date:from:to:cc:subject:message-id;
  bh=eOLe9qM5to5+rb7A6RWhBnmRoOmojx7j8bVQo9eFKbU=;
  b=PxibGQbkrQLvJtyf+g3R9R32t4NjbFMqSuKQpvD1TlNIUCpOTSiLC6OJ
   jCgjgxPWQWv/W/nS3M/xoqNwasAUmsAsxFnDq3Hya7fmTdsq8uqbikpzt
   82T1rbzrjXY+bXtKok5wIF4JshZYbXCe+u1w7QaiIbRojBZLzLrimxLGC
   1M8t3p6r8LrysiZq/+5HB2Lv37r5CV7ghbhtuiGEz576GRWhP2AxliZQT
   7zZTLsXOVE0OGO4giVvMVHkiQchNFCob7hLnyoC/zvJx9pfOyt5UwA3rC
   6kpnN0zjKFjSkw/apYpypEOJxtsfXAK7pI1iezRGWbOAwCJ/rCjF8/2fg
   g==;
X-CSE-ConnectionGUID: rz5J317jQiW1JuAepDAUsA==
X-CSE-MsgGUID: 2EnJJrShTryW54oiYmPWIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1532249"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1532249"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 06:10:04 -0700
X-CSE-ConnectionGUID: obESoD+ESIK7QZxNe3uvsA==
X-CSE-MsgGUID: iHPb8hTtSxGfcaEE3XJwjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3753310"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Oct 2026 06:10:02 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKF1z-000000000cV-46nl;
	Fri, 23 Oct 2026 13:09:59 +0000
Date: Fri, 23 Oct 2026 15:09:41 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: [linux-next:master 16175/19853]
 arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: pmic@0
 (hisilicon,hi6421-spmi): 'gpios' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202610231501.WW0waqzv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
commit: 1b482faa86591dbd8524d294383281f4adf2f6cf [16175/19853] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261023/202610231501.WW0waqzv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231501.WW0waqzv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231501.WW0waqzv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: soc (simple-bus): gpio-range: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/crg_ctrl@fff35000: failed to match any schema with compatible: ['hisilicon,hi3670-crgctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/pctrl@e8a09000: failed to match any schema with compatible: ['hisilicon,hi3670-pctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/crg_ctrl@fff34000: failed to match any schema with compatible: ['hisilicon,hi3670-pmuctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/sctrl@fff0a000: failed to match any schema with compatible: ['hisilicon,hi3670-sctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/iomcu@ffd7e000: failed to match any schema with compatible: ['hisilicon,hi3670-iomcu', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/media1_crgctrl@e87ff000: failed to match any schema with compatible: ['hisilicon,hi3670-media1-crg', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/media2_crgctrl@e8900000: failed to match any schema with compatible: ['hisilicon,hi3670-media2-crg', 'syscon']
>> arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: pmic@0 (hisilicon,hi6421-spmi): 'gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
