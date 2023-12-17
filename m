Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ED51845
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 06:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0Ol5jeS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702795413; x=1734331413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4GxWNurx5FTUpGKZeXX5ZCg3/lBSqevbnaDB3IsAcy8=;
  b=h0Ol5jeSrvQ5pgg2CLRJNVbM6Sf5MMllxZVvVBo1/RA5hNSbAUr6XlcA
   Qbzj4eeqXDd4mk6CsmNxZ4PdZBlD8YF0ldxetSdHU8CYO//SurEzOx+Mf
   krOwpuS7LVDTl5R9PZ2JK4IqL5bTGmDUScrHFtY6Kn6rZkA19syBIj8Uo
   370YJCLV8E2sauK+z3Eb3WJganBiN7EOD90WWKPEX5d5skw1SP7srJ3HZ
   U4p7RPODW2/VGjlHB6iPx3NackvNJuKAlKKXundjZpAUYv2y/YjPW1VbI
   iVMlvlPfme/26abNu+NhXr8GuCpx2H26iPajYmF24NQxGMiTFv/1KzeP7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="459729252"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="459729252"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 22:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="841123461"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="841123461"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Dec 2023 22:43:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEks5-0002lA-1a;
	Sun, 17 Dec 2023 06:43:29 +0000
Date: Sun, 17 Dec 2023 14:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 22/50] drivers/base/power/runtime.c:287:9:
 error: implicit declaration of function 'list_for_each_entry_rcu'; did you
 mean 'list_for_each_entry_from'?
Message-ID: <202312171412.DLDwIdLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: e7caeebe946875edba9000d1168cac3b0d9d8d21 [22/50] pid: Split out pid_types.h
config: i386-randconfig-012-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171412.DLDwIdLE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171412.DLDwIdLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171412.DLDwIdLE-lkp@intel.com/

Note: the bcachefs/header_cleanup HEAD 7288b19e061b7aa3f46f685e9944af128f10ffd5 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/base/power/runtime.c: In function 'rpm_get_suppliers':
>> drivers/base/power/runtime.c:287:9: error: implicit declaration of function 'list_for_each_entry_rcu'; did you mean 'list_for_each_entry_from'? [-Werror=implicit-function-declaration]
     287 |         list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         list_for_each_entry_from
>> drivers/base/power/runtime.c:287:62: error: 'c_node' undeclared (first use in this function); did you mean 'node'?
     287 |         list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
         |                                                              ^~~~~~
         |                                                              node
   drivers/base/power/runtime.c:287:62: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/base/power/runtime.c:288:63: error: expected ';' before '{' token
     288 |                                 device_links_read_lock_held()) {
         |                                                               ^~
         |                                                               ;
   drivers/base/power/runtime.c:303:1: warning: no return statement in function returning non-void [-Wreturn-type]
     303 | }
         | ^
   drivers/base/power/runtime.c: In function '__rpm_put_suppliers':
   drivers/base/power/runtime.c:330:62: error: 'c_node' undeclared (first use in this function); did you mean 'node'?
     330 |         list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
         |                                                              ^~~~~~
         |                                                              node
   drivers/base/power/runtime.c:331:63: error: expected ';' before '{' token
     331 |                                 device_links_read_lock_held()) {
         |                                                               ^~
         |                                                               ;
   drivers/base/power/runtime.c: In function 'rpm_suspend_suppliers':
   drivers/base/power/runtime.c:348:62: error: 'c_node' undeclared (first use in this function); did you mean 'node'?
     348 |         list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
         |                                                              ^~~~~~
         |                                                              node
>> drivers/base/power/runtime.c:349:63: error: expected ';' before 'pm_request_idle'
     349 |                                 device_links_read_lock_held())
         |                                                               ^
         |                                                               ;
     350 |                 pm_request_idle(link->supplier);
         |                 ~~~~~~~~~~~~~~~                                
   drivers/base/power/runtime.c: In function 'pm_runtime_get_suppliers':
   drivers/base/power/runtime.c:1780:62: error: 'c_node' undeclared (first use in this function); did you mean 'node'?
    1780 |         list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
         |                                                              ^~~~~~
         |                                                              node
>> drivers/base/power/runtime.c:1781:63: error: expected ';' before 'if'
    1781 |                                 device_links_read_lock_held())
         |                                                               ^
         |                                                               ;
    1782 |                 if (link->flags & DL_FLAG_PM_RUNTIME) {
         |                 ~~                                             
   drivers/base/power/runtime.c:1776:13: warning: variable 'idx' set but not used [-Wunused-but-set-variable]
    1776 |         int idx;
         |             ^~~
   drivers/base/power/runtime.c: In function 'pm_runtime_put_suppliers':
   drivers/base/power/runtime.c:1801:62: error: 'c_node' undeclared (first use in this function); did you mean 'node'?
    1801 |         list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
         |                                                              ^~~~~~
         |                                                              node
   drivers/base/power/runtime.c:1802:63: error: expected ';' before 'if'
    1802 |                                 device_links_read_lock_held())
         |                                                               ^
         |                                                               ;
    1803 |                 if (link->supplier_preactivated) {
         |                 ~~                                             
   drivers/base/power/runtime.c:1797:13: warning: variable 'idx' set but not used [-Wunused-but-set-variable]
    1797 |         int idx;
         |             ^~~
   cc1: some warnings being treated as errors
--
   In file included from ipc/ipc_sysctl.c:17:
   ipc/util.h: In function 'ipc_update_pid':
>> ipc/util.h:188:24: error: implicit declaration of function 'get_pid'; did you mean 'set_p4d'? [-Werror=implicit-function-declaration]
     188 |                 *pos = get_pid(pid);
         |                        ^~~~~~~
         |                        set_p4d
   ipc/util.h:188:22: warning: assignment to 'struct pid *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     188 |                 *pos = get_pid(pid);
         |                      ^
>> ipc/util.h:189:17: error: implicit declaration of function 'put_pid' [-Werror=implicit-function-declaration]
     189 |                 put_pid(old);
         |                 ^~~~~~~
   cc1: some warnings being treated as errors


vim +287 drivers/base/power/runtime.c

1bfee5bc86fdaec Alan Stern              2010-09-25  282  
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  283  static int rpm_get_suppliers(struct device *dev)
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  284  {
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  285  	struct device_link *link;
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  286  
c2fa1e1bfa5b745 Joel Fernandes (Google  2019-07-16 @287) 	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
c2fa1e1bfa5b745 Joel Fernandes (Google  2019-07-16 @288) 				device_links_read_lock_held()) {
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  289  		int retval;
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  290  
d12544fb2aa9944 Xiang Chen              2020-09-22  291  		if (!(link->flags & DL_FLAG_PM_RUNTIME))
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  292  			continue;
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  293  
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  294  		retval = pm_runtime_get_sync(link->supplier);
31eb7431805493e Rafael J. Wysocki       2017-12-01  295  		/* Ignore suppliers with disabled runtime PM. */
31eb7431805493e Rafael J. Wysocki       2017-12-01  296  		if (retval < 0 && retval != -EACCES) {
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  297  			pm_runtime_put_noidle(link->supplier);
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  298  			return retval;
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  299  		}
e2f3cd831a280fc Rafael J. Wysocki       2019-02-01  300  		refcount_inc(&link->rpm_active);
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  301  	}
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  302  	return 0;
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  303  }
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  304  
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  305  /**
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  306   * pm_runtime_release_supplier - Drop references to device link's supplier.
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  307   * @link: Target device link.
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  308   *
07358194badf73e Rafael J. Wysocki       2022-06-27  309   * Drop all runtime PM references associated with @link to its supplier device.
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  310   */
07358194badf73e Rafael J. Wysocki       2022-06-27  311  void pm_runtime_release_supplier(struct device_link *link)
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  312  {
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  313  	struct device *supplier = link->supplier;
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  314  
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  315  	/*
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  316  	 * The additional power.usage_count check is a safety net in case
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  317  	 * the rpm_active refcount becomes saturated, in which case
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  318  	 * refcount_dec_not_one() would return true forever, but it is not
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  319  	 * strictly necessary.
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  320  	 */
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  321  	while (refcount_dec_not_one(&link->rpm_active) &&
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  322  	       atomic_read(&supplier->power.usage_count) > 0)
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  323  		pm_runtime_put_noidle(supplier);
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  324  }
d1579e61192e0e6 Rafael J. Wysocki       2021-12-10  325  
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  326  static void __rpm_put_suppliers(struct device *dev, bool try_to_suspend)
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  327  {
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  328  	struct device_link *link;
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  329  
c2fa1e1bfa5b745 Joel Fernandes (Google  2019-07-16  330) 	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
07358194badf73e Rafael J. Wysocki       2022-06-27 @331  				device_links_read_lock_held()) {
07358194badf73e Rafael J. Wysocki       2022-06-27  332  		pm_runtime_release_supplier(link);
07358194badf73e Rafael J. Wysocki       2022-06-27  333  		if (try_to_suspend)
07358194badf73e Rafael J. Wysocki       2022-06-27  334  			pm_request_idle(link->supplier);
07358194badf73e Rafael J. Wysocki       2022-06-27  335  	}
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  336  }
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  337  
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  338  static void rpm_put_suppliers(struct device *dev)
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  339  {
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  340  	__rpm_put_suppliers(dev, true);
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  341  }
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  342  
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  343  static void rpm_suspend_suppliers(struct device *dev)
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  344  {
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  345  	struct device_link *link;
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  346  	int idx = device_links_read_lock();
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  347  
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  348  	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
5244f5e2d801259 Rafael J. Wysocki       2021-03-19 @349  				device_links_read_lock_held())
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  350  		pm_request_idle(link->supplier);
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  351  
5244f5e2d801259 Rafael J. Wysocki       2021-03-19  352  	device_links_read_unlock(idx);
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  353  }
21d5c57b3726166 Rafael J. Wysocki       2016-10-30  354  

:::::: The code at line 287 was first introduced by commit
:::::: c2fa1e1bfa5b74558854a70b8afd797d43eb2743 driver/core: Convert to use built-in RCU list checking

:::::: TO: Joel Fernandes (Google) <joel@joelfernandes.org>
:::::: CC: Paul E. McKenney <paulmck@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
