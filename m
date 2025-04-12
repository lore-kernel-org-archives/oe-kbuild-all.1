Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9021519BA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 12:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744460773; cv=none; b=pKpY9u8BY2IYyXOPusJ1qfnLNY1jFM557x3SaAjNEo3llDrlJXueKh0DqVakU+0ewHgyUfrsinoc69GRc8QusLZsvzVJDywtP6r+g/KRr2zVI8YS19RLz7wWWzvqyEi4jeAXVWM3EszfIhNpdlAXc9dW2CXZl3ssNQjINn4NfsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744460773; c=relaxed/simple;
	bh=/yl3e0u0fkvdgEMrqH0CTcIicUpqi4wFaoVEg6plDDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uzx1I4bImbN3UeP1wLt4MEXrhWR97jlV3PBXff1HHSfp/EhpNkCbIPVqUjbkvtQnciE5Y+kqapEKrOt7XxryLsVbVwMkl1YaVjKCybkaY1Zg0f5gev2EnfQ8cg268ngirAX8XCu9zjmR8Ju9QbOeeN1v2pBdX9V6KmH+9a9//ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGKuxcy0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGKuxcy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744460771; x=1775996771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/yl3e0u0fkvdgEMrqH0CTcIicUpqi4wFaoVEg6plDDg=;
  b=KGKuxcy0f4DNIiPi+oLIcYotPbRkBOr3cFYQdxjSkBKIbj38pQ0BLxNo
   CtIevf5ESw9GbtV0kCdJh55oBukaVIZd/kB/mZkPWk03Cs0dq2TBTDySg
   1Dxa04wntZD/jJCzFKWdRrBMJCV9cGJxi8b932SiNs0fqTXc3AUuLKRXK
   LVNsFVg1c9+5gpZrY5OKFlAYq6My153cYdIpPWNVfEXOpnAoxNHVOVp13
   Oo774UwPubB2kVgHNeFq1Iw0wM0kTzquDHWa++ef9NCOWkoYEABJX0MMu
   3FAblLz8TXZMwJiYODz5PWFjwIEvP4uJJd+LRVJgXVKfzNLeIDDR5J3OP
   g==;
X-CSE-ConnectionGUID: Q3X1VSA+RvCxXEYy/jYJIw==
X-CSE-MsgGUID: h9wyW4sFQWiewAoje6DuTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46007292"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="46007292"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 05:26:11 -0700
X-CSE-ConnectionGUID: VAqM9VzaRFW1JTp6+fF/+Q==
X-CSE-MsgGUID: VDPk4xvmTcGng8Hd/D85pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="134397473"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Apr 2025 05:26:10 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Zvz-000Bmg-22;
	Sat, 12 Apr 2025 12:26:07 +0000
Date: Sat, 12 Apr 2025 20:25:40 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.15-rc1 40/102] make[7]: *** No rule to make
 target 'drivers/platform/arm64/ec/huawei-gaokun-ec.o', needed by
 'drivers/platform/arm64/ec/'.
Message-ID: <202504122020.TiomRe0g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.15-rc1
head:   1b55f6914063388a543ead294a0253c223d39bec
commit: a6b023449e05c530a3a0a390bac9b6ffabff57eb [40/102] platform: arm64: Move ec devices to an ec subdirectory
config: arc-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250412/202504122020.TiomRe0g-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504122020.TiomRe0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504122020.TiomRe0g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[7]: *** No rule to make target 'drivers/platform/arm64/ec/huawei-gaokun-ec.o', needed by 'drivers/platform/arm64/ec/'.
   make[7]: Target 'drivers/platform/arm64/ec/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
