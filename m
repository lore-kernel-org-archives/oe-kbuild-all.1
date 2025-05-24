Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF21B19DFA7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 01:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748049894; cv=none; b=pK5JSNmLUFrYPhgjI7iJ6vWsh8x0oMD5T1uFNigNqIrsmFmdd4p1v+YZsl8qY3fPv3IM4QwQnuM/Mod0olrvwygA+iR0/2oWPMs8fEqwism1JrA69mnJs1Q3KqxWE1lz3V837w9i/dl3FO/A0XKygjeSO4xpr9mKKXCW2PwTOFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748049894; c=relaxed/simple;
	bh=dDFzmA16gCufnVI4z3m8JQ30Bj9T1DbF96P70H4jd+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AK1oJt2z0mtu0kF9gNRJV6wuz9UskXScnKc9IsKQYOufIIlCF2+YP8amWzlg8gKXI8Cje2a5O1KZ+LdkT17cQ/sw3Ol4RuVROS2+lrZxI7QHhdrOohhTOywR0yeQYxViwhIXfVrDprbzw21fV8ZiG1rgu0WbDtxz5HA26FlHLio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsUbWjBa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsUbWjBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748049893; x=1779585893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dDFzmA16gCufnVI4z3m8JQ30Bj9T1DbF96P70H4jd+c=;
  b=LsUbWjBaJD6ZBzZ7lzmTn6GDd3WXh3TL4TXbRuELh6s2CfJ8/cFb03Pb
   2RYigz2Gjl8BK6bM3ICwoA9Vnc6T0wgI2fLgkVmvSvGKk8LE6hsAJWfVS
   tVHbo8Krqfh7zQtNmOjTy0bC4NK8/Naw1FXsnRxBSBfH/gpw/gqLFK4h8
   ba/GUCMWl71lnSW7NaFzZDt2bsjXe1aFwG+AIRYFM12pQrsMxkhb9HJRF
   DGVP1XZg0LB1q1T/NJOq8n7mdhXVSbqOHK+g6cGNkpilFhO+fG5907Y6t
   f+c9bafMkGohBHDxVuaT4hInPEO5dxkux+5T8ala13ZwLOdmKQW56gWJU
   A==;
X-CSE-ConnectionGUID: i4aQH0gwQ32AEJY8CQbLig==
X-CSE-MsgGUID: VlU96wsgR+yzG3tRyeMvOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50273332"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="50273332"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 18:24:53 -0700
X-CSE-ConnectionGUID: 0GWmU4sPQwi7rnBAjFX3nA==
X-CSE-MsgGUID: jMXbaSxyT4aKNzOL6djJog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="141267386"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 May 2025 18:24:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIdd3-000Qr6-18;
	Sat, 24 May 2025 01:24:49 +0000
Date: Sat, 24 May 2025 09:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Zhan <zhanjie9@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] PM / devfreq: Add HiSilicon uncore frequency scaling
 driver
Message-ID: <202505240911.4HLW92ba-lkp@intel.com>
References: <20250522031701.1912458-1-zhanjie9@hisilicon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522031701.1912458-1-zhanjie9@hisilicon.com>

Hi Jie,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.15-rc7]
[also build test ERROR on linus/master next-20250523]
[cannot apply to chanwoo/devfreq-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Zhan/PM-devfreq-Add-HiSilicon-uncore-frequency-scaling-driver/20250522-112539
base:   v6.15-rc7
patch link:    https://lore.kernel.org/r/20250522031701.1912458-1-zhanjie9%40hisilicon.com
patch subject: [PATCH v3] PM / devfreq: Add HiSilicon uncore frequency scaling driver
config: openrisc-randconfig-r063-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240911.4HLW92ba-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240911.4HLW92ba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240911.4HLW92ba-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/devfreq/hisi_uncore_freq.o: in function `hisi_uncore_cmd_send':
>> hisi_uncore_freq.c:(.text+0x3b0): undefined reference to `mbox_send_message'
>> hisi_uncore_freq.c:(.text+0x3b0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `mbox_send_message'
>> or1k-linux-ld: hisi_uncore_freq.c:(.text+0x500): undefined reference to `mbox_client_txdone'
>> hisi_uncore_freq.c:(.text+0x500): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `mbox_client_txdone'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
