Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0AC153800
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 19:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741980980; cv=none; b=JbPEomTSfEHJHxshEITfMEnUUKh8dqm3yvgBeeessu+Oj+PTBp2/8tYTmSfgMdd6il90A6tU+OajdaT2PuT3My+Yew7r48AY0jROSDL8o+U6VZVT3XSFuxCjCLQ5eXnvOdU0L9vzza3XPcsAnfDHZEMOPe3G2PrJIbD8wOppUis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741980980; c=relaxed/simple;
	bh=VonAAdNdfeQLT3xhnkwL6RV6iqr3RL//bYp0uqHgREE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S2Mg+OP3aTIJKRB2wekuSpV8zIis5bXvOSoW6X9lZu6AuXgNehO/AeTrAgVoqOFX/LCKpIXcwlALinZPRGRR3G3wiJmJbfFsliMc5GMBH2NwPwwJS6VTqsqG9j5V+W1bCvgQ0DmWOB05UaKfyqv/dSbahygKN3JyUAgPiV/C4Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRdsQsuW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRdsQsuW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741980978; x=1773516978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VonAAdNdfeQLT3xhnkwL6RV6iqr3RL//bYp0uqHgREE=;
  b=aRdsQsuWWPucvb1o2rbnPz6Rs95au9u6YyyvfoaurABTD+d/QsL1r0F2
   /5w3XKIu0QVS31CDXS0MzCRtp2YGnrccagz16+3GYikv+bnuvmO+IGRdm
   rbM8w5ISbleT7+RMltgL4iqAgPsu+IV0d8X+uSAOxoe3xH9RRa3mGCWnM
   R2x16zTNtPAoWPpnsPdcUdzTcqubXc0tpSVtmay2MmsAZo1JZ/5i/8Eh7
   yle0pdD1ZPqoXe1xOyyZfawlcACDl8rhCgM1yS7QJYgx6Y5ShVrpPihCq
   tct1qSWqAm0IiTzLKlLgr+EJBqTuuvRZ8hfjRms5Ut4ROPbGidd7bqFy/
   w==;
X-CSE-ConnectionGUID: cLM+8CJhRqW3YgyWq2a2MA==
X-CSE-MsgGUID: 6Pcb6jilTHWmoq+3udyL2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="45910829"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="45910829"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 12:36:14 -0700
X-CSE-ConnectionGUID: xn5c4TfHTDWq2A5pnmmpAg==
X-CSE-MsgGUID: 1mvT66tUSuyjBuNtliJ8IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126420072"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 Mar 2025 12:36:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttApH-000Am8-0I;
	Fri, 14 Mar 2025 19:36:11 +0000
Date: Sat, 15 Mar 2025 03:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 157/159]
 drivers/char/random.c:602:undefined reference to `__aeabi_uldivmod'
Message-ID: <202503150334.MA6gtlGK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   a09496a03e63d3d98c399b28d4889bbaebd1761e
commit: a888eae7549b5515b25ca0846d4b39f1195a3020 [157/159] bcachefs: kill bch2_get_random_u64_below()
config: arm-randconfig-004-20250315 (https://download.01.org/0day-ci/archive/20250315/202503150334.MA6gtlGK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503150334.MA6gtlGK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503150334.MA6gtlGK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/char/random.o: in function `__get_random_u64_below':
>> drivers/char/random.c:602:(.text+0xc70): undefined reference to `__aeabi_uldivmod'


vim +602 drivers/char/random.c

e9a688bcb193488 Jason A. Donenfeld 2022-10-08  590  
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  591  u64 __get_random_u64_below(u64 ceil)
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  592  {
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  593  	if (unlikely(!ceil))
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  594  		return get_random_u64();
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  595  	if (ceil <= U32_MAX)
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  596  		return __get_random_u32_below(ceil);
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  597  
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  598  	u64 rand = get_random_u64();
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  599  	u64 mult = ceil * rand;
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  600  
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  601  	if (unlikely(mult < ceil)) {
8511d47d2b5a1d4 Kent Overstreet    2025-03-13 @602  		u64 bound = -ceil % ceil;
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  603  		while (unlikely(mult < bound)) {
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  604  			rand = get_random_u64();
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  605  			mult = ceil * rand;
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  606  		}
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  607  	}
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  608  
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  609  	return mul_u64_u64_shr(ceil, rand, 64);
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  610  }
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  611  EXPORT_SYMBOL(__get_random_u64_below);
8511d47d2b5a1d4 Kent Overstreet    2025-03-13  612  

:::::: The code at line 602 was first introduced by commit
:::::: 8511d47d2b5a1d421bf69931c84c60f5c4c6e982 random: get_random_u64_below()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
