Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E1C367
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754470171; cv=none; b=CGesleyle+1zBynpEbQLR+XfRJrjh5AKOQah7JMtVF3lQnUW/EF0M2QVRb6G6xdAujiwF2FL1v5AQ76W+THO0WXlRcVHBHQkci8sht7N/ZBg3YcoWSlT2/hJhAxyhrscrhZ8kazkblM1JQZGrNmH/blpl1ZTW/wpf9qadFUm0Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754470171; c=relaxed/simple;
	bh=0988g4lUsWGkNxdb3eVyghAVByp1FYNQVFvB+omhiyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rf1V790Axeu2koWqaq5oCallJtK/95Wnb2t+k+Y2Mf5CDhOJFVAtBN7l8iHl/nEsK6zgyLdyp8lPJUE3JKIgYyFsAsdGUtW7XTLgtiKUAq1IF5fAykcIRqLI6hg2lX8fphDsl5e7kCYZb5cNSSc+1jWfD846zi4ewQ8x254ueOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/MYfMJ6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/MYfMJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754470170; x=1786006170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0988g4lUsWGkNxdb3eVyghAVByp1FYNQVFvB+omhiyE=;
  b=e/MYfMJ6Jc4na0by5BFG6hdOridg//LMpz1tMK9RN0YKBquritgpSsOY
   EoGmKSD12ND75zz6aBINXeZav3L3wrV6sb20LOUEWc717JvkcJQnoqnEw
   5KfXUckTB62tNO7V3bBkrLTRzOKjY3pldRTsrRtjWEzgjFGLykOuLBqDm
   NVmE5lfG7hMcCJx4YgIqLZuOKE5ZOy4I38kvM/bS7EKRWtBg0p72hy3jN
   U1FVBPs1dnkY6G8cePeSaX+izd+GXW42LSh/bpQmlKovQd3J0MNJNvVje
   8oc3U4isqwtUQlcWce+qAZlxPc3QkIRKkvz2PWk6DENkYFzGTwv5XRTzr
   Q==;
X-CSE-ConnectionGUID: 19k3FwwVTDK/NGJQxb06xw==
X-CSE-MsgGUID: KDDkjnzgQ7eoh43C+zXj0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="59395442"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="59395442"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 01:49:29 -0700
X-CSE-ConnectionGUID: Q382yZR6RXm/enhKfEhR+Q==
X-CSE-MsgGUID: xMIaYgrxQ4mAdoyr94eE/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="165488771"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 06 Aug 2025 01:49:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujZpt-0001Q6-20;
	Wed, 06 Aug 2025 08:49:25 +0000
Date: Wed, 6 Aug 2025 16:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for SERIAL_8250
 when selected by ECONET
Message-ID: <202508061622.zf1SMW7r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   479058002c32b77acac43e883b92174e22c4be2d
commit: 79ee1d20e37cd553cc961962fca8107e69a0c293 mips: econet: Fix incorrect Kconfig dependencies
date:   2 months ago
config: mips-kismet-CONFIG_SERIAL_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20250806/202508061622.zf1SMW7r-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250806/202508061622.zf1SMW7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061622.zf1SMW7r-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_8250 when selected by ECONET
   WARNING: unmet direct dependencies detected for SERIAL_8250
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
     Selected by [y]:
     - ECONET [=y]
   
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
