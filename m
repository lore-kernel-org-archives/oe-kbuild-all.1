Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8D81714C0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 02:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733452177; cv=none; b=ngQMTUm+juz0mdvlct/Ck7nh1Lo0sv3f9bijxdRIs8J7hFSLe6ghFWaTc1kq1wvjFtPNXGDia/10BxrUaC5F9YeWO0BSJfYQcnZcLftsavEkpmnWXo90yTkOrvhB3HOpsNBLWzVLShznIS2K1tgCeW0qREZMHr+hTDUhOm5acEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733452177; c=relaxed/simple;
	bh=UWYkmQgJqsODlM0e3u/6lpT+QT8jC6RKy54hcLbglIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDtgZOEWvLnMbmIjlAh11/kkBXRMzjvP4KDjVfI8wBDswav+pVmhnhm+70aHLPLvP+3IR4ptdY5tiE43eoswAhOxhgvoVNapM0SaQuDQnZjUkk8RuWSryi79JqrCXxSzYCDElRFXeVXFdiIXt++ktmuqxWZmLpj9lmlFCOq3EzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIL9QXuV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIL9QXuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733452175; x=1764988175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UWYkmQgJqsODlM0e3u/6lpT+QT8jC6RKy54hcLbglIU=;
  b=LIL9QXuV+GNjwHTQrUabY7xAZB9fqlP6czkc9zZjAhrmfAxkgA3TAnBq
   MeNyjckJKWTKHxzt3CLSjJng1LKIV7E14WEfIex6LzCtr4E0zGwi534Bh
   A5pifKZRvHGT4sGXuLQfzOnpGohsFCFbDejq2q0/nHfu6LzK5iMhh7TkD
   64AFD0c3IEaWO/wPHXj2811MJ1vX6pgM0rtafxqleXm1HWknEGVgMr/zd
   NoNI2iBygJlajyJdL4MRE+VQsy8u8nbOm/Y5TXaMTaWgz7F21b2e8xgP+
   tQhl9LSZRea2pw+KYfK7ggCy6L1V/micAW41HipyJMzoxGjtbeJS4UDbJ
   g==;
X-CSE-ConnectionGUID: r7sjqfUsQJWR0fAVlRQnow==
X-CSE-MsgGUID: bQYeT+g/Q1u4Oa7UR+XWRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33943016"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="33943016"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 18:29:35 -0800
X-CSE-ConnectionGUID: lwXnpxdgQ6yYKcNCD6eNMA==
X-CSE-MsgGUID: znHyy5KWTeu/Yt7uR8mtgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94749549"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2024 18:29:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJO5x-0000cl-24;
	Fri, 06 Dec 2024 02:29:29 +0000
Date: Fri, 6 Dec 2024 10:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] clk: samsung: Introduce Exynos990 clock
 controller driver
Message-ID: <202412061048.3gu75pLi-lkp@intel.com>
References: <20241205193423.783815-4-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205193423.783815-4-igor.belwon@mentallysanemainliners.org>

Hi Igor,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on krzk-dt/for-next clk/clk-next linus/master v6.13-rc1 next-20241205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Igor-Belwon/clk-samsung-clk-pll-Add-support-for-pll_-0717x-0718x-0732x/20241206-043559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241205193423.783815-4-igor.belwon%40mentallysanemainliners.org
patch subject: [PATCH v1 3/3] clk: samsung: Introduce Exynos990 clock controller driver
config: arc-randconfig-001-20241206 (https://download.01.org/0day-ci/archive/20241206/202412061048.3gu75pLi-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061048.3gu75pLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061048.3gu75pLi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/samsung/clk-exynos990.c:13:10: fatal error: dt-bindings/clock/exynos990.h: No such file or directory
      13 | #include <dt-bindings/clock/exynos990.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/clk/samsung/clk-exynos990.c

    12	
  > 13	#include <dt-bindings/clock/exynos990.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
