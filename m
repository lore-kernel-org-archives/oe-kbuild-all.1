Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A3B2459F3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 01:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764293931; cv=none; b=QkNqy6L6ghLNSlnvwfbLHg8Bd8SbJyrkUi9nAtMTxTjpwrV12vp9iGO+DWTNXWV4ZJeZ4/C46Wc1V5GOJ1nSeJ2mDoJp2kEkjyi4h7NAx0lA55fJOtGnKCsre/QfNUS8NG+TOYHFWPe2Il0efmCDNsFTUcLxaG+gWZQLZjxqPkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764293931; c=relaxed/simple;
	bh=+jTNudJXF/EkZWbekJbhy5E6S3MiVDv7TDNe2SKPAOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rpzzlJic4iA2MDUxGYV+zrPIe9ZjiDO+vhiZHrlGJ1jImesAP5BbRVqEGABZFVstQgbS4ZHP0iHcM6BxvLdA24MNWYIUq5pMBRao8lH3h+9bgXtSfy5qqA+zYvbm8LOkQyck/pHua4TucG2F5iilB61kSzuC+txu7G6ClF6kx5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NG77LMTk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NG77LMTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764293929; x=1795829929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+jTNudJXF/EkZWbekJbhy5E6S3MiVDv7TDNe2SKPAOk=;
  b=NG77LMTkyEDKnnzWD+OvwRi66alW09SO6I8JR2QpsnDo97ECixKtm7gS
   +w6YHduNQTpLZgeJ0R8hiFMaNlct89yW1eLdQtQWBbxDKv1JI7/U5Jol7
   PpfE2ixOMWnulV15VUc3qOlz7qBNyC//b5diZiqAa5ONOzzY4Fgt7H96g
   uij48yxigmn73TBYgfKm8p+PwrQixQ/PVv8zVlILj4Y5vK70lVucei2xX
   WdciJ8YMI14NEvcXSuwvf4VwjGCn2jaPZtPWMZkJ9wUqh5+ek9Efx6shO
   HhxF40Nn35ZWRD3id/HHVYtbEaA2ZpBcZOgtOyPcJZ7EwWlneqt3iYj1O
   w==;
X-CSE-ConnectionGUID: iMPdIFUQSo6abxcfVU+2ZA==
X-CSE-MsgGUID: k9bnmToyQU+oQIX/rf760w==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="88975898"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="88975898"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 17:38:49 -0800
X-CSE-ConnectionGUID: Hyt5xfukTVOQ6U4Hsumm3A==
X-CSE-MsgGUID: 9O77yVzOS4OKloUwB9EwXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193147039"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Nov 2025 17:38:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOnRe-000000005uH-0e0S;
	Fri, 28 Nov 2025 01:38:46 +0000
Date: Fri, 28 Nov 2025 09:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:lockless-random 6/6] vmlinux.o: warning: objtool:
 do_syscall_64+0x18e: call to get_random_u8() leaves .noinstr.text section
Message-ID: <202511280957.byDGIH1h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git lockless-random
head:   05894b44c19c9050c63946f12c5755389c79c80b
commit: 05894b44c19c9050c63946f12c5755389c79c80b [6/6] randomize_kstack: Use get_random_u8() at entry for entropy
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251128/202511280957.byDGIH1h-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280957.byDGIH1h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280957.byDGIH1h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_syscall_64+0x18e: call to get_random_u8() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __do_fast_syscall_32+0xf5: call to get_random_u8() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
