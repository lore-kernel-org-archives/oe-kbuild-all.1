Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C15DC147
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 02:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743475565; cv=none; b=lJTxOLClwmZN0PCIBr9Ye7nO8INBHd6J5S4FC8dZW5eE+0jVmTSrq8+qwaRxymb9Ci7JUqiO8QF46o9gF0T2loXI4+t2RWNL9VdSAZX5GoPNjt2iJy86BoSpuxOVAzcbC3mv+HNwz12YR8J3UL4D+CR4yq7HYJBB0sFRtxOC/aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743475565; c=relaxed/simple;
	bh=YU0RWNsZa0rVioLhPgXbydPpZ5fDT4krgh65cMTN+Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ifKRCo0QNUm2z1GHKGwe9WSEvEWWgdS5+WHFyuoLmGGKOv+72R6fRrzn/I+9CfntxY1IshIEUOS3Dx693PFYmkvCW/mjFiY6C4+BAg5xc6Z3oSlcSNVES9XfbHcOrznUFVOWuNOcf8LZ4CWQPhGrtv6LadXVIwkrx8pd1qRXbPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOblxyuw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOblxyuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743475562; x=1775011562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YU0RWNsZa0rVioLhPgXbydPpZ5fDT4krgh65cMTN+Ak=;
  b=QOblxyuwOmoWkFZIbjDX/mOH8Gw9tYORFvOlPtl8KSyVo3AyhM5ebGq4
   90iEEcEq9qo5i3GhQoCVerz12dc00Z1C4oKYY1hClwQMSR5bjQmf/3lET
   YyKd/ZAvt50WdNsjIW6VNK2ty7Q3iVNWJ2cx/+HJ7TwCsDfOilnhIWB+/
   pkjkylG22O0RumeVVbrnAr0s/4JaRQrA/X+0eJjQOp07FDpfrEa5bqdZX
   ooIJhKxumQpeL/aMXkfeP0ch4zmQfOop3HGnQEJKpYG4TDlimEc0NVECK
   tjWkAyjitnchTcaYTBmojFmmWqfbO44E9ihSZpgX/c8UTmNM1vpggAIrg
   g==;
X-CSE-ConnectionGUID: dFBcmk+fRwK8lTtWNr8F7g==
X-CSE-MsgGUID: 7oM+nVegRiKIoPxCnA4HBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62172261"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="62172261"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 19:46:01 -0700
X-CSE-ConnectionGUID: 0Dl2VcFqTWOvFrL45krSoQ==
X-CSE-MsgGUID: g17/hyxhTFC9C4A6zRpUcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="126083317"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 31 Mar 2025 19:45:59 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzRdV-0009au-0m;
	Tue, 01 Apr 2025 02:45:57 +0000
Date: Tue, 1 Apr 2025 10:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [linux-next:master 12681/13861] drivers/i2c/i2c-core-base.o:
 warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0
 reg2[24]=-2-24
Message-ID: <202504011011.jyZ6NtXx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   405e2241def89c88f008dcb899eb5b6d4be8b43c
commit: 9016dad4dca4bbe61c48ffd5a273cad980caa0d1 [12681/13861] loongarch: add support for suppressing warning backtraces
config: loongarch-randconfig-001-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504011011.jyZ6NtXx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/i2c-core-base.o: warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0 reg2[24]=-2-24

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
