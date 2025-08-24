Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C0F25A2B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035040; cv=none; b=KGizeYsa4HHuyZQI6/JZDA3mnRCwLpuEIKlzQkcA3WO/JiQP2t3eTWG+/nh3ltxJ1wNNLhm3B3nchL6fVa2gZGMLRbfKFpgUVCy67eZnhqMsCcJBXYvMaUJd5Vn0TwyAi3BRpjPFmuf87C0Xy7ZvzAQ3TVNaOLPNh8BQQC4rA6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035040; c=relaxed/simple;
	bh=1aEJCK0yUiqykbrmpxilDt/OkbV8w0KToDfcCpQki1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EhilbYMxihZrojYFCCEkXH3fBlRTncdtoDjYFcuswfI11rMK3ACIyCHBdvFr7YWB2XRVLO/ZLim+VMBbhtZRuZK0HeC9olkRH8mRExXWjGqBYTRVydut9C1gGMPlzKj30zi+rIbzMpYY7ZQid4ogNaOO9KqcLa3Hc5u+MBZGNdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dN4jtlHI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dN4jtlHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756035039; x=1787571039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1aEJCK0yUiqykbrmpxilDt/OkbV8w0KToDfcCpQki1M=;
  b=dN4jtlHIaLdPgQwy1rP0AXhDLYz6M+MunOu35foTpI3jJoyXByIOrolp
   sil46T0UYNDHI5S6qm6V8MxPTDZ0+OnZMDWpguYPYkghJZM6WzaYOmeOQ
   ZB/gIc88W32i8WyImA+ubT+EW5AnPbGgVk189yyUgvp2uUobyDriI91n8
   efV+68MUUfHhief0WyQpPlpy5mx7i1J9Wv5moFC3IxfplvNlCiAyv9d/8
   xvGRwXALR8huCMgfC6YbQ4kBL+J8iv9UsF9KaVFTJjH0X6Nr7gv4tJwol
   qsslbcDPz+GZpoDtR69TbiFcMFHbnzD+b/qLCAKJnMELqtItrAYImwQaS
   w==;
X-CSE-ConnectionGUID: hd1syF2XRMybw+0R+81JgQ==
X-CSE-MsgGUID: AxLlPiGdTlCm+X7G8KTt8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62100879"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62100879"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 04:30:36 -0700
X-CSE-ConnectionGUID: q2aZVZKxQpObeczXJHYicw==
X-CSE-MsgGUID: 9nv/XMsfQiWXCLodnG5AuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200011087"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Aug 2025 04:30:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq8vH-000Mxt-1s;
	Sun, 24 Aug 2025 11:30:14 +0000
Date: Sun, 24 Aug 2025 19:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-GNR-perf-uncore-ANBZ24140 0/2]
 mm/unevictable.c:156:6: warning: no previous prototype for function
 'del_unevict_task'
Message-ID: <202508241929.KMxf8XZo-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-GNR-perf-uncore-ANBZ24140
head:   5b97140220e2f9196fa5de48f6be468691f8b43b
commit: bba8483e73c9dae0b5c67f8143dc8f922a07580b [0/2] anolis: mm: unevictable: adjust three key functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250824/202508241929.KMxf8XZo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241929.KMxf8XZo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241929.KMxf8XZo-lkp@intel.com/

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
