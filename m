Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2473C1DDA24
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 03:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754538103; cv=none; b=g7OGKenhJ+5PpOOEFCOEK0QJW30oTBCsJfpGTG35KWDuxN62YC6k8m6ZiFIfmOqwSc/naZQUH7/sQT/6FZ858e/a8qB6NS0Lpn8rUueTjRp8MLJbT/hjvXkHXTchALiWuyPFEdMm/uOKhym3LkWCzKfshYD9RBCjDGzUuP3f8vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754538103; c=relaxed/simple;
	bh=v1hFfqhqROGn9Eg10149YWgxUjnopAmvcIQa5uqWF/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o1lnDZauH1x43pfjhESnwkSzOfcbJS7SRB5Ca0EIy6D4xNRK85MVFSzYICPJm1IKgW+Vsm9emV+m1dUD6IwOd7eLUjObMeiWZW0j8Z0jVD+rzyLOkVe/SYa6x5iugbx6sErv48E6wwlvu/hajk5uZ0Ycg2BSLI3dfvufTDESWBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUaHfsbi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUaHfsbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754538100; x=1786074100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v1hFfqhqROGn9Eg10149YWgxUjnopAmvcIQa5uqWF/s=;
  b=lUaHfsbizS/onBIaQiQZPknkXQ9HgpqALhTPKp1A1A1lP+LlClPQab4/
   /0SUph1R0d7sKiApkQwjPbj4KY6cswbrV+fosB9OFp7OoZQ7DEzLRVYj7
   hzNv8Bjd1l2Xq/cTo4ez4yGSnCW9d2etpjoxGNdpb2R+cm1EPnm4/SD5u
   Hdq2vS7lgHO7At0KGDqUEWgDqz2t0e2tJmARvfeZ42oSvFElXSj0TnFfU
   Da/Z0oN2vOU1jwTAzP+btmFRqJ17W709NzaNhFH+tj7AkaDuDwPTbVf1V
   zhkdHpMwWwgTjvE1dvUNuNhOBS6xZ5/CcrJSwUt1v0zUjysvrg9d6d4NO
   w==;
X-CSE-ConnectionGUID: xXxkIuKcQ42xiSQK1+99pQ==
X-CSE-MsgGUID: Q51W1E0bRKu2ZCMVeqORyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56078394"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56078394"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 20:41:39 -0700
X-CSE-ConnectionGUID: FDhPrqDaTS6krikl1quJyw==
X-CSE-MsgGUID: mmMa1YYeQ0SfAd5/4tGUVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165313944"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 06 Aug 2025 20:41:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujrVY-0002LC-2M;
	Thu, 07 Aug 2025 03:41:36 +0000
Date: Thu, 7 Aug 2025 11:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 49/49] mm/unevictable.c:160:6:
 warning: no previous prototype for 'del_unevict_task'
Message-ID: <202508071153.1FhT613H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   0872cd4963f422978277f1ee2ee457abfae503ec
commit: 9fccd3992b49b1773fb24a20db0102fc49590248 [49/49] anolis: mm: unevictable: adjust three key functions
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250807/202508071153.1FhT613H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071153.1FhT613H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071153.1FhT613H-lkp@intel.com/

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
