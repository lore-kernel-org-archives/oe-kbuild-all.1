Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21ED79DB6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709496904; cv=none; b=LU/KNkFhvtDnVB07FgBlsIZ+HY6ID9HJxrDZFJiwk2kAw5uNs2oWAbi+PfTSBWWHm9zWG2rdqqHy5RrDJ2NoqaN94ZDugvp/IlNbhfwIQHlzorl3rlZhj7HcPM/36ExLU5JGoXFc3bM7i4E6HNc38GgfGbCVkKRYAG+mwAbhKyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709496904; c=relaxed/simple;
	bh=UH6Qi1N/fjYYP6/S5vIBOgsFAOPG6bmmYubIcI426KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sDPHFcrHGnjxKIBNJpcPiQgbN1Ra78LuFBFHbLwi7Au/QE9hIHbQtXxfcYM2OYtsgpbDO1t+ri5TZF0cnFTll2uBEYyoiFQGW7T0TcTApLXaNjnqwvBIYAU+1QI+6rFZQp18CuVPdmv2KxWNKK6NI6u1BXHr/1+nP0eSTrnB1hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TeLetd2a; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TeLetd2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709496903; x=1741032903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UH6Qi1N/fjYYP6/S5vIBOgsFAOPG6bmmYubIcI426KQ=;
  b=TeLetd2aeWEz1h4anpLK3qcf2NesUGwzghJkOC+iyzdMrGLFjcDuiZyU
   MjxnGRyJ3pjL5zG79LSzhr12CphMRRhVFGlL7hx7rnhoiWqB5hdhc67vz
   huqac12Lq8+ZF7ffkppfGoG7uI3kQRiX9PR7slEBH84Z3N6bZhOGChH8Q
   +fy9PAGnNczRq8v29AxWscwjGhzBiQnj5iR2/UTThTYi7gaEzc1GqSVc/
   +Atx6nebYyRWNmUd2cra9jUyaJaG0oqPfBukXypC/O52/5IexoH/zvFP9
   OOqNIHzVA6ji7ccsl59fRmnqJwCHkt3OBcbLRY3EDlN8RuAhn2SRyxrqh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7798020"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="7798020"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 12:15:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13436530"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2024 12:15:00 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgsEb-000256-3A;
	Sun, 03 Mar 2024 20:14:57 +0000
Date: Mon, 4 Mar 2024 04:14:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@elte.hu>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [cip:linux-4.19.y-cip-rt-rebase 75/29558] mm/page_alloc.c:295:30:
 warning: 'pa_lock' defined but not used
Message-ID: <202403040459.Oo1lt6T2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ingo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: d2ca13faf7cbc48696294f1f2819bce3311321ce [75/29558] mm: page_alloc: rt-friendly per-cpu pages
config: arc-randconfig-001-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040459.Oo1lt6T2-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040459.Oo1lt6T2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040459.Oo1lt6T2-lkp@intel.com/

All warnings (new ones prefixed by >>):

    7136 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:27: warning: comparison between two arrays [-Warray-compare]
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7138:9: note: in expansion of macro 'adj_init_size'
    7138 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7138:9: note: in expansion of macro 'adj_init_size'
    7138 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:41: warning: comparison between two arrays [-Warray-compare]
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7138:9: note: in expansion of macro 'adj_init_size'
    7138 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7138:9: note: in expansion of macro 'adj_init_size'
    7138 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:27: warning: comparison between two arrays [-Warray-compare]
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7139:9: note: in expansion of macro 'adj_init_size'
    7139 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7139:9: note: in expansion of macro 'adj_init_size'
    7139 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:41: warning: comparison between two arrays [-Warray-compare]
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7139:9: note: in expansion of macro 'adj_init_size'
    7139 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7139:9: note: in expansion of macro 'adj_init_size'
    7139 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:27: warning: comparison between two arrays [-Warray-compare]
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7140:9: note: in expansion of macro 'adj_init_size'
    7140 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7140:9: note: in expansion of macro 'adj_init_size'
    7140 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:41: warning: comparison between two arrays [-Warray-compare]
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7140:9: note: in expansion of macro 'adj_init_size'
    7140 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:41: note: use '&__start_rodata[0] < &_etext[0]' to compare the addresses
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7140:9: note: in expansion of macro 'adj_init_size'
    7140 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:27: warning: comparison between two arrays [-Warray-compare]
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7141:9: note: in expansion of macro 'adj_init_size'
    7141 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:27: note: use '&_sdata[0] <= &__start_rodata[0]' to compare the addresses
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7141:9: note: in expansion of macro 'adj_init_size'
    7141 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:41: warning: comparison between two arrays [-Warray-compare]
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7141:9: note: in expansion of macro 'adj_init_size'
    7141 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7132:41: note: use '&__start_rodata[0] < &_edata[0]' to compare the addresses
    7132 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7141:9: note: in expansion of macro 'adj_init_size'
    7141 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   In file included from mm/page_alloc.c:63:
   mm/page_alloc.c: At top level:
>> mm/page_alloc.c:295:30: warning: 'pa_lock' defined but not used [-Wunused-const-variable=]
     295 | static DEFINE_LOCAL_IRQ_LOCK(pa_lock);
         |                              ^~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~


vim +/pa_lock +295 mm/page_alloc.c

   294	
 > 295	static DEFINE_LOCAL_IRQ_LOCK(pa_lock);
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
