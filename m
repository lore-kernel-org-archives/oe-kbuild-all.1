Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2214C3750AB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 06:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531238; cv=none; b=dUY+lt66WuHiUrMMOcBJJUoh7VIqVgR7Bu5H9gjTqljfheLdDB2DMSiVSMN8CGg7RsWVhwWMUJXIhf+efoMkvEib7b9aggdxgnX+0RUWi89N/dhm2AhBfRpYGF6Jkz/VT+D7JzF3g20M4uMM7J1yVMPsYYMOt69lhBK3afOnBvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531238; c=relaxed/simple;
	bh=a2EgT+WmL4kT1MsxxGP6VW184oZEE1+T+RwydmV0pj0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z7rhy5vZL73RI2LaR0tNTYA0QTfw58aTm3lbjvnB0RXfoY/31qq53C2R993ohhupUpoHHX+MuOJ5e7VTTuhqvF5v/xKFPnyNHnWmGdWmq7oOsoV8ISwrLyYaTYGjLOCNxovSyM6EjvqKENqMT0YDXCxUpX0+2yvjOO+kD93ep5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUoofq1R; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUoofq1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777531236; x=1809067236;
  h=date:from:to:cc:subject:message-id;
  bh=a2EgT+WmL4kT1MsxxGP6VW184oZEE1+T+RwydmV0pj0=;
  b=OUoofq1R9owtOq2L5xMYuvxb3NLLtBq8wyxHrRqTH+BVfEVTbfmW9ft7
   YEJBIGTTQcoAlHymKwiUYFbgMpEW8IGigpplKO68eLZK4ObeP/el3FWi6
   k9oCLkZircQsqLzYCIxzmYYUuyLUJn1maJ/7FKnvXyIADQ112orZAC4X8
   mfyvTH3zSnTORGM+IjF3zpHPh5qdQJWb3EoSRaWGABb7CVZoksJRiPpbt
   CWHRu8+e6eZPRp4jaaP4uwXtZpRafRS8fxlDzTtJba/xSCkXKNaj9jLWs
   Q2cQD+2P+TuwGbTh/W3KF9zFJF3wT+K+WFFgLJJSu/AphdqkjPLJ8m8T7
   w==;
X-CSE-ConnectionGUID: +gxJMpLJRtSKokf7awyb/g==
X-CSE-MsgGUID: 4/UXQIdnQKWMjFsf7lWDig==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="103927547"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="103927547"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 23:40:33 -0700
X-CSE-ConnectionGUID: YJXyihOhTc+Ks7QIW4dW/Q==
X-CSE-MsgGUID: zbFiYrReRPezSEM2EOj4tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="231849431"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2026 23:40:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIL4Y-000000004lK-3gYz;
	Thu, 30 Apr 2026 06:40:30 +0000
Date: Thu, 30 Apr 2026 08:40:03 +0200
From: kernel test robot <lkp@intel.com>
To: Aichun Shi <shiaichun@open-hieco.net>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/edac/amd64_edac.c:7:10: fatal error:
 asm/hygon/node.h: No such file or directory
Message-ID: <202604300825.RRQI0plJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aichun-Shi/ras-amd-atl-Add-Hygon-DF1-Data-Fabric-system-information-helper/20260417-020241
head:   3951670094ee3a80d8d59b5949bab83b5b6e7883
commit: 3951670094ee3a80d8d59b5949bab83b5b6e7883 EDAC/amd64: Add Hygon Family 0x18 models 0x4-0x8 support
date:   2 weeks ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260430/202604300825.RRQI0plJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300825.RRQI0plJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300825.RRQI0plJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/edac/amd64_edac.c:7:10: fatal error: asm/hygon/node.h: No such file or directory
       7 | #include <asm/hygon/node.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +7 drivers/edac/amd64_edac.c

   > 7	#include <asm/hygon/node.h>
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
