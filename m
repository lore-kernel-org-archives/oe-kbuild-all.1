Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3821F954
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 23:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712793057; cv=none; b=d2q3Mx5RqgYToM64feK0PXmjCZJSuNQtS73nPi14Ub09UtSYs7XuBik/v/XJvHtc38Wr9GF3AjVr7txdO0jK7FjTWavdPwbhxB7znCGrMWJFJD4zZGDxZmzz9vYfJl5c51ud3maPLh2B2sGFwuzrmShb6YhfGjqkbGWgOAamBTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712793057; c=relaxed/simple;
	bh=732azdBAYmcs8OoQlERNO/wxVw1R0Lb7BqJ8x3saqaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EEfis3oRaSeu7ZTNhLx269mZjnmByW3JnEQzDQw1YTvnu4ejeIv8QoXhL7aeJZbk38Hn+TK10JuwmdKntuJyg39UOrBLMtY8GpCIdullEfXxln+LWRTGLLUWnDnYKQH9syvJJnzWPzbJRURuwrQdWXeVcnsL0RzN7uVn0TFPFWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=be0Ubqk+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="be0Ubqk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712793056; x=1744329056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=732azdBAYmcs8OoQlERNO/wxVw1R0Lb7BqJ8x3saqaQ=;
  b=be0Ubqk+KOhD3v+gARo0ANdLdhSM1EmFXPpsFUKNbdU1+rz+ajUc4q5S
   IFF+f3C1TyICl3cOXqpG8lKS5JJi9GGX8R6zwkLTK1aGu8X1g/OSanCWW
   MBSBM5BrcojmhUT+o60MlWtXfPeVuroaYQQer6pFJWYn+heXsVdFRBx9t
   7yttl+ladpO/7b821+PuIrLtdqYl8T6A+AZHTTSTGH36tZ5EmARcH2x0S
   i7ZExYw99KsXD/tHVsT4nyhZvtZNYiU4lGI/Fo1+8swwKNh8Jg/snXn/s
   Qewj0MV8OUfJamoAvyOLZNHhH+Wc3lpc5NwGD3BqZ0PaPJgK/vuJL9w2D
   g==;
X-CSE-ConnectionGUID: RAbvTMXdREC9DuYYtYG86Q==
X-CSE-MsgGUID: 0PK8KRMuSx2WuctvAl5u+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18746495"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="18746495"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 16:50:55 -0700
X-CSE-ConnectionGUID: TDQmoK6CQwO97WwIXhWpjw==
X-CSE-MsgGUID: c7dCUa8nQgS+WqGG5+uvnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="25363389"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2024 16:50:54 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruhiO-0007z6-07;
	Wed, 10 Apr 2024 23:50:52 +0000
Date: Thu, 11 Apr 2024 07:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 4/6]
 arch/arm64/include/asm/pgtable.h:394: warning: "HUGE_MAX_HSTATE" redefined
Message-ID: <202404110705.HIZ9d6qX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   00829e628b41b68dd6bf2c08e6c4111f2b8ae7ed
commit: 8787ea8cd6b9123d75582491425c4aa1584c6b1e [4/6] mm: memcg: merge multiple page_counters into a single structure
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240411/202404110705.HIZ9d6qX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110705.HIZ9d6qX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110705.HIZ9d6qX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm64/include/asm/hardirq.h:17,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from mm/memcontrol.c:29:
>> arch/arm64/include/asm/pgtable.h:394: warning: "HUGE_MAX_HSTATE" redefined
     394 | #define HUGE_MAX_HSTATE         4
         | 
   In file included from mm/memcontrol.c:28:
   include/linux/page_counter.h:21: note: this is the location of the previous definition
      21 | #define HUGE_MAX_HSTATE 1
         | 


vim +/HUGE_MAX_HSTATE +394 arch/arm64/include/asm/pgtable.h

084bd29810a568 Steve Capper    2013-04-10  390  
084bd29810a568 Steve Capper    2013-04-10  391  /*
084bd29810a568 Steve Capper    2013-04-10  392   * Hugetlb definitions.
084bd29810a568 Steve Capper    2013-04-10  393   */
66b3923a1a0f77 David Woods     2015-12-17 @394  #define HUGE_MAX_HSTATE		4
084bd29810a568 Steve Capper    2013-04-10  395  #define HPAGE_SHIFT		PMD_SHIFT
084bd29810a568 Steve Capper    2013-04-10  396  #define HPAGE_SIZE		(_AC(1, UL) << HPAGE_SHIFT)
084bd29810a568 Steve Capper    2013-04-10  397  #define HPAGE_MASK		(~(HPAGE_SIZE - 1))
084bd29810a568 Steve Capper    2013-04-10  398  #define HUGETLB_PAGE_ORDER	(HPAGE_SHIFT - PAGE_SHIFT)
4f04d8f0054511 Catalin Marinas 2012-03-05  399  

:::::: The code at line 394 was first introduced by commit
:::::: 66b3923a1a0f77a563b43f43f6ad091354abbfe9 arm64: hugetlb: add support for PTE contiguous bit

:::::: TO: David Woods <dwoods@ezchip.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
