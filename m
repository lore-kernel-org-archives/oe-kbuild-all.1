Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFB820C00C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 08:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773476965; cv=none; b=KTKj7MHVAV4DrtJdQxNVjpsAkav96IhSWqCThCVI1tBirkONZkzta9oN4O++Oj3pIhc5YDCkE+GdrPrpwwwZYIWKNoNat8RM3fF8WRSIDcmthKbXTjT8T159+39/RY+B0ddhoP+jrLwE+lGJoazyquZVH8m+3Dk1xmbVZH2C0Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773476965; c=relaxed/simple;
	bh=kDfNyIe8sTRW0rye3IPISyOjP8f7gS2XEbOpczn/Wq8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lXaHDgObK2tUVodQQBq2dSfH19JXsVs2R1+ReaZl53yXOkk9l2tZVDn+VidqPiZvt6rxUIyLUw0z76shnI6yQCG84yDpWTXSHFH8ht8mkXiGXNVjI1BRFo3cHr4/7yaOUsGfpxuD6Q01aE7oikQJX4OkNmL6Hx/X59Twq7s2R28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYuSNjqC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYuSNjqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773476962; x=1805012962;
  h=date:from:to:cc:subject:message-id;
  bh=kDfNyIe8sTRW0rye3IPISyOjP8f7gS2XEbOpczn/Wq8=;
  b=XYuSNjqClsyX5uETuJz7K0sQkVpf9jPk4j6Nh/R0AJdC5VPqwrdIFhPY
   O/Vp5QUlKd9U7XesbPER1afh3ZuKOOFv1qU+ObZsUc+cwEOEVhxKuDNL2
   iATNk6JmQkfVBCtX8f54fwbykNWrhsRgj+m6du7L+KKf/6XHaGl5Nrosf
   16z3DivJS5tD91vYGweVVClf+BLXon6AACXM3A90rWSQfI3cUuv1PjkUl
   K0xTH4Jn1YEx6p9VRsuik7G9aIxV+fQXhlRB6Ym6tt9QRFodOI8jX9Xf+
   TyFRxJCKYQWZbeQvXZsv7xzl6BhyGybNw4Hv19ZXzpQrrpbMyBxHZcUOT
   g==;
X-CSE-ConnectionGUID: Ukhz4BvbQHKv0QGLCPhHOQ==
X-CSE-MsgGUID: zIg5aufjQ7uaZmfvNpnINQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="78174569"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="78174569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 01:29:22 -0700
X-CSE-ConnectionGUID: 7Ve6hhfVRXOY+hlzVhKJ2g==
X-CSE-MsgGUID: dsDQWKtvSDe/PbMYnJ6S4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="259287923"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 14 Mar 2026 01:29:21 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1KN3-000000003lt-3Qtb;
	Sat, 14 Mar 2026 08:29:17 +0000
Date: Sat, 14 Mar 2026 09:28:33 +0100
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@nabladev.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [linux-next:master 5510/6488]
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb:
 adc@48004000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
Message-ID: <202603140931.t5jOmJ5p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b84a0ebe421ca56995ff78b66307667b62b3a900
commit: 3284bf3118242b0918dfb2908462296f50298e89 [5510/6488] ARM: dts: stm32: Add DT overlays for DH STM32MP13xx/STM32MP15xx DHSOM
config: arm-randconfig-2051-20260313 (https://download.01.org/0day-ci/archive/20260314/202603140931.t5jOmJ5p-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603140931.t5jOmJ5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603140931.t5jOmJ5p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: adc@48004000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
   arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: adc@48003000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
