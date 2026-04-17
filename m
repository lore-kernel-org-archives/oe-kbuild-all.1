Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBABF2E1F0E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 22:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776466220; cv=none; b=Too85xDSfzStgu34LXMJ52Qkfpm1nIuQi0pvoqc3xNHuPlcJFwLacAK5kACe/Un6/g6X0qAFlvfRhx42XqTMLBnjfe9nQMi/gi2aJt5WNYPbK/xsAJH8h/xacS4sRb2mngdNBAuG8gMDMuaqhOlEwYXJDPCcvstjmKY5JKWmPo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776466220; c=relaxed/simple;
	bh=hHvv2GiEPtcZe/UnTM4XRYJIpxg6YxYDCA63iXJUYNw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UVX1APAqyFapwuPJSCjUlzPlw4UUPc2mmE6rDf9xqB/MTtxeXz3YvVzBi5gGGX165rCnTi0P6GiJdCm3GrFi0Nyrt/80cJM3D2xno9keAfg39SiKAfJt3TE3FEhR0cOmd2TEr+SINInpOesBeJVFbkirpB/u1M78V8psf41YkNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwsBovMU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwsBovMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776466219; x=1808002219;
  h=date:from:to:cc:subject:message-id;
  bh=hHvv2GiEPtcZe/UnTM4XRYJIpxg6YxYDCA63iXJUYNw=;
  b=IwsBovMUBQzFonnALwo9TYEJUtDoB5gg5DaOxDLDJw04pyM3g0BuOdOO
   iXTyka27X6/UL0IA1gmFtgdr0WKaCJMeZYcWQXW3DL8+krv4GvLbBOkvv
   1mXlPU7CMC9AnAl/5PlalSG2pbKAUfERGlGGPPb2cBbSJiXECrUXD8baV
   FLuwzJ4vbkbq+ZDjR2gLfeWvdGH3YYqaj5j+mb31OQ3nJ9FnLxpDhlK6s
   cir0JKEr1nBRQf/2QhhovC344jH5STJnk40+XBB8iq7pnrpbYLnrggVII
   6KWcizwW9uRQ2ZEY6SrlO21wTJtmU3C4pG14wjNA8hLI3MePZSrKFuqs1
   g==;
X-CSE-ConnectionGUID: iNlIHKz7QlyNbcS6pDxgCA==
X-CSE-MsgGUID: 5lGVJa3xRYu22SBZtHatwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77359611"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="77359611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 15:50:18 -0700
X-CSE-ConnectionGUID: pZ3otHlAR5W1OTLJZjz4gA==
X-CSE-MsgGUID: SdPGWzpSRlK2xi2qEZD6vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="269179123"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Apr 2026 15:50:17 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDs0s-000000000mK-2sS0;
	Fri, 17 Apr 2026 22:50:14 +0000
Date: Sat, 18 Apr 2026 06:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/030-misc 16/19]
 drivers/pmdomain/apple/pmp-report.c:110:15: error: implicit declaration of
 function 'readq'; did you mean 'readb'?
Message-ID: <202604180625.ywHUT4OE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   ecad9364496d64ceef9ab8ef75ab398aba04781c
commit: a8b95484d350f450be09475771bd0e17b45d14a6 [16/19] fixup! pmdomain: apple: Add PMP reporting interface
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260418/202604180625.ywHUT4OE-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604180625.ywHUT4OE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604180625.ywHUT4OE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pmdomain/apple/pmp-report.c: In function 'apple_pmp_report_set_state':
>> drivers/pmdomain/apple/pmp-report.c:110:15: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Wimplicit-function-declaration]
     110 |         val = readq(rep->base + rep->offsets->tgt_read);
         |               ^~~~~
         |               readb
>> drivers/pmdomain/apple/pmp-report.c:114:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Wimplicit-function-declaration]
     114 |         writeq(val, rep->base + rep->offsets->tgt_write);
         |         ^~~~~~
         |         writeb


vim +110 drivers/pmdomain/apple/pmp-report.c

eacc31ac28ce640 Sasha Finkelstein 2026-02-26   97  
eacc31ac28ce640 Sasha Finkelstein 2026-02-26   98  #define genpd_to_apple_pmp_report_entry(_genpd) \
eacc31ac28ce640 Sasha Finkelstein 2026-02-26   99  	container_of(_genpd, struct apple_pmp_report_entry, genpd)
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  100  
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  101  static int apple_pmp_report_set_state(struct generic_pm_domain *genpd, bool enable)
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  102  {
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  103  	struct apple_pmp_report_entry *ent = genpd_to_apple_pmp_report_entry(genpd);
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  104  	struct apple_pmp_report *rep = dev_get_drvdata(ent->dev->parent);
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  105  	u64 bit_val = 1 << ent->id;
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  106  	u64 val;
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  107  	unsigned long flags;
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  108  
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  109  	spin_lock_irqsave(&rep->lock, flags);
eacc31ac28ce640 Sasha Finkelstein 2026-02-26 @110  	val = readq(rep->base + rep->offsets->tgt_read);
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  111  	val &= ~bit_val;
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  112  	if (enable)
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  113  		val |= bit_val;
eacc31ac28ce640 Sasha Finkelstein 2026-02-26 @114  	writeq(val, rep->base + rep->offsets->tgt_write);
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  115  	spin_unlock_irqrestore(&rep->lock, flags);
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  116  	val = readq(rep->base + rep->offsets->status);
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  117  	if ((val & PMP_REPORT_READY) == 0)
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  118  		return 0;
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  119  	return readq_poll_timeout_atomic(
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  120  		rep->base + rep->offsets->actual,
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  121  		val,
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  122  		!!(val & bit_val) == !!enable,
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  123  		100,
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  124  		50000);
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  125  }
eacc31ac28ce640 Sasha Finkelstein 2026-02-26  126  

:::::: The code at line 110 was first introduced by commit
:::::: eacc31ac28ce640ad7a8b288c7600a72a0cf872d pmdomain: apple: Add PMP reporting interface

:::::: TO: Sasha Finkelstein <fnkl.kernel@gmail.com>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
