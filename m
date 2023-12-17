Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A310F2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 04:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QerlxQRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702786460; x=1734322460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T5vyBU8qfKr8oeCN83gz96A1fnUI4vGmEGWxvzdkb3A=;
  b=QerlxQRCl0nfQpwSJms/8vSJyEClmg02glLB4iyCq+Tr0U/NaIfX/Qi/
   P7hDr27vee1lhztKQZougkCijnpOuJmiCvBs6FEovXjIBlLfLm9yokQsA
   +n1GdCFkxw1kOnknf3qLj43KbnIpM/yXtnSDBE3B3adls5WA1LfzJ5JiR
   ynAA8BjbW1Q8yX9NwmAMqfXVVW8dJXQ7ejS1aV866l7fInkzBQJANTsA5
   jwoyOH9+v6aB41KaCeKv7SkQZYJXzOTqBE3WVhHub5sccxMSPtedLbs8V
   LcbXUHpF4nx+Ec/rcgsdkB2funr2UQ3Q3ox/7fsQ30LTLks16VSA5bsOp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="399232469"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="399232469"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 20:14:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="809414272"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="809414272"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2023 20:14:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEiXg-0002cO-1O;
	Sun, 17 Dec 2023 04:14:16 +0000
Date: Sun, 17 Dec 2023 12:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 22/50] ipc/util.h:188:22: warning:
 assignment to 'struct pid *' from 'int' makes pointer from integer without a
 cast
Message-ID: <202312171237.2L4hv8iT-lkp@intel.com>
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
config: i386-randconfig-012-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171237.2L4hv8iT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171237.2L4hv8iT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171237.2L4hv8iT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ipc/ipc_sysctl.c:17:
   ipc/util.h: In function 'ipc_update_pid':
   ipc/util.h:188:24: error: implicit declaration of function 'get_pid'; did you mean 'set_p4d'? [-Werror=implicit-function-declaration]
     188 |                 *pos = get_pid(pid);
         |                        ^~~~~~~
         |                        set_p4d
>> ipc/util.h:188:22: warning: assignment to 'struct pid *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     188 |                 *pos = get_pid(pid);
         |                      ^
   ipc/util.h:189:17: error: implicit declaration of function 'put_pid' [-Werror=implicit-function-declaration]
     189 |                 put_pid(old);
         |                 ^~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/base/power/runtime.c: In function 'rpm_get_suppliers':
   drivers/base/power/runtime.c:287:9: error: implicit declaration of function 'list_for_each_entry_rcu'; did you mean 'list_for_each_entry_from'? [-Werror=implicit-function-declaration]
     287 |         list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         list_for_each_entry_from
   drivers/base/power/runtime.c:287:62: error: 'c_node' undeclared (first use in this function); did you mean 'node'?
     287 |         list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
         |                                                              ^~~~~~
         |                                                              node
   drivers/base/power/runtime.c:287:62: note: each undeclared identifier is reported only once for each function it appears in
   drivers/base/power/runtime.c:288:63: error: expected ';' before '{' token
     288 |                                 device_links_read_lock_held()) {
         |                                                               ^~
         |                                                               ;
>> drivers/base/power/runtime.c:303:1: warning: no return statement in function returning non-void [-Wreturn-type]
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
   drivers/base/power/runtime.c:349:63: error: expected ';' before 'pm_request_idle'
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
   drivers/base/power/runtime.c:1781:63: error: expected ';' before 'if'
    1781 |                                 device_links_read_lock_held())
         |                                                               ^
         |                                                               ;
    1782 |                 if (link->flags & DL_FLAG_PM_RUNTIME) {
         |                 ~~                                             
>> drivers/base/power/runtime.c:1776:13: warning: variable 'idx' set but not used [-Wunused-but-set-variable]
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


vim +188 ipc/util.h

^1da177e4c3f415 Linus Torvalds    2005-04-16  176  
^1da177e4c3f415 Linus Torvalds    2005-04-16  177  void kernel_to_ipc64_perm(struct kern_ipc_perm *in, struct ipc64_perm *out);
^1da177e4c3f415 Linus Torvalds    2005-04-16  178  void ipc64_perm_to_ipc_perm(struct ipc64_perm *in, struct ipc_perm *out);
1efdb69b0bb41de Eric W. Biederman 2012-02-07  179  int ipc_update_perm(struct ipc64_perm *in, struct kern_ipc_perm *out);
4241c1a30407856 Manfred Spraul    2018-08-21  180  struct kern_ipc_perm *ipcctl_obtain_check(struct ipc_namespace *ns,
444d0f621b64716 Davidlohr Bueso   2013-04-30  181  					     struct ipc_ids *ids, int id, int cmd,
444d0f621b64716 Davidlohr Bueso   2013-04-30  182  					     struct ipc64_perm *perm, int extra_perm);
^1da177e4c3f415 Linus Torvalds    2005-04-16  183  
03f1fc09180b345 Eric W. Biederman 2018-03-23  184  static inline void ipc_update_pid(struct pid **pos, struct pid *pid)
03f1fc09180b345 Eric W. Biederman 2018-03-23  185  {
03f1fc09180b345 Eric W. Biederman 2018-03-23  186  	struct pid *old = *pos;
03f1fc09180b345 Eric W. Biederman 2018-03-23  187  	if (old != pid) {
03f1fc09180b345 Eric W. Biederman 2018-03-23 @188  		*pos = get_pid(pid);
03f1fc09180b345 Eric W. Biederman 2018-03-23  189  		put_pid(old);
03f1fc09180b345 Eric W. Biederman 2018-03-23  190  	}
03f1fc09180b345 Eric W. Biederman 2018-03-23  191  }
03f1fc09180b345 Eric W. Biederman 2018-03-23  192  

:::::: The code at line 188 was first introduced by commit
:::::: 03f1fc09180b345582889a344b012d069b3a6dbe ipc/util: Helpers for making the sysvipc operations pid namespace aware

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
