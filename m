Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF7618024
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 00:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765497778; cv=none; b=j8JrDpc66sWb8eUOtwIt0oOUMhMxivyNcglJJBnix2+i5Y3FijN0pN1DhvIBdMbdEOPDbwl7z/cwC/9t0mxPNjM7lrdbf23owSO5zp0zIMHpQpzPB/Rh0OPK6n4EhwqhYZEyaRH4fAwsvt1+WtYiNHUhXs+wIc2Ba6bv+pCzHlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765497778; c=relaxed/simple;
	bh=ORkeRMyPW9hIb+5LVOiLufPFZg78Aq9bmcLW2H4T818=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EoE5P7VwGxKQMgfqDXc6BMHmjvXfLd0aFBjNX/sQAZpzVQrQ2eBio4uDLmnto+qcnv6TaWxdhdRYg3tlWD8Rw9XKpHgFmN4zwrxxjWsS9rRULkkoVZICYYICeXMbL+z8KR1+0d2mqD5wrfoNTqlhfnexgc9GLBpUUDnfFoDek50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QN8P5LpW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QN8P5LpW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765497777; x=1797033777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ORkeRMyPW9hIb+5LVOiLufPFZg78Aq9bmcLW2H4T818=;
  b=QN8P5LpW7HB2tALNWbzSG1ZroZP7zmBtPRayf6x+DIWSncKkxW7AULP2
   1Mdrkj1o/mZYnZxgfG/o0qwcmqCB8SOt7WKLornP+TYrreZDqY0y6aHuE
   d/qnZ4AZg9B/RBIQ2Jx9qxMNNq6bwOPNiNi+PXbm2UIS6uMoRi1H/lqha
   H1QlTTVvFL54cs8dqmhPxs+nVAc049NsKaBNDwUbz5m/heZn6LydhyGNz
   RedyKQVkQtunm3b4m0FEAMahDjCDQWA7JE60xGOpJhRZXE1PQqflzU9Jz
   FKz1GF2y8D5oMv4p7+L8LF8Z1L8FhU5qvLKQIOQhvUIGv2045P7as2qqi
   g==;
X-CSE-ConnectionGUID: axgjgczbRzqLlJD2Zsfw7w==
X-CSE-MsgGUID: /oF6bTOuQY+0O0wCqIL91Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67419760"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67419760"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 16:02:56 -0800
X-CSE-ConnectionGUID: fSYMBL7MTVKHdy81aA5zbQ==
X-CSE-MsgGUID: X8N6ZjiNTYm+qvFAkefksw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196018263"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Dec 2025 16:02:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqcW-000000005DD-3dtL;
	Fri, 12 Dec 2025 00:02:52 +0000
Date: Fri, 12 Dec 2025 08:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <amery.hung@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: net/sched/bpf_qdisc.c:224:18: sparse: sparse: symbol
 'bpf_qdisc_init_prologue' was not declared. Should it be static?
Message-ID: <202512120735.5wlwDYyC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 7a2dafda950b78611dc441c83d105dfdc7082681 bpf: net_sched: Add a qdisc watchdog timer
date:   8 months ago
config: s390-randconfig-r122-20251211 (https://download.01.org/0day-ci/archive/20251212/202512120735.5wlwDYyC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120735.5wlwDYyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120735.5wlwDYyC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sched/bpf_qdisc.c:224:18: sparse: sparse: symbol 'bpf_qdisc_init_prologue' was not declared. Should it be static?
>> net/sched/bpf_qdisc.c:234:18: sparse: sparse: symbol 'bpf_qdisc_reset_destroy_epilogue' was not declared. Should it be static?

vim +/bpf_qdisc_init_prologue +224 net/sched/bpf_qdisc.c

   184	
   185	/* bpf_skb_get_hash - Get the flow hash of an skb.
   186	 * @skb: The skb to get the flow hash from.
   187	 */
 > 188	__bpf_kfunc u32 bpf_skb_get_hash(struct sk_buff *skb)
   189	{
   190		return skb_get_hash(skb);
   191	}
   192	
   193	/* bpf_kfree_skb - Release an skb's reference and drop it immediately.
   194	 * @skb: The skb whose reference to be released and dropped.
   195	 */
   196	__bpf_kfunc void bpf_kfree_skb(struct sk_buff *skb)
   197	{
   198		kfree_skb(skb);
   199	}
   200	
   201	/* bpf_qdisc_skb_drop - Drop an skb by adding it to a deferred free list.
   202	 * @skb: The skb whose reference to be released and dropped.
   203	 * @to_free_list: The list of skbs to be dropped.
   204	 */
   205	__bpf_kfunc void bpf_qdisc_skb_drop(struct sk_buff *skb,
   206					    struct bpf_sk_buff_ptr *to_free_list)
   207	{
   208		__qdisc_drop(skb, (struct sk_buff **)to_free_list);
   209	}
   210	
   211	/* bpf_qdisc_watchdog_schedule - Schedule a qdisc to a later time using a timer.
   212	 * @sch: The qdisc to be scheduled.
   213	 * @expire: The expiry time of the timer.
   214	 * @delta_ns: The slack range of the timer.
   215	 */
   216	__bpf_kfunc void bpf_qdisc_watchdog_schedule(struct Qdisc *sch, u64 expire, u64 delta_ns)
   217	{
   218		struct bpf_sched_data *q = qdisc_priv(sch);
   219	
   220		qdisc_watchdog_schedule_range_ns(&q->watchdog, expire, delta_ns);
   221	}
   222	
   223	/* bpf_qdisc_init_prologue - Hidden kfunc called in prologue of .init. */
 > 224	__bpf_kfunc void bpf_qdisc_init_prologue(struct Qdisc *sch)
   225	{
   226		struct bpf_sched_data *q = qdisc_priv(sch);
   227	
   228		qdisc_watchdog_init(&q->watchdog, sch);
   229	}
   230	
   231	/* bpf_qdisc_reset_destroy_epilogue - Hidden kfunc called in epilogue of .reset
   232	 * and .destroy
   233	 */
 > 234	__bpf_kfunc void bpf_qdisc_reset_destroy_epilogue(struct Qdisc *sch)
   235	{
   236		struct bpf_sched_data *q = qdisc_priv(sch);
   237	
   238		qdisc_watchdog_cancel(&q->watchdog);
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
