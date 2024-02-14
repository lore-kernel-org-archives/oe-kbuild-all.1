Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11EE1CA81
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 12:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707913194; cv=none; b=rzBtqgWRaE8QajSvSP+5sasgvkdRZzOVD4gPvdzWngaG+KlwT6t17rQ+8s+O5xVRgvy0s6QzM9Oq8REkY4OUpuH0hba8TUWkfd/m5JorAsB6Mb0dyeiFYnSnno0Lq7q9esQRJPB1i/xUs4T73N9aVhTkKuPJTSsvh85ygQfa6dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707913194; c=relaxed/simple;
	bh=VnEiM+8ohEkdfBafv2VsDLDci+zKSZM9r1ZJcgeWypQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W73LzL0C6TnWCbkeKTPww2iYMRhYuFHp9aAvNXVfbc4D1Pvg0zZKAY5KOxA98wDRPerwcPYE52f1GkW7FCrchTA76FrigpHPvv/noUSI48++FcQHMCKNB65DvROVVBPxnSAJlRb1QHhXoVL9el3VDVgeUA7+w7+uxjm2+aqcank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RsSaMDgf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsSaMDgf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707913192; x=1739449192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VnEiM+8ohEkdfBafv2VsDLDci+zKSZM9r1ZJcgeWypQ=;
  b=RsSaMDgfK0+esZz8T2yyDZ78ijf8IyohFJlC9rO+HDtYo8azXgnRRxd/
   8S3mYfyqL3yfsitywAUMF/RzkZ9HJXFwvJBhe8zmmoDgAPVlU7Xx1EM2W
   MMZXIWf6TRc5y6+UW0TICSr1MVSa/nBtuPeiAdGOf8S0dtcVCVSpdWlnN
   GmxxE6TzzvNCJlaEVXL32grtxDeH2wrRe1VNZBMpqnYkuBFmSOiwPl+9M
   CEyDX7QT36MPV9nzHB2SNGfD3pFN/MdjZEo3vPsteS5fgO3TSuulAxNaL
   QxknnMs+azJtQvXm0CMBw8ULA16+A+T7ppfkuT4YiCghO1JENXXdXD5Re
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19368314"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="19368314"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 04:19:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3239089"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Feb 2024 04:19:50 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raEEu-0008lI-0R;
	Wed, 14 Feb 2024 12:19:48 +0000
Date: Wed, 14 Feb 2024 20:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:dlserver-feb-fixes 1/9] kernel/sched/deadline.c:2293:28:
 warning: 'pick_task_dl' defined but not used
Message-ID: <202402142010.v2iLoCSc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git dlserver-feb-fixes
head:   a81d7e41130fa46e91bde4dd820f673250934286
commit: 60503246d2cf0d7b91d18325cb21c24c13f1d40d [1/9] sched/core: Add clearing of ->dl_server in put_prev_task_balance()
config: csky-randconfig-r081-20240214 (https://download.01.org/0day-ci/archive/20240214/202402142010.v2iLoCSc-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402142010.v2iLoCSc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402142010.v2iLoCSc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:53:
   kernel/sched/deadline.c: In function 'dl_server_init':
   kernel/sched/deadline.c:1563:16: error: 'struct sched_dl_entity' has no member named 'server_pick_next'; did you mean 'server_pick'?
    1563 |         dl_se->server_pick_next = pick_next;
         |                ^~~~~~~~~~~~~~~~
         |                server_pick
   kernel/sched/deadline.c:1564:16: error: 'struct sched_dl_entity' has no member named 'server_pick_task'; did you mean 'server_has_tasks'?
    1564 |         dl_se->server_pick_task = pick_task;
         |                ^~~~~~~~~~~~~~~~
         |                server_has_tasks
   kernel/sched/deadline.c: In function 'pick_task_dl_next':
   kernel/sched/deadline.c:2278:28: error: 'struct sched_dl_entity' has no member named 'server_pick_next'; did you mean 'server_pick'?
    2278 |                 p = dl_se->server_pick_next(dl_se);
         |                            ^~~~~~~~~~~~~~~~
         |                            server_pick
   kernel/sched/deadline.c: In function 'pick_task_dl':
   kernel/sched/deadline.c:2307:28: error: 'struct sched_dl_entity' has no member named 'server_pick_task'; did you mean 'server_has_tasks'?
    2307 |                 p = dl_se->server_pick_task(dl_se);
         |                            ^~~~~~~~~~~~~~~~
         |                            server_has_tasks
   kernel/sched/deadline.c: At top level:
>> kernel/sched/deadline.c:2293:28: warning: 'pick_task_dl' defined but not used [-Wunused-function]
    2293 | static struct task_struct *pick_task_dl(struct rq *rq)
         |                            ^~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c:968:13: warning: '__disable_runtime' defined but not used [-Wunused-function]
     968 | static void __disable_runtime(struct rq *rq) { }
         |             ^~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:967:13: warning: '__enable_runtime' defined but not used [-Wunused-function]
     967 | static void __enable_runtime(struct rq *rq) { }
         |             ^~~~~~~~~~~~~~~~


vim +/pick_task_dl +2293 kernel/sched/deadline.c

  2263	
  2264	static struct task_struct *pick_task_dl_next(struct rq *rq)
  2265	{
  2266		struct sched_dl_entity *dl_se;
  2267		struct dl_rq *dl_rq = &rq->dl;
  2268		struct task_struct *p;
  2269	
  2270	again:
  2271		if (!sched_dl_runnable(rq))
  2272			return NULL;
  2273	
  2274		dl_se = pick_next_dl_entity(dl_rq);
  2275		BUG_ON(!dl_se);
  2276	
  2277		if (dl_server(dl_se)) {
  2278			p = dl_se->server_pick_next(dl_se);
  2279			if (!p) {
  2280				WARN_ON_ONCE(1);
  2281				dl_se->dl_yielded = 1;
  2282				update_curr_dl_se(rq, dl_se, 0);
  2283				goto again;
  2284			}
  2285			p->dl_server = dl_se;
  2286		} else {
  2287			p = dl_task_of(dl_se);
  2288			p->dl_server = NULL;
  2289		}
  2290	
  2291		return p;
  2292	}
> 2293	static struct task_struct *pick_task_dl(struct rq *rq)
  2294	{
  2295		struct sched_dl_entity *dl_se;
  2296		struct dl_rq *dl_rq = &rq->dl;
  2297		struct task_struct *p;
  2298	
  2299	again:
  2300		if (!sched_dl_runnable(rq))
  2301			return NULL;
  2302	
  2303		dl_se = pick_next_dl_entity(dl_rq);
  2304		WARN_ON_ONCE(!dl_se);
  2305	
  2306		if (dl_server(dl_se)) {
  2307			p = dl_se->server_pick_task(dl_se);
  2308			if (!p) {
  2309				WARN_ON_ONCE(1);
  2310				goto again;
  2311			}
  2312	
  2313			/* Set after ->server_pick_task() since that may clear it. */
  2314			p->dl_server = dl_se;
  2315		} else {
  2316			p = dl_task_of(dl_se);
  2317		}
  2318	
  2319		return p;
  2320	}
  2321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
