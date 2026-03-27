Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B7F23D2AB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 04:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774584530; cv=none; b=m+nkmfwJp8GjYfq0GfLyBBTiT/KmV7h8XQgtpkaJRLkq7yb6O63zpg+dom4I0I2Tyre6BwzYpv0uISEbp8KErqysVnRVypWBE6IDPOvHyREABFcUdOkMnRS8SDUBkZJN15WHFujtXcKdmocIkUtnS1VPBIiiD5nL0TcOrMXE6jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774584530; c=relaxed/simple;
	bh=5OE12eXjQL7qATmDS8N+Rda04UufUGc4IKzKHXhUjWk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O9ikCJ3ULXQaYh50Haz+sAFpe9yuNtdpdM1J8B1acR5dDVCYy6e66UhrMnh4WFEQ+9kzrUop7y46K238IMm3VhSRsCQNvo5aVV9uBWeHcvi7P/5Lj50JOTYC5VFrg8DOisgiEA0A0sy8LyQCPV9XZ58r2zMluxvFjUsRMRX7D7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXXYTimw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXXYTimw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774584528; x=1806120528;
  h=date:from:to:cc:subject:message-id;
  bh=5OE12eXjQL7qATmDS8N+Rda04UufUGc4IKzKHXhUjWk=;
  b=nXXYTimw2uspLa8e1HLlC/m2DOkLukO21hz4NDWvSBekTYkrCHcp5qIX
   f7NyurZsAhuNav8DQfNKMtL1l2ibk3rg9iXSYdeYWeFyHyuOO2ahYFnPS
   P03NWuCe0DkpHNCIiFV7kx1zLZl9rUZojlJBzxAyled05NotPZb4qb/b5
   +JhpEe2xCVE76qzcpdImopebjlEGvS2CioEqxl+pChX5Rd2UU9tJghau7
   O1GIActovEFAxhexiI0aELfitCy/ZhwNGOXb13oBtQGaOGplCcHLfOTrX
   WWM+Ty/VSxQtlgrafpthGqdoK1bfFnG/0Q4R0qfZe8CCEViA8Y+/33XCN
   g==;
X-CSE-ConnectionGUID: LAqkr8DrQPa/pJoox2gjFg==
X-CSE-MsgGUID: OLZgsk+IThq51zAAndbHBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="78250843"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="78250843"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 21:08:47 -0700
X-CSE-ConnectionGUID: BafgOrwYTlOgt19el9OsNg==
X-CSE-MsgGUID: PzFtFAZ3TBSOdR38aiXT4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="224393924"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Mar 2026 21:08:46 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5yV1-000000009l7-25Mh;
	Fri, 27 Mar 2026 04:08:43 +0000
Date: Fri, 27 Mar 2026 12:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 0/1]
 sound/soc/codecs/cs42l43.c:2446:9: sparse: sparse: Initializer entry defined
 twice
Message-ID: <202603271124.rWlgmKeJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   7db1e563d6f73706150a812a21f13e5fbc14efde
commit: 91e698058e91dcaef669afae07e2f23fee6bce9a [0/1] ASoC: cs42l43: Add codec force suspend/resume ops
config: x86_64-randconfig-121-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271124.rWlgmKeJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271124.rWlgmKeJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271124.rWlgmKeJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/cs42l43.c:2446:9: sparse: sparse: Initializer entry defined twice
   sound/soc/codecs/cs42l43.c:2449:9: sparse:   also defined here

vim +2446 sound/soc/codecs/cs42l43.c

64353af49fecbde Charles Keepax 2024-02-06  2444  
64353af49fecbde Charles Keepax 2024-02-06  2445  static const struct dev_pm_ops cs42l43_codec_pm_ops = {
64353af49fecbde Charles Keepax 2024-02-06 @2446  	SYSTEM_SLEEP_PM_OPS(cs42l43_codec_suspend, cs42l43_codec_resume)
64353af49fecbde Charles Keepax 2024-02-06  2447  	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs42l43_codec_suspend_noirq, cs42l43_codec_resume_noirq)
64353af49fecbde Charles Keepax 2024-02-06  2448  	RUNTIME_PM_OPS(NULL, cs42l43_codec_runtime_resume, NULL)
91e698058e91dca Maciej Strozek 2025-01-09  2449  	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
64353af49fecbde Charles Keepax 2024-02-06  2450  };
fc918cbe874eee0 Charles Keepax 2023-08-04  2451  

:::::: The code at line 2446 was first introduced by commit
:::::: 64353af49fecbdec1de9aadf2369d54fc00f1899 ASoC: cs42l43: Add system suspend ops to disable IRQ

:::::: TO: Charles Keepax <ckeepax@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
