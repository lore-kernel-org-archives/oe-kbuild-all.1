Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC91337143
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 11:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705837994; cv=none; b=NJ0Yht/Alr4H4rt9DVnotkJ+gk1kEvBV7x0OQOBfL2iK3CrAT8Ho9lapplaPtz4NlrfbnyhTxrF5ZTs5NFRpommS3GgK31FW7S5klxcL63Y1+vUXkvR6qWMy4vMlGjNYRwFatWlXOCmtaVM6FBOhwOxysQh2GmJJ/TlJA4XqsKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705837994; c=relaxed/simple;
	bh=38cqt68p4u8ukQ/XQYT3eSugzAW7Ejnz/nxq867P3Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nvx3re8eXcnC6/p1jKuWDgw/ZYXpdgkuH+SzeXpmAY4jmMZCF+hTsflZALfPTaF0Lrkg7G/BNueX0/Gu8dQ+nFMRtZHb6xlpA7f9d5Sw6Nr6+CsNGRekO/HAxiRcD5Pm6k2FQz9aIWVjLA8auWTb5sO+fkM2x5V3B1qAnxRCrgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XS/SElrt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XS/SElrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705837993; x=1737373993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=38cqt68p4u8ukQ/XQYT3eSugzAW7Ejnz/nxq867P3Gk=;
  b=XS/SElrtDz1D/T+joZE3B7wYcr9Ieo6f68kAtIfthJ56S6EsZrShT3DB
   nAOw4rHZEuhB4FQUm+hPUTCSACTTGlKDUaoUM2fZNupVH24eeFkqRe/OM
   2qStr7RNF6hja33qf97udvE0i1z/+KJ2WjOuXIR/3SJX5nSbOW5N101Sb
   kyrb/2whqCmPVKWlnnw57j/5tEtlTGX+0KiDwvKHovJm29v70dygO7PS3
   jBwkKe0PMDZmI0aBWj90khoh8YpmcHBChVuyjugeZP6I4XZhoRYCFVj6f
   C9cDfnHu9fsh45TJexPMtnwELZZGvAgBAAHeuvoZP2j9v92Ww3ROOyv4a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="921014"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="921014"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 03:53:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="1052417"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jan 2024 03:53:12 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRWNw-0005tu-20;
	Sun, 21 Jan 2024 11:53:08 +0000
Date: Sun, 21 Jan 2024 19:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 64/89] drivers/tty/vt/vt.c:2131: warning: Enum
 value 'ESnormal' not described in enum 'vc_ctl_state'
Message-ID: <202401211944.WlHhX9L7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   1cee1f612a81347ee77b4e6687c2ddff726b79f0
commit: 19863f2c7b6a1c64be5feef084c2fdcc3cffa637 [64/89] name, reflow and document enum vc_ctl_state
config: i386-buildonly-randconfig-003-20240121 (https://download.01.org/0day-ci/archive/20240121/202401211944.WlHhX9L7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401211944.WlHhX9L7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401211944.WlHhX9L7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESnormal' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESesc' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESsquare' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESgetpars' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESfunckey' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'EShash' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESsetG0' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESsetG1' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESpercent' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'EScsiignore' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESnonstd' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESpalette' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESosc' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESapc' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESpm' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2131: warning: Enum value 'ESdcs' not described in enum 'vc_ctl_state'


vim +2131 drivers/tty/vt/vt.c

  2093	
  2094	/**
  2095	 * enum vc_ctl_state - control characters state of a vt
  2096	 *
  2097	 * ESnormal:		initial state, no control characters parsed
  2098	 * ESesc:		ESC parsed
  2099	 * ESsquare:		CSI parsed -- parameters/modifiers expected
  2100	 * ESgetpars:		CSI parsed -- reading parameters
  2101	 * ESfunckey:		CSI [ parsed
  2102	 * EShash:		ESC # parsed
  2103	 * ESsetG0:		ESC ( parsed
  2104	 * ESsetG1:		ESC ) parsed
  2105	 * ESpercent:		ESC % parsed
  2106	 * EScsiignore:		CSI [0x20-0x3f] parsed
  2107	 * ESnonstd:		OSC parsed
  2108	 * ESpalette:		OSC P parsed
  2109	 * ESosc:		OSC [0-9] parsed
  2110	 * ESapc:		ESC _ parsed
  2111	 * ESpm:		ESC ^ parsed
  2112	 * ESdcs:		ESC P parsed
  2113	 */
  2114	enum vc_ctl_state {
  2115		ESnormal,
  2116		ESesc,
  2117		ESsquare,
  2118		ESgetpars,
  2119		ESfunckey,
  2120		EShash,
  2121		ESsetG0,
  2122		ESsetG1,
  2123		ESpercent,
  2124		EScsiignore,
  2125		ESnonstd,
  2126		ESpalette,
  2127		ESosc,
  2128		ESapc,
  2129		ESpm,
  2130		ESdcs,
> 2131	};
  2132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
