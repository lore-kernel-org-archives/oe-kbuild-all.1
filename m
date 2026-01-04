Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567431C28E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 12:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767528432; cv=none; b=OG2tOScVbEtZtM1didOWjyqtqrkf8eJgPUB5ws8LPTzdSvDfSLO+T2C1IU0ipQJzLqidMOoQ1jS27da/qKMMT//m1IAPkZbT8UHyUXPw3/ms6ZZDtauM3F8QaYAuOu3wAfSQvegr8zwagb5MvHF+F2mAHD49zEclqfNRf+UyvMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767528432; c=relaxed/simple;
	bh=1ASNakWGqUo0X2cxyuHJbBSp5MSnGSKyoN9ueTgLBOo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P/m5mPtc1Du5mofTFQ6S/tts/1A5p11gBjvqBOAqI/RTp3rO085E/xWGzXTSO+xeR0YG4IlCt7hZQYw6GCQL4jApc2zu5YKiNhI+AMmglc9XkEl1AlZ2CuUflQhWV7yKMRlLp57F77zu9Ls0VwaTaHuoh3BBsgi22/I1chlDrkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IpLovs/4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpLovs/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767528432; x=1799064432;
  h=date:from:to:cc:subject:message-id;
  bh=1ASNakWGqUo0X2cxyuHJbBSp5MSnGSKyoN9ueTgLBOo=;
  b=IpLovs/4B1jZUwmqlcYZ0gAshKpy2sP3GTRsc4Z8qyAEO9rx+kmKn3LV
   aFxUScGaYh9XwvYQMtuMdWAuW9kNdRCKayqJDLcs55xIzz9thJKHGJtUI
   nRlotaqZ9kVdnvWS42KNxuMWVKSjKWR3vawRLRQwK2ZjC9woqX5JOC8pU
   yKAHH2uh0OqJWRZ3RvV9n9dhkCXQuZv2FsNs8vcixVttiRMAgrO9HM9r3
   Zti9ggfZzDldlDjBjts5i5iCYGpfpuRzABHcx6CIAF6xcQAkttkOty0If
   8NgYL5nfRFwaPfWxe0/L/VZk9FtJlhPnLoIytAXtsSgHeE9V7r2Am5YV8
   g==;
X-CSE-ConnectionGUID: OF+hG8xDSzeT6MjQ/jySaw==
X-CSE-MsgGUID: wcTQI48BQI6VkcoXTxdMOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="79649291"
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="79649291"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 04:07:11 -0800
X-CSE-ConnectionGUID: uqdwsx9YTzWKdaK+wMKgLg==
X-CSE-MsgGUID: R5GoCWAJTSqTEd1ML2y9aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="206309372"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jan 2026 04:07:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcMt1-000000000XR-0v7T;
	Sun, 04 Jan 2026 12:07:07 +0000
Date: Sun, 04 Jan 2026 20:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 18/19] ld: vmlinux.o: relocation
 R_X86_64_32S against `.rodata.str1.8' can not be used when making a PIE
 object; recompile with -fPIE
Message-ID: <202601042037.o9PM6Mm8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   f348d9af26d490c6f504ccaa7b342803ca1eaa0d
commit: a121b4a72e405d1096049f81933531c59256cbe6 [18/19] x86/kernel: Switch to PIE linking for the x86_64 KASLR kernel
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260104/202601042037.o9PM6Mm8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601042037.o9PM6Mm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601042037.o9PM6Mm8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: vmlinux.o: relocation R_X86_64_32S against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIE
   ld: failed to set dynamic section sizes: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
