Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883ED4A24
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 02:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147601; cv=none; b=YJlUs1vYeuh9qLnVQALAGg5xMc0igNJ1mNeJEhGeBj/rnQ6DIRZHpGOQc04+gK6C8MLw5Zh//wNNSE5jfnve3ehavfUA1lzhmOdcYTA1x6OfuivUhMs3xdyeEuUfqqzgQ27mrYzwPXbRlCR9GvaQWqQh1I2lVsEznBfhCLH9fj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147601; c=relaxed/simple;
	bh=iTj5fyQYM6tYGWBCavC7VJ5DW0CnD+Q6GSU07naHQ7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wygbl4N8C8gA3Y+L1KchyCznDOKrEmvg4OAfTlfNzmzCiU0y+WA3u7SvDD0v2lEv3s+3Gx58qs6HZ01Vw2ocyk6KicpaC06ic5R0Vi1coGE3Z9LGheaxzKCsKIInugsM+M7voGHlUYNGcFEustW5YDakbilTdnu9GSfFbglIYcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=db68qoBr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="db68qoBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713147600; x=1744683600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTj5fyQYM6tYGWBCavC7VJ5DW0CnD+Q6GSU07naHQ7w=;
  b=db68qoBr5y6tUAGUWHhzP6jPdQwy3VQ0ZXrseY6o35Z59MgjjKkZBqi4
   ne0vSH/YvyTulOs/f8KLW841NCGAK2pDHxsqdVUd1Ub5QiuFEpufr/+Ys
   sfv1C7+UdO1dQpPGTXJ9eu/hepkPmZIuAQdaliHGqbE6Ovkw4MVKcV62K
   hus+cqC7Zl98D6qbgiub048pq5d7V0narHdFzUrIWNfOZpmgGZpCjOgDi
   /vdaGvlFWzBu2SBPOd92yWkKRU8je4owHeJmgIrwTVl6b73HXJsiAmNPc
   aQpSFYwq8d64E13ZEGc3IsOl/iU82+pJ4AWvafK0WIB+cvehGToNMe2AL
   g==;
X-CSE-ConnectionGUID: za1Ikb7jQ06ywchqlXNIjw==
X-CSE-MsgGUID: bxJpRtA4SXWnaRT2xlLQIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8435878"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8435878"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 19:20:00 -0700
X-CSE-ConnectionGUID: DqoxnK6fT96IWquV1VfxFg==
X-CSE-MsgGUID: Wxpow6jQTfqxXPWoOhqFCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="52958808"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Apr 2024 19:19:57 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwBvN-0003ug-03;
	Mon, 15 Apr 2024 02:18:56 +0000
Date: Mon, 15 Apr 2024 10:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6009/6010] vmscan.c:(.text+0x6118): dangerous
 relocation: unsupported relocation
Message-ID: <202404151057.8GwgSUrU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
commit: 60872a66c0e59515ec40ac418b2320942173cb11 [6009/6010] fixup for "mm: swap: introduce swap_free_nr() for batched swap_free()"
config: arm64-randconfig-r034-20211222 (https://download.01.org/0day-ci/archive/20240415/202404151057.8GwgSUrU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404151057.8GwgSUrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404151057.8GwgSUrU-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: mm/vmscan.o: in function `shrink_folio_list':
   vmscan.c:(.text+0x6118): undefined reference to `mthp_stats'
   aarch64-linux-ld: mm/vmscan.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `mthp_stats' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> vmscan.c:(.text+0x6118): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: vmscan.c:(.text+0x6120): undefined reference to `mthp_stats'
   aarch64-linux-ld: mm/memory.o: in function `alloc_anon_folio':
   memory.c:(.text+0xb238): undefined reference to `mthp_stats'
   aarch64-linux-ld: mm/memory.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `mthp_stats' which may bind externally can not be used when making a shared object; recompile with -fPIC
   memory.c:(.text+0xb238): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: memory.c:(.text+0xb438): undefined reference to `mthp_stats'
   aarch64-linux-ld: memory.c:(.text+0xb4d0): undefined reference to `mthp_stats'
   aarch64-linux-ld: mm/memory.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `mthp_stats' which may bind externally can not be used when making a shared object; recompile with -fPIC
   memory.c:(.text+0xb4d0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: mm/memory.o:memory.c:(.text+0xb4dc): more undefined references to `mthp_stats' follow
   aarch64-linux-ld: mm/huge_memory.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `mthp_stats' which may bind externally can not be used when making a shared object; recompile with -fPIC
   mm/huge_memory.o: in function `do_huge_pmd_anonymous_page':
>> huge_memory.c:(.text+0x3780): dangerous relocation: unsupported relocation
   aarch64-linux-ld: mm/huge_memory.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `mthp_stats' which may bind externally can not be used when making a shared object; recompile with -fPIC
   huge_memory.c:(.text+0x3990): dangerous relocation: unsupported relocation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
