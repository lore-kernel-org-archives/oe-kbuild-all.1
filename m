Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952A93594C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564674; cv=none; b=G3vPVzvUKGF+It3IJ+zzKFmTE+4CstVdfvrJjNY5hAw28GafC73PSOVfB0L2sNcKlLmp3MBtlGii1n5B6dYAJH7J/XJr2DA8WUdR/7njTs5dsMnOtOTEEtQMPpkFex1Q0sojZfLhQueAUyXwuAXpAMjZ0vsNCRuXCNBVFniaRB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564674; c=relaxed/simple;
	bh=sXKUv3S0/NUDAl1k3FHrIqi54ftSrDJke+95Tt75cqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QgxOEJucFkwCmQOqFaHOZEHh7yhY4c+9dxjXDMhVvBPc+2cY3Si3RZGjRMAvh0dvtiBLcTy7n3b5O/joNES22PXPj073DyNr2rcJ3flHa3d3CwBCi6SmLKnZuSfQjKLDXMFLC9JbE9pNK8F9tTsSb5YgWbmi6VSNm/HQ5x/XxFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1+H5wF7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1+H5wF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754564673; x=1786100673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXKUv3S0/NUDAl1k3FHrIqi54ftSrDJke+95Tt75cqA=;
  b=j1+H5wF7b5U4nb09zYTVu77+PiO3KM6uYJIXzZt8HjG7RCyxj2XQfY0W
   cu3GSGMHD69FtVuZfMf3isQC4ilSjNHzirYjYVZaLqMbPnQXptC5avvWL
   xTIEUtmTv5EQtJC8cE7j/TBDhtEfReuFTn9Ls1UzrqLWZr7BV4xMm/UqJ
   dkoXy4A6JEFNq93gN1drJ2mij5ypL9jDsFYONrS5/eRXBsw6opkP/Gyfm
   hvkopEn38O0WitOgTVWJ+dwUsAt0jlWWIBEyuaJ39RsWcb/G1RgHj4n6e
   lB4N4msUdBXjjIM/kESm3dwodNv74HD3jfPZ86GBgD7IDto53H4n88A3u
   g==;
X-CSE-ConnectionGUID: M3E6c1uaSSWXdEU6WQDpGw==
X-CSE-MsgGUID: 16mlv6LLSUK3d2MlVF+thA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60527745"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60527745"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 04:04:18 -0700
X-CSE-ConnectionGUID: efd7e5E8QISQEANTW8ER8w==
X-CSE-MsgGUID: QXNJ6uxZSbSKEZabel7Ejw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="195873239"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 04:04:17 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujyPv-0002R3-0M;
	Thu, 07 Aug 2025 11:04:15 +0000
Date: Thu, 7 Aug 2025 13:03:54 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 84/801] htmldocs: Warning:
 Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a
 file that doesn't exist:
 Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
Message-ID: <202508071332.ErzOmc96-lkp@intel.com>
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
commit: 1db6966b687ceaa06e62fb00cfbee5c48156400a [84/801] dt-bindings: clock: Convert st/st,clkgen-c32 to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071332.ErzOmc96-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071332.ErzOmc96-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arch/arm/keystone/overview.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/keystone/keystone.txt
>> Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
>> Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
>> Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,flexgen.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen.txt
   Warning: Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
