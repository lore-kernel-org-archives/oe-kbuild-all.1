Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA9B227B8E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 02:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774232985; cv=none; b=DbrE7Mgs3ffzs2JOVLlcy9K8YVdhJd5zcUNV+l8uosds+KWUPz5X9loeGu5xYoPsq7qiJBMW/oZnFTrFc+grWP1Twn4ORLXUavvR3x874WKJfD5nBII+ZLlWcdWgrq5s7K29ymv8lWeWruGXJmUPpMlTKszq186wF+7wlI/s90o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774232985; c=relaxed/simple;
	bh=C07t+tGTrVysxypmF+yDWYHi8qYipD20dIAeSasykig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RI5P7qlRm2UkLca4OlZG7x/TJYoBTrVjodKjmyt5uXezdgLRopN/aUGvc8tlwfRND6dPNlbjgM7tH8gTGhTmUEZDoFMGKQDYXzvYHFyGQyaT7hBq8MFTzWlILPSURaZfZPegUE5UJhEdpzAPN0TJ7d0K6tf/bLTrTdzDLtpIWJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7Sh7nL+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7Sh7nL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774232985; x=1805768985;
  h=date:from:to:cc:subject:message-id;
  bh=C07t+tGTrVysxypmF+yDWYHi8qYipD20dIAeSasykig=;
  b=H7Sh7nL+pIVzSsBc2xcFZUXsriok/pC7GjWQwV6IWyqu6eyoDgGKK1mH
   l/Iext0QKEliMm3Zm/SW9u1CsK2cLsYs422R1wJ1V12ni9QIXQ4yAHH2v
   LtzYOaVIDMlBxbx24ps4fD3ZBH5Kw6Jj5BxPD09Qjm4FQ8FncdqniuUs7
   h+GGwhKBi9oq285R2djxYR498B54nTlrrxmigMXOyo34G4LoEwiD9FbkC
   mX5Tfhck1EXFi7b69VCtP66QLHLNut8RFE/sxsyRD+RlSjZ9llkqG4oZu
   Vv/vWQkHWkXEx54D1hTo7pRbenzZ2iPhHXGUlMtvEIUpBcQLy99fwIiMC
   w==;
X-CSE-ConnectionGUID: 6vNC6MY8QIWKnpipZW/FQw==
X-CSE-MsgGUID: lGig+kfURFmEmize3bIqhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="100682155"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="100682155"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 19:29:44 -0700
X-CSE-ConnectionGUID: 0GVTa60AS2SNXc5I/9gPzQ==
X-CSE-MsgGUID: KcwmQhICRwuv+fxy0WmkrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="254358198"
Received: from lkp-server01.sh.intel.com (HELO b2269c5cf7eb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Mar 2026 19:29:43 -0700
Received: from kbuild by b2269c5cf7eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4V2y-00000000037-1S7m;
	Mon, 23 Mar 2026 02:29:40 +0000
Date: Mon, 23 Mar 2026 10:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 20/30] Warning: mm/memory.c:5498 function
 parameter 'pteoff' not described in 'set_pte_range'
Message-ID: <202603231053.NRpwMWMi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3ecd2bc82d7d0382233099de8d07616df26745c4
commit: 884e4480c9749ee3d50368f0edd80f1d237f2c4d [20/30] mm: Update set_pte_range() to take pteoff
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260323/202603231053.NRpwMWMi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603231053.NRpwMWMi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603231053.NRpwMWMi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/memory.c:5498 function parameter 'pteoff' not described in 'set_pte_range'
>> Warning: mm/memory.c:5498 function parameter 'pteoff' not described in 'set_pte_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
