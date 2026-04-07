Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A134F255
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534684; cv=none; b=qnpb3gBzuCG5aQxz3WgOv+Rn0Klr/v/dat6LRIgNoMNY+5a0YWwsvj+Ib0TyQ0yNAsiVEWTJ2ttpD8mgo46BQYO/4ImcL8hA3yuJwwv1BdtvWh8IjHUUC5dFD8ucR/9C26Snn+XDLjlOPGqsSwrT67wK+X7gDfDv0L8OkFRT3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534684; c=relaxed/simple;
	bh=wU8TSxoliUeDKmAQ+dZO3DnsII3TGmUzBKDsYnTwO9s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MoQYYoxYG0H9d6Mjk1GZtMbgltD+qGd/WhnSEoT/LgHxOlvFxArX3bFYKwl9pHPZGG8dvklVll6tHY++AzwBoO/2w55h+gt9nLcS8Ks1kGbdNuSG9PR4qZ5CIQCwngYNsMT4pCMbuhcIQF4lXA3S7NIw+C0GOsChLCYeVwAFH7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxvhHV1u; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxvhHV1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534681; x=1807070681;
  h=date:from:to:cc:subject:message-id;
  bh=wU8TSxoliUeDKmAQ+dZO3DnsII3TGmUzBKDsYnTwO9s=;
  b=HxvhHV1uZnsc0eAZIUZvI9dzaPOcKUP0NoXDjmvtmDp93QJlJOwoUNYQ
   tAbneuVkS3vwo/68qrxMtHW/7YFAsHDNWOt3VCZ2AzNqHKxJpO9gFVXOB
   eqjYIQ8rrPoeSot3m+Up8Fx2qrclfyN8e8bMwOWJOy9N6MCX8/lL/lYZ/
   lgcz3SkIxGhvH2Db5ZqedTMNRLY/ofE0iUO1i6VD3lixfjbcCTreDfqk8
   vx5QQ6G7bW89//5eZHEA6S+KHILDmT4AUQL5wgTtNIcy8I9qP99sUBv4J
   nhCGCE1WhcqPIutAHQlUKFSoUdSm+/nlgyRdLZQhSoj7a3WF2i+yt7h85
   A==;
X-CSE-ConnectionGUID: i8xbs0ynRXO+93gHPCJlhg==
X-CSE-MsgGUID: w9sB53H5TC2oQPuOtxMNGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87193708"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87193708"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:04:38 -0700
X-CSE-ConnectionGUID: 3o9GadrWR468yrgYUki8Fg==
X-CSE-MsgGUID: XAsObtb/Sx+RVAMLFp+GUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="228319736"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2026 21:04:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xg2-0000000009X-1Knu;
	Tue, 07 Apr 2026 04:04:34 +0000
Date: Tue, 07 Apr 2026 12:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.19/zen-sauce 5/34]
 drivers/firmware/cirrus/cs_dsp.c:482:17: warning: '%s' directive argument is
 null
Message-ID: <202604071142.RhClLmzJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.19/zen-sauce
head:   d17b2b02b5cf029f5248299f56e4a0a041548604
commit: aa767d280d5a9850a20bab35ac409635eb8f5cc0 [5/34] ZEN: Restore CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3
config: m68k-randconfig-r051-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071142.RhClLmzJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071142.RhClLmzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071142.RhClLmzJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/cirrus/cs_dsp.c: In function 'cs_dsp_debugfs_read_controls_show':
>> drivers/firmware/cirrus/cs_dsp.c:482:17: warning: '%s' directive argument is null [-Wformat-overflow=]
     482 |                 seq_printf(s, "%22.*s: %#8x %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     483 |                            ctl->subname_len, ctl->subname, ctl->len,
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     484 |                            cs_dsp_mem_region_name(ctl->alg_region.type),
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     485 |                            ctl->offset, reg, ctl->fw_name, ctl->alg_region.alg, ctl->type,
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     486 |                            ctl->flags & WMFW_CTL_FLAG_VOLATILE ? 'V' : '-',
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     487 |                            ctl->flags & WMFW_CTL_FLAG_SYS ? 'S' : '-',
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     488 |                            ctl->flags & WMFW_CTL_FLAG_READABLE ? 'R' : '-',
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     489 |                            ctl->flags & WMFW_CTL_FLAG_WRITEABLE ? 'W' : '-',
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     490 |                            ctl->enabled ? "enabled" : "disabled",
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     491 |                            ctl->set ? "dirty" : "clean");
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +482 drivers/firmware/cirrus/cs_dsp.c

f6bc909e7673c3 Simon Trimmer      2021-09-13  468  
7a3f924cee4bdf Simon Trimmer      2023-03-28  469  static int cs_dsp_coeff_base_reg(struct cs_dsp_coeff_ctl *ctl, unsigned int *reg,
7a3f924cee4bdf Simon Trimmer      2023-03-28  470  				 unsigned int off);
7a3f924cee4bdf Simon Trimmer      2023-03-28  471  
7a3f924cee4bdf Simon Trimmer      2023-03-28  472  static int cs_dsp_debugfs_read_controls_show(struct seq_file *s, void *ignored)
7a3f924cee4bdf Simon Trimmer      2023-03-28  473  {
7a3f924cee4bdf Simon Trimmer      2023-03-28  474  	struct cs_dsp *dsp = s->private;
7a3f924cee4bdf Simon Trimmer      2023-03-28  475  	struct cs_dsp_coeff_ctl *ctl;
7a3f924cee4bdf Simon Trimmer      2023-03-28  476  	unsigned int reg;
7a3f924cee4bdf Simon Trimmer      2023-03-28  477  
ed6e90cb9fe53a Richard Fitzgerald 2025-11-27  478  	guard(mutex)(&dsp->pwr_lock);
ed6e90cb9fe53a Richard Fitzgerald 2025-11-27  479  
7a3f924cee4bdf Simon Trimmer      2023-03-28  480  	list_for_each_entry(ctl, &dsp->ctl_list, list) {
7a3f924cee4bdf Simon Trimmer      2023-03-28  481  		cs_dsp_coeff_base_reg(ctl, &reg, 0);
7584edf15892e2 Richard Fitzgerald 2025-11-24 @482  		seq_printf(s, "%22.*s: %#8x %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
7a3f924cee4bdf Simon Trimmer      2023-03-28  483  			   ctl->subname_len, ctl->subname, ctl->len,
7a3f924cee4bdf Simon Trimmer      2023-03-28  484  			   cs_dsp_mem_region_name(ctl->alg_region.type),
7a3f924cee4bdf Simon Trimmer      2023-03-28  485  			   ctl->offset, reg, ctl->fw_name, ctl->alg_region.alg, ctl->type,
7a3f924cee4bdf Simon Trimmer      2023-03-28  486  			   ctl->flags & WMFW_CTL_FLAG_VOLATILE ? 'V' : '-',
7a3f924cee4bdf Simon Trimmer      2023-03-28  487  			   ctl->flags & WMFW_CTL_FLAG_SYS ? 'S' : '-',
7a3f924cee4bdf Simon Trimmer      2023-03-28  488  			   ctl->flags & WMFW_CTL_FLAG_READABLE ? 'R' : '-',
7a3f924cee4bdf Simon Trimmer      2023-03-28  489  			   ctl->flags & WMFW_CTL_FLAG_WRITEABLE ? 'W' : '-',
7a3f924cee4bdf Simon Trimmer      2023-03-28  490  			   ctl->enabled ? "enabled" : "disabled",
7a3f924cee4bdf Simon Trimmer      2023-03-28  491  			   ctl->set ? "dirty" : "clean");
7a3f924cee4bdf Simon Trimmer      2023-03-28  492  	}
7a3f924cee4bdf Simon Trimmer      2023-03-28  493  
7a3f924cee4bdf Simon Trimmer      2023-03-28  494  	return 0;
7a3f924cee4bdf Simon Trimmer      2023-03-28  495  }
7a3f924cee4bdf Simon Trimmer      2023-03-28  496  DEFINE_SHOW_ATTRIBUTE(cs_dsp_debugfs_read_controls);
7a3f924cee4bdf Simon Trimmer      2023-03-28  497  

:::::: The code at line 482 was first introduced by commit
:::::: 7584edf15892e29190b2145294cc1680aa142586 firmware: cs_dsp: Store control length as 32-bit

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
