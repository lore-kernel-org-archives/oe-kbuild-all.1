Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF80748D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 03:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734061817; cv=none; b=aIBji1wD9mMnzIB8C7Vrm2QzCB7T2X9f8BfXf5hbEAsQzRlE7CGoKCdLGc7TsTs9pKMslUMo1D+K6FPZ5Hw0k9psIvrx7FkGLQNADsgDsWePRrbEvy3t7b/Tcl2z0iu6wyzEMqF+CG2Hd4rQFAoUU8phmxHefxYWVPjfFU0lPE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734061817; c=relaxed/simple;
	bh=EskWEZulB4qeQZFRojByNWtbEXj3hsI4qeHEpEwyMyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ChAR5WVXbfB1VdmQf318wni1ammEUEf87imRqR8mpokOYqFMFgEG1rUYOL53GUpUOtKOO1ZQiNOJiyeDk/YwXys5JJ3bj2Z6DNSihy1zluHLCG/Cc9Gpo1xVbAe0CInoDq/vwkShQQ0mWQW4qRESQ8Rbr0hr3Y62PV2crk4aj+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdaFjKx2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdaFjKx2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734061815; x=1765597815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EskWEZulB4qeQZFRojByNWtbEXj3hsI4qeHEpEwyMyY=;
  b=CdaFjKx2bpkLkwbceGfJWzSysmFeFOZ/25BxMsBO+Snx+B8mrU5uniFc
   dBMoJrvSxaYVS3UBoYt9nAFmE5urZfanV6S+FlZms0okSfxvOKsJxIUHq
   Lwyp5XjFgSC6eMTsRAFEWNwO7UgbsR0WR71qFwacyp6a0vv1pFNf1cvX1
   twdzTplhaaORUFB8gjwmM1cScnK4SHK7U97kxz0OBHD1MIz8hP1OX2UcB
   o9pnCbJ57WJDjirctaPoRBaV4VSdlkn6IOlLTF6cdkSCJ+/3jFiiQqOJV
   D+7HKDF27vsYG6ksuUVVyyG/pw1jPgkPIEC8ZL3qAnnHLcJFxlnnjCGB4
   g==;
X-CSE-ConnectionGUID: x95oUGrgSCGkvfs186DDoA==
X-CSE-MsgGUID: OUb424plQZGYi/qcl0zXQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34423091"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="34423091"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 19:50:15 -0800
X-CSE-ConnectionGUID: Ak2/dp/YRzC/6PCjPhFipw==
X-CSE-MsgGUID: +VC3LYXER2GpFUsbSate8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100999454"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2024 19:50:13 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLwgt-000Bey-23;
	Fri, 13 Dec 2024 03:50:11 +0000
Date: Fri, 13 Dec 2024 11:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 15/30] lib/spdm/req-authenticate.c:20:10: fatal
 error: 'asm/unaligned.h' file not found
Message-ID: <202412131113.G8xYArpS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   8ecd52ed0821c4955732e004a6cdb812d78d2b20
commit: 29d4bdd173e617586717963c7992edb66a4c1570 [15/30] PCI/CMA: Authenticate devices on enumeration
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241213/202412131113.G8xYArpS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412131113.G8xYArpS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412131113.G8xYArpS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/spdm/req-authenticate.c:20:10: fatal error: 'asm/unaligned.h' file not found
      20 | #include <asm/unaligned.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +20 lib/spdm/req-authenticate.c

59bc05a8be11ce0 Jonathan Cameron 2022-09-06  19  
59bc05a8be11ce0 Jonathan Cameron 2022-09-06 @20  #include <asm/unaligned.h>
59bc05a8be11ce0 Jonathan Cameron 2022-09-06  21  #include <crypto/hash.h>
59bc05a8be11ce0 Jonathan Cameron 2022-09-06  22  #include <crypto/hash_info.h>
59bc05a8be11ce0 Jonathan Cameron 2022-09-06  23  #include <keys/asymmetric-type.h>
59bc05a8be11ce0 Jonathan Cameron 2022-09-06  24  #include <keys/x509-parser.h>
59bc05a8be11ce0 Jonathan Cameron 2022-09-06  25  

:::::: The code at line 20 was first introduced by commit
:::::: 59bc05a8be11ce0ca41f9cb631a726109c8c404b spdm: Introduce library to authenticate devices

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
