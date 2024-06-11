Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243BE824B3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 19:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718135105; cv=none; b=i9Oo85U2Qx+PPuI+a8xcN1k/L3rAJJmoj8TiQa+2Xfput0GQJgr9qZeYm7+IXwZzzKF7wLZl6Tp8yQjfhtnfot2DNpUG+brXmMWFRucoTjlklVtd1lZh/eD/T8dlFAl1sUP2YQVbWsn/8ic5eroUn83kLm+yXHPOkVPWTt7RQCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718135105; c=relaxed/simple;
	bh=+wi8w0IF+pXWB6mY91y3RmodRVf0/fG9K3LPxcjy7hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MpnZ2SF15EO3+1wvxScjiyDoQ/Y8a3J9P7BIaBwthWgBCI0/E4PmO+5GeyUeaBGxjksDj3ibGMQrhxkqnMtXMWDdA+wf5TPDc4Hhqd3FAkQ32yQb+aqLOFnNI8y3bDEb9tbetD/x7zFFbyjHHNG7zlzt/3vp8oWgkllPOgYdjwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwLfdPZi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwLfdPZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718135104; x=1749671104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+wi8w0IF+pXWB6mY91y3RmodRVf0/fG9K3LPxcjy7hc=;
  b=EwLfdPZiUHi+BEdNEnV7TwKZSZYSillJRfP3Nv0TVMrTZwMgAma132RP
   D0CDAo4jlAicxzDtysVsRrobEZw88mqzZpnqJEf4Yirps+lyl0jTu4/Kl
   7fhp7MiRNKI80Xvi5B6dW+lvF6koIot1s1PYWzIw9vL7uK5AMU+XguEIq
   uEDG7lSdxNx/NkCxbUEqi5qnvyjKdPzQ9IS5MDDQsw6ikSwUJP9LBLgc2
   G0PvUCulCWiZnoTpil8HFQ8yHLcft7XSpJCzjZuGnP0GGLpXO4jrwpQ7r
   e9xfNb54LLGOdGQed3Sd4OverLPZmopMJfs9HoAAAY+evhh3k2bfpWzik
   w==;
X-CSE-ConnectionGUID: UY/TEUhvSlS4n+ozExG3JQ==
X-CSE-MsgGUID: 05Uj2v5/TbOIDdxhpJsiEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15026613"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="15026613"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 12:45:03 -0700
X-CSE-ConnectionGUID: 3ot48CVPS9Od+gNfd3m1kA==
X-CSE-MsgGUID: Rw/GFDzxTtWVY0QmWkP2wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="39441984"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jun 2024 12:45:02 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH7QS-0000qc-2D;
	Tue, 11 Jun 2024 19:45:00 +0000
Date: Wed, 12 Jun 2024 03:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.1-main 56/216]
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64-rtl8367.dts:49.10-103.4:
 Warning (unit_address_vs_reg): /ethernet@1b100000/mdio-bus/switch1: node has
 a reg or ranges property, but no unit name
Message-ID: <202406120309.bW3ZVdro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.1-main
head:   e2c203bcd6b99556747c4d0d1fc0b190c44a5df8
commit: 837f2016b18885de8089f8fad5300edf7728dc14 [56/216] arm64: dts: mediatek: add r64 v0.1 variant with rtl8367 switch
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240612/202406120309.bW3ZVdro-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120309.bW3ZVdro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120309.bW3ZVdro-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622.dtsi:895.27-909.4: Warning (unit_address_vs_reg): /t-phy@1a243000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64-rtl8367.dts:49.10-103.4: Warning (unit_address_vs_reg): /ethernet@1b100000/mdio-bus/switch1: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts:75.9-77.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7622.dtsi:530.22-541.4: Warning (unique_unit_address): /nfi@1100d000: duplicate unit-address (also used in node /spi@1100d000)

vim +49 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64-rtl8367.dts

    47	
    48	&mdio {
  > 49		switch1 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
