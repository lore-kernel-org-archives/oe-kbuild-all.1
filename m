Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25EF1E5B95
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 20:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749242972; cv=none; b=pBpTu2kx+uJPuQLWh6+h13YA2C3BnzZ3pOGEkZS4wZO7OoIaCzsrTsgtRyWK9LReH3XFUgbYTPo+mNQV13W2n88ZMwV1z64QZRlhWUbJVYIaZmA5M8Ekq872DooNZp4StM8Mv3wP9WAjVbnXMs7tnuiux4mKY+GA2oAuTxpCX/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749242972; c=relaxed/simple;
	bh=k+rgBHT3IKtG9SdxrVm1xh8ublFOIKTabgSn0+Rogmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvT+qFL1/MociGJiSI/nrJzceL1sKlpko2kyqdLEcScw6Lh+K+A5cEDwBNBq/m52Q4Yz+dma8q0D6CUz750FlMdo4JHxwQlkHZM4udFlSkDackGNDw7P7T15zfyh4wsjOvsJUBVaJORwzmnZLZNf5sPm54P3KmA+UdBuOeSfVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxGUwuXq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxGUwuXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749242971; x=1780778971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k+rgBHT3IKtG9SdxrVm1xh8ublFOIKTabgSn0+Rogmg=;
  b=kxGUwuXqYky39ae8CH1kXsZiDEV00txpSXAxNQy8nLGb6v3L7YMRc/YS
   k92L3aoognvcN/d3cOYZvUeHZnIBMHw3wZpgxTJyEsi/Lsr7dubdveiK1
   k8ibjewmQJwD3lDJWxelZjqRI92HN563xKfZ9hP634eRGvm2HNu/pzqYd
   sbxoerN388M666506M/A+keeWGKWIZI0LDqXzIsuzCyu+XkYkyQIesYs+
   PNh+xaz/HwboNRvr04WeEpByaTjJHU520QNUPBBd1AxTP63904eowJ4xV
   TDOyfAWDhNyRslhMIPtK/VA4LofGv/xV+paQUzrYZQvSDqYvWK3Be7TPh
   g==;
X-CSE-ConnectionGUID: EliCPVFcQvSix7d1eVJyYw==
X-CSE-MsgGUID: TYkAtXM3Sfujsh2qHP5Qog==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="50633294"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="50633294"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 13:49:27 -0700
X-CSE-ConnectionGUID: bahPe7NVQderLBi58Mt46Q==
X-CSE-MsgGUID: QTjW0Q0vRk68XyZrvKbatQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="146892418"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Jun 2025 13:49:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNe0B-0005GH-33;
	Fri, 06 Jun 2025 20:49:23 +0000
Date: Sat, 7 Jun 2025 04:48:45 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] tracing: Fix regression of filter waiting a long time on
 RCU synchronization
Message-ID: <202506070406.BQGH3VyM-lkp@intel.com>
References: <20250605161701.35f7989a@gandalf.local.home>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605161701.35f7989a@gandalf.local.home>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Fix-regression-of-filter-waiting-a-long-time-on-RCU-synchronization/20250606-041722
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20250605161701.35f7989a%40gandalf.local.home
patch subject: [PATCH] tracing: Fix regression of filter waiting a long time on RCU synchronization
config: i386-randconfig-061-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070406.BQGH3VyM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070406.BQGH3VyM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506070406.BQGH3VyM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace_events_filter.c:1441:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1441:30: sparse:     expected struct event_filter *filter
   kernel/trace/trace_events_filter.c:1441:30: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events_filter.c:1457:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1457:35: sparse:     expected struct event_filter *filter
   kernel/trace/trace_events_filter.c:1457:35: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events_filter.c:1253:20: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct event_filter * @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1253:20: sparse:     expected struct event_filter *
   kernel/trace/trace_events_filter.c:1253:20: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events_filter.c:1323:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1323:34: sparse:     expected struct event_filter *filter
   kernel/trace/trace_events_filter.c:1323:34: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events_filter.c:1253:20: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct event_filter * @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1253:20: sparse:     expected struct event_filter *
   kernel/trace/trace_events_filter.c:1253:20: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events_filter.c:1253:20: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct event_filter * @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1253:20: sparse:     expected struct event_filter *
   kernel/trace/trace_events_filter.c:1253:20: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events_filter.c:1253:20: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct event_filter * @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1253:20: sparse:     expected struct event_filter *
   kernel/trace/trace_events_filter.c:1253:20: sparse:     got struct event_filter [noderef] __rcu *filter

vim +1441 kernel/trace/trace_events_filter.c

  1411	
  1412	static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
  1413						  struct trace_array *tr,
  1414						  struct event_filter *filter)
  1415	{
  1416		struct trace_event_file *file;
  1417		struct filter_head *head;
  1418		struct filter_list *item;
  1419	
  1420		head = kmalloc(sizeof(*head), GFP_KERNEL);
  1421		if (!head)
  1422			goto free_now;
  1423	
  1424		INIT_LIST_HEAD(&head->list);
  1425	
  1426		item = kmalloc(sizeof(*item), GFP_KERNEL);
  1427		if (!item) {
  1428			kfree(head);
  1429			goto free_now;
  1430		}
  1431	
  1432		item->filter = filter;
  1433		list_add_tail(&item->list, &head->list);
  1434	
  1435		list_for_each_entry(file, &tr->events, list) {
  1436			if (file->system != dir)
  1437				continue;
  1438			item = kmalloc(sizeof(*item), GFP_KERNEL);
  1439			if (!item)
  1440				goto free_now;
> 1441			item->filter = file->filter;
  1442			list_add_tail(&item->list, &head->list);
  1443			file->filter = NULL;
  1444		}
  1445	
  1446		delay_free_filter(head);
  1447		return;
  1448	 free_now:
  1449		tracepoint_synchronize_unregister();
  1450	
  1451		if (head)
  1452			free_filter_list(&head->rcu);
  1453	
  1454		list_for_each_entry(file, &tr->events, list) {
  1455			if (file->system != dir || !file->filter)
  1456				continue;
  1457			__free_filter(file->filter);
  1458		}
  1459		__free_filter(filter);
  1460	}
  1461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
