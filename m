Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453167;
	b=l5880jDlfB7MKA6RW8mu+XY0vzI4T5ktjOTAV+ozlFsFcaJEpgTgrOO/r6SYbDliKiYN
	 JpjnlMVF6BrE7HRdyu6hky4jQcmD6ID1frnqhtxwZCvCgKHWEXJc2R4E9l/zT9EMRbvbU
	 CykLgAk+Gf7PE/MuO0tYfhM0R23ZVMtNPT2alqw7mb0xEQFsQiANzzdiYgVMheoiGZ6Kl
	 mnK32pp6SzZ2So2vt1wS1EvPALwaC/cXo6mRB3MjlQo1Cix++zD6ndlJWps0TYS2byPZ/
	 duOhtY3gNdNznkSzxe8Hl4Jp72MAkDCfIrOjhWnBjoZ3IUaHaOZrFafX+mPqMfkTD1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453167;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CWdtdmUDsu4jYsl/PGZciSVG8Aw09KFBay3bK4ulJxo=;
	b=IepLCAzVRlICqaJC0bdJfutFB4B2OxGz3eL3jOqNMShEQApoHgc56PYZ6Qx6iLwn2EpU
	 8qv22AOtwKlvMw5aX/mPYylfQ8c5rkf0nhokazTNrua+1cZXlib7nvCas4orO8bEF6AJo
	 giF5Geum7CFZWnFwRxkO67oNUjjzrUn4IV4Vp6y2d497WBFYQx75Ay82RDYcAWFcvsM3R
	 LPdVGGRIMQoTK0T8wwFImGr4FfrcoYzEjNzF4kyuP62okKZJUx+thlHl/uSGt97PM0NW1
	 9479HhQ3+zzdgKlSlyOUFp8YwCWq5XXlTMMwAGSrTfjsou9fnTi6fC5Nyek4SUfKGuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UVXZvPI+;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E7606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 16:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 117E7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UVXZvPI+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795453167; x=1826989167;
  h=date:from:to:cc:subject:message-id;
  bh=5tlnE/ZzG2nb+1RoUCDSppYhrUfJPqCd6/nCMUmWVg4=;
  b=UVXZvPI+AvqcfmWi/14BtMahPJef+QkzjJ7KFUfVbpMjd1947rPsDRvf
   abgtzwV8VcqkDocnl+MZvzlUHvcho39MyX42i1W96EAtwRs5aKlAEZfa5
   Xol9ZrAAIQPp04NmcU8dIQX+J3h3DVW30A5kjE74vFnpoTN5XXvv3wSNK
   Z5s/zn5fsi4irCMy/NvbnKyJjZPae+hZrZ3dSEfzBS3h3cSjVbOfVykrk
   MmjDEnOeMGr8TR8Tl+Fbb7qom/dWYzFE3umaQbSwlw2a1IZ5I+b5LLzvx
   DxdqdhbORUfBU3v2sGNB+7F3K35DDHYS7DQHe1cA6cWAZduN8HyeClQnc
   Q==;
X-CSE-ConnectionGUID: 8HqdR5pzR2OFdYZLaEAqbA==
X-CSE-MsgGUID: ywU8qT0cS++u5xPhzHOd+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4165794"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4165794"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 08:59:27 -0800
X-CSE-ConnectionGUID: OsGbsMPyQq+Y4Qyf86y1Lg==
X-CSE-MsgGUID: 4F7H+3ERQUS1Nlq4EOTL0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="13335231"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 23 Nov 2026 08:59:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVXNq-000000004sJ-3gFB;
	Mon, 23 Nov 2026 16:59:14 +0000
Date: Mon, 23 Nov 2026 17:58:47 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 318/318]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000
 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71,
 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4],
 [0, 85, 4], [0, 140, 4]] is ...
Message-ID: <20261123174810.IQwAncUB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   17b8bfe5ce7568445def263dc609f839f3b469f6
commit: c83255f3cf22d13c5b9736668cbe38a098fd6d5a [318/318] arm64: dts: allwinner: a523: Add missing GPIO interrupt
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261123/20261123174810.IQwAncUB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/20261123174810.IQwAncUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261123174810.IQwAncUB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-735.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-735.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-735.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-735.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
