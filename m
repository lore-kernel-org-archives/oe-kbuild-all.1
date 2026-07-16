Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3710A3BBFD2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192361; cv=none; b=PAMXHInO6B4JnTkrNpc7MVpKLx4H++g9/VWfUIY8aaBSNXgJ7jiJCozK0e6yK1gRoiq46WbNaDafEBr1JYs+Q/iXI1kwhRYqR/c6w2hsHf495V0Bhj1KYSEgO5f+qEX+TsjH+vNy++6qnVjwsTTDAKjNotCdWGDGt6vb4KuPr3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192361; c=relaxed/simple;
	bh=ytvRi5Lu3IQBNFNnZN53TkyyPkVKvWswPkSYDLnVrzE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PA9lZUXIz9CLWqq4jyUBqQQwUtjtkTJg6kl5rJqXUlpIUHeh0byEK1WeCgyoClE26kC+5saoXWQkYfeW9EDQoN0H9kE5ihYPET1eEHZBblVRrTeiPnfSQzlVQ4H5kn2M/4CdePTXxw0GZrnzJX/Av5HetNKMi0PKJc7Gm4WZsac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmH33mwn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmH33mwn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784192355; x=1815728355;
  h=date:from:to:cc:subject:message-id;
  bh=ytvRi5Lu3IQBNFNnZN53TkyyPkVKvWswPkSYDLnVrzE=;
  b=HmH33mwnLFc0Wu/UQFMEHTs1oqCGxH3Y3t08eXLbIO712RbIC29RHWpk
   /lKQfXCcB3S+ykfd6/sDtIJtQiC0REMVLybHqoUaUcROSrRmzqnjDbpoT
   9it+MJoVKq+w+AApUcvZJ0ohEfBmSKFZJFcANJry69MgmDVlYFpZwNaG2
   IEpymph4Q28A16U4OdIOrapixlQD3b+r3EL1mYy1j8GAFJGVgFpLTau7c
   /js6VeO0rVOgj+BHNMYRZAjonbiVCSEcAk7EsLZA8i0zJuoxULy6ZlrSl
   bPz0oPDkcFDPN728txjmwxyhXn1MEOqFNy4082FE8Cd/T9v/uL8izGpSx
   g==;
X-CSE-ConnectionGUID: 4e1SJN/VT7mmOlL5LSOrAg==
X-CSE-MsgGUID: 0lXZC/CwRn2wY6oAHDBOHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83828634"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="83828634"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:59:12 -0700
X-CSE-ConnectionGUID: uzPAIpdcSpiNo/UjRfBCIg==
X-CSE-MsgGUID: 0wgbbEJ3RFqksxWDxYiExQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="280887219"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jul 2026 01:59:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkHvv-00000000Ob0-3uxm;
	Thu, 16 Jul 2026 08:59:07 +0000
Date: Thu, 16 Jul 2026 16:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2026-07 14/14]
 arch/x86/kernel/cpu/amd.c:1280:6: warning: no previous prototype for
 'amd_check_microcode'
Message-ID: <202607161630.Gsq3zELS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15-2026-07
head:   d6257262e20fd4430f6e0605ae8a556507eeb90c
commit: be824fdb827dc06f77a31122949fe1bc011e3e1e [14/14] x86/cpu/amd: Add a Zenbleed fix
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260716/202607161630.Gsq3zELS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161630.Gsq3zELS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161630.Gsq3zELS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/amd.c:1280:6: warning: no previous prototype for 'amd_check_microcode' [-Wmissing-prototypes]
    1280 | void amd_check_microcode(void)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/amd_check_microcode +1280 arch/x86/kernel/cpu/amd.c

  1279	
> 1280	void amd_check_microcode(void)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
