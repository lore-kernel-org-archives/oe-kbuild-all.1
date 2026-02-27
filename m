Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CCA43E4A0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 20:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772225739; cv=none; b=DvXmGHWoIX+cGRqvHZcpIyH+FDHRK4V0kxQZolC7OB53Y1l4jsTx2DMdIgZfdm60FTJ+A2aBvW9p/VHWHb0zYIawDpvDfLAfaf+QHASXFJKXTzML1XPtzAWKj1hQDu+Xyqj3gBto6/8gogwpPp6BirAF/+O285G2S2d1JELf3cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772225739; c=relaxed/simple;
	bh=DP9ajAgSruMYWtuMMFB8M+Q3jGOja+8ctB8ay1J+sFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nuuxqolh16fKjWGaWAjsH6NNoTVwSwkfPtI8cO1ZRrAcMmepZokBrxAG4tXSpYa8a2DbZh+UbqPysz7Mylq8QaQUauRYQMwqPv4k7CaGNiHU0wFI3/RvHQ5y4s08gf8kcTbWejEGBRAcOnpWjmBlHfdpecea0TaqXG1JfjuwtRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDoyTUm+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDoyTUm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772225737; x=1803761737;
  h=date:from:to:cc:subject:message-id;
  bh=DP9ajAgSruMYWtuMMFB8M+Q3jGOja+8ctB8ay1J+sFg=;
  b=EDoyTUm+OYo5Pu6FlszHZ7rwedh36VuH1xGhFWe+NJei9w9iMY2xcI2+
   LecHOP/vGrNQdiDsE9HxRhBUSaIW1vZBCON1UlJelHVQfZXBZfLFxavoF
   I16xw7mppDffRgMVSiwmUoZz3D2CE0qtjko8bDHjWlW7vVnN7APiWUCxC
   Dr2vf5vDHaXjjFkuBz0y86jpPodoRbyEKYE3bjTxnOIH1PNcignr7jEeD
   S723+Xsv/Z3U9cifUvKFRZzB7rwSJ/4RObhinzhI3Svx6Y/6EmCpSzFG8
   yTFbV5yfQptRC8YGNh3MGVdkRWrtlIdkY8volWM0fT3Q+DJQrHRAP6hP6
   w==;
X-CSE-ConnectionGUID: 8iwXSjOLSqiKhjufM/w8fg==
X-CSE-MsgGUID: FIp66MKhSdOSjORjUcYYUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73021637"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73021637"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 12:55:36 -0800
X-CSE-ConnectionGUID: 1TZ0PMkKSpyvSXEXwHnYUw==
X-CSE-MsgGUID: MkCVZYyHQmSG4ul6r4YCJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="247505727"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Feb 2026 12:55:34 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw4rz-000000000cL-3euQ;
	Fri, 27 Feb 2026 20:55:31 +0000
Date: Fri, 27 Feb 2026 21:55:29 +0100
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:master 2414/2910] htmldocs: Warning:
 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
Message-ID: <202602272154.VcM04DJL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fa5e5702a82d259897bd7e209469bc06368bf31
commit: 5a8ffc5dca9c096fe9c8879fa3a2faff723fbb8a [2414/2910] regulator: dt-bindings: cpcap-regulator: convert to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260227/202602272154.VcM04DJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602272154.VcM04DJL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
>> Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/leds/leds-lp5812.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-led-multicolor.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
