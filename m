Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C6127E07E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 23:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756338234; cv=none; b=A/6kUv76xJZdXIFz3nk53ZMkxxZTElebJCpSn8bg2b7yxoOkiXq4cAgpxfKxV1EX3OY3lfFxtV4SW5GBvdcwUH2Sv6AeEuLqGxoBpIArQfMBO+PsH/flBkMvQOMsF0ajtJGgWAa5e1LkGBQR9PnCTwF7GP5KSHddyWL7vsTnWxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756338234; c=relaxed/simple;
	bh=msPL81xmidb4QIXYZv6wEQkZnpQ5sxSTTGprY6CZL54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N60mU6YD8kcIwba49d3gfy6fuhrhmO/P6wL9dtnM3z9ORcxKWuFvCeHkfvglzhvllTCqabA600imoULHk8dgw+FYPnuKwwvrkDRUgZPdFryOu5o2b3W4jLWLN63RterM5enyAKCHPhCJlV/8uJcBdoGuoWvzXlfWdslU0AHbs9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OvQk7g6c; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvQk7g6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756338233; x=1787874233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=msPL81xmidb4QIXYZv6wEQkZnpQ5sxSTTGprY6CZL54=;
  b=OvQk7g6cYYJHCc3TIYPjSxuOEJHDg6KMBjm8R2hsMWKwjdGWgC/HQrX8
   zHwAtlBOqmjA6qbjT/eVA9ihoYT4jbCsmG+l8LdnnMOMBbaq/vIixVuw7
   RwcMGnCoD7ptrK0soNeBVchRCIySFuQC3BhQ7E8PAu4ymhWbIK2tnJOhc
   6dwIhRLPb1IA+c4GwFWnyYoTqj285W1yWn7UpwDTWWqbEQB3F0usCMc0i
   i30oAycIATpTLRpEH15BUdmsX+Lqb/zXoRXXJgktEMZMReZ3H30Cjb5V1
   Vl++44F6llPJRXKvWPAn7Zhc8RyGFQyDAlLK/eDREbv8fh+6dsJjb5LLP
   A==;
X-CSE-ConnectionGUID: IWV53rZHSxWUy0g/VQPSfw==
X-CSE-MsgGUID: je7VzkGRT56maK8CxtBWOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58531223"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58531223"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 16:43:53 -0700
X-CSE-ConnectionGUID: H4tWyHlIR6CIUjBJ2Q2IFw==
X-CSE-MsgGUID: d1bWpQM4QkWk7hKc+pY6pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170128406"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Aug 2025 16:43:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urPnw-000THT-2d;
	Wed, 27 Aug 2025 23:43:48 +0000
Date: Thu, 28 Aug 2025 07:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:b4/acpm-clk 4/9] ERROR: modpost: "devm_acpm_get_by_node"
 [drivers/clk/samsung/clk-acpm.ko] undefined!
Message-ID: <202508280739.MSDOrdpm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day b4/acpm-clk
head:   54b8c4711e48b082a23db6b846fe75ac1f6a2ff2
commit: e3cef74bafee12cd81e57ea4c4006435cc2031f8 [4/9] clk: samsung: add Exynos ACPM clock driver
config: nios2-randconfig-r111-20250828 (https://download.01.org/0day-ci/archive/20250828/202508280739.MSDOrdpm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250828/202508280739.MSDOrdpm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280739.MSDOrdpm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
