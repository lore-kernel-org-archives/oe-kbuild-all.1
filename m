Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92FD288DB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 09:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732787757; cv=none; b=mcuTm5pu5CrwJ9Eah4/+wL7EzPhVOeX39puD2LoOmSBZIZnFOzCBJN24jAfRttirVtQoBTqBe79WonNcs7pMmxlvQXCod6B+Gs9uh/JaWKZJbUKKvhYwZ+dHprMki+viz7amxIhx8zgoVfOXfMa4RY8Nz1Mge0Onek2PNLsZ3CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732787757; c=relaxed/simple;
	bh=AicxqyVlbf8OVQ3XY6XZKxCK+dhZJFwQYoZkoIffaws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mkBUDxC5Vp+3K6GyOABeXheokpndmlyGo2MKCP+d2C8lnL3WdB94F8jr8+g2rHq8TgJfrkaA8z40HjUz2s3wQqOxbEwGUv2nYFiuvrRIvjDly2PpmD/hagk2vjoULosM3P0BRv2TK63czUkiU3ZslD+5qYSQQliMpHwNUog5Fxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiLEpQkr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiLEpQkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732787755; x=1764323755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AicxqyVlbf8OVQ3XY6XZKxCK+dhZJFwQYoZkoIffaws=;
  b=fiLEpQkrYz7RuJiCHnYc25eCZyG2lxrOjiMOGQBvU6hYlQAB9LZIAQlJ
   4ZLiH2ivAHG84tja+9nIJFcOm1Dh8alaM9G1Uh9yaSS4nHkI/VUwAN4vJ
   Cnzhe5NSe5Qf7hyhNZThE2MdwhCP0ba8P83QlPj7E8WjCNPIVXiq81k55
   7h2DAPye2bBswCO5pQfJWXCXkJDyyGMISDJc5V1t72A5KEATKfa9SbneQ
   OzbX/tnQkDx7VTT0O694fwBQCxrNebeZj3+jgli89ZuPGSKr4yg5w1HAB
   SARG4MvhWzIrKSpXepXgzOCDOPXbZJm9jC8T2j2dvN3R2jUrTdw42Qr50
   w==;
X-CSE-ConnectionGUID: RzEOUW86S6isagZqb1Y2Bw==
X-CSE-MsgGUID: dXsChth0SxiWpFd7EhZjeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32874034"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="32874034"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 01:55:55 -0800
X-CSE-ConnectionGUID: DplCgKTmTlaY0Cel4MnJ9Q==
X-CSE-MsgGUID: 47wVuf9/SSqgtTpJggOMrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="97283691"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Nov 2024 01:55:54 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGbFW-0009RF-2x;
	Thu, 28 Nov 2024 09:55:50 +0000
Date: Thu, 28 Nov 2024 17:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-mt7988upstream 24/26] Error:
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:108.1-5 Label or
 path eth not found
Message-ID: <202411281719.AoYE2aIo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-mt7988upstream
head:   fd55bbb7ef876630e7c045e8694d60e331fd90bd
commit: 747491bd27a750027806331cbe906fb594b0b1e2 [24/26] arm64: dts: update bpi-r4.dts to actual state
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411281719.AoYE2aIo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281719.AoYE2aIo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281719.AoYE2aIo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:108.1-5 Label or path eth not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:112.1-7 Label or path gmac0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:116.1-7 Label or path gmac1 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:123.1-7 Label or path gmac2 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:130.1-8 Label or path switch not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:134.1-10 Label or path gsw_phy0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:139.1-11 Label or path gsw_port0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:143.1-15 Label or path gsw_phy0_led0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:148.1-10 Label or path gsw_phy1 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:153.1-15 Label or path gsw_phy1_led0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:158.1-10 Label or path gsw_phy2 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:163.1-15 Label or path gsw_phy2_led0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:168.1-10 Label or path gsw_phy3 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:173.1-15 Label or path gsw_phy3_led0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:194.1-5 Label or path cci not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:311.1-7 Label or path pcie0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:318.1-7 Label or path pcie1 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:325.1-7 Label or path pcie2 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:332.1-7 Label or path pcie3 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:342.1-5 Label or path fan not found
   Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:351.1-6 Label or path tphy not found
   Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:409.1-7 Label or path uart0 not found
   Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:417.1-6 Label or path xphy not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
