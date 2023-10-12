Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4657E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 01:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAW/3eq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697074741; x=1728610741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KTLugQtnjqnRWObGwTMR+EfbSds/o2ZDGRxH7BWDP1Q=;
  b=XAW/3eq2XA+FC+tEPQhGRlMRJwjFOheb1MPERwQ1aI8TiWnNroBJR1se
   82cDow62JEDsLFgGcRoYBbCFCe0ao6eQ8uaoXeCHMyK17QjUptkeXdNyX
   mfHJA81O5n5qne3vuFdM/Xg+GWi1xv/UtD/2ewPNMpGIJggjcM3Zymyct
   0l8jHhBXO3QeTViPVuDypaXiJPI8L8ZpzudTkJzwijGDQ+qkp/SYqZkWz
   V3TPy2AGW/9WnREakMG9ec5LqOhMB6IkxEdtvhb3QWsvzRSOw4tSrbBh8
   lUsn7nA4zXjJGDdT3mxIn8fJYBTj5A6rwJ+09c51v9eBjprYd4Ndtz+lS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="415859662"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="415859662"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 18:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1085475711"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="1085475711"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Oct 2023 18:38:59 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqkfA-0002yp-2F;
	Thu, 12 Oct 2023 01:38:56 +0000
Date: Thu, 12 Oct 2023 09:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Roesch <shr@devkernel.io>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:io_uring-napi 3/9] net/core/dev.c:6214:6: warning: no
 previous prototype for '__napi_busy_loop'
Message-ID: <202310120924.WXXg95EK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-napi
head:   b57e2332bcb91e0740ce2a7cf47bcdb8870b571a
commit: 1f760c8312577ac66150b4c9163c4163a56ed971 [3/9] net: split off __napi_busy_poll from napi_busy_poll
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231012/202310120924.WXXg95EK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120924.WXXg95EK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120924.WXXg95EK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/dev.c:6214:6: warning: no previous prototype for '__napi_busy_loop' [-Wmissing-prototypes]
    6214 | void __napi_busy_loop(unsigned int napi_id,
         |      ^~~~~~~~~~~~~~~~


vim +/__napi_busy_loop +6214 net/core/dev.c

  6213	
> 6214	void __napi_busy_loop(unsigned int napi_id,
  6215			      bool (*loop_end)(void *, unsigned long),
  6216			      void *loop_end_arg, bool prefer_busy_poll, u16 budget,
  6217			      bool rcu)
  6218	{
  6219		unsigned long start_time = loop_end ? busy_loop_current_time() : 0;
  6220		int (*napi_poll)(struct napi_struct *napi, int budget);
  6221		void *have_poll_lock = NULL;
  6222		struct napi_struct *napi;
  6223	
  6224	restart:
  6225		napi_poll = NULL;
  6226	
  6227		if (!rcu)
  6228			rcu_read_lock();
  6229	
  6230		napi = napi_by_id(napi_id);
  6231		if (!napi)
  6232			goto out;
  6233	
  6234		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
  6235			preempt_disable();
  6236		for (;;) {
  6237			int work = 0;
  6238	
  6239			local_bh_disable();
  6240			if (!napi_poll) {
  6241				unsigned long val = READ_ONCE(napi->state);
  6242	
  6243				/* If multiple threads are competing for this napi,
  6244				 * we avoid dirtying napi->state as much as we can.
  6245				 */
  6246				if (val & (NAPIF_STATE_DISABLE | NAPIF_STATE_SCHED |
  6247					   NAPIF_STATE_IN_BUSY_POLL)) {
  6248					if (prefer_busy_poll)
  6249						set_bit(NAPI_STATE_PREFER_BUSY_POLL, &napi->state);
  6250					goto count;
  6251				}
  6252				if (cmpxchg(&napi->state, val,
  6253					    val | NAPIF_STATE_IN_BUSY_POLL |
  6254						  NAPIF_STATE_SCHED) != val) {
  6255					if (prefer_busy_poll)
  6256						set_bit(NAPI_STATE_PREFER_BUSY_POLL, &napi->state);
  6257					goto count;
  6258				}
  6259				have_poll_lock = netpoll_poll_lock(napi);
  6260				napi_poll = napi->poll;
  6261			}
  6262			work = napi_poll(napi, budget);
  6263			trace_napi_poll(napi, work, budget);
  6264			gro_normal_list(napi);
  6265	count:
  6266			if (work > 0)
  6267				__NET_ADD_STATS(dev_net(napi->dev),
  6268						LINUX_MIB_BUSYPOLLRXPACKETS, work);
  6269			local_bh_enable();
  6270	
  6271			if (!loop_end || loop_end(loop_end_arg, start_time))
  6272				break;
  6273	
  6274			if (unlikely(need_resched())) {
  6275				if (rcu)
  6276					break;
  6277				if (napi_poll)
  6278					busy_poll_stop(napi, have_poll_lock, prefer_busy_poll, budget);
  6279				if (!IS_ENABLED(CONFIG_PREEMPT_RT))
  6280					preempt_enable();
  6281				rcu_read_unlock();
  6282				cond_resched();
  6283				if (loop_end(loop_end_arg, start_time))
  6284					return;
  6285				goto restart;
  6286			}
  6287			cpu_relax();
  6288		}
  6289		if (napi_poll)
  6290			busy_poll_stop(napi, have_poll_lock, prefer_busy_poll, budget);
  6291		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
  6292			preempt_enable();
  6293	out:
  6294		if (!rcu)
  6295			rcu_read_unlock();
  6296	}
  6297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
