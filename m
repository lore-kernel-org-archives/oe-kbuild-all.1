Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E722DFF2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 16:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032049; cv=none; b=Ddqp6h3Y00P6IfBJeiADfJ2qFy7IXFMdRq6uAbfDtXh08dj94kDpvtfnqIqol1G+tPrnpEFIyZjaEsSl0nqxaA5AHE9Ph2exY57S3BmlgwHyJ7Mqqz2ssels2Rv0ltN4aOYjDMdzQP9YN8RzBS0PgKIjDLpnBRwIn7MQoGbl/Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032049; c=relaxed/simple;
	bh=o7lFUEEbtKltPcDr8c1kuKUsOKs0vmWOxwcQYtKm078=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3RkiSjJvwow7mzgCym5qWoXntmWz1uaAWqY1579gE8RA5PiqZAFVKw5ai3WXjJIAvudE1OCvN5KQwnpNzyh296fpVGBnWkXh3JJjab0nDb99d7/e0Ib1Gvb4G3iyRBN/+FfYR2OZSR6H5o7ug+161F7yr649z4GN2KxcE4kNy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jzkg81ha; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jzkg81ha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739032047; x=1770568047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o7lFUEEbtKltPcDr8c1kuKUsOKs0vmWOxwcQYtKm078=;
  b=Jzkg81haO2Ftlz54s4YPcnJgxVNe6ssVVj1NBN6kn6SNSI8A/EqQL7BA
   x00qVBwKKnQi3svS5cvrv9t3zwARYx+unA5ZA2Rnr7tLGEsV6SabNub/X
   AnqndQfqKVSaJdF4ZIwT0cNyTNjNNXAI3GYeu+edJ81iaoyXI0YdMgjyQ
   q8KT38pXkCm0/I4u3otJTQ6HbRhvBefi7rsZLr/tLh3+n9vqQTw5FpOvJ
   WL/GqLNKZA1fdnIINnjhozYmivslLZ2sG2tPiIFALz4UCJL5AKDssAcYM
   k9olc6lgELgP2XsY40AwuZAbf/EYqd/5jRg0RYVSwt5Te57X9GdkRF9ed
   w==;
X-CSE-ConnectionGUID: G4EmZl07QS2LZd+fKrj4Ag==
X-CSE-MsgGUID: T/OSpV6DT8a/JWQCs+ZdBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="62136685"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="62136685"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:27:25 -0800
X-CSE-ConnectionGUID: rQmrgsyMT5eo1VO1opY6ng==
X-CSE-MsgGUID: vvVLqTgvQu2GrCEf5Pfn6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111628197"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2025 08:27:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgnft-0010Kr-1q;
	Sat, 08 Feb 2025 16:27:21 +0000
Date: Sun, 9 Feb 2025 00:26:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 04/11] rv: Add option for nested monitors and include
 sched
Message-ID: <202502090006.mpaCJjXx-lkp@intel.com>
References: <20250206080952.98478-5-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206080952.98478-5-gmonaco@redhat.com>

Hi Gabriele,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 5c8c229261f14159b54b9a32f12e5fa89d88b905]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/tracing-Fix-DECLARE_TRACE_CONDITION/20250206-161349
base:   5c8c229261f14159b54b9a32f12e5fa89d88b905
patch link:    https://lore.kernel.org/r/20250206080952.98478-5-gmonaco%40redhat.com
patch subject: [RFC PATCH 04/11] rv: Add option for nested monitors and include sched
config: i386-buildonly-randconfig-003-20250207 (https://download.01.org/0day-ci/archive/20250209/202502090006.mpaCJjXx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090006.mpaCJjXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090006.mpaCJjXx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/rv/rv.c:777: warning: Function parameter or struct member 'parent' not described in 'rv_register_monitor'


vim +777 kernel/trace/rv/rv.c

102227b970a152 Daniel Bristot de Oliveira 2022-07-29  769  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  770  /**
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  771   * rv_register_monitor - register a rv monitor.
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  772   * @monitor:    The rv_monitor to be registered.
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  773   *
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  774   * Returns 0 if successful, error otherwise.
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  775   */
cd664010e822b7 Gabriele Monaco            2025-02-06  776  int rv_register_monitor(struct rv_monitor *monitor, struct rv_monitor *parent)
102227b970a152 Daniel Bristot de Oliveira 2022-07-29 @777  {
cd664010e822b7 Gabriele Monaco            2025-02-06  778  	struct rv_monitor_def *r, *p = NULL;
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  779  	int retval = 0;
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  780  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  781  	if (strlen(monitor->name) >= MAX_RV_MONITOR_NAME_SIZE) {
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  782  		pr_info("Monitor %s has a name longer than %d\n", monitor->name,
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  783  			MAX_RV_MONITOR_NAME_SIZE);
cd664010e822b7 Gabriele Monaco            2025-02-06  784  		return -EINVAL;
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  785  	}
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  786  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  787  	mutex_lock(&rv_interface_lock);
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  788  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  789  	list_for_each_entry(r, &rv_monitors_list, list) {
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  790  		if (strcmp(monitor->name, r->monitor->name) == 0) {
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  791  			pr_info("Monitor %s is already registered\n", monitor->name);
cd664010e822b7 Gabriele Monaco            2025-02-06  792  			retval = -EEXIST;
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  793  			goto out_unlock;
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  794  		}
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  795  	}
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  796  
cd664010e822b7 Gabriele Monaco            2025-02-06  797  	if (parent) {
cd664010e822b7 Gabriele Monaco            2025-02-06  798  		list_for_each_entry(r, &rv_monitors_list, list) {
cd664010e822b7 Gabriele Monaco            2025-02-06  799  			if (strcmp(parent->name, r->monitor->name) == 0) {
cd664010e822b7 Gabriele Monaco            2025-02-06  800  				p = r;
cd664010e822b7 Gabriele Monaco            2025-02-06  801  				break;
cd664010e822b7 Gabriele Monaco            2025-02-06  802  			}
cd664010e822b7 Gabriele Monaco            2025-02-06  803  		}
cd664010e822b7 Gabriele Monaco            2025-02-06  804  	}
cd664010e822b7 Gabriele Monaco            2025-02-06  805  
cd664010e822b7 Gabriele Monaco            2025-02-06  806  	if (p && rv_is_nested_monitor(p)) {
cd664010e822b7 Gabriele Monaco            2025-02-06  807  		pr_info("Parent monitor %s is already nested, cannot nest further\n",
cd664010e822b7 Gabriele Monaco            2025-02-06  808  			parent->name);
cd664010e822b7 Gabriele Monaco            2025-02-06  809  		return -EINVAL;
cd664010e822b7 Gabriele Monaco            2025-02-06  810  	}
cd664010e822b7 Gabriele Monaco            2025-02-06  811  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  812  	r = kzalloc(sizeof(struct rv_monitor_def), GFP_KERNEL);
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  813  	if (!r) {
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  814  		retval = -ENOMEM;
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  815  		goto out_unlock;
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  816  	}
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  817  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  818  	r->monitor = monitor;
cd664010e822b7 Gabriele Monaco            2025-02-06  819  	r->parent = parent;
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  820  
cd664010e822b7 Gabriele Monaco            2025-02-06  821  	retval = create_monitor_dir(r, p);
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  822  	if (retval) {
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  823  		kfree(r);
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  824  		goto out_unlock;
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  825  	}
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  826  
cd664010e822b7 Gabriele Monaco            2025-02-06  827  	/* keep children close to the parent for easier visualisation */
cd664010e822b7 Gabriele Monaco            2025-02-06  828  	if (p)
cd664010e822b7 Gabriele Monaco            2025-02-06  829  		list_add(&r->list, &p->list);
cd664010e822b7 Gabriele Monaco            2025-02-06  830  	else
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  831  		list_add_tail(&r->list, &rv_monitors_list);
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  832  
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  833  out_unlock:
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  834  	mutex_unlock(&rv_interface_lock);
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  835  	return retval;
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  836  }
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  837  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
