Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41F1275844
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 07:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911355; cv=none; b=ug3GMlcnzHF7ypkmAAR7KJPQ8uNBjeitQ/dkCfE+6tNvUNjzqGHGafOG8UnkKsjo+x5YbkTxrVao6vSJV8KsRxyP0tXZFFZRNdYijNPJyxub8uX/KTjEXbOSFJaFupUFJxc3FjJHcB5vrbEmVgLlLSLzH8QiiRt45Ftdz6nXf60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911355; c=relaxed/simple;
	bh=EtawlUruBdUHlysK1hAPr5nGQ2xpDGC4LBWC+3JcPQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KN9kL4F2uBLXqlMsVxHjHt9QUGrWHZCp4hw3YktdNlmqcVhNACMf9DvnDNlSlVINmK83aU9KgV3Xy2zLFz12kUnwBwgX/l2Bf7hvPmSXprdnT05Xoy0nl1i+Elg8OjMJD9Kf6TGj670hGFFoZnRc0zHWRSC+oRJgMa4TT49Vjdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mX2ZqwHc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mX2ZqwHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745911353; x=1777447353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EtawlUruBdUHlysK1hAPr5nGQ2xpDGC4LBWC+3JcPQU=;
  b=mX2ZqwHcHJ6ZzkAwW7ZAF5UckyxoqNQ/6jCpJYDAptN4Xr9EmPqURn1z
   W+WUajHsMtQ7tPOnkKZIxJsNVLdSbuVfGSz41ZONrLsmyZc7NAXRp+3re
   Cy3SuNZvHQibbNsYfLZ0riBsXwBXCKYMaVjGSe+xsELcqm0jmE5OtHiPN
   jAyhjJEOWRq6wxEW4iCzI0aJhQv4VDWSgoQmIZknN31G/5sYRoLtN8ncV
   S/6EpgqKRlD9sLbmASBgNvwzrp2HK8ZjQvxvWCzAefaj3JfTbZmtjh+pr
   YUJGHSHeiY6h+oswiXAj2rmSCTQaIa36wY2MAjxZqGjUQEFOAWh/pVqyO
   Q==;
X-CSE-ConnectionGUID: 133wdsq0RxO4+ZCb8cQ4Jw==
X-CSE-MsgGUID: q6eb+fMoRmi9B3+8YR2qJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="72899221"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="72899221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:22:32 -0700
X-CSE-ConnectionGUID: QE9+Pq2NRYqllWo1lDlXaQ==
X-CSE-MsgGUID: XThqpkxwTrmkDqZGT/5RxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="164692517"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Apr 2025 00:22:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9fIS-0000Xg-13;
	Tue, 29 Apr 2025 07:22:28 +0000
Date: Tue, 29 Apr 2025 15:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 4/47] kernel/irq/irqdesc.c:328:40: warning:
 statement with no effect
Message-ID: <202504291559.SkNZqPVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   9e1e6415c0b340394bdae9e10d3b0a403b3123d5
commit: 7723e58c0055c0138b4e1726df06bc832530fe4b [4/47] genirq/irqdesc: Switch to lock guards
config: riscv-randconfig-001-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291559.SkNZqPVS-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291559.SkNZqPVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291559.SkNZqPVS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from kernel/irq/irqdesc.c:10:
   kernel/irq/irqdesc.c: In function 'actions_show':
   include/linux/cleanup.h:259:17: error: too few arguments to function 'class_raw_spinlock_irq_constructor'
     259 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:334:14: note: in expansion of macro 'CLASS'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   kernel/irq/irqdesc.c:328:9: note: in expansion of macro 'scoped_guard'
     328 |         scoped_guard(raw_spinlock_irq)(&desc->lock) {
         |         ^~~~~~~~~~~~
   include/linux/cleanup.h:391:33: note: declared here
     391 | static inline class_##_name##_t class_##_name##_constructor(_type *l)   \
         |                                 ^~~~~~
   include/linux/cleanup.h:410:1: note: in expansion of macro '__DEFINE_LOCK_GUARD_1'
     410 | __DEFINE_LOCK_GUARD_1(_name, _type, _lock)
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:545:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     545 | DEFINE_LOCK_GUARD_1(raw_spinlock_irq, raw_spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
>> kernel/irq/irqdesc.c:328:40: warning: statement with no effect [-Wunused-value]
     328 |         scoped_guard(raw_spinlock_irq)(&desc->lock) {
         |                                       ~^~~~~~~~~~~~
   kernel/irq/irqdesc.c:328:52: error: expected ';' before '{' token
     328 |         scoped_guard(raw_spinlock_irq)(&desc->lock) {
         |                                                    ^~
         |                                                    ;
>> kernel/irq/irqdesc.c:326:15: warning: unused variable 'p' [-Wunused-variable]
     326 |         char *p = "";
         |               ^
>> kernel/irq/irqdesc.c:324:27: warning: unused variable 'action' [-Wunused-variable]
     324 |         struct irqaction *action;
         |                           ^~~~~~


vim +328 kernel/irq/irqdesc.c

   320	
   321	static ssize_t actions_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
   322	{
   323		struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
 > 324		struct irqaction *action;
   325		ssize_t ret = 0;
 > 326		char *p = "";
   327	
 > 328		scoped_guard(raw_spinlock_irq)(&desc->lock) {
   329			for_each_action_of_desc(desc, action) {
   330				ret += sysfs_emit_at(buf, ret, "%s%s", p, action->name);
   331				p = ",";
   332			}
   333		}
   334	
   335		if (ret)
   336			ret += sysfs_emit_at(buf, ret, "\n");
   337		return ret;
   338	}
   339	IRQ_ATTR_RO(actions);
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
