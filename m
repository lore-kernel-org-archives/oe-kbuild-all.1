Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC2C3932F9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 20:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791406535; cv=none; b=Pavx/Vs9NJht4wihzkD0p3GOwsBhI+yY9ly/8b5z40M/n2pc0B3u8gl4QVtgjzGpEwoMAK4uVTiy+t0A2SJyFG/XghJrHHVBkfZ8DF+iuTxBeAUIj63wz3iflRxHlN6LlpPmClRKkbYE3T8PLGwpTAH5guC6HERa132Up0qCl/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791406535; c=relaxed/simple;
	bh=DEOOC1yWieW2hmxA0Oraj/Enm5NdbtnypcIM30fvRZM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CWLlx5E1+v2PetJIlhPGoNgAvdoKU+wyzqQGXc2/lgyfji47Unt/uI8TkqhHkfG1pCspijPvhA++LsQFXOdDkFp3+LguseNe4zaE49dY9OtjTWznPUPPRqiflzYUfCkwbJ2hKaXHpiQPHG7EGcCNE3sho3k+JPCfUjqzfb7NTBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqec4EAA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqec4EAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791406534; x=1822942534;
  h=date:from:to:cc:subject:message-id;
  bh=DEOOC1yWieW2hmxA0Oraj/Enm5NdbtnypcIM30fvRZM=;
  b=fqec4EAA5P8DZdwOQ8xHH5nV1KNg6rHGevJVr3MHflEHGmPjssbPzk4H
   8xejjwoC1eb1hVCidL2Q84poD5blaut1gRNEe1MZniXyBPrRfWn08mwAa
   e1r/j55Z0MxjhFUs0C47pjK2NsvkediEDMT/3gqg6VvEqYaiguf4iM/uu
   xcAtL6WFXXRMmMCDK+eq1bcD0U4IGLr4EQyN+EK0kYpC9EJiz5LdCelJn
   ccdyQ6OguMv182cavrg3ZZKTjyKcfBTgA0mdV+Sj6WetpE4bzXEAcGxZY
   niixkZbR+4LCrLezrnKC2GTJ09Z/vFZb176FVOiHzC0G39ft7s5OwEi56
   w==;
X-CSE-ConnectionGUID: ErXENy27T6WwDTdtoj0J4g==
X-CSE-MsgGUID: /j/VIZKnSsCxRGdRgClggw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="177397"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="177397"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:55:33 -0700
X-CSE-ConnectionGUID: KH8WOHgrT+e7Xbdm3zk/Jg==
X-CSE-MsgGUID: XqIo2XA9Rsu6lC7kBfh0+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="303808993"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 07 Oct 2026 13:55:31 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEYfh-0000000041f-28zb;
	Wed, 07 Oct 2026 20:55:29 +0000
Date: Wed, 07 Oct 2026 22:55:03 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:mlp 59/59] fs/eventpoll.c:2218:16: error:
 'ep_lookahead' undeclared; did you mean 'ep_send_lookahead'?
Message-ID: <202610072234.3UFRGNgM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux mlp
head:   cb749145988a07c430f0cc8004d3d40b4227fe1f
commit: cb749145988a07c430f0cc8004d3d40b4227fe1f [59/59] net, epoll: Make the receive and delivery look-aheads switchable
config: s390-randconfig-2000-20261007 (https://download.01.org/0day-ci/archive/20261007/202610072234.3UFRGNgM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072234.3UFRGNgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072234.3UFRGNgM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/eventpoll.c: In function 'ep_send_events':
>> fs/eventpoll.c:2218:16: error: 'ep_lookahead' undeclared (first use in this function); did you mean 'ep_send_lookahead'?
     if (READ_ONCE(ep_lookahead) && !list_empty(&scan_batch)) {
                   ^~~~~~~~~~~~
   include/linux/compiler_types.h:682:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:2218:6: note: in expansion of macro 'READ_ONCE'
     if (READ_ONCE(ep_lookahead) && !list_empty(&scan_batch)) {
         ^~~~~~~~~
   fs/eventpoll.c:2218:16: note: each undeclared identifier is reported only once for each function it appears in
     if (READ_ONCE(ep_lookahead) && !list_empty(&scan_batch)) {
                   ^~~~~~~~~~~~
   include/linux/compiler_types.h:682:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:2218:6: note: in expansion of macro 'READ_ONCE'
     if (READ_ONCE(ep_lookahead) && !list_empty(&scan_batch)) {
         ^~~~~~~~~


vim +2218 fs/eventpoll.c

  2191	
  2192	static int ep_send_events(struct eventpoll *ep,
  2193				  struct epoll_event __user *events, int maxevents)
  2194	{
  2195		struct ep_send_lookahead la = {};
  2196		struct epitem *epi, *tmp;
  2197		LIST_HEAD(scan_batch);
  2198		poll_table pt;
  2199		int res = 0;
  2200	
  2201		/*
  2202		 * Always short-circuit for fatal signals to allow threads to make a
  2203		 * timely exit without the chance of finding more events available and
  2204		 * fetching repeatedly.
  2205		 */
  2206		if (fatal_signal_pending(current))
  2207			return -EINTR;
  2208	
  2209		init_poll_funcptr(&pt, NULL);
  2210	
  2211		mutex_lock(&ep->mtx);
  2212		ep_start_scan(ep, &scan_batch);
  2213	
  2214		/*
  2215		 * We can loop without lock because we are passed a task-private
  2216		 * scan_batch; items cannot vanish while we hold ep->mtx.
  2217		 */
> 2218		if (READ_ONCE(ep_lookahead) && !list_empty(&scan_batch)) {
  2219			la.item = list_first_entry(&scan_batch, struct epitem, rdllink);
  2220			ep_send_lookahead_step(&la, &scan_batch);
  2221			ep_send_lookahead_step(&la, &scan_batch);
  2222			ep_send_lookahead_step(&la, &scan_batch);
  2223		}
  2224	
  2225		list_for_each_entry_safe(epi, tmp, &scan_batch, rdllink) {
  2226			int delivered;
  2227	
  2228			if (res >= maxevents)
  2229				break;
  2230	
  2231			if (la.item || la.file || la.sock)
  2232				ep_send_lookahead_step(&la, &scan_batch);
  2233			delivered = ep_deliver_event(ep, epi, &pt, &events, &scan_batch);
  2234			if (delivered < 0) {
  2235				if (!res)
  2236					res = delivered;
  2237				break;
  2238			}
  2239			res += delivered;
  2240		}
  2241	
  2242		ep_done_scan(ep, &scan_batch);
  2243		mutex_unlock(&ep->mtx);
  2244	
  2245		return res;
  2246	}
  2247	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
