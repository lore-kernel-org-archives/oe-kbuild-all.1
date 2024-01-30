Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C24F86122
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706628190; cv=none; b=j+SEC+ASPOPOwfVuxXNETpB4oqn+6ILZtRb8s42SVd9SVGxCR+uQegGzMsLYeT6+HghUITP0O2p32ksFJGrvk9bIC956aJfcrFQb7FHNZxc3e/xF/5+ue+Em8gGqqiIhnMJ5W8rnjiAHwk5k2fEowGBNtyuAv9VFhEgLYzIn8Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706628190; c=relaxed/simple;
	bh=qxOnVoblZEkJgKl9b98dkbzR/chq7oDsfJ4Cd07MrU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ikHJC+V7xzQMQvDxoftOXn1asdIWOPi7NLTjIFdX5r5iQemIP0pAZYAHJ/5UOsmUo26ujLhmUgMvNQAh0J4TrcX4wV+JD8cTr4EBlngC0wnTEPEo7p5gPDKsc0Hsuz404PAkPTPc1YrZsxrD25HlcAC6eN5r40o+KSDanGBW3zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4zqZuhd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4zqZuhd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706628189; x=1738164189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qxOnVoblZEkJgKl9b98dkbzR/chq7oDsfJ4Cd07MrU4=;
  b=a4zqZuhdPVeohL6Cq5ApnjO4y8vlrYl/OsNBVa/Ya0EtbMS+J8qZNAbV
   pkZofEuQy6hH8/hs+ZcFzfQ2wEg7RiCS+FD54t+BKJ2o0gcYNTjJOY4bf
   1T/hDBiunbKnEZIYdew3IhLDDiCc1okRR3H6q6fYU4jCTgbqe/wgTVHL7
   ogrgBfPV61iGRrZqRL1SgWp1QAE3eo0pZZvLCPMQ93/3APaxNr6yThiAF
   aXzUQoXAk0/xep0QSX5f+AL7fX11/mnF4+SER80bCCQKe87wSAAApI9Jv
   Ab67mfSmJ9gpnOsbk4hP2rC9HBA7SzIXaGagTnxNIrdwE3l2bidBI+o28
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="24781889"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="24781889"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 07:21:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="911472207"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="911472207"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Jan 2024 07:21:56 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUpvl-0000SG-02;
	Tue, 30 Jan 2024 15:21:47 +0000
Date: Tue, 30 Jan 2024 23:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulrich Hecht <uli+cip@fpond.eu>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [cip:linux-4.4.y-st-rc 878/1809] arch/m68k/kernel/traps.c:32:10:
 fatal error: linux/extable.h: No such file or directory
Message-ID: <202401302324.d3o6tgup-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
head:   4daf8df4558b5aae717516f7e941014c463772c2
commit: 193e83a8194fcb23b6fb4aea9518a67b786df1c5 [878/1809] m68k: Only force 030 bus error if PC not in exception table
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20240130/202401302324.d3o6tgup-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401302324.d3o6tgup-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401302324.d3o6tgup-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/m68k/kernel/traps.c:32:10: fatal error: linux/extable.h: No such file or directory
    #include <linux/extable.h>
             ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +32 arch/m68k/kernel/traps.c

  > 32	#include <linux/extable.h>
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
