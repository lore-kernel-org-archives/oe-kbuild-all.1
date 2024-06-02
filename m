Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB52EBE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jun 2024 01:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717291761; cv=none; b=p4ynDhL2A3Z3jr5jHf2Ia6Bl6vgkVyQ96qgewEypeCe8jxpcCeQTFr6OAh/6PX+IyWjIInbNrJpJIr7WxTI9lpuqckbJk0fzrVqzV5HR1zTSSt3zQmjyLsp16d6ac/f+pHBj480xLszKNr7rtyJzN5cdEX1M9g4DfkdGX6jhdhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717291761; c=relaxed/simple;
	bh=IAFKXY5D48Rg4MccCXXHVcGwzKHUM79tp/9eBBRsKjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cVrJMEhWcMgJpMnxbYsJ0HL1c3ULUqnb3KQkLqNJpzV8pE/OUbk3BgsH/EtK/7FmVSWtqETb6Gm1lQifia9T5waiigPE8o8z67N0OZ65mPsktE2a746kQ6gV8WEJ5wGzcBdRxF6kxzvhLiTu7uS4hvpCT7r3rdG4NbsHsQ64qp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKUzP++3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKUzP++3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717291759; x=1748827759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IAFKXY5D48Rg4MccCXXHVcGwzKHUM79tp/9eBBRsKjc=;
  b=YKUzP++3+orlWq/Zn4u6IifmOp/rpI2piqv+0G94jp5P1QcwvGwRoPXw
   X9AC4KGoF4sadsruMlUKjDi1bCDX+6EbIgQ7F3ECI+Otyf8Lm9fKtNthg
   /1CXXSUnXAwk5WPXjurZGhR+qnrPQIiDobEhNFT3nUld/mZgfHYmkYIav
   2Zfp6hK60EoTf9QpOiH0eo6Q0P1/b/DgosfgCp253VY+NgyhEZpY8NbMt
   8Dy0pOGSelucY6NGvBl/ntAy73htGenbbyaVHXeB/hc5MF+Ed6Ve6WHrQ
   nBpUpVvu4u4FXEcFxG4PJupocYK6lh4dZr4sd+zxzJVAj2WWZ7t5wet3O
   Q==;
X-CSE-ConnectionGUID: DOtDqHdJS1yPOohWe7NrjA==
X-CSE-MsgGUID: Xon7cRgmQQGo3ChyEnJ6Xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="31341189"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="31341189"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 18:29:18 -0700
X-CSE-ConnectionGUID: 4qa8va0+RguvMgCknzAZBw==
X-CSE-MsgGUID: ez9gHrLWRM6mGSxI05pD4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="37155988"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2024 18:29:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDa26-000JZr-0K;
	Sun, 02 Jun 2024 01:29:14 +0000
Date: Sun, 2 Jun 2024 09:28:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 4/13] include/linux/fs.h:1547:17: error: unknown
 type name 'u128'
Message-ID: <202406020901.0JndSgd1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   36482c321e189c73be6d8f1c49c78d61d1365d3d
commit: 3923bb92783ec63ad3c22d329b22f253aa17043e [4/13] fs: add infrastructure for multigrain timestamps
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240602/202406020901.0JndSgd1-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406020901.0JndSgd1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406020901.0JndSgd1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1115,
                    from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/fs.h:1547:17: error: unknown type name 'u128'
    1547 |                 u128    full;
         |                 ^~~~
   make[3]: *** [scripts/Makefile.build:117: arch/arc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/u128 +1547 include/linux/fs.h

  1539	
  1540	/* Floor value for all ctime stamps */
  1541	struct ctime_floor_val {
  1542		union {
  1543			struct {
  1544				ktime_t	coarse;
  1545				ktime_t	floor;
  1546			};
> 1547			u128	full;
  1548		};
  1549	};
  1550	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
