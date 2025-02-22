Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6178C250EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 01:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740189532; cv=none; b=dNDL3pV14fti1Ei3b2D8hpRMx7lw2gMAKLw8tQdT9/dhVpEEHcGuQQCYnX2Vdg+7bebDPLRh/7uRWDakAZto0DYrJd5+T0ydwymzTEyvqB/VY4+wAmLD83iu4so0T29zhIa0JG1zHyIw9OOVK9GRXtHhIdz1fMIdA5UMbWAs+0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740189532; c=relaxed/simple;
	bh=UkJmRTfT9k+Esb+/LRfofIGSJmfpbBEtb1s/r4EJR+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nLWIBrFsOowpDhna9aXRng9stctxOjYG2I5JtpsC2yvNMb4OXAeKYIvQXOn0Oj1RVZn6GhFTbduMSsTGi45IyLnLF0BZukF9CIUv1HYISXuYBwDPFTh2Q940ZkpR9s7/WAHeyIN9Pfib7DsQ/wLJEIv+eTv9E/J5gDVT1nzmn6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9IG4BL2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9IG4BL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740189531; x=1771725531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UkJmRTfT9k+Esb+/LRfofIGSJmfpbBEtb1s/r4EJR+s=;
  b=k9IG4BL27xZUjElId1oUlOW4zZjVYMjK7ytWO12tKHwAfqJggj4MuWcz
   uuZrVfIGdg49Kokzn7Yk2b4sTq//uMRv1K0Pk2aa1dguKnC8zRF1jWZfH
   TMvOoQ9gzLBnRnzjQhWfMLcnsEHUEkc4AsfPxfCIoAJlMWDbhL5atqRGe
   eJ/JaX4pZrI61rGekdMfIPFRDXo6q9YLEJXxLQt11wBm5qGGqRLouoiPF
   Pbt1v7x781muvIHEEJ1l1zK1fqt9AkI9tf1YPcIKJOICAe5MwARE/i/aK
   lQdMswiCllsoLv32NrU1Y4VrOHZSWxQ6xp5GS2aEbhWC5sor145yhgChA
   Q==;
X-CSE-ConnectionGUID: HV/4Ct+2ShCuvUxbSSw4NQ==
X-CSE-MsgGUID: cc4nzkMWR0mwXaPsh9MGlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40938895"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="40938895"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 17:58:50 -0800
X-CSE-ConnectionGUID: KA5Ewm5ISDW9d43fLgUdew==
X-CSE-MsgGUID: NnyQxsNaTPGHIbaZa3oDWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120771693"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Feb 2025 17:58:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlen0-0006Dn-28;
	Sat, 22 Feb 2025 01:58:46 +0000
Date: Sat, 22 Feb 2025 09:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:b4/acpm-debugfs 4/4] exynos-acpm-debugfs.c:undefined
 reference to `__udivdi3'
Message-ID: <202502220939.qg9xqlsG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day b4/acpm-debugfs
head:   bafe7f9a113167725d05a697c67c199f0be52748
commit: bafe7f9a113167725d05a697c67c199f0be52748 [4/4] firmware: samsung: add ACPM debugfs support
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250222/202502220939.qg9xqlsG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502220939.qg9xqlsG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220939.qg9xqlsG-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
   tc358746.c:(.text+0x1bc0): undefined reference to `devm_clk_hw_register'
   sh4-linux-ld: tc358746.c:(.text+0x1bcc): undefined reference to `devm_of_clk_add_hw_provider'
   sh4-linux-ld: tc358746.c:(.text+0x1bd0): undefined reference to `of_clk_hw_simple_get'
   sh4-linux-ld: drivers/firmware/samsung/exynos-acpm-debugfs.o: in function `acpm_log_print_entries':
>> exynos-acpm-debugfs.c:(.text+0x1b4): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
