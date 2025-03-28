Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB25A18DB2B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 05:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743138809; cv=none; b=PPZwibij9EOM7Bog8S/EJMQ2sYB5qjIF4af5Ac9n5qlebEAPhbPr+1UZ9OjJjJGc+YQhg3nEvtR9dVWS5GzKI+GrAqeqL+i2rRWis+JBvNhd+9f4wcLBcI5Mk/lGy0dIyxwFjQBC0T9aCp/py6emeijS18veBWle2SBxgBwNlnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743138809; c=relaxed/simple;
	bh=8Z86Lr6lC/DmWlvchaBReNxcr/AB9mb6bkPVIayzZ3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j9iCzbuuR4dxFbuzJn+6ZCyQsIs0qdW6HVCZnTH6NGjWzenLzHeunjhiAvoyjTn8aW4dZ2iWkt2PAgcm5lhQDG74OI6uyfBQzOC3ICIpYs3D2LG7wgsQ2FwRUwa2Dwuz0w04a/ZcZdQTw9PjC8bys4zd41kJa2P/GrKlrQFOvYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJy3ty3e; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJy3ty3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743138808; x=1774674808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Z86Lr6lC/DmWlvchaBReNxcr/AB9mb6bkPVIayzZ3Y=;
  b=EJy3ty3eNR3mNIuxuvsxJB6C+7bG2kvSlq0pTJtqykHkARY2GhSaWmzj
   Y7P/p3wIG/LNoOdZNixCGhVCJqjaPtQUeTJdmGJcwDj/XF+EtRbqsmTiu
   fWn1XSeY+zuzwa1kmdlBqxodX0lHJz9MmZ/dGwXFpolq36MbrhKtYRe+S
   jRhFWu7cln4UWYY97ALWfJb9SWNb1OJLjlTHOzPgbrvKQ1iJoxOszb3ju
   /ehpMxRI+POzUx1jfXKs/i5BJTdCIkvlHuSBiZcPbYeiLLuBc59ek22ip
   E2Xt+vaJ2OmkbrQZ6/g1huOTzGST8v5ps0Ip4hvP5BpG9UtyQGlbiSRFE
   Q==;
X-CSE-ConnectionGUID: MVmEqBqYRy+afyayJM/k/A==
X-CSE-MsgGUID: eyPpVs5aQOuHFudRe97sUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="47228318"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="47228318"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 22:13:27 -0700
X-CSE-ConnectionGUID: L+87dzAKR++kQEDfKCzi1Q==
X-CSE-MsgGUID: U+5D5PULRS+NBOt9jS5osw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="148528111"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Mar 2025 22:13:26 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty220-00079C-1S;
	Fri, 28 Mar 2025 05:13:24 +0000
Date: Fri, 28 Mar 2025 13:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/scx-dlserver-boost 16/16]
 kernel/sched/deadline.c:1765:5: warning: no previous prototype for
 'dl_server_remove_params'
Message-ID: <202503281332.9AKB1j91-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/scx-dlserver-boost
head:   153b74fef19625181700e52ed4017330372a961e
commit: 153b74fef19625181700e52ed4017330372a961e [16/16] Add a function to remove the dl_server's bw reservation
config: sh-randconfig-002-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281332.9AKB1j91-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281332.9AKB1j91-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281332.9AKB1j91-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:60:
>> kernel/sched/deadline.c:1765:5: warning: no previous prototype for 'dl_server_remove_params' [-Wmissing-prototypes]
    1765 | int dl_server_remove_params(struct sched_dl_entity *dl_se)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   {standard input}: Assembler messages:
   {standard input}:5761: Error: offset to unaligned destination
   {standard input}:5932: Error: offset to unaligned destination


vim +/dl_server_remove_params +1765 kernel/sched/deadline.c

  1755	
  1756	/**
  1757	 * dl_server_remove_params - Remove bandwidth reservation for a DL server
  1758	 * @dl_se: The DL server entity to remove bandwidth for
  1759	 *
  1760	 * This function removes the bandwidth reservation for a DL server entity,
  1761	 * cleaning up all bandwidth accounting and server state.
  1762	 *
  1763	 * Returns: 0 on success, negative error code on failure
  1764	 */
> 1765	int dl_server_remove_params(struct sched_dl_entity *dl_se)
  1766	{
  1767	    struct rq *rq = dl_se->rq;
  1768	    int cpu = cpu_of(rq);
  1769	    struct dl_bw *dl_b;
  1770	    int cpus;
  1771	
  1772	    if (!dl_se->dl_runtime)
  1773	        return 0;  /* Already disabled */
  1774	
  1775	    /*
  1776		 * First dequeue if still queued. It should not be queued since
  1777		 * we call this only after the last dl_server_stop().
  1778		 */
  1779	    if (WARN_ON_ONCE(on_dl_rq(dl_se)))
  1780	        dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
  1781	
  1782	    /* Cancel any pending timers */
  1783	    hrtimer_try_to_cancel(&dl_se->dl_timer);
  1784	    hrtimer_try_to_cancel(&dl_se->inactive_timer);
  1785	
  1786	    
  1787		/* Remove bandwidth from both runqueue and root domain accounting */
  1788	    dl_b = dl_bw_of(cpu);
  1789	    guard(raw_spinlock)(&dl_b->lock);
  1790	    cpus = dl_bw_cpus(cpu);
  1791	
  1792	    sub_rq_bw(dl_se, &rq->dl);
  1793	    __dl_sub(dl_b, dl_se->dl_bw, cpus);
  1794	
  1795	    /*
  1796	     * If server was active and consuming bandwidth, remove it from
  1797	     * running bandwidth accounting. This should not happen because
  1798	     * we call this only after the last dl_server_stop().
  1799	     */
  1800	    if (WARN_ON_ONCE(!dl_se->dl_non_contending))
  1801	        sub_running_bw(dl_se, &rq->dl);
  1802	
  1803	    /*
  1804		 * Clear all server parameters. This will also clear ->dl_server so
  1805		 * the next dl_server_apply_params() will reconfigure the server.
  1806		 */
  1807	    __dl_clear_params(dl_se);
  1808	
  1809	    return 0;
  1810	}
  1811	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
