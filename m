Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247391DF755
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 03:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771557661; cv=none; b=G0Ep0/HyZMyALfTHG6EkvPOz4kx4m230qm/8pZquX80pC3R61FCjhK0mhkJqJ9vX8opBn1XM/cbA7DwJyMnPh1XL0n9C1/azH0HsQjbaNZxdlHReGRFb4VI6404QwVvOJ5uOM8ixr8aajWigIcc6SwVlZWVDIArelNyjfTMhc6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771557661; c=relaxed/simple;
	bh=ECdty1A1JHMD4fK+1SiBQ145nx9CMJHOIJaXei8qoog=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kbs025zKEAoSMRypkH09GPWozkPGlQEFiOXsoJnk+ffceBt4bTTvYxoJTJl+7jDgZsi7Lm4Y/5TUVs9KbS4f0qwFyC0TaHpklEXUQ7qLtY5m8KJUOMqpnL9PG3EvTFJv9vZE1HWd77ReMg98AlDBNMzZ61bse01ywnkSjOEryGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0RR/8Ri; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0RR/8Ri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771557660; x=1803093660;
  h=date:from:to:cc:subject:message-id;
  bh=ECdty1A1JHMD4fK+1SiBQ145nx9CMJHOIJaXei8qoog=;
  b=D0RR/8RidumxcKYil05MAZae8zOXRULuHbJ5VmUiAT+iyWtgBrZhulEh
   WHJxFUSJsaN46dyjqmZhRN+H8zlk9WO84nLdkLJL4WPL50gpYUZb+RRFf
   po4NEAw5pxv38zUk9WBp7TgIUnT96mKl/Ey7rs0cuWzbZRwC7LKWkqBYy
   n3UgK9mt/I5xtagq8Sf0Ckw1lRFqso83Ky4MUhFfys+AqzUEdbTuQoSOy
   LOw2+1pq5n1xIgjCNDEUncc/5f2NWXKyoRONlbQMgAS1im4wjxCWr2v1D
   sJwARDyKvlnWQEojqgc4l08b27VQ8Rbg5ZxCXjknrUOcUB8DSxwMXTXz7
   g==;
X-CSE-ConnectionGUID: Ps6J2cCYTl+DlGyeMwyVlQ==
X-CSE-MsgGUID: S2rltQygQv2TwSqN9nhggw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72534658"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72534658"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 19:20:59 -0800
X-CSE-ConnectionGUID: Fc/xGb9UQmmnHgCM7+karQ==
X-CSE-MsgGUID: jDgwpcOcQpe61xcb9z5TCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="219742618"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Feb 2026 19:20:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtH4Z-000000013me-43PZ;
	Fri, 20 Feb 2026 03:20:55 +0000
Date: Fri, 20 Feb 2026 11:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 10/18] <stdin>:1636:2: warning: syscall
 rootns_enter not implemented
Message-ID: <202602201124.Xqaw7Wiw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   bbfe3fc31c861befc0d2aa15a02e672b2e248cd6
commit: 54bc1294c2b10d47946e8a437394d48cdead2926 [10/18] rootns: Implement rootns_enter()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602201124.Xqaw7Wiw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201124.Xqaw7Wiw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602201124.Xqaw7Wiw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1627:2: warning: syscall rootns_create not implemented [-W#warnings]
    1627 | #warning syscall rootns_create not implemented
         |  ^
   <stdin>:1630:2: warning: syscall rootns_wait not implemented [-W#warnings]
    1630 | #warning syscall rootns_wait not implemented
         |  ^
   <stdin>:1633:2: warning: syscall rootns_kill not implemented [-W#warnings]
    1633 | #warning syscall rootns_kill not implemented
         |  ^
>> <stdin>:1636:2: warning: syscall rootns_enter not implemented [-W#warnings]
    1636 | #warning syscall rootns_enter not implemented
         |  ^
   4 warnings generated.
--
   <stdin>:1627:2: warning: syscall rootns_create not implemented [-W#warnings]
    1627 | #warning syscall rootns_create not implemented
         |  ^
   <stdin>:1630:2: warning: syscall rootns_wait not implemented [-W#warnings]
    1630 | #warning syscall rootns_wait not implemented
         |  ^
   <stdin>:1633:2: warning: syscall rootns_kill not implemented [-W#warnings]
    1633 | #warning syscall rootns_kill not implemented
         |  ^
>> <stdin>:1636:2: warning: syscall rootns_enter not implemented [-W#warnings]
    1636 | #warning syscall rootns_enter not implemented
         |  ^
   4 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
