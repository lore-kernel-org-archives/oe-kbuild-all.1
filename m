Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862B226FD86
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 23:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753313077; cv=none; b=RqBSN6lBh2mP3Dtv6TCZIn0bBa7tgdj+0wvHUWFgLY9GjwRuBPjnNdK35nfLM5eWho9fHVIPLhgh/6vsDHoTky7qLUBpqtSMpFNE3ZQx1W+BjdzzHMCXQRV4Fjyannzr+9dlmQ4doaTIgddehvmKp/gUpwJsLzYXb3t3pyZWROE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753313077; c=relaxed/simple;
	bh=wBJKN6QNIzh3BMFlX6D297eACVhiAXDmlVih5z0i+Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WlEDkVJaWBIDy/ytvz910v37jG6kD+co+duupbUJdvMEgfudVZNQL8vU4fcdn+N5dxHZlvqHmI31nha9uXwZN4yWKInmxEPAzO823wMFU0wPyTEiL8BFrop4gwiLekRypdwn2gJlmdduHx2QH6AZj3/Cy+QKB5cv+I8chmYpHyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAUJX3BP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAUJX3BP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753313074; x=1784849074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wBJKN6QNIzh3BMFlX6D297eACVhiAXDmlVih5z0i+Ds=;
  b=dAUJX3BPuZmHEXt+zqG5rtAvtTnj+VYZxswYIJQXNn5P/H6IQ1mEXPSA
   qdbHxfK5dTqKWY7/WwjyCJAnEeLSJzAT0IfzVNeVTne8y3W3BR6z7IsbK
   cHFr/l1xHSLNygHWa4douURCFmOICWJXC83oZ0nRv9NnfN2tF2MxZO8BM
   4kHCze1KGQ2ux5TTpuZDQXoXuDEo9t+z53ysIDttifw6xeSCgdJxy5Kmn
   CTqeaSlVNLtRY+jsAstj4HVHi6M53MUJkadl6QCcRFHKkDgqPQ9KFBQDo
   nOrqGdB5ybudKWPrUogaCgk5bEM5CBQzyGNZciG3XATIwBTxkq8OJl/Xs
   Q==;
X-CSE-ConnectionGUID: ApMuCmixQLOZcxEE1N7T3Q==
X-CSE-MsgGUID: mdQZeMVsTxq641ysZlfTwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="54826525"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="54826525"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 16:24:34 -0700
X-CSE-ConnectionGUID: BHAPnpVTR5ylv/Nyzp3MfA==
X-CSE-MsgGUID: OprZo4WBQE6Z0mkLCsh2MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="159091376"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jul 2025 16:24:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueip4-000Jsd-1y;
	Wed, 23 Jul 2025 23:24:30 +0000
Date: Thu, 24 Jul 2025 07:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/9] mm/unevictable.c:156:6: warning:
 no previous prototype for function 'del_unevict_task'
Message-ID: <202507240705.Xta4b4F2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   71a37bdc5fbed5d912815ad0c6fe9eb17136b81f
commit: bba8483e73c9dae0b5c67f8143dc8f922a07580b [0/9] anolis: mm: unevictable: adjust three key functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250724/202507240705.Xta4b4F2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507240705.Xta4b4F2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507240705.Xta4b4F2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/unevictable.c:156:6: warning: no previous prototype for function 'del_unevict_task' [-Wmissing-prototypes]
     156 | void del_unevict_task(struct task_struct *tsk)
         |      ^
   mm/unevictable.c:156:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     156 | void del_unevict_task(struct task_struct *tsk)
         | ^
         | static 
   1 warning generated.


vim +/del_unevict_task +156 mm/unevictable.c

   155	
 > 156	void del_unevict_task(struct task_struct *tsk)
   157	{
   158		struct evict_pid_entry *result;
   159	
   160		if (!tsk) {
   161			struct evict_pid_entry *pid_entry, *tmp;
   162	
   163			mutex_lock(&pid_mutex);
   164			list_for_each_entry_safe(pid_entry, tmp, &pid_list, list) {
   165				rcu_read_lock();
   166				tsk = find_task_by_pid_ns(pid_entry->rootpid,
   167						&init_pid_ns);
   168				rcu_read_unlock();
   169				if (!tsk) {
   170					list_del(&pid_entry->list);
   171					__remove_entry(pid_entry);
   172					kfree(pid_entry);
   173				}
   174			}
   175			mutex_unlock(&pid_mutex);
   176			return;
   177		}
   178	
   179		mutex_lock(&pid_mutex);
   180		result = lookup_unevict_entry(tsk);
   181		if (result) {
   182			list_del(&result->list);
   183			__remove_entry(result);
   184			mutex_unlock(&pid_mutex);
   185			__evict_pid(result);
   186			kfree(result);
   187		} else
   188			mutex_unlock(&pid_mutex);
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
