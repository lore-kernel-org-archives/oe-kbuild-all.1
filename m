Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFA53EBF3D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 04:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771130297; cv=none; b=HUPCZ68FSaUtSp6CGxD+tGKfBSWM2zORZTysE2XfWTqigkhY14R/9MDSFclcCiN4eMwogA8LcwhGb7sUwN9RhwW1mrI2Aqxv3HRxvwRceGU1UsPM5UFW5Pa/O3IWWtDbi5paKpZdHRvVC6Vzb+9x5x7BC6UUvnL8+UnkI8DRFqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771130297; c=relaxed/simple;
	bh=ioekmOThg+1OWY8ljRGP44OucqiiggPQvg+Xub0IzRs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RcV1nYEvUCy6dxy++NZ10QUm9OEOGAU2fOmBsyI80yW84u6YVt/ikXMOJLrXpEQZaPk3y92TyKSzxIBfvKzdUJaNPoH8gXOdqjvtoGlBkGJuNjnT/eSlhhyzyMOA/aaJ+LtnTkMuDepD+gV5QbU7dSKGNK1r3rWaS146WCO43hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7QtpZ1u; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7QtpZ1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771130295; x=1802666295;
  h=date:from:to:cc:subject:message-id;
  bh=ioekmOThg+1OWY8ljRGP44OucqiiggPQvg+Xub0IzRs=;
  b=d7QtpZ1uY7jPrsdZ5x/ShHp3TyxOTbGHXSKrfi95FdsWwuHoJeus7Pqu
   QKDavK3HR6bxVmMVuNJvwc9JqN/yPTPfBrQ2+kvrMOimv4UFD5ZPsd8X/
   apDjHDWyDfVgobTmA/OITuOIwS+5Twh23QpKfsx7QqeHpnB7NP7a09919
   pt4yPTpFd18MgpfL/FYPVYHwgsp83Dka3C6li9xd9ZgbLYa1GcQC9vdjN
   nf81BQKPcv216HQIqhglzIXHkV0NmvSKVh+jOR2dQCXirDAB+mXv+jb6J
   0NuT8ldaCH7vutLGlHAAGVJhHJ7vEvZe9WkNkIZDPYdb23sKIG9gFW/Ps
   g==;
X-CSE-ConnectionGUID: /WiHA13mSh2YuX5l0NkG4g==
X-CSE-MsgGUID: OOp3NQX/QnWfgotKc/+cMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="72302920"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="72302920"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 20:38:14 -0800
X-CSE-ConnectionGUID: FwnyyKQ1QLqC5GMPMfcWXA==
X-CSE-MsgGUID: LpBX/5rWQzyZaq/pXyLf0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="213122811"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Feb 2026 20:38:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrTtb-00000000xQa-19TL;
	Sun, 15 Feb 2026 04:38:11 +0000
Date: Sun, 15 Feb 2026 12:38:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 15/17] kernel/container.c:146:27:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202602151241.Ffebm192-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   0b7243a05fc7f6484b8c81985b6b9c23c86ab464
commit: afed8d25f676afd8e570127c4b66368bdc930bd7 [15/17] security: Add container LSM hooks
config: arm64-randconfig-r112-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151241.Ffebm192-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151241.Ffebm192-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151241.Ffebm192-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/container.c:146:27: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   kernel/container.c:146:27: sparse:     expected restricted __poll_t ( *poll )( ... )
   kernel/container.c:146:27: sparse:     got unsigned int ( * )( ... )

vim +146 kernel/container.c

32ec22dd1e318d David Howells 2026-02-13  144  
32ec22dd1e318d David Howells 2026-02-13  145  const struct file_operations container_fops = {
32ec22dd1e318d David Howells 2026-02-13 @146  	.poll		= container_poll,
32ec22dd1e318d David Howells 2026-02-13  147  	.release	= container_release,
32ec22dd1e318d David Howells 2026-02-13  148  };
32ec22dd1e318d David Howells 2026-02-13  149  

:::::: The code at line 146 was first introduced by commit
:::::: 32ec22dd1e318def3025c52d5c89246f34f25215 fork: Handle task's container in fork and exit

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
