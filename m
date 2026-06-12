Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF22C2C08BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 02:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233146; cv=none; b=GAYm7P5zpc5tISz8ga2Nw0VEzC3yVaZTgDPVvr3W/zqd4JYmv1D2O2xKS3RmRH4AgtFNH8f+OqRRfGZl16O2pGeCEb2nOXEKHPx/jHGlL6qK68wUqRNZzNJJChfD0XpHhAb7mAmTd64ZGr9OfRTTbwQigoUE/myC0085RhJWvsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233146; c=relaxed/simple;
	bh=TkwRG0/ENlzeRTd8lWeKV4YiviHGOUjHarx4Fs6ikeg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uz2CrXDp8q2x/Zf944UeZO6512tPw6rmb40p1DfFgASZd+iV0+PNkLmkFqqShzhLbCaCD/daUjskaQQMKyiZOAf+g2tjLKF/d9tYBRZBExyBW+iP2uSpPYBAfwM5SBLUV2kWz7UT0YbH/cr7HyT9CYw4rxibQcRGVWPvuotPfD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Duc2zsW0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Duc2zsW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781233144; x=1812769144;
  h=date:from:to:cc:subject:message-id;
  bh=TkwRG0/ENlzeRTd8lWeKV4YiviHGOUjHarx4Fs6ikeg=;
  b=Duc2zsW0ISQLCFTVSqePxsfUmrZaNJIB0hnmH4qAOQGQIPrrZiuBYIJJ
   sfE4qVLLuQG04BoGoD+K/2SN0f1fSnBBAYOmxD3u+YGfEOK02lrdKBVNV
   iJM1/qEYuVdTvH4ld3+6TG9NHInrHna9CI4tsJwIcsU4yy8377RKKxyFD
   VBKlUletbhkOHUoJmJPBgIZB8L1JDo5vkQ0SN5bePHdtNLnMlOyvxi+/3
   7u55uBn20GBSfS2xkhjitkSzwI3BcER94NaOOA/OK186S5CVseApMna+P
   P4YP2hU8fvInAPre+gdhpALF8Rs6dkOW70GuAOQJ1j7zhQMoX7g9GjSC1
   Q==;
X-CSE-ConnectionGUID: 8eLIHWFRQhe8ukpw8p/9xQ==
X-CSE-MsgGUID: u78eNm1TTza70dFlZAx27Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93171184"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="93171184"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 19:59:04 -0700
X-CSE-ConnectionGUID: iNdg2bMNTymKAwhQfZaRkA==
X-CSE-MsgGUID: Lo0hystFQnOoHzC9C6llaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="284800253"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Jun 2026 19:59:01 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXs6k-000000004BF-3Rhs;
	Fri, 12 Jun 2026 02:58:58 +0000
Date: Fri, 12 Jun 2026 04:58:18 +0200
From: kernel test robot <lkp@intel.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>,
 Frank Li <Frank.Li@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-doc@vger.kernel.org
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 27173/27391] htmldocs:
 Warning: MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
Message-ID: <202606120453.2rP7tq7s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: c54362d581209a7421fe0d0caf70ff172289da75 [27173/27391] i3c: master: Add driver for Analog Devices I3C Controller IP
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260612/202606120453.2rP7tq7s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120453.2rP7tq7s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
   Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adc.txt
   Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adc.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme
--
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
   Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adc.txt
   Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adc.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
