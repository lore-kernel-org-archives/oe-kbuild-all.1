Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD3113DBA8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708718483; cv=none; b=dOc7ylNIrLuZWHuK48SlLFWwuEyO39CDDsWk9UXEoPDiwV5Zo2wVUgFQxyR1+nJPdalyvce/D1bRRlT3UhfnK02UIBmiqfbRQIr8G2/H5cYntkcxjnHCyP2WIeI90RfxkBq4Sf8kYxlJ3l0b7UommIfATw9FPrOGXzi10G4vFis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708718483; c=relaxed/simple;
	bh=2UUmtW9us694XMgSpdklDQX/0Z6gWx/IMmPbe1snnRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IpifCEvIUhvrqpAMGtgmt45kd/6OR9sArr74ZTke3jL7nIvNEoKjBkm0tkPRCVVrEoqCPq00LQpSAuURHvccXzZuGcnTMjqlIwrCUUmdep/dBzCDAC5y4NJeRzS4viKXJGlNwPxNnZRHm8taoMWqVqag0zsMVU3U9x1elrUMX/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1eADz28; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1eADz28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708718482; x=1740254482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2UUmtW9us694XMgSpdklDQX/0Z6gWx/IMmPbe1snnRo=;
  b=f1eADz28mETmlRbhbojTB3NiqhZY7qO8bpH93xkb4POWuA+LbG+GOWCj
   EEfcUSg8+6dqBoF5F3KmGbPluURRWmuzjnRaEkgVP+CFDUST80E5SWKkc
   gInfzTrFFL3pOXWjXAFopxSYCbOASGky4x0yAEbUD9uNJHUCWT9aoGNsk
   DujydHr9lf15Wf0kmzz/G4IX7IAO1Q2a2bus66zzkeMWEHIa8PNYS786j
   L3PzwKxqYkNvTLTQna0U3lZu4GuTFAN9OXkjMz+Z8o7cIJc6EQHwjkB2o
   EYeMthcRp3gs8sdxS59Ot/uHmp6knT54qJzZoLrdLCJwIBnxaXS3siUvN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="5998804"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5998804"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 12:01:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="36782633"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Feb 2024 12:01:20 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdbjP-0007qm-2u;
	Fri, 23 Feb 2024 20:01:17 +0000
Date: Sat, 24 Feb 2024 04:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v5 10/16] vmlinux.o: warning: objtool:
 early_setup_idt+0x4: call to setup_ghcb() leaves .noinstr.text section
Message-ID: <202402240339.ushT0mFR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v5
head:   fac9888bd2451da4b2988dddc86d8b09c1849ba7
commit: 821c593f3d856b83c39d1572b1633b0c9ff6fa9c [10/16] x86/startup_64: Simplify virtual switch on primary boot
config: x86_64-randconfig-005-20240222 (https://download.01.org/0day-ci/archive/20240224/202402240339.ushT0mFR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240339.ushT0mFR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240339.ushT0mFR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: early_setup_idt+0x4: call to setup_ghcb() leaves .noinstr.text section


objdump-func vmlinux.o early_setup_idt:
0000 0000000000001080 <early_setup_idt>:
0000     1080:	f3 0f 1e fa          	endbr64
0004     1084:	e8 00 00 00 00       	call   1089 <early_setup_idt+0x9>	1085: R_X86_64_PLT32	setup_ghcb-0x4
0009     1089:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	108c: R_X86_64_32S	vc_boot_ghcb
0010     1090:	e9 00 00 00 00       	jmp    1095 <early_setup_idt+0x15>	1091: R_X86_64_PC32	.head.text+0x7c
0015     1095:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
001f     109f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
