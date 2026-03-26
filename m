Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2A42E11BC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 01:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774487632; cv=none; b=Ufagzgemgpx5uJ3+c2YXDcTS46lS19OTO/0s1KOpHC29bi9JBlZb2ssQ+jyrniRc9eBu11x9gPM6bFOXDORLFNZPwmp94bcIDruFshziJUH3mvhpIphFVPXsZ3WRK0OSb/EQkMS22LqfzdoZDcJE15+MNOttjXdcvPKd4RdNilI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774487632; c=relaxed/simple;
	bh=WrTomaZhr0QTSZB75UhCgQOjOCQbqfp7j1U08ruxMWQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LSOEL1KRjQWEH2Oc+FnfueINuCWuCLCOMEwKdtLGV848y7HW8ljwJy0W4ejYzpgfyGQ66hHfdJk6bF6+HrCx4B3NLrLbBU/Zxqx9GYiUQjQ+o+j8GWHWnNar2hihrAzh+6MKvKbFE2ad0TDMPIR0MGK4Tl2U4pYTuEj9mtfdMco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcOlWd9F; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcOlWd9F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774487631; x=1806023631;
  h=date:from:to:cc:subject:message-id;
  bh=WrTomaZhr0QTSZB75UhCgQOjOCQbqfp7j1U08ruxMWQ=;
  b=hcOlWd9FO51XOtSBmPbZXj61jANtMS4OhJF66XiHt9E4Rpu48DNBbyuY
   fvAs49+TwAOTifVDLzkp0L4S3v/EHuhf4ed9rpFJqRGMF+fkGXQljV7q9
   /JpADbcMTf18k975iW8kcTKW8GnD3ku1ssrhhUJArHS21YVqUcMtmOHxq
   qppCzqwz01CDii/R+T62s2uyAi9sDt8aqAswcUbU1kgnBP/1JsefkCheD
   0AKVxvCsb4JoVsNp+gsLHLhbA0rHyPZ9TKPzysUANeziaRJ/gyA9NxJl6
   Cx5nNuyBVVnUjb+/qmKcA2EMYzonNAg6vvRw3BsgRaQF8Ln6YSqHqyaBz
   g==;
X-CSE-ConnectionGUID: JkaJaALaQXqngh5p65SyQA==
X-CSE-MsgGUID: k+CxBxjDTHC+aKqU/ASvFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75440811"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75440811"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 18:13:50 -0700
X-CSE-ConnectionGUID: t/z8cD4iShC9SLjzNWu5Qg==
X-CSE-MsgGUID: 2bXIfg28Spy71P5W+f0d6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="229624695"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Mar 2026 18:13:48 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5ZIA-000000007x9-0OaY;
	Thu, 26 Mar 2026 01:13:46 +0000
Date: Thu, 26 Mar 2026 09:13:34 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: tc358746.c:(.text.tc358746_probe+0x472): undefined reference
 to `devm_clk_hw_register'
Message-ID: <202603260904.0mYHPZwr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2a43e7f89da55d6f0f96aaadaa243f35557291e
commit: 4fbdd56edf1f0b3e338c90a011bbae1a677ac884 m68k: Enable dead code elimination
date:   9 months ago
config: m68k-randconfig-r051-20260326 (https://download.01.org/0day-ci/archive/20260326/202603260904.0mYHPZwr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260904.0mYHPZwr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260904.0mYHPZwr-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
>> tc358746.c:(.text.tc358746_probe+0x472): undefined reference to `devm_clk_hw_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
