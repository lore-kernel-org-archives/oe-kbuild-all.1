Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D08E155C82
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 06:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735885581; cv=none; b=GsxH3pDY+QOWoEReqz7Ox48CyhaPITFSyX35WYr6nesNKoAx/Lsp3JYD0Eiq6TmGuIXHs1Rpvp4XKTKDxm3B+4BOOENDTcoVQb23LkUADEiQv3vgvOp6FzmWCYoziTpl3H/zmMNBIpSgysjvesYevtasSxz40lJ/EtUFvYS6siw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735885581; c=relaxed/simple;
	bh=N2N43UGkcXhNd5WaIzvBq2sgfECzF0+LEBV55yoHUro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XY1n4Bf6ib9YkYJHcqzkf2Gt4pZcOapf6m0fZHluv7+OJh3tZa2fUQMhS5LKv91tqNk/HLQlJQCxJizYN39jU3+GOshGmuAo9DgCOoLNbtcZu12h+MRhDdootrFPO8nfG/dA62nMIm3vXJna9U3jb140L3HMuT/XPbzXtL+Dh/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/ZtZmkB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/ZtZmkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735885579; x=1767421579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N2N43UGkcXhNd5WaIzvBq2sgfECzF0+LEBV55yoHUro=;
  b=A/ZtZmkBYwo5qeUBvZJJczls62vIi7mY0nuSO5AfTk/BR522KlcFE2Ff
   JEoyOSQu4r5Vq19AszxBzZ+BM1v5zTSEboV7bI6xg6pl7zuax0f/I+wY7
   XZCxytW6+7mnckq3cPTzLut7F66Y2mS7/MXXULZUGGdT5oYjBg8EQjhvh
   FjbIBbX51kllApa0uCtTJkPLK9Herx3dvhc/GvSarMYwqdg1PSRc7pqIZ
   QWvg1KJAJ3f/A7hqdupn0yBv1PzaeKq9RIREsxHsmX0gt5C1Naw8h1wZz
   E2LhLdmu38Di5svGzga50FS05nsnQsxxUo4Vuakz8Cu8LMGPrllwaP1YY
   w==;
X-CSE-ConnectionGUID: joOQ/rLBTkK3DyfAK/WknQ==
X-CSE-MsgGUID: MIT4Iw5vQ+i8yxVW1cB8tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36247439"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36247439"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 22:26:18 -0800
X-CSE-ConnectionGUID: 8pYUnQgmSweqwcL+qr/xOg==
X-CSE-MsgGUID: S9RwekoqRouijsSNvMhpIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101787920"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jan 2025 22:26:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTb8R-0009Jk-0G;
	Fri, 03 Jan 2025 06:26:15 +0000
Date: Fri, 3 Jan 2025 14:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: drivers/thermal/thermal_debugfs.c:252:59: warning: '%d' directive
 output may be truncated writing between 1 and 5 bytes into a region of size
 between 3 and 8
Message-ID: <202501031443.lYgZAIKE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 755113d7678681a137c330f7997ceb680adb644e thermal/debugfs: Add thermal cooling device debugfs information
date:   12 months ago
config: csky-randconfig-051-20240716 (https://download.01.org/0day-ci/archive/20250103/202501031443.lYgZAIKE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031443.lYgZAIKE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031443.lYgZAIKE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/thermal_debugfs.c:103:6: warning: no previous prototype for 'thermal_debug_init' [-Wmissing-prototypes]
     103 | void thermal_debug_init(void)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c:329:6: warning: no previous prototype for 'thermal_debug_cdev_state_update' [-Wmissing-prototypes]
     329 | void thermal_debug_cdev_state_update(const struct thermal_cooling_device *cdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c:389:6: warning: no previous prototype for 'thermal_debug_cdev_add' [-Wmissing-prototypes]
     389 | void thermal_debug_cdev_add(struct thermal_cooling_device *cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c:431:6: warning: no previous prototype for 'thermal_debug_cdev_remove' [-Wmissing-prototypes]
     431 | void thermal_debug_cdev_remove(struct thermal_cooling_device *cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c: In function 'cdev_tt_seq_show':
>> drivers/thermal/thermal_debugfs.c:252:59: warning: '%d' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 8 [-Wformat-truncation=]
     252 |                 snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
         |                                                           ^~
   drivers/thermal/thermal_debugfs.c:252:54: note: directive argument in the range [0, 65535]
     252 |                 snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
         |                                                      ^~~~~~~~
   drivers/thermal/thermal_debugfs.c:252:17: note: 'snprintf' output between 5 and 14 bytes into a destination of size 11
     252 |                 snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     253 |                          entry->id >> 16, entry->id & 0xFFFF);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +252 drivers/thermal/thermal_debugfs.c

   233	
   234	static int cdev_tt_seq_show(struct seq_file *s, void *v)
   235	{
   236		struct thermal_debugfs *thermal_dbg = s->private;
   237		struct cdev_debugfs *cdev_dbg = &thermal_dbg->cdev_dbg;
   238		struct list_head *transitions = cdev_dbg->transitions;
   239		struct cdev_record *entry;
   240		int i = *(loff_t *)v;
   241	
   242		if (!i)
   243			seq_puts(s, "Transition\tOccurences\n");
   244	
   245		list_for_each_entry(entry, &transitions[i], node) {
   246			/*
   247			 * Assuming maximum cdev states is 1024, the longer
   248			 * string for a transition would be "1024->1024\0"
   249			 */
   250			char buffer[11];
   251	
 > 252			snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
   253				 entry->id >> 16, entry->id & 0xFFFF);
   254	
   255			seq_printf(s, "%-10s\t%-10llu\n", buffer, entry->count);
   256		}
   257	
   258		return 0;
   259	}
   260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
