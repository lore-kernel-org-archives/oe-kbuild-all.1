Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A0130C14A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 06:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181980; cv=none; b=SSRRradH8Jqe/hIYMXNADeIRJqFmncSFjIQvNP5a6N0FJwLIxR++Sbi8KDvao8b5Q/uGik8UDnBa84wnYJOAvZJKDh+vU/5UxG9Q+CCHFme9KrJoISHwifFQ+dQ4vMS+oYJ5riY75XCJmSxvztEKoXI9hPuoZE4E9BQB9bZE/YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181980; c=relaxed/simple;
	bh=ecbctJ1UWGHkBKpCin6tjYr1ra/MHhGRrKcNHuuu7gY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t81haEmle6ESesvRc8CBug3dW+0Ll12v0KjN3qNTrJpT1qj7Dkw5SkiB9hhmdnG/BcIDS7oOPC8hJAvU+icDjrJHNakoc6A84X02+A2hsITrrx9pB0aa5s/DU0PUjYJ4Levz8fCj7xpPIqIAvQQNnRWGQJsZHOfJbeZommIedQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UayYhk8Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UayYhk8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784181978; x=1815717978;
  h=date:from:to:cc:subject:message-id;
  bh=ecbctJ1UWGHkBKpCin6tjYr1ra/MHhGRrKcNHuuu7gY=;
  b=UayYhk8QAkRw7pBF1tjgY8Qe72vR9wv5AN7kAPoGZABUcbNXZydmYmeP
   S+s/n+mIuCZ6HWjrBhRGcXOvOAop8LQsBlMnDLAz9RZ/qjlTjhBptsJfK
   8JPz4bmLEKxYTbXUBCoDX+d+qqYlpK1OL2mgo7y0eL+TXDYw5S2+c6vCc
   V3NSAAZce5wBdibKnqCdaMjbL4fHewyQsfB8H26HHZZGg0himJh3MhjlJ
   KhikoE6G0g4p0zFb43Ru2RCOj4yFjRHjIkIs3zDpjYnaT5bAB8DHmfy4E
   8qcsA+fdiT9K1M5D6vRbL9A6vJVhnTnDVOyOqotMOlZOn3I08bO9+0McP
   A==;
X-CSE-ConnectionGUID: XFkOvXZYRa2kU9caDPFKbQ==
X-CSE-MsgGUID: 7w5SNnT3SP6eNWGnlH7WfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84686799"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84686799"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 23:06:18 -0700
X-CSE-ConnectionGUID: 1O76APMiQxq4KuAyec3j7g==
X-CSE-MsgGUID: 2tPFfNESRXaoZ2u8gKeLUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="260211704"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Jul 2026 23:06:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkFEc-00000000OMk-14Re;
	Thu, 16 Jul 2026 06:06:14 +0000
Date: Thu, 16 Jul 2026 14:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: [linux-next:master 4043/6789] vmlinux.o: error: objtool:
 efi_crash_gracefully_on_page_fault+0xc4: efi_rts_park_worker() missing
 __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202607161357.1gRSAwY4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Breno,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
commit: 3e5ba97c181e32ca9b810414272b57bb7600998e [4043/6789] efi/runtime-wrappers: factor out efi_rts_park_worker()
config: x86_64-randconfig-101-20260715 (https://download.01.org/0day-ci/archive/20260716/202607161357.1gRSAwY4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161357.1gRSAwY4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161357.1gRSAwY4-lkp@intel.com/

Note: the linux-next/master HEAD b8809969e1d7a591e0f49dd464a5d04b3cf02ab1 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: efi_crash_gracefully_on_page_fault+0xc4: efi_rts_park_worker() missing __noreturn in .c/.h or NORETURN() in noreturns.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
