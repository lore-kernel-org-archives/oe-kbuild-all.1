Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552E181ACD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786798565; cv=none; b=Bb5AtyqSQ3rrEJgrxyGfIghf42diC5ev8gZKSzD59mRzbIYG/jDGxZauoFxZ2pEH/nwyqYymZ1OiXlcbK7ZB2JgqRJdj+Qsp3hpdokQ0SI+DB2ct+KitOamxEtrl/uJAD1YHbFxhcwEAzAz7VwlrlTeZjtS0JO4jd4MH0sLOMf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786798565; c=relaxed/simple;
	bh=pHnRxtS41+8vW5gnw3V3kIhbZekFDtMBNwB9FGKGTMA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qiR92KihRJae8oVHJnPfxTALdW248LbnJpLK9g7A/wLFsHV8UuQKR1VaFhfuMgHuMSCW6D2m/+33HkvFiXl71ys1OlkVonhoYyuej32bWrT7sYiElI9jK9DtARIDeDR0PptzTgbTnn47ML/s8HQzf+9KslO+szJzX5Q7Z/cK9IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwpR50lI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwpR50lI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786798563; x=1818334563;
  h=date:from:to:cc:subject:message-id;
  bh=pHnRxtS41+8vW5gnw3V3kIhbZekFDtMBNwB9FGKGTMA=;
  b=fwpR50lIwK69d4eZvoyl3je0QcWvg9lSED7tMxtMWJq2N42JhORBCTJI
   /ArhypY32lnlo7MrcmjdKA4ItWa6pDjh0+WizqcCeUuT83R7sG0+C+iUR
   S4uIY1VKC7MM9J7rm/vWwVxZbEE6YlMufYSFVpqN1ws6GglMIK5BGsVSJ
   wJmHtPOS4ZG0FWQlc8bS0Zmgzg+dFTCa14pLzwB5bfMIwyjUT0fGzKhyy
   DyPSxuunxSUEpBPd5Zo278ubexi+2OVon4iMKhHzwCfyg3IZCZ0fhNc/+
   mwnmlpyspTSY52sBlW5Vg+Ua1UR/+c4SaTqSGscdw89l/uBYHbvaGzZaG
   w==;
X-CSE-ConnectionGUID: 2931AHfpTdiZkFkyf/fTOA==
X-CSE-MsgGUID: mMvoXhWhSVmOcidYR1l+aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87562636"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="87562636"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 05:56:03 -0700
X-CSE-ConnectionGUID: uqiaEfHiRX2TlX4Gng/Nyg==
X-CSE-MsgGUID: WP03HYpHTtan0SCEXwnVtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="261824159"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Aug 2026 05:56:01 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvDvb-000000006PZ-2FAr;
	Sat, 15 Aug 2026 12:55:59 +0000
Date: Sat, 15 Aug 2026 14:55:24 +0200
From: kernel test robot <lkp@intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./include/linux/cpufeature.h:30:33: error: 'ELF_PLATFORM'
 undeclared; did you mean 'AT_PLATFORM'?
Message-ID: <202608151415.UAbFbpvE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Petr-Pavlu/x86-Avoid-indirect-includes-through-linux-module-h-linux-elf-h/20260814-084615
head:   3ccb9a11d8a060198e89ba5c32b6f2fa54da6d89
commit: 3ccb9a11d8a060198e89ba5c32b6f2fa54da6d89 module: Limit ELF includes in linux/module.h to uapi/linux/elf.h
date:   2 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260815/202608151415.UAbFbpvE-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608151415.UAbFbpvE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151415.UAbFbpvE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/base/cpu.c:19:
   drivers/base/cpu.c: In function 'print_cpu_modalias':
>> ./include/linux/cpufeature.h:30:33: error: 'ELF_PLATFORM' undeclared (first use in this function); did you mean 'AT_PLATFORM'?
      30 | #define CPU_FEATURE_TYPEVAL     ELF_PLATFORM
         |                                 ^~~~~~~~~~~~
   drivers/base/cpu.c:368:30: note: in expansion of macro 'CPU_FEATURE_TYPEVAL'
     368 |                              CPU_FEATURE_TYPEVAL);
         |                              ^~~~~~~~~~~~~~~~~~~
   ./include/linux/cpufeature.h:30:33: note: each undeclared identifier is reported only once for each function it appears in
      30 | #define CPU_FEATURE_TYPEVAL     ELF_PLATFORM
         |                                 ^~~~~~~~~~~~
   drivers/base/cpu.c:368:30: note: in expansion of macro 'CPU_FEATURE_TYPEVAL'
     368 |                              CPU_FEATURE_TYPEVAL);
         |                              ^~~~~~~~~~~~~~~~~~~


vim +30 ./include/linux/cpufeature.h

67bad2fdb754dbe Ard Biesheuvel 2014-02-08  28  
67bad2fdb754dbe Ard Biesheuvel 2014-02-08  29  #ifndef CPU_FEATURE_TYPEVAL
67bad2fdb754dbe Ard Biesheuvel 2014-02-08 @30  #define CPU_FEATURE_TYPEVAL	ELF_PLATFORM
67bad2fdb754dbe Ard Biesheuvel 2014-02-08  31  #endif
67bad2fdb754dbe Ard Biesheuvel 2014-02-08  32  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
