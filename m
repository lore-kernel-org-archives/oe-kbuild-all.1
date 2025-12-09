Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964E632E686
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 17:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765302853; cv=none; b=TagpCQ3/vi5H2TkSYC6dk7X6qg7OEwNLiyNRPdDPaJ7IjX42a3SHgOnOfJjF8LJJp2GKKr8wVpJWPw2XFmOGB+gG09eNqbGTrL8qS5ac9t1D+Lbze/JrkdTwKi96dNLnoKZVhVlbcRzPm+axEG2rrLraKYKw1nbzyLIt3zWKhsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765302853; c=relaxed/simple;
	bh=bDj2zTa53c4bFlRbTWizs+gjnbv3ujdLGMgPETr1D6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=scSHbjcIaSgmUsFkbF7Vix3rkDKdHri+w2iwDDt3UBsApJXDW6bCgb23KkwbSvXKGJWMfyh2aMdpp1hM3dcNyL2SEtAQevB6brPyCK0z5ILqQefHubT/F/e6ZrJBk+aCe5gBbHiE2r4h1I61f62nswhyKO7WJfAH965V11oLEK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+3E3fN9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+3E3fN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765302851; x=1796838851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bDj2zTa53c4bFlRbTWizs+gjnbv3ujdLGMgPETr1D6E=;
  b=A+3E3fN9jIy4DO0Q1Frq7wQlhtXkGznQ0QXIzcLM9fvpZ5IfOrK4gtRE
   gD+KEwz7uZgYRt/zROOY4VZGahD+K2SC2J7kfeeQ4WFhNB9A9+h+X+4nG
   J2ZeQMYCgurC31gWwZbvxZfG/68T1CzpSPApvNrTQKvvuCJWgJnwzByfJ
   zngeIjKA7gy+x1B7wOOLxghM/jopI/PeS4VlZ2OOOQWc11NcXf8rVZKor
   +dUM0gFIWDwvluqSE8oREc89RiKd6eAZuzRcefjF7PDCHL3/6AmGdjiBf
   FKDJlw7+3tln321PhTPw7kWLS6W8/YaLLwzZM5Zgxc2NYkiZ1KE1WwCPB
   A==;
X-CSE-ConnectionGUID: ThUFocUmTue6C/n9KVs2bw==
X-CSE-MsgGUID: 1lrN8LfPRjydFv6EnqQ1bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71127883"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="71127883"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 09:54:11 -0800
X-CSE-ConnectionGUID: jX+ZsuatR2iLdiTH6GFpag==
X-CSE-MsgGUID: IM1q2TiYTSC4dZFlFbebvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="219622183"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 09 Dec 2025 09:54:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT1uZ-000000000Kf-24Kh;
	Tue, 09 Dec 2025 17:54:07 +0000
Date: Tue, 9 Dec 2025 18:53:33 +0100
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 EARLY_PRINTK_8250 when selected by ECONET
Message-ID: <202512091802.szZVXbKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 mips: Add EcoNet MIPS platform support
date:   7 months ago
config: mips-kismet-CONFIG_EARLY_PRINTK_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091802.szZVXbKe-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091802.szZVXbKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091802.szZVXbKe-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250 when selected by ECONET
   WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
     Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
     Selected by [y]:
     - ECONET [=y]
   
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
