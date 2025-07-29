Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC68B272E5E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 21:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753826055; cv=none; b=GFzR2GE5FsqgbxLhbbtA0JXJqiy8n9wYWF5uZpQd8WEjqUHj9UkNHD6B/PJtkPLrH9NVig0IAyNHbr6YJjDtYvQlUmoYPxat/nGvonATzIqBZQ/D2D2St0rfc7yEKNqevASwQuwbnhRaalgxp7Yz5igMLg5zBMXBjrivBJ5AE1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753826055; c=relaxed/simple;
	bh=c8biXhqgaF9MWiSzeqbSAuuStwVYUR3+oa9AXbRCxa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RgjOyxBPvSCb6WiP92VpltvOA+VULS9KM9KTA0HSkNWhWiRemdItd4Fl4uPfKIQ4QgKTzKwua9MwLjxEW32dicAQMvKcCJrp+QHG+KFKPCQn51jRI/DGgUF1IOV5c3x0+s6Np1dtEEfLeyZNDekGY7MRBt47btF+Vbq/66Q7eHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxyVbR53; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxyVbR53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753826053; x=1785362053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c8biXhqgaF9MWiSzeqbSAuuStwVYUR3+oa9AXbRCxa4=;
  b=TxyVbR53e5mUbj5U+kTKNBkQ9zV37tQCInnaw7DuvcySCWjnGYL0Y05O
   ZZ7BY4k0PclctOQB3B0lo0A3e+8j+q8QcLhN8USKGYBQHRkaP8o98rk1L
   hQ5/15J7BIL/EWSd45982gz2H565j1vepkUVkzIJEnuHuC1i7YYv5TRfh
   aKRy8JhChzoA6ROZyxGN9x4M+orpYmyktut+r3Vt5bz5FaHn+umBJ5tZO
   viPeeHaCU1JfPm4tuNrQJvCZ6gwM+1R5xbqe+QTPQjzrcVab3dSRdZwRS
   do6wGOqIydfVmsY5tq9cA0sM6HGnR5g4pKy6uIS5+DOYcMqXfKxyQcA63
   g==;
X-CSE-ConnectionGUID: tR+sdsePQrG9bSfzqB9qDA==
X-CSE-MsgGUID: WC9igDRPTuegKVinumhOpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="73705249"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="73705249"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 14:54:13 -0700
X-CSE-ConnectionGUID: 5ZAFnpdEQh6jPVYEGzu7fg==
X-CSE-MsgGUID: 3FRtJ7r+Qk6uhPVhjr7vwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167299953"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Jul 2025 14:54:13 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugsGw-0001j1-04;
	Tue, 29 Jul 2025 21:54:10 +0000
Date: Wed, 30 Jul 2025 05:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: wifi@0,0 (pci14e4,4425):
 Unevaluated properties are not allowed ('local-mac-address' was unexpected)
Message-ID: <202507300830.b77GRY3D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   7f13e3e2368ee8d0ce92a72b3280fbec07c0abdf
commit: 896e0d9337b5d21101a399efe927841753d47f39 [1/1] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
config: arm64-randconfig-051-20250726 (https://download.01.org/0day-ci/archive/20250730/202507300830.b77GRY3D-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300830.b77GRY3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300830.b77GRY3D-lkp@intel.com/

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
