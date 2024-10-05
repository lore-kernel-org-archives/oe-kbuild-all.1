Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E12D39FCE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728110044; cv=none; b=fpgX1XCBatweUe9U49P/TFAY7K2eXMBo8lfY0UgffferRpOPqjXdAeR6aAs9TKFD8s1c54CYURCtbYAhH/PfaThRJyugJwmpoUWV3JpkvMv6WUiVM68HuJ+twYasCUFyLSg/UJLFCcPF42USfuDoDZXEC4YQAJd3TajcWl/ZbBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728110044; c=relaxed/simple;
	bh=X9VshPSM+uQEDXnznVIgNEoWanHmKLgflSFtr5UCG6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QLSsbD8wGT3V8qYrgRCTcMKvIc+deZPloB4ZxpIeabP0j4sOlBbpOkWbTOhPhY3k/rkhCdZIg/XzcrDoZOZ3EneAySRPw6ma3DmJbkuhIW4TMWLt/aOpEqBQxE5/qvf5Tq/8B94NX86TzYs7ve4lLhElFCsKuBlID2qCRTeYasU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLP3fi9w; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLP3fi9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728110043; x=1759646043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X9VshPSM+uQEDXnznVIgNEoWanHmKLgflSFtr5UCG6U=;
  b=hLP3fi9w5UxSu0ENiKKyfvP37xkcxLfTYTdpUplm17nlscVCpO06CLyu
   v13NVlmj8hy9xjh6RCT14xOfVwX12gW6gDN3ulu9+iDmHZX/8qmn1dalN
   KHndu0+fTPeVJKpnxsbAk9pCDs+sQRCc3N56OUSYDoPthhMuRtXvkcohR
   Ih27fFsWTE95axCSKGoqB3OlEOrErWFiqjU0t0FZiFML7Fa9axhUN+mCf
   fZNOY0VQNqooDLc7KDLxqycC8iMWh9RMbf2LmPC1gjDX7JfchtaIhq1ix
   Pdpbcf6udm6Br/kWVr+Am7kPQbzOL7gR0Svh1QrOEOQqYmJWOwXETqcL7
   g==;
X-CSE-ConnectionGUID: +N1xS1SvTYuz8BQ2QnqXyA==
X-CSE-MsgGUID: wBQxlAZFS52EJs6+Mhu4Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37900031"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="37900031"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 23:34:00 -0700
X-CSE-ConnectionGUID: vAuWWYV1R6mOWVjDml/PjA==
X-CSE-MsgGUID: zAVNd0OcRmavc4qo8PR1pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="105680305"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Oct 2024 23:33:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swyMW-0002et-0h;
	Sat, 05 Oct 2024 06:33:56 +0000
Date: Sat, 5 Oct 2024 14:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-4.19.y 303/1172]
 fs/unicode/utf8-selftest.c:46:1: warning: 'static' is not at beginning of
 declaration
Message-ID: <202410051416.RxYmLaRl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gabriel,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-4.19.y
head:   b9aeb147225616494256fcf913c559afd4088a05
commit: 56427c9cf549342906953cfd1d180d014b78c97b [303/1172] unicode: introduce test module for normalized utf8 implementation
config: i386-buildonly-randconfig-001-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051416.RxYmLaRl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051416.RxYmLaRl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051416.RxYmLaRl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/unicode/utf8-selftest.c:46:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
      46 | const static struct {
         | ^~~~~
   fs/unicode/utf8-selftest.c:100:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     100 | const static struct {
         | ^~~~~


vim +/static +46 fs/unicode/utf8-selftest.c

    45	
  > 46	const static struct {
    47		/* UTF-8 strings in this vector _must_ be NULL-terminated. */
    48		unsigned char str[10];
    49		unsigned char dec[10];
    50	} nfdi_test_data[] = {
    51		/* Trivial sequence */
    52		{
    53			/* "ABba" decomposes to itself */
    54			.str = "aBba",
    55			.dec = "aBba",
    56		},
    57		/* Simple equivalent sequences */
    58		{
    59	               /* 'VULGAR FRACTION ONE QUARTER' cannot decompose to
    60	                  'NUMBER 1' + 'FRACTION SLASH' + 'NUMBER 4' on
    61	                  canonical decomposition */
    62	               .str = {0xc2, 0xbc, 0x00},
    63		       .dec = {0xc2, 0xbc, 0x00},
    64		},
    65		{
    66			/* 'LATIN SMALL LETTER A WITH DIAERESIS' decomposes to
    67			   'LETTER A' + 'COMBINING DIAERESIS' */
    68			.str = {0xc3, 0xa4, 0x00},
    69			.dec = {0x61, 0xcc, 0x88, 0x00},
    70		},
    71		{
    72			/* 'LATIN SMALL LETTER LJ' can't decompose to
    73			   'LETTER L' + 'LETTER J' on canonical decomposition */
    74			.str = {0xC7, 0x89, 0x00},
    75			.dec = {0xC7, 0x89, 0x00},
    76		},
    77		{
    78			/* GREEK ANO TELEIA decomposes to MIDDLE DOT */
    79			.str = {0xCE, 0x87, 0x00},
    80			.dec = {0xC2, 0xB7, 0x00}
    81		},
    82		/* Canonical ordering */
    83		{
    84			/* A + 'COMBINING ACUTE ACCENT' + 'COMBINING OGONEK' decomposes
    85			   to A + 'COMBINING OGONEK' + 'COMBINING ACUTE ACCENT' */
    86			.str = {0x41, 0xcc, 0x81, 0xcc, 0xa8, 0x0},
    87			.dec = {0x41, 0xcc, 0xa8, 0xcc, 0x81, 0x0},
    88		},
    89		{
    90			/* 'LATIN SMALL LETTER A WITH DIAERESIS' + 'COMBINING OGONEK'
    91			   decomposes to
    92			   'LETTER A' + 'COMBINING OGONEK' + 'COMBINING DIAERESIS' */
    93			.str = {0xc3, 0xa4, 0xCC, 0xA8, 0x00},
    94	
    95			.dec = {0x61, 0xCC, 0xA8, 0xcc, 0x88, 0x00},
    96		},
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
