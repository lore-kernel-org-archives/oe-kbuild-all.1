Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D616C860
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Aug 2024 15:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724599667; cv=none; b=D/liiokQUiZsZ7CisgDKNRLy1W6K7x7VbEc354RSU/0o8F3089UfGTTkX9FulbSRLYkZv8GVCrflQLKbG3ShwgG9OdUD4trkkbgfqORSdgNtAPaWa+JPc2HOsvfUIt85lwIAhyRcx3fMa2FWiUdaJ29BXrHK9tyPwve4cR7L81c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724599667; c=relaxed/simple;
	bh=se+r/qzScdpFWkptpG2JXbVKbXtR+WHG7xNXsqMioRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=htTq8IfVjsx+IHNl/BtSjGLALU+J9Gizx/hthrlH19V0v08keJxSwYvcCa5ypN9Qg5DutJh9nMfaq1Da1ajFQNmJKzmFp8TiDmkN2wX1AdxXhg9n5t4uNG6OysSV7krN4bdscCyMH1CzdDrnQVjPZ+/O1NPaSyEjtKN0Rfa9wrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqwcfV3f; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqwcfV3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724599665; x=1756135665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=se+r/qzScdpFWkptpG2JXbVKbXtR+WHG7xNXsqMioRU=;
  b=CqwcfV3fHvHcfZ/XUCwPVlRi6dkW7sywvOu7Ai1CvgCdEaf2vEmHArko
   OL6rfvjs1zvduzZ6BjU02AjbYlERZyK8Xjpkz8Q09F5rf1t79BUU0zJ9u
   ktusd5QesUF6xsCbCWySABqCDILYLYKVyExuDD1e1VNcIY97s4BLgQcqY
   ULdHeSAUIL+1WvKCeZ7yqbODGHTPc5JhcAp2o6thTLENxjNvy2CAEzwjY
   XofR3to6vtvx0CXuAtkqzaZdKYcOiB9/Ah1+VbCLZJMsfhLPmXWGn/EFS
   LLpDxW4DtsJMdaiiIoofsbAEzpgRN9mqEORsSoA57iBhpxPEDl+mhO2XI
   g==;
X-CSE-ConnectionGUID: 4H3bBIttRmeKPtyyOaAKDA==
X-CSE-MsgGUID: HcKX0jQEQOGPNd+bYSthHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="48409744"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="48409744"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 08:27:44 -0700
X-CSE-ConnectionGUID: KkCKQ+twSKKqlm9BTyg3QQ==
X-CSE-MsgGUID: 8MF8s1axRz+V0xUAOOYKBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="62118986"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Aug 2024 08:27:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siF9Y-000FGC-1a;
	Sun, 25 Aug 2024 15:27:40 +0000
Date: Sun, 25 Aug 2024 23:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yufan <chenyufan@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:timers/core 5/5] kernel/time/timekeeping.c:220:21: sparse:
 sparse: incompatible types in comparison expression (different signedness):
Message-ID: <202408252309.2gUjhXOF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
head:   42db2c2cb5ac3572380a9489b8f8bbe0e534dfc7
commit: 42db2c2cb5ac3572380a9489b8f8bbe0e534dfc7 [5/5] timekeeping: Use time_after() in timekeeping_check_update()
config: x86_64-randconfig-121-20240825 (https://download.01.org/0day-ci/archive/20240825/202408252309.2gUjhXOF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240825/202408252309.2gUjhXOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408252309.2gUjhXOF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/timekeeping.c:220:21: sparse: sparse: incompatible types in comparison expression (different signedness):
   kernel/time/timekeeping.c:220:21: sparse:    unsigned long *
   kernel/time/timekeeping.c:220:21: sparse:    long *
   kernel/time/timekeeping.c:230:21: sparse: sparse: incompatible types in comparison expression (different signedness):
   kernel/time/timekeeping.c:230:21: sparse:    unsigned long *
   kernel/time/timekeeping.c:230:21: sparse:    long *
   kernel/time/timekeeping.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +220 kernel/time/timekeeping.c

   203	
   204		u64 max_cycles = tk->tkr_mono.clock->max_cycles;
   205		const char *name = tk->tkr_mono.clock->name;
   206	
   207		if (offset > max_cycles) {
   208			printk_deferred("WARNING: timekeeping: Cycle offset (%lld) is larger than allowed by the '%s' clock's max_cycles value (%lld): time overflow danger\n",
   209					offset, name, max_cycles);
   210			printk_deferred("         timekeeping: Your kernel is sick, but tries to cope by capping time updates\n");
   211		} else {
   212			if (offset > (max_cycles >> 1)) {
   213				printk_deferred("INFO: timekeeping: Cycle offset (%lld) is larger than the '%s' clock's 50%% safety margin (%lld)\n",
   214						offset, name, max_cycles >> 1);
   215				printk_deferred("      timekeeping: Your kernel is still fine, but is feeling a bit nervous\n");
   216			}
   217		}
   218	
   219		if (tk->underflow_seen) {
 > 220			if (time_after(jiffies, tk->last_warning + WARNING_FREQ)) {
   221				printk_deferred("WARNING: Underflow in clocksource '%s' observed, time update ignored.\n", name);
   222				printk_deferred("         Please report this, consider using a different clocksource, if possible.\n");
   223				printk_deferred("         Your kernel is probably still fine.\n");
   224				tk->last_warning = jiffies;
   225			}
   226			tk->underflow_seen = 0;
   227		}
   228	
   229		if (tk->overflow_seen) {
   230			if (time_after(jiffies, tk->last_warning + WARNING_FREQ)) {
   231				printk_deferred("WARNING: Overflow in clocksource '%s' observed, time update capped.\n", name);
   232				printk_deferred("         Please report this, consider using a different clocksource, if possible.\n");
   233				printk_deferred("         Your kernel is probably still fine.\n");
   234				tk->last_warning = jiffies;
   235			}
   236			tk->overflow_seen = 0;
   237		}
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
