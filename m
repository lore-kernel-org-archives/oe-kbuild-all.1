Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB442129A75
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712663703; cv=none; b=mHdkLEmEswvyd4b9BJkyjT5opKtpqnCpd8H7qOFMpyw/XTrcmrbW0RN0GotECFtIWOmZKic0PkCay2tTO6DLxmWf9qQdpxJ90l/39lzgd1Msq5pJ6YXa6ebNVNAxIHe7l3zHE1/PQPgSU/7js0ULF9NfYs+Pr3kC3H+JQjv5zYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712663703; c=relaxed/simple;
	bh=yDcKbSXNVGOkJ4hCKiWqt/2rvbamTWrE5mMD/koyfJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EYVaUJ3veGFBJpePUSvOlPs+KPRROkuBjJjH2Eo+IPnHqW+bicO1PvLvTWzsISOTqiv8wEgGkTsRW9pm+0m2EA7GxtclvY0VCz1H7WUB6MiCybcl6a3cxzBssvTZS2lhWHvcn1hb+lNHzfXyoP815ZxZDlFU/ztIdrRCGQ9qUH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3fwDIRc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3fwDIRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712663702; x=1744199702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDcKbSXNVGOkJ4hCKiWqt/2rvbamTWrE5mMD/koyfJA=;
  b=C3fwDIRcz4TMp9UJZ/AHvtJoYTLZb8M4tWiUeM0EzqNJC3p5fbW+VKlO
   vqFfa5TjFRCfX0C6EXvCCm7fxHKwTJAZsAiL+e+ss7WkrO0LFWq+VMvxg
   2PNiXU0NMmW2Zg0h0ccWbqnj8+EXBOYS4AwS6DbkA+F9ieu9SQheiiAVO
   yWNbyqz2nsiKWt0bOCEwM2zJe1kUUjEDBD6JBey1lbR9TDNKOc2I8FNlZ
   bijHsRrljhBioOpiTWrBWeEKpE8WVy2nTGWixGbkpoGYnufp92Lr9dKq3
   fnUmwa8mKt8djEJf+Tr8VSKixc8zIfbdqiwZ9SdAlQj8APQum6Co8XpEs
   Q==;
X-CSE-ConnectionGUID: SQuhIpRrQda94YFIkwugIA==
X-CSE-MsgGUID: J1127/YDQXKLF1VDHFtRRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7885280"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7885280"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:54:59 -0700
X-CSE-ConnectionGUID: Oh3dW9OpSF+oaVgC5zUwGQ==
X-CSE-MsgGUID: UfTGKMa2Tuuvl+VDO9Rwtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="43411318"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Apr 2024 04:54:58 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruA3z-00062e-2C;
	Tue, 09 Apr 2024 11:54:55 +0000
Date: Tue, 9 Apr 2024 19:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>
Subject: [linux-next:master 3639/4253] powerpc-linux-ld: warning: orphan
 section `.bss..Lubsan_data531' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data531'
Message-ID: <202404091959.he2HJvYl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a053fd3ca5d1b927a8655f239c84b0d790218fda
commit: 2e723c755093a0f315bf983f4cff931a2ef87696 [3639/4253] mm: use rwsem assertion macros for mmap_lock
config: powerpc-randconfig-r015-20220318 (https://download.01.org/0day-ci/archive/20240409/202404091959.he2HJvYl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404091959.he2HJvYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091959.he2HJvYl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data531' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data531'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data516' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data516'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data531' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data531'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data516' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data516'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data531' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data531'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data516' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data516'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
