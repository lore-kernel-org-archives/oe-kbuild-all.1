Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E678719F43A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 15:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752507869; cv=none; b=rAeecZ77n9T+j1PJzLQFRDwiY2YR6VeHQHyLhDypK+FJFidXgRLqZ+LE97QhwDL1b5pEqFUzVVIgK6dXqxpP1LoRlzZ6a+z/CyLGFFDmC3PcrKpvK8WXes7NSE6xzGtmj9Lm6fcxPmOojkgV+K3qfeOYNCPmQ/zcAYUypOh5sKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752507869; c=relaxed/simple;
	bh=5WxlMYWSS05MC5okwdm3AB+OhjDi8B9A+2xOeCdGWYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bNhO9nDR55K38pgjxYr0I9/c9pmpkU5MHrCV/D5UXJIkZigli1frK4KnFZWCHDfRm4RCwZJF3Ob9HBo1+PV/5JJsruC9xgA/y96GvI4RA8bFuoGf6aruf2YDwj49rcJ7UzaxfmwTmY3qbVPdEOug370U35qgTmRLbdz1BgDwC18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crjJsNB+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crjJsNB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752507868; x=1784043868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5WxlMYWSS05MC5okwdm3AB+OhjDi8B9A+2xOeCdGWYs=;
  b=crjJsNB+3X8vJ8hu8RSFW2n0coD0uBmGukH5eZReOM8EFdiPk0W8QWC6
   MIgaFTJmb8g5hmWIjORAWk0ORbQxPdCgY9fTd4i5kwOXsHK/7KCkW/Plc
   J1wZgIxjRBdegkQswWQh5M06+0G5gVcCwBC8/gybeacPoYANbtgezxXee
   eEHegnDPAp4WAZN71awQmXE46f3MU4bqDHhJtGx52rOonUSpw7iUqIJun
   yN6bib2QPAWHBEPfLHwYlHt+OvACHZMKItqMKpluvbjd5JvL8ONkmGPrl
   0J6hG1uEMrfk3cuFfWTEMm5t567shQZ5ri2iUMw4usmGSE47qq2eLgvTJ
   A==;
X-CSE-ConnectionGUID: E2ewzS4nTkiZ2mCzdLcOMw==
X-CSE-MsgGUID: h4h7HkAJS7+7qMBC+pppyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72152368"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="72152368"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 08:44:28 -0700
X-CSE-ConnectionGUID: pjrg+o48Tc+XXXZAwYa37w==
X-CSE-MsgGUID: eEeP2rlcSbyraUeD5Kse/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="161285518"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Jul 2025 08:44:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubLLs-00094B-0O;
	Mon, 14 Jul 2025 15:44:24 +0000
Date: Mon, 14 Jul 2025 23:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2509/2509] aarch64-linux-ld: Unexpected GOT/PLT
 entries detected!
Message-ID: <202507142303.gwvR0IYM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bacbda61bd658b453d6e0f378d44480554480111
commit: b991780c836ceb9a479c6c6e385e914b487e353a [2509/2509] arm64: introduce copy_mc_to_kernel() implementation
config: arm64-randconfig-001-20250714 (https://download.01.org/0day-ci/archive/20250714/202507142303.gwvR0IYM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507142303.gwvR0IYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507142303.gwvR0IYM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: mm/kasan/shadow.o: in function `memcpy_mc':
   shadow.c:(.text+0x504): undefined reference to `__memcpy_mc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
