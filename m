Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4114F3D9523
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 22:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789513098; cv=none; b=SgOoZhjK99BdKZqeD1EaOG1P+Hn5EVORLACZbRDtWlgZxobgdwDMRuERtVCbLW6sK8hwkjxzBSB5uLp1AG6plH67hNWpo9RsthRNkW7D/wS59BtofX3fDMuIeMhuFTzm1yAylBvROQmEoO7KV+N6ustOcJyg/1IFDuAOATM5rsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789513098; c=relaxed/simple;
	bh=OjSDUlJ94/QYxtrIG45ol4Mw0m6RoVh5KimZ+3sx+HY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eWI5d12VsbWmYDVZYoVihx8Nkjw9Jm7HrpO0KUyISwqmxngxh+6zd1DxY5s//taNYEQ3Q/qslvL7mq+1gCNSk75iBrcQPfPScqBgyT77bITkaKTU6h7x8Wg2SDG/tASMus8sYfnDgIEJNwS6ftXRLXC0vzbCOEU5OJYicSbDgqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/BoZjHD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/BoZjHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789513096; x=1821049096;
  h=date:from:to:cc:subject:message-id;
  bh=OjSDUlJ94/QYxtrIG45ol4Mw0m6RoVh5KimZ+3sx+HY=;
  b=D/BoZjHDca3aXmOM6d4yP/mRtJTpiHJ5wSl54tSe3LuTLZlloaQNZwDA
   dPqYyRG3v3Td1Y3PvbpjrV2S1Uk0io57kWsg5Si80iEpTYME9t/QWc1Xh
   wa9fyr8LMZrwCVOZGFlDuAWBRK1ootocxFREjBOxYaps121ZEz523Es4Q
   vRHgksgwrq5w3TXtiBc1PoMetg1uHoSV3DbvCza3xLkWLRaxM0oBlHwk5
   TxxIwU0d3VW01FCcktOk19crZ3W5n1HkU60yY1l1wwPy3pPXlQZ0e8+ua
   KXL3Lqdi+xlgAEHLbCs1v12BBY442o+VpP3day+vha0UeUhtpPXsUIaQQ
   w==;
X-CSE-ConnectionGUID: esWJayc6QFK3//bmODP1Rg==
X-CSE-MsgGUID: i/fMuLDWRq+7iEKm/GH4Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92396220"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92396220"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 15:58:15 -0700
X-CSE-ConnectionGUID: ToHhjjFCSiKk2ean9c080w==
X-CSE-MsgGUID: Sar71I+hQomlK4PtWiM8ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275108739"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Sep 2026 15:58:14 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6c6N-0000000059R-2vR3;
	Tue, 15 Sep 2026 22:58:11 +0000
Date: Wed, 16 Sep 2026 06:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/ffa_ns_sgi_gicv3 5/6] ERROR: modpost:
 drivers/firmware/arm_ffa/ffa-module.ko: symbol 'of_irq_get_affinity'
 undefined!
Message-ID: <202609160630.pWMV8j0H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/ffa_ns_sgi_gicv3
head:   1320be42e7c15b4ae7760b25e3c825485dd7b3a4
commit: ae39ec13f30668f9dd05ef6739ab96542cc298f7 [5/6] firmware: arm_ffa: Use device node interrupts property for IRQ lookup
config: arm64-randconfig-001-20260916 (https://download.01.org/0day-ci/archive/20260916/202609160630.pWMV8j0H-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160630.pWMV8j0H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160630.pWMV8j0H-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/firmware/arm_ffa/ffa-module.ko: symbol 'of_irq_get_affinity' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
