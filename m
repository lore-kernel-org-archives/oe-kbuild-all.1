Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7622A4E1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 13:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771074873; cv=none; b=iQTPATIe/NmTzFo7KHKl5lT5l62j0YtAs8ojm1Co5f20OkQtTbIMgKsAymJZfGaut9GXOLmpxHJkSrTZF/h2YbBNp6Fj0mStTGskZXNVbV8/I8yD3v6VjT6I1N3mPV1t/Js7iiGq2Wifwvl6P4oi8Jna9VOukGjaAWwtLdL2t/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771074873; c=relaxed/simple;
	bh=zxqiGYycm/uPGXvDc3oTEyAMzFT7Zsp+wknBpRd9KB4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qkPX88+XbnrgAytcWZwkOV9GypL4/4WpwFrNi/ISDGhFkh6pP7Uhx/B1Xs+LfG4rynvfzxjnb7i1enrj1I8W7IzFW8/SOBPerRcu6VUkYDQmDdp5dIwI4nVvFZX+ZOeTGuWLpOnk6q8lRzyngzbOZTnF+VBH/tpz5Ad/z/XWmNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVixDNvo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVixDNvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771074871; x=1802610871;
  h=date:from:to:cc:subject:message-id;
  bh=zxqiGYycm/uPGXvDc3oTEyAMzFT7Zsp+wknBpRd9KB4=;
  b=AVixDNvoB8OU4spfsQp2G46gbJoOdBHIQuoBVvCYKWfBvpv8kO5RrHFN
   2lqQ6DrJ0BAusTJnkIHCMx34thMgOx6VcHJN9uvCwfdkAHBRvcd3Fq6OX
   Oh7f32B/uaTxELfdEnVIOAmX5VXo/3ixycWlwb604W38oZsgN1PafvyS1
   Q6sX5+N62Vsx7ta6sOve1/3/ILgPf/MDUC/wTNo3yIc6Ya5dyR0KDfUyh
   jN39HY/nEg7vEH6UNJiFtvITYURhRXMX8hMDP5OFWrN6OG4jzaJE3NPMn
   24ieq73oUt2qIJd3eL/IlTJtBpPj4v3m5tjrkJngRsb2I+98eE09XrX0l
   w==;
X-CSE-ConnectionGUID: mfBL3Y1uQPGAVY0XGkFTMw==
X-CSE-MsgGUID: O9n+KYJZSDax7hvFUzrMUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="76091834"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="76091834"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 05:14:31 -0800
X-CSE-ConnectionGUID: SqpaVjGvQU2rVBaSZ1ghGQ==
X-CSE-MsgGUID: /9sEANtOR8ePeleozlw8eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="217320598"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Feb 2026 05:14:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrFTe-00000000wZA-1YWk;
	Sat, 14 Feb 2026 13:14:26 +0000
Date: Sat, 14 Feb 2026 21:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: arch/powerpc/boot/decompress.c:132: undefined reference to
 `__decompress'
Message-ID: <202602142140.yi7s2ZLa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Guenter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   770aaedb461a055f79b971d538678942b6607894
commit: 916aa36042db8ee230543ffe0d192f900e8b8c9f clocksource/drivers/timer-tegra186: Avoid 64-bit divide operation
date:   5 months ago
config: powerpc-randconfig-r052-20260214 (https://download.01.org/0day-ci/archive/20260214/202602142140.yi7s2ZLa-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602142140.yi7s2ZLa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602142140.yi7s2ZLa-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'


vim +132 arch/powerpc/boot/decompress.c

1b7898ee276b39e Oliver O'Halloran 2016-09-22   97  
1b7898ee276b39e Oliver O'Halloran 2016-09-22   98  /**
1b7898ee276b39e Oliver O'Halloran 2016-09-22   99   * partial_decompress - decompresses part or all of a compressed buffer
1b7898ee276b39e Oliver O'Halloran 2016-09-22  100   * @inbuf:       input buffer
1b7898ee276b39e Oliver O'Halloran 2016-09-22  101   * @input_size:  length of the input buffer
930a77c3ad79c30 Zhang Jianhua     2021-05-10  102   * @outbuf:      output buffer
930a77c3ad79c30 Zhang Jianhua     2021-05-10  103   * @output_size: length of the output buffer
6efc2f1a64ef62f Yang Li           2024-04-08  104   * @_skip:       number of output bytes to ignore
1b7898ee276b39e Oliver O'Halloran 2016-09-22  105   *
1b7898ee276b39e Oliver O'Halloran 2016-09-22  106   * This function takes compressed data from inbuf, decompresses and write it to
1b7898ee276b39e Oliver O'Halloran 2016-09-22  107   * outbuf. Once output_size bytes are written to the output buffer, or the
1b7898ee276b39e Oliver O'Halloran 2016-09-22  108   * stream is exhausted the function will return the number of bytes that were
1b7898ee276b39e Oliver O'Halloran 2016-09-22  109   * decompressed. Otherwise it will return whatever error code the decompressor
1b7898ee276b39e Oliver O'Halloran 2016-09-22  110   * reported (NB: This is specific to each decompressor type).
1b7898ee276b39e Oliver O'Halloran 2016-09-22  111   *
1b7898ee276b39e Oliver O'Halloran 2016-09-22  112   * The skip functionality is mainly there so the program and discover
1b7898ee276b39e Oliver O'Halloran 2016-09-22  113   * the size of the compressed image so that it can ask firmware (if present)
1b7898ee276b39e Oliver O'Halloran 2016-09-22  114   * for an appropriately sized buffer.
1b7898ee276b39e Oliver O'Halloran 2016-09-22  115   */
1b7898ee276b39e Oliver O'Halloran 2016-09-22  116  long partial_decompress(void *inbuf, unsigned long input_size,
1b7898ee276b39e Oliver O'Halloran 2016-09-22  117  	void *outbuf, unsigned long output_size, unsigned long _skip)
1b7898ee276b39e Oliver O'Halloran 2016-09-22  118  {
1b7898ee276b39e Oliver O'Halloran 2016-09-22  119  	int ret;
1b7898ee276b39e Oliver O'Halloran 2016-09-22  120  
1b7898ee276b39e Oliver O'Halloran 2016-09-22  121  	/*
1b7898ee276b39e Oliver O'Halloran 2016-09-22  122  	 * The skipped bytes needs to be included in the size of data we want
1b7898ee276b39e Oliver O'Halloran 2016-09-22  123  	 * to decompress.
1b7898ee276b39e Oliver O'Halloran 2016-09-22  124  	 */
1b7898ee276b39e Oliver O'Halloran 2016-09-22  125  	output_size += _skip;
1b7898ee276b39e Oliver O'Halloran 2016-09-22  126  
1b7898ee276b39e Oliver O'Halloran 2016-09-22  127  	decompressed_bytes = 0;
1b7898ee276b39e Oliver O'Halloran 2016-09-22  128  	output_buffer = outbuf;
1b7898ee276b39e Oliver O'Halloran 2016-09-22  129  	limit = output_size;
1b7898ee276b39e Oliver O'Halloran 2016-09-22  130  	skip = _skip;
1b7898ee276b39e Oliver O'Halloran 2016-09-22  131  
1b7898ee276b39e Oliver O'Halloran 2016-09-22 @132  	ret = __decompress(inbuf, input_size, NULL, flush, outbuf,

:::::: The code at line 132 was first introduced by commit
:::::: 1b7898ee276b39e54d870dc4ef3374f663d0b426 powerpc/boot: Use the pre-boot decompression API

:::::: TO: Oliver O'Halloran <oohall@gmail.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
