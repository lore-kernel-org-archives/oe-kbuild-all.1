Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EFE1C0DCB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731940624; cv=none; b=UkbPYY6TmKPoE70p6b4CIjUBFFpASwNKaDsloMC63Yrqk3ETH6o5EXImaLzqOcDJEg7Pr2ar5jW+2SYURZcSW2gjHlEx8TYv+dADc094ahGQnLFzv3Vsn5NBKmU6WQofeGAoTvCHl43vSEPFnGTxh2LjdeHKuhjTDV/i/KSTR+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731940624; c=relaxed/simple;
	bh=DkiCDUyiMjgKw4fJ2HyQFB1MwnYykELzXdPK7OXddIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FaCTVy/B/UGPoNq4LUp91ty3RLyidDgj0Ok49uvHQn6Zu0vuF6bqLSDaz789z83vwq2Si3v5L2qHE0Cd8U4qKpegBuobJ4FSPyOJ58G6uWTRkxRKeW5+rNBoWkwnXUM2/dRjtb0XYlSFuI/Z0Be5iQdUMYOR8PyHAYoxvwgF0fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVOzsbvx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVOzsbvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731940622; x=1763476622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DkiCDUyiMjgKw4fJ2HyQFB1MwnYykELzXdPK7OXddIk=;
  b=AVOzsbvxaiNZ9i2vMZ2VHzMU60s2miTf1FNWKbLyCm1z42vwgKs7h+v2
   z4PgpY6a2VZUKeX1va7ZXz4o8ldp+9i2QShkvAFz5PtwXp9n2vpVKlRLu
   8HaxAvpMsQvqKvu1hINQW1IVmnhRZaGELBiTa/XqHK6zKzaaNMMgfI8dh
   w3Wlc2GIqOy26ruraB0GRgUD9UonIiAnZPQ0jNHUo8BcoebYkmbqN7Rgu
   mN3tZLP+fox5dCu67sIn9mbhUwYT2QYi1kseAjlaMF8ulFSQZs+uimusa
   g4x6n2qLHezu1jyZAB6n7sRJQgFiFzubOKahsiemzOKEpeY/JYU1d4sZJ
   Q==;
X-CSE-ConnectionGUID: 63rp174IT5afyhYSRHCD9g==
X-CSE-MsgGUID: Og2+ykK3QNexgiG4TfPDlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="57308086"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="57308086"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 06:36:45 -0800
X-CSE-ConnectionGUID: KO/7g4JfRluHihXxC6NXBg==
X-CSE-MsgGUID: 0RUGaFFNQuGs8prHiwG2Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="89162996"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2024 06:36:43 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD2ro-0002Tx-20;
	Mon, 18 Nov 2024 14:36:40 +0000
Date: Mon, 18 Nov 2024 22:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 1/3]
 arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from
 constant value (8000000000000000 becomes 0)
Message-ID: <202411182246.wGwjR05H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   573505a89aeb5eee6f77d35893f539439cfac78b
commit: b25e2be0204d8e7095a997b52afad35a7beb057a [1/3] x86/msr: Replace __wrmsr() with native_wrmsrl()
config: x86_64-randconfig-122-20241118 (https://download.01.org/0day-ci/archive/20241118/202411182246.wGwjR05H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411182246.wGwjR05H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411182246.wGwjR05H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/hyperv/hv_init.c:73:20: sparse: sparse: cast removes address space '__iomem' of expression
   arch/x86/hyperv/hv_init.c:241:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/x86/hyperv/hv_init.c:241:33: sparse:     expected void volatile [noderef] __iomem *addr
   arch/x86/hyperv/hv_init.c:241:33: sparse:     got void *
   arch/x86/hyperv/hv_init.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   arch/x86/hyperv/hv_init.c: note: in included file (through arch/x86/include/asm/tsc.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
--
   arch/x86/events/intel/uncore_snb.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   arch/x86/events/intel/uncore_snb.c: note: in included file (through arch/x86/include/asm/tsc.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (1000000ff becomes ff)
--
   arch/x86/events/intel/uncore_nhmex.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   arch/x86/events/intel/uncore_nhmex.c: note: in included file (through arch/x86/include/asm/tsc.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)

vim +149 arch/x86/include/asm/msr.h

   142	
   143	/* Can be uninlined because referenced by paravirt */
   144	static inline void notrace
   145	native_write_msr(unsigned int msr, u32 low, u32 high)
   146	{
   147		u64 val = (u64)high << 32 | low;
   148	
 > 149		native_wrmsrl(msr, val);
   150	
   151		if (tracepoint_enabled(write_msr))
   152			do_trace_write_msr(msr, val, 0);
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
