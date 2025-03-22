Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA9D2C80
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 04:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742617571; cv=none; b=Wk6U3EZFq1bn8+FW7LIEHLBlAzzwUkom2q88U7qXrXSZAhA0GwKiX4Vh2MNX1sGt0FRNqMCnYU0Q5xI/vOaG6bZvRsu4RoeHkKUERXR3I0PtkKIhM6fMolV82yAho+V0EZrRPa4YyszzRbbHl6bJlECFhhl1imMmjai2vYpzgN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742617571; c=relaxed/simple;
	bh=XmTrMB7lQ2k6tMMwT2kJuwjw0xL4o+6secgs4zmdqoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2WUEdS3V42iT7hx7tQ1kIYGsRcUcnWKaY3lRGzRX+yZEQaz5GCb5HbsfF+9Db6R8KVryeeKYw88/rCBe8K0RR0o+XdTYzd2DGMeHQsHfNgTLOeutCGB7ODzkj3F4nHbXJI+2CpyFc5gMydtIrUuGujNsZI2RYoPk2SIRY7OJ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JhCccVGO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JhCccVGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742617568; x=1774153568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XmTrMB7lQ2k6tMMwT2kJuwjw0xL4o+6secgs4zmdqoU=;
  b=JhCccVGOnB3aiKZ83BJphdUfERae8QQKSNrhTQ82ajDEv6r7cxMb/R9M
   2tjZmvMjHfSWGJthK87Rh42O95CHDZr0d2+QJGYIWMvmMlb8oEE2U8hOs
   Mq+OSH9mp+z2CXxjlJ0TcE35Mdm0o162kw36e4gcja2eL0Ii27P7SfJRb
   3zjvLtTanTQSUAfAdSmfw5ciBy3RhCuoPI8B1nnHu6Vgp1gnUiMVZUTaC
   OzkEbmN9G1UUXgxe7xXV9pMqFCNwnWyF7mg/NSuZdx1NHRa5i3gvuZ1c0
   O2XRQKn5qLO77oRlT+3o02MDtHJP2BPE815lRRpB8B7GOzpCdAanonRo2
   g==;
X-CSE-ConnectionGUID: P0yX0l3wTziOMguIQyKIJg==
X-CSE-MsgGUID: YjV0ZFapSAmFLl06b0u/IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43769927"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="43769927"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 21:26:07 -0700
X-CSE-ConnectionGUID: 3Mc6q5XWTNSWXghpcJZsbQ==
X-CSE-MsgGUID: EkgwLECqT5SoqH2efZq1qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="154466369"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Mar 2025 21:26:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvqQt-0001vN-1u;
	Sat, 22 Mar 2025 04:26:03 +0000
Date: Sat, 22 Mar 2025 12:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 23/23] mm/unevictable.c:160:6:
 warning: no previous prototype for 'del_unevict_task'
Message-ID: <202503221253.6RqFjOeb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   9d36b4378df3cc927440d10047334d1fc9d4ff69
commit: ab529700975d02849891ec86b73465f443bc885d [23/23] anolis: mm: unevictable: adjust three key functions
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250322/202503221253.6RqFjOeb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503221253.6RqFjOeb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221253.6RqFjOeb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/unevictable.c:160:6: warning: no previous prototype for 'del_unevict_task' [-Wmissing-prototypes]
     160 | void del_unevict_task(struct task_struct *tsk)
         |      ^~~~~~~~~~~~~~~~


vim +/del_unevict_task +160 mm/unevictable.c

   159	
 > 160	void del_unevict_task(struct task_struct *tsk)
   161	{
   162		struct evict_pid_entry *result;
   163	
   164		if (!tsk) {
   165			struct evict_pid_entry *pid_entry, *tmp;
   166	
   167			mutex_lock(&pid_mutex);
   168			list_for_each_entry_safe(pid_entry, tmp, &pid_list, list) {
   169				rcu_read_lock();
   170				tsk = find_task_by_pid_ns(pid_entry->rootpid,
   171						&init_pid_ns);
   172				rcu_read_unlock();
   173				if (!tsk) {
   174					list_del(&pid_entry->list);
   175					__remove_entry(pid_entry);
   176					kfree(pid_entry);
   177				}
   178			}
   179			mutex_unlock(&pid_mutex);
   180			return;
   181		}
   182	
   183		mutex_lock(&pid_mutex);
   184		result = lookup_unevict_entry(tsk);
   185		if (result) {
   186			list_del(&result->list);
   187			__remove_entry(result);
   188			mutex_unlock(&pid_mutex);
   189			__evict_pid(result);
   190			kfree(result);
   191		} else
   192			mutex_unlock(&pid_mutex);
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
