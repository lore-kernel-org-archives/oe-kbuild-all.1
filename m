Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF65D353A7E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 21:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407195; cv=none; b=sbtT7FMbwMlXylMp6K9dHwXTK4kcE3y+VeG1+eweacI52e6oyl7cxRSa4djkx9CrqmkIPhV7hygF53qdwZJR/gcJzv88uGqpr7CllmpivhyOC7BayXsep8yIeCB58UaFjGunlJnm0oV78KqUgkfXusLZrE/jmVnd0jRjdXHukyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407195; c=relaxed/simple;
	bh=H7Ht1hZgXODFdEWIDzdylzJlpIgojgIGL6ALl62Z02s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YcJZKbwCuvispoBbi7vvxJS4Dr3GJcZxglZBF2xVs/ciV4GLi5d/2hc4+5bQoaNSOhkJCQjtyB7oykA85ac0vOxDa+adLPQQokuBUBvn7342P+aHB2dHpTn19jNb0I/ahjOg51WzFl0jQKk/WJTNtxrN9KMjAXacpH1Lh+9drfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6oWcIoN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6oWcIoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791407194; x=1822943194;
  h=date:from:to:cc:subject:message-id;
  bh=H7Ht1hZgXODFdEWIDzdylzJlpIgojgIGL6ALl62Z02s=;
  b=A6oWcIoNT9aL5PJdSksCD+mxUtIhMxPy9DOAob1u85eTQf7MgByqoqDi
   bZrHn/GXwLpG3a+nLcJAHmhC3zHkTSi7sqbZkAsLiNfjNwd9kw7MPnOI9
   wNumQSiCYMfmR9x78rUolcgb/Wf7NSbfjZ8q6NFvXzt0KkF87B3yDiE0E
   jGwqHyscv8gdL3PSUFjdpy8CIR5w2h5oP3ICXLgZRRc5uH5ox9zAWt/Gs
   FJi9D9SmDXPW2ieG8zNVDAQuExLYbe9pAwHK+Tg11C/45HwTZ2qH2gGCV
   t7EGvAQz8J55l5kzSdevf/1tlIlK0zCOZbTenru0sd8al+dw2vVIMkY8f
   g==;
X-CSE-ConnectionGUID: oqG+xZ3rThGw2vWSRNHieA==
X-CSE-MsgGUID: HuavsK3YSyG1UIX5uqrEEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="178433"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="178433"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 14:06:34 -0700
X-CSE-ConnectionGUID: FNqTTz5MSC6HX4L9kg5/Rg==
X-CSE-MsgGUID: qKHUaHIOT7q+Q5ElYsl8YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="140876"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 07 Oct 2026 14:06:32 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEYqM-0000000042h-0xvH;
	Wed, 07 Oct 2026 21:06:30 +0000
Date: Wed, 07 Oct 2026 23:05:34 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:mlp 59/59] fs/eventpoll.c:2218:16: error: use of
 undeclared identifier 'ep_lookahead'
Message-ID: <202610072353.dEs8asDo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux mlp
head:   cb749145988a07c430f0cc8004d3d40b4227fe1f
commit: cb749145988a07c430f0cc8004d3d40b4227fe1f [59/59] net, epoll: Make the receive and delivery look-aheads switchable
config: i386-randconfig-2100-20261007 (https://download.01.org/0day-ci/archive/20261007/202610072353.dEs8asDo-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072353.dEs8asDo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072353.dEs8asDo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/eventpoll.c:2218:16: error: use of undeclared identifier 'ep_lookahead'
    2218 |         if (READ_ONCE(ep_lookahead) && !list_empty(&scan_batch)) {
         |                       ^~~~~~~~~~~~
>> fs/eventpoll.c:2218:16: error: use of undeclared identifier 'ep_lookahead'
    2218 |         if (READ_ONCE(ep_lookahead) && !list_empty(&scan_batch)) {
         |                       ^~~~~~~~~~~~
>> fs/eventpoll.c:2218:16: error: use of undeclared identifier 'ep_lookahead'
    2218 |         if (READ_ONCE(ep_lookahead) && !list_empty(&scan_batch)) {
         |                       ^~~~~~~~~~~~
>> fs/eventpoll.c:2218:16: error: use of undeclared identifier 'ep_lookahead'
    2218 |         if (READ_ONCE(ep_lookahead) && !list_empty(&scan_batch)) {
         |                       ^~~~~~~~~~~~
>> fs/eventpoll.c:2218:16: error: use of undeclared identifier 'ep_lookahead'
    2218 |         if (READ_ONCE(ep_lookahead) && !list_empty(&scan_batch)) {
         |                       ^~~~~~~~~~~~
>> fs/eventpoll.c:2218:16: error: use of undeclared identifier 'ep_lookahead'
    2218 |         if (READ_ONCE(ep_lookahead) && !list_empty(&scan_batch)) {
         |                       ^~~~~~~~~~~~
>> fs/eventpoll.c:2218:16: error: use of undeclared identifier 'ep_lookahead'
    2218 |         if (READ_ONCE(ep_lookahead) && !list_empty(&scan_batch)) {
         |                       ^~~~~~~~~~~~
   7 errors generated.


vim +/ep_lookahead +2218 fs/eventpoll.c

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
