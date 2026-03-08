Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8AA2C0F75
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 12:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772974463; cv=none; b=Dtcy7xDjm8sXvE2sy15PuCVWUhpKY8hXjnUik6uEJRlxfA033ArMmBtUzXIjovU+1Bso8G3ZSHDQ34XWQdVoSX+QhqnAdlC0tlyzurX3m29Mmev1AX06AGMu3Hd+tEanBEP3u7hDKOlMeRhbI4lMBsTOCF/w29O2Cq3HTZXnWvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772974463; c=relaxed/simple;
	bh=W5rLOhGKu4pDFl6LXuijcs+O1t/yX9nl4HX8PjZYlQ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fZ38hx9jJytEz8sBvZHLSFqs32BJEyYlOi2NNqzWX+csH1y5PKIFgxXFGPf90Rrorgp+nq+wecULCkQCHxdzf+F1IaHH8aE/Xp+6jZ61pcTyEch2okRQbGBRik/NUaTF7J91DW/TAQD2HQcmGHWodXICV5CrtVg2wq3N8csqOB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuD/f0eI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuD/f0eI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772974461; x=1804510461;
  h=date:from:to:cc:subject:message-id;
  bh=W5rLOhGKu4pDFl6LXuijcs+O1t/yX9nl4HX8PjZYlQ4=;
  b=BuD/f0eIjAg0fbr2YS9eg7787wGlPe+OhonsM8H8Rt8GYZ9nfcOe+EE/
   4IzRArXgfuLhf8NjU5zJ6wCfERJgcACUZ7/jLzxfMZncv9PAXtSraL2iI
   1YAkc7Kri22m79XLv+HE77yM7M94HzCvr+AeXW//D8m1nyZ7Xp7HjCB6M
   +11Adx3B5KTu9bBmohtD+ORgCFRCHOgm9p7mAfFzKbsPI8Az0BDGkfmcV
   G8UfyRoPbnExl0drO/eHRIDQR4UgXQsYtfsxRoJTp8NYw48AY2D6dBxwc
   f870fhwR0OsqS92WDVda/s9nHh07qOqfA3gf2Sg98kJBuNexqS1fYKuVr
   A==;
X-CSE-ConnectionGUID: U/UQsOtQRCai5trq+QQA3A==
X-CSE-MsgGUID: W5ZS0CYqSWal/h5A55R81Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="76620603"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="76620603"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 05:54:20 -0700
X-CSE-ConnectionGUID: C23Zj5ANQgGGeM7saG/jzQ==
X-CSE-MsgGUID: rXVMRjVUSVmKNeuPvSp3kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="242510129"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2026 05:54:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzDeC-000000002fV-3bXK;
	Sun, 08 Mar 2026 12:54:16 +0000
Date: Sun, 08 Mar 2026 13:53:24 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: switch@0 (nxp,sja1105q):
 Unevaluated properties are not allowed ('clocks' was unexpected)
Message-ID: <202603081348.S527sxrQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   db15f4990be1b8865ae651c9d748d43c91bb9d13
commit: 8d5868f8c1b27e99b35d200b5ed2dfe12586e936 [3/3] dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios property
config: arm-randconfig-2051-20260226 (https://download.01.org/0day-ci/archive/20260308/202603081348.S527sxrQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081348.S527sxrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081348.S527sxrQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: switch@0 (nxp,sja1105q): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/nxp,sja1105.yaml
   arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: mmc@1 (prt,prtt1c-wfm200): $nodename:0: 'mmc@1' does not match '^wifi(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/silabs,wfx.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
