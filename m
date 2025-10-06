Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847791D61A3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Oct 2025 19:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759777655; cv=none; b=eDoctBOrK86RbU7kDx1dwWBjzGdyFiv2joEhfVpNfV4FjjIXgfrI8mvrDLBMcNcSCqocPTvZnk5N3hnj7BndFRD1COoSkqs/Ji03GpTHGTZi3PR9j3TbvCR/K5Gbk4EBhUp+nXQXb9QB0CycPpN4Zzf4h1lX/lpIOnZRn3b8+tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759777655; c=relaxed/simple;
	bh=5WR8ZRy5ict2zVu7uyyenGpgrH/6XqUEhOueOBUdMtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FCxyWuXzIljOBBor6UQm9A0BWkoxOuUH1EMJBsrIgX48dBWz3YkpruYDF0aAr9H8pE5s8tjY5qDMiv2OQX8CzaKYSlQHW1T2r/NUrkOVi6q9X5mcL6PsjbylWP7gqGdpsVZzD8UpEjHwBm2o2f1Xy+9aZfzjYvCHOZP8XAr8OqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8wQjRSZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8wQjRSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759777654; x=1791313654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5WR8ZRy5ict2zVu7uyyenGpgrH/6XqUEhOueOBUdMtI=;
  b=b8wQjRSZ9BgAhwxR8Z2LPHqyps8f0kSThhqzUOx3NLNCWID6KdgQTgjz
   lPxFd2kPhhZ92s3IIZCDNIcfK47Opxs7xYY5q0uRM65+8MA+mg0o9r6Nb
   04dkarDIaIIoJg8K7KTQu9md0qcxOrlxuzNKr1SqAZmYoPGN4JSj/IQRO
   RM0tSnXy8j5j8+jjmYME/9YG6fabBh10kFV54IB2LNpGo+4ROfIOpLRs3
   olcioEfItRPCUyD3exlPnvcR0Cky18F1LC1EgBEV/n6WuPwvnbdszu6Bf
   bDtNxstb4ajsPi8f1SvE6jakyu452InAX3jfHVLRCyYBQk+++xcU3buRd
   A==;
X-CSE-ConnectionGUID: o70NeZFDS2KKntwAHO1cTA==
X-CSE-MsgGUID: 1MWSrZ0qQvi645Q/kknsKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="87423329"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; 
   d="scan'208";a="87423329"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2025 12:07:33 -0700
X-CSE-ConnectionGUID: FWfdMei0QkWN7gw+jalpOg==
X-CSE-MsgGUID: hIb/2xnFS9S1AmO8lc5XsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; 
   d="scan'208";a="210927130"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 06 Oct 2025 12:07:31 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v5qYT-000000007oT-44GT;
	Mon, 06 Oct 2025 19:07:29 +0000
Date: Mon, 6 Oct 2025 21:06:37 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 159/159]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to
 match any schema with compatible: ['google,anakin-sku1',
 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8',
 'google,anakin-sku256', 'google,anakin-sku257', 'google,...
Message-ID: <202510062117.SG37Ypd3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   e0ef1daced4a5641517cb9946b304901f2dbe124
commit: 71a95bf6a74088803e70511466fde6cf60d8eefd [159/159] CHROMIUM: arm64: dts: mt8189-skywalker-anakin: Change skuid for none touch skuid
config: arm64-randconfig-2051-20251006 (https://download.01.org/0day-ci/archive/20251006/202510062117.SG37Ypd3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251006/202510062117.SG37Ypd3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510062117.SG37Ypd3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou' was expected
   	'google,chinchou-sku17' was expected
   	'google,elm-rev3' was expected
   	'google,chinchou-sku20' was expected
   	'google,elm' was expected
   	'google,chinchou-sku22' was expected
   	'google,chinchou-sku23' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: scmi (arm,scmi): 'protocol@80' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /wl-info@c2bf090: failed to match any schema with compatible: ['mediatek,wl-info']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: soc (simple-bus): opp-table-gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: soc (simple-bus): mminfra: 'ranges' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
