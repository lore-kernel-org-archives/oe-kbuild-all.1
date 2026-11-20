Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208388;
	b=ZQnWhw8JItPp7MoniubmlK1H9wj+Gdu5g843WoarHNDhe1QyXdT1PiIM8RXoAkrpZgzy
	 vujtbSPP78FrbHhVO0zNCzFN0vU1CbhBN5FmT/qoEhV+W4FMassk0UO1xrJiA11NxVkAr
	 Q4LPMrFDtJfoIryu3XdaCwoia5LrCW9hVCbFSYn+8/552sX7sGf3851v0UUcsiax/sP/P
	 TBOkaHUSb8jHnv1dhu6KYuO480oPgQLpzMJq0xQDyp7poDkSLTOrTL+iawCH8A+2TYfL6
	 sRG7FCGKRj+qJ1smzf1ELF6bjHcxaowPLvXzUye4MgbPJoIrJEUD1+JVlMfXSDLCHmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208388;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+tUL3+9dLEnayLOGcPM1eXVBlH6kjbAYY6eAduCQTwk=;
	b=pmB7iILJBx8dpzuQ8GWZlKYt3wG/xufWzIyS41tLhOX/Pn9Q0K+xwc/92nF7g8Jyb7jx
	 x6t6gwda+FodDH6lqgO8Cb5xpGBFvPnlL9je1E2ytjDfZOYb+7CnQFTKpw6Qnm+ahwNbW
	 su3R6arXG1MjqbC/l0BWouyvC/SWheDJcL6QZ7x4cOdPmmIw4gVxMWlHyotq72J7GWM1Z
	 tcx+vkZnd5kagTyyOiwHbTkfF/oMhUo0RM8cgsrm7nSYnuNVFj5iHkLGUIe86Za5tSAC4
	 A5ZWUVR6tw+7I9P12NW7E1n3qjWbUHuIQiJj1rymeeQ3gSDB82XYyHhNzinzwfF7QiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mOzPlTXF;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452E4606A683
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 20:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 452E4606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mOzPlTXF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208382; x=1826744382;
  h=date:from:to:cc:subject:message-id;
  bh=CywnP3Flmhke0RCSAQVQkZN5WEOipcmf/A10ixWbtJQ=;
  b=mOzPlTXFgKr7fQtrtWWSrWWh+KX8pvwHwG5Ij5UPu8sNW4IqdIDFPaHf
   4rbm5sEgPqNW0TTs4ML5X/Mg6f2xQ4W3EdNXQJQxuEzX32HZMeNSTT54l
   1XERo5Q2ukCFfOqfi928aSoVSnOFwT5pPrUSyy9sV8JGp3ri4f1jam882
   wmVccTCmCNqf9+A/ZWRcTH5lSoCZIuQtbDHFrnUiyGC+UuWDSklL/ZsBD
   ahwPCgrZBkZ4Cl+tUbaVqCTrJHAFM9xxlZqLUfQPX48/KoZ8gnyqyjTyY
   W4nUGkllwmo+i/d/RrWo2fE1qXA8SGlQGAw9YoxI0MG+gL395XCJJo9Yz
   A==;
X-CSE-ConnectionGUID: EfGgOoBATQK1b18ffkvSfg==
X-CSE-MsgGUID: JXvZo7K0TaKPYjIjTryR1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4123705"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4123705"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:59:42 -0800
X-CSE-ConnectionGUID: 3Y/Niu7MQKu3Vg1q5gffFQ==
X-CSE-MsgGUID: bXRRKctjSJeZCCUOQHyXmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11003139"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2026 12:59:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUVhq-0000000047l-3Qpz;
	Fri, 20 Nov 2026 20:59:38 +0000
Date: Fri, 20 Nov 2026 21:59:07 +0100
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v4 4/9] ERROR: modpost:
 drivers/nvme/host/nvme-fabrics.ko: symbol 'nvme_auth_extract_key' undefined!
Message-ID: <20261120215407.qFI24sXE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v4
head:   1b78746d90bfa570d96e88475983421f24c38b0d
commit: 471402e9fa1b77a993d10ccd1568579108ea44e8 [4/9] nvme: parse dhchap keys during option parsing
config: openrisc-randconfig-2200-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120215407.qFI24sXE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120215407.qFI24sXE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120215407.qFI24sXE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/nvme/host/nvme-fabrics.ko: symbol 'nvme_auth_extract_key' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
