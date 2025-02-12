Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB62320E024
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739366820; cv=none; b=A/QMDHFldZLU8s4Mv/goFgeUkLioHI01YNBps1H8kElxaqSvenyRl86FcVolBNPss7pnr9wxse9pI6c1/mfqkIntPsew94NLX7mQ4Yf1wmVmp4BbO0OZnQraMM9vHJu4GchRSS3q8b829SqqLsPUr+AKsEnaDhnC5N2/8SW8m3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739366820; c=relaxed/simple;
	bh=QiYvJ0GXmHLP+ujPqrdPco5d1IdsRQYQHBQgqyHfZ/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KbZNF9PAAUD8bn7ckXlaKSOl2OIFWcwyTRe6qiCh84YnOGYsXNvVon6YDHWr7ixL1Sj8N2SksnpzR7oKV7DPb8FZpo3m60jOprK28B5SdQkWVXu+Ek05X2QmxcL+PTP5Q8i0H6XygXEqOKxPf0XuEM4cpw0PKjGQJKWwIBf18mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lipj4kK9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lipj4kK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739366818; x=1770902818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QiYvJ0GXmHLP+ujPqrdPco5d1IdsRQYQHBQgqyHfZ/E=;
  b=Lipj4kK93uXvOnjGyFYBj/UZQ8YKgUxv3vMnLzsvTdh7sDEDCMgP78K5
   6y6zm7GZ/WLjbwTqsQdCWdHdt/u2mLRtLrbj3Vpx/PuS+Q67lSm2yPDWt
   mvEdpo9L2UGLXsId7JbvrwGJeJmQm4xZdhXX05kDjBswLwqRpYwC6+OJe
   a5k7HliGZmy64KTb+DaH0736H9iMDVJ1hVZF/HQuEL/orv44A6KK6DHYZ
   tOEKptSDaQJH9BbYIOVBDBS3veiaRbn74V/Sj6qFbTEIhiU7PmT+c6vuf
   Fnq4JA+hjjjOQ+uLpgIoE5SpzTPCb+8RkoXVUc2E8kyKp5QxyHEVgqN1j
   A==;
X-CSE-ConnectionGUID: Oanv9i5cShyuHBSmH9506A==
X-CSE-MsgGUID: kQD3v6ToShG5EDyAPjWNhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27617272"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="27617272"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 05:26:56 -0800
X-CSE-ConnectionGUID: eMFME9W/T4CqL9TZdfRehQ==
X-CSE-MsgGUID: 1Oi/X78QROOjfUYCzHCxog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="113327523"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Feb 2025 05:26:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiClQ-0015eD-18;
	Wed, 12 Feb 2025 13:26:52 +0000
Date: Wed, 12 Feb 2025 21:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>
Subject: [linux-next:master 2466/3226] lib/tests/stackinit_kunit.c:428:1:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202502122126.DClMYtga-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c674aa7c289e51659e40dda0f954886ef7f80042
commit: db6fe4d61ece24193eb4d94a82d967501d53358c [2466/3226] lib: Move KUnit tests into tests/ subdirectory
config: riscv-randconfig-r113-20250212 (https://download.01.org/0day-ci/archive/20250212/202502122126.DClMYtga-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250212/202502122126.DClMYtga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502122126.DClMYtga-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/stackinit_kunit.c:428:1: sparse: sparse: Using plain integer as NULL pointer
>> lib/tests/stackinit_kunit.c:428:1: sparse: sparse: Using plain integer as NULL pointer
>> lib/tests/stackinit_kunit.c:428:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:429:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:429:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:429:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:437:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:437:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:437:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:437:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:437:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:437:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:438:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:438:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:438:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:447:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:447:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:447:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:449:1: sparse: sparse: Using plain integer as NULL pointer
>> lib/tests/stackinit_kunit.c:439:1: sparse: sparse: Initializer entry defined twice
   lib/tests/stackinit_kunit.c:439:1: sparse:   also defined here
>> lib/tests/stackinit_kunit.c:439:1: sparse: sparse: Initializer entry defined twice
   lib/tests/stackinit_kunit.c:439:1: sparse:   also defined here
   lib/tests/stackinit_kunit.c:440:1: sparse: sparse: Initializer entry defined twice
   lib/tests/stackinit_kunit.c:440:1: sparse:   also defined here
   lib/tests/stackinit_kunit.c:440:1: sparse: sparse: Initializer entry defined twice
   lib/tests/stackinit_kunit.c:440:1: sparse:   also defined here
   lib/tests/stackinit_kunit.c:442:1: sparse: sparse: Initializer entry defined twice
   lib/tests/stackinit_kunit.c:442:1: sparse:   also defined here
   lib/tests/stackinit_kunit.c:442:1: sparse: sparse: Initializer entry defined twice
   lib/tests/stackinit_kunit.c:442:1: sparse:   also defined here
   lib/tests/stackinit_kunit.c:443:1: sparse: sparse: Initializer entry defined twice
   lib/tests/stackinit_kunit.c:443:1: sparse:   also defined here
   lib/tests/stackinit_kunit.c:443:1: sparse: sparse: Initializer entry defined twice
   lib/tests/stackinit_kunit.c:443:1: sparse:   also defined here
--
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:365:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:365:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:365:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:366:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:366:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:366:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
>> lib/tests/overflow_kunit.c:487:9: sparse: sparse: cast truncates bits from constant value (12c becomes 2c)
>> lib/tests/overflow_kunit.c:489:9: sparse: sparse: cast truncates bits from constant value (1112c becomes 112c)
>> lib/tests/overflow_kunit.c:491:9: sparse: sparse: cast truncates bits from constant value (10811112c becomes 811112c)
   lib/tests/overflow_kunit.c:492:9: sparse: sparse: cast truncates bits from constant value (10811112c becomes 811112c)
   lib/tests/overflow_kunit.c:509:9: sparse: sparse: cast truncates bits from constant value (12c becomes 2c)
   lib/tests/overflow_kunit.c:511:9: sparse: sparse: cast truncates bits from constant value (1112c becomes 112c)
   lib/tests/overflow_kunit.c:513:9: sparse: sparse: cast truncates bits from constant value (10811112c becomes 811112c)
   lib/tests/overflow_kunit.c:514:9: sparse: sparse: cast truncates bits from constant value (10811112c becomes 811112c)
>> lib/tests/overflow_kunit.c:526:9: sparse: sparse: cast truncates bits from constant value (100 becomes 0)
   lib/tests/overflow_kunit.c:528:9: sparse: sparse: cast truncates bits from constant value (10000 becomes 0)
   lib/tests/overflow_kunit.c:530:9: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
   lib/tests/overflow_kunit.c:531:9: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
>> lib/tests/overflow_kunit.c:1055:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1055:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1055:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1055:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
>> lib/tests/overflow_kunit.c:1055:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1055:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1055:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1055:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1055:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1055:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1057:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1057:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1058:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1058:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1059:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1059:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1060:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1060:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1062:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1062:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1063:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1063:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1155:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1155:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1155:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1156:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1156:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1156:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)

vim +428 lib/tests/stackinit_kunit.c

02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  382  
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  383  #define DEFINE_SCALAR_TEST(name, init, xfail)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  384  		DEFINE_TEST(name ## _ ## init, name, SCALAR,	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  385  			    init, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  386  
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  387  #define DEFINE_SCALAR_TESTS(init, xfail)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  388  		DEFINE_SCALAR_TEST(u8, init, xfail);		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  389  		DEFINE_SCALAR_TEST(u16, init, xfail);		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  390  		DEFINE_SCALAR_TEST(u32, init, xfail);		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  391  		DEFINE_SCALAR_TEST(u64, init, xfail);		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  392  		DEFINE_TEST(char_array_ ## init, unsigned char,	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  393  			    STRING, init, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  394  
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  395  #define DEFINE_STRUCT_TEST(name, init, xfail)			\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  396  		DEFINE_TEST(name ## _ ## init,			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  397  			    struct test_ ## name, STRUCT, init, \
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  398  			    xfail)
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  399  
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  400  #define DEFINE_UNION_TEST(name, init, xfail)			\
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  401  		DEFINE_TEST(name ## _ ## init,			\
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  402  			    union test_ ## name, STRUCT, init,	\
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  403  			    xfail)
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  404  
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  405  #define DEFINE_STRUCT_TESTS(init, xfail)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  406  		DEFINE_STRUCT_TEST(small_hole, init, xfail);	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  407  		DEFINE_STRUCT_TEST(big_hole, init, xfail);	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  408  		DEFINE_STRUCT_TEST(trailing_hole, init, xfail);	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  409  		DEFINE_STRUCT_TEST(packed, init, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  410  
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  411  #define DEFINE_STRUCT_INITIALIZER_TESTS(base, xfail)		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  412  		DEFINE_STRUCT_TESTS(base ## _ ## partial,	\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  413  				    xfail);			\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  414  		DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  415  
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  416  #define DEFINE_UNION_INITIALIZER_TESTS(base, xfail)		\
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  417  		DEFINE_UNION_TESTS(base ## _ ## partial,	\
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  418  				    xfail);			\
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  419  		DEFINE_UNION_TESTS(base ## _ ## all, xfail)
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  420  
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  421  #define DEFINE_UNION_TESTS(init, xfail)				\
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  422  		DEFINE_UNION_TEST(same_sizes, init, xfail);	\
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  423  		DEFINE_UNION_TEST(small_start, init, xfail);	\
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  424  		DEFINE_UNION_TEST(small_end, init, xfail);
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  425  
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  426  /* These should be fully initialized all the time! */
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  427  DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16 @428  DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
ad9f265c7328d9 lib/stackinit_kunit.c Kees Cook 2025-01-27  429  DEFINE_STRUCT_TESTS(old_zero, ALWAYS_PASS);
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  430  DEFINE_UNION_TESTS(zero, ALWAYS_PASS);
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  431  DEFINE_UNION_TESTS(old_zero, ALWAYS_PASS);
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  432  /* Struct initializers: padding may be left uninitialized. */
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  433  DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  434  DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  435  DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  436  DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  437  DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  438  DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27 @439  DEFINE_UNION_INITIALIZER_TESTS(static, STRONG_PASS);
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  440  DEFINE_UNION_INITIALIZER_TESTS(dynamic, STRONG_PASS);
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  441  DEFINE_UNION_INITIALIZER_TESTS(runtime, STRONG_PASS);
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  442  DEFINE_UNION_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  443  DEFINE_UNION_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
e71a29db79da19 lib/stackinit_kunit.c Kees Cook 2025-01-27  444  DEFINE_UNION_TESTS(assigned_copy, ALWAYS_FAIL);
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  445  /* No initialization without compiler instrumentation. */
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  446  DEFINE_SCALAR_TESTS(none, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  447  DEFINE_STRUCT_TESTS(none, BYREF_PASS);
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  448  /* Initialization of members with __user attribute. */
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  449  DEFINE_TEST(user, struct test_user, STRUCT, none, USER_PASS);
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  450  

:::::: The code at line 428 was first introduced by commit
:::::: 02788ebcf521fe78c24eb221fd1ed7f86792c330 lib: stackinit: Convert to KUnit

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
