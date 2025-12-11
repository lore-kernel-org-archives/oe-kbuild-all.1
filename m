Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772921FF1B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 03:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765422453; cv=none; b=bqp/fxwofakyKN8uh9l2Zn2s4siHstJFJ4rUdUCRf8g4h+Pl9XupGlr5xaDwdCC5zai7+m9Rgjko6KgieZbNtFbWkTatUVFBuT6Sj8lx5fcIKg79S95q8sF1liDYIaSB07y49Isrm/8nl/Wy0xElT4qTOwa+s7NFUej552bACUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765422453; c=relaxed/simple;
	bh=/jvdg0ebw5NikamhdaZHwYk5mjdJYuwqMGO4uSL/kJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f4wkbBdUMBNsCdOOlua2dAQYRjQuZmZxoIaMPRZ04MQGQ9KQt0AoRKRknz8Brlb8nyEVcFaqDKZRZQbr8YkZGripnJYYdFGYbr3okTo/UT2g9IlPgvD6QIIIWt80mJjeVo09XfwlPmZoPEL3lctqvKyQAnTyLn7gNvKyQ2k0LkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KN9zZDkQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KN9zZDkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765422451; x=1796958451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/jvdg0ebw5NikamhdaZHwYk5mjdJYuwqMGO4uSL/kJE=;
  b=KN9zZDkQ5ZXQPwCOeQS1aAMT/f1UKL9PlDketp3kiOBk/+Zm6kTFOfwg
   KlSXvkAzNvVSJtZiaSjwWVoF4q50e7tmX4+f669J1oCHLgNENzx58ppgD
   I376cYZvMaKy6l4RRarAkYclit9pHIIErVB4f7qH9N/aC4frVABGXR6j+
   A6LERdXvivXfr5XaaoyZ9DE5LfapnlEBbTTDLHOwBIpTk6KCChj3uotd8
   1fJ/QORZCa8ZxjMXFAxbkHiCMbpuuvp5SyPZoww3xQ+Un6lOU7wiZSc6a
   V18WqPzNyZP6lk962XVJTeAnKXwCLK36pN3nUG8m1IfxkbMbyNE4atOuk
   Q==;
X-CSE-ConnectionGUID: 4161/DH4TqaHw1R0dXI06Q==
X-CSE-MsgGUID: Elf0LYu3Q3W2kPQAzZMWPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67337972"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67337972"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:07:31 -0800
X-CSE-ConnectionGUID: OkUmW2+DR8OjOmVk+2C++g==
X-CSE-MsgGUID: nkIZJaivQyyYGN35+wni7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201605498"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2025 19:07:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTX1b-0000000045X-1v3w;
	Thu, 11 Dec 2025 03:07:27 +0000
Date: Thu, 11 Dec 2025 11:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] kernel/irq/proc.c:334:13: warning: no
 previous prototype for function 'register_irqchip_proc'
Message-ID: <202512111142.MddOammZ-lkp@intel.com>
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
head:   423fccda72fc2b78107cc119a1755d968c2c36de
commit: 3053668e6b211924bb67c19d791a5a532eca2ad8 [3534/3534] arm64: Introduce Xint software solution
config: x86_64-randconfig-013-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111142.MddOammZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111142.MddOammZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111142.MddOammZ-lkp@intel.com/

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
