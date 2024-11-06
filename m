Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0961E190468
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 03:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730864529; cv=none; b=j+0zkz0NL8BFn4h9WU78E9ujbn76A8yP0FROaIHAGHOPMpBKdWGJn4dONrLPRMDFbCYqlvApj5650HiM48aDs8hQJxXZ4eXRFTi3USPjrWTOCHh06DjMBnTGZhZsHHtWGzdqocbGRphpS4THGmvJ4p088iYQh6DabOWuewaDHKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730864529; c=relaxed/simple;
	bh=xSJTKYxoOamfz2wg1PDFOwW9VCkvO/AKT31MJI8Ml54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HHdaj6Hqe+IAO+peAIVdbUBfKbe9pXKRzb3nL2M8Y3eoJxVjmLWbwy5Gt4en0ZvUKhWJZWrsxyQzt/HqiG2QP8l3qVcbXRK/lDNC8CV2qmqmzS/PlYaixr2NOMKZVu7KHtsSUqYACvVkgiDePxM6Wlrag6RcMnuMGs1W9xu6osg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aeWeH8j/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aeWeH8j/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730864528; x=1762400528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSJTKYxoOamfz2wg1PDFOwW9VCkvO/AKT31MJI8Ml54=;
  b=aeWeH8j/ZSrXXLNdA1pDyzwBdErjYWLpzz/Q/ymxFqabD1CC6lIovJKH
   hWHK6nBNByH6s8OiQfc1gI36NZlZXuxfgk8yZF76ezrrTDZ0bTF2VdL5S
   34PKYlt2VUJrZSerY44F9vHgd5hByWFQ1DKQBHDaGteayMGRdYqjTfKHC
   QfIEVRRc46y19wNvsRhJQT5HLMZSq3QmRTnbGxJuz0oq0teQE/xq3Xp63
   dVbMJo4Yvb6L1ugSOD4FooF+kI5npDAWoeHcSkz2eBokhcr9S3ul6p97b
   Y2FRe3OcHtsbYU/AltufxT5FhQaUcM9xNs0Qvw7+sitb/+e3/2k9iQj4G
   Q==;
X-CSE-ConnectionGUID: Bxfypz1xSDyIgIf0p/WO4g==
X-CSE-MsgGUID: /NqpGVfCSRu99VIPdyXv4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="33490358"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="33490358"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 19:42:06 -0800
X-CSE-ConnectionGUID: 3NUkfMtMS+ui9QT9kYmvPQ==
X-CSE-MsgGUID: 9CepDxtTQpKxvMRQJ2bLug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="89442039"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2024 19:42:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Wvj-000mu4-15;
	Wed, 06 Nov 2024 03:42:03 +0000
Date: Wed, 6 Nov 2024 11:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/tick-sched 1/2] kernel/time/timer_list.c:157:22:
 error: 'struct tick_sched' has no member named 'last_tick'; did you mean
 'next_tick'?
Message-ID: <202411061150.3J3SJsIC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git timers/tick-sched
head:   d67df7dbb69ed36e14b2a422701f94c99b326759
commit: 23222c256db9ba9f5fea170e21083cb7afb78509 [1/2] tick-sched: Remove last_tick and calculate next tick from now
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241106/202411061150.3J3SJsIC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061150.3J3SJsIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061150.3J3SJsIC-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/timer_list.c: In function 'print_cpu':
>> kernel/time/timer_list.c:157:22: error: 'struct tick_sched' has no member named 'last_tick'; did you mean 'next_tick'?
     157 |                 P_ns(last_tick);
         |                      ^~~~~~~~~
   kernel/time/timer_list.c:149:57: note: in definition of macro 'P_ns'
     149 |                    (unsigned long long)(ktime_to_ns(ts->x)))
         |                                                         ^


vim +157 kernel/time/timer_list.c

289f480af87e45 Ingo Molnar         2007-02-16  142  
289f480af87e45 Ingo Molnar         2007-02-16  143  #ifdef CONFIG_TICK_ONESHOT
289f480af87e45 Ingo Molnar         2007-02-16  144  # define P(x) \
9b04bd27564cfd David Miller        2007-05-09  145  	SEQ_printf(m, "  .%-15s: %Lu\n", #x, \
9b04bd27564cfd David Miller        2007-05-09  146  		   (unsigned long long)(ts->x))
289f480af87e45 Ingo Molnar         2007-02-16  147  # define P_ns(x) \
9b04bd27564cfd David Miller        2007-05-09  148  	SEQ_printf(m, "  .%-15s: %Lu nsecs\n", #x, \
9b04bd27564cfd David Miller        2007-05-09  149  		   (unsigned long long)(ktime_to_ns(ts->x)))
a478ffb2ae234e Frederic Weisbecker 2024-02-25  150  # define P_flag(x, f)			    \
a478ffb2ae234e Frederic Weisbecker 2024-02-25  151  	SEQ_printf(m, "  .%-15s: %d\n", #x, !!(ts->flags & (f)))
a478ffb2ae234e Frederic Weisbecker 2024-02-25  152  
289f480af87e45 Ingo Molnar         2007-02-16  153  	{
289f480af87e45 Ingo Molnar         2007-02-16  154  		struct tick_sched *ts = tick_get_tick_sched(cpu);
7988e5ae2be70b Frederic Weisbecker 2024-02-25  155  		P_flag(nohz, TS_FLAG_NOHZ);
7988e5ae2be70b Frederic Weisbecker 2024-02-25  156  		P_flag(highres, TS_FLAG_HIGHRES);
f5d411c91ede16 Frederic Weisbecker 2011-07-31 @157  		P_ns(last_tick);
a478ffb2ae234e Frederic Weisbecker 2024-02-25  158  		P_flag(tick_stopped, TS_FLAG_STOPPED);
289f480af87e45 Ingo Molnar         2007-02-16  159  		P(idle_jiffies);
289f480af87e45 Ingo Molnar         2007-02-16  160  		P(idle_calls);
289f480af87e45 Ingo Molnar         2007-02-16  161  		P(idle_sleeps);
289f480af87e45 Ingo Molnar         2007-02-16  162  		P_ns(idle_entrytime);
5df7fa1c62146a Thomas Gleixner     2008-02-01  163  		P_ns(idle_waketime);
5df7fa1c62146a Thomas Gleixner     2008-02-01  164  		P_ns(idle_exittime);
289f480af87e45 Ingo Molnar         2007-02-16  165  		P_ns(idle_sleeptime);
0224cf4c5ee0d7 Arjan van de Ven    2010-05-09  166  		P_ns(iowait_sleeptime);
289f480af87e45 Ingo Molnar         2007-02-16  167  		P(last_jiffies);
c1ad348b452aac Thomas Gleixner     2015-04-14  168  		P(next_timer);
289f480af87e45 Ingo Molnar         2007-02-16  169  		P_ns(idle_expires);
9b04bd27564cfd David Miller        2007-05-09  170  		SEQ_printf(m, "jiffies: %Lu\n",
9b04bd27564cfd David Miller        2007-05-09  171  			   (unsigned long long)jiffies);
289f480af87e45 Ingo Molnar         2007-02-16  172  	}
289f480af87e45 Ingo Molnar         2007-02-16  173  #endif
289f480af87e45 Ingo Molnar         2007-02-16  174  

:::::: The code at line 157 was first introduced by commit
:::::: f5d411c91ede162240f34e05a233f2759412988e nohz: Rename ts->idle_tick to ts->last_tick

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Frederic Weisbecker <fweisbec@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
