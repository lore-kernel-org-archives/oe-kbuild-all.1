Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EF8249E5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 01:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754184546; cv=none; b=qqO+YX3oaITlhsD0XnPsPAxr7mBsz5xIzo/rl781uWHRFo0njls5Gnq17WkrkjVLyJENq0ivS7Zr5oNTFgxEWmFn+GGGIuZdjAJxnisUtnMXVba7gKySLJOOJef2gpCjKRiKMaGP9i92fmBNOzceW5ZxtGeJWGQVFzkJam+PEnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754184546; c=relaxed/simple;
	bh=xYSauJ4awPAYuNbySfVVT3nsfX61LD4y1au0kbmytUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rl2j64iMKHBbLEoTGmciRXqd/qy1lCllXoplKocituzEhOW7ANYDEy5ZCws5IAjSkmujGsQ/CLX/NDCMcBBXd90+0XKij9aATz7kKDZYZq+mHM66KJ6rz80NvusPQlwhbMnC810qTfVyuPBA1c/wiYEwI1mRYgm+xkw18Y316Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/Xzoonh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/Xzoonh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754184544; x=1785720544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xYSauJ4awPAYuNbySfVVT3nsfX61LD4y1au0kbmytUQ=;
  b=G/XzoonhoCH7mR/aUZWFStyCELbiRc7fdOE94QxYNpAD8Pv71Egv69Am
   /bAb1S4qBpnn1vUsYKm7Gk3rOzziDerzSlfsmsQs9kRhCr+qPingNnlcz
   d2gDg56dWTfWO94BXxea6P6k2tF1RlytiQ+exJ3zKe5/k9qUg9w+qIMqB
   GnoqDSmgTQwnpFm617ZXZt+n90AVX+Fr0VELlNaC8uh/rwfrnUa/1kXHy
   2FpkWnsH4xKdF4oD/R8PwADEEZ+20kK0WbKmCMDYtvT0fsxrLSLm1mMYp
   tpyF/NPVh42Vt+ekyPcpI8jZtTaBzJcB0mv/CWW5PGtsxkvZu6fO1S5Lb
   A==;
X-CSE-ConnectionGUID: Z1uM+cfWTqeMWYaXmOUMwQ==
X-CSE-MsgGUID: Mp0egwRwQNKtD2jkyI/iKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56416325"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56416325"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 18:29:04 -0700
X-CSE-ConnectionGUID: +MsCQQmPS2OdjrD2M7CfXA==
X-CSE-MsgGUID: iBuOnMUdT2iQIQIypV6wfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164254265"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Aug 2025 18:29:03 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiNX2-0005i0-2H;
	Sun, 03 Aug 2025 01:29:00 +0000
Date: Sun, 3 Aug 2025 09:28:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: wifi@0,0 (pci14e4,4425):
 Unevaluated properties are not allowed ('local-mac-address' was unexpected)
Message-ID: <202508031126.Stl3oKXX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   bf0fb8bb181b86adf67dcc60b8269d60814de5a1
commit: 896e0d9337b5d21101a399efe927841753d47f39 [1/1] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
config: arm64-randconfig-051-20250726 (https://download.01.org/0day-ci/archive/20250803/202508031126.Stl3oKXX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508031126.Stl3oKXX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508031126.Stl3oKXX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
