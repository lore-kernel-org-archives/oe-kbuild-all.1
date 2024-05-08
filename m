Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C929441
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 01:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715133544; cv=none; b=ZkevKpATaPWIRl1gEPwZVJhPhiLC8Foi6yfxGebj9yx47LhAbyLEy54Xxywh/bpFnopv2GwAl4YFb2d+z8lb6YV/8zYNgNICCb3zHoZEu4DRk8h61I8+k8bbNDUJugxEwkzCuuiXb/9rQBjZbJdIBKhwh+z9ondN2Dx8+t5aRMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715133544; c=relaxed/simple;
	bh=lwZIs6CzSxO5Tr1++vZd4auE5LaEKUQlwHfL7lc3r4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wn4HNjtTayeETFBbUQLZ68VCIOWrqTJVZYKfZjUAxUi+336l+/UAEy2Tm7nIzFVzl/nD3HZVIka+dC++A3WwJhvi/gFfrWZTyTxtRPhM1QmUBrYgizBk98SAde/6oNgFZCngqkEpou4pUZtCA9fbqyqra0wGoC5CEb0XXlScjUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmFVA3Xy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmFVA3Xy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715133541; x=1746669541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lwZIs6CzSxO5Tr1++vZd4auE5LaEKUQlwHfL7lc3r4k=;
  b=PmFVA3XySTF4RmFrOZCf+wDLIUaPjNMU7O+r+Vr7XMsb0QWbYYygVesm
   lt6HmNQS8oaXINoEBvJ1zmwExYLdlgTPVxkylcTcPvG8P3g4nL8qOhuqJ
   Eq0haG0U4kIq020LhzkE+1336abtuE53GJ6iJbW5h4lIs5PDXhHjKpkXQ
   VFeyVmaulAH3vTdQFPI0kbrlFyaUYWHeP+2SCJns1P3FhN9pvcf1svoDK
   F0J1jRkmJTH6X5gt9wOkQh3a0qyC/LnUwjdn9o5FPCtt4kvogauZxjpF9
   DSG2iq7v0nBuikzDnCUsWf5vfqL9Kh75GbZUa7IGLfTM9lVir8MJb6O4M
   g==;
X-CSE-ConnectionGUID: 28u86iGYQf+W7ucFFtZAtg==
X-CSE-MsgGUID: gJ2Q5o/AQeOn4Z+8I3u31A==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11127390"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="11127390"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 18:58:59 -0700
X-CSE-ConnectionGUID: WLhRMqfLTC23F4cTUpLASg==
X-CSE-MsgGUID: EJXhSxmWSsOQhFZh1uBWfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="28818348"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2024 18:58:58 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4Wa8-0002q8-1n;
	Wed, 08 May 2024 01:58:56 +0000
Date: Wed, 8 May 2024 09:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andreas Larsson <andreas@gaisler.com>
Subject: (.head.text+0x2040): relocation truncated to fit: R_SPARC_WDISP22
 against `.init.text'
Message-ID: <202405080936.tWaJdO3P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dccb07f2914cdab2ac3a5b6c98406f765acab803
commit: 91d3ff922c346d6d8cb8de5ff8d504fe0ca9e17e sparc32: Fix parport build with sparc32
date:   9 weeks ago
config: sparc-randconfig-001-20240508 (https://download.01.org/0day-ci/archive/20240508/202405080936.tWaJdO3P-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080936.tWaJdO3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080936.tWaJdO3P-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sparc/kernel/head_32.o: in function `current_pc':
>> (.head.text+0x2040): relocation truncated to fit: R_SPARC_WDISP22 against `.init.text'
   arch/sparc/kernel/head_32.o: in function `halt_notsup':
   (.head.text+0x2100): relocation truncated to fit: R_SPARC_WDISP22 against `.init.text'
>> arch/sparc/kernel/process_32.o:(.fixup+0x4): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/process_32.o:(.fixup+0xc): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
>> arch/sparc/kernel/signal_32.o:(.fixup+0x0): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x8): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x10): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x18): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x20): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x28): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x30): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
