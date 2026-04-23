Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E0D31282F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Apr 2026 04:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776918408; cv=none; b=FY27PcHfS9gk5Dpu5XIpEknNsG8YN+T9+Gpqzf8nJA7dzMIfxQQa9DOFWAwY8075gSzrDpqwnOUpkzhnRJ6kQyusSDqVAw2CjyYwT1uzr1LuRfQWfclEPt4Fyv6MHsSu+P3UbGiUe5xBanJS33dws77UmPo9OSaNwDSywsdVuHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776918408; c=relaxed/simple;
	bh=8RMDTfh8QVmdribdaIbbnt4LM7jd03zpGTMnjbQiFAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ja7mApjh2+YaZDz+9JZfbdWoeG8YNggQFJVitnaHoZ6NEaspNL1gUF1ruh4W2DlF/oc0slj3Up0Pj0ZFoT5nRf/2EGITUTjvwWMl8XMshBhs9c9k7r1oduFM4R7JsMDM+kQZLqDC/D6TNGsLgcNJ2BrPc/xr7MSyPiQurFZY8L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZBVLs9n; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZBVLs9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776918407; x=1808454407;
  h=date:from:to:cc:subject:message-id;
  bh=8RMDTfh8QVmdribdaIbbnt4LM7jd03zpGTMnjbQiFAI=;
  b=hZBVLs9nGHxt7I3NPbs/Lxfwx8g68eFs6SLvExpLI7wnOXAJNfVNOw86
   ONHkMkdih4hlu7k9yq/mk0Ei0GjpiJM1p58iu8rtPEIq7k9jxb4LYbjuX
   tfz8NtNrNkp9/seDnS2q5O44PTV9Zbk4VObLkxJLKQF6h4FgtUg3NU8dE
   YubgEBamAv47SOg2G0o2SLyT9yp35qUzbJ+AEjgPVNkkexMwtNPZENlzl
   NPdiTvIyHL6+yymMf4qUKMgSTwfqTcwOFzBKn+dqzTs/He/czM6NoK0wo
   bHNB2MANooepWSaAfvNObNjQowaIN09oosPyzkYeoUPCEQeZ+gvI690ZX
   Q==;
X-CSE-ConnectionGUID: asC4YqyiT02SegQRn9g6/g==
X-CSE-MsgGUID: MkxYNHVMQJavo4ta2DqawA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77761149"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="77761149"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 21:26:46 -0700
X-CSE-ConnectionGUID: SUoCEMVHTiuWcydelgJk7g==
X-CSE-MsgGUID: 0vbLO24kTl+hck3ZC4Do6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="229366477"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2026 21:26:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFleE-000000002xF-2YtS;
	Thu, 23 Apr 2026 04:26:42 +0000
Date: Thu, 23 Apr 2026 06:26:40 +0200
From: kernel test robot <lkp@intel.com>
To: rohan1sj <rohan1sj@cadence.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ERROR: modpost: "cqhci_deactivate"
 [drivers/mmc/host/sdhci-cadence.ko] undefined!
Message-ID: <202604230620.crrP78Cs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/rohan1sj-via-B4-Relay/mmc-cqe-Add-CQE-DT-support-for-cadence-controller/20260414-095637
head:   8f0b2c28757fa7237cd4732f543b4d8c1e9e3ee4
commit: 8f0b2c28757fa7237cd4732f543b4d8c1e9e3ee4 mmc: cqe: Add CQE support for cadence mmc driver
date:   9 days ago
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20260423/202604230620.crrP78Cs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230620.crrP78Cs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604230620.crrP78Cs-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "cqhci_deactivate" [drivers/mmc/host/sdhci-cadence.ko] undefined!
>> ERROR: modpost: "cqhci_irq" [drivers/mmc/host/sdhci-cadence.ko] undefined!
>> ERROR: modpost: "cqhci_pltfm_init" [drivers/mmc/host/sdhci-cadence.ko] undefined!
>> ERROR: modpost: "cqhci_init" [drivers/mmc/host/sdhci-cadence.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
