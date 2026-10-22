Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664995;
	b=5QfGihYhfpFpNH/WndrUf0ansxNPcQMv6l7AL1CLs8ZUhAsPxqPcl+Ns33nQ69E+XhUI
	 PBFmaJGraMhqj32Ybr00u9zPmua8B2xxP5XhpKcH7OAjWUOJtmRBr4oQfRJT7mO3R0tU1
	 8nGEpsotplJolLrXO5Z6V213WYatrjnkRXoF41ZO0ZYb0XoRRoACr/XJw8Cczdu1Onu9D
	 DjlmaILb31hp/sphyaFNSIIgVnRyJWJU98Rh3SvqUGQoiQWIbh2WyxRTSVlTODPB5oCUB
	 Hjx5lWJTh15cjUwL6DoG45keWw+SR9P2gpAykuy8GIi48llCcZS+J88gTzdmIDuxWUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664995;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=o2KYbHjR24VYiJHhTcbJVLv3bf4J4w2w1Y1LI0AEdt8=;
	b=i/VUo//SFCqVSD+kWwXNLhY53wuP/m/JkA25af+ufNbvs1tPkJH2oUW2rT1Xt1gJu+Gl
	 +SPNLhB3pQLMCop/F32GbayVITfXeOTDXZMHP/azm7NkU0uSE7dRLas8I6iQdHpQxuUaD
	 dQLCWdQfbKCvoCA+OAFQEO5nmpvZY2HsTK61+z7hl809tI1JcHRkiKT7wPv2ZJLz8oC0c
	 4hI5NqtAbJRoF09yAg/9ffq7666q7ggqG1htdWymuT+jWG+DmfzppBpdKbDcmnhwSLecU
	 nlst2hkc3Tp6yxaKVBPxXOuPrR+Nns/FU24oRJsGB7a4flMAIjVy+dUaMeDRDPnOUPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B9cy+Xa6;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17903606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 10:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17903606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B9cy+Xa6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792664994; x=1824200994;
  h=date:from:to:cc:subject:message-id;
  bh=yvhE/tG+FJzJmFtJePFbVNFAkEO3VF/hwsxAJ4R9Z9c=;
  b=B9cy+Xa6t4WIgPeGcS8rEBS/GwOVO4R7wenfGu/m7yL2rIR8l1PDfhb0
   p1SPElmmpDy3o1gDGb69zIDhtUkn0HYE9tgUNigWdCRwc9MMVIBz97meS
   yRigznTRMjmbvkEGUFdzFi01Sa4y8afoFKkDCtRaoNTxRfACTYqJbxm00
   A+RgepMg/anOjh8jDSc40cev17zwITlzSwazPJhKm4wk6LIbiEg56ttzy
   72XriPADwAOTfBkI2WU5EhM18WfRYyvVCD/RiCv+i4BkU1t0wXXi9wkM/
   EYStTNTWCUf7nS+mJ4LuAsfdshkTnnY/0eeqiKLn8vxE+1LWyiAy4Nbt/
   w==;
X-CSE-ConnectionGUID: bYpuh7PpT5qD/f2h+Zj7tw==
X-CSE-MsgGUID: xX769MS9S0SkXndRPGD/iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1309780"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1309780"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 03:29:53 -0700
X-CSE-ConnectionGUID: xfYImpyDTSmA8vaFUw2p7A==
X-CSE-MsgGUID: mymDznTvSjytvRWZGiELqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3260020"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2026 03:29:52 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJq3R-000000000IT-0VvU;
	Thu, 22 Oct 2026 10:29:49 +0000
Date: Thu, 22 Oct 2026 12:28:52 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/genexis-xg6846b-ethernet 20/23] WARNING:
 modpost: drivers/net/ethernet/broadcom/bcmbca_xrdp_test.ko: missing
 MODULE_DESCRIPTION()
Message-ID: <202610221226.6wDD6oZv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-ethernet
head:   cf136d48dabcbf056cf26e3c3377ac8cdf4b5b80
commit: f19ce282ca3fd68d4b44f1c38d0ea20308c79de8 [20/23] net: broadcom: Add KUnit tests for BCMBCA XRDP Ethernet
config: x86_64-randconfig-2100-20261022 (https://download.01.org/0day-ci/archive/20261022/202610221226.6wDD6oZv-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610221226.6wDD6oZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610221226.6wDD6oZv-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/net/ethernet/broadcom/bcmbca_xrdp_test.ko: missing MODULE_DESCRIPTION()

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
