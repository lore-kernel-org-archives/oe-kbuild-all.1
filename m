Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C862D47F1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 04:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865012; cv=none; b=ZBZGZOn4Bjo46pAghYOWRxbSEKYh5Lc824X+CPJrYcHk2pRRxNrVd6JRPwL8qYnwl1EXFp2/Ll+r4+5JSoAOiOKaCUadwCpxAQabWlwDYBA9mVNeeqI5TgFWs9Y3qzgxX7+wMgu4DNEcY2o4AHAcySqpk1k68dhQinbzVN3Ateg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865012; c=relaxed/simple;
	bh=IGUDscz4VkJnipR3c5G+o1LnV74O4FCV28oplSH/As4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gWV0zIGE4+jvtvuUk6q4fFKFGcBTQpHe1ztfePfNg+uxeRh5dyq6YbRjghg349BFPA1RfqsiUfb4c8YzoTkl8LjBHUTlXp2tmyZUXDXXFmm21LE8w4LxHQYaZMdoPa1/syHs8TBJVYxNvAyljnb8BJ5hB4WXkCpojVvjsf1ILuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nf8DghSt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nf8DghSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791865010; x=1823401010;
  h=date:from:to:cc:subject:message-id;
  bh=IGUDscz4VkJnipR3c5G+o1LnV74O4FCV28oplSH/As4=;
  b=nf8DghSt+rZZkN3aVEDBklX5zgmFc+dqZ1x16IDRstM2rd1ITaXq+Krp
   yrrcTvOah0xCqjecvvdYfKsMndDDtpa7L8IjqC9WI34+iffHK96YJZQgp
   RShYq4IUxMhELXAwIdl445Y6MLH0Ofp1z3xe9sns3isL4YWclp1dtbPam
   3I89lVB3l/KNG3RPolMg7UFJxPrK/afqaPZs2wF9OekHW7xECKutCR8Vw
   II2zrL4RrDiZ8C4wrcqQ2sO/VtUMHuHSKGRZqOyBvX0urCKtZ0/0J0dMu
   9MTi0c5ZdA87PXBYPCgRglU7F+2gW5z5o94oKmZfygI3FoftESSZkJQrH
   w==;
X-CSE-ConnectionGUID: g8uUO5iwRUmXQdR8GPNY/A==
X-CSE-MsgGUID: jhkWQtXcRpqOcQG5JsC7zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="481245"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="481245"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 21:16:50 -0700
X-CSE-ConnectionGUID: rup2KolIS5qtCDfI8eSRmg==
X-CSE-MsgGUID: xl6vhhSNQLCxrNCM0rU96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="989709"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Oct 2026 21:16:48 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGTwU-00000000CWI-2Oc3;
	Tue, 13 Oct 2026 04:16:46 +0000
Date: Tue, 13 Oct 2026 12:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>
Subject: [dwmw2:spinpark-arm64 10/20] Warning:
 arch/arm64/kernel/cpu_preserve.c:164 function parameter 'start' not described
 in 'arm64_split_contpte_range'
Message-ID: <202610131246.ZjtNj0DV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux spinpark-arm64
head:   c36bf9732ee79ac6311b2168966b2e4cd92688fc
commit: 4b856ff3c9e3e863a899ac513e41cd560d1a9fe6 [10/20] arm64: liveupdate: Add support for physical CPU preservation
config: arm64-randconfig-1001-20261013 (https://download.01.org/0day-ci/archive/20261013/202610131246.ZjtNj0DV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131246.ZjtNj0DV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610131246.ZjtNj0DV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/arm64/kernel/cpu_preserve.c:164 function parameter 'start' not described in 'arm64_split_contpte_range'
>> Warning: arch/arm64/kernel/cpu_preserve.c:164 function parameter 'end' not described in 'arm64_split_contpte_range'
>> Warning: arch/arm64/kernel/cpu_preserve.c:164 expecting prototype for arch_cpu_preserved_setup_buffer(). Prototype was for arm64_split_contpte_range() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
