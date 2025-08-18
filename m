Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA202E2298
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755517217; cv=none; b=Ia8x1rs3GxLl+PEiceU0b/XV/aKBoE/4wVxzl+Tfgqb8vQpCn9qUNV1EeGHIdnO+W2vvBhfNE4kTgkZqFDNeGcNQQkmwGUgQPimfqlXpyahykZs5oEbHRfGINGa0uz6rLhiAXV0jKAjxXDdlhN6JxRuA2MnJa9e5JnTDBCS0C6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755517217; c=relaxed/simple;
	bh=n9kLuIVX2mTPd7Zo8HWPBUsKSLU2pzEFBPg0//aBPZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OPA88NqQUMHcIWcWLv9/9/T3w53gKHtyHWeIJnf7pkfnM+JwEudHBDy8+RrneXxExebn/YvonGbuzI9A7ogdwUsp9eQTkY5RYnGB4xbjV7LEkDk7+HxdjZ27hLGSok1oY2e+ty4NTGIK1J0phlBdAB3oeJ12bTBa25vkK5KivJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYmX2vX8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYmX2vX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755517215; x=1787053215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n9kLuIVX2mTPd7Zo8HWPBUsKSLU2pzEFBPg0//aBPZU=;
  b=MYmX2vX8IDpoIGOA7p2yund1lMLBDIJr5c2LCaQ11RiSVDqNnsUiV4rG
   vPj3hTEcwZPoX3sXEq2YmqMExRFk702lEeyC6nQhZN92OGAJ9cEv/fRCa
   T+5MNHxlQbdZ548mm4a8VcCncj+glOOelbqlfe5qWLcOn1OJo5yRfJgDd
   hj8hnNP+AZgz4trVq9OupcWT1AniWEEHMBZa4oU5bDzQyZMt/VKZeroHT
   lCPsf5FyZqL3eNKCrkr32H17LY5M7X6JymvLIOZU799tOSu0Nw+7QFodb
   eR1E1tBkMDtsifl6MY6aw8Vq1UZPCJv06AWBV+SnnK9VNda23KpQOu358
   Q==;
X-CSE-ConnectionGUID: jhhqMxkWTwuGqZa5SnFg+g==
X-CSE-MsgGUID: jDikuk84QOW6g8D7Dye7CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68448012"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68448012"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 04:40:14 -0700
X-CSE-ConnectionGUID: P2TzTYxSTMi5n/0puaShMQ==
X-CSE-MsgGUID: sCivbEx5T+mI/tZLWSnrPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166731341"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 18 Aug 2025 04:40:13 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unyDi-000159-2m;
	Mon, 18 Aug 2025 11:40:10 +0000
Date: Mon, 18 Aug 2025 13:40:01 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687] kernel/irq/proc.c:334:13: warning: no
 previous prototype for function 'register_irqchip_proc'
Message-ID: <202508181343.zoaM9lG5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jinjie,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dc90c923fed4944f134644261022885c12631518
commit: 3053668e6b211924bb67c19d791a5a532eca2ad8 [2687/2687] arm64: Introduce Xint software solution
config: x86_64-buildonly-randconfig-2003-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181343.zoaM9lG5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181343.zoaM9lG5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181343.zoaM9lG5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/proc.c:334:13: warning: no previous prototype for function 'register_irqchip_proc' [-Wmissing-prototypes]
     334 | void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
         |             ^
   kernel/irq/proc.c:334:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     334 | void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
         | ^
         | static 
>> kernel/irq/proc.c:335:13: warning: no previous prototype for function 'unregister_irqchip_proc' [-Wmissing-prototypes]
     335 | void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
         |             ^
   kernel/irq/proc.c:335:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     335 | void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
         | ^
         | static 
   2 warnings generated.


vim +/register_irqchip_proc +334 kernel/irq/proc.c

   333	
 > 334	void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
 > 335	void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
