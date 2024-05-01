Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95CD50A65
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 09:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714555381; cv=none; b=tAG/bdpfHmwKGwRx/F/U2AADhVxuTh4nra1Y2eob60E+Cyv6TPz+RsWiQBW1ktzUKBCOv0JV4xwwpzX8aFu+94tqxIU5GKAR0feyhMuwN6OWAJN0qP4HuZS3ba93XZkhDyy9H0p2cT3/tOaqKYTD8TYcfdzwQAPFLgkMFQU5CGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714555381; c=relaxed/simple;
	bh=tgEeNtrwumPXA8pWU5Qleb9bDlf6hmR3nMvZqsFMWSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WRIYae1NzH3GPYDTIpZHjMbn59L60GjkTJiziRYXm72hIMejaKK1/PA5QshE5wsE9MznLwjPbCtGEpB9FN27LAvIlBqiaolvfM27GqNrZCh8UMu477Xo6bO0xvIiTwbgrPciy5b8aHcn1dqMh62Tbiltf5RQhMEpuA3nYbftA7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HuO0Phe4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuO0Phe4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714555380; x=1746091380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tgEeNtrwumPXA8pWU5Qleb9bDlf6hmR3nMvZqsFMWSU=;
  b=HuO0Phe4t+HZvTm5l7oA6EzTZmsmsivHjc88r1zGaKdyE2TqtQmxNdqu
   ofehvHTiO0JfqP4h2H/vcdcGc/F/G/UhIVJN5nz3kcyHNHi6U1qNWdlEX
   Kxit0l+HPUBeS73JyigEZUF+4kXbheNPRMliN5ttRLyQ+F6SSi1ZhZNdF
   JFCj86ZT4wRX+wS3qY8EYW/qyTkRJeBgi1Vpv5xh6DenWM9tCYx2J2ti0
   LLME6ak/3KBO+FsiHOGGwsb1+wMKCahzez9t6gqI5w5mEChBOnAm6PFnl
   Od9J8t3aARs88H6yAh6gnrAnr/EhbdOjoi+kVqpO5DU7uvMMT6xf631lb
   Q==;
X-CSE-ConnectionGUID: llOykCWsTveUzMfwCktnow==
X-CSE-MsgGUID: ggEmiZOTTleVQNa/SHGz0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20894661"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="20894661"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 02:22:30 -0700
X-CSE-ConnectionGUID: +Uh2KoaTS8amWiWupLybng==
X-CSE-MsgGUID: gi9Qs3U7RVWAsDOdkuXwVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="26755223"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 May 2024 02:22:29 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s26AU-0009Jk-0H;
	Wed, 01 May 2024 09:22:26 +0000
Date: Wed, 1 May 2024 17:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lance Yang <ioworker0@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 9312/9709] rmap.c:undefined reference to
 `unmap_huge_pmd_locked'
Message-ID: <202405011730.KVI5uzFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d04466706db5e241ee026f17b5f920e50dee26b5
commit: 6ae76ae5b2e07d4eb6b3e4fc594856d6500ade54 [9312/9709] mm/vmscan: avoid split lazyfree THP during shrink_folio_list()
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20240501/202405011730.KVI5uzFY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405011730.KVI5uzFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405011730.KVI5uzFY-lkp@intel.com/

Note: the linux-next/master HEAD d04466706db5e241ee026f17b5f920e50dee26b5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   sparc64-linux-ld: mm/rmap.o: in function `try_to_unmap_one':
>> rmap.c:(.text+0x220c): undefined reference to `unmap_huge_pmd_locked'
>> sparc64-linux-ld: rmap.c:(.text+0x222c): undefined reference to `split_huge_pmd_locked'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
