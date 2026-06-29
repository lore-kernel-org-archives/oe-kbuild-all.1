Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55993B27C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 20:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766801; cv=none; b=u7lqMLeLnU8dQ712z+zFlIjX5H0wuNwpnAL6frVj1cCz8aEZ3YXBxLx4A76ZjrePiurHAydzijAMWeNjtZLTjAg1Znxd2ME4/ysMduDGS+YkswAVKPqM1eCsl0WAQLTGqNNzb8X37cTlyMQb0vEDpeMcu0URU9n0Ibsi1LMk6NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766801; c=relaxed/simple;
	bh=4sPXKK+t2Du9ot3CAbJNf5avblyAduuBEnO40q+weNQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UvSZEWFvz00ayXgNKS7tQR2WvsWNGCsjBLumfdvIuBWKgJqfpzckazPWhPwki+Sctou+G6G1O/K7jJM2b5kE0SpypK682w0odcnmBdXh/1AOJOIFuDJ18NdLed2W5DMm/kn7LHYkKS5wisM10Z/DfTPjAW/9aY1+x6JQuJzu41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2WvFNQE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2WvFNQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782766796; x=1814302796;
  h=date:from:to:cc:subject:message-id;
  bh=4sPXKK+t2Du9ot3CAbJNf5avblyAduuBEnO40q+weNQ=;
  b=k2WvFNQERC58X7FiPjVFVTufbVyUsXh1PhSwrOJiAG5TLYJpPmEUQPiu
   oKxV0U1T0eYIvE6eaHYi6xDsu09ERw43jr1JKFWosJeVjssidtxKHN7vo
   WXm5FrEZ/ivHGGOLpOEtD2khfdBe1BnhgOmzfuacoNc0ZexfZnDarJtZy
   ScLMlQnqqfiOGghkNTGJc/fUmNaXf7JK3veO7hfEbJmwUKvfZ0LIQO0PU
   GTI8zftJoiyxkOR7Iyenv+aRAlgJ3SMAOtdTv4HFZfSq1n65OdbNSm+ln
   iF2gUUxZYEBIE+0lb4aJ/uttmge1e/rrav6HiR0rw0Xr3ZwIgbmQWRh1B
   Q==;
X-CSE-ConnectionGUID: 3NjqwvQ+RpCzsBBpDb4J9g==
X-CSE-MsgGUID: rnGGp9YUR2KBS4qdFJPadg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83670402"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83670402"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 13:59:55 -0700
X-CSE-ConnectionGUID: dwRKa7GASLeVAiBDaR9S9Q==
X-CSE-MsgGUID: UlbUqHO8TnuNXWIxHCGuyw==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="250371892"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Jun 2026 13:59:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weJ53-000000007kv-2WRT;
	Mon, 29 Jun 2026 20:59:49 +0000
Date: Tue, 30 Jun 2026 04:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 14/15]
 drivers/pmdomain/apple/pmp-report.c:110:15: error: implicit declaration of
 function 'readq'; did you mean 'readl'?
Message-ID: <202606300422.dQH6dF2f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   a747aa2ebd844e3946a05eb54c91161253d7fcac
commit: e5f8c27073d6449fa54d219f67f47d30d2bf92a4 [14/15] pmdomain: apple: Add PMP reporting interface
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260630/202606300422.dQH6dF2f-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300422.dQH6dF2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300422.dQH6dF2f-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pmdomain/apple/pmp-report.c: In function 'apple_pmp_report_set_state':
>> drivers/pmdomain/apple/pmp-report.c:110:15: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Wimplicit-function-declaration]
     110 |         val = readq(rep->base + rep->offsets->tgt_read);
         |               ^~~~~
         |               readl
>> drivers/pmdomain/apple/pmp-report.c:114:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Wimplicit-function-declaration]
     114 |         writeq(val, rep->base + rep->offsets->tgt_write);
         |         ^~~~~~
         |         writel


vim +110 drivers/pmdomain/apple/pmp-report.c

    97	
    98	#define genpd_to_apple_pmp_report_entry(_genpd) \
    99		container_of(_genpd, struct apple_pmp_report_entry, genpd)
   100	
   101	static int apple_pmp_report_set_state(struct generic_pm_domain *genpd, bool enable)
   102	{
   103		struct apple_pmp_report_entry *ent = genpd_to_apple_pmp_report_entry(genpd);
   104		struct apple_pmp_report *rep = dev_get_drvdata(ent->dev->parent);
   105		u64 bit_val = 1 << ent->id;
   106		u64 val;
   107		unsigned long flags;
   108	
   109		spin_lock_irqsave(&rep->lock, flags);
 > 110		val = readq(rep->base + rep->offsets->tgt_read);
   111		val &= ~bit_val;
   112		if (enable)
   113			val |= bit_val;
 > 114		writeq(val, rep->base + rep->offsets->tgt_write);
   115		spin_unlock_irqrestore(&rep->lock, flags);
   116		val = readq(rep->base + rep->offsets->status);
   117		if ((val & PMP_REPORT_READY) == 0)
   118			return 0;
   119		return readq_poll_timeout_atomic(
   120			rep->base + rep->offsets->actual,
   121			val,
   122			!!(val & bit_val) == !!enable,
   123			100,
   124			50000);
   125	}
   126	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
