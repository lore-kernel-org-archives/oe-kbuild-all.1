Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD7C3DB64B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054894; cv=none; b=n+fNXNQOYV523p78g7zNbDdZ6UQ9TeZZfPyolxnFIN45ML2m6sbzAPRqgHdAhVyO3NZoQQ6QuCfuc9xaTBTkhp3krO6ADY7RHzO+uJvBsNNnw94LW4EUnjWA4ro7SrSmxD7moxptfoZKVEsKAHhL4QhPazR5vASKzeIf0hda+so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054894; c=relaxed/simple;
	bh=KQiigq1kQHyBjaWce+/AWRAdyuG4idZcmwwC+2SlltU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WQ1WbqAFWiNGcoHqmjnnFyM0g5gBjAFqyV0JtoJ40b/w/cLlfwvftPDr3Y69Pipk0aOjSTxy5lavkKpCQA3QRkoDOO6gFpuES3s670xyaLlAgFymjysqFkXkFbs8gLE+oLtaw/Jlkpw8lavaNohVMIL4OhqTeyW48f2biekJB1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alspIzFO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alspIzFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054893; x=1820590893;
  h=date:from:to:cc:subject:message-id;
  bh=KQiigq1kQHyBjaWce+/AWRAdyuG4idZcmwwC+2SlltU=;
  b=alspIzFOzLW+DxRbcoUJ3kAJnnf4QglT+KBzZjHSJu/Q93HO8da+O4cg
   LMzryPJIwoy/txTSCQgbxQO5iVoWJthtTvoDOm11QoGaV/MwWAD9zDfVl
   Sx66C0BXT3CTHt3jJeVDRm7QJKl/3+3OzUiQ8sQUHEJkBnRgw3m9BIfTJ
   ycHRHYeKLzpA0PTd8v6d3yQioTYSav3q7w3tui7ZTS45cy6a+gR4nNT4F
   zgUKthx7ee4vBTErZYCdHYpdNOhyLzdgTPiKUwcnXVR91siTHNkXIrHtP
   N48reqpoUn+ZqCUPAzruHtudv4MIEnMQBNdxFfuET81D2BSF30I5AQvUW
   A==;
X-CSE-ConnectionGUID: N3xo+KB1TaCtLgSQHe9njQ==
X-CSE-MsgGUID: 3hls5oQfQpGXQRCXQVNlbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77066948"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77066948"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:41:32 -0700
X-CSE-ConnectionGUID: eqkpooLrSqKD24pEarWoiQ==
X-CSE-MsgGUID: 1HJ5FTn5TViNbnyQffAQFQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2026 08:41:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gu1-000000000QV-0WOm;
	Thu, 10 Sep 2026 15:41:29 +0000
Date: Thu, 10 Sep 2026 17:41:02 +0200
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ERROR: Input tree has errors, aborting (use -f to force
 output)
Message-ID: <202609100856.nTemoA1n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sven-Peter/dt-bindings-usb-Add-thunderbolt-switch-property/20260830-221919
head:   d2efccf42786109114a402970cf92e86f5d4002b
commit: 36b2cc258a588eb0f9d7c5bdf487eb213ed482cb arm64: dts: apple: t8103: Add USB4 ACIO and NHI
date:   10 days ago
config: arm64-randconfig-2055-20260907 (https://download.01.org/0day-ci/archive/20260910/202609100856.nTemoA1n-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project b1f20dd48e11439d5a592662b407e07d8213ffee)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100856.nTemoA1n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100856.nTemoA1n-lkp@intel.com/

All errors (new ones prefixed by >>):

   also defined at arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:241.14-260.3
>> ERROR: Input tree has errors, aborting (use -f to force output)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
