Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3C1AD32
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 03:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707105075; cv=none; b=qdZ/MQ820R4RKNZYEc41AO2+ygAzFkUzatgO4jjbI25I9U2DNMH6/RmROvokaLKIQypfbz0+9p1OV+zvUCY7bzfNuxui4RmfUzODufJYCDnE9oW4yWUDwML4+/xrPkL7ae4Q0qKAamBpRYBmgZ2rawzEiend7lNc5lWLTnYbCdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707105075; c=relaxed/simple;
	bh=3JnmSjx2Ar6tsZ4zC8JW0TsroxoTzhBNqXOGnyaX/tM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hoi9gdqkEKnPyljd+HawBSbGHKyvJxZLolYNVjM5LnyQLUw+qd38b1CxiFBh7hEsMfhnl96hQSw/JwMKo1pCVhnEPHIK5IFSlQzygDcT55aOX23xzoDndj38YLXahUHEPZalKfchBB6cclq4xP9RIufw7fZV5A5pnzl6EqEcz9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2DD0nuo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2DD0nuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707105072; x=1738641072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3JnmSjx2Ar6tsZ4zC8JW0TsroxoTzhBNqXOGnyaX/tM=;
  b=R2DD0nuoILmVdfXwJjn7wN+VcCumTWq6+iRlFHr6/MmmTfejziQVd8/p
   6X8x7S7qtH7E5UeBbwzi/zRM7vshuhqwztK5Hs0qOY2sXBjLtBY7IP5/i
   GfvOvxw8s6S/cLvzZOwU21KN5+CkJB27IMnaWMHYfwKtip9SDnhBPbE4H
   44pnJrUz/FTTxHW8QxlrXa6CdN7Y3HNH7gdyq0e1+A0rwmCJDJ5Y3uh9v
   EIRnQkcRFW7XIRTcgqXZHJ9IKzWQf96zz830zNm00YR4jAxNLD8nyQ//P
   SiiAYH0+NTe04lc30aMdg7E2KWCet+EoD8CvYX7f+kDweXoy3/RNFjssr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="593991"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="593991"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 19:51:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5230821"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Feb 2024 19:51:12 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWq0i-00007Y-1b;
	Mon, 05 Feb 2024 03:51:08 +0000
Date: Mon, 5 Feb 2024 11:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>
Subject: [tj-wq:for-6.9-bh-conversions 25/30] kernel/workqueue.c:6798:39:
 warning: passing argument 1 of 'subsys_virtual_register' discards 'const'
 qualifier from pointer target type
Message-ID: <202402051108.eqfecqfn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.9-bh-conversions
head:   ae9075ec8b89e3a7581d525954c3b29267d56937
commit: d412ace11144aa2bf692c7cf9778351efc15c827 [25/30] workqueue: make wq_subsys const
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240205/202402051108.eqfecqfn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051108.eqfecqfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051108.eqfecqfn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/workqueue.c: In function 'wq_sysfs_init':
>> kernel/workqueue.c:6798:39: warning: passing argument 1 of 'subsys_virtual_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    6798 |         err = subsys_virtual_register(&wq_subsys, NULL);
         |                                       ^~~~~~~~~~
   In file included from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/workqueue.c:36:
   include/linux/device.h:77:46: note: expected 'struct bus_type *' but argument is of type 'const struct bus_type *'
      77 | int subsys_virtual_register(struct bus_type *subsys,
         |                             ~~~~~~~~~~~~~~~~~^~~~~~


vim +6798 kernel/workqueue.c

b05a79280b346e Frederic Weisbecker 2015-04-27  6792  
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  6793  static int __init wq_sysfs_init(void)
2d3854a37e8b76 Rusty Russell       2008-11-05  6794  {
686f669780276d Greg Kroah-Hartman  2023-03-13  6795  	struct device *dev_root;
b05a79280b346e Frederic Weisbecker 2015-04-27  6796  	int err;
b05a79280b346e Frederic Weisbecker 2015-04-27  6797  
b05a79280b346e Frederic Weisbecker 2015-04-27 @6798  	err = subsys_virtual_register(&wq_subsys, NULL);
b05a79280b346e Frederic Weisbecker 2015-04-27  6799  	if (err)
b05a79280b346e Frederic Weisbecker 2015-04-27  6800  		return err;
b05a79280b346e Frederic Weisbecker 2015-04-27  6801  
686f669780276d Greg Kroah-Hartman  2023-03-13  6802  	dev_root = bus_get_dev_root(&wq_subsys);
686f669780276d Greg Kroah-Hartman  2023-03-13  6803  	if (dev_root) {
fe28f631fa941f Waiman Long         2023-10-25  6804  		struct device_attribute *attr;
fe28f631fa941f Waiman Long         2023-10-25  6805  
fe28f631fa941f Waiman Long         2023-10-25  6806  		for (attr = wq_sysfs_cpumask_attrs; attr->attr.name; attr++) {
fe28f631fa941f Waiman Long         2023-10-25  6807  			err = device_create_file(dev_root, attr);
fe28f631fa941f Waiman Long         2023-10-25  6808  			if (err)
fe28f631fa941f Waiman Long         2023-10-25  6809  				break;
fe28f631fa941f Waiman Long         2023-10-25  6810  		}
686f669780276d Greg Kroah-Hartman  2023-03-13  6811  		put_device(dev_root);
686f669780276d Greg Kroah-Hartman  2023-03-13  6812  	}
686f669780276d Greg Kroah-Hartman  2023-03-13  6813  	return err;
2d3854a37e8b76 Rusty Russell       2008-11-05  6814  }
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  6815  core_initcall(wq_sysfs_init);
2d3854a37e8b76 Rusty Russell       2008-11-05  6816  

:::::: The code at line 6798 was first introduced by commit
:::::: b05a79280b346eb24ddb73b39988398015291075 workqueue: Create low-level unbound workqueues cpumask

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
