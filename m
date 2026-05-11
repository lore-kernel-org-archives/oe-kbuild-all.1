Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457004D2ED5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 19:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527801; cv=none; b=azXP94Y+ObUJwDOPvQwh+HkNqJGtnZpQBKMMJXNTQkXV3buhTsD57nw05lOonpOFtdshKn08tv5o7wuNA1bbg4NFq9/17/LnVLjs42nUYQT+x+w8a8om42tAmgBzXuTksLKaHz7Y15m5gA1YGkg4CaTMOR7y6lMn72BLqU/5lh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527801; c=relaxed/simple;
	bh=43xNrtRhsHBoBghcXEgBMGNvZ7Cnw7AOO8nRQm8V8D8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hGVSx8D9qL2uCjy7hiM6LapJ8iwAZW83aYotO6FCg0n8PXF8GWYd8wQQ4VUt8ws8VJC6kbkBVlV/8ytHC53swK8XvY4pKwUiyS3cU84lDKR3Ca+aT6IlK5fZjIzo08uKZ4rjJm9iiuRufu0KaK3ETcapr0CKJ/nXDZ9nYQEoFHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3yjrFUk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3yjrFUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778527800; x=1810063800;
  h=date:from:to:cc:subject:message-id;
  bh=43xNrtRhsHBoBghcXEgBMGNvZ7Cnw7AOO8nRQm8V8D8=;
  b=U3yjrFUkxYyv56axG70ubM+Vl6pWUDqcGyoZUrVmR8FSuGr4ImVgaBF6
   F9v7GSCEkIqMvsQCndnGmvT1n5ZOeoKgde7BBR1ODhdLx0VcO+sI9CrqJ
   10fx9iYSQ+/ulkwVeVZ/SXDiujAHlzdjtkms0FPR8RvvbTZCEEd3XpyWN
   z9+Jds2SFBXKsJXsAwjCqbQHUBZvQaxzf5+/35bq6Yo9EZKe7C+4nSKV7
   /nrPHS7oCU60ttK3koQmrnN2MAKi6FeyUln4Z4SmztIEPrwiP2IpkRE8m
   qgXM8mkX+x6TJQFe89ffgAAKJPvZ5JM3kZixQ5nc30hnIYwFc2iN2fNvg
   g==;
X-CSE-ConnectionGUID: UHo4v5sTQAC+VaqHJbQdIw==
X-CSE-MsgGUID: 6R+4SYrGTACChYUUqbqAXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78458766"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="78458766"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 12:29:57 -0700
X-CSE-ConnectionGUID: SADGSd4wRveqqb2BrnjyyQ==
X-CSE-MsgGUID: X8J393HbQKebBdFIU+ytjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="236569459"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 May 2026 12:29:56 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMWK9-0000000014T-1I8e;
	Mon, 11 May 2026 19:29:53 +0000
Date: Tue, 12 May 2026 03:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 15/16]
 drivers/pmdomain/apple/pmp-report.c:110:15: error: implicit declaration of
 function 'readq'; did you mean 'readb'?
Message-ID: <202605120326.bFExox8M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   ba55a7ab0f6380bbedb1480e837abed687c987dd
commit: 00391251260fe4beb75d9695b5061815126fff2d [15/16] pmdomain: apple: Add PMP reporting interface
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260512/202605120326.bFExox8M-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120326.bFExox8M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120326.bFExox8M-lkp@intel.com/

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
