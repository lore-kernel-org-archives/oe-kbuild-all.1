Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6704B14262
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z65bqxdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697615965; x=1729151965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xmFqrC6GPHRxmIJe9ZABjv+SCnNHqqauRuw/TG6UZzI=;
  b=Z65bqxdTJZC7SWlO/OeFXfAFvN+ZAbA0U6Cb02tZm8Xcz7kSy0XDAvn4
   CNGyQ6WSL/0yKjmwAib+uqGbgI7F0/bWXovb+ZvA/AGfIitMX9g4RUOxw
   xXcD02iobL8nKdBS/mMjjOF/fLwbWmWgyup6Syp0K6rSMCiW4S9InQOLi
   EEaA0Tr2VgbPoRgdtpAoMPpNJZSAKEG+UQZd8yNlQ92xYOq9P87SmvwEu
   uLMPbTf3OUE1YMp4XtFH1BW86XE6wQ25VMasrFjhtXriiBEUtvCP+zh5D
   yo34MBl4XssIMJHGBssi7136hvhgeZeccqwhIbPHMm0fH0QR1G4eImftM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="365314543"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="365314543"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 00:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="4247329"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2023 00:58:16 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt1Sb-00005s-0i;
	Wed, 18 Oct 2023 07:59:21 +0000
Date: Wed, 18 Oct 2023 15:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 489/503] kernel/time/timekeeping.c:2348: warning:
 expecting prototype for ktime_get_mg_fine_ts64(). Prototype was for
 ktime_get_mg_coarse_ts64() instead
Message-ID: <202310181550.lLfUWB9y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   0d0fa93dc3485860ccb1e818fc5d765f0dc2bfa8
commit: c861516143b8a48f48e925b2703c42f7489e3c51 [489/503] timekeeping: new interfaces for multigrain timestamp handing
config: x86_64-randconfig-071-20231018 (https://download.01.org/0day-ci/archive/20231018/202310181550.lLfUWB9y-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181550.lLfUWB9y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181550.lLfUWB9y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timekeeping.c:2348: warning: expecting prototype for ktime_get_mg_fine_ts64(). Prototype was for ktime_get_mg_coarse_ts64() instead
   kernel/time/timekeeping.c:2503: warning: Function parameter or member 'txc' not described in 'do_adjtimex'
   kernel/time/timekeeping.c:2571: warning: Function parameter or member 'phase_ts' not described in 'hardpps'
   kernel/time/timekeeping.c:2571: warning: Function parameter or member 'raw_ts' not described in 'hardpps'


vim +2348 kernel/time/timekeeping.c

  2330	
  2331	/**
  2332	 * ktime_get_mg_fine_ts64 - Returns a fine-grained time of day in a timespec64
  2333	 * @ts: pointer to the timespec64 to be set
  2334	 *
  2335	 * Multigrain filesystems use a scheme where they use coarse-grained
  2336	 * timestamps most of the time, but will use a fine-grained timestamp
  2337	 * if the previous timestamp was queried and the coarse-grained clock
  2338	 * hasn't ticked yet.
  2339	 *
  2340	 * For this case, the caller is requesting a coarse-grained timestamp,
  2341	 * which will always be equal to or later than the latest fine-grained
  2342	 * timestamp that has been handed out.
  2343	 *
  2344	 * Fills in @ts with the current coarse-grained time of day, suitable
  2345	 * for a file timestamp.
  2346	 */
  2347	void ktime_get_mg_coarse_ts64(struct timespec64 *ts)
> 2348	{
  2349		struct timekeeper *tk = &tk_core.timekeeper;
  2350		unsigned int seq;
  2351		u64 nsec;
  2352	
  2353		do {
  2354			seq = read_seqcount_begin(&tk_core.seq);
  2355	
  2356			*ts = tk_xtime(tk);
  2357			nsec = tk->mg_nsec;
  2358		} while (read_seqcount_retry(&tk_core.seq, seq));
  2359	
  2360		if (nsec != TK_MG_NSEC_IGNORE) {
  2361			ts->tv_nsec = 0;
  2362			timespec64_add_ns(ts, nsec);
  2363		}
  2364	}
  2365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
