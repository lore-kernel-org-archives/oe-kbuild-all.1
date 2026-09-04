Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47619CCF7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 04:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788494936; cv=none; b=bjgIF6+/w67/9X/CyoxVehnHzKEJJl4lkiQqqi5qlQ5vsiLpH8hrCT6gTHcE49JutctmI3ielHRjChBkxvoZD5UPfNftFkjNFwEyxK0y26PrY02ve6VFmi25LKE0Q+JXZYrNKxHjZv/tQMANyV/9Yyad7yznwOC/v9qRkn3xTbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788494936; c=relaxed/simple;
	bh=cBUZSoQJr7CiKXxkrCzYoGfiGZv1wFYXBBiEAT8cOME=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sAB3meHIzENUQEfKj+erkLfTLRLgj7XL82fdAwZhnOVr4ZojE8FM23YhOwXy2rjlpaVq/YyFEQpUB/QaT/f4ZOKUrQ67EM+Cev9L+TV+TAS7zkQ+JQAPWO7SFJXd9ozcv/pp9PlazrBkzZr65chMp4SrPrAeZ7CMOth4z1HkKck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFMicb48; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFMicb48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788494935; x=1820030935;
  h=date:from:to:cc:subject:message-id;
  bh=cBUZSoQJr7CiKXxkrCzYoGfiGZv1wFYXBBiEAT8cOME=;
  b=RFMicb48XG22aDsnwdp1jzramcCUilVS7kMw9/Q+0hpYJYKoFf7tc41l
   G3M3qW+22SLdWJTBxlQC6zcURCdMvAwl8vnnd9mJGHstxfL3s2QzwoSVz
   8FJGSU+17w1/62n1nq/4GfF0VY3QyT4FkVBhgMUfUHyxgBqLBYKSDupkE
   1bVCgeWe2ujrGXI5sMqB0OxabWvGrHKWIVuDbW2DpDFDI1X3psq+VgvPP
   wut2/Wo7QsDA07Ve0piJpAq2t8uyu2EWFjbQh47RNcEPLlUgGfajuV3Ml
   XrLuze0r1eYsN06gIegUaljU+5lgJf6B4qWeon5mMQrqVmV09F1Uwbfjn
   w==;
X-CSE-ConnectionGUID: 9szbFEE9RVCoBEW7ZoadZA==
X-CSE-MsgGUID: TWQCw10uQ8mXL3ON0RIeig==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92810651"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="92810651"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 21:08:54 -0700
X-CSE-ConnectionGUID: +HqCRkIIQsO7kj9VQM+lwg==
X-CSE-MsgGUID: 3uRuOHvfRPmffS9N04dblw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="270452143"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Sep 2026 21:08:53 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2LEQ-000000005jo-0mKc;
	Fri, 04 Sep 2026 04:08:50 +0000
Date: Fri, 04 Sep 2026 12:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yixun Lan <dlan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [spacemit-com:wip/k3-ufs 2/7] Warning:
 drivers/ufs/host/ufs-spacemit.c:657 static const struct ufs_hba_variant_ops
 ufs_hba_spacemit_vops = { .name = "ufshcd-spacemit", .init =
 ufs_spacemit_init, .link_startup_notify = ufs_spacemit_link_startup_notify,
 .negotiate_pwr_mode = ufs_spacemi...
Message-ID: <202609041113.BKOfhgao-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yixun,

First bad commit (maybe != root cause):

tree:   https://github.com/spacemit-com/linux wip/k3-ufs
head:   243b0632fd569dafa8434f7ce49fe007eeb72079
commit: 69fa5743cc8299ea44a207027e03a4c4bc7fcf7e [2/7] scsi: ufs: spacemit: k3: Add UFS Host Controller driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260904/202609041113.BKOfhgao-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260904/202609041113.BKOfhgao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609041113.BKOfhgao-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/ufs/host/ufs-spacemit.c:657 static const struct ufs_hba_variant_ops ufs_hba_spacemit_vops = { .name = "ufshcd-spacemit", .init = ufs_spacemit_init, .link_startup_notify = ufs_spacemit_link_startup_notify, .negotiate_pwr_mode = ufs_spacemit_negotiate_pwr_mode, .pwr_change_notify = ufs_spacemit_pwr_change_notify, .device_reset = ufs_spacemit_device_reset, .event_notify = ufs_spacemit_event_notify, .apply_dev_quirks = ufs_spacemit_apply_dev_quirks, .hibern8_notify = ufs_spacemit_hibern8_notify, }; error: Cannot parse struct or union!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
