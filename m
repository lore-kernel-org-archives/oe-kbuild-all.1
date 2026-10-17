Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8006937DAC2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792247676; cv=none; b=iW8Q3cNhRYLfifY+9TsAuQf/zW7aZ79m9xvoWKirM9Cvz9S1YTftRF6AEg5iHhiZPEppphO9c6OUqy2OYJo1tpBQef2hgNi/cXvI+NvLyRzT8NoF4LuRHH/dsZS6aWQdE74wejIhyZ+924hnuDQmv0PxW7AYeJauneIDBC9+xWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792247676; c=relaxed/simple;
	bh=vvnwZDNYwNMGKlSZBipdTZ3pt4o1J1uBx4LHN1IALaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LPdLduiMYkBAODiASE+D8Hm3ZB4e4LsFwlRrXOtp3x6traGXl/GqkpDcIChRBm5YwX3YrfgZPFa5SFoqW/shjtzgaqwvS25fR1e8E1fIJbIpEO1GOs9gXqmbA+ZBJfDhO+KsuaevHniZha4Zxenmiw1YQXiaKJfi/e1jtT3kCpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7d7f/lH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7d7f/lH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792247673; x=1823783673;
  h=date:from:to:cc:subject:message-id;
  bh=vvnwZDNYwNMGKlSZBipdTZ3pt4o1J1uBx4LHN1IALaY=;
  b=E7d7f/lHvkcnnD1+htR33ulK+ZxBPmpD6LoUmeqPa74LIZzc9c5eHiRq
   s8bWuXPrtUaV3m8uGQy6ZaCioDmDEY0qXZ9vNFoa4uHFsEngrV8hLjZbN
   HalYGvIV9OfxIijDTQpmdjk0aPLcDuyNO/j9KJ9WSZOnKI6ftFZZ8hLJ8
   L80CM7RGd/KsGJNC0KFHdruLHXRj0aMrXVFug8BvDauXxLPS6P4/9eCHF
   uM6H3DEIM+huA/l05F8KvpsHkmaP1FIkvUocgeJAxZ82gkkclea3lpPMa
   HSdTEpJ01lGu0vdTjyagKUjd5esG896c0I0jAZlmIDWocE3Tw36dpKOwf
   A==;
X-CSE-ConnectionGUID: ZDZG/2dHQ7Cvyz79h004ig==
X-CSE-MsgGUID: 73BjyoPwSUu1kprih7LjCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1017941"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1017941"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 07:34:33 -0700
X-CSE-ConnectionGUID: eAyRmkUITLyjfwyLRZtqUw==
X-CSE-MsgGUID: 0cKCusF8SdGug6X/r9lI7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2227237"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Oct 2026 07:34:31 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI5US-00000000JQ2-3RGy;
	Sat, 17 Oct 2026 14:34:28 +0000
Date: Sat, 17 Oct 2026 22:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 14/19]
 drivers/pmdomain/apple/pmp-report.c:110:15: error: implicit declaration of
 function 'readq'; did you mean 'readb'?
Message-ID: <202610172213.KNNz2YQc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   d6636aea14e70b5b997df5681ff9d254d9e75209
commit: 96151d95c16448107904d1e4855e34c206167336 [14/19] pmdomain: apple: Add PMP reporting interface
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20261017/202610172213.KNNz2YQc-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610172213.KNNz2YQc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610172213.KNNz2YQc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pmdomain/apple/pmp-report.c: In function 'apple_pmp_report_set_state':
>> drivers/pmdomain/apple/pmp-report.c:110:15: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Wimplicit-function-declaration]
     110 |         val = readq(rep->base + rep->offsets->tgt_read);
         |               ^~~~~
         |               readb
   drivers/pmdomain/apple/pmp-report.c:114:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Wimplicit-function-declaration]
     114 |         writeq(val, rep->base + rep->offsets->tgt_write);
         |         ^~~~~~
         |         writeb


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
   114		writeq(val, rep->base + rep->offsets->tgt_write);
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
