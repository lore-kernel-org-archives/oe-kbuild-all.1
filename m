Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C9E1898F8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 04:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743653296; cv=none; b=WgY67cReAz9qRE7DEm9shqY/T24L3eHDHARtQAKgSpPMYcGgP6qzLnyW6LDzBelKfRHHxDWn1fjFzydBpLaNWu0e+T8OXV8ZXHmyKecGmZ2gDgnoE0FtDBfKiGCPOZ6lPPJouj5UbOpPYHaDYfmJyVxhtBuJzfyLhsScTdIlCp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743653296; c=relaxed/simple;
	bh=hLuRgBQuZH50GpSgwRZPwguDK9aXlGUqi1ievDqyld8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oy9aKIWjN3sb2ShZGuMUbNxw2CQYksQosePTZEtZHK2sAqwPFDtWZ1fGKSrHF6RUey6sd6T9UBwif9sl5U+PFgm2kPEs/7vI0fD4Q7gJIv2oxnP0wxQPvmakyyA05LQS5PmR7GiOTdD9DCQx97xDEMzhafOTxprk0Wan0VmwCKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TgVjAVuO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgVjAVuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743653295; x=1775189295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLuRgBQuZH50GpSgwRZPwguDK9aXlGUqi1ievDqyld8=;
  b=TgVjAVuOi8ovUxRPkPuhsMuRzr9DgBR+Eds7uii9aVlh7cidGacm19jj
   Q4q8hTfUilX4WcBq+RJX1xluq9dOSj3FgqZaf8gbNBVeJ9UUXe1ZGpxs3
   WTK+JHVdpHBjhYesPIDYAcl4k1mvDiQ9U5W1/OViXFeQsHwA3CFxyQcGZ
   FUAMyGr6lZh6YydOufwOUCUUZ47DhuLXgAm8VEs6Atbgb3BrkA0Uf4HFk
   1KBlZYzX0wHOBbGxAkQ5WFjoyGANnnciJrcvMg9iksnHiRMBjEx2DKCcp
   XFL+tb+LBmFncwpg0kqeYsj4tHzGlSfrZqYkQckaZtnLvHHl42EQu05oe
   w==;
X-CSE-ConnectionGUID: ftAlFePBStGgBUEhvftd1A==
X-CSE-MsgGUID: c3Ld4uvfTuKWQVidTKwVbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45218451"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="45218451"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 21:08:14 -0700
X-CSE-ConnectionGUID: MH5N8eQSSXmHiNJRDKbOlA==
X-CSE-MsgGUID: FXl136SARDG5inKp6pyTvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131598946"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Apr 2025 21:08:14 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0BsB-000047-1I;
	Thu, 03 Apr 2025 04:08:11 +0000
Date: Thu, 3 Apr 2025 12:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 0/21]
 drivers/net/phy/aquantia/aquantia.o: warning: objtool:
 aqr_phy_led_polarity_set+0x11b: sibling call from callable instruction with
 modified stack frame
Message-ID: <202504031156.ApGBbL4Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   f01c4e3d8f4594046922ffb4b9cb1e39eab26552
commit: 9d55e68b19f222e6334ef4021c5527998f5ab537 [0/21] net: phy: aquantia: correctly describe LED polarity override
config: x86_64-buildonly-randconfig-002-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031156.ApGBbL4Z-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031156.ApGBbL4Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031156.ApGBbL4Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/aquantia/aquantia.o: warning: objtool: aqr_phy_led_polarity_set+0x11b: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
