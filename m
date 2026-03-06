Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132926ED33
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 01:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772760516; cv=none; b=eKky1JCf7ybJLH22NVgd9OtDL5rCHUCc+02gZ9jf5YvKOitzZaLw1yBvrKU6YezX74jiOjv6fZxvA/2asuM8Le7sCcyViJJ9UPpDdTBqUppoq0mGAZDRZDcLuFxjEY9nfJNSVvCybybBz8AwdqdoEJ6FI8BRmICZKejS4Yo08RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772760516; c=relaxed/simple;
	bh=hVFeMngjHBjyJLJoTZjlrRdSoRsP9bqJ+ABc8f4U84I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PM5WS4U/P/JJL1mpNnepPk55ATpY5xbLXPhzP7B0i4G7Zfrs9G4TyZ66nknyxL1R4v+WNrIYl3yNkc9TOZoe+ddqD/O4cPaT6DUZZ8pviEhYOrEGltUPiD7olKVlYPcxbPlXoefAI5K2COQV8mU/g7in+yalsfK6Y0X+y7hZkVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wp3LndNg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wp3LndNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772760515; x=1804296515;
  h=date:from:to:cc:subject:message-id;
  bh=hVFeMngjHBjyJLJoTZjlrRdSoRsP9bqJ+ABc8f4U84I=;
  b=Wp3LndNgJrAKlg0cVzvjXc3TeWBAHSSd0tSw5L3gftqCHilcxwodR1YX
   cWmxT/SrwGRNdiXehCRKSvG2mDwhMqym0p24u0H/mYs8SxA+4NXht6Oer
   aPg6FjQVOwrU9BKVG3eT78UfF2cc9u0R2j5KZG4sP6R0BsOJ8KjIAm2C4
   Zh/ZEssJ/9Zf8TLp1NaeKPl+EkvQdn7mKP4iVtmtcMPpkZrbdDwPgQn6F
   ywP6hFQEN8nOWvNrhYAS5l78QqPEEkJEKRIWPtLyGQQyrx0IPUal6ASqc
   vOBBcy6nXsqi1Gihqg7KO0Sso4ryeaVJtCcLmaJeNlmiV3tdmyZmJpmEz
   w==;
X-CSE-ConnectionGUID: pX7UgydESNip31lco1mhMQ==
X-CSE-MsgGUID: /hdryAGfRHmbH9lqGswXmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73740038"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73740038"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 17:28:35 -0800
X-CSE-ConnectionGUID: /drpjsHqTJCYBMEZkVJ0pw==
X-CSE-MsgGUID: c6CUefccSM6i8gMELOu+vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="221688547"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2026 17:28:33 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyJzS-000000000Ab-2e1R;
	Fri, 06 Mar 2026 01:28:30 +0000
Date: Fri, 06 Mar 2026 09:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_bpf_monitors 17/29]
 kernel/trace/rv/rv.c:405:43: warning: 'snprintf' output may be truncated
 before the last format character
Message-ID: <202603060919.XdwGh8kx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_bpf_monitors
head:   3a153b8189ae2fb3a1e680f5092df636abbdac56
commit: 5abaeaa22e49b00fbe28df02cf53919b3864eb73 [17/29] rv: Use static arrays for rv_monitor name and description
config: sparc64-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260306/202603060919.XdwGh8kx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060919.XdwGh8kx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060919.XdwGh8kx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/rv/rv.c: In function 'monitor_desc_read_data':
>> kernel/trace/rv/rv.c:405:43: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     405 |         snprintf(buff, sizeof(buff), "%s\n", mon->description);
         |                                           ^
   kernel/trace/rv/rv.c:405:9: note: 'snprintf' output between 2 and 129 bytes into a destination of size 128
     405 |         snprintf(buff, sizeof(buff), "%s\n", mon->description);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +405 kernel/trace/rv/rv.c

102227b970a152 Daniel Bristot de Oliveira 2022-07-29  393  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  394  /*
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  395   * Interface to read monitors description.
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  396   */
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  397  static ssize_t monitor_desc_read_data(struct file *filp, char __user *user_buf, size_t count,
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  398  				      loff_t *ppos)
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  399  {
24cbfe18d55a68 Nam Cao                    2025-07-24  400  	struct rv_monitor *mon = filp->private_data;
5abaeaa22e49b0 Gabriele Monaco            2026-03-03  401  	char buff[MAX_RV_DESCRIPTION_SIZE];
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  402  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  403  	memset(buff, 0, sizeof(buff));
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  404  
24cbfe18d55a68 Nam Cao                    2025-07-24 @405  	snprintf(buff, sizeof(buff), "%s\n", mon->description);
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  406  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  407  	return simple_read_from_buffer(user_buf, count, ppos, buff, strlen(buff) + 1);
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  408  }
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  409  

:::::: The code at line 405 was first introduced by commit
:::::: 24cbfe18d55a6866bc2e27fda74306f4a1b5cb01 rv: Merge struct rv_monitor_def into struct rv_monitor

:::::: TO: Nam Cao <namcao@linutronix.de>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
