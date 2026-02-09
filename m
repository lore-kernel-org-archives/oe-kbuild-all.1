Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38BE27C866
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 20:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770669723; cv=none; b=KFy3pWLby6Kp5+eaiGr/xbTopjTWieiyWBTbDZWMXSjH02c/IZ2uDWqmSZruyJqBxPLdr5KQm+XGIWntm8RjHQkH6tLQ6F7e0U8XW37WRaBpyXSa2gkQTrdG4Iumdha7syvf1cg9fCfnUv7i+TZur0EVI3NKaG49+KPifCKO7TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770669723; c=relaxed/simple;
	bh=kJMsDRiIjZyT64eb6EolIJB2d9xqQjE8630NpD3fw3Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eIToOIM4EUWZMepF1jWOQRmWbwwY7Lrf81YpefvNzSYD59Cl++2kTSWofDjbdvWa/sxo60xDO1T/iDuh/1zHbnwc0N6sRMWjGcYpYE8EUekOtSNYLUDkI/DlddAwTxmAtnTE+m0arax/r0HwGHwMZ2/j62PTYlPaUEHk1l4uUh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blhKXJc9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blhKXJc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770669722; x=1802205722;
  h=date:from:to:cc:subject:message-id;
  bh=kJMsDRiIjZyT64eb6EolIJB2d9xqQjE8630NpD3fw3Q=;
  b=blhKXJc9fj6bp8W+OOFFYpz6Gb/EdMR/4D2joS/iNhMAb1XlruzK3NXp
   v/HVkgiCT6uLcNV16oqtnZRbi1Lmcy5RSvEvMLHl0H88objnr4jW+WY7e
   YCzMtC4h88NpAV7OFBLCdzVmXR6gG0pUQSBzaTHULcXDvU7JPwFeGXhiC
   +dck7ZWh6j4ev1ahEs8+yZWsjZnX7shWXEDVW19wQ8DL75xXGPkzQoQ0X
   axqRzfWFRYz1IeP64L3dMsvEfbDdWsKUz1mVLsbdQmfk32NZb6BY2rwpW
   aMUZrPlVjSJElqxEkk5gY+S79h/P8NMg8HSyLvXyEnzjpzDp4C99BRFIW
   g==;
X-CSE-ConnectionGUID: uzUcAZTBRTKfgDMtqL02FQ==
X-CSE-MsgGUID: /uFpBGfqTuuYx2dtPXQ7kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71512619"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71512619"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 12:42:02 -0800
X-CSE-ConnectionGUID: oHsNOhCSTgqEiNqf+XyUOA==
X-CSE-MsgGUID: xGQMwgHTTtmaqx5KIzZS1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216216219"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2026 12:42:00 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpY50-000000000T3-0uC8;
	Mon, 09 Feb 2026 20:41:58 +0000
Date: Mon, 09 Feb 2026 21:41:28 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2] htmldocs: Warning:
 mm/cleancache.c references a file that doesn't exist:
 Documentation/vm/cleancache.rst
Message-ID: <202602092100.UFgKEmiW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3b54985e12634723f50be663b001e0f03e8643e1
commit: 3318ae18bbe039615a077378e3736623852d5757 [0/2] ANDROID: Revert "mm: remove cleancache"
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260209/202602092100.UFgKEmiW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092100.UFgKEmiW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
>> Warning: mm/cleancache.c references a file that doesn't exist: Documentation/vm/cleancache.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt
   Using alabaster theme
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
>> Warning: mm/cleancache.c references a file that doesn't exist: Documentation/vm/cleancache.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
