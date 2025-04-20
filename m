Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F022C80
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 07:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132476; cv=none; b=RZA7v+mznRNYnplLYdICEzjEyc7LgSsxGhafFcQv1yQr9i+TyRLtgijP6JTyDBmdwsOWqBIOAbollMCnn2maS3tSaS9wP/Ry9a5iOB5m63xKtXpR6uF/DdM6qqtZkDdBwj8MzkKG0VBDS+UmoZb4LporslrephhbpS4ZwKJw6Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132476; c=relaxed/simple;
	bh=T6fWXymNQY1EXPhGbcYTM+MAWa1QHlk7gNXxyubsTs4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CUq94OfKh0oifj7lse6ZAv6Z/i4Xi7UvGOIi21Htr68YAcaLc2JY2VzKusQxdvTPZdET1MhGeCSQCjVpHBVM9imi4n8YCTl7GyU7brf75/IpT3+gWBNK7U6lX96+MNS8mQh8NrCLufzgyUP9nyBbviqYkJRYm55dnBesIbIk+kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmYDqSl8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmYDqSl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745132475; x=1776668475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T6fWXymNQY1EXPhGbcYTM+MAWa1QHlk7gNXxyubsTs4=;
  b=RmYDqSl8IyqbDIIvoXKY6bVs7wxY3F2MOfvzxz8dUW2oyvNRRlQAENNn
   /N7e6+F6cnhF2/hvoeBAx9p6XvrjBPpzHgBU2XIeAaLfNprOCMZICsSY0
   g0en2bijVF3gKJ+wKRXCRugvHVNO8XPH/bXnTmyiVU/sHkchQQ52H6ofk
   0rwtwLTcdsqTLXUh7BKtzJz69R5J0U1CFMtfphOJBM9T1tXylX06G7hfk
   6kMHd2WFAu11XiJprj6stILpbfFTLfg1SU69fnBLKFEiHsNh5zJWhYUFC
   VJlGttsBeLwy2iqUR/7y6DrQAsrVnyBzKjG8FAOSwufaLtF7pktEdf3vw
   g==;
X-CSE-ConnectionGUID: kBiK8fYSR+KLaFUVilVEEA==
X-CSE-MsgGUID: XzbDPwZxRE+JRcq/jisFPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46708907"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46708907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 00:01:14 -0700
X-CSE-ConnectionGUID: QEKB2qfHRAyM3jRfaatslQ==
X-CSE-MsgGUID: 1Brzpd0BTGOXhQDDSTjPRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="135543496"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Apr 2025 00:01:13 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Ofv-0004Ul-1F;
	Sun, 20 Apr 2025 07:01:11 +0000
Date: Sun, 20 Apr 2025 15:00:56 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 21/33] /usr/bin/ld:
 arch/x86/include/asm/msr.h:375: undefined reference to
 `__tracepoint_write_msr'
Message-ID: <202504201404.kVQIrawN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   7847889af95a1a39c6e3e0ef6479df8b9505a17d
commit: 57b711e7fed167bf1a444aaa218c2987dd315c7d [21/33] x86/msr: Use the alternatives mechanism to write MSR
config: um-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201404.kVQIrawN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201404.kVQIrawN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201404.kVQIrawN-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `cs5536_init_one':
   arch/x86/include/asm/msr.h:165: undefined reference to `__tracepoint_read_msr'
   /usr/bin/ld: arch/x86/include/asm/msr.h:166: undefined reference to `do_trace_read_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `native_read_msr':
   arch/x86/include/asm/msr.h:165: undefined reference to `__tracepoint_read_msr'
   /usr/bin/ld: arch/x86/include/asm/msr.h:166: undefined reference to `do_trace_read_msr'
   /usr/bin/ld: arch/x86/include/asm/msr.h:165: undefined reference to `__tracepoint_read_msr'
   /usr/bin/ld: arch/x86/include/asm/msr.h:166: undefined reference to `do_trace_read_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `__wrmsr':
   arch/x86/include/asm/msr.h:375: undefined reference to `__tracepoint_write_msr'
   /usr/bin/ld: arch/x86/include/asm/msr.h:376: undefined reference to `do_trace_write_msr'
>> /usr/bin/ld: arch/x86/include/asm/msr.h:375: undefined reference to `__tracepoint_write_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `cs5536_set_dmamode':
   arch/x86/include/asm/msr.h:165: undefined reference to `__tracepoint_read_msr'
>> /usr/bin/ld: arch/x86/include/asm/msr.h:375: undefined reference to `__tracepoint_write_msr'
   /usr/bin/ld: arch/x86/include/asm/msr.h:376: undefined reference to `do_trace_write_msr'
   /usr/bin/ld: arch/x86/include/asm/msr.h:166: undefined reference to `do_trace_read_msr'
>> /usr/bin/ld: arch/x86/include/asm/msr.h:375: undefined reference to `__tracepoint_write_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `native_read_msr':
   arch/x86/include/asm/msr.h:165: undefined reference to `__tracepoint_read_msr'
   /usr/bin/ld: arch/x86/include/asm/msr.h:166: undefined reference to `do_trace_read_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `__wrmsr':
   arch/x86/include/asm/msr.h:375: undefined reference to `__tracepoint_write_msr'
   /usr/bin/ld: arch/x86/include/asm/msr.h:376: undefined reference to `do_trace_write_msr'
>> /usr/bin/ld: arch/x86/include/asm/msr.h:375: undefined reference to `__tracepoint_write_msr'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
