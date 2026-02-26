Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E0320CCC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 20:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772137940; cv=none; b=OrTEvXxVE8QH+fdappX2W765Ucd8Pr6HSBqgVctAK0wOe3hR/EWZpYvIFcBHA80IbpdN1flY0pJiNQpg5FD9cEz3Oe+pjoGKAhI14748eLr2gwVMlDQmJYXwTZsEUhZ88mgzl+q+/gaANjPbnZa9hy1gfTFw84q65GeQjia0AxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772137940; c=relaxed/simple;
	bh=lhgF61s3JOl4ND/diLnJEp9J6GOSNIgdCCq7M9INvvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fdxm/1muMwpMZ+yLgh4gWU2gIExD9FVU46oOkMfQ+5Fa6mgQa8B8sDxbHq2OK4REXNmi8u7svEcQ2AlFB9ARo/5OoGVK4tfTgzmLBwK0LRQ8xlvQRP/KhQaDOZE0m+k7VS1SzzR+qKw1NoqJhHUt10wHxwLYyFemSZ0km4v3frg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9JRvd46; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9JRvd46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772137939; x=1803673939;
  h=date:from:to:cc:subject:message-id;
  bh=lhgF61s3JOl4ND/diLnJEp9J6GOSNIgdCCq7M9INvvo=;
  b=F9JRvd46Lw5HQzgq0rrZtdRLUco0uEbT0jkjwv5fBQcmi8refoqQ7zpn
   ZyEdCBEmzScuK9VHgt5R1eTK4CWX6EgarHhUFSzZFmMlw0A3pkZ8LTIU+
   ToqPcoeCqX5Z2OOEcfw+5yoOO2QtVFqzrFzZW+w5r9EwlvPh3RqWH9BAk
   nsPqbuhZ+DMnq4MCuOl6VJmoHK3900EgYUIZbYJGrcjSm1sRcuRQT3LMb
   MRc79rxAvsaag/fz4iJ/ctzUa5EvFmmy+AlKJmcfoQrl0Nv7E0TUi2dNt
   pcGLWB87ul5G6+aZ+dzq1S2UcsfsiEFVqwQiqnZsCjyg6lY/yIW9r0YW8
   Q==;
X-CSE-ConnectionGUID: AqeBywd6RN+hpq8xGX3H/w==
X-CSE-MsgGUID: TeG/djG+R4uoNaG03Z3Igw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73121750"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73121750"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 12:32:19 -0800
X-CSE-ConnectionGUID: aQk4BEBrTw+dfmDtmDi1Ag==
X-CSE-MsgGUID: RQx1QgcPTAmblDs19MnlKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="221303688"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Feb 2026 12:32:17 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvi1v-000000000J3-19Fu;
	Thu, 26 Feb 2026 20:32:15 +0000
Date: Thu, 26 Feb 2026 21:32:06 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 205/205] htmldocs:
 Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file
 that doesn't exist: Documentation/devicetree/bindings/usb/generic.txt
Message-ID: <202602262102.XATXC1BN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35f57154fdf571b6197d177d629776af701f38a7
commit: 69b4e18f0e797b82a8da317a8ba9b0a096c63a96 [205/205] UPSTREAM: dt-bindings: usb: Convert generic USB properties to DT schemas
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260226/202602262102.XATXC1BN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602262102.XATXC1BN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
>> Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/generic.txt
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
--
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
>> Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/generic.txt
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
